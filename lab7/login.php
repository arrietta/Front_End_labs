<!DOCTYPE HTML>  
<html>
<head>
  <style>
    body{
      background-color:rgb(41, 196, 191);
      
    }
    *{
      text-align:center ;
      margin:10px ;
     
    }
  </style>
</head>
<body>  
  <h1>Login</h1>
  <form onsubmit="onSubmit(event)" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
      <input id="login" type="text" placeholder="login" name="login" required><br>
      <input id="password" type="password" placeholder="Password" name="password" required><br>
      <input type="submit" name="submit" value="Submit">  
  </form>
  <a href="index.php">Register</a>
  <?php
  $Pass =$login= "";
  $is = false;
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["password"])) {
      
    } else {
      $is = true;
      $Pass = test_input($_POST["password"]);
    }
    if (empty($_POST["login"])) {
    
    } else {
      $is = true;
      $login = test_input($_POST["login"]);
    }
    ;

    if($is){
      include'Conn.php';


        
  try {
      
    
    $stmt = $pdo->prepare("SELECT * FROM login where login='$login'and password = '$Pass'");
    $stmt->execute();
    $res = $stmt->fetchAll();

    if (count($res)==1){
      session_start();
      $_SESSION['ID'] = $login;

      header("location: DB.php");
      exit();
    }
    
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
      }
      $conn = null;
      echo "</table>";
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