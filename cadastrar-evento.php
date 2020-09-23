<?php
$nome = $_POST['nome'];
$desc = $_POST['desc'];
$data = $_POST['data'];
$hora_inicio = $_POST['hora_inicio'];
$hora_fim = $_POST['hora_fim'];
$tags = $_POST['tags'];
$cep = $_POST['cep'];
$rua = $_POST['rua'];
$bairro = $_POST['bairro'];
$cidade = $_POST['cidade'];
$uf = $_POST['uf'];
if(isset($_POST['complemento'])){
    $complemento = $_POST['complemento'];
}
$numCasa = $_POST['num_casa'];
$imgData = addslashes(file_get_contents($_FILES['thumbEvento']['tmp_name']));
$imgProperties = getimageSize($_FILES['thumbEvento']['tmp_name']);

$mysqli = new mysqli('localhost', 'root', '', 'db_culturama');


$validaEnd = $mysqli->query("SELECT * FROM tb_endereco WHERE cep_endereco = '$cep'");
if($validaEnd->num_rows < 1){
    $mysqli->query("INSERT INTO tb_endereco VALUES (default, '$rua', '$bairro', '$cidade', '$uf', '$cep', '$complemento')");
    $result = $mysqli->query("SELECT * FROM tb_endereco WHERE cep_endereco = '$cep'");
    $row = $result->fetch_assoc();
    $mysqli->query("INSERT INTO tb_evento VALUES (default, '$nome', '$desc', '$data', '$hora_inicio', '$hora_fim', 1, '$row[id_endereco]', '$numCasa', '$tags', '{$imgData}', '{$imgProperties['mime']}')") or die("201");
    echo 200;
}
else{
    $row = $validaEnd->fetch_assoc();
    $mysqli->query("INSERT INTO tb_evento VALUES (default, '$nome', '$desc', '$data', '$hora_inicio', '$hora_fim', 1, '$row[id_endereco]', '$numCasa', '$tags', '{$imgData}', '{$imgProperties['mime']}')") or die("201");
    echo 200;
}
?>