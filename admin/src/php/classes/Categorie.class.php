<?php
class Categorie
{
    public $id_categ;
    public $nom_categ;

    public function __construct($data)
    {
        $this->hydrate($data);
    }

    public function hydrate($data)
    {
        foreach ($data as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (method_exists($this, $method)) {
                $this->$method($value);
            }
        }
    }

    // Getters et setters
    public function getIdCateg()
    {
        return $this->id_categ;
    }

    public function setIdCateg($id_categ)
    {
        $this->id_categ = $id_categ;
    }

    public function getNomCateg()
    {
        return $this->nom_categ;
    }

    public function setNomCateg($nom_categ)
    {
        $this->nom_categ = $nom_categ;
    }
}
