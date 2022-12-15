<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <h1>My page</h1>
<?php
session_start(); 
$login= $_SESSION['ID'];
include'Conn.php';
$stmt = $pdo->prepare("SELECT * FROM login where login = '$login' ");
$stmt->execute();
$res = $stmt->fetchAll();
print_r ('<H1>Login '.$res[0]['login']."</H1><br>");
print_r ('<H1>Password '.$res[0]['password']."</H1><br>");
?>
</body>
</html>



