<?php
$dateDebut = $_GET['dateDebut'];
$dateFin = $_GET['dateFin'];
$emailClient = $_GET['emailClient'];
$nomEquipement = $_GET['nomEquipement'];
$quantite = $_GET['quantite'];
$modePaiement = $_GET['modePaiement'];
$prix = $_GET['prix'];
?>
<meta http-equiv="refresh" content="5;url=index_.php?page=accueil.php" />

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h1>Confirmation de réservation</h1>
                </div>
                <div class="card-body">
                    <p>Date de début: <?= $dateDebut ?></p>
                    <p>Date de fin: <?= $dateFin ?></p>
                    <p>Email du client: <?= $emailClient ?></p>
                    <p>Nom de l'équipement: <?= $nomEquipement ?></p>
                    <p>Quantité: <?= $quantite ?></p>
                    <p>Mode de paiement: <?= $modePaiement ?></p>
                    <p>Prix: <?= $prix ?></p>
                </div>
                <div class="card-footer text-muted">
                    <p>Merci pour votre réservation!</p>
                </div>
            </div>
        </div>
    </div>
</div>

