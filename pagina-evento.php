<?php
$mysqli = new mysqli("localhost", "root", "", "db_culturama");
$id = $_GET['evento'];
$result = $mysqli->query("SELECT * FROM tb_evento WHERE id_evento = $id");
$result = $result->fetch_assoc();
$endereco = $mysqli->query("SELECT * FROM tb_endereco WHERE id_endereco =".$result['id_endereco']."");
$endereco = $endereco->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Home </title>
    <link rel="stylesheet" href="estilos/style.css">
    <link rel="stylesheet" href="estilos/user.css">
    <link rel="stylesheet" href="estilos/pagina-evento.css">
    <link href="/fontawesome-free-5.14.0-web/css/fontawesome.css" rel="stylesheet">
    <link href="/fontawesome-free-5.14.0-web/css/brands.css" rel="stylesheet">
    <link href="/fontawesome-free-5.14.0-web/css/solid.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/7cc69e0e3a.js" crossorigin="anonymous"></script>
</head>

<body>

    <header>
        <nav class="navbar-home bg-nav">
            <ul class="navbar-list m-left">
                <li class="nav-item"> <a href="#" class="cool-link"> Home </a> </li>
                <li class="nav-item"> <a href="#" class="cool-link"> Sobre </a> </li>
                <li class="nav-item"> <a href="#" class="cool-link"> Contato </a> </li>
            </ul>   
        </nav>    
    </header>

<div class="content-view">

        <section>
            <div id="geral">
                <div class="col-45">
                    <?php echo'<img src="data:image;base64,'.base64_encode($result['imagem_evento']).'" style="width: 500px; height: 400px">'; ?>
                </div>
                <div class="col-90">
                    <div class="avaliacao-evento">
                        <span class="avaliacao-evento-num"> 1/5 </span> <br>
                        <span class="avaliacao-evento-qtd"> 300 avaliações </span>
                    </div>
                    <section class="titulo-evento">
                        <h1><?php echo($result['nome_evento']); ?></h1>
                        <p><?php echo($endereco['rua_endereco']. ", " . $endereco['bairro_endereco'] . ", " . $endereco['cidade_endereco'] . " - ". $endereco['cep_endereco'])?></p>
                    </section>
                    <section>
                        <div class="buttons-evento">
                            <button class="add-evento-agenda"> <i class="far fa-calendar-alt"></i> + </button>
                            <input type="radio" id="vou" name="status-evento-user" value="vou">
                            <label for="vou"> Vou </label><br>
                            <input type="radio" id="interesse" name="status-evento-user" value="interesse">
                            <label for="interesse"> Tenho interesse </label><br>
                        </div>
                    </section>
                    <section>
                        <div class="info-evento">
                            <i class="fas fa-map-marker-alt"></i> <?php echo($endereco['rua_endereco']. ", Nº" . $result['num_endereco'] . ", " . $endereco['cidade_endereco']);  ?>
                            <p> <span class="info-evento-item1"><i class="fas fa-clock"></i><?php echo($result['horario_entrada']); ?></span> 
                                <span class="info-evento-item2"><i class="fas fa-calendar"></i><?php echo($result['data_evento']); ?></p></span>
                        </div>
                    </section>
                    <div class="col-90-img-slider">
                        <img src="imagens/pool.jpg">
                    </div>
                </div>
            </div>
        </section>

        <section>
            <div class="slider">

            </div>
        </section>

        <hr class="line">

        <section>
            <div class="desc-evento">
                <h1 class="titulo-evento-page"> Descrição </h1>
                <p> 
                    <?php echo($result['descricao_evento']); ?>
                </p>
            </div>
        </section>

        <hr class="line">
      
        <section>  
            <div class="desc-evento">
                <h1 class="titulo-evento-page"> Categorias </h1>
                <p><?php echo($result['tags_evento']); ?></p>
            </div>
        </section>

        <hr class="line">

        <section>
            <div class="desc-evento">
                <h1 class="titulo-evento-page"> Avaliações </h1>
                <div class="card-opiniao">
                    <i class="fas fa-star star-1"></i> 
                    <i class="fas fa-star star-2"></i> 
                    <i class="fas fa-star star-3"></i>
                    <i class="fas fa-star star-4"></i>
                    <i class="fas fa-star star-5"></i>
                    <h4 class="avaliacao-titulo"> Comentário principal </h3>
                    <p class="avaliacao-texto"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eros justo, 
                    congue id fermentum pharetra, mattis eget sapien. 
                    Duis quis interdum justo. </p>
                    <span class="avaliacao-user"> Nome do usuário </span>
                </div>

                <div class="card-opiniao">
                    <i class="fas fa-star star-1"></i> 
                    <i class="fas fa-star star-2"></i> 
                    <i class="fas fa-star star-3"></i>
                    <i class="fas fa-star star-4"></i>
                    <i class="fas fa-star star-5"></i>
                    <h4 class="avaliacao-titulo"> Comentário principal 2 </h3>
                    <p class="avaliacao-texto"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eros justo, 
                    congue id fermentum pharetra, mattis eget sapien. 
                    Duis quis interdum justo. </p>
                    <span class="avaliacao-user"> Nome do usuário </span>
                </div>

                <div class="card-opiniao">
                    <i class="fas fa-star star-1"></i> 
                    <i class="fas fa-star star-2"></i> 
                    <i class="fas fa-star star-3"></i>
                    <i class="fas fa-star star-4"></i>
                    <i class="fas fa-star star-5"></i>
                    <h4 class="avaliacao-titulo"> Comentário principal 3 </h3>
                    <p class="avaliacao-texto"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eros justo, 
                    congue id fermentum pharetra, mattis eget sapien. 
                    Duis quis interdum justo. </p>
                    <span class="avaliacao-user"> Nome do usuário </span>
                </div>

                <a href="#"> Ver mais avaliações </a>
            </div>
        </section>
</div>
</body>
</html>