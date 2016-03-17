# Message360 Notification System Demo

(http://www.message360.com)

## Installation

1. Run `composer update`
2. Make `tmp/` and its sub folder as writeable
3. Make `webroot/files/` as writeable
4. Make `bin/cake` as executable
5. Run this sql on your database `mns-mysql-setup.sql`
6. Get your Message360 AccountSID and Token
7. Setup an account on firebase https://www.firebase.com, then get your firebase URL and token. 

## Configuration

Read and edit `config/app.php` and setup the 'Datasources' and any other
configuration relevant for your application.

Make sure to update the following 

```php
'Datasources' => [
        'default' => [
            'className' => 'Cake\Database\Connection',
            'driver' => 'Cake\Database\Driver\Mysql',
            'persistent' => false,
            'host' => 'xxxx',
            /**
             * CakePHP will use the default DB port based on the driver selected
             * MySQL on MAMP uses port 8889, MAMP users will want to uncomment
             * the following line and set the port accordingly
             */
            //'port' => 'nonstandard_port_number',
            'username' => 'm360_demo',
            'password' => 'm360_demo',
            'database' => 'Message360_Notification_Demo',
            'encoding' => 'utf8',
            'timezone' => 'UTC',
            'cacheMetadata' => true,
            'log' => false,


'Message360' => [
        'accountSid' => 'xxxx', // Your message360 account ID
        'authToken' => 'xxxx', // Your message360 account token
        'fromNumber' => 'xxxx', // Your message360 phone number
        'systemResponseDomain' => 'xxx' // Your server domain
],
'Firebase' => [
    'token' => 'xxxx', // Your firebase token
    'domain' => 'xxxx'
],