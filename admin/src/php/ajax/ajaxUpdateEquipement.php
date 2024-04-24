<?php
header('Content-Type: application/json');
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Equipement.class.php';
require '../classes/EquipementDB.class.php';
$cnx = Connexion::getInstance($dsn,$user,$password);

$eq = new EquipementDB($cnx);
try {
    $data[] = $eq->updateEquipement($_GET['id'],$_GET['name'],$_GET['valeur']);
    print json_encode(['success' => true]);
} catch (Exception $e) {
    print json_encode(['error' => $e->getMessage()]);
}