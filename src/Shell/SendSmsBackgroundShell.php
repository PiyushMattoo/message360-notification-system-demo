<?php

namespace App\Shell;

require_once(ROOT.DS.'vendor'.DS.'autoload.php');

use Cake\Core\Configure;
use Cake\Console\Shell;
//use Cake\ORM\TableRegistry;
//use Cake\Utility\Hash;

class SendSmsBackgroundShell extends Shell
{
    public $tasks = ['M360'];

    public function main()
    {
        try {
            $DEFAULT_URL = 'https://'.Configure::read('Firebase.domain').'/';
            $DEFAULT_TOKEN = Configure::read('Firebase.token');
            $DEFAULT_PATH = '/sms';

            $firebase = new \Firebase\FirebaseLib($DEFAULT_URL, $DEFAULT_TOKEN);

            if( !isset($this->args[0]) ) {
                throw new \Exception('Missing queue ID');
            }

            if( !isset($this->args[1]) ) {
                throw new \Exception('Missing number ID');
            }

            if( !isset($this->args[2]) ) {
                throw new \Exception('Missing country code');
            }

            if( !isset($this->args[3]) ) {
                throw new \Exception('Missing phone number');
            }

            if( !isset($this->args[4]) ) {
                throw new \Exception('Missing message');
            }

            list($queueId, $numberId, $countryCode, $phoneNumber, $message, $count) = $this->args;

            // Set to pending...
            $firebase->set($DEFAULT_PATH.'/'.$queueId.'/numbers/'.$numberId.'/status', 2);

            $messagesArray = $this->breakUpMessage($message);
            $messageCount = count($messagesArray);
            foreach($messagesArray as $subMessage) {
                $response = $this->M360->sendSms($phoneNumber, $subMessage, 1);

                if( $messageCount > 1) {
                    sleep(0.3);
                }
            }
            
            $this->out(json_encode($response));
            if ($response['Message360']['ResponseStatus'] && $response['Message360']['Messages']['Message'][0]['Status'] === 'success') {
                // Set to sent...
                $firebase->set($DEFAULT_PATH.'/'.$queueId.'/numbers/'.$numberId.'/status', 3);
            } else {
                // Set to fail...
                $firebase->set($DEFAULT_PATH.'/'.$queueId.'/numbers/'.$numberId.'/status', 4);
            }
        } catch (\Exception $ex) {
            $this->out($ex->getMessage());
        }
    }

    public function breakUpMessage($message, $numberOfChar = 140)
    {
        $newMessages = wordwrap($message, $numberOfChar, "|||", false);
        $newMessagesArray = explode('|||', $newMessages);

        return $newMessagesArray;
    }
}