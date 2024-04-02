<?php
$host = 'localhost';
$db_name = 'u792034982_mastequizz';
$username = 'u792034982_kylian';
$password = 'Kylian31.';

try {
    $conn = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Erreur de connexion : " . $e->getMessage();
}
?>