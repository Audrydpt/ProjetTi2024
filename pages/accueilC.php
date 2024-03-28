<?php
// Vérifier si la session client n'est pas définie
if (!isset($_SESSION['client'])) {
    // Rediriger vers la page de connexion
    header("Location: ../index_.php?page=connexion.php");
    exit; // Arrêter l'exécution du script après la redirection
}

print "<br>Page de client connecté<br>";