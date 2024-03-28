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
    <title>Connexion - Master Quiz</title>
</head>

<body>

    <!-- --------------------------navbar-------------------------- -->

    <?php
    include 'Composants/navbar.php';
    ?>


    <!-- --------------------------php-------------------------- -->



    <?php
    require_once 'modele/database.php';

    $score = 0;
    $feedback = []; // Pour stocker les feedbacks sur les réponses incorrectes.
    
    if (!empty ($_POST['reponse'])) {
        foreach ($_POST['reponse'] as $idQuestion => $idReponseUtilisateur) {
            // Récupérer la question, la réponse de l'utilisateur et la bonne réponse.
            $sql = "SELECT Q.question, R.reponse, R.reponse_correct, R.id_reponses 
                FROM Questions Q
                JOIN Reponses R ON Q.id_questions = R.id_questions 
                WHERE Q.id_questions = ?";
            $stmt = $conn->prepare($sql);
            $stmt->execute([$idQuestion]);
            $reponses = $stmt->fetchAll();

            // Identifier la réponse de l'utilisateur et la bonne réponse.
            $reponseUtilisateur = current(array_filter($reponses, function ($reponse) use ($idReponseUtilisateur) {
                return $reponse['id_reponses'] == $idReponseUtilisateur;
            }));
            $reponseCorrecte = current(array_filter($reponses, function ($reponse) {
                return $reponse['reponse_correct'];
            }));

            if ($reponseUtilisateur['id_reponses'] == $reponseCorrecte['id_reponses']) {
                $score++;
            } else {
                // Stocker le feedback si la réponse est incorrecte.
                $feedback[$idQuestion] = [
                    'question' => $reponses[0]['question'], // Texte de la question.
                    'votreReponse' => $reponseUtilisateur['reponse'], // Texte de la réponse de l'utilisateur.
                    'bonneReponse' => $reponseCorrecte['reponse'] // Texte de la bonne réponse.
                ];
            }
        }
    }
    ?>

    <!-- Vérifier si l'utilisateur a répondu à au moins une question  -->
    <?php
    if (empty ($_POST['reponse'])) {
        echo '<div class="message-container text-center" style="color: red;">';
        echo "Vous n'avez répondu à aucune question.";
        echo '</div>';
    } else {
        // Le reste de votre code ici...
    }
    ?>

    <!-- --------------------------main-------------------------- -->

    <main class="container mt-5 mb-5">
        <article class="card">
            <header class="card-header">Résultats du Quiz</header>
            <div class="card-body">
                <h2 class="card-title">Votre score :
                    <?php echo $score; ?>
                </h2>
                <br>
                <?php if (!empty ($feedback)): ?>
                    <section>
                        <h3>Voici les détails des questions que vous avez manquées :</h3>
                        <br>
                        <ul>
                            <?php foreach ($feedback as $info): ?>
                                <li>
                                    <strong>Question :</strong>
                                    <?php echo htmlspecialchars($info['question']); ?><br>
                                    <strong class="incorrect-answer">Votre réponse :</strong>
                                    <?php echo htmlspecialchars($info['votreReponse']); ?><br><br>
                                    <strong class="correct-answer">Réponse correcte :</strong>
                                    <?php echo htmlspecialchars($info['bonneReponse']); ?><br><br>
                                </li>
                            <?php endforeach; ?>
                        </ul>
                    </section>
                <?php else: ?>
                    <p>Félicitations !!! Vous avez répondu correctement à toutes les questions.</p>
                <?php endif; ?>
                <a href="quiz.php" class="btn btn-primary">Essayer un autre quiz</a>
            </div>
        </article>
    </main>

    <!-- --------------footer-------------------------- -->


    <?php
    include 'Composants/footer.php';
    ?>

    <!-- --------------footer-------------------------- -->