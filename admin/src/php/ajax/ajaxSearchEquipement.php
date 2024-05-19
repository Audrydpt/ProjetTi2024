<?php
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Equipement.class.php';
require '../classes/EquipementDB.class.php';

$cnx = Connexion::getInstance($dsn,$user,$password);
$eq = new EquipementDB($cnx);

$searchTerm = $_GET['term'];
$equipements = $eq->getEquipementsByNom($searchTerm);

$data = array();
foreach ($equipements as $equipement) {
    $data[] = $equipement->nome;
}

echo json_encode($data);