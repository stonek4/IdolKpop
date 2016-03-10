<?php
  $style = $_POST['sub_style'];
  $type = $_POST['sub_type'];
  $label = "";
  $act = "";

  unset($_POST['sub_style']);
  unset($_POST['sub_type']);
  unset($_POST['introduction_video']);
  unset($_POST['gender']);
  unset($_POST['blood_type']);

  if ($type == "Idol" && $style == "Add"){
    $act = $_POST['act'];
    unset($_POST['act']);
  }
  if ($type != "Label" && $style == "Add"){
    $label = $_POST['label'];
    unset($_POST['label']);
  }

  try {

    $conn = new PDO("mysql:host=localhost;dbname=idolkpop", 'idolkpop', 'password');
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $columns = implode(", ",array_keys($_POST));
    $escaped_values = array_map('mysql_real_escape_string', array_values($_POST));
    $values = implode("', '", $escaped_values);

    if ($style === "Add"){
      if ($type === "Label"){
        $sql = "INSERT INTO `labels`($columns) VALUES ('$values')";
        $conn->exec($sql);
      }
      if ($type === "Act"){
        $stmt = $conn->prepare("SELECT label_id FROM labels l WHERE l.name = '$label'");
        $stmt -> execute();
        $labelid = $stmt -> fetch();
        $labelid = $labelid['label_id'];
        $stmt = $conn->prepare("INSERT INTO `acts`($columns) VALUES ('$values')");
        $stmt -> execute();
        $actid = $conn->lastInsertId();
        $sql = "INSERT INTO `labels_acts`(label_id,act_id) VALUES ('$labelid', '$actid')";
        $conn->exec($sql);
      }
      if ($type === "Idol"){
        $stmt = $conn->prepare("SELECT act_id FROM acts a WHERE a.name = '$act'");
        $stmt -> execute();
        $actid = $stmt -> fetch();
        $actid = $actid['act_id'];
        $stmt = $conn->prepare("INSERT INTO `idols`($columns) VALUES ('$values')");
        $stmt -> execute();
        $idolid = $conn->lastInsertId();
        $sql = "INSERT INTO `acts_idols`(act_id,idol_id) VALUES ('$actid', '$idolid')";
        $conn->exec($sql);
      }
    }
    echo "It's a miracle";
  }
  catch (PDOException $e) {
    die ($e->getMessage());
  }
  $conn = null;
 ?>
