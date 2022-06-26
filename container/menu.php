<html>
    <head>
        <title><?php echo $GLOBALS['WEB_TITLE']?></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">      
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="./styles/style.css">
    </head>
    <body>
        <nav class="navbar navbar-dark navbar-expand-lg bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.php"><?php echo $GLOBALS['WEB_TITLE'] ?></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <!-- <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.php">Home</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                    </li> -->
                </ul>
                <form class="d-flex  mb-2 mb-lg-0 me-4" role="search" method="POST" action="index.php?page=search">
                    <input class="form-control me-2" type="search" placeholder="Wyszukaj film.." aria-label="Search" name="search_value">
                    <input class="btn btn-success" type="submit" value="Szukaj"></input>
                </form>
                <div class="d-flex">
                    <?php             
                        // var_dump(count($_SESSION['user_data']));        
                        if(isset($_SESSION['user_data'])){
                            // $pdo->check_user_session();
                            echo '
                            <a class="btn btn-secondary  me-2" href="index.php?page=dashboard">Panel użytkownika</a>
                            <a class="btn btn-primary" href="index.php?page=dashboard&log=1">Wyloguj się</a>
                            ';
                        }else{
                            echo '
                            <a class="btn btn-secondary  me-2" href="index.php?page=login">Zaloguj się</a>
                            <a class="btn btn-primary" href="index.php?page=register">Zarejestruj się</a>
                            ';
                        }
                    ?>
                    
                </div>
            </div>
        </div>
    </nav>
    <div class="container">