<?php
include('config.php');

if (isset($_POST['insert'])) {
    $id = $_POST['id'];
    $id_alternatif = $_POST['id_alternatif'];
    $id_bobot = $_POST['id_bobot'];
    $id_skala = $_POST['id_skala'];

    $query = "INSERT INTO matixkeputusan (idmatrix,idalternatif,idbobot,idskala) VALUES (" . $id . "," . $id_alternatif . "," . $id_bobot . "," . $id_skala . ")";
    $insert = $conn->query($query);

    if ($insert == true) {
        header('location: formmatrix.php');
    } else {
        echo "
		<script>
		alert('ERORR');
		</script>
		";
    }
}
