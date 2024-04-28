$(document).ready(function () {
    //js pour inscrition
    $('#showAdditionalFieldsBtn').click(function () {
        var email = $('#emailRegister').val();

        $.post('./admin/src/php/ajax/ajaxClient.php', {email: email}, function (data) {
            if (data.status === 'client_found') {
                window.location.href = 'index_.php?page=connexion.php';
            } else if (data.status === 'client_not_found') {
                $('#additionalFields').slideDown();
                $('#showAdditionalFieldsBtn').hide();
            }
        });
    });


    // Vérifie si la page actuelle est la page 'À propos'
    if (window.location.href.indexOf("a_propos") > -1) {
        $(".container").hide().each(function (index) {
            $(this).delay(100 * index).fadeIn(1000);
        });
    }

    //quand une balise contient des atttributs,
    //cette balise est un tableau
    $("td[id]").click(function () {
        let valeur1 = $.trim($(this).text());
        let id = $(this).attr('id');
        let name = $(this).attr('name');
        $(this).blur(function () {
            let valeur2 = $.trim($(this).text());
            if (valeur1 != valeur2) {
                let parametre = "id=" + id + "&name=" + name + "&valeur=" + valeur2;
                let retour = $.ajax({
                    type: 'get',
                    dataType: 'json',
                    data: parametre,
                    url: './src/php/ajax/ajaxUpdateEquipement.php',
                    success: function (data) {
                        if (data && data.error) {
                            console.error('pas ok :', data.error);
                        } else {
                            console.log('ok');
                        }
                    }
                })
            }
        })
    })


    $('#texte_bouton_submit').text("Ajouter");

    $('#reset').click(function () {
        $('#texte_bouton_submit').text("Ajouter");
    })

    $('#texte_bouton_submit').click(function (e) {
        e.preventDefault();
        let nome = $('#nom').val();
        let descriptione = $('#description').val();
        let tarife = $('#tarif').val();
        let image = $('#image').val();
        let stock = $('#stock').val();
        let id_categorie = $('#id_categorie').val();
        let param = 'nome=' + nome + '&descriptione=' + descriptione + '&tarife=' + tarife + '&image=' + image + '&stock=' + stock + '&id_categorie=' + id_categorie;

        let retour = $.ajax({
            type: 'get',
            dataType: 'json',
            data: param,
            url: './src/php/ajax/ajaxAddEquipement.php',
            success: function (data) {
                if (data && data.error) {
                    //popup erreur
                    alert(data.error);
                } else {
                    console.log(data);
                }
            }
        })
    })

    $('#email').blur(function () {
        let nom = $('#nom').val();
        console.log("nom : " + nom);
        let parametre = 'nom=' + nom;
        let retour = $.ajax({
            type: 'get',
            dataType: 'json',
            data: parametre,
            url: './src/php/ajax/ajaxSearchEquipement.php',
            success: function (data) {//data = retour du # php
                console.log(data);
                $('#description').val(data[0].description);
                $('#tarif').val(data[0].tarif);
                $('#image').val(data[0].image);
                $('#stock').val(data[0].stock);
                $('#id_categorie').val(data[0].id_categorie);
            }
        })
    })


        // Ajoutez un écouteur d'événements click à tous les éléments de la colonne "Supprimer"
        $('.delete-equipement').click(function () {
            // Récupérez l'ID de l'équipement à supprimer
            var id = $(this).data('id');

            // Envoyez une requête AJAX pour supprimer l'équipement
            $.ajax({
                url: './src/php/ajax/ajaxDeleteEquipement.php',
                type: 'GET',
                data: { id: id },
                dataType: 'json',
                success: function (data) {
                    if (data && data.error) {
                        console.error('pas ok :', data.error);
                    } else {
                        console.log('ok');
                        // Supprimez la ligne de l'équipement de la table
                        $('#equipement-' + id).remove();
                        location.reload();
                    }
                }
            });
        });


        // Add event listener to the quantity input field and the equipment select field
        $('#quantite, #nomEquipement').change(function () {
            // Get the selected equipment and its unit price
            var selectedEquipement = $('#nomEquipement').val();
            var unitPrice = unitPrices[selectedEquipement];

            // Get the entered quantity
            var quantity = $('#quantite').val();

            // Calculate the total price
            var totalPrice = unitPrice * quantity;

            // Display the total price in the total price input field
            $('#prix').val(totalPrice.toFixed(2));
        });




    $('#reservationForm').on('submit', function(e) {
        e.preventDefault();

        var dateDebut = $('#dateDebut').val();
        var dateFin = $('#dateFin').val();
        var emailClient = $('#emailClient').val();
        var nomEquipement = $('#nomEquipement').val();
        var quantite = $('#quantite').val();
        var modePaiement = $('#modePaiement').val();
        var prix = $('#prix').val();

        $.ajax({
            url: './admin/src/php/ajax/ajaxLocation.php',
            type: 'GET',
            data: {
                dateDebut: dateDebut,
                dateFin: dateFin,
                emailClient: emailClient,
                nomEquipement: nomEquipement,
                quantite: quantite,
                modePaiement: modePaiement,
                prix: prix
            },
            dataType: 'json',
            success: function(data) {
                if (data && data.error) {
                    console.error('Error:', data.error);
                } else {
                    console.log('Reservation added successfully');
                    // Redirect to the confirmation page with the reservation details as URL parameters
                    window.location.href = './pages/confirmation.php?' + $.param({
                        dateDebut: dateDebut,
                        dateFin: dateFin,
                        emailClient: emailClient,
                        nomEquipement: nomEquipement,
                        quantite: quantite,
                        modePaiement: modePaiement,
                        prix: prix
                    });
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('AJAX error:', textStatus, errorThrown);
                console.log('Response:', jqXHR.responseText);  // Log the exact response
            }
        });
    });







});