<?php 
  // var_dump(isset($_POST['register_acc']));

  if(isset($_POST['register_acc'])){
    $login = $_POST['login'];
    $email = $_POST['email'];
    $pass = $_POST['pass'];
    $pass2 = $_POST['repeat_pass'];
    // var_dump('passed register_acc post');
    $pdo->register_user($login, $email, $pass, $pass2);  
  }
?>

<div class="row">
  <?php $message= $pdo->displayError("") ?? NULL ?>
    <div class="col">
        <form action="index.php?page=register" method="POST" class="bg-light p-5 rounded form__input">
    <section>
    <h1>Utwórz darmowe konto i oceniaj filmy</h1>
    <p>Twoja opinia ma dla nas znaczenie!</p>
</section> 
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
  </div>
    <div class="mb-3">
    <label for="exampleInputLogin" class="form-label">Login</label>
    <input type="text" class="form-control" aria-describedby="loginHelp" name="login"> 
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Hasło</label>
    <input type="password" class="form-control" name="pass">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Powtórz hasło</label>
    <input type="password" class="form-control" name="repeat_pass">
  </div>
  <button type="submit" class="btn btn-primary" name="register_acc" >Zarejestruj się</button>
</form>
    </div>
    <div class="col">
        <section class="mb-5">
            <h1 class="mt-5" >W bazie Filmawki jest ponad 1500 filmów!</h1>
            <p>Utworzenie konta to tylko kilka sekund, a pozwala na tak wiele!</p>
        </section>
    </div>
</div>


