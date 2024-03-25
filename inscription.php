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
    <title>Inscription -Master Quiz</title>
</head>

<body>

    <!-- --------------------------navbar-------------------------- -->

    <?php
    include 'Composants/navbar.php';
    ?>


    <!-- --------------------------from inscription-------------------------- -->

    <main class="container" id="besoin">
        <section class="row justify-content-center">
            <article class="col-md-6 col-lg-4 mt-5">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title text-center mb-4">Inscription</h3>
                        <form method="POST" id="registrationForm" action="inscription.php">
                            <fieldset>
                                <section class="form-group">
                                    <label for="pseudo">Pseudo</label>
                                    <input type="text" class="form-control" id="pseudo" name="pseudo"
                                        placeholder="Entrer votre pseudo" required>
                                </section>
                                <section class="form-group">
                                    <label for="email">Adresse e-mail</label>
                                    <input type="email" class="form-control" id="email" name="email"
                                        placeholder="Entrer votre e-mail" required>
                                </section>
                                <section class="form-group">
                                    <label for="password">Mot de passe</label>
                                    <input type="password" class="form-control" id="password" name="password"
                                        placeholder="Créer un mot de passe" required>
                                </section>
                                <section class="form-group">
                                    <label for="confirmPassword">Confirmation du mot de passe</label>
                                    <input type="password" class="form-control" id="confirmPassword"
                                        name="confirmPassword" placeholder="Confirmer votre mot de passe" required>
                                    <div class="invalid-feedback">
                                        Les mots de passe ne correspondent pas.
                                    </div>
                                </section>
                            </fieldset>
                            <button type="submit" class="btn btn-primary">S'inscrire</button>
                        </form>
                    </div>
                </div>
            </article>
        </section>
    </main>


    <?php
    require 'modele/database.php';

    $errors = []; // Un tableau pour stocker les messages d'erreur
    
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $pseudo = htmlspecialchars(strip_tags(trim($_POST['pseudo'])));
        $email = filter_var(trim($_POST['email']), FILTER_SANITIZE_EMAIL);
        $password = trim($_POST['password']);
        $confirmPassword = trim($_POST['confirmPassword']);

        // Validation du pseudo
        if (empty($pseudo)) {
            echo '<div class="message-container">';
            $errors[] = "Le pseudo est requis.";
            echo '</div>';
        }

        // Validation de l'email
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo '<div class="message-container">';
            $errors[] = "L'adresse e-mail n'est pas valide.";
            echo '</div>';
        }

        // Validation du mot de passe
        if (strlen($password) < 6) {
            echo '<div class="message-container">';
            $errors[] = "Le mot de passe doit contenir au moins 6 caractères.";
            echo '</div>';
        }

        // Vérification que les mots de passe correspondent
        if ($password !== $confirmPassword) {
            echo '<div class="message-container">';
            $errors[] = "Les mots de passe ne correspondent pas.";
            echo '</div>';
        }

        // Insérer dans la base de données si aucune erreur
        if (empty($errors)) {
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

            $sql = "INSERT INTO utilisateur (pseudo_utilisateur, email_utilisateur, mdp_utilisateur) VALUES (?, ?, ?)";

            try {
                $stmt = $conn->prepare($sql);
                $stmt->execute([$pseudo, $email, $hashedPassword]);
                echo '<div class="message-container">';
                echo "<p>Inscription réussie!</p>";
                echo '</div>';
            } catch (PDOException $exception) {
                die("Erreur lors de l'inscription : " . $exception->getMessage());
            }
        } else {
            echo '<div class="message-container">';
            // Afficher les erreurs
            foreach ($errors as $error) {
                echo '<div class="message-container">';
                echo "<p>$error</p>";
                echo '</div>';
            }
        }
    }
    ?>


    <!-- --------------footer-------------------------- -->


    <?php
    include 'Composants/footer.php';
    ?>

    <!-- --------------footer-------------------------- -->
    <script src="inscription.j"></script>
</body>