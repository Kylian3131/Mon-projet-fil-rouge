<?php

class Question
{
    private $id;
    private $question;
    private $idQuiz;

    public function __construct($id, $question, $idQuiz)
    {
        $this->id = $id;
        $this->question = $question;
        $this->idQuiz = $idQuiz;
    }

    // Getters
    public function getId()
    {
        return $this->id;
    }

    public function getQuestion()
    {
        return $this->question;
    }

    public function getIdQuiz()
    {
        return $this->idQuiz;
    }

    // Setters
    public function setId($id)
    {
        $this->id = $id;
    }

    public function setQuestion($question)
    {
        $this->question = $question;
    }

    public function setIdQuiz($idQuiz)
    {
        $this->idQuiz = $idQuiz;
    }

    // Récupérer toutes les questions pour un quiz donné
    public static function getQuestionsByQuizId($pdo, $idQuiz)
    {
        $stmt = $pdo->prepare("SELECT id_questions, question, id_quiz FROM Questions WHERE id_quiz = ?");
        $stmt->execute([$idQuiz]);
        $questions = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $questions[] = new self($row['id_questions'], $row['question'], $row['id_quiz']);
        }
        return $questions;
    }
}

?>