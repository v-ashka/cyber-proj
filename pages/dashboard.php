<?php
// var_dump($_REQUEST);
// var_dump($_SESSION);
  if(isset($_SESSION['user_data'])){
    $login = $_SESSION['user_data']['login'];
    $role_id = $_SESSION['user_data']['role_id'];
    $user_id = $_SESSION['user_data']['id'];
    
      // change user 2f authentication
      if(isset($_POST['change_auth_settings'])){
        $auth_value = isset($_POST['auth_check']) ? (1):(0);
          $pdo->change_user_auth($user_id, $auth_value);
      };

      // change user password
      if(isset($_POST['user_change_pass'])){
        $old_pass = $_POST['old_pass'];
        $new_pass1 = $_POST['password1'];
        $new_pass2 = $_POST['password2'];
        $pdo->change_user_password($user_id, $old_pass, $new_pass1, $new_pass2);
      }

      // add worker movie

      if(isset($_POST['worker_add_movie'])){
        $title = $_POST['title'];
        $prod_date = $_POST['production_date'];
        $cat = $_POST['category'];
        $img_url = $_POST['image_url'];
        $content = $_POST['movie_content'];

        $pdo->add_movie($user_id, $title, $prod_date, $cat, $img_url, $content);
      }

      // change user account [privilege for admin]
      if($_SESSION['user_data']['role_id'] == 4){
        if(isset($_REQUEST['lockuser_id'])){
          // echo 'lock user: '.$_REQUEST['lockuser_id'];
            $pdo->change_user_status($_REQUEST['lockuser_id'], 0);
        }else if(isset($_REQUEST['unlockuser_id'])){
          // echo 'unlock user: '.$_REQUEST['unlockuser_id'];
            $pdo->change_user_status($_REQUEST['unlockuser_id'], 1);
        }
      }
      


  if(isset($_REQUEST['log'])){
    $pdo->user_logout($user_id);
  }
  }else{
    $pdo->show_no_privileges();
    exit();
  }



?>
<div class="row">
    <div class="col-12 bg-light rounded-4 p-5 mb-4">
      
        <h1>Witaj <?php echo $login ?>!</h1>

        <div class="d-flex">
            <button class="ms-2 btn btn-secondary" data-bs-toggle="modal" data-bs-target="#changepassword">Zmień hasło</button>
            <button class="ms-2 btn btn-secondary" data-bs-toggle="modal" data-bs-target="#changelogin">Zmień sposób autoryzacji konta</button>
            <?php
            
            if($_SESSION['user_data']['role_id'] == 4){
              ?>
            <a href="index.php?page=user_activity" class="ms-2 btn btn-primary">Aktywność użytkowników <i class="bi bi-eye"></i></a>
            <a href="index.php?page=user_logging" class="ms-2 btn btn-primary">Aktywność logowań <i class="bi bi-card-checklist"></i></a>
            <?php
              }
            ?>
        </div>
    </div>

    
    <!-- Modal for change login authentication -->
        <div class="modal fade" id="changelogin" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Zmień sposób autentykacji konta</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="POST">
              <div class="modal-body">
                  <h5>Wyłączenie opcji dwuetapowej weryfikacji konta zmniejsza bezpieczeństwo!</h5>
                  <p>Czy na pewno chcesz logować się za pomocą samego hasła?</p>
                  <input type="checkbox" name="auth_check" <?php $isauth =  ($_SESSION['user_data']['check_validation']==1) ? ('checked'):(''); echo $isauth; ?>>
                  <label for="auth_check">Dwuetapowa weryfikacja konta</label>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cofnij</button>
                  <input type="submit" class="btn btn-primary" name="change_auth_settings" value="Zapisz zmiany"></input>
              </div>
            </form>
            </div>
        </div>
        </div>

            <!-- Modal for change login change password -->
        <div class="modal fade" id="changepassword" tabindex="-1" aria-labelledby="changepasswordLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="changepasswordLabel">Zmień hasło</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="POST">
                    <div class="mb-3">
                        <label for="old-pass" class="form-label">Stare hasło</label>
                        <input type="password" class="form-control" id="old-pass" aria-describedby="oldpass" name="old_pass">
                    </div>
                    <div class="mb-3">
                        <label for="password1" class="form-label">Nowe Hasło</label>
                        <input type="password" class="form-control" name="password1">
                    </div>
                    <div class="mb-3">
                        <label for="password2" class="form-label">Powtórz nowe hasło</label>
                        <input type="password" class="form-control" name="password2">
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cofnij</button>
                <input type="submit" class="btn btn-primary" value="Zmień hasło" name="user_change_pass"></input>
            </div>
              </form>
            </div>
        </div>
        </div>


      <!-- Modal for adding new movie -->
        <div class="modal fade" id="add_movie" tabindex="-1" aria-labelledby="add_movie" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="changepasswordLabel">Dodaj nowy film</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="POST">
                    <div class="mb-3">
                        <label for="title" class="form-label">Tytuł</label>
                        <input type="text" class="form-control" aria-describedby="title" name="title" required>
                    </div>
                    <div class="mb-3">
                        <label for="production_date" class="form-label">Data produkcji</label>
                        <input type="date" class="form-control" name="production_date" required>
                    </div>
                    <div class="mb-3">
                        <label for="category" class="form-label">Kategoria</label>
                        <select name="category" class="form-select-lg" required>
                          <option value="" disabled selected>Wybierz kategorię</option>
                          <option value="action">Akcja</option>
                          <option value="comedy">Komedia</option>
                          <option value="sci-fun">Sci-fun</option>
                          <option value="romance">Romans</option>
                          <option value="adventure">Przygodowy</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="image_url" class="form-label">Zdjęcie okładki (url)</label>
                        <input type="text" class="form-control" name="image_url" required>
                    </div>
                    <div class="mb-3">
                        <label for="movie_content" class="form-label">Opis filmu</label>
                        <textarea class="form-control custom__textarea" name="movie_content" placeholder="Dodaj tutaj treść" required></textarea>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cofnij</button>
                <input type="submit" class="btn btn-primary" value="Dodaj nowy film" name="worker_add_movie"></input>
            </div>
              </form>
            </div>
        </div>
        </div>

  <?php 
  
    if($role_id == 1){
    
  ?>
  <div class="col bg-light rounded-4 p-5 me-5">
    <h1 class="mb-5">Twoje komentarze:</h1>
    <table class="table">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Tekst</th>
        <th scope="col">Opinia</th>
        <th scope="col">Data dodania</th>
        <th scope="col">Oceniany film</th>
        <th scope="col">Akcja</th>
      </tr>
    </thead>
      <tbody>
        <?php 
          $comments = $pdo->show_user_comments($user_id);
          $i=1;
          foreach($comments as $comment):
        ?>
        <tr>
          <th scope="row"><?php echo $i; ?></th>
          <td><?php echo $comment['content']?></td>
          <td><?php echo $comment['score']?></td>
          <td><?php echo $comment['created_at']?></td>
          <td class="d-flex justify-content-between">
            <a href="index.php?page=movie&id=<?php echo $comment['movie_id']?>">
            <p class="me-2"><?php echo $comment['title']?></p>
            <img src="<?php echo $comment['image_url']?>" height="100" alt="<?php echo $comment['title']?>" />
            </a>
          </td>
          <td> 
            <a class="ms-2 btn btn-outline-primary" href="index.php?page=edit_action&comment_id=<?php echo $comment['id']?>">Edytuj <i class="bi bi-pencil"></i></a>
            <a class="ms-2 btn btn-outline-danger" href="index.php?page=delete_action&comment_id=<?php echo $comment['id']?>">Usuń <i class="bi bi-trash"></i></a>
          </td>
        </tr>
        <?php 
          $i++;
          endforeach;
        ?>
      </tbody>
    </table>
  </div>
  <?php 
    }else if($_SESSION['user_data']['role_id'] == 2){
  ?>
  <div class="col bg-light rounded-4 p-5">
        <h1 class="mb-5">Twoje recenzje:</h1>
        <table class="table">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Tytuł</th>
            <th scope="col">Zawartość</th>
            <th scope="col">Opinia</th>
            <th scope="col">Data dodania</th>
            <th scope="col">Oceniany film</th>
            <th scope="col">Akcja</th>
          </tr>
        </thead>
        <tbody>
        <?php 
            $i = 1;
            $reviews = $pdo->show_user_reviews($user_id);
            // var_dump($reviews);
            foreach($reviews as $review):
          ?>
          <tr>
            <th scope="row"><?php echo $i; ?></th>
            <td><?php echo $review['title']?></td>
            <td><?php echo $review['content']?></td>
            <td><?php echo $review['score']?></td>
            <td><?php echo $review['created_at']?></td>
            <td class="d-flex justify-content-between">
              <a href="index.php?page=movie&id=<?php echo $review['movie_id']?>">
              <p class="me-2"><?php echo $review['movie_title']?></p>
              <img src="<?php echo $review['image_url']?>" height="100" alt="<?php echo $review['movie_title']?>" />
              </a>
            </td>
            <td> 
              <a class="ms-2 btn btn-outline-primary" href="index.php?page=edit_action&review_id=<?php echo $review['id']?>">Edytuj <i class="bi bi-pencil"></i></a>
              <a class="ms-2 btn btn-outline-danger" href="index.php?page=delete_action&review_id=<?php echo $review['id']?>">Usuń <i class="bi bi-trash"></i></a>
            </td>
          </tr>
        <?php 
          $i++;
          endforeach;
        ?>
        </tbody>
      </table>
  </div>
  <?php 
    }else if($_SESSION['user_data']['role_id'] == 3){
  ?>
      <div class="col bg-light rounded-4 p-5">
        <h1 class="mb-5">Dodane filmy:</h1>
        <div class="d-flex mb-5">
            <button class="ms-2 btn btn-success" data-bs-toggle="modal" data-bs-target="#add_movie">Dodaj nowy film <i class="bi bi-plus"></i></button>
        </div>
        <table class="table">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Tytuł</th>
            <th scope="col">Data produkcji</th>
            <th scope="col">Opis</th>
            <th scope="col">Kategoria filmu</th>
            <th scope="col">Zdjęcie podglądowe</th>
            <th scope="col">Akcja</th>
          </tr>
        </thead>
        <tbody>
        <?php 
            $i = 1;
            $movies = $pdo->show_worker_movies($user_id);
            // var_dump($reviews);
            foreach($movies as $movie):
          ?>
          <tr>
            <th scope="row"><?php echo $i; ?></th>
            <td><?php echo $movie['title']?></td>
            <td><?php echo substr($movie['production_date'],0,10)?></td>
            <td><?php echo $movie['desc']?></td>
            <td><?php echo $movie['type']?></td>
            <td class="d-flex justify-content-between">
              <img src="<?php echo $movie['image_url']?>" height="100" alt="<?php echo $movie['title']?>" />
            </td>
            <td> 
              <a class="ms-2 btn btn-outline-primary" href="index.php?page=edit_action&movie_id=<?php echo $movie['id']?>">Edytuj <i class="bi bi-pencil"></i></a>
              <a class="ms-2 btn btn-outline-danger" href="index.php?page=delete_action&movie_id=<?php echo $movie['id']?>">Usuń <i class="bi bi-trash"></i></a>
            </td>
          </tr>
        <?php 
          $i++;
          endforeach;
        ?>
        </tbody>
      </table>
  </div>
  <?php 
    }else if($_SESSION['user_data']['role_id'] == 4){
  ?>
    <div class="row">
        <div class="col-sm-6 bg-light rounded-4 p-5">
          <h1>Domyślne role w systemie</h1>
            <table class="table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Nazwa roli</th>
              <th scope="col">Opis roli</th>
              <th scope="col">Czy aktywna</th>
              <th scope="col">Ostatnio utworzona</th>
              <th scope="col">Akcja</th>
            </tr>
          </thead>
          <tbody>
          <?php 
            $i = 1;
            $roles = $pdo->get_roles_in_system($user_id);

            foreach($roles as $role):
          ?>
          <tr>
            <th scope="row"><?php echo $i; ?></th>
            <td><?php echo $role['title']?></td>
            <td><?php echo $role['description']?></td>
            <td><?php echo $role['active']?></td>
            <td><?php echo $role['createdAt']?></td>
          </tr>
        <?php 
          $i++;
          endforeach;
        ?>
        </tbody>
      </table>
        </div>
        <div class="col-sm-6 bg-light rounded-4 p-5">
          <h1>Domyślne uprawnienia w systemie</h1>
          <table class="table">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Nazwa roli</th>
                <th scope="col">Opis roli</th>
                <th scope="col">Czy aktywna</th>
                <th scope="col">Ostatnio utworzona</th>
                <th scope="col">Akcja</th>
              </tr>
            </thead>
            <tbody>
          <?php 
            $i = 1;
            $privileges = $pdo->get_privileges_in_system($user_id);

            foreach($privileges as $privilege):
          ?>
            <tr>
                <th scope="row"><?php echo $i; ?></th>
                <td><?php echo $privilege['title']?></td>
                <td><?php echo $privilege['description']?></td>
                <td><?php echo $privilege['active']?></td>
                <td><?php echo $privilege['createdAt']?></td>
              </tr>
            <?php 
              $i++;
              endforeach;
            ?>
            </tbody>
          </table>
        </div>
    </div>
    <div class="row mt-5">
        <!-- change user role -->
        <div class="col-sm-12 bg-light rounded-4 p-5">
            <h1>Zarządzaj użytkownikami</h1>
            <table class="table">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Nazwa użytkownika</th>
                <th scope="col">Email</th>
                <th scope="col">Czas blokady konta</th>
                <th scope="col">Czy konto jest aktywne</th>
                <th scope="col">Weryfikacja dwuetapowa</th>
                <th scope="col">Rola w systemie</th>
                <th scope="col">Akcja</th>
              </tr>
            </thead>
            <tbody>
            <?php 
              $i=1;
              $users_role = $pdo->show_users_roles($user_id);
              foreach($users_role as $user_role):
            ?>
            <tr>
                <th scope="row"><?php echo $i; ?></th>
                <td><?php echo $user_role['login']?></td>
                <td><?php echo $user_role['email']?></td>
                <td><?php $check = $user_role['lockout_time'] == null ? ('---'):($user_role['lockout_time']); echo $check;?></td>
                <td><?php $isActive = $user_role['id_status'] ? ('Aktywne'):('Nieaktywne'); echo $isActive;?></td>
                <td><?php $isActive = $user_role['check_validation'] ? ('TAK'):('NIE'); echo $isActive;?></td>
                <td><?php echo $user_role['title']?></td>
                <td> 
                  <a class="ms-2 btn btn-outline-primary" href="index.php?page=edit_action&user_id=<?php echo $user_role['id']?>">Edytuj uprawnienia <i class="bi bi-pencil"></i></a>
                  <?php 
                    if($user_role['id_status'] == 1){
                  ?>
                  <a class="ms-2 btn btn-outline-danger" href="index.php?page=dashboard&lockuser_id=<?php echo $user_role['id']?>">Zablokuj konto <i class="bi bi-lock-fill"></i></a>
                  <?php 
                    }else{
                      ?>
                      <a class="ms-2 btn btn-outline-success" href="index.php?page=dashboard&unlockuser_id=<?php echo $user_role['id']?>">Odblokuj konto <i class="bi bi-unlock-fill"></i></a>
                      <?php
                    } 
                  ?>
                </td>
              </tr>
            <?php 
              $i++;
              endforeach;
            ?>
            </tbody>
          </table>
        </div>
    </div>
    <?php 
    }
    ?>
</div>