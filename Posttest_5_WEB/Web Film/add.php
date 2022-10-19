
<?php
require "config.php";
$que = mysqli_query($db, "SELECT * FROM films");
$data = mysqli_fetch_array($que);
if (isset($_POST['submit'])) {
    // $films = $_POST[data['id_films']]; NOT FIXED
    $name = $_POST['renter_name'];
    $email = $_POST['email'];
    $query = mysqli_query($db, "INSERT INTO renters (name,email) VALUES ('$name','$email')");
    // $q = mysqli_query($db, "INSERT INTO rented (id_films) VALUES ('$films')"); NOT FIXED
    if ($query) {
        header("Location:index.php");
    } else {
        echo "Tambah data error";
    }
}
?>