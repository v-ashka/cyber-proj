<?php   
    // var_dump($_SESSION);
    if($_REQUEST['page'] == 'delete_action'){            
        // var_dump($_REQUEST['review_id'] ?? $_REQUEST['comment_id'] ?? $_REQUEST['movie_id']);
        $pdo->check_user_have_access($_SESSION['user_data']['login'], ($_REQUEST['review_id'] ?? $_REQUEST['comment_id'] ?? $_REQUEST['movie_id']));
    }

        if(isset($_REQUEST['delete_record'])){
            $user_id = $_SESSION['user_data']['id'];
            $user_role = $_SESSION['user_data']['role_id'];
            $object_id = $_REQUEST['comment_id'] ?? $_REQUEST['review_id'] ?? $_REQUEST['movie_id'];

            $pdo->delete_record($user_id, $user_role, $object_id);
        }
    ?>
<div class="row">

    <div class="col">
        <section class="mb-5">
            <h1 class="mt-5" >Uwaga!</h1>
            <p>Zamierzasz usunąć następujący rekord:</p>
        </section>
    </div>
    <div class="col">
        <?php 
            if(isset($_SESSION['user_data']) && ($_SESSION['user_data']['role_id'] == 1) && isset($_REQUEST['comment_id'])){
                $userdata = $pdo->get_user_comment($_REQUEST['comment_id'], $_SESSION['user_data']['id']);
        ?>
        <form method="POST" class="bg-light p-5 rounded form__input">
            <div class="mb-3">
                <p>Autor:<span style="font-weight: bold;">  <?php echo $_SESSION['user_data']['login']?> </span></p>
            </div>
            <div class="mb-3">
                <p>Treść posta:<span style="font-weight: bold;"> <?php echo $userdata['content']?></span></p>
            </div>
            <div class="mb-3">
                <p>Ocena: <span style="font-weight: bold;"><?php echo $userdata['score']?></span></p>
            </div>
            <button type="submit" class="btn btn-danger" name="delete_record">Usuń rekord</button>
        </form>
        <?php 
            }else if(isset($_SESSION['user_data']) && ($_SESSION['user_data']['role_id'] == 2) && isset($_REQUEST['review_id'])){
                $userdata = $pdo->get_user_review($_REQUEST['review_id'], $_SESSION['user_data']['id']);
        ?>
        <form method="POST" class="bg-light p-5 rounded form__input">
            <div class="mb-3">
                <p>Autor:<span style="font-weight: bold;">  <?php echo $_SESSION['user_data']['login']?> </span></p>
            </div>
            <div class="mb-3">
                <p>Tytuł recenzji:<span style="font-weight: bold;"> <?php echo $userdata['title']?></span></p>
            </div>
            <div class="mb-3">
                <p>Treść recenzji:<span style="font-weight: bold;"> <?php echo $userdata['content']?></span></p>
            </div>
            <div class="mb-3">
                <p>Ocena: <span style="font-weight: bold;"><?php echo $userdata['score']?></span></p>
            </div>
            <button type="submit" class="btn btn-danger" name="delete_record">Usuń rekord</button>
        </form>
        <?php
            }else if(isset($_SESSION['user_data']) && ($_SESSION['user_data']['role_id'] == 3) && isset($_REQUEST['movie_id'])){
                $userdata = $pdo->get_worker_movie($_REQUEST['movie_id'], $_SESSION['user_data']['id']);
        ?>
                <form method="POST" class="bg-light p-5 rounded form__input">
            <div class="mb-3">
                <p>Autor:<span style="font-weight: bold;">  <?php echo $_SESSION['user_data']['login']?> </span></p>
            </div>
            <div class="mb-3">
                <p>Tytuł filmu:<span style="font-weight: bold;"> <?php echo $userdata['title']?></span></p>
            </div>
            <div class="mb-3">
                <p>Data produkcji: <span style="font-weight: bold;"><?php echo $userdata['production_date']?></span></p>
            </div>
            <div class="mb-3">
                <p>Kategoria filmu: <span style="font-weight: bold;"><?php echo $userdata['type']?></span></p>
            </div>
            <div class="mb-3">
                <p>Opis:<span style="font-weight: bold;"> <?php echo $userdata['desc']?></span></p>
            </div>
            
            <div class="mb-3">
                <p>Zdjęcie podglądowe: <img width=100 src="<?php echo $userdata['image_url']?>" alt="<?php echo $userdata['title']?>"></p>
            </div>
            <button type="submit" class="btn btn-danger" name="delete_record">Usuń rekord</button>
        </form>
        <?php 
            }
        ?>
    </div>
</div>