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
        if($('#manterConectado').is(":checked")){
            if(email != "" && senha != ""){
                $.ajax({
                    url: "login.php",
                    type: "POST",
                    data:{
                        email: email,
                        senha: senha,
                        manterConectado: "on"
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
        }
        else{
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
        }
        $("#login").removeAttr('disabled');
    });

    $("#validaEmail").on('click', function(){
        $("#validaEmail").attr("disabled", "disabled");
        var email = $('#email').val();
        $.ajax({
            url: "changepassword.php",
            type: "GET",
            data:{
                email: email
            },
            success: function(response){
                if(response == 200){
                    $("#email").replaceWith("<input type='password' placeholder='Digite sua senha' id='senha'>");
                    $("#validaEmail").replaceWith("<input type='button' id='trocaSenha' value='Trocar de senha'>");
                    alert("Insira sua nova senha!");
                }
                else{
                    alert("Email incorreto ou não cadastrado!");
                    $("#validaEmail").removeAttr('disabled');
                    console.log(response);
                }
            }
        });
    });
    $(document).on('click', "#trocaSenha", function() {
        $("#trocaSenha").attr("disabled", "disabled");
        var senha = $("#senha").val();
        $.ajax({
            url: "changepassword.php",
            type: "POST",
            data:{
                senha:senha
            },
            success: function(response){
                if(response == 200){
                    $("#trocaSenha").removeAttr('disabled');
                    alert("Senha alterada com sucesso!");
                    console.log(response);
                }
                else{
                    $("#trocaSenha").removeAttr('disabled');
                    alert("Houve algum problema com seu processo!");
                    console.log(response);
                }
            }
        });
    });
    function limpa_formulário_cep() {
        // Limpa valores do formulário de cep.
        $("#rua").val("");
        $("#bairro").val("");
        $("#cidade").val("");
        $("#uf").val("");
    }
    
    //Quando o campo cep perde o foco.
    $("#cep").blur(function() {

        //Nova variável "cep" somente com dígitos.
        var cep = $(this).val().replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                $("#rua").val("...");
                $("#bairro").val("...");
                $("#cidade").val("...");
                $("#uf").val("...");
                $("#ibge").val("...");

                //Consulta o webservice viacep.com.br/
                $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                    if (!("erro" in dados)) {
                        //Atualiza os campos com os valores da consulta.
                        $("#rua").val(dados.logradouro);
                        $("#bairro").val(dados.bairro);
                        $("#cidade").val(dados.localidade);
                        $("#uf").val(dados.uf);
                        $("#ibge").val(dados.ibge);
                    } //end if.
                    else {
                        //CEP pesquisado não foi encontrado.
                        limpa_formulário_cep();
                        alert("CEP não encontrado.");
                    }
                });
            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                alert("Formato de CEP inválido.");
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
        }
    });
    $("#cadEndereco").on('click', function(){
        var cep = $("#cep").val();
        var rua = $("#rua").val();
        var bairro = $("#bairro").val();
        var cidade = $("#cidade").val();
        var uf = $("#uf").val();
        var complemento = $("#complemento").val();
        var numCasa = $("#num_casa").val();

        $.ajax({
            url: 'cadastrar-endereco.php',
            type: 'POST',
            data:{
                cep:cep,
                rua:rua,
                bairro:bairro,
                cidade:cidade,
                uf:uf,
                complemento:complemento,
                numCasa:numCasa
            },
            success: function(response){
                if(response == 200){
                    alert("Endereço cadastrado com sucesso");
                }
                else{
                    alert("Deu ruim!");
                    console.log(response);
                }
            }
        });
    });
    $("#cadOrganizador").on('click', function(){
        var email = $("#email").val();
        var nome = $("#nome").val();
        var cnpj = $("#cnpj").val();
        var senha = $("#senha").val();

        $.ajax({
            url: 'cadastrar-organizador.php',
            type: 'POST',
            data:{
                email:email,
                nome:nome,
                cnpj:cnpj,
                senha:senha
            },
            cache:false,
            success: function(response) {
                if(response == 201){
                    alert("CNPJ já cadastrado!");
                }
                else if(response == 200){
                    alert("Registrado com sucesso!");
                }
                else{
                    alert("Erro!");
                    console.log(response);
                }
            }
        });
    });
});