<?php
if(isset($_POST['submit_login'])) {

    extract($_POST, EXTR_OVERWRITE);

    $ad = new AdminDB($cnx);
    $admin = $ad->getAdmin($login, $password);

    if($admin){
        //creer variable de session pour admin
        $_SESSION['admin'] = 1;
        ?>
        <meta http-equiv="refresh" content="0;url=admin/index_.php?page=accueil_admin.php">
        <?php
    }else{
        //redirect vers login
        print "<div class='container message-container'><h1 class='text-center'>Accès réservé aux admins</h1></div>";
        ?>
        <meta http-equiv="refresh" content="3;url=index_.php?page=accueil.php">
        <?php
    }

} else {
    ?>

    <form method="post" action="<?= $_SERVER['PHP_SELF'] ?>">
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card border-0 shadow rounded-3 my-5">
                        <div class="card-body p-4 p-sm-5">
                            <h5 class="card-title text-center mb-5 fw-light fs-5">Connexion admin</h5>
                            <form>
                                <div class="form-floating mb-3">
                                    <input type="text" name="login" class="form-control" id="floatingInput" placeholder="name">
                                    <label for="floatingInput">Email</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
                                    <label for="floatingPassword">Mot de passe</label>
                                </div>

                                <div class="d-grid">
                                    <button class="btn btn-primary btn-login text-uppercase fw-bold" name="submit_login" type="submit">Se connecter</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <?php
}
?>