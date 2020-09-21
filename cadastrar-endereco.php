<?php
$cep = $_POST['cep'];
$rua = $_POST['rua'];
$bairro = $_POST['bairro'];
$cidade = $_POST['cidade'];
$uf = $_POST['uf'];
$logradouro = $_POST['logradouro'];
$numCasa = $_POST['numCasa'];

$mysqli = new mysqli('localhost', 'root', '', 'db_culturama');

$result = $mysqli->query("SELECT * FROM tb_endereco WHERE cep_endereco = '$cep'");
if($result->num_rows == 1){
    $row = $result->fetch_assoc();
    $mysqli->query("INSERT INTO tb_endereco_usuario VALUES (1, $row[id_endereco], '$numCasa')");
    echo 200;
}
else{
    $mysqli->query("INSERT INTO tb_endereco VALUES (default, '$rua', '$bairro', '$cidade', '$uf', '$cep', '$logradouro')");
    $result = $mysqli->query("SELECT * FROM tb_endereco WHERE cep_endereco = '$cep'");
    $row = $result->fetch_assoc();
    $mysqli->query("INSERT INTO tb_endereco_usuario VALUES (1, '$row[id_endereco]', '$numCasa')");
    echo 200;
}
?>