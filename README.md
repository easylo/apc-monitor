# apc-monitor
a web application to see apc status on many server

edit config on apc.conf.php


```php

$Server = array(
    'local' => 'apc_json.php', // for local use only
    'localhost' => 'http://127.0.0.1/apc/apc_json.php', // to get data on remote server
);


```
