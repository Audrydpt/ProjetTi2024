<?php

class EquipementDB extends Equipement
{
    private $_database;

    public function __construct($connection)
    {
        $this->_database = $connection;
    }

    public function getEquipements()
    {
        $query = "SELECT * FROM equipement";
        $resultSet = $this->_database->query($query);
        $data = $resultSet->fetchAll();
        $equipementsArray = array();
        foreach ($data as $row) {
            $equipementsArray[] = new Equipement($row);
        }
        return $equipementsArray;
    }

    public function getEquipementsByCategorie($id_categorie)
    {
        $query = "SELECT * FROM equipement WHERE id_categorie = :id_categorie";
        $resultSet = $this->_database->prepare($query);
        $resultSet->bindValue(':id_categorie', $id_categorie, PDO::PARAM_INT);
        $resultSet->execute();
        $data = $resultSet->fetchAll();
        $equipementsArray = array();
        foreach ($data as $row) {
            $equipementsArray[] = new Equipement($row);
        }
        return $equipementsArray;
    }

    public function getEquipement($id)
    {
        $query = "SELECT * FROM equipement WHERE id_equipement = :id";
        $resultSet = $this->_database->prepare($query);
        $resultSet->bindValue(':id', $id, PDO::PARAM_INT);
        $resultSet->execute();
        $data = $resultSet->fetch();
        if ($data) {
            return new Equipement($data);
        } else {
            return false;
        }
    }

    public function addEquipement(Equipement $equipement)
    {
        $query = "INSERT INTO equipement (nom, description, tarif, image, stock, id_categorie) VALUES (:nom, :description, :tarif, :image, :stock, :id_categorie)";
        $resultSet = $this->_database->prepare($query);
        $resultSet->bindValue(':nom', $equipement->getNom(), PDO::PARAM_STR);
        $resultSet->bindValue(':description', $equipement->getDescription(), PDO::PARAM_STR);
        $resultSet->bindValue(':tarif', $equipement->getTarif(), PDO::PARAM_INT);
        $resultSet->bindValue(':image', $equipement->getImage(), PDO::PARAM_STR);
        $resultSet->bindValue(':stock', $equipement->getStock(), PDO::PARAM_INT);
        $resultSet->bindValue(':id_categorie', $equipement->getIdCategorie(), PDO::PARAM_INT);
        $resultSet->execute();
    }

    public function updateEquipement(Equipement $equipement)
    {
        $query = "UPDATE equipement SET nom = :nom, description = :description, tarif = :tarif, image = :image, stock = :stock, id_categorie = :id_categorie WHERE id_equipement = :id";
        $resultSet = $this->_database->prepare($query);
        $resultSet->bindValue(':nom', $equipement->getNom(), PDO::PARAM_STR);
        $resultSet->bindValue(':description', $equipement->getDescription(), PDO::PARAM_STR);
        $resultSet->bindValue(':tarif', $equipement->getTarif(), PDO::PARAM_INT);
        $resultSet->bindValue(':image', $equipement->getImage(), PDO::PARAM_STR);
        $resultSet->bindValue(':stock', $equipement->getStock(), PDO::PARAM_INT);
        $resultSet->bindValue(':id_categorie', $equipement->getIdCategorie(), PDO::PARAM_INT);
        $resultSet->bindValue(':id', $equipement->getIdEquipement(), PDO::PARAM_INT);
        $resultSet->execute();
    }

    public function deleteEquipement($id)
    {
        $query = "DELETE FROM equipement WHERE id_equipement = :id";
        $resultSet = $this->_database->prepare($query);
        $resultSet->bindValue(':id', $id, PDO::PARAM_INT);
        $resultSet->execute();
    }
}
