<?php
session_start();
require './src/php/utils/liste_includes.php';
?>
<!doctype html>
<html lang="fr">
<head>
    <title>ProjetTi</title>
    <meta charset="utf-8">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
            integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js"
            integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"
            async></script>
    <script src="./public/js/fonctions.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./public/css/style.css" type="text/css">
    <link rel="stylesheet" href="./public/css/custom.css" type="text/css">
</head>
<body>

    <header id="header">
    </header>
    <div class="container-fluid ">
        <nav class="navbar navbar-expand-md sticky-top w-100 d-flex justify-content-center align-items-center">


        <?php
            if (file_exists('./src/php/utils/menu_admin.php')) {
                include './src/php/utils/menu_admin.php';
            }
            ?>

        </nav>
    </div>
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
    <div class="container-fluid">
        <footer id="footer">
            <?php
            if (file_exists('./src/php/utils/footer.php')) {
                include './src/php/utils/footer.php';
            }
            ?>
        </footer>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>

</html>
