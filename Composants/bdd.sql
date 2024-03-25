CREATE DATABASE masterquizz;
USE masterquizz;

CREATE TABLE Utilisateur(
    id_utilisateur INT AUTO_INCREMENT,
    pseudo_utilisateur VARCHAR(50) NOT NULL,
    mdp_utilisateur VARCHAR(160) NOT NULL,
    email_utilisateur VARCHAR(50) NOT NULL,
    score_utilisateur INT DEFAULT 0,
    PRIMARY KEY(id_utilisateur),
    UNIQUE(pseudo_utilisateur),
    UNIQUE(email_utilisateur)
);

CREATE TABLE Quiz(
    id_quiz INT AUTO_INCREMENT,
    nom_quiz VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_quiz)
);

CREATE TABLE Questions(
    id_questions INT AUTO_INCREMENT,
    question VARCHAR(255) NOT NULL,
    id_quiz INT NOT NULL,
    PRIMARY KEY(id_questions),
    FOREIGN KEY(id_quiz) REFERENCES Quiz(id_quiz) ON DELETE CASCADE
);

CREATE TABLE Reponses(
    id_reponses INT AUTO_INCREMENT,
    reponse VARCHAR(255) NOT NULL,
    reponse_correct BOOLEAN NOT NULL,
    id_questions INT NOT NULL,
    PRIMARY KEY(id_reponses),
    FOREIGN KEY(id_questions) REFERENCES Questions(id_questions) ON DELETE CASCADE
);

CREATE TABLE Participer(
    id_utilisateur INT,
    id_quiz INT,
    date_participation DATE NOT NULL,
    score INT DEFAULT 0,
    PRIMARY KEY(id_utilisateur, id_quiz, date_participation),
    FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur) ON DELETE CASCADE,
    FOREIGN KEY(id_quiz) REFERENCES Quiz(id_quiz) ON DELETE CASCADE
);

-- Insertion des quiz dans la table quiz
INSERT INTO Quiz (nom_quiz) VALUES ('Culture Générale');
INSERT INTO Quiz (nom_quiz) VALUES ('Informatique');
INSERT INTO Quiz (nom_quiz) VALUES ('Mangas');

-- Insertion des questions qui correspondent aux quizz
-- Culture Générale
INSERT INTO Questions (question, id_quiz) VALUES
('Quelle est la capitale de la France ?', 1),
('Qui a peint la Joconde ?', 1),
("Quel est l'océan le plus grand ?", 1),
("En quelle année l'homme a-t-il marché sur la lune ?", 1),
("Quel est le plus long fleuve du monde ?", 1),
("Qui a écrit 'Les Misérables' ?", 1);

-- Informatique
INSERT INTO Questions (question, id_quiz) VALUES
('Quel langage est principalement utilisé pour le développement Web Front-end ?', 2),
('En quelle année a été inventé Internet ?', 2),
("Quel est le système d'exploitation le plus utilisé sur les serveurs web ?", 2),
("Qui est le fondateur de Microsoft ?", 2),
("Quel est le port standard pour HTTP ?", 2),
("Qu'est-ce que SQL ?", 2);

-- Mangas
INSERT INTO Questions (question, id_quiz) VALUES
('Qui est le créateur de Naruto ?', 3),
('Quel manga a pour personnage principal Luffy ?', 3),
("Dans 'Death Note', comment s'appelle le dieu de la mort ?", 3),
("Quel est le principal rival de Goku dans 'Dragon Ball' ?", 3),
('Dans quel manga trouve-t-on les Titans ?', 3),
('Qui a écrit "One Punch Man" ?', 3);


-- insertion des reponses aux quiz correspondant
-- Question 1 Réponses
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('Paris', TRUE, 1),
('Lyon', FALSE, 1),
('Marseille', FALSE, 1),
('Bordeaux', FALSE, 1);

-- Question 2 Réponses
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('Leonardo da Vinci', TRUE, 2),
('Vincent Van Gogh', FALSE, 2),
('Pablo Picasso', FALSE, 2),
('Claude Monet', FALSE, 2);

-- Question 3 Réponses
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('Pacifique', TRUE, 3),
('Atlantique', FALSE, 3),
('Indien', FALSE, 3),
('Arctique', FALSE, 3);

-- Question 4 Réponses
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('1969', TRUE, 4),
('1959', FALSE, 4),
('1979', FALSE, 4),
('1989', FALSE, 4);

-- Question 5 Réponses
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('Le Nil', TRUE, 5),
("L'Amazone", FALSE, 5),
('Le Yangtsé', FALSE, 5),
('Le Mississippi', FALSE, 5);

-- Question 6 Réponses
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('Victor Hugo', TRUE, 6),
('Alexandre Dumas', FALSE, 6),
('Émile Zola', FALSE, 6),
('Jean Valjean', FALSE, 6);

-- (informatique)
-- Question 7 Réponses (Développement Web Front-end)
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('JavaScript', TRUE, 7),
('Python', FALSE, 7),
('Java', FALSE, 7),
('C#', FALSE, 7);

-- Question 8 Réponses (Invention d'Internet)
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('1969', TRUE, 8),
('1983', FALSE, 8),
('1971', FALSE, 8),
('1990', FALSE, 8);

-- Question 9 Réponses (Système d'exploitation pour serveurs web)
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('Linux', TRUE, 9),
('Windows Server', FALSE, 9),
('macOS Server', FALSE, 9),
('Unix', FALSE, 9);

-- Question 10 Réponses (Fondateur de Microsoft)
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('Bill Gates', TRUE, 10),
('Steve Jobs', FALSE, 10),
('Mark Zuckerberg', FALSE, 10),
('Larry Page', FALSE, 10);

-- Question 11 Réponses (Port standard pour HTTP)
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('80', TRUE, 11),
('443', FALSE, 11),
('8080', FALSE, 11),
('21', FALSE, 11);

-- Question 12 Réponses (SQL)
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('Structured Query Language', TRUE, 12),
('Simple Quality Language', FALSE, 12),
('Standard Query Language', FALSE, 12),
('Secure Quick Language', FALSE, 12);

-- (Manga)
-- Question 13 Réponses (Créateur de Naruto)
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('Masashi Kishimoto', TRUE, 13),
('Eiichiro Oda', FALSE, 13),
('Tite Kubo', FALSE, 13),
('Akira Toriyama', FALSE, 13);

-- Question 14 Réponses (Personnage principal Luffy)
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('One Piece', TRUE, 14),
('Naruto', FALSE, 14),
('Bleach', FALSE, 14),
('Dragon Ball', FALSE, 14);

-- Question 15 Réponses (Dieu de la mort dans Death Note)
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('Ryuk', TRUE, 15),
('Rem', FALSE, 15),
('Sidoh', FALSE, 15),
('Gelus', FALSE, 15);

-- Question 16 Réponses (Principal rival de Goku)
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('Vegeta', TRUE, 16),
('Frieza', FALSE, 16),
('Cell', FALSE, 16),
('Majin Buu', FALSE, 16);

-- Question 17 Réponses (Manga avec des Titans)
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('Attack on Titan', TRUE, 17),
('Tokyo Ghoul', FALSE, 17),
('Death Note', FALSE, 17),
('Naruto', FALSE, 17);

-- Question 18 Réponses (Auteur de One Punch Man)
INSERT INTO Reponses (reponse, reponse_correct, id_questions) VALUES 
('ONE', TRUE, 18),
('Yusuke Murata', FALSE, 18), -- Note: Yusuke Murata est l'illustrateur pour la version publiée.
('Eiichiro Oda', FALSE, 18),
('Masashi Kishimoto', FALSE, 18);




