<?php if(!isset($_REQUEST['lock']))
        $pdo->show_no_privileges();
?>
<div class="row">
<section class="col-sm-12">
    <h1>Ooopss ¯\_(ツ)_/¯</h1>
    <p>Na twoim koncie wykryto podejrzaną akcję nieudanych logowań,konto zostało tymczasowo zablokowane</p>
    <?php 
        $date = isset($_REQUEST['lock']) ? ($_REQUEST['lock']):('Wystąpił nieznany błąd!');
    ?>
    <p>To konto będzie zablokowane do <span style="font-weight:bold"><?php echo $date; ?></span></p>
</section>
</div>