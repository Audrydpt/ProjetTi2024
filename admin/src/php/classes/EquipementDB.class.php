<?php
require_once 'Equipement.class.php';
require_once 'Client.class.php';

class EquipementDB
{
    private $_database;

    public function __construct($connection)
    {
        $this->_database = $connection;
    }

    public function getEquipementById($id)
    {
        $query = "SELECT * FROM equipement WHERE id_equipement = :id";
        try {
            $resultset = $this->_database->prepare($query);
            $resultset->bindValue(':id', $id);
            $resultset->execute();
            $equipementData = $resultset->fetch(PDO::FETCH_ASSOC);
            if ($equipementData) {
                return new Equipement($equipementData);
            } else {
                return null;
            }
        } catch (PDOException $e) {
            print "Echec de la requête " . $e->getMessage();
        }
    }
    public function getEquipementIdByName($name)
    {
        $query = "SELECT id_equipement FROM equipement WHERE nome = :name";
        try {
            $resultset = $this->_database->prepare($query);
            $resultset->bindValue(':name', $name);
            $resultset->execute();
            $equipementData = $resultset->fetch(PDO::FETCH_ASSOC);
            if ($equipementData) {
                return $equipementData['id_equipement'];
            } else {
                return null;
            }
        } catch (PDOException $e) {
            print "Echec de la requête " . $e->getMessage();
        }
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
    public function getEquipementsByNom($nome)
    {
        $query = "SELECT * FROM equipement WHERE nome = :nom";
        $resultSet = $this->_database->prepare($query);
        $resultSet->bindValue(':nom', $nome, PDO::PARAM_STR);
        $resultSet->execute();
        $data = $resultSet->fetchAll();
        $equipementsArray = array();
        foreach ($data as $row) {
            $equipementsArray[] = new Equipement($row);
        }
        return $equipementsArray;
    }

    public function getAllEquipements()
    {
        $query = "SELECT * FROM equipement";
        $resultSet = $this->_database->prepare($query);
        $resultSet->execute();
        $data = $resultSet->fetchAll();
        $equipementsArray = array();
        foreach ($data as $row) {
            $equipementsArray[] = new Equipement($row);
        }
        return $equipementsArray;
    }
    public function updateEquipement($id, $champ, $valeur)
    {
        $query = "select updateequipement(:id,:champ,:valeur)";
        try {
            $res = $this->_database->prepare($query);
            $res->bindValue(':id', $id);
            $res->bindValue(':champ', $champ);
            $res->bindValue(':valeur', $valeur);
            $res->execute();
            $data = $res->fetch();
            return $data;
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function deleteEquipement($id)
    {
        $query = "select deleteequipement(:id)";
        try {
            $res = $this->_database->prepare($query);
            $res->bindValue(':id', $id, PDO::PARAM_INT);
            $res->execute();
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function addEquipement($nome, $descriptione, $tarife, $image, $stock, $id_categorie)
    {
        $query = "select ajoutequipement(:nome, :descriptione, :tarife, :image, :stock, :id_categorie)";
        try {
            $res = $this->_database->prepare($query);
            $res->bindValue(':nome', $nome);
            $res->bindValue(':descriptione', $descriptione);
            $res->bindValue(':tarife', $tarife);
            $res->bindValue(':image', $image);
            $res->bindValue(':stock', $stock);
            $res->bindValue(':id_categorie', $id_categorie);
            $res->execute();
            $data = $res->fetch();
            return $data;
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }



}

