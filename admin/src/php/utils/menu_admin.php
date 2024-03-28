<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Espace Administrateur</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContentAdmin" aria-controls="navbarSupportedContentAdmin" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContentAdmin">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index_.php?page=accueil_admin.php">Accueil Admin</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Gérer Produits</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Ajouter Produit</a></li>
                        <li><a class="dropdown-item" href="#">Modifier Produit</a></li>
                        <li><a class="dropdown-item" href="#">Supprimer Produit</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Gérer Stock</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Ajouter Stock</a></li>
                        <li><a class="dropdown-item" href="#">Modifier Stock</a></li>
                        <li><a class="dropdown-item" href="#">Supprimer Stock</a></li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Rechercher</button>
            </form>
        </div>
    </div>
</nav>
