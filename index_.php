<?php
session_start();
require './admin/src/php/utils/liste_includes.php';
?>
<!doctype html>
<html lang="fr">
<head>
    <title>ProjetTi</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./admin/public/css/style.css" type="text/css">
    <link rel="stylesheet" href="./admin/public/css/custom.css" type="text/css">
    <script type="javascript" src="./admin/public/js/script.js"></script>
</head>
<body>
<div class="container">
    <header id="header">
    </header>

    <nav id="menu">
        <?php
        if (file_exists('./admin/src/php/utils/menu_public.php')) {
            include './admin/src/php/utils/menu_public.php';
        }
        ?>
        <a href="index_.php?page=login.php">Connexion admin</a>
        <a href="index_.php?page=connexion.php">Connexion client</a>


    </nav>
    <div id="contenu">
        <?php
        //si aucune variable de session 'page'
        if (!isset($_SESSION['page'])) {
            $_SESSION['page'] = './pages/accueil.php';
        }
        if (isset($_GET['page'])) {
            //print "<br>paramètre page : ".$_GET['page']."<br>";
            $_SESSION['page'] = 'pages/'.$_GET['page'];
        }
        if (file_exists($_SESSION['page'])) {
            include $_SESSION['page'];
        } else {
            include './pages/page404.php';
        }
        ?>

    </div>

    <footer id="footer">
        <?php
        if (file_exists('./admin/src/php/utils/footer.php')) {
            include './admin/src/php/utils/footer.php';
        }
        ?>
    </footer>
</div>
</body>

</html>
