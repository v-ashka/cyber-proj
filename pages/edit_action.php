<?php 
    if($_REQUEST['page'] == 'edit_action'){            
        // var_dump($_REQUEST['review_id'] ?? $_REQUEST['comment_id'] ?? $_REQUEST['movie_id']);
        $pdo->check_user_have_access($_SESSION['user_data']['login'], ($_REQUEST['review_id'] ?? $_REQUEST['comment_id'] ?? $_REQUEST['movie_id'] ?? $_REQUEST['user_id']));
    }
    // var_dump($_SESSION);
    // var_dump($_REQUEST);
     if(isset($_REQUEST['modify_comment'])){
                $user_id = $_SESSION['user_data']['id'];
                $content = $_REQUEST['comment_content'];
                $score = $_REQUEST['score'];
                $comment_id = $_REQUEST['comment_id'];

                $pdo->modify_comment($comment_id, $content, $score);
    }

    if(isset($_REQUEST['modify_review'])){
        $user_id = $_SESSION['user_data']['id'];
        $title = $_REQUEST['title'];
        $content = $_REQUEST['review_content'];
        $score= $_REQUEST['score'];
        $review_id = $_REQUEST['review_id'];

        $pdo->modify_review($review_id, $title, $content, $score); 
    }

    if(isset($_REQUEST['modify_movie'])){
        $user_id = $_SESSION['user_data']['id'];
        $title = $_REQUEST['title'];
        $content = $_REQUEST['movie_content'];
        $production_date = $_REQUEST['movie_production_date'];
        $category = $_REQUEST['movie_category'];
        $movie_id = $_REQUEST['movie_id'];
        $image_url = $_REQUEST['image_url'];

        $pdo->modify_movie($movie_id, $title, $content, $production_date, $category, $image_url);
    }

    if(isset($_REQUEST['change_user_role']) && $_SESSION['user_data']['role_id'] == 4){
        if(isset($_REQUEST['user_validation']) || isset($_REQUEST['user_role']) || isset($_REQUEST['unlock_account'])){
            $user_validation_option = $_REQUEST['user_validation'] ?? null;
            $user_role = $_REQUEST['user_role'] ?? null;
            $user_to_modify_id = $_REQUEST['user_id'];
            $user_unlock_account = isset($_REQUEST['unlock_account']);

            $pdo->modify_user_role($user_to_modify_id, $user_role, $user_validation_option, $_SESSION['user_data']['id'], $user_unlock_account);
        }
    }

?>
<div class="row bg-light rounded-4 p-4">
    <?php 
        if(isset($_SESSION['user_data']) && ($_SESSION['user_data']['role_id'] == 1) && isset($_REQUEST['comment_id'])){
            $record = $pdo->get_user_comment($_REQUEST['comment_id'], $_SESSION['user_data']['id']);
            // var_dump($record);
            //var_dump($_REQUEST['comment_id'], $_SESSION['user_data']['id']);
    ?>
    <section> 
        <h1>Zmodyfikuj komentarz</h1>
    </section>
        <div class="col mt-5"> 
            <div class="card">
                <div class="card-body">
                    <form method="POST">
                        <div class="row g-3">
                            <div class="col-sm-1">
                                <div class="form-floating">
                                    <input class="form-control" id="floatingNumberInput" type="number" id="score" name="score" min="1.00" max="10.00" step="0.1" required value="<?php echo $record['score'] ?>">
                                    <label for="floatingNumberInput">Ocena</label>
                                </div>
                            </div>
                            <div class="col-sm-11">
                                <div class="form-floating">
                                    <textarea class="form-control custom__textarea" placeholder="Dodaj komentarz" id="floatingTextarea" required name="comment_content"
                                    ><?php echo $record['content']?></textarea>
                                    <label for="floatingTextarea">Treść</label>
                                </div>
                            </div>
                            <div class="col" style="text-align: right;">
                                <input type="submit" class="btn btn-primary" name="modify_comment" value="Modyfikuj komentarz"></input>
                            </div>
                        </div>
                    </form>
                </div>
            </div>    
        </div>
<?php 
    }else if(isset($_REQUEST['review_id']) && isset($_SESSION['user_data']) && ($_SESSION['user_data']['role_id'] == 2)) {
        $review_id = $_REQUEST['review_id'];
        $record = $pdo->get_user_review($review_id, $_SESSION['user_data']['id']);
    ?>
        <section> 
        <h1>Zmodyfikuj recenzję</h1>
    </section>
        <div class="col mt-5"> 
            <div class="card">
                <div class="card-body">
                    <form method="POST">
                        <div class="row g-3">
                             <div class="col-sm-12">
                                <div class="form-floating">
                                    <input class="form-control" id="floatingNumberInput" type="text" id="title" name="title" required value="<?php echo $record['title'] ?>">
                                    <label for="floatingNumberInput">Tytuł</label>
                                </div>
                            </div>
                            <div class="col-sm-1">
                                <div class="form-floating">
                                    <input class="form-control" id="floatingNumberInput" type="number" id="score" name="score" min="1.00" max="10.00" step="0.1" required value="<?php echo $record['score'] ?>">
                                    <label for="floatingNumberInput">Ocena</label>
                                </div>
                            </div>
                            <div class="col-sm-11">
                                <div class="form-floating">
                                    <textarea class="form-control custom__textarea" placeholder="Dodaj recenzję" id="floatingTextarea" required name="review_content"
                                    ><?php echo $record['content']?></textarea>
                                    <label for="floatingTextarea">Treść</label>
                                </div>
                            </div>
                            <div class="col" style="text-align: right;">
                                <input type="submit" class="btn btn-primary" name="modify_review" value="Modyfikuj recenzję"></input>
                            </div>
                        </div>
                    </form>
                </div>
            </div>    
        </div>
    <?php
    }else if(isset($_REQUEST['movie_id']) && isset($_SESSION['user_data']) && ($_SESSION['user_data']['role_id'] == 3)) {
        $movie_id = $_REQUEST['movie_id'];
        $record = $pdo->get_worker_movie($movie_id, $_SESSION['user_data']['id']);
    
    ?>
            <section> 
        <h1>Zmodyfikuj film</h1>
    </section>
        <div class="col mt-5"> 
            <div class="card">
                <div class="card-body">
                    <form method="POST">
                        <div class="row g-3">
                             <div class="col-sm-12">
                                <div class="form-floating">
                                    <input class="form-control" id="floatingNumberInput" type="text" id="title" name="title" required value="<?php echo $record['title'] ?>">
                                    <label for="floatingNumberInput">Tytuł</label>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-floating">
                                    <input type="date" class="form-control production_date" placeholder="Data produkcji..." id="floatingTextarea" required name="movie_production_date" value="<?php echo substr($record['production_date'], 0, 10)?>">
                                    <label for="floatingTextarea">Data produkcji</label>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-floating">
                                    <input type="text" class="form-control production_date" placeholder="Url zdjęcia" id="floatingImg" required name="image_url" value="<?php echo $record['image_url']?>">
                                    <label for="floatingImg">Url zdjęcia</label>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-floating">
                                    <select class="form-select-lg" aria-label="Default select example" id="floatingSelect" placeholder="Wybierz kategorie" name="movie_category">   
                                        <option value="" disabled selected>Wybierz kategorię</option>
                                        <option value="action" <?php $selectCat = $record['type']=='action' ?('selected'):(''); echo $selectCat ?>>Akcja</option>
                                        <option value="comedy" <?php $selectCat = $record['type']=='comedy' ?('selected'):(''); echo $selectCat ?>>Komedia</option>
                                        <option value="sci-fun" <?php $selectCat = $record['type']=='sci-fun' ?('selected'):(''); echo $selectCat ?>>Sci-fun</option>
                                        <option value="romance" <?php $selectCat = $record['type']=='romance' ?('selected'):(''); echo $selectCat ?>>Romans</option>
                                        <option value="adventure" <?php $selectCat = $record['type']=='adventure' ?('selected'):(''); echo $selectCat ?>>Przygodowy</option>
                                    </select>
                  
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-floating">
                                    <textarea class="form-control custom__textarea" placeholder="Dodaj recenzję" id="floatingTextarea" required name="movie_content"
                                    ><?php echo $record['desc']?></textarea>
                                    <label for="floatingTextarea">Treść</label>
                                </div>
                            </div>
                            <div class="col" style="text-align: right;">
                                <input type="submit" class="btn btn-primary" name="modify_movie" value="Modyfikuj film"></input>
                            </div>
                        </div>
                    </form>
                </div>
            </div>    
        </div>
    <?php 
    }else if(isset($_REQUEST['user_id']) && isset($_SESSION['user_data']) && ($_SESSION['user_data']['role_id'] == 4)){    
        $user_id = $_REQUEST['user_id'];

        if(isset($_POST['delete_record'])){
            $pdo->delete_from_db($_POST['delete_record'], $user_id);
        }
    ?>
        <section> 
            <h1>Zmodyfikuj uprawnienia użytkownika</h1>
        </section>
        <form method="POST">
        <table class="table col mt-5">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Nazwa użytkownika</th>
                <th scope="col">Email</th>
                <th scope="col">Czas blokady konta</th>
                <th scope="col">Czy konto jest aktywne</th>
                <th scope="col">Weryfikacja dwuetapowa</th>
                <th scope="col">Rola w systemie</th>
              </tr>
            </thead>
            <tbody>
            <?php 
              $i=1;
              $record = $pdo->get_user_role($user_id, $_SESSION['user_data']['id']);
            ?>
            <tr>
                <th scope="row"><?php echo $i; ?></th>
                <td><?php echo $record['login']?></td>
                <td><?php echo $record['email']?></td>
                <td>
                    <?php $check = $record['lockout_time'] == null ? ('---'):($record['lockout_time']); echo $check;
                    ?>
                    <?php 
                        $user_block_check  = $record['lockout_time'] != null ? ('
                        <fieldset>
                        <label for="unlock_account">Odblokuj konto</label>
                        <input type="checkbox" name="unlock_account">
                    </fieldset>
                    '):('');
                    echo $user_block_check;
                    ?>
                </td>
                <td><?php $isActive = $record['id_status'] ? ('Aktywne'):('Nieaktywne'); echo $isActive;?></td>
                <td>
                    <select class="form-select-lg" name="user_validation">  
                        <option value="" disabled selected>Aktualny stan: <?php $isActive = $record['check_validation'] ? ('TAK'):('NIE'); echo $isActive;?></option>
                        <option value="1">TAK</option>
                        <option value="0">NIE</option>
                    </select>
                </td>
                <td>
                    
                    <select class="form-select-lg" placeholder="Wybierz kategorie" name="user_role">   
                        <option value="" disabled selected>Aktualna rola: <?php echo $record['title']?></option>
                         <?php $options = $pdo->get_roles_in_system($_SESSION['user_data']['id']);
                            foreach($options as $option):    
                         ?>
                            <option value="<?php echo $option['id']?>"><?php echo $option['title']?></option>
                            <?php endforeach; ?>
                    </select>
                </td>
              </tr>
            </tbody>
          </table>
          <input type="submit" class="btn btn-primary" value="Zapisz zmiany" name="change_user_role">
        </form>
</div>
    <div class="row bg-light rounded-4 p-4">
                <div class="col mt-5">
                  <section> 
            <h1>Publikacje użytkownika</h1>
        </section>
        <table class="table col mt-5">
            <?php 
               
              $i=1;
              $records = $pdo->get_user_content($user_id);

              if(count($records)==0){
                echo 'Użytkownik jeszcze nic nie dodał na stronie';
                exit();
              }
            //   var_dump(array_key_exists('title', $records[0]));
                $title = array_key_exists('title', $records[0]);
                $content = array_key_exists('content', $records[0]);
                $score = array_key_exists('score', $records[0]);
                // vars for movie
                $img_url = array_key_exists('image_url', $records[0]);
                $type = array_key_exists('type', $records[0]);
                $production_date = array_key_exists('production_date', $records[0]);
                $deleted = array_key_exists('deleted', $records[0]);

                //headers for table
                $title = $title ? ('Tytuł'):('');
                $content = $content ? ('Opis'):('');
                $score = $score ? ('Ocena'):('');
                $img_url = $img_url ? ('Zdjęcie'):('');
                $type= $type ? ('Kategoria'):('');
                $production_date = $production_date ? ('Data produkcji'):('');
                $deleted = $deleted ? ('Czy usunięty?'):('');


                $th_arr = array();
                array_push($th_arr, $title, $content, $score, $img_url, $type, $production_date, $deleted);

            ?>
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Nazwa użytkownika</th>
                <?php   
                foreach($th_arr as $arr){
                    if(strlen($arr)>1){
                ?>
                <th scope="col"><?php echo $arr; ?></th>
                <?php 
                    }
                }
                ?>
                <th scope="col">Akcja</th>
              </tr>
            </thead>
            <tbody>
         <?php 
              foreach($records as $record):
                 //headers for table
                $title = $title ? ($record['title']):('');
                $content = $content ? ($record['content']):('');
                $score = $score ? ($record['score']):('');
                $img_url = $img_url ? ($record['image_url']):('');
                $type= $type ? ($record['type']):('');
                $production_date = $production_date ? ($record['production_date']):('');
                $deleted = $deleted ? ($record['deleted']):('');

                $deleted = $deleted ? ('TAK'):('NIE');
                $img_url = strlen($img_url) > 0 ? ('<img src="'.$img_url.'" style="width: 100px" />'):('');
                $td_arr = array();
                array_push($td_arr, $title, $content, $score, $img_url, $type, $production_date, $deleted);
                // var_dump($td_arr);
            ?>
            <form method="POST">
            <tr>
                <th scope="row"><?php echo $i; ?></th>
                <th scope="row"><?php echo $record['login']; ?></th>
            <?php   
                foreach($td_arr as $arr){
                    if(strlen($arr)>=1){
                ?>
                <td><?php echo $arr; ?></td>
                <?php 
                    }
                }
                ?>
                <td>
                    <button class="btn btn-danger" type="submit" value="<?php echo $record['id']; ?>" name="delete_record">Usuń trwale</button>
                </td>
            </tr>
            </form>
              <?php 
            endforeach;
              ?>
            </tbody>
          </table>
        </div>
    </div>
    <?php 
        }
    ?>
