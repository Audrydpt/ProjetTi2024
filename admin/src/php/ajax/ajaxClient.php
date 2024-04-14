<?php
header('Content-Type: application/json');
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Client.class.php';
require '../classes/ClientDB.class.php';

$cnx = Connexion::getInstance($dsn, $user, $password);

$clientDB = new ClientDB($cnx);

$email = isset($_POST['email']) ? $_POST['email'] : null;

if (!empty($email)) {
    $client = $clientDB->getClientByEmail($email);
    if ($client != null) {
        echo json_encode(["status" => "client_found"]);
    } else {
        echo json_encode(["status" => "client_not_found"]);
    }
}
?>
