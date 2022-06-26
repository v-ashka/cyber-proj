<div class="row bg-light p-4 rounded-4">
    <?php 
        

         $activity = $pdo->get_activity();
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
                    <th scope="col">ID akcji</th>
                    <th scope="col">ID usera</th>
                    <th scope="col">Data wykonania</th>
                    <th scope="col">Dokonana akcja</th>
                    <th scope="col">Numer id wiersza</th>
                    <th scope="col">Akcja na tabeli</th>
                    <th scope="col">Poprzednia wersja</th>
                    <th scope="col">Aktualna wersja</th>
                    <th scope="col">Akcja</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                    if(isset($activity)){
                        if(count($activity) > 0){
                            $i=1;
                            foreach ($activity as $active_row){
                        ?>
                        <tr>
                            <th scope="row"><?php echo $i ?></th>
                            <td><?php echo $active_row['id']?></td>
                            <td><?php echo $active_row['id_user']?> (<?php echo $active_row['login']?>)</td>
                            <td><?php echo $active_row['time']?></td>
                            <td><?php echo $active_row['action_taken']?></td>
                            <td><?php echo $active_row['row_number']?></td>
                            <td><?php echo $active_row['table_affected']?></td>
                            <td><?php $pdo->unserialize_content($active_row['previous_data']); ?></td>
                            <td><?php $pdo->unserialize_content($active_row['new_data']);?></td>
                            <td>
                                <?php 
                                    if($active_row['undone']) {
                                ?>
                                    [Pierwotny stan]
                                <?php
                                    }else if($active_row['can_undo']){
                                ?>
                                    <a href="index.php?page=user_activity&restore_old_data=<?php echo $active_row['id']; ?>">Przywróć poprzednie dane</a>
                                <?php 
                                    }else {
                                        ?>
                                    (-)
                                <?php
                                    }
                                ?>
                            </td>
                        </tr>
                <?php 
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