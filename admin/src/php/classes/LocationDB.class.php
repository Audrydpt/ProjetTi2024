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
        // Start a new transaction
        $this->_db->beginTransaction();

        try {
            // Insert the new reservation into the location table
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

            // Deduct the rented quantity from the equipment's stock
            $query = 'UPDATE equipement SET stock = stock - :quantite WHERE id_equipement = :idEquipement';
            $result = $this->_db->prepare($query);
            $result->bindValue(':quantite', $quantite, PDO::PARAM_INT);
            $result->bindValue(':idEquipement', $idEquipement, PDO::PARAM_INT);
            $result->execute();

            // Commit the transaction
            $this->_db->commit();

            return ['success' => 'ok'];
        } catch (PDOException $e) {
            // Rollback the transaction in case of an error
            $this->_db->rollback();

            return ['error' => $e->getMessage()];
        }
    }


}