var email_valido = false;
var nome_valido = false;
var tel_valido = false;
var genero_valido = false;
var dataNasc_valida = false;
var senha_valida = false;

// Função básica de validação do email, ainda falta contar quantos @ tem, pois só pode ter um.
function valida_email(email){
    if(email.indexOf('@') !== -1)
    {
        var email_partes = email.split('@');
        if(email_partes[1].indexOf('.') !== -1)
        {
            email_valido = true;
        }
        else{
            email_valido = false;
        }
    }
    else{
        email_valido = false;
    }
}

// Função para validar se a pessoa não digitou o nome incompleto ou se colocou algum nome abreviado.
function valida_nome(nome){
    if(nome.length >= 3)
    {
        var nomes = nome.split(" ");
        var nome_valido = false;
        for(var a = 0; a < nomes.length; a++){
            if(nomes[a].length < 2){
                nome_valido = false;
                break;
            }
            else{
                nome_valido = true;
            }
        }
    }
    else{
        nome_valido = false;
    }
}
// Função para validar se a pessoa selecionou um genero. Funcional.
function valida_genero(genero){
    if(genero !== ""){
        genero_valido = true;
    }
    else{
        genero_valido = false;
    }
}

// Função para validar o telefone. Ela basicamente vê o tamanho do telefone e vê se ele é válido ou não (Números repetidos não são válidos!)
function valida_tel(tel){
    if(tel.length >= 15){
        if(tel.indexOf('1111') !== -1 || tel.indexOf('2222') !== -1 || tel.indexOf('3333') !== -1 || tel.indexOf('4444') !== -1 || tel.indexOf('5555') !== -1 || tel.indexOf('6666') !== -1 || tel.indexOf('7777') !== -1 || tel.indexOf('8888') !== -1 || tel.indexOf('9999') !== -1 || tel.indexOf('0000') !== -1){
            alert('Insira um número válido!');
            tel_valido = false;
        }
        else{
            tel_valido = true;
        }
    }
    else{
        tel_valido = false;
    }
}


function valida_senha(senha){
    if(senha.length < 8){
        senha_valida = false;
        alert("aaa");
    }
    else{
        senha_valida = true;
    }
}
/*
* Aqui são os EventListeners. São funções que serão executadas o tempo todo, sem que precisemos linkar nada. As desativei para vermos o que faremos.
var campo_email = document.getElementById("email");
var campo_nome = document.getElementById("nome");
var campo_genero = document.getElementById("genero");
var campo_tel = document.getElementById("tel");
var campo_senha = document.getElementById("senha");


campo_email.addEventListener("focusout", function(){valida_email(this.value)}, false);
campo_nome.addEventListener("focusout", function(){valida_nome(this.value)}, false);
campo_genero.addEventListener("focusout", function(){valida_genero(this.value)}, false);
campo_tel.addEventListener("focusout", function(){valida_tel(this.value)}, false);
campo_senha.addEventListener("focusout", function(){valida_senha(this.value)}, false);
*/

function validacao(){
    valida_email(document.forms['formCadastro']['email'].value);
    valida_genero(document.forms['formCadastro']['email'].value);
    valida_nome(document.forms['formCadastro']['email'].value);
    valida_senha(document.forms['formCadastro']['email'].value);
    valida_tel(document.forms['formCadastro']['email'].value);

    return false;
}