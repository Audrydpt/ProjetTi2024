<?php
// Vérifier si la session client n'est pas définie
if (!isset($_SESSION['client'])) {
    // Rediriger vers la page de connexion
    header("Location: ../index_.php?page=connexion.php");
    exit; // Arrêter l'exécution du script après la redirection
}
?>

<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-body-tertiary">
    <div class="col-md-6 p-lg-5 mx-auto my-5">
        <h1 class="display-3 fw-bold">Location Dupont</h1>
        <h3 class="fw-normal text-muted mb-3">Réserver dès maintenant !</h3>
        <div class="d-flex gap-3 justify-content-center lead fw-normal">
            <a class="icon-link" href="index_.php?page=reserver.php">Réserver</a>
        </div>
    </div>
    <div class="product-device shadow-sm d-none d-md-block"></div>
    <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
</div>
