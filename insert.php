<?php
  echo $_POST['name'];
  $style = $_POST['sub_style'];
  $type = $_POST['sub_type'];
  unset($_POST['sub_style']);
  unset($_POST['sub_type']);
  try {
    $conn = new PDO("mysql:host=localhost;dbname=idolkpop", 'idolkpop', 'password');
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $columns = implode(", ",array_keys($_POST));
    $escaped_values = array_map('mysql_real_escape_string', array_values($_POST));
    $values = implode("', '", $escaped_values);
    if ($style === "Add"){
      if ($type === "Label"){
        $sql = "INSERT INTO `labels`($columns) VALUES ('$values')";
        var_dump($sql);
      }
    }

    $conn->exec($sql);
    echo "It's a miracle";
  }
  catch (PDOException $e) {
    die ($e->getMessage());
  }
  $conn = null;
 ?>
