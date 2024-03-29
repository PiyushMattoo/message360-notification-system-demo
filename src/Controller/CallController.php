<?php
/**
 * Ytel Emergency Notification System
 *
 * @copyright Ytel, Inc (http://www.ytel.com)
 * @link      http://www.ytel.com
 * @since     0.1
 */

namespace App\Controller;

use Cake\Core\Configure;
use Cake\Utility\Text;
use Cake\Network\Exception\NotFoundException;
use Cake\View\Exception\MissingTemplateException;
use Cake\ORM\TableRegistry;
use Cake\Error\Debugger;

class CallController extends AppController
{

    public function ajaxSendCall()
    {
        try {
            $numberListTable = TableRegistry::get('NumberLists');
            $sendQueueTable = TableRegistry::get('SendQueues');
            $numberTable = TableRegistry::get('Numbers');

            // Check if list exists
            $numberList = $numberListTable->find('all',
                [
                'conditions' => [
                    'number_list_id' => $this->request->data['call']['number_list_id']
                ]
            ]);

            if (!$numberList->count()) {
                throw new \Exception('Cannot locate list.');
            }
            
            $number = $numberTable->find('all', [
                'conditions' => [
                    'number_list_id' => $this->request->data['call']['number_list_id']
                ]
            ]);

            $numberCount = $number->count();
            if( !$numberCount ) {
                throw new \Exception('No numbers in the list');
            }

            $data = [
                'unique_id' => Text::uuid(),
                'type' => 2,
                'number_list_id' => $this->request->data['call']['number_list_id'],
                'status' => 0,
                'message' => isset($this->request->data['call']['message']) ? $this->request->data['call']['message'] : null,
                'audio_id' => isset($this->request->data['call']['audio_id']) ? $this->request->data['call']['audio_id'] : null,
                'request_by' => null,
                'total' => $numberCount,
                'create_datetime' => new \DateTime('now', new \DateTimeZone('UTC'))
            ];
            $sendQueue = $sendQueueTable->newEntity($data);

            $sendQueueTable->save($sendQueue);

            // Hit the cron
            shell_exec(ROOT.DS.'bin'.DS.'cake SendCall '.$sendQueue->send_queue_id.' > /dev/null 2>/dev/null &');

            $response['status'] = 1;
            $response['sendQueueId'] = $sendQueue->send_queue_id;
            $response['numberCount'] = $numberCount;
        } catch (\Exception $ex) {
            $response['status'] = 0;
            $response['message'] = $ex->getMessage();
        }


        $this->set(compact('response'));
        $this->set('_serialize', ['response']);
    }

    public function ajaxResponseCall($uniqueId)
    {
        try {
            $this->loadComponent('M360');

            $DEFAULT_URL = 'https://'.Configure::read('Firebase.domain').'/';
            $DEFAULT_TOKEN = Configure::read('Firebase.token');
            $DEFAULT_PATH = '/call';

            $firebase = new \Firebase\FirebaseLib($DEFAULT_URL, $DEFAULT_TOKEN);

            $sendQueueTable = TableRegistry::get('SendQueues');

            $response['$this->request->data'] = $this->request->data;

            $sendQueue = $sendQueueTable->find()->where([
                'unique_id' => $uniqueId
            ])->contain(['Audios']);

            if( !$sendQueue->count() ) {
                throw new \Exception('Cannot find queue.');
            }

            $queue = $sendQueue->all()->first();

            // Get number id
            $numberId = $firebase->get($DEFAULT_PATH.'/'.$queue->send_queue_id.'/number_match/'.$this->request->data['CallSid']);

//            $response['$numberId'] = $numberId;
//
//            // Pending...
//            $firebase->set($DEFAULT_PATH.'/'.$queue->send_queue_id.'/numbers/'.$numberId.'/call_status', 2);
//
//            // Play audio
//            $playAudioResponse = $this->M360->playAudio($this->request->data['CallSid'], 'https://'.Configure::read('Message360.systemResponseDomain').'/files/'.$queue->audio->server_name);
//
//            $response['audio_url'] = 'https://'.Configure::read('Message360.systemResponseDomain').'/files/'.$queue->audio->server_name;
//
//            // Success
//            if( $playAudioResponse['Message360']['ResponseStatus'] && $playAudioResponse['Message360']['Call'][0]['Status'] == 'In-progress' ) {
//                // Set as played
                $firebase->set($DEFAULT_PATH.'/'.$queue->send_queue_id.'/numbers/'.$numberId.'/call_status', 3);
//            } else {
//                // Set as failure
//                $firebase->set($DEFAULT_PATH.'/'.$queue->send_queue_id.'/numbers/'.$numberId.'/call_status', 4);
//            }

//            $response['q'] = $queue;
//            $response['m360'] = $playAudioResponse;
            if($queue->message) {
                $Say = $queue->message;
            } else {
                $Say = '';
            }

            if($queue->audio) {
                $Play = 'https://'.Configure::read('Message360.systemResponseDomain').'/files/'.$queue->audio->server_name;
            } else {
                $Play = '';
            }
            
            
            $Hangup = '';


            die('<Response><Say>'.$Say.'</Say><Play>'.$Play.'</Play><Hangup /></Response>');

        } catch (\Exception $ex) {
            $response['status'] = 0;
            $response['message'] = $ex->getMessage();
        }


        $this->set(compact('Say', 'Play', 'Hangup'));
        $this->set('_serialize', ['Say', 'Play', 'Hangup']);
    }

    public function ajaxResponseCallFallback($uniqueId)
    {
        try {
            $DEFAULT_URL = 'https://'.Configure::read('Firebase.domain').'/';
            $DEFAULT_TOKEN = Configure::read('Firebase.token');
            $DEFAULT_PATH = '/call';

            $firebase = new \Firebase\FirebaseLib($DEFAULT_URL, $DEFAULT_TOKEN);

            $sendQueueTable = TableRegistry::get('SendQueues');

            $sendQueue = $sendQueueTable->find()->where([
                'unique_id' => $uniqueId
            ])->contain(['Audios']);

            if( !$sendQueue->count() ) {
                throw new Exception('Cannot find queue.');
            }

            $queue = $sendQueue->all()->first();

            // Get number id
            $numberId = $firebase->get($DEFAULT_PATH.'/'.$queue->send_queue_id.'/number_match/'.$this->request->data['CallSid']);

            // Set as Failure
            $firebase->set($DEFAULT_PATH.'/'.$queue->send_queue_id.'/numbers/'.$numberId.'/call_status', 4);

            Debugger::log($this->request->data);

            $response['status'] = 1;
        } catch (\Exception $ex) {
            $response['status'] = 0;
            $response['message'] = $ex->getMessage();
        }


        $this->set(compact('response'));
        $this->set('_serialize', ['response']);
    }

    public function ajaxResponseStatusCallback($uniqueId)
    {
        try {
            $DEFAULT_URL = 'https://'.Configure::read('Firebase.domain').'/';
            $DEFAULT_TOKEN = Configure::read('Firebase.token');
            $DEFAULT_PATH = '/call';

            $firebase = new \Firebase\FirebaseLib($DEFAULT_URL, $DEFAULT_TOKEN);

            $sendQueueTable = TableRegistry::get('SendQueues');

            $sendQueue = $sendQueueTable->find()->where([
                'unique_id' => $uniqueId
            ])->contain(['Audios']);

            if( !$sendQueue->count() ) {
                throw new Exception('Cannot find queue.');
            }

            $queue = $sendQueue->all()->first();

            // Get number id
            $numberId = $firebase->get($DEFAULT_PATH.'/'.$queue->send_queue_id.'/number_match/'.$this->request->data['CallSid']);

            // Set as Success
//            $firebase->set($DEFAULT_PATH.'/'.$queue->send_queue_id.'/numbers/'.$numberId.'/call_status', 1);

            Debugger::log($this->request->data);

            $response['status'] = 1;
        } catch (\Exception $ex) {
            $response['status'] = 0;
            $response['message'] = $ex->getMessage();
        }


        $this->set(compact('response'));
        $this->set('_serialize', ['response']);
    }
}