<!DOCTYPE HTML>  
<html>
<head>
  <style>
    *{
      margin:10px ;
    }
  </style>
</head>
<body>  
  <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
      <input id="login" type="text" placeholder="login" name="login" required><br>
      <input id="password" type="password" placeholder="Password" name="password" required><br>
      <input type="submit" name="submit" value="Submit">  
  </form>
  <?php
  $Pass =$login= "";
  $is = true;
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["password"])) {
      $is = false;
    } else {
      $Pass = test_input($_POST["password"]);
    }
    if (empty($_POST["login"])) {
      $is = false;
    } else {
      $login = test_input($_POST["login"]);
    }
    

    if($is){
      $host = "localhost";
      $db = "set";
      $user ="root";
      $pass = "Anna13062004";
  try {
      
    $pdo = new PDO("mysql:host=$host;dbname=$db",$user,$pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "INSERT INTO login 
    VALUES ('$login','$Pass')";
    $pdo->exec($sql);
    echo "New record created successfully";
    
    } catch(PDOException $e) {
      echo $sql . "<br>" . 'Try again with another login';
    }

    $pdo = null;
      }
      
    }

    function test_input($data) {
      $data = trim($data);
      $data = stripslashes($data);
      $data = htmlspecialchars($data);
      return $data;
    }
  ?>
</body>
</html>