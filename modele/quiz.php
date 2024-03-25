<?php
require_once 'Database.php';

class Questions {
    private $conn;
    private $table_name = "Questions";

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();
    }

    // Méthode pour récupérer toutes les questions d'un quiz spécifique avec une requête préparée
    public function getQuestionsByQuizId($quizId) {
        $query = "SELECT id_questions, question FROM " . $this->table_name . " WHERE id_quiz = :id_quiz";
        $stmt = $this->conn->prepare($query);

        // Liaison des paramètres
        $stmt->bindParam(':id_quiz', $quizId, PDO::PARAM_INT);

        $stmt->execute();

        return $stmt;
    }
}
?>
