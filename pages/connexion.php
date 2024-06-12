<?php
if(isset($_POST['submit_login'])) {
    extract($_POST, EXTR_OVERWRITE);

    $clientDB = new ClientDB($cnx);

    $client = $clientDB->getClientByEmailAndPassword($email, $password);

    if($client){
        $_SESSION['client'] = $client;

        ?>
        <meta http-equiv="refresh" content="0;url=index_.php?page=accueilC.php">
        <?php
    }else{
        print "<br>Identifiants incorrects<br>";
    }
}
?>

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

<div class="text-center">
    <p>Vous n'avez pas de compte ? <a href="index_.php?page=inscription.php">Créer un compte</a></p>
</div>
