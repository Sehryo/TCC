<?php
$email = $_POST['email'];
$senha = $_POST['senha'];

$mysqli = new mysqli('localhost', 'root', '', 'db_culturama');

if ($mysqli->connect_error) {
    die('Connect Error (' . $mysqli->connect_errno . ') '
            . $mysqli->connect_error);
}

$resultado = $mysqli->query("SELECT * FROM tb_usuario WHERE email_usuario = '$email' AND senha_usuario = '$senha'");
if($resultado->num_rows > 0){
    echo 200;
}
else{
    echo 201;
}
?>