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


<!-- <form action='test.php' method="post">
Name: <input type="text" name="name"><br>
E-mail: <input type="text" name="email"><br>
<input type="submit">
</form> -->

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
    <input id="email" type="text" placeholder="Email" name="email" required><br>
    <input id="password" type="password" placeholder="Password" name="password" required><br>
    <input id="Fname" type="name" placeholder="First name" name="Fname" required><br>
    <input id="Lname" type="name" placeholder="Last name" name="Lname" required><br>
    <input id="login" type="name" placeholder="Login" name="login" required><br>
    <input id="date" type="date"  name="date" required><br>
    <label for="color">Select your favorite color:</label>
    <input type="color" id="color" name="color"><br>
    <input type="checkbox" id="checkbox" name="checkbox" value="KAZAKHSTAN">
    <label for="checkbox">Kazakhstan</label><br>
    <input type="checkbox" id="checkbox" name="checkbox" value="USA">
    <label for="checkbox">USA</label><br>
    <input type="radio" id="ma" name="gender" value="male">
    <label for="ma">Male</label><br>
    <input type="radio" id="fe" name="gender" value="female">
    <label for="fe">Female</label><br>
    <textarea id="Area" name="Area" rows="4" cols="50" >HELLO GUYS
    </textarea>
    <br>
    <label for="cars">Choose a car:</label>
    <select name="cars" id="cars" name="cars">
        <option value="volvo">Volvo</option>
        <option value="saab">Saab</option>
        <option value="mercedes">Mercedes</option>
        <option value="audi">Audi</option>
    </select>
    <br>
    <input type="submit" name="submit" value="Submit">  
</form>

<?php
// define variables and set to empty values

$Fname = $email = $Lname = $Pass =$login =$color=$car= $info= $gender = $box = $date= "";
$is = true;


if ($_SERVER["REQUEST_METHOD"] == "POST") {
  if (empty($_POST["Fname"])) {
    $is = false;
  } else {
    $Fname = test_input($_POST["Fname"]);
  }
  
  if (empty($_POST["Lname"])) {
    $is = false;
  } else {
    $Lname = test_input($_POST["Lname"]);
  }
  if (empty($_POST["password"])) {
    $is = false;
  } else {
    $Pass = test_input($_POST["password"]);
  }
  if (empty($_POST["email"])) {
    $is = false;
  } else {
    $email = test_input($_POST["email"]);
  }
  if (empty($_POST["login"])) {
    $is = false;
  } else {
    $login = test_input($_POST["login"]);
  }
  if (empty($_POST["color"])) {
    $is = false;
  } else {
    $color = test_input($_POST["color"]);
  }
  if (empty($_POST["date"])) {
    $is = false;
  } else {
    $date = test_input($_POST["date"]);
  }
  if (empty($_POST["checkbox"])) {
    $is = false;
  } else {
    $box = test_input($_POST["checkbox"]);
  }
  if (empty($_POST["cars"])) {
    $is = false;
  } else {
    $car = test_input($_POST["cars"]);
  }
  if (empty($_POST["gender"])) {
    $is = false;
  } else {
    $gender = test_input($_POST["gender"]);
  }
  if (empty($_POST["Area"])) {
    $is = false;
  } else {
    $info = test_input($_POST["Area"]);
  }

  if($is){
    $host = "localhost";
    $db = "set";
    $user ="root";
    $pass = "Anna13062004";
try {
    
  $pdo = new PDO("mysql:host=$host;dbname=$db",$user,$pass);
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $sql = "INSERT INTO USER 
  VALUES ('$Fname', '$Lname',' $email','$Pass','$login','$date','$color','$box','$gender','$car','$info')";
  $pdo->exec($sql);
  echo "New record created successfully";
  
} catch(PDOException $e) {
  echo $sql . "<br>" . 'Try again with another login';
}

$pdo = null;
  }
  include("DB.php");
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