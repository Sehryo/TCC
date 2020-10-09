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
$cnpj = limpa_mascara($_POST['cnpj']);
$senha = $_POST['senha'];
$mysqli = new mysqli('localhost', 'root', '', 'db_culturama');

$validaCNPJ = $mysqli->query("SELECT * FROM tb_pj WHERE cnpj_pj = '$cnpj'");
if($validaCNPJ->num_rows != 0){
    echo 201;
}
else{
    $mysqli->query("INSERT INTO tb_organizador VALUES(default, '$nome', '$email', '$senha')");
    $organizador = $mysqli->query("SELECT * FROM tb_organizador WHERE email_organizador = '$email'");
    $row = $organizador->fetch_assoc();
    $mysqli->query("INSERT INTO tb_pj VALUES ('$cnpj', $row[id_organizador])");
    echo 200;
}
?>