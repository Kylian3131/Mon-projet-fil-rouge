<?php
require_once 'modele/database.php'; 

// Récupére l'ID du quiz depuis l'URL.
$idQuiz = isset ($_GET['id']) ? $_GET['id'] : die ("ID du quiz non spécifié.");

try {
    // Récupérez les questions pour le quiz spécifié.
    $sqlQuestions = "SELECT id_questions, question FROM questions WHERE id_quiz = ?";
    $stmtQuestions = $conn->prepare($sqlQuestions);
    $stmtQuestions->execute([$idQuiz]);
    $questions = $stmtQuestions->fetchAll();
} catch (PDOException $e) {
    die ("Erreur lors de la récupération des questions : " . $e->getMessage());
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
    <!-- Fichier CSS -->
    <link rel="stylesheet" href="style.css">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <title>Jouer - Master Quiz</title>
</head>

<body>

    <!-- --------------------------navbar-------------------------- -->

    <?php
    include 'Composants/navbar.php';
    ?>
    

    <!-- --------------------------navbar-------------------------- -->


    <main class="container mt-5" id="besoin">
        <h2 class="mb-4">Questions du Quiz</h2>
        <form action="submit_quiz.php" method="POST">
            <?php foreach ($questions as $index => $question): ?>
                <div class="mb-3">
                    <p class="fw-bold">
                        <?php echo htmlspecialchars($question['question']); ?>
                    </p>
                    <?php
                    // Récupérez les réponses pour la question courante.
                    $sqlReponses = "SELECT id_reponses, reponse, reponse_correct FROM reponses WHERE id_questions = ?";
                    $stmtReponses = $conn->prepare($sqlReponses);
                    $stmtReponses->execute([$question['id_questions']]);
                    $reponses = $stmtReponses->fetchAll();
                    foreach ($reponses as $reponse): ?>
                        <div class="form-check">
                            <input class="form-check-input" type="radio"
                                name="reponse[<?php echo $question['id_questions']; ?>]"
                                id="reponse-<?php echo $reponse['id_reponses']; ?>"
                                value="<?php echo $reponse['id_reponses']; ?>">
                            <label class="form-check-label" for="reponse-<?php echo $reponse['id_reponses']; ?>">
                                <?php echo htmlspecialchars($reponse['reponse']); ?>
                            </label>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endforeach; ?>
            <button type="submit" class="btn btn-primary">Soumettre le Quiz</button>
        </form>
    </main>

    


    <!-- --------------footer-------------------------- -->

    <?php
    include 'Composants/footer.php';
    ?>

    <!-- --------------footer-------------------------- -->
    <!-- Bootstrap JS, jQuery, et Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
