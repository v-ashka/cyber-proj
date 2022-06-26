<?php 
        $message= $pdo->displayError("") ?? NULL;  
    if(isset($_SESSION['validation_step1']['session_valid_step1'])){
        if(isset($_POST['auth_user'])){
            $id = $_SESSION['validation_step1']['user_id'];
            $code = $_POST['code'];
            $pdo->authorize_user($id, $code);
        }
    }else{
        $pdo->show_no_privileges();
        exit();
    }
    ?>
<div class="row">
    <div class="col">
        <form action="index.php?page=login_valid" method="POST" class="bg-light p-5 rounded form__input">
            <section>
            <h1>Weryfikacja dwuetapowa</h1>
            <p>Na podany adres email wysłaliśmy ci kod autoryzujący</p>
        </section> 
            <div class="mb-3">
                <label for="codeValid" class="form-label">Kod</label>
                <input type="text" class="form-control" id="codeValid" aria-describedby="codeValidHelp" name="code">
            </div>
            <button type="submit" class="btn btn-primary" name="auth_user">Zaloguj się</button>
        </form>
    </div>
    <div class="col">
        <section class="mb-5">
            <h1 class="mt-5" >Dwuetapowa weryfikacja zwiększa bezpieczeństwo</h1>
            <p>Twoje konto na tym zyska!</p>
        </section>
    </div>
</div>