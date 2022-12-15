<!DOCTYPE HTML>  
<html>
<head>
  <style>
    *{
      margin:10px ;
      text-align:center ;
    }
    body{
      background-color:rgb(41, 196, 191);
      
    }
  </style>
</head>
<body>  
<h1>Registor</h1>
  <form onsubmit="onSubmit(event)" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
      <input id="login" type="text" placeholder="login" name="login" required><br>
      <input id="password" type="password" placeholder="Password" name="password" required><br>
      <input type="submit" name="submit" value="Submit">  
  </form>
  <a href="login.php">Login</a>
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
      include 'Conn.php';
    try {
      
      $sql = "INSERT INTO login 
      VALUES ('$login','$Pass')";
      $pdo->exec($sql);
      session_start();
      $_SESSION['ID'] = $login;

      echo "New record created successfully";
      ?>
        <script>
          window.open('DB.php',"_self");
        </script>
      
      <?php
      
      } catch(PDOException $e) {
        echo'Try again with another login';
        
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