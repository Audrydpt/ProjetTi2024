$(document).ready(function () {

    $('#showAdditionalFieldsBtn').click(function() {

        var email = $('#emailRegister').val();

        $.post('./src/php/ajax/ajaxClient.php', { email: email }, function(data) {
            if (data.status === 'client_found') {
                window.location.href = 'index_.php?page=connexion.php';
            } else {

                $('#additionalFields').slideDown();

                $('#showAdditionalFieldsBtn').hide();
            }
        });
    });
});
