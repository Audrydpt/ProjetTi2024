<?php


$EquipementDB = new EquipementDB($cnx);
$equipements = $EquipementDB->getAllEquipements();

$ClientDB = new ClientDB($cnx);
$clients = $ClientDB->getAllClients();

$unitPrices = array();
foreach ($equipements as $equipement) {
    $unitPrices[$equipement->getAttribut('nome')] = $equipement->getAttribut('tarife');
}

?>
<script>
    var unitPrices = <?php echo json_encode($unitPrices); ?>;
</script>

<form id="reservationForm" action="index_.php?page=reserver.php" method="post">
    <div class="mb-3">
        <label for="dateDebut" class="form-label">Date de début</label>
        <input type="date" class="form-control" id="dateDebut" name="dateDebut" required>
    </div>
    <div class="mb-3">
        <label for="dateFin" class="form-label">Date de fin</label>
        <input type="date" class="form-control" id="dateFin" name="dateFin" required>
    </div>

    <div class="mb-3">
        <label for="emailClient" class="form-label">Email client</label>
        <input type="email" class="form-control" id="emailClient" name="emailClient" required>
    </div>
    <div class="mb-3">
        <label for="nomEquipement" class="form-label">Equipement</label>
        <select class="form-control" id="nomEquipement" name="nomEquipement" required>
            <?php foreach ($equipements as $equipement) : ?>
                <option value="<?= $equipement->getAttribut('nome') ?>"><?= $equipement->getAttribut('nome') ?></option>
            <?php endforeach; ?>
        </select>
    </div>

    <div class="mb-3">
        <label for="quantite" class="form-label">Quantité</label>
        <input type="number" class="form-control" id="quantite" name="quantite" required>
    </div>
    <div class="mb-3">
        <label for="modePaiement" class="form-label">Mode de paiement</label>
        <select class="form-select" id="modePaiement" name="modePaiement" required>
            <option value="carte">Carte</option>
            <option value="cheque">Chèque</option>
            <option value="espece">Espèce</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="prix" class="form-label">Prix total (€/j)</label>
        <input type="text" class="form-control" id="prix" name="prix" required>
    </div>
    <button type="submit" class="btn btn-primary" name="submit_reservation">Réserver</button>
</form>