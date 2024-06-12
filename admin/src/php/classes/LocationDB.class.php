<?php

class LocationDB
{
    private $_db;

    public function __construct($db)
    {
        $this->_db = $db;
    }


    public function addLocation($dateDebut, $dateFin, $prix, $modePaiement, $quantite, $idEquipement, $idClient)
    {
        $this->_db->beginTransaction();

        try {
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

            $query = 'UPDATE equipement SET stock = stock - :quantite WHERE id_equipement = :idEquipement';
            $result = $this->_db->prepare($query);
            $result->bindValue(':quantite', $quantite, PDO::PARAM_INT);
            $result->bindValue(':idEquipement', $idEquipement, PDO::PARAM_INT);
            $result->execute();

            $this->_db->commit();

            return ['success' => 'ok'];
        } catch (PDOException $e) {
            $this->_db->rollback();

            return ['error' => $e->getMessage()];
        }
    }


}