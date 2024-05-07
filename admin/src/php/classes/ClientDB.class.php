<?php

require_once 'Client.class.php';

class ClientDB
{
    private $_bd;

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }

    public function getClientIdByEmail($email)
    {
        $query = "SELECT id_client FROM client WHERE emailc = :email";
        try {
            $resultset = $this->_bd->prepare($query);
            $resultset->bindValue(':email', $email);
            $resultset->execute();
            $clientData = $resultset->fetch(PDO::FETCH_ASSOC);
            if ($clientData) {
                return $clientData['id_client'];
            } else {
                throw new Exception("pas trouvé avec : $email");

            }
        } catch (PDOException $e) {
            print "Echec de la requête " . $e->getMessage();
        }
    }

    public function getAllClients()
    {
        $query = "SELECT * FROM client";
        try {
            $resultset = $this->_bd->query($query);
            $clients = $resultset->fetchAll();
            $clientsArray = array();
            foreach ($clients as $client) {
                $clientsArray[] = new Client($client);
            }
            return $clientsArray;
        } catch (PDOException $e) {
            print "Echec de la requête " . $e->getMessage();
        }
    }

    public function getClientByEmailAndPassword($email, $password)
    {
        $query = "SELECT * FROM client WHERE emailc = :email AND password = :password";
        try {
            $resultset = $this->_bd->prepare($query);
            $resultset->bindValue(':email', $email);
            $resultset->bindValue(':password', $password);
            $resultset->execute();
            $clientData = $resultset->fetch(PDO::FETCH_ASSOC);
            if ($clientData) {
                return new Client($clientData);
            } else {
                return null;
            }
        } catch (PDOException $e) {
            print "Echec de la requête " . $e->getMessage();
        }
    }


    public function getClientByEmail($email)
    {
        $query = "SELECT * FROM client WHERE emailc = :email";
        try {
            $resultset = $this->_bd->prepare($query);
            $resultset->bindValue(':email', $email);
            $resultset->execute();
            $clientData = $resultset->fetch(PDO::FETCH_ASSOC);
            if ($clientData) {
                return new Client($clientData);
            } else {
                return null;
            }
        } catch (PDOException $e) {
            print "Echec de la requête " . $e->getMessage();
        }
    }

    public function addClient($client)
    {
        // Génération du code client aléatoire
        $code = uniqid();
        $query = "INSERT INTO client (code, nomc, prenomc, telephonec, emailc, password) 
                  VALUES (:code, :nom, :prenom, :telephone, :email, :password)";
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->bindValue(':code', $code);
            $resultset->bindValue(':nom', $client['nom']);
            $resultset->bindValue(':prenom', $client['prenom']);
            $resultset->bindValue(':telephone', $client['telephone']);
            $resultset->bindValue(':email', $client['emailRegister']);
            $resultset->bindValue(':password', $client['passwordRegister']);
            $resultset->execute();
            $this->_bd->commit();
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec de l'inscription du client : " . $e->getMessage();
        }
    }
}
?>
