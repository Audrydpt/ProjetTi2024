<?php

$clientDB = new ClientDB($cnx);

if (isset($_POST['emailRegister'], $_POST['passwordRegister'])) {
    extract($_POST, EXTR_OVERWRITE);

    if (!empty($nom) && !empty($prenom) && !empty($telephone) && !empty($passwordRegister)) {
        $code = uniqid();
        $clientDB->addClient($_POST);
        header("Location: index_.php?page=connexion.php");
        exit();
    }
}
?>

<form id="inscriptionForm" action="index_.php?page=inscription.php" method="post">
    <div class="mb-3">
        <label for="emailRegister" class="form-label">Email</label>
        <input type="email" class="form-control" id="emailRegister" name="emailRegister" required>
    </div>
    <div class="mb-3">
        <label for="passwordRegister" class="form-label">Mot de passe</label>
        <input type="password" class="form-control" id="passwordRegister" name="passwordRegister" required>
    </div>
    <button type="button" class="btn btn-primary" id="showAdditionalFieldsBtn">Continuer</button>
    <div id="additionalFields" style="display: none;">
        <div class="mb-3">
            <label for="nom" class="form-label">Nom</label>
            <input type="text" class="form-control" id="nom" name="nom" required>
        </div>
        <div class="mb-3">
            <label for="prenom" class="form-label">Prénom</label>
            <input type="text" class="form-control" id="prenom" name="prenom" required>
        </div>
        <div class="mb-3">
            <label for="telephone" class="form-label">Téléphone</label>
            <input type="text" class="form-control" id="telephone" name="telephone" required>
        </div>
        <button type="submit" class="btn btn-primary" name="submit_register">Créer un compte</button>
    </div>
</form>

