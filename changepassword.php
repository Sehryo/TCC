<?php
session_start();
$mysqli = new mysqli('localhost', 'root', '', 'db_culturama');

if(!isset($_SESSION['emailUsuario'])){
    $email = $_GET['email'];
    $resultado = $mysqli->query("SELECT * FROM tb_usuario WHERE email_usuario = '$email'");
    if($resultado->num_rows > 0){
        $valores = $resultado->fetch_assoc();
        $_SESSION['emailUsuario'] = $valores['email_usuario'];
        echo 200;
    }
    else{
        echo 404;
    }
    mysqli_close($mysqli);
}
elseif (isset($_SESSION['emailUsuario'])) {
    $senha = $_POST['senha'];
    $mysqli->query("UPDATE tb_usuario SET senha_usuario = '$senha' WHERE email_usuario = '$_SESSION[emailUsuario]'");
    if($mysqli->affected_rows > -1){
        echo 200;
        $_SESSION = array();
    }
    else{
        echo 404;
        echo $_SESSION['emailUsuario'];
        echo $mysqli->error;
        $_SESSION = array();
    }
}
?>