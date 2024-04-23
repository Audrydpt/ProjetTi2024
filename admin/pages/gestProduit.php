<h2>Gestion des produits</h2>
<a href="index_.php?page=ajoutEquipement.php">Nouveau produit</a><br>


<?php
require_once '../src/php/classes/EquipementDB.class.php';

$equipements = new EquipementDB($cnx);
$liste = $equipements->getEquipementsByNom();
//var_dump($liste);
$nbr = count($liste);

if($nbr == 0){
    print "<br>Aucun équipements encodé<br>";
}
else{
    ?>
    <table class="table table-striped">
        <thead>

        <tr>
            <th scope="col">Id</th>
            <th scope="col">Nom</th>
            <th scope="col">Description</th>
            <th scope="col">Tarif</th>
            <th scope="col">Image</th>
            <th scope="col">Stock</th>
            <th scope="col">Id_categorie</th>
            <th scope="col">Supprimer</th>
        </tr>

        </thead>
        <tbody>
        <?php
        for($i=0; $i < $nbr; $i++){
            ?>
            <tr>
                <th><?= $liste[$i]->id_equipement;?></th>
                <td contenteditable="true" id="<?= $liste[$i]->id_equipemnt;?>" name="nom"><?= $liste[$i]->nome;?></td>
                <td contenteditable="true" id="<?= $liste[$i]->id_equipement;?>" name="description"><?= $liste[$i]->descriptione;?></td>
                <td contenteditable="true" id="<?= $liste[$i]->id_equipement;?>" name="tarif"><?= $liste[$i]->tarife;?></td>
                <td contenteditable="true" id="<?= $liste[$i]->id_equipement;?>" name="image"><?= $liste[$i]->image;?></td>
                <td contenteditable="true" id="<?= $liste[$i]->id_equipement;?>" name="stock"><?= $liste[$i]->stock;?></td>
                <td contenteditable="true" id="<?= $liste[$i]->id_equipement;?>" name="id_categorie"><?= $liste[$i]->id_categorie;?></td>
                <td contenteditable="true"><img src="public/images/delete.jpg" alt="Effacer" ></td>
            </tr>
            <?php
        }
        ?>

        </tbody>
    </table>
    <?php
}


