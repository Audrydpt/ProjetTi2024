<?php
header('Content-Type: application/json');
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Equipement.class.php';
require '../classes/EquipementDB.class.php';
$cnx = Connexion::getInstance($dsn,$user,$password);

$eq = new EquipementDB($cnx);

$existingEquipement = $eq->getEquipementsByNom($_GET['nome']);
if (!empty($existingEquipement)) {
    $data = ['error' => 'Un produit avec ce nom existe déjà.'];
} else {
    $data[] = $eq->addEquipement($_GET['nome'],$_GET['descriptione'],$_GET['tarife'],$_GET['image'],$_GET['stock'],$_GET['id_categorie']);
}

print json_encode($data);


