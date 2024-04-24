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
                            console.error('Error updating equipment:', data.error);
                        } else {
                            console.log('Equipment updated successfully');
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error('AJAX error:', textStatus, ', Details:', errorThrown);
                        console.error('Response:', jqXHR.responseText);
                    }
                })
            }
        })
    })


    $('#texte_bouton_submit').text("Ajouter ou mettre à jour");

    $('#reset').click(function () {
        $('#texte_bouton_submit').text("Ajouter ou mettre à jour");
    })

    $('#texte_bouton_submit').click(function (e) { //e = formulaire
        e.preventDefault(); //empêcher l'attribut action de form
        let nom = $('#nom').val();
        let description = $('#description').val();
        let tarif = $('#tarif').val();
        let image = $('#image').val();
        let stock = $('#stock').val();
        let id_categorie = $('#id_categorie').val();
        let param = 'nome=' + nom + '&descriptione=' + description + '&tarife=' + tarif + '&image=' + image + '&stock=' + stock + '&id_categorie=' + id_categorie;

        let retour = $.ajax({
            type: 'get',
            dataType: 'json',
            data: param,
            url: './src/php/ajax/ajaxAddEquipement.php',
            success: function (data) {//data = retour du # php
                console.log(data);
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
                $('#texte_bouton_submit').text("Modifier");
            }
        })
    })


});