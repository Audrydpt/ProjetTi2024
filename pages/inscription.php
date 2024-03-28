<?php
// Vérifier si le formulaire a été soumis
if(isset($_POST['submit_register'])) {
    // Extraction des données du formulaire
    extract($_POST, EXTR_OVERWRITE);

    // Création d'une instance de la classe ClientDB pour gérer les clients
    $clientDB = new ClientDB($cnx);

    // Vérification de l'existence du client
    $client = $clientDB->getClientByEmail($emailRegister);
    if($client){
        // Affichage d'un message d'erreur si l'email existe déjà
        print "<br>Cet email est déjà utilisé<br>";
        return;
    }else{
        // Création d'un tableau associatif contenant les données du client
        $data = [
            'nom' => $nom,
            'prenom' => $prenom,
            'telephone' => $telephone,
            'email' => $emailRegister,
            'password' => $passwordRegister
        ];

        // Création d'une instance de la classe Client
        $client = new Client($data);

        // Ajout du client à la base de données
        $clientDB->addClient($client);

        // Création de variables de session pour le client
        $_SESSION['client'] = $client;

        // Redirection vers la page d'accueil du client connecté
        ?>
        <meta http-equiv="refresh" content="0;url=index_.php?page=accueilC.php">
        <?php
    }
}
?>

<!-- Formulaire d'inscription -->
<form action="index_.php?page=inscription.php" method="post">
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
    <div class="mb-3">
        <label for="emailRegister" class="form-label">Email</label>
        <input type="email" class="form-control" id="emailRegister" name="emailRegister" required>
    </div>
    <div class="mb-3">
        <label for="passwordRegister" class="form-label">Mot de passe</label>
        <input type="password" class="form-control" id="passwordRegister" name="passwordRegister" required>
    </div>
    <button type="submit" class="btn btn-primary" name="submit_register">Créer un compte</button>
</form>

<!-- Bouton pour afficher le formulaire de connexion -->
<div>
    <a href="index_.php?page=connexion.php" class="btn btn-secondary">Se connecter</a>
</div>
