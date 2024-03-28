<?php
session_start();

// Redirige l'utilisateur sur la page de connexion si il n'est pas connecté
if (!isset ($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("location: connexion.php");
    exit;
}
?>

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
    <title>Quiz -Master Quiz</title>
</head>

<body>

    <!-- --------------------------navbar-------------------------- -->

    <?php
    include 'Composants/navbar.php';
    ?>

    <!-- --------------------------php-------------------------- -->

    <?php
    // fichier de configuration de la base de données
    require_once 'modele/database.php';

    try {
        // requête SQL pour récupérer tous les quiz
        $sql = "SELECT id_quiz, nom_quiz FROM Quiz";
        $stmt = $conn->prepare($sql);
        $stmt->execute();

        // Récupérer les résultats
        $quizzes = $stmt->fetchAll();
    } catch (PDOException $e) {
        die ("ERROR: Could not connect. " . $e->getMessage());
    }
    ?>


    <!-- ------------------------------------main---------------------------------- -->

    <main class="container mt-5 mb-5">
        <h2 class="mb-4 text-center">Liste des Quiz Disponibles</h2>
        <card class="list-group text-center">
            <?php foreach ($quizzes as $quiz): ?>
                <a href="lancer_quiz.php?id=<?php echo $quiz['id_quiz']; ?>" class="list-group-item list-group-item-action">
                    <?php echo htmlspecialchars($quiz['nom_quiz']); ?>
                </a>
            <?php endforeach; ?>
        </card>
    </main>

    <!-- --------------footer-------------------------- -->


    <?php
    include 'Composants/footer.php';
    ?>

    <!-- --------------footer-------------------------- -->


    <!-- Bootstrap JS, jQuery, et Popper.js -->
    <script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js'></script>
    <script src="https://kit.fontawesome.com/e7f058bcf8.js" crossorigin="anonymous"></script>
</body>

</html>