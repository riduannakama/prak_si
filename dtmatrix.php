<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Penentu Sekolah</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js" integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/" crossorigin="anonymous"></script>

</head>

<body>

    <div class="header-bar">
        <nav class="navbar navbar-expand-lg navbar-light bg-primary">
            <div class="container">
                <a class="navbar-brand" style="color: #fffafa;" href="index.php">
                    <b>Penentu Sekolah</b>
                </a>
                <div class="collapse navbar-collapse" style="margin-left:700px;" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" style="color: #fffafa;" href="index.php">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" style="color: #fffafa;" href="result.php?metode=saw">SAW</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" style="color: #fffafa;" href="result.php?metode=wp">WP</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" style="color: #fffafa;" href="result.php?metode=topsis">TOPSIS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" style="color: #fffafa;" href="result.php?metode=multimoora">MULTIMOORA</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <div class="container">

        <h3 style="margin-top:20px;">Data Matrix Keputusan</h3>
        <table border="1" cellpadding="10" cellspacing="0">
            <tr>
                <td>No</td>
                <td>ID Matrix</td>
                <td>ID Alternatif</td>
                <td>ID Bobot</td>
                <td>ID Skala</td>
            </tr>

            <!-- dimulainya connection -->
            <?php
            include 'config.php';
            $no = 1;
            $query = "SELECT * FROM matixkeputusan";
            $result = $conn->query($query);
            while ($row = $result->fetch_array()) { ?>
                <tr>
                    <td><?php echo $no++; ?></td>
                    <td><?php echo $row['idmatrix']; ?></td>
                    <td><?php echo $row['idalternatif']; ?></td>
                    <td><?php echo $row['idbobot']; ?></td>
                    <td><?php echo $row['idskala']; ?></td>
                </tr>
            <?php } ?>
        </table>
    </div>
</body>

</html>