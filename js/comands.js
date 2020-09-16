$(document).ready(function(){
    $("#enviar").on('click', function(){
        $("#enviar").attr("disabled", "disabled");
        var nome = $("#nome").val();
        var email = $("#email").val();
        var tel = $("#tel").val();
        var dataNasc = $("#dataNasc").val();
        var senha = $("#senha").val();
        $.ajax({
            url: "cadastro.php",
            type: "POST",
            data:{
                nome: nome,
                email: email,
                tel: tel,
                dataNasc: dataNasc,
                senha: senha
                },
            cache:false,
            success: function(response){
                var resultado = JSON.parse(response);
                if(resultado.codigoStatus == 200){
                    $("#enviar").removeAttr('disabled');
                    alert("Dados inseridos com sucesso!");
                }
                else{
                    alert("Houve algum erro inserindo as informações!");
                }
            }
        });
    });
});