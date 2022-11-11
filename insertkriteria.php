<?php
include('config.php');

if (isset($_POST['insert'])) {
    $id = $_POST['id'];
    $nama = $_POST['nama'];

    $query = "INSERT INTO kriteria (idkriteria,namakriteria) VALUES (" . $id . ",'" . $nama . "')";
    $insert = $conn->query($query);

    if ($insert == true) {
        header('location: formkriteria.php');
    } else {
        echo "
		<script>
		alert('ERORR');
		</script>
		";
    }
}
