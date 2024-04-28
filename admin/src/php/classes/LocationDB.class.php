<?php

class LocationDB extends Location
{
    private $_db;
    private $_attributs = array();

    public function __construct($db)
    {
        $this->_db = $db;
    }


    public function addLocation($dateDebut, $dateFin, $prix, $modePaiement, $quantite, $idEquipement, $idClient)
    {
        $query = 'INSERT INTO location (dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (:dateDebut, :dateFin, :prix, :modePaiement, :quantite, :idEquipement, :idClient)';
        $result = $this->_db->prepare($query);
        $result->bindValue(':dateDebut', $dateDebut, PDO::PARAM_STR);
        $result->bindValue(':dateFin', $dateFin, PDO::PARAM_STR);
        $result->bindValue(':prix', $prix, PDO::PARAM_INT);
        $result->bindValue(':modePaiement', $modePaiement, PDO::PARAM_STR);
        $result->bindValue(':quantite', $quantite, PDO::PARAM_INT);
        $result->bindValue(':idEquipement', $idEquipement, PDO::PARAM_INT);
        $result->bindValue(':idClient', $idClient, PDO::PARAM_INT);
        $result->execute();
        $result->closeCursor();
        return ['success' => 'ok'];
    }


}