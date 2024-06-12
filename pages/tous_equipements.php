<div class="search-container">
    <input type="text" id="search" placeholder="Rechercher un équipement...">
</div>
<div class="row">
    <?php
    $equipementDB = new EquipementDB($cnx);

    $equipements = $equipementDB->getAllEquipements();

    if ($equipements) {
        foreach ($equipements as $equipement) {
            ?>
            <div class="col-md-4">
                <div class="card">
                    <img src="admin/public/images/<?php echo $equipement->image; ?>" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title equipement-title"><?php echo $equipement->nome; ?></h5>
                        <p class="card-text"><?php echo $equipement->descriptione; ?></p>
                        <p class="card-text"><strong>Tarif:</strong> <?php echo $equipement->tarife; ?> €/j</p>
                        <p class="card-text"><strong>Stock restant:</strong> <?php echo $equipement->stock; ?></p>
                    </div>
                </div>
            </div>
            <?php
        }
    } else {
        echo "Aucun équipement trouvé.";
    }
    ?>
</div>