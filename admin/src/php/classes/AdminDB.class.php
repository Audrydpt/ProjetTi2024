<?php

class AdminDB extends Admin
{

    private $_bd;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }

    public function getAdmin($login,$password)
    {
        $query = "select verifier_admin(:login,:password) as retour"; //retour pour 1 ou 0 retourné
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->bindValue(':login',$login);
            $resultset->bindValue(':password',$password);
            $resultset->execute();
            $retour = $resultset->fetchColumn(0);
            return $retour;
            $this->_bd->commit();
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec de la requête " . $e->getMessage();
        }

    }



}
