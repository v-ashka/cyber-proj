<article>
    <h4>Szukany film: <?php  echo Filter::addName($_REQUEST['search_value'])?></h4>
        <div class="row">
            <?php 
                $searchMovie = $pdo->searchAndShowMovie($_REQUEST['search_value']);
                
                foreach($searchMovie as $foundMovie):
            ?>
            <div class="col-sm-3 mt-4 movie__list">
                <div class="card" style="width: 18rem;">
                <img src="<?php echo "{$foundMovie['image_url']}" ?>" class="card-img-top" alt="James Bond">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo "{$foundMovie['title']}" ?></h5>
                        <p class="card-text"><?php echo substr($foundMovie['content'],0,50); ?>...</p>
                        <p class="card-text">Dodano: <?php echo $foundMovie['created_at']; ?></p>
                        <div class="d-flex">
                            <a href="index.php?page=movie&id=<?php echo $foundMovie['id']; ?>" class="btn btn-primary">Zobacz recenzje</a>
                            <div class="ms-5">6.54</div>
                        </div>
                    </div>
                </div>
            </div>
            <?php 
            endforeach;
            ?>
        </div>
</article>