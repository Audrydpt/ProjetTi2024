$(document).ready(function () {

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


    $("#search").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $(".equipement-title").filter(function() {
            $(this).closest('.card').toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });



    const containers = document.querySelectorAll('.fade-in-element');

    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('show');
                observer.unobserve(entry.target);
            }
        });
    }, {
        threshold: 0.1 //declencheur (temps)
    });

    containers.forEach(container => {
        observer.observe(container);
    });


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



        $('.delete-equipement').click(function () {
            var id = $(this).data('id');

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
                        $('#equipement-' + id).remove();
                        location.reload();
                    }
                }
            });
        });


        $('#quantite, #nomEquipement').change(function () {
            var selectedEquipement = $('#nomEquipement').val();
            var unitPrice = unitPrices[selectedEquipement];

            var quantity = $('#quantite').val();

            var totalPrice = unitPrice * quantity;

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
                    alert(data.error);
                    console.error('Error:', data.error);
                } else {
                    console.log('Reservation added successfully');
                    window.location.href = './index_.php?page=confirmation.php&' + $.param({
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
                alert('Oups.. Une erreur s\'est produite. Veuillez réessayer');

                console.error('AJAX error:', textStatus, errorThrown);
                console.log('Response:', jqXHR.responseText);
            }
        });
    });









});
