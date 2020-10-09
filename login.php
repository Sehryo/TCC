<?php
$mysqli = new mysqli('localhost', 'root', '', 'db_culturama');

if ($mysqli->connect_error) {
    die('Connect Error (' . $mysqli->connect_errno . ') '
            . $mysqli->connect_error);
}
$email = $_POST['email'];
$senha = $_POST['senha'];
if(isset($_POST['manterConectado'])){
    $resultado = $mysqli->query("SELECT * FROM tb_usuario WHERE email_usuario = '$email' AND senha_usuario = '$senha'");
    if($resultado->num_rows > 0){
        $resultado = $resultado->fetch_assoc();
        echo 200;
        setcookie("UserConnected", "$resultado[id_usuario]", time()+1209600);
    }
    else{
        echo 201;
    }
}
else{
    $resultado = $mysqli->query("SELECT * FROM tb_usuario WHERE email_usuario = '$email' AND senha_usuario = '$senha'");
    if($resultado->num_rows > 0){
        echo 200;
    }
    else{
        echo 201;
    }
}
?>