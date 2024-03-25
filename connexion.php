<?php
session_start(); // Démarrage de la session 

// Vérifie si l'utilisateur est déjà connecté, si oui, le rediriger vers la page du quiz
if (isset ($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true) {
    header("location: quiz.php");
    exit;
}

require 'modele/database.php';

$pseudo = $password = "";
$pseudo_err = $password_err = $login_err = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $pseudo = trim($_POST["pseudo"]);
    $password = trim($_POST["password"]);

    if (!empty ($pseudo) && !empty ($password)) {
        $sql = "SELECT id_utilisateur, pseudo_utilisateur, mdp_utilisateur FROM utilisateur WHERE pseudo_utilisateur = :pseudo";

        if ($stmt = $conn->prepare($sql)) {
            $stmt->bindParam(':pseudo', $pseudo, PDO::PARAM_STR);

            if ($stmt->execute()) {
                if ($stmt->rowCount() == 1) {
                    if ($row = $stmt->fetch()) {
                        $id_utilisateur = $row["id_utilisateur"];
                        $hashed_password = $row["mdp_utilisateur"];
                        if (password_verify($password, $hashed_password)) {
                            $_SESSION["loggedin"] = true;
                            $_SESSION["id"] = $id_utilisateur;
                            $_SESSION["pseudo"] = $pseudo;
                            header("location: quiz.php");
                        } else {
                            $login_err = "Le mot de passe n'est pas valide.";
                        }
                    }
                } else {
                    $login_err = "Aucun compte trouvé avec ce pseudo.";
                }
            } else {
                echo "Oups! Quelque chose s'est mal passé. Veuillez réessayer plus tard.";
            }
            $stmt = null; // Fermeture du statement
        }
    }
    $conn = null; // Fermeture de la connexion
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
    <title>Connexion - Master Quiz</title>
</head>

<body>

    <!-- --------------------------navbar-------------------------- -->

    <?php
    include 'Composants/navbar.php';
    ?>


    <!-- --------------------------navbar-------------------------- -->

    <!-- --------------------------form connexion-------------------------- -->

    <form class="container mt-5" id="loginForm" method="POST" id="registrationForm" action="connexion.php">
        <section class="container mt-5" id="content">
            <article class="row justify-content-center">
                <header class="col-md-6 text-center mb-5">
                    <h2 class="titre">Bienvenue sur <strong>Master Quiz</strong></h2>
                    <p>Connectez-vous pour découvrir de nouveaux quiz passionnants !</p>
                </header>
            </article>
            <section class="row justify-content-center">
                <article class="col-md-5">
                    <aside class="card">
                        <section class="card-body">
                            <form action="login.php" method="post">
                                <article class="form-group">
                                    <label for="pseudo">Pseudo</label>
                                    <input type="text" class="form-control" name="pseudo" id="pseudo"
                                        placeholder="Pseudo" required>
                                </article>
                                <article class="form-group">
                                    <label for="password">Mot de passe</label>
                                    <input type="password" class="form-control" name="password" id="password"
                                        placeholder="Mot de Passe" required>
                                </article>
                                <button type="submit" class="btn btn-primary w-100">Connexion</button>
                                <?php
                                if (!empty ($login_err)) {
                                    echo '<div class="alert alert-danger">' . $login_err . '</div>';
                                }
                                ?>
                            </form>
                            <hr>
                            <p class="text-center">Pas encore membre ? <a href="inscription.php">Inscrivez-vous
                                    maintenant</a></p>
                        </section>
                    </aside>
                </article>
            </section>
        </section>
    </form>

        <!-- --------------------------form connexion-------------------------- -->


        <!-- --------------footer-------------------------- -->


        <?php
        include 'Composants/footer.php';
        ?>

        <!-- --------------footer-------------------------- -->

        <!-- Bootstrap JS, jQuery, et Popper.js -->
        <script src="connexion.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>

