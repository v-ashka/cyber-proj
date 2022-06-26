<?php 
    $WEB_TITLE = "Filmawka";
    session_start();
    include_once 'classes/pdo.php';
    $pdo = new Pdo_();
    require 'container/menu.php';
    
    // echo phpinfo();
    
    // var_dump($_SESSION); 
?>
<main>
    <section>
        <?php 
            $pages = array('home', 'login', 'singup', 'dashboard', 'movie', 'register', 'search', 'login_valid', 'delete_action', 'edit_action', 'user_activity', 'user_logging', 'lock_account');
            // var_dump($pages);        
            $page = ( isset($_GET['page']) ) ? $_GET['page'] : 'home';
            // var_dump($page);
            // var_dump($_REQUEST);
            // var_dump($_SESSION);
                if ( in_array($page, $pages) ){
                    include("pages/$page.php");
                    if(isset($_SESSION['user_data'])){
                        if(isset($_SESSION['user_data']['sess_start'])){
                            $pdo->check_user_session();    
                        }
                        $pdo->start_counting_session();
                        $pdo->check_user_session();
                    }
                    
                } else {
                    include("pages/404.php");
                }    
        ?>
    </section>
</main>
<?php require 'container/footer.php' ?>