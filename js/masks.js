$(document).ready(function(){
    $("#tel").mask('(00) 00000-0000');
    $("#cpf").mask('000.000.000-00');
    $("#showPassword").on('click', function(){
        var campo_senha = $('#senha');
        var tipo_campo_senha = campo_senha.attr('type');

        if(tipo_campo_senha == "password"){
            campo_senha.attr('type', 'text');

            $(this).text('Olho riscado');
        }
        else{
            campo_senha.attr('type', 'password');

            $(this).text('Olho');
        }
    });  
});