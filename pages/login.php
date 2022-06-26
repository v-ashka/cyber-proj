<?php 
        if(isset($_REQUEST['reg'])){
            $pdo->displayFeedback("Pomyślnie zarejestrowano!");
        }
        $message= $pdo->displayError("") ?? NULL;  

        if(isset($_POST['login_user'])){
            $login = $_POST['login'];
            $pass = $_POST['password'];
            $pdo->login_user($login, $pass);  
          }
    ?>
<div class="row">

    <div class="col">
        <section class="mb-5">
            <h1 class="mt-5" >W bazie Filmawki jest ponad 1500 filmów!</h1>
            <p>Utworzenie konta to tylko kilka sekund, a pozwala na tak wiele!</p>
        </section>
    </div>
    <div class="col">
  
        <form action="index.php?page=login" method="POST" class="bg-light p-5 rounded form__input">
            <section>
            <h1>Zaloguj się na konto</h1>
            <p>Nowe filmy czekają!</p>
        </section> 
            <div class="mb-3">
                <label for="exampleInputLogin" class="form-label">Login</label>
                <input type="text" class="form-control" id="exampleInputLogin" aria-describedby="loginHelp" name="login">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Hasło</label>
                <input type="password" class="form-control" name="password">
            </div>
            <button type="submit" class="btn btn-primary" name="login_user">Zaloguj się</button>
        </form>
    </div>
</div>