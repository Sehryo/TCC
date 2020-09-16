$(document).ready(function(){
    $("#enviar").on('click', function(){
        $("#enviar").attr("disabled", "disabled");
        var nome = $("#nome").val();
        var email = $("#email").val();
        var tel = $("#tel").val();
        var dataNasc = $("#dataNasc").val();
        var senha = $("#senha").val();
        if(nome != "" && email != "" && tel != "" && dataNasc != "" && senha != ""){
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
                    if(response == 200){
                        $("#enviar").removeAttr('disabled');
                        alert("Dados inseridos com sucesso!");
                        document.location = 'login.html';
                    }
                    else{
                        alert("Houve algum erro inserindo as informações!");
                        console.log(response);
                        $("#enviar").removeAttr('disabled');
                    }
                }
            });
        }
        else{
            alert("Preencha corretamente as informações!");
        }
    });
    $("#login").on('click', function(){
        $("#login").attr("disabled", "disabled");
        var email = $('#email').val();
        var senha = $('#senha').val();

        if(email != "" && senha != ""){
            $.ajax({
                url: "login.php",
                type: "POST",
                data:{
                    email: email,
                    senha: senha
                },
                cache: false,
                success: function(response){
                    if(response == 200){
                        alert("Login efetuado com sucesso!");
                        $("#login").removeAttr('disabled');
                        console.log(response);
                    }
                    else{
                        alert("Senha ou usuário incorretos!");
                        $("#login").removeAttr('disabled');
                        console.log(response);
                    }
                }
            });
        }
    });
});