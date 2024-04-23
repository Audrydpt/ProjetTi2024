<?php
header('Content-Type: application/json');
//chemin d'accès depuis le fichier ajax php
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Equipement.class.php';
require '../classes/EquipementDB.class.php';
$cnx = Connexion::getInstance($dsn,$user,$password);

$eq = new EquipementDB($cnx);
$data[] = $eq->addEquipement($_GET['nome'],$_GET['descriptione'],$_GET['tarife'],$_GET['image'],$_GET['stock'],$_GET['id_categorie']);
print json_encode($data);


