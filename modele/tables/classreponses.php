<?php

class Reponse
{
    private $id;
    private $reponse;
    private $reponseCorrect;
    private $idQuestions;

    public function __construct($id, $reponse, $reponseCorrect, $idQuestions)
    {
        $this->id = $id;
        $this->reponse = $reponse;
        $this->reponseCorrect = $reponseCorrect;
        $this->idQuestions = $idQuestions;
    }

    // Getters
    public function getId()
    {
        return $this->id;
    }

    public function getReponse()
    {
        return $this->reponse;
    }

    public function getReponseCorrect()
    {
        return $this->reponseCorrect;
    }

    public function getIdQuestions()
    {
        return $this->idQuestions;
    }

    // Setters
    public function setId($id)
    {
        $this->id = $id;
    }

    public function setReponse($reponse)
    {
        $this->reponse = $reponse;
    }

    public function setReponseCorrect($reponseCorrect)
    {
        $this->reponseCorrect = $reponseCorrect;
    }

    public function setIdQuestions($idQuestions)
    {
        $this->idQuestions = $idQuestions;
    }

    // Récupérer toutes les réponses pour une question donnée
    public static function getReponsesByQuestionId($pdo, $idQuestions)
    {
        $stmt = $pdo->prepare("SELECT id_reponses, reponse, reponse_correct, id_questions FROM Reponses WHERE id_questions = ?");
        $stmt->execute([$idQuestions]);
        $reponses = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $reponses[] = new self($row['id_reponses'], $row['reponse'], $row['reponse_correct'], $row['id_questions']);
        }
        return $reponses;
    }
}

?>