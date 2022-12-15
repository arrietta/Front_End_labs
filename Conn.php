<?php
$host = "localhost";
$db = "set";
$user ="root";
$pass = "Anna13062004";
try {
    $pdo = new PDO("mysql:host=$host;dbname=$db",$user,$pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $e) {
      echo $sql . "<br>";
    }
?>