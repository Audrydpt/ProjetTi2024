<?php
session_start();
require './admin/src/php/utils/liste_includes.php';
?>
<!doctype html>
<html lang="fr">
<head>
    <title>ProjetTi</title>
    <meta charset="utf-8">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
            integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="./admin/public/js/fonctions.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./admin/public/css/style.css" type="text/css">
    <link rel="stylesheet" href="./admin/public/css/custom.css" type="text/css">

</head>
<body>
<div class="container-fluid">
    <header id="header">
    </header>

    <nav class="navbar sticky-top d-flex justify-content-center align-items-center w-100" data-bs-theme="dark">
        <?php
        if (file_exists('./admin/src/php/utils/menu_public.php')) {
            include './admin/src/php/utils/menu_public.php';
        }
        ?>
    </nav>
    <div class="container">
        <div id="contenu">
            <?php
            //si aucune variable de session 'page'
            if (!isset($_SESSION['page'])) {
                $_SESSION['page'] = './pages/accueil.php';
            }
            if (isset($_GET['page'])) {
                //print "<br>paramètre page : ".$_GET['page']."<br>";
                $_SESSION['page'] = 'pages/' . $_GET['page'];
            }
            if (file_exists($_SESSION['page'])) {
                include $_SESSION['page'];
            } else {
                include './pages/page404.php';
            }
            ?>

        </div>
    </div>
    <footer id="footer" class="w-100" data-bs-theme="dark">
        <?php
        if (file_exists('./admin/src/php/utils/footer.php')) {
            include './admin/src/php/utils/footer.php';
        }
        ?>
    </footer>

</div>


</body>

</html>
