<?php
include('config.php');

if (isset($_POST['insert'])) {
    $id = $_POST['id'];
    $value = $_POST['valuex'];
    $keterangan = $_POST['keterangan'];

    $query = "INSERT INTO skala (idskala,value,keterangan) VALUES (" . $id . "," . $value . ",'" . $keterangan . "')";
    $insert = $conn->query($query);

    if ($insert == true) {
        header('location: formskala.php');
    } else {
        echo "
		<script>
		alert('ERORR');
		</script>
		";
    }
}
