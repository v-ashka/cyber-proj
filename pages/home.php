<article>
    <section>
        <h1>Witamy na Filmawce!</h1>
        <p>Oceniaj bądź sprawdź filmy, zanim pójdziesz do kina!</p>
    </section>
    <section>
        <h2>Ostatnio dodane filmy:</h2>
        <div class="row">
            <?php 
                
                $movies = $pdo->loadMoviesFromDb();
                foreach($movies as $movie) :
            ?>
            <div class="col-sm-3 mt-4 movie__list">
                <div class="card" style="width: 18rem;">
                <img src="<?php echo "{$movie['image_url']}" ?>" class="card-img-top" alt="James Bond">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo "{$movie['title']}" ?></h5>
                        <p class="card-text"><?php echo substr($movie['content'],0,50); ?>...</p>
                        <p class="card-text">Dodano: <?php echo $movie['created_at']; ?></p>
                        <div class="d-flex">
                            <a href="index.php?page=movie&id=<?php echo $movie['id']; ?>" class="btn btn-primary">Zobacz recenzje</a>
                            <div class="ms-5"><?php $pdo->get_movie_score($movie['id'])?></div>
                        </div>
                    </div>
                </div>
            </div>
            <?php 
            endforeach;
            ?>
        </div>
    </section>
</article>