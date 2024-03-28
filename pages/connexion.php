<?php
if(isset($_POST['submit_login'])) {
    // Extraction des données du formulaire
    extract($_POST, EXTR_OVERWRITE);

    // Création d'une instance de la classe ClientDB pour gérer les clients
    $clientDB = new ClientDB($cnx);

    // Récupération des informations du client à partir de la base de données
    $client = $clientDB->getClientByEmailAndPassword($email, $password);

    // Vérification de l'existence du client
    if($client){
        // Création de variables de session pour le client
        $_SESSION['client'] = $client;

        // Redirection vers la page d'accueil du client connecte
        ?>
        <meta http-equiv="refresh" content="0;url=index_.php?page=accueilC.php">
        <?php
    }else{
        // Affichage d'un message d'erreur si les informations de connexion sont incorrectes
        print "<br>Identifiants incorrects<br>";
    }
}
?>

<!-- Formulaire de connexion pour les clients -->
<form method="post" action="<?= $_SERVER['PHP_SELF'] ?>">
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card border-0 shadow rounded-3 my-5">
                    <div class="card-body p-4 p-sm-5">
                        <h5 class="card-title text-center mb-5 fw-light fs-5">Connexion Client</h5>
                        <form>
                            <div class="form-floating mb-3">
                                <input type="email" name="email" class="form-control" id="floatingInput" placeholder="Email">
                                <label for="floatingInput">Email</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
                                <label for="floatingPassword">Mot de passe</label>
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" value="" id="rememberPasswordCheck">
                                <label class="form-check-label" for="rememberPasswordCheck">
                                    Se souvenir du mot de passe
                                </label>
                            </div>
                            <div class="d-grid">
                                <button class="btn btn-primary btn-login text-uppercase fw-bold" name="submit_login" type="submit">Se connecter</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- Option pour créer un compte -->
<div class="text-center">
    <p>Vous n'avez pas de compte ? <a href="index_.php?page=inscription.php">Créer un compte</a></p>
</div>
