<?php
class CategorieDB extends Categorie
{
    private $_bd;

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }

    public function getAllCategories()
    {
        $query = "SELECT * FROM categorie";
        try {
            $resultset = $this->_bd->query($query);
            $categories = $resultset->fetchAll(PDO::FETCH_ASSOC);
            return $categories;
        } catch (PDOException $e) {
            print "Echec de la requête " . $e->getMessage();
        }
    }


    public function getCategoryById($id_categ)
    {
        $query = "SELECT * FROM categorie WHERE id_categ = :id_categ";
        try {
            $resultset = $this->_bd->prepare($query);
            $resultset->bindValue(':id_categ', $id_categ);
            $resultset->execute();
            $categoryData = $resultset->fetch(PDO::FETCH_ASSOC);
            if ($categoryData) {
                return new Categorie($categoryData);
            } else {
                return false;
            }
        } catch (PDOException $e) {
            print "Echec de la requête : " . $e->getMessage();
        }
    }
}
