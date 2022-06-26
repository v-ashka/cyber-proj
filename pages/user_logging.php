<div class="row bg-light p-4 rounded-4">
    <?php 
        

         $user_logs = $pdo->get_userlogging();
         if(isset($_REQUEST['restore_old_data'])){
            $pdo->restore_old_data($_REQUEST['restore_old_data']);
         }
        //  var_dump(unserialize($activity[0]['new_data']));

    ?>
    <section>
        <h1>Aktywność użytkowników</h1>
    </section>
    <!-- table here -->
    <div class="col-sm-12">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col">ID usera</th>
                    <th scope="col">Adres IP</th>
                    <th scope="col">Czas akcji</th>
                    <th scope="col">Urządzenie</th>
                    <th scope="col">Akcja</th>
                    <th scope="col">Stan akcji</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                    if(isset($user_logs)){
                        if(count($user_logs) > 0){
                            $i=1;
                            foreach ($user_logs as $user_log){
                        ?>
                        <tr>
                            <th scope="row"><?php echo $i ?></th>
                            <td><?php echo $user_log['id']?></td>
                            <td><?php echo $user_log['id_user']?> (<?php echo $user_log['login']?>)</td>
                            <td><?php echo $user_log['address_IP']?></td>
                            <td><?php echo $user_log['time']?></td>
                            <td><?php echo $user_log['computer']?></td>
                            <td><?php echo $user_log['log_out'] ? ('WYLOGOWANIE'):('ZALOGOWANIE')?></td>
                            <td><?php echo $user_log['correct'] ? ('POMYŚLNE'):('NIEPOWODZENIE')?></td>
                            
                        </tr>
                <?php 
                            $i++;
                            } 
                        }else{
                    ?>
                        <tr>
                            <td>Brak aktywności</td>
                        </tr>
                <?php
                        }
                }
                ?>
            </tbody>
        </table>
    </div>
</div>