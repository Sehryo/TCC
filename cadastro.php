<?php

function limpa_mascara($valor){
    $valor = trim($valor);
    $valor = trim($valor);
    $valor = str_replace(".", "", $valor);
    $valor = str_replace(",", "", $valor);
    $valor = str_replace("-", "", $valor);
    $valor = str_replace("/", "", $valor);
    $valor = str_replace("(","",$valor);
    $valor = str_replace(")","",$valor);
    $valor = str_replace(" ","",$valor);
    return $valor;
}

$nome = $_POST['nome'];
$email = $_POST['email'];
$tel = limpa_mascara($_POST['tel']);
$dataNasc = $_POST['dataNasc'];
$senha = $_POST['senha'];

$mysqli = new mysqli('localhost', 'root', '', 'db_culturama');

$mysqli->query("INSERT INTO tb_usuario (nome_usuario, senha_usuario, email_usuario, telefone_usuario, dataNasc_usuario) VALUES ('$nome', '$senha', '$email', '$tel', '$dataNasc')");
if($mysqli->affected_rows > 0){
    echo 200;
}
else{
    echo 201;
}

mysqli_close($mysqli);
?>