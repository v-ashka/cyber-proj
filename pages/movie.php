<section>
    <?php 
        $id = $_REQUEST['id'];
        //var_dump($id);
        // get movie information $pdo->getMovieInfo($id)
        // get comments
        // get reviews
        $movie = $pdo->getMovieInfo($id);
        //  var_dump($movie);
    ?>
    <div class="row movie">
        <div class="col">
            <h3><?php echo $movie['title']?> <sub><?php echo substr($movie['production_date'],0, 4)?></sub> </h3>
            <hr>
            <h4>Oceny oglądających</h4>
            <hr>
            <p>Recenzenci: 6.23</p>
            <p>Użytkownicy: 7.22</p>
            <hr>
            <h4>Opis</h4>
            <hr>
            <p><?php echo $movie['content'] ?></p>
        </div>
        <div class="col">
            <img src="<?php echo $movie['image_url']?>" alt="<?php echo $movie['title']; ?>">
        </div>
    </div>  
    <hr>
    <h1>Opinie recenzentów</h1>
    <div class="row mt-5">
        <?php 
            $reviews = $pdo->getMovieReviews($id);
            // var_dump($reviews);
            foreach($reviews as $review) :
        ?>
        <div class="card me-4 mb-5" style="width: 18rem;">
            <div class="card-body">
                <div class="d-flex justify-content-between">
                    <h5 class="card-title"><?php echo $review['title']; ?></h5>
                </div>
                <p><?php echo substr($review['created_at'],0, 10); ?></p>
                <h6 class="card-subtitle mb-2 text-muted"><?php echo $review['login']." - ".$review['score']; ?></h6>
                <p class="card-text"><?php echo $review['content'] ?></p>
                                <?php 
                    if(isset($_SESSION['user_data']['login']) && $_SESSION['user_data']['login'] == $review['login']){
                ?>
                    <a class="btn btn-outline-primary" href="index.php?page=edit_action&review_id=<?php echo $review['id'] ?>"><i class="bi bi-pencil"></i></a> 
                    <a class="btn btn-outline-danger" href="index.php?page=delete_action&review_id=<?php echo $review['id'] ?>"><i class="bi bi-trash"></i></a> 
                <?php
                    }
                ?> 
            </div>
        </div>
        <?php 
            endforeach;
        ?>
    </div>
    <hr>
    <h1>Opinie komentatorów</h1>
      <div class="row mt-5">
          <?php
        //   var_dump($_SESSION);
            if(isset($_SESSION['user_data']) && ($_SESSION['user_data']['role_id'] == 1 || $_SESSION['user_data']['role_id'] == 2)){
                $user_id = $_SESSION['user_data']['id'];
                if(isset($_POST['add_comment'])){    
                    $score = $_POST['score'];
                    $content = $_POST['comment_content'];
                    $pdo->add_comment($user_id, $score, $content, $id);
                }
                    // var_dump($_REQUEST['add_review']);
                if(isset($_POST['add_review'])){
                //    var_dump('test?');
                    $title = $_POST['title'];
                    $content = $_POST['comment_content'];
                    $score = $_POST['score'];

                    $pdo->add_review($user_id, $title, $content, $score, $id);
                }
        ?>   
        <div class="col"> 
            <div class="card">
                <?php 
                    if($_SESSION['user_data']['role_id'] == 1){
                ?>
                    <div class="card-header">Podziel się z nami twoją opinią</div>
                <?php
                    }else{
                ?>
                    <div class="card-header">Dodaj recenzję na temat tego filmu</div>
                <?php
                    }                    
                ?>
                <div class="card-body">
                    <form method="POST">
                        <div class="row g-3">
                            <?php 
                                if($_SESSION['user_data']['role_id'] == 2){
                            ?>
                            <div class="col-sm-12">
                                <div class="form-floating">
                                    <input class="form-control" id="floatingTitleInput" type="text" id="title" name="title" placeholder="Tytuł..." required>
                                    <label for="floatingTitleInput">Tytuł recenzji..</label>
                                </div>
                            </div>
                            <?php 
                                }
                            ?>
                            <div class="col-sm-1">
                                <div class="form-floating">
                                    <input class="form-control" id="floatingNumberInput" type="number" id="score" name="score" min="1.00" max="10.00" step="0.1" required>
                                    <label for="floatingNumberInput">Ocena</label>
                                </div>
                            </div>
                            <div class="col-sm-11">
                                <div class="form-floating">
                                    <textarea class="form-control custom__textarea" placeholder="Dodaj komentarz" id="floatingTextarea" required name="comment_content"></textarea>
                                    <label for="floatingTextarea">Treść..</label>
                                </div>
                            </div>
                            <div class="col" style="text-align: right;">
                               <?php 
                                    if($_SESSION['user_data']['role_id'] == 1){
                               ?>
                                <input type="submit" class="btn btn-primary" name="add_comment" value="Dodaj komentarz"></input>
                                <?php 
                                    }else{ 
                                    ?>
                                <input type="submit" class="btn btn-primary" name="add_review" value="Dodaj recenzję"></input>
                                <?php 
                                    }
                                ?>
                            </div>
                        </div>
                    </form>
                </div>
            </div>    
        </div>
    </div>
        <div class="row mt-5">
        <?php
            }
            $comments = $pdo->getMovieComments($id);
            // var_dump($comments);
            foreach($comments as $comment) :
          ?>
        <div class="card me-4 mb-4" style="width: 18rem;">
            <div class="card-body">
                <div class="d-flex justify-content-between">
                    <h5 class="card-title"><?php echo $comment['content']; ?></h5>
                </div>
                <h6 class="card-subtitle mb-2 text-muted"><?php echo $comment['login']." - ".$comment['score']; ?></h6>
                <?php 
                    if(isset($_SESSION['user_data']['login']) && $_SESSION['user_data']['login'] == $comment['login']){
                ?>
                    <a class="btn btn-outline-primary" href="index.php?page=edit_action&comment_id=<?php echo $comment['id'] ?>"><i class="bi bi-pencil"></i></a> 
                    <a class="btn btn-outline-danger" href="index.php?page=delete_action&comment_id=<?php echo $comment['id'] ?>"><i class="bi bi-trash"></i></a> 
                <?php
                    }
                ?>                
            </div>
        </div>
        <?php 
            endforeach;
        ?>
    </div>
</section>