<?php
header('Content-Type: application/json');
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Equipement.class.php';
require '../classes/EquipementDB.class.php';
$cnx = Connexion::getInstance($dsn,$user,$password);

$eq = new EquipementDB($cnx);

// Check if equipment already exists
$existingEquipement = $eq->getEquipementsByNom($_GET['nome']);
if (!empty($existingEquipement)) {
    // If it exists, return an error message
    $data = ['error' => 'Un produit avec ce nom existe déjà.'];
} else {
    // If it doesn't exist, add it
    $data[] = $eq->addEquipement($_GET['nome'],$_GET['descriptione'],$_GET['tarife'],$_GET['image'],$_GET['stock'],$_GET['id_categorie']);
}

print json_encode($data);


