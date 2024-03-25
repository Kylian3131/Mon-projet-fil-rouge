<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
?>
<nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="accueil.php"><img src="logo-master-quiz.jpg" alt="Logo" style="height: 100px;"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <section class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav text-center">
            <li class="nav-item">
                <a class="nav-link text-white" href="accueil.php">Accueil</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="quiz.php">Quiz</a>
            </li>
            <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin']): ?>
                <!-- Liens pour les utilisateurs connectés -->
                <li class="nav-item">
                    <a class="nav-link text-white" href="resultats.php">Résultats</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="classements.php">Classements</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="profil.php">Profil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="deconnexion.php">Déconnexion</a>
                </li>
            <?php else: ?>
                <!-- Liens pour les utilisateurs déconnectés -->
                <li class="nav-item">
                    <a class="nav-link text-white" href="connexion.php">Connexion</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="inscription.php">Inscription</a>
                </li>
            <?php endif; ?>
        </ul>
    </section>
</nav>




