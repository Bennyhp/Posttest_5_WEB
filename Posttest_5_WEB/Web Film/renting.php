<?php
require "config.php";

if (isset($_GET['id'])) {
    $query = mysqli_query($db, "SELECT * FROM films WHERE id=$_GET[id]");
    $result = mysqli_fetch_assoc($query);
    $title = $result['title'];
    $rent = $result['rent'];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="stylesheet/style.css">
    <title>Posttest 5</title>
</head>

<body>
    <nav>
        <div class="nav_container">
            <ul class="nav_items">
                <li><a href="index.php">Home</a></li>
                <li><a href="film.php">Film List</a></li>
                <li><a href="rented.php">Rented List</a></li>
            </ul>
        </div>
    </nav>
    <div class="form_rent">
        <h3>Rent Form</h3>
        <form action="add.php" method="post">
            <label for="">Titles</label><br>
            <select name="films" id="">
                <?php
                $query = mysqli_query($db, "SELECT * FROM films");
                while ($data = mysqli_fetch_array($query)) {
                    echo "<option value=$data[id_films]> $data[title]</option>";
                }
                ?>
            </select><br><br>
            <label for="">Renters Name</label><br>
            <input type="text" name="renter_name" class="form_text"><br><br>

            <label for="">Email</label><br>
            <input type="text" name="email" class="form_text"><br><br>

            <input type="submit" name="submit" value="Confirm" class="btn-submit">
        </form>
    </div>
</body>

</html>