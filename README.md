<?php

/**
 * Facebook Webhook handler example
 *
 * @see  https://fb.me/webhooks
 * @author  Tom (https://github.com/tominon)
 */

$mode='subscribe'
$challenge='1158201444'
$verify_token='meatyhamhock'

// Handle verification request
if (isset($_GET['hub_mode']) && $_GET['hub_mode'] === 'subscribe') {
    if ($_GET['hub_verify_token'] === $verifyToken) {
        echo $_GET['hub_challenge'];
        exit;
    }
}

// Validate the integrity and payload and it's origin
$payload = file_get_contents('php://input');
if (isset($_SERVER['HTTP_X_HUB_SIGNATURE']) && hash_equals(explode('=', $_SERVER['HTTP_X_HUB_SIGNATURE'])[1], hash_hmac('sha1', $payload, $appSecret))) {
    // Handle payload
    $data = json_decode($payload, true);
    file_put_contents(time().'-webhook.php', $payload);
    exit;
}

header('HTTP/1.1 500 Internal Server Error');
exit(1);
