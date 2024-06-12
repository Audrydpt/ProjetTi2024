<?php


$categorieDB = new CategorieDB($cnx);

$categories = $categorieDB->getAllCategories();
?>

<div class="container">
    <h1>Liste des catégories</h1>
    <div class="list-group">
        <?php foreach ($categories as $categorie) : ?>
            <a href="index_.php?page=equipements_par_categorie.php&id_categ=<?php echo $categorie['id_categ']; ?>" class="list-group-item list-group-item-action">
                <?php echo $categorie['nom_categ']; ?>
            </a>
        <?php endforeach; ?>
    </div>
</div>

