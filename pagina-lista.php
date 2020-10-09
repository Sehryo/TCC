<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form>
        <input type="text" placeholder="Pesquisar..." name="pesquisa" id="pesquisa">
        <button><i class="fas fa-search"></button>
    </form>
<?php
    $mysqli = new mysqli("localhost", "root", "", "db_culturama");
    $events = $mysqli->query("SELECT * FROM tb_evento");
    $result = $events->fetch_assoc();
    $rows = $events->num_rows;
    if($rows == 0){
        echo ("<p>Ainda não há eventos cadastrados!</p>");
    }
    else if($rows == 1){
        if(!isset($_GET['pesquisa'])){
            foreach($events as $row){
                $endereco = $mysqli->query("SELECT * FROM tb_endereco WHERE id_endereco =".$row['id_endereco']."");
                $endereco = $endereco->fetch_assoc();
                echo ("<a href='pagina-evento.php?evento=".$row['id_evento']."' style='font-style: none'>
                    <div>
                        <img src='data:image;base64,".base64_encode($row['imagem_evento'])."' alt='Image' type='".$row['tipo_imagem']."' style='width:100px; height:100px; display:block'>
                        <div style='display:inline; width:300px'>
                            <p>".$row['nome_evento']."</p>
                            <p>".$row['descricao_evento']."</p>
                            <p>".$endereco['rua_endereco'] .', ' .$endereco['cidade_endereco'] .', ' .$endereco['uf_endereco']. "</p>
                        </div>
                    </div>
                    </a>");
            }
        }
        else{
            $pesquisa = $_GET['pesquisa'];
            $events = $mysqli->query("SELECT * FROM tb_evento WHERE (`nome_evento` LIKE '%$pesquisa%') OR (`tags_evento` LIKE '%$pesquisa%')");
            $result = $events->fetch_assoc();
            foreach($events as $row){
                $endereco = $mysqli->query("SELECT * FROM tb_endereco WHERE id_endereco =".$row['id_endereco']."");
                $endereco = $endereco->fetch_assoc();
                echo ("<a href='pagina-evento.php?evento=".$row['id_evento']."' style='font-style: none'>
                    <div>
                        <img src='data:image;base64,".base64_encode($row['imagem_evento'])."' alt='Image' type='".$row['tipo_imagem']."' style='width:100px; height:100px; display:block'>
                        <div style='display:inline; width:300px'>
                            <p>".$row['nome_evento']."</p>
                            <p>".$row['descricao_evento']."</p>
                            <p>".$endereco['rua_endereco'] .', ' .$endereco['cidade_endereco'] .', ' .$endereco['uf_endereco']. "</p>
                        </div>
                    </div>
                    </a>");
            }
        }      
    }
    else{
        if(!isset($_GET['pesquisa'])){
            foreach($events as $row){
                $endereco = $mysqli->query("SELECT * FROM tb_endereco WHERE id_endereco =".$row['id_endereco']."");
                $endereco = $endereco->fetch_assoc();
                echo ("<a href='pagina-evento.php?evento=".$row['id_evento']."' style='font-style: none'>
                    <div>
                        <img src='data:image;base64,".base64_encode($row['imagem_evento'])."' alt='Image' type='".$row['tipo_imagem']."' style='width:100px; height:100px; display:block'>
                        <div style='display:inline; width:300px'>
                            <p>".$row['nome_evento']."</p>
                            <p>".$row['descricao_evento']."</p>
                            <p>".$endereco['rua_endereco'] .', ' .$endereco['cidade_endereco'] .', ' .$endereco['uf_endereco']. "</p>
                        </div>
                    </div>
                    </a>");
            }
        }
        else{
            $pesquisa = $_GET['pesquisa'];
            $events = $mysqli->query("SELECT * FROM tb_evento WHERE (`nome_evento` LIKE '%$pesquisa%') OR (`tags_evento` LIKE '%$pesquisa%')");
            if($events->num_rows == 0){
                echo "Nada foi encontrado!";
            }
            else{
                $result = $events->fetch_assoc();
                foreach($events as $row){
                    $endereco = $mysqli->query("SELECT * FROM tb_endereco WHERE id_endereco =".$row['id_endereco']."");
                    $endereco = $endereco->fetch_assoc();
                    echo ("<a href='pagina-evento.php?evento=".$row['id_evento']."' style='font-style: none'>
                        <div>
                            <img src='data:image;base64,".base64_encode($row['imagem_evento'])."' alt='Image' type='".$row['tipo_imagem']."' style='width:100px; height:100px; display:block'>
                            <div style='display:inline; width:300px'>
                                <p>".$row['nome_evento']."</p>
                                <p>".$row['descricao_evento']."</p>
                                <p>".$endereco['rua_endereco'] .', ' .$endereco['cidade_endereco'] .', ' .$endereco['uf_endereco']. "</p>
                            </div>
                        </div>
                        </a>");
                }
            }
        }
}
?>
</body>
</html>