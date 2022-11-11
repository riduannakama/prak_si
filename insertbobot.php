<?php
include('config.php');

if (isset($_POST['insert'])) {
    $id = $_POST['id'];
    $id_kriteria = $_POST['id_kriteria'];
    $value = $_POST['value'];

    $query = "INSERT INTO bobot (idbobot,idkriteria,value) VALUES (" . $id . "," . $id_kriteria . ",'" . $value . "')";
    $insert = $conn->query($query);

    if ($insert == true) {
        header('location: formbobot.php');
    } else {
        echo "
		<script>
		alert('ERORR');
		</script>
		";
    }
}
