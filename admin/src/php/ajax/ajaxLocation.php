<?php
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/ClientDB.class.php';
require '../classes/EquipementDB.class.php';
require '../classes/LocationDB.class.php';

$cnx = Connexion::getInstance($dsn, $user, $password);

$clientDB = new ClientDB($cnx);
$equipementDB = new EquipementDB($cnx);
$locationDB = new LocationDB($cnx);

$dateDebut = isset($_GET['dateDebut']) ? $_GET['dateDebut'] : null;
$dateFin = isset($_GET['dateFin']) ? $_GET['dateFin'] : null;
$emailClient = isset($_GET['emailClient']) ? $_GET['emailClient'] : null;
$nomEquipement = isset($_GET['nomEquipement']) ? $_GET['nomEquipement'] : null;
$quantite = isset($_GET['quantite']) ? $_GET['quantite'] : null;
$modePaiement = isset($_GET['modePaiement']) ? $_GET['modePaiement'] : null;
$prix = isset($_GET['prix']) ? $_GET['prix'] : null;

if ($dateDebut && $dateFin && $emailClient && $nomEquipement && $quantite && $modePaiement && $prix) {
    $idClient = $clientDB->getClientIdByEmail($emailClient);
    $idEquipement = $equipementDB->getEquipementIdByName($nomEquipement);

    if ($idClient && $idEquipement) {
        // Check if the equipment's stock is sufficient
        $equipement = $equipementDB->getEquipementById($idEquipement);
        if ($equipement->getAttribut('stock') < $quantite) {
            echo json_encode(['error' => 'Insufficient stock']);
        } else {
            $result = $locationDB->addLocation($dateDebut, $dateFin, $prix, $modePaiement, $quantite, $idEquipement, $idClient);
            echo json_encode($result);
        }
    } else {
        echo json_encode(['error' => 'Client or equipment not found']);
    }
} else {
    echo json_encode(['error' => 'Missing parameters']);

}
?>