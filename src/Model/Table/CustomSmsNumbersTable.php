<?php

namespace App\Model\Table;

use Cake\ORM\Table;

class CustomSmsNumbersTable extends Table
{

    public function initialize(array $config)
    {
        $this->primaryKey('custom_sms_number_id');
    }
}