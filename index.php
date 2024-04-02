<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <!-- Fichier Css -->
    <link rel="stylesheet" href="style.css">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <title>Accueil -Master Quiz</title>
</head>


<body>

    <!-- --------------------------navbar-------------------------- -->

    <?php
    include 'Composants/navbar.php';
    ?>


    <!-- --------------------------navbar-------------------------- -->

    <!-- ------------------------main-------------------------- -->

    <main class="container mt-4">
        <h1 class="text-center mb-4">Master-Quiz</h1>

        <section class="accueil text-center mb-4">
            <p>
                <strong>Découvrez</strong> le plaisir de tester vos connaissances dans notre quiz captivant ! Êtes-vous
                prêt à relever le
                défi intellectuel et à mettre à l'épreuve votre sagacité ? Notre quiz vous invite à explorer un monde
                fascinant de questions stimulantes, de défis amusants et de découvertes surprenantes.
                Testez vos compétences, mesurez votre intelligence et grimpez dans les classements pour devenir le
                maître du quiz ultime. Rejoignez-nous dans cette aventure palpitante et découvrez combien de réponses
                correctes vous pouvez accumuler. Prêt à jouer <strong>Le défi commence maintenant !</strong>
            </p>
            <img src="photo-quiz.jpg" alt="img-quiz" class="img-fluid">
            <!-- img-fluid pour rendre l'image responsive -->
        </section>

        <section class="accueil-quiz text-center">
            <h2>Accéder au Quiz ↓</h2>
            <a href="quiz.php" class="btn btn-primary start-quiz-btn">Voir les quiz disponibles</a>
        </section>
    </main>

    
    <!-- ------------------------main-------------------------- -->

    <!-- --------------footer-------------------------- -->


    <?php
    include 'Composants/footer.php';
    ?>

    <!-- --------------footer-------------------------- -->


    <!-- Bootstrap JS, jQuery, et Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="accueil.js"></script>
</body>

</html>