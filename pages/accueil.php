<?php
$cat = new CategorieDB($cnx);
$liste = $cat->getAllCategories();
$nbr_cat = count($liste);

?>


<div class="album py-5 bg-body-tertiary">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <?php
            for($i=0; $i < $nbr_cat; $i++){
            ?>
            <div class="col">
                <div class="card shadow-sm">
                    <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                    <div class="card-body">
                        <p class="card-text">
                            <?php
                            print $liste[$i]->nom_categorie;
                            ?>
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <a href="index_.php?id_categorie=<?php print $liste[$i]->id_categorie;?>&page=produits_categorie.php" type="button" class="btn btn-sm btn-outline-secondary" >View</a>
                                <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                            </div>
                      </div>
                    </div>

                </div>
            </div>
            <?php
            }
            ?>
        </div>
    </div>
</div>