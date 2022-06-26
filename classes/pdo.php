<?php 
require './lib/htmlpurifier-4.14.0/library/HTMLPurifier.auto.php';
include_once "filter.php";
include_once 'aes.php';
include_once 'Mailer.php';


class Pdo_{
    public $db;
    public $session_time = 500;
    private $purifier;
    private $config;
    public function __construct(){
        $this->config = HTMLPurifier_Config::createDefault();
        $this->purifier = new HTMLPurifier($this->config);
        try{
            //Get Heroku ClearDB connection information
            $cleardb_url = parse_url(getenv("JAWSDB_URL"));
            $cleardb_server = $cleardb_url["host"];
            $cleardb_username = $cleardb_url["user"];
            $cleardb_password = $cleardb_url["pass"];
            $cleardb_db = substr($cleardb_url["path"],1);
            $active_group = 'default';
            $query_builder = TRUE;

            $dsn = "mysql:dbname={$cleardb_db};host={$cleardb_server}";
            $user = $cleardb_username;
            $password = $cleardb_password;

            $this->db = new PDO($dsn, $user, $password);
        }
        catch(PDOException $e){
            echo("Error: Can't connect to database
            <br> <br>
            ".$e);
            die();
        }
    }

    public function loadMoviesFromDb(){
        $sql = "SELECT * from movies WHERE deleted=0 ORDER BY created_at DESC";
        $query = $this->db->prepare($sql);
        $query->execute();
        $data = $query->fetchAll();
        // var_dump($data);
        return $data;
    }

    public function getMovieInfo($id){
        $id = Filter::addName($id);

        $sql = "SELECT * FROM movies WHERE deleted=0 and id=:id";
        $query = $this->db->prepare($sql);
        $query->execute(['id' => $id]);
        $data = $query->fetch();
        // var_dump($data);
        if($data){
            return $data;
        }else{
            header('Location: index.php?page=404');
        }

    }

    public function getMovieReviews($id){
        $id = Filter::addName($id);

        $sql = "SELECT u.login, r.title, r.content, r.score, r.like_count, r.created_at, r.id FROM movies m INNER JOIN reviews r ON r.movies_id=m.id INNER JOIN user u ON u.id=r.user_id WHERE m.id=:id AND r.deleted=0";
        $query = $this->db->prepare($sql);
        $query->execute(['id' => $id]);
        $data = $query->fetchAll();
        return $data;
    }

    public function getMovieComments($id){
        $id = Filter::addName($id);

        $sql = "SELECT co.content, co.created_at, co.score, u.login, co.like_cnt, co.id FROM comments co INNER JOIN user u ON u.id=co.user_id WHERE co.movies_id=:movie_id AND co.deleted=0";
        $query = $this->db->prepare($sql);
        $query->execute(['movie_id'=>$id]);
        $data = $query->fetchAll();
        return $data;
    }

    public function searchAndShowMovie($search_value){
        $search_value = $this->purifier->purify($search_value);
        $search_value = Filter::addName($search_value);

        $sql = "SELECT * FROM movies WHERE title LIKE :search_value AND deleted=0";
        $query = $this->db->prepare($sql);
        $query->execute(['search_value'=> "%".$search_value."%"]);
        $data = $query->fetchAll();
        return $data;
    }

    // / error handler function

    public function displayError($err_message){
        echo $err_message;
    }

    public function displayFeedback($feed_message){
        echo $feed_message;
    }

    ////////////////////////////////////////////////
    // user actions - register/login/change password
    ////////////////////////////////////////////////

    public function register_user($login, $email, $password, $repeat_password){
        // var_dump(new Aes());
        $aes = new Aes();
        var_dump('aes test');

        var_dump($aes);
        $login = $this->purifier->purify($login);
        $email = $this->purifier->purify($email);
        var_dump('after aes ');
        var_dump($login, $email);

        $sql = "SELECT login FROM user WHERE login=:login";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['login'=>$login]);

        var_dump($stmt);
        if((strlen($login) == 0 || strlen($email) == 0 || strlen($email) == 0 || strlen($email) == 0)){
            $this->displayError("Wystąpił błąd: Podano niepełne dane!");
            return false;
        }

        if($stmt->fetch()){
            $this->displayError("Wystąpił błąd: Podany użytkownik już istnieje!");
        }
        else{      
            if($password != $repeat_password){
                $this->displayError('Wystapil błąd: Podane hasła nie zgadzają się!');
            }else{
                //generate SALT for pass
                $salt = random_bytes(16);
                //hash password with salt
                $password = hash('sha512', $password.$salt);
                $password = $aes->encrypt($password);
                try{
                    $sql = "INSERT INTO user (`role_id`, `login`, `email`, `hash`, `salt`, `id_status`, `check_validation`) VALUES (:role_id, :login, :email, :hash, :salt, :id_status, :check_vali)";

                    $data = [
                        'role_id' => 1,
                        'login' => $login,
                        'email' => $email,
                        'hash' => $password,
                        'salt' => $salt,
                        'id_status' => 1,
                        'check_vali' => 0
                    ];
                    $this->db->prepare($sql)->execute($data);
                    session_unset();
                    header("Location: index.php?page=login&reg=1");
                    exit();
            
                } 
                catch(Exception $e){
                    print 'Wystąpił błąd: ' . $e->getMessage();
                }
            }
        }
    }

    public function get_user_data($id){
        $sql = "SELECT id, role_id, login, email, hash, check_validation, id_status FROM user WHERE id=:id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(["id"=>$id]);
        $data = $stmt->fetch();

        return $data;
    }

    public function login_user($login, $pass){
        $aes = new Aes();
            $login = $this->purifier->purify($login);
        try{
            $sql = "SELECT id, role_id, login, email, hash, salt, lockout_time, email_code, check_validation, id_status FROM user WHERE login=:login";

            $stmt = $this->db->prepare($sql);
            $stmt->execute(['login'=>$login]);
            $user_data = $stmt->fetch();
            //    var_dump($user_data);
            if($user_data == false){
                $this->displayError("Nie znaleziono podanego użytkownika!");
                return false;
            }
         
            
            // generate password
            $pass = hash('sha512', $pass.$user_data['salt']);
            $pass = $aes->encrypt($pass);
            // compare password with hash in db
        
            if( $pass == $user_data['hash']){
                // first time logging or user defined this option
                //before check valid, check if user have unlocked account
                if($user_data['id_status'] == 1){
                        
                    if($user_data ['check_validation'] == 1){
                        // var_dump('validation test 1 true');
                        $otp = random_int(100000, 999999);
                        $code_lifetime = date('Y-m-d H:i:s', time() + 300);
                        $m = new Mailer();
                        // var_dump($user_data['email']);
                        $m->send_email($user_data['email'], $otp);
                        try{
                            $sql = "UPDATE user SET `email_code`=:email_code, `code_lifetime`=:code_lifetime WHERE login=:login";

                            $data = [
                                'login' => $login,
                                'email_code' => $otp,
                                'code_lifetime' => $code_lifetime,
                            ];

                            $this->db->prepare($sql)->execute($data);

                            $tmp_valid_data=[
                                'session_valid_step1' => true, 
                                'user_id'=>$user_data['id'],
                                'login'=>$user_data['login']
                            ];

                            $_SESSION['validation_step1'] = $tmp_valid_data;
                            
                            // data sent to user 
                            header('Location: index.php?page=login_valid');
                            exit();
                        }catch(Exception $e){
                            print 'Wystąpił błąd weryfikacji dwuetapowej: '.$e->getMessage();
                        }
                    }else{
                        session_unset();
                        $_SESSION['user_data'] = $this->get_user_data($user_data['id']);
                        $this->register_user_login($user_data['id'], $_SERVER['REMOTE_ADDR'], 1, NULL, 0);
                        $this->start_counting_session();
                        $this->check_user_incorrect_logins(1, $user_data['id']);
                        header('Location: index.php?page=dashboard');
                        exit();
                    }
                }else{
                    $this->displayError(
                        '<h1>Twoje konto zostało zablokowane</h1>
                        <p>W celu zdjęcia blokady skontakuj się z administratorem.</p>'
                    );
                    exit();
                }
            }else{
                $this->displayError("Wprowadzono nieprawidłowe hasło!");
                $this->register_user_login($user_data['id'], $_SERVER['REMOTE_ADDR'], 0, NULL, 0);
                $this->check_user_incorrect_logins(0, $user_data['id']);
            }
        }catch(Exception $e){
            print 'Wystapił błąd: '.$e->getMessage();
        }
    }

    public function start_counting_session(){
        $_SESSION['user_data']['sess_start'] = time();
        $_SESSION['user_data']['sess_expire'] = $_SESSION['user_data']['sess_start'] + $this->session_time;
    }

    public function authorize_user($id, $code){
        // var_dump('authorize test');
        $sql = "SELECT id, email_code FROM user WHERE id=:id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['id'=>$id]);
        $data = $stmt->fetch();
            if($data['email_code'] == $code){
                // get user all data
                session_unset();
                // var_dump('test after success code');
                // var_dump('data id');
                // var_dump($data['id']);
                // var_dump($data);
                $_SESSION['user_data'] = $this->get_user_data($data['id']);
                // var_dump('test after user_data');

                $this->register_user_login($data['id'], $_SERVER['REMOTE_ADDR'], 1, NULL, 0);
                $this->check_user_incorrect_logins(1, $data['id']);
                $this->start_counting_session();
                header('Location: index.php?page=dashboard');
                exit();
            }else{
                $this->displayError("Wprowadzono niepoprawny kod!");
                 $this->register_user_login($data['id'], $_SERVER['REMOTE_ADDR'], 0, NULL, 0);
                 $this->check_user_incorrect_logins(0, $data['id']);
            }
    }

    public function user_logout($user_id){
        session_unset();
        $this->register_user_login($user_id, $_SERVER['REMOTE_ADDR'], 1, NULL, 1);
        header('Location: index.php');
        exit();
    }

    public function lastAddedId($table_name){
        $table_name = $this->purifier->purify($table_name);
        $sql = "SELECT id FROM ".$table_name." ORDER BY id DESC LIMIT 1";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $data = $stmt->fetch();
        return $data;
    }

    // get specified content from defined table and id of record
    public function get_content($table_name, $content_id){
        $table_name = $this->purifier->purify($table_name);
        $sql = "SELECT * FROM ".$table_name." WHERE id=:content_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['content_id' => $content_id]);

        $data = $stmt->fetch();
        return $data;
    }


    // change user auth
    public function change_user_auth($user_id, $auth_value){
        // print('test '.$user_id.' '.$auth_value);
        $sql = "UPDATE user SET check_validation=:check_val WHERE id=:user_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([
            'check_val' => $auth_value,
            'user_id' => $user_id
        ]);
        $_SESSION['user_data']['check_validation'] = $auth_value;
        $this->displayFeedback('Sposób autentykacji został zmieniony!');
    }

    // change user password
    public function change_user_password($user_id, $old_pass, $new_pass1, $new_pass2){
        $aes = new Aes();

        if($new_pass1 != $new_pass2){
            $this->displayError('Nowe hasła nie są takie same!');
            return false;
        }else{
            $sql = "SELECT hash, salt FROM user WHERE id=:user_id";
            $stmt = $this->db->prepare($sql);
            $stmt->execute([
                'user_id'=>$user_id,
            ]);
            $data = $stmt->fetch();
            
            // check old pass
            $old_pass = hash('sha512', $old_pass.$data['salt']);
            $old_pass = $aes->encrypt($old_pass);

            if($old_pass == $data['hash']){
                $newSalt = random_bytes(16);
                $new_password = hash('sha512', $new_pass1.$newSalt);

                $new_password = $aes->encrypt($new_password);
                // $this->displayError('haslo git!');

                $sql = "UPDATE user SET hash=:new_pass, salt=:new_salt WHERE id=:user_id";
                $stmt = $this->db->prepare($sql);
                $stmt->execute([
                    'user_id' => $user_id,
                    'new_pass' => $new_password,
                    'new_salt'=>$newSalt
                ]);

                $this->displayFeedback('Pomyślnie zmieniono hasło!');

            }else{
                $this->displayError('Stare hasło jest błędne!');
            }
        }
    }

    // user  functions 
    //  (see comments, reviews, or last time added movies)
    //
    public function show_no_privileges(){
        echo '<article class="error__404">
        <h1>Oops ( ͡❛ _⦣ ͡❛)</h1>
        <p>Nie masz uprawnień do wyświetlenia tej strony</p>
    </article>';
        exit();
    }

    public function check_user_session(){
        if(isset($_SESSION['user_data'])){
            $curr_time = time();
            if($curr_time > $_SESSION['user_data']['sess_expire']){
                session_unset();
                session_destroy();
                header('Location: index.php');
                exit();
            }
        }
    }

    public function show_user_comments($user_id){
        $sql = "SELECT co.id, co.content, co.created_at, co.score, co.movies_id, mo.title, mo.image_url, mo.id as 'movie_id' FROM comments co INNER JOIN movies mo ON co.movies_id=mo.id WHERE co.user_id=:user_id AND co.deleted=0 ORDER BY co.created_at DESC";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['user_id'=>$user_id]);
        $data = $stmt->fetchAll();
        // var_dump($data);
        return $data;
    }

    public function get_user_comment($comment_id, $user_id){
        $sql = "SELECT id, content, score, user_id FROM comments WHERE id=:id AND user_id=:user_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['id'=>$comment_id, 'user_id'=>$user_id]);
        $data = $stmt->fetch();
        //var_dump($data);
        return $data;
    }

    public function add_comment($user_id, $score, $content, $movie_id){
        // purify
        $score = $this->purifier->purify($score);
        $score = Filter::addName($score);
        $content = $this->purifier->purify($content);
        $content = Filter::addName($content);
        if(is_numeric($score)){
            $sql = "INSERT INTO comments(`content`, `created_at`, `user_id`, `score`, `movies_id`, `deleted`) VALUES (:content, NOW(), :user_id, :score, :movie_id, :deleted)";
            $stmt = $this->db->prepare($sql);
            $stmt->execute([
                'content' => $content,
                'user_id' => $user_id,
                'score' => $score, 
                'movie_id' => $movie_id,
                'deleted' => 0,
            ]);
            $last_added_id = $this->lastAddedId('comments');
            $this->register_user_activity('add content', $last_added_id['id'], NULL, 
            serialize([
                'id' => $last_added_id['id'],
                'user_id' => $user_id,
                'content' => $content,
                'score' => $score,
                'deleted' => 0,
            ]), "comments");
        }else{
            $this->displayError("Wystapil błąd: Wprowadzono niepoprawne dane do formularza!");
            return false;
        }
    }



    public function modify_comment($comment_id, $content, $score){
        // purify
        $score = $this->purifier->purify($score);
        $score = Filter::addName($score);
        $content = $this->purifier->purify($content);
        $content = Filter::addName($content);

        $old_message = $this->get_content("comments", $comment_id);
        $old_message = serialize($old_message);

        $sql = "UPDATE comments SET content=:content, score=:score, created_at=NOW() WHERE id=:comment_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([
            'content' => $content,
            'score' => $score,
            'comment_id' => $comment_id
        ]);

        $this->register_user_activity('edit content', $comment_id, $old_message, 
        serialize([
            'content' => $content,
            'score' => $score,
            'comment_id' => $comment_id
        ]), "comments");

        header('Location: index.php?page=dashboard');
        exit();
    }

    public function delete_record($user_id, $user_role, $comment_id){
        if($user_role == 1){
            // delete comment
            $sql = "UPDATE comments SET deleted=1 WHERE id=:comment_id AND user_id=:user_id";
            $stmt = $this->db->prepare($sql);
            $stmt->execute([
                'comment_id' => $comment_id,
                'user_id' => $user_id,
            ]);

            $this->register_user_activity('delete content', $comment_id, 0, 1, "comments");

        }else if($user_role == 2){
            // delete reviews
             $sql = "UPDATE reviews SET deleted=1 WHERE id=:review_id AND user_id=:user_id";
            $stmt = $this->db->prepare($sql);
            $stmt->execute([
                'review_id' => $comment_id,
                'user_id' => $user_id,
            ]);

            $this->register_user_activity('delete content', $comment_id, 0, 1, "reviews");
        }else {
            // admin or worker
            if($user_role == 3){
                $sql = "UPDATE movies SET deleted=1 WHERE id=:movie_id";
                $stmt = $this->db->prepare($sql);
                $stmt->execute([
                    'movie_id' => $comment_id,
                ]);

                $this->register_user_activity('delete content', $comment_id, 0, 1, "movies");
            }
        }

        header('Location: index.php?page=dashboard');
        exit();
    }

    // user with reviews privileges
    public function show_user_reviews($user_id){
        $sql = "SELECT r.id, r.title, r.content, r.created_at, r.score, mo.title as 'movie_title', mo.image_url, mo.id as 'movie_id' FROM reviews r INNER JOIN movies mo ON r.movies_id=mo.id WHERE r.user_id=:user_id AND r.deleted=0 ORDER BY r.created_at DESC";
        $stmt= $this->db->prepare($sql);
        $stmt->execute([
            'user_id'=>$user_id
        ]);

        $data = $stmt->fetchAll();
        return $data;
    }

    public function get_user_review($review_id, $user_id){
        $sql = "SELECT id, title, content, score, user_id FROM reviews WHERE id=:id AND user_id=:user_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['id'=>$review_id, 'user_id'=>$user_id]);
        $data = $stmt->fetch();
        // var_dump($data);
        return $data;
    }

    public function modify_review($review_id, $title, $content, $score){
        // purify
        $title = $this->purifier->purify($title);
            $title = Filter::addName($title);
            $score = $this->purifier->purify($score);
            $score = Filter::addName($score);
            $content = $this->purifier->purify($content);
            $content = Filter::addName($content);
        $old_message = $this->get_content("reviews", $review_id);
        $old_message = serialize($old_message);

        $sql = "UPDATE reviews SET title=:title, content=:content, created_at=NOW(), score=:score WHERE id=:review_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([
            'title' => $title,
            'content' => $content, 
            'score' => $score,
            'review_id' => $review_id
        ]);

        $this->register_user_activity('edit content', $review_id, $old_message,
        serialize([
            'title' => $title,
            'content' => $content,
            'score' => $score,
            'review_id' => $review_id
        ]), "reviews");

        header('Location: index.php?page=dashboard');
        exit();
    }

    public function add_review($user_id, $title, $content, $score, $movie_id){
        $title = $this->purifier->purify($title);
        $title = Filter::addName($title);
        $score = $this->purifier->purify($score);
        $score = Filter::addName($score);
        $content = $this->purifier->purify($content);
        $content = Filter::addName($content);
        if(is_numeric($score)){
            $sql = "INSERT INTO reviews(`title`,`content`, `created_at`, `user_id`, `score`, `movies_id`, `deleted`) VALUES (:title, :content, NOW(), :user_id, :score, :movie_id, :deleted)";
            $stmt = $this->db->prepare($sql);
            $stmt->execute([
                'title' => $title,
                'content' => $content,
                'user_id' => $user_id,
                'score' => $score, 
                'movie_id' => $movie_id,
                'deleted' => 0,
            ]);

            $last_added_id = $this->lastAddedId('reviews');

           // var_dump($last_added_id);
            $this->register_user_activity('add content', $last_added_id['id'], NULL, 
            serialize([
                'id' => $last_added_id['id'],
                'user_id' => $user_id,
                'title' => $title,
                'content' => $content,
                'score' => $score,
                'deleted' => 0,
            ]), "reviews");
        }else{
            $this->displayError("Wystapil błąd: Wprowadzono niepoprawne dane do formularza!");
            return false;
        }
    }

    // user worker privileges

    public function show_worker_movies($user_id){
        $sql = "SELECT id, user_id, title, created_at, content as 'desc', type, image_url, production_date FROM movies WHERE user_id=:user_id AND deleted=0 ORDER BY created_at DESC";
        $stmt = $this->db->prepare($sql);

        $stmt->execute([
            'user_id'=>$user_id
        ]);
        $data = $stmt->fetchAll();
        return $data;
    }

    public function get_worker_movie($movie_id, $user_id){
        $sql = "SELECT id, title, content as 'desc', type, image_url, production_date FROM movies WHERE id=:movie_id AND user_id=:user_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([
            'movie_id' => $movie_id,
            'user_id' => $user_id,
        ]);

        $data = $stmt->fetch();
        return $data;
    }

    public function modify_movie($movie_id, $title, $content, $production_date, $category, $img_url){

         // purify
        $title = $this->purifier->purify($title);
            $title = Filter::addName($title);
            $category = $this->purifier->purify($category);
            $category = Filter::addName($category);
            $content = $this->purifier->purify($content);
            $content = Filter::addName($content);

            $isCorrectDate = strtotime($production_date);
            if(!$isCorrectDate){
                header('Location: index.php?page=dashboard');
                exit();
                return false;
            }
        if((strlen($title) || strlen($content) || strlen($production_date) || strlen($category) || strlen($img_url)) == 0){
            $this->displayError('Modyfikowane wartości nie mogą być puste!');
            exit();
            return;
        }


        $old_message = $this->get_content("movies", $movie_id);
        $old_message = serialize($old_message);

        $sql = "UPDATE movies SET title=:title, created_at=NOW(), content=:content, type=:type, image_url=:image_url, production_date=:prod_date WHERE id=:movie_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([
            'title' => $title,
            'content' => $content,
            'prod_date' => $production_date,
            'image_url' => $img_url,
            'type' => $category,
            'movie_id' =>$movie_id
        ]);

        $this->register_user_activity('edit content', $movie_id, $old_message, 
        serialize([
            'title' => $title,
            'content' => $content,
            'prod_date' => $production_date,
            'image_url' => $img_url,
            'type' => $category,
            'movie_id' => $movie_id
        ]), "movies");

        header('Location: index.php?page=dashboard');
        exit();
    }

    public function add_movie($user_id, $title, $prod_date, $cat, $img_url, $content){

        // purify
        $title = $this->purifier->purify($title);
            $title = Filter::addName($title);
            $cat = $this->purifier->purify($cat);
            $cat = Filter::addName($cat);
            $content = $this->purifier->purify($content);
            $content = Filter::addName($content);

            $isCorrectDate = strtotime($prod_date);
            if(!$isCorrectDate){
                $this->displayError('Podano nie prawidłowy format daty!');
                exit();
                return false;
            }

        if(strlen($title) == 0){
                $this->displayError('Pola nie mogą być puste!');
                exit();
                return;
        }
        if($_SESSION['user_data']['role_id'] == 3){
            $sql = "INSERT INTO movies(`user_id`, `title`, `created_at`, `content`, `type`, `image_url`, `production_date`) VALUES(:user_id, :title, NOW(), :content, :type, :img_url, :prod_date)";
            $stmt = $this->db->prepare($sql);
            $stmt->execute([
                'user_id' => $user_id,
                'title' => $title, 
                'content' => $content,
                'type' => $cat,
                'img_url' => $img_url,
                'prod_date' => $prod_date,
            ]);

            $last_added_id = $this->lastAddedId('movies');
            $this->register_user_activity('add content', $last_added_id['id'], NULL, 
            serialize([
                'id' => $last_added_id['id'],
                'user_id' => $user_id,
                'title' => $title,
                'content' => $content,
                'type' => $cat,
                'prod_date' => $prod_date,
                'img_url' => $img_url,
                'deleted' => 0,
            ]), "movies");

               header("Location: index.php?page=dashboard");
                exit();
        }else{
            $this->displayError('Nie masz wymaganych uprawnień do wykonania tej akcji!');
        }
    }

    // // /// /// /// // // // // 
    //  ADMINISTRATOR ROLES
    /// // / // / / / // / / / / /
    public function check_user_role($user_id){
        $sql = "SELECT role_id FROM user WHERE id=:user_id";
        $stmt=$this->db->prepare($sql);
        $stmt->execute([
            'user_id'=>$user_id
        ]);
        $data = $stmt->fetch();
        return $data;
    }


    public function get_roles_in_system($user_id){
        // check if user have privileges to see this contnet
        $data = $this->check_user_role($user_id);
        if($data['role_id'] == 4){
            $sql = "SELECT * FROM role";
            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            $data = $stmt->fetchAll();
            // var_dump($data);
            return $data;
        }
    }

    public function get_privileges_in_system($user_id){
               // check if user have privileges to see this contnet
        $data = $this->check_user_role($user_id);
        if($data['role_id'] == 4){
            $sql = "SELECT * FROM privileges";
            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            $data = $stmt->fetchAll();
            // var_dump($data);
            return $data;
        }
    }

    public function show_users_roles($user_id){
        // check if user have privileges to see this contnet
        $data = $this->check_user_role($user_id);
        if($data['role_id'] == 4 ){
            $sql = "SELECT u.id, u.role_id, u.login, u.email, u.lockout_time, u.id_status, u.check_validation, r.title FROM user u INNER JOIN role r ON r.id=u.role_id";

            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            $data = $stmt->fetchAll();
            // var_dump($data);
            return $data;
        }
    }

    public function change_user_status($user_id, $account_status){
        $sql = "UPDATE user SET id_status=:acc_status WHERE id=:user_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([
            'user_id' => $user_id,
            'acc_status' => $account_status
        ]);
    }

    public function get_user_role($user_to_modify_id, $user_id){
        $data = $this->check_user_role($user_id);
        if($data['role_id'] == 4){
            $sql = "SELECT u.id, u.role_id, u.login, u.email, u.lockout_time, u.id_status, u.check_validation, r.title FROM user u INNER JOIN role r ON r.id=u.role_id WHERE u.id=:user_to_modify_id";

            $stmt = $this->db->prepare($sql);
            $stmt->execute([
                'user_to_modify_id' => $user_to_modify_id,
            ]);

            $data = $stmt->fetch();
            return $data;
        }
    }

    public function modify_user_role($user_to_modify_id, $user_role, $user_validation_option, $user_id, $user_unlock_account){

       // var_dump($user_to_modify_id, $user_role, $user_validation_option, $user_id, $user_unlock_account);
        $data = $this->check_user_role($user_id);
        if($data['role_id'] == 4){
            if($user_validation_option == null && $user_role != null){
                $sql = "UPDATE user SET role_id=:role_id WHERE id=:user_to_modify_id";

                $stmt = $this->db->prepare($sql);
                $stmt->execute([
                    'role_id' => $user_role,
                    'user_to_modify_id'=>$user_to_modify_id,
                ]);

            }else if ($user_role == null && $user_validation_option != null){
                $sql = "UPDATE user SET check_validation=:validation_option WHERE id=:user_to_modify_id";
                    
                $stmt = $this->db->prepare($sql);
                $stmt->execute([
                    'validation_option' => $user_validation_option,
                    'user_to_modify_id'=>$user_to_modify_id,
                ]);
            }else if ($user_role != null && $user_validation_option != null){
                $sql = "UPDATE user SET role_id=:role_id, check_validation=:validation_option WHERE id=:user_to_modify_id";
                    
                $stmt = $this->db->prepare($sql);
                $stmt->execute([
                    'validation_option' => $user_validation_option,
                    'user_to_modify_id'=>$user_to_modify_id,
                    'role_id' => $user_role,
                ]);
            }else{
                echo 'Nothing to do here';
            }

            if($user_unlock_account){
                $sql = "UPDATE user SET lockout_time=NULL WHERE id=:user_id";
                $stmt = $this->db->prepare($sql);
                $stmt->execute(['user_id' => $user_to_modify_id]);
            }
            header('Location: index.php?page=dashboard');
            exit();
        }
    }
    ////////////////////
    ///USER ACTIVITY///
    /////////////////

    public function register_user_login($user_id, $ip_addr, $correct, $computer, $activity_type){
        $user_id = $this->purifier->purify($user_id);
        $ip_addr = $this->purifier->purify($ip_addr);
        $correct = $this->purifier->purify($correct);
        $computer = $this->purifier->purify($computer);
        if( filter_var($user_id, FILTER_VALIDATE_INT)){
            if($user_id==-1){
                return;
            }else{
                //Existing user login
                // check if IP address is registered in DB
                try{
                    $sql = "SELECT id FROM ip_address WHERE address_IP=:ip_addr";
                    $stmt = $this->db->prepare($sql);
                    $stmt->execute(['ip_addr' => $ip_addr]);
                    $data = $stmt->fetch();

                    if(empty($data['id'])){
                        // IP address not registered, register to db
                        $sql="INSERT INTO ip_address (`ok_login_num`, `bad_login_num`,
                        `last_bad_login_num`, `permanent_lock`, `address_IP`) "
                        ." VALUES (0,0,0,0,:ip_address)";
                        $this->db->prepare($sql)->execute(['ip_address'=>$ip_addr]);
                          //check id of inserted record
                        $sql = "SELECT id FROM ip_address WHERE address_IP=:ip_addr";
                        $stmt = $this->db->prepare($sql);
                        $stmt->execute(['ip_addr' => $ip_addr]);
                        $data = $stmt->fetch();
                    }
                    // if found ip addr insert to db activity of login
                    $sql = "INSERT INTO user_login (`time`, `correct`, `id_user`, `computer`, `id_address`, `log_out`) VALUES (:time, :correct, :user_id, :computer, :id_address, :log_out)";

                    $data= [
                        'time' => date('Y-m-d H:i:s', time()),
                        'correct' => $correct ? 1 : 0,
                        'user_id' => $user_id,
                        'computer' => $_SERVER['HTTP_SEC_CH_UA_PLATFORM'],
                        'id_address' => $data['id'],
                        'log_out' => $activity_type ? 1 : 0 
                    ];
                    $this->db->prepare($sql)->execute($data);
                } catch(Exception $e){
                    print 'Exception '.$e->getMessage();
                }
            }
        }
    }

    public function register_user_activity($action_taken, $row_number, $previous_data, $present_data, $table_affected){

        $action_taken = $this->purifier->purify($action_taken);
        $row_number = $this->purifier->purify($row_number);
        $previous_data = isset($previous_data) ? $this->purifier->purify($previous_data) : NULL;
        $present_data = isset($present_data) ? $this->purifier->purify($present_data) : NULL;
        $table_affected = isset($table_affected) ? $this->purifier->purify($table_affected) : NULL;

        try{

             $sql = "INSERT INTO user_activity( `id_user`, `time`, `action_taken`, `table_affected`, `row_number`, `previous_data`, `new_data`) VALUES (:user_id, :time, :action_taken,:table_affected,:row_number,:previous_data,:new_data)";

             $data = [
                'user_id' => $_SESSION['user_data']['id'],
                'time' => date(DATE_ATOM),
                'action_taken' => $action_taken,
                'table_affected' => $table_affected,
                'row_number' => $row_number,
                'previous_data' => $previous_data,
                'new_data' => $present_data
             ];
             $this->db->prepare($sql)->execute($data);
        }catch(Exception $e){
            print 'Exception: '.$e->getMessage();
        }
    }



    // get access to see user activity
    public function get_activity(){
        try{
            if($_SESSION['user_data']['role_id'] != 4){
                $this->show_no_privileges();
                
            }else{
                $sql = "SELECT ua.id, ua.id_user, u.login, ua.time, ua.action_taken, ua.table_affected, ua.row_number, ua.can_undo, ua.undone, ua.previous_data, ua.new_data FROM user_activity ua INNER JOIN user u ON u.id=ua.id_user ORDER BY ua.id DESC";
                $stmt = $this->db->query($sql);
                $data = $stmt->fetchAll();
                return $data;
            }
        }catch(Exception $e){
            print 'Exception'. $e->getMessage();
        }
    }
    // get access to see user logging
    public function get_userlogging(){
        try{
            if($_SESSION['user_data']['role_id'] != 4){
                $this->show_no_privileges();
            }else{
                $sql = "SELECT ul.id, ul.id_user, u.login, ip.address_IP, ul.time, ul.computer, ul.correct, ul.log_out FROM user_login ul INNER JOIN user u ON u.id=ul.id_user INNER JOIN ip_address ip ON ul.id_address=ip.id ORDER BY ul.time DESC";
                $stmt = $this->db->query($sql);
                $data = $stmt->fetchAll();
                return $data;

            }
        }catch(Exception $e){
            print 'Exception'. $e->getMessage();
        }
    }

    // restore old data insterted by user
    public function restore_old_data($activity_id){
        try{
            $sql = "SELECT `action_taken`, `table_affected`, `row_number`, `previous_data`, `new_data` FROM `user_activity` WHERE `id`=:id";
            $stmt = $this->db->prepare($sql);
            $stmt->execute(['id' => $activity_id]);
            $data = $stmt->fetch(); 
            // var_dump($data);
            switch($data['action_taken']){
                case "add content": {
                    // delete added message
                    // var_dump('add action');
                    if($data['table_affected'] == 'movies'){
                        // var_dump('add movies');

                        $sql = "UPDATE movies SET deleted=1 WHERE id=:id";
                    }

                    if($data['table_affected'] == 'comments'){
                        // var_dump('add comments');
                        $sql = "UPDATE comments SET deleted=1 WHERE id=:id"; 
                    }

                    if($data['table_affected'] == 'reviews'){
                        // var_dump('add reviews');
                        $sql = "UPDATE reviews SET deleted=1 WHERE id=:id";
                    }

                    $stmt = $this->db->prepare($sql);
                    // var_dump('wykonuje akcje '.$sql);
                    if($stmt->execute(
                        [
                            'id' => $data['row_number'],
                        ]
                    )){
                        $sql = "UPDATE user_activity SET undone=1 WHERE id=:id";
                        $stmt = $this->db->prepare($sql);
                        $stmt->execute(['id'=> $activity_id]);
                    }
                    break;
                }

                case "edit content": {
                    // restore previous message
                        $old_message = unserialize($data['previous_data']);
                     if($data['table_affected'] == 'movies'){
                        
                        var_dump($data['previous_data']);
                        // var_dump($old_message);
                        $sql = "UPDATE movies SET title=:title, content=:content, type=:type, image_url=:image_url, production_date=:prod_date WHERE id=:id";
                        $stmt = $this->db->prepare($sql);
                        $stmt->execute([
                                'title' => $old_message['title'],
                                'content' => $old_message['content'],
                                'type' => $old_message['type'],
                                'image_url' => $old_message['image_url'],
                                'prod_date' => $old_message['production_date'],
                                'id' => $data['row_number']
                        ]);
                    }

                    if($data['table_affected'] == 'comments'){
                        $sql = "UPDATE comments SET content=:content, score=:score WHERE id=:id"; 
                        $stmt = $this->db->prepare($sql);
                        $stmt->execute([
                            'content' => $old_message['content'],
                            'score' => $old_message['score'],
                            'id' => $data['row_number'],
                        ]);
                    }

                    if($data['table_affected'] == 'reviews'){
                        // var_dump('reviews test');
                        // var_dump($old_message);
                        $sql = "UPDATE reviews SET title=:title, content=:content, score=:score WHERE id=:id";
                        $stmt = $this->db->prepare($sql);
                        $stmt->execute([
                            'title' => $old_message['title'],
                            'content' => $old_message['content'],
                            'score' => $old_message['score'],
                            'id' => $data['row_number'],
                        ]);
                    }
                        $sql = "UPDATE user_activity SET undone=1 WHERE id=:id";
                        $stmt = $this->db->prepare($sql);
                        $stmt->execute(['id'=> $activity_id]);
                    break;
                }
                case "delete content": {
                    // restore message to message page

                    if($data['table_affected'] == 'comments'){
                        $sql = "UPDATE comments SET deleted=:deleted WHERE id=:id";
                        $stmt = $this->db->prepare($sql);
                        $stmt->execute([
                        'deleted' => $data['previous_data'],
                        'id'=> $data['row_number']
                    ]);
                    }

                    if($data['table_affected' == 'reviews']){
                       $sql = "UPDATE reviews SET deleted=:deleted WHERE id=:id";
                        $stmt = $this->db->prepare($sql);
                        $stmt->execute([
                        'deleted' => $data['previous_data'],
                        'id'=> $data['row_number']
                    ]); 
                    }

                    if($data['table_affected' == 'movies']){
                        $sql = "UPDATE movies SET deleted=:deleted WHERE id=:id";
                        $stmt = $this->db->prepare($sql);
                        $stmt->execute([
                        'deleted' => $data['previous_data'],
                        'id'=> $data['row_number']
                    ]);
                    }
                    
                    $sql = "UPDATE user_activity SET undone=1 WHERE id=:id";
                    $stmt = $this->db->prepare($sql);
                    $stmt->execute(['id'=> $activity_id]);
                    break;
                }   
                default:
                    return false;
            }
            $this->disable_reverse_buttons($activity_id);
        }catch(Exception $e){
            print 'Exception.'.$e->getMessage();
        }
    }

    public function disable_reverse_buttons($id){
    //var_dump('action disable button');
    $sql = "SELECT `id_user`, `action_taken`, `row_number` FROM `user_activity` WHERE `id`=:id";
    $stmt = $this->db->prepare($sql);
    $stmt->execute(['id' => $id]);
    $data = $stmt->fetch();
   // var_dump('action disable button');
   // var_dump($data);
    $user_id = $data['id_user'];
    $action = $data['action_taken'];
    $rowNumber = $data['row_number'];

        $sql = "UPDATE user_activity SET undone=1 WHERE id_user=:user_id AND action_taken=:actionTaken AND row_number=:rowNumber";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['user_id'=> $user_id, 'actionTaken' => $action, 'rowNumber' => $rowNumber]);

        header('Location: index.php?page=user_activity');
        exit();
    }

    public function unserialize_content($content){
        if(strlen($content)>1){
            $unserializedContent = unserialize($content);
            
            foreach($unserializedContent as $key=>$value){
                echo "{$key} ==> {$value} <br>";
            }
        }
    }

    // check incorrect logins
    public function check_user_incorrect_logins($passCheck, $user_id){
    $user_addr = $_SERVER['REMOTE_ADDR'];

    // check if user have temp lock on account
    $sql1 = "SELECT lockout_time FROM user WHERE id=:id";
    $stmt1 = $this->db->prepare($sql1);
    $stmt1->execute(['id'=>$user_id]);
    $data_user=$stmt1->fetch();

    $todaySQL = "SELECT NOW() FROM user";
    $today = $this->db->query($todaySQL);
    $currData = $today->fetch();

    
    // var_dump($data_user['lockout_time'] != null);
    if($data_user['lockout_time'] != null){
            //var_dump(strtotime($currData[0]) > strtotime($data_user['lockout_time']));
            if(strtotime($currData[0]) > strtotime($data_user['lockout_time'])){
                
                $sql = "UPDATE user SET lockout_time=NULL WHERE id=:id";
                $stmt = $this->db->prepare($sql);
                $stmt->execute(['id'=>$user_id]);

                $sql = "UPDATE ip_address SET temp_lock=NULL WHERE address_IP=:ip";
                $stmt = $this->db->prepare($sql);
                $stmt->execute(['ip'=>$user_addr]);
            }else{
                    header('Location: ./index.php?page=lock_account&lock='.$data_user['lockout_time']);
                    session_abort();
                    session_unset();
                    exit();
                
            }
        }else if($data_user['lockout_time'] == null){

        $sql = "SELECT * FROM ip_address WHERE address_IP=:address_IP";

        $stmt = $this->db->prepare($sql);
        $stmt->execute(['address_IP' => $user_addr]);
        $data = $stmt->fetch();
        // var_dump($data);
       // var_dump(count($data));
        if(count($data) != 0){
            if($passCheck && $data_user['lockout_time']=== NULL){
                $sql = "UPDATE ip_address SET ok_login_num=ok_login_num+1, last_bad_login_num=0 WHERE address_IP=:ip";
                $stmt = $this->db->prepare($sql);
                $stmt->execute(['ip'=>$user_addr]);
                return true;
            }else{
                // ACTION FOR incorrect_logins TABLE
                $sql = "INSERT INTO incorrect_logins(`id_user`, `time`, `session_id`, `id_address`, `computer`) VALUES(:id_user, :time, :session_id, :id_address, :computer)";
                $stmt = $this->db->prepare($sql);
                $stmt->execute([
                    'id_user' => $user_id,
                    'time' => date(DATE_ATOM),
                    'session_id'=> 'undetected',
                    'id_address' => $data['id'],
                    'computer' => $_COOKIE['PHPSESSID'],
                ]);

                // ACTION FOR ip_address TABLE
                $sql = "UPDATE ip_address SET bad_login_num=bad_login_num+1, last_bad_login_num=last_bad_login_num+1 WHERE address_IP=:ip";
                $stmt = $this->db->prepare($sql);
                $stmt->execute(['ip'=>$user_addr]);

                $sql = "SELECT last_bad_login_num FROM ip_address WHERE address_IP=:ip";
                $stmt=$this->db->prepare($sql);
                $stmt->execute(['ip'=>$user_addr]);
                $data = $stmt->fetch();
                // if bad_login num >= 15 then temp ban user
                //var_dump($data);
                if($data['last_bad_login_num'] >= 15){
                    $sql = "UPDATE ip_address SET temp_lock=NOW() + INTERVAL 10 MINUTE WHERE address_IP=:ip";
                    $stmt = $this->db->prepare($sql);
                    $stmt->execute([
                        'ip'=>$user_addr,
                    ]);

                    $sql = "UPDATE user SET lockout_time=NOW() + INTERVAL 10 MINUTE WHERE id=:id";
                    $stmt = $this->db->prepare($sql);
                    $stmt->execute(['id'=>$user_id]);
                }
                return false;
            }   


        }


        }
    }


    // OTHERS
    public function check_user_have_access($user_login, $id){
        $action_name = array_keys($_REQUEST);
        $action_name = $action_name[1];
        // var_dump($action_name);
        // var_dump($action_name, $user_login, $id);
        if($action_name == 'movie_id'){
            $sql = "SELECT * FROM movies mo INNER JOIN user u ON u.id=mo.user_id WHERE mo.id=:content_id AND u.login=:user_login AND mo.deleted=0";
        }

        if($action_name == 'comment_id'){
            $sql = "SELECT * FROM comments co INNER JOIN user u ON u.id=co.user_id WHERE co.id=:content_id AND u.login=:user_login AND co.deleted=0";
        }

        if($action_name == 'review_id'){
            $sql = "SELECT * FROM reviews r INNER JOIN user u ON u.id=r.user_id WHERE r.id=:content_id AND u.login=:user_login AND r.deleted=0";
        }

        if($action_name == 'user_id'){
            $sql = "SELECT CASE WHEN role_id = 4 THEN TRUE ELSE FALSE END FROM user WHERE login=:user_login";
        }
        
        if($action_name != 'user_id'){
            $stmt = $this->db->prepare($sql);
            $stmt->execute([
            'content_id' => $id,
            'user_login' => $user_login
            ]);

            $data = $stmt->fetch();
        }else{
            $stmt = $this->db->prepare($sql);
            $stmt->execute([
            'user_login' => $user_login
            ]);

            $data = $stmt->fetch();
          
        }
        

        

        // var_dump($data);
            if(!$data){
                $this->show_no_privileges();
            }
        
        
    }

    public function get_user_content($user_id){
        // check user role
        $sql = "SELECT id, role_id FROM user WHERE id=:user_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['user_id'=>$user_id]);
        $data = $stmt->fetch();
        // var_dump($data);

        if($data['role_id'] == 1){
            // sql for user comments
            $sql = "SELECT u.login, co.id, co.content, co.score, co.deleted FROM comments co INNER JOIN user u ON u.id=co.user_id WHERE co.user_id=:user_id";
        }

        if($data['role_id'] == 2){
            // sql for user reviews
            $sql = "SELECT u.login, r.id, r.title, r.content, r.score, r.deleted FROM reviews r INNER JOIN user u ON u.id=r.user_id WHERE r.user_id=:user_id";
        }

        if($data['role_id'] == 3){
            // sql for user added movies
            $sql = "SELECT u.login, mo.id, mo.title, mo.content, mo.type, mo.image_url, mo.production_date, mo.deleted FROM movies mo INNER JOIN user u ON u.id=mo.user_id WHERE mo.user_id=:user_id";
        }

        if($data['role_id'] == 4){
            $this->displayFeedback('Nie można wyświetlić aktywności innego administratora');
            exit();
            return;
        }

        $stmt = $this->db->prepare($sql);
        $stmt->execute(['user_id'=>$user_id]);
        $data = $stmt->fetchAll();

        // var_dump($data);
        return $data;
    }

    public function delete_from_db($record_id, $user_id){
        // find properly table in db
                // check user role
        $sql = "SELECT id, role_id FROM user WHERE id=:user_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['user_id'=>$user_id]);
        $data = $stmt->fetch();

        if($data['role_id'] == 1){
            $sql = "DELETE FROM comments WHERE id=:record_id AND user_id=:user_id";
        }

        if($data['role_id'] == 2){
            $sql = "DELETE FROM reviews WHERE id=:record_id AND user_id=:user_id";
        }

        if($data['role_id'] == 3){
            $sql = "DELETE FROM movies WHERE id=:record_id AND user_id=:user_id";
        }

        $stmt = $this->db->prepare($sql);
        $stmt->execute([
            'record_id' => $record_id,
            'user_id' => $user_id
        ]);
    }

    public function get_movie_score($movie_id){
        $sql = "SELECT r.score FROM movies mo INNER JOIN reviews r ON r.movies_id=mo.id WHERE mo.id=:movie_id
                UNION ALL
                SELECT co.score FROM movies mo INNER JOIN comments co ON co.movies_id=mo.id WHERE mo.id=:movie_id";

        $stmt = $this->db->prepare($sql);
        $stmt->execute(['movie_id'=>$movie_id]);
        $data = $stmt->fetchAll();
        
        $n = count($data);
        $sum =0;
        foreach($data as $score){
            // var_dump($score['score']);
            $sum+=$score['score'];
        }

        echo substr($sum/$n, 0, 3);


    }
}

?>