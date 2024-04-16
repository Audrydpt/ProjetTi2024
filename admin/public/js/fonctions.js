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


    // Vérifie si la page actuelle est la page 'À propos'
    if (window.location.href.indexOf("a_propos") > -1) {
        $(".container").hide().each(function(index) {
            $(this).delay(400*index).fadeIn(2000);
        });
    }

});