<?php
require_once 'admin/src/php/classes/EquipementDB.class.php';

// Vérifier si l'identifiant de la catégorie est passé en paramètre
if (isset($_GET['id_categ'])) {
    $id_categ = $_GET['id_categ'];

    // Créer une instance de la classe EquipementDB
    $equipementDB = new EquipementDB($cnx);

    // Récupérer les équipements par catégorie
    $equipements = $equipementDB->getEquipementsByCategorie($id_categ);

    // Afficher les équipements
    if ($equipements) {
        foreach ($equipements as $equipement) {
            ?>
            <div class="card">
                <img src="admin/public/images/<?php echo $equipement->image; ?>" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title"><?php echo $equipement->nome; ?></h5>
                    <p class="card-text"><?php echo $equipement->descriptione; ?></p>
                    <p class="card-text"><strong>Tarif:</strong> <?php echo $equipement->tarife; ?> €</p>
                    <p class="card-text"><strong>Stock restant:</strong> <?php echo $equipement->stock; ?></p>
                </div>
            </div>
            <?php
        }
    } else {
        echo "Aucun équipement trouvé pour cette catégorie.";
    }
} else {
    // Rediriger vers une page d'erreur ou une autre page appropriée
    header('Location: page404.php');
    exit();
}
?>

