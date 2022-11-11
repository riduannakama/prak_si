<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Penentu Sekolah</title>
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
    <?php

    //Josse Andriyanto

    $url = $_GET['metode'];

    if ($url == 'saw') { ?>
        <div class="container">

            <h3 style="margin-top:20px;">Nilai MAX</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>Rangking</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT idalternatif,namaalternatif,SUM(prarangking) AS rangking FROM prarangking GROUP BY idalternatif ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['rangking']; ?></td>
                    </tr>
                <?php } ?>
            </table>
            <h3 style="margin-top:20px;">Matrix Keputusan</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Matrix</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>ID Kriteria</td>
                    <td>Nama Kriteria</td>
                    <td>ID Bobot</td>
                    <td>Value</td>
                    <td>Nilai</td>
                    <td>Keterangan</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT matixkeputusan.idmatrix,alternatif.*,kriteria.*,bobot.idbobot,bobot.value,skala.value AS nilai,skala.keterangan FROM matixkeputusan,skala,bobot,kriteria,alternatif WHERE matixkeputusan.idalternatif=alternatif.idalternatif AND matixkeputusan.idbobot=bobot.idbobot AND matixkeputusan.idskala=skala.idskala AND kriteria.idkriteria=bobot.idkriteria ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idmatrix']; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['idkriteria']; ?></td>
                        <td><?php echo $row['namakriteria']; ?></td>
                        <td><?php echo $row['idbobot']; ?></td>
                        <td><?php echo $row['value']; ?></td>
                        <td><?php echo $row['nilai']; ?></td>
                        <td><?php echo $row['keterangan']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">Normalisasi</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Matrix</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>ID Kriteria</td>
                    <td>Nama Kriteria</td>
                    <td>ID Bobot</td>
                    <td>Value</td>
                    <td>Nilai</td>
                    <td>Keterangan</td>
                    <td>Normalisasi</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT vmatrixkeputusan.*,(vmatrixkeputusan.nilai/nilaimax.maksimum) AS normalisasi FROM vmatrixkeputusan,nilaimax WHERE nilaimax.idkriteria=vmatrixkeputusan.idkriteria GROUP BY vmatrixkeputusan.idmatrix";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idmatrix']; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['idkriteria']; ?></td>
                        <td><?php echo $row['namakriteria']; ?></td>
                        <td><?php echo $row['idbobot']; ?></td>
                        <td><?php echo $row['value']; ?></td>
                        <td><?php echo $row['nilai']; ?></td>
                        <td><?php echo $row['keterangan']; ?></td>
                        <td><?php echo $row['normalisasi']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">Prarangking</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Matrix</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>ID Kriteria</td>
                    <td>Nama Kriteria</td>
                    <td>ID Bobot</td>
                    <td>Value</td>
                    <td>Nilai</td>
                    <td>Keterangan</td>
                    <td>Normalisasi</td>
                    <td>Prarangking</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT vnormalisasi.*,(vnormalisasi.value*vnormalisasi.normalisasi) AS prarangking FROM vnormalisasi GROUP BY vnormalisasi.idmatrix";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idmatrix']; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['idkriteria']; ?></td>
                        <td><?php echo $row['namakriteria']; ?></td>
                        <td><?php echo $row['idbobot']; ?></td>
                        <td><?php echo $row['value']; ?></td>
                        <td><?php echo $row['nilai']; ?></td>
                        <td><?php echo $row['keterangan']; ?></td>
                        <td><?php echo $row['normalisasi']; ?></td>
                        <td><?php echo $row['prarangking']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">Rangking</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>Rangking</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT idalternatif,namaalternatif,SUM(prarangking) AS rangking FROM prarangking GROUP BY idalternatif ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['rangking']; ?></td>
                    </tr>
                <?php } ?>
            </table>
        </div>
    <?php } else if ($url == 'wp') { ?>
        <div class="container">
            <h3 style="margin-top:20px;">WP Jumlah Bobot</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>Jumlah</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $query = "SELECT SUM(value) AS jumlah FROM bobot ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $row['jumlah']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">WP Nilai S</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>Nilai S</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT alternatif.idalternatif,alternatif.namaalternatif,EXP(SUM(LOG(wp_pangkat.pangkat))) AS nilai_s FROM alternatif,wp_pangkat GROUP BY idalternatif ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['nilai_s']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">WP Nilai V</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>Nilai V</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT wp_nilai_s.idalternatif,wp_nilai_s.namaalternatif,(nilai_s/jum) AS nilai_v FROM wp_nilai_s,wp_sum_s ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['nilai_v']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">WP Normalisasi Terbobot</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Bobot</td>
                    <td>ID Kriteria</td>
                    <td>Value</td>
                    <td>Jumlah</td>
                    <td>Normalisasi W</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT bobot.*,wp_jumlahbobot.jumlah,(bobot.value/wp_jumlahbobot.jumlah) AS normalisasi_w FROM bobot,wp_jumlahbobot ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idbobot']; ?></td>
                        <td><?php echo $row['idkriteria']; ?></td>
                        <td><?php echo $row['value']; ?></td>
                        <td><?php echo $row['jumlah']; ?></td>
                        <td><?php echo $row['normalisasi_w']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">WP Pangkat</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Matrix</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>ID Kriteria</td>
                    <td>Nama Kriteria</td>
                    <td>ID Bobot</td>
                    <td>Value</td>
                    <td>Nilai</td>
                    <td>Keterangan</td>
                    <td>Normalisasi W</td>
                    <td>Pangkat</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT vmatrixkeputusan.*,wp_normalisasibobot.normalisasi_w,POW(vmatrixkeputusan.nilai,wp_normalisasibobot.normalisasi_w) AS pangkat FROM vmatrixkeputusan,wp_normalisasibobot WHERE wp_normalisasibobot.idkriteria=vmatrixkeputusan.idkriteria ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idmatrix']; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['idkriteria']; ?></td>
                        <td><?php echo $row['namakriteria']; ?></td>
                        <td><?php echo $row['idbobot']; ?></td>
                        <td><?php echo $row['value']; ?></td>
                        <td><?php echo $row['nilai']; ?></td>
                        <td><?php echo $row['keterangan']; ?></td>
                        <td><?php echo $row['normalisasi_w']; ?></td>
                        <td><?php echo $row['pangkat']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">WP SUMS</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>Jumlah</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $query = "SELECT SUM(wp_nilai_s.nilai_s) AS jum FROM wp_nilai_s ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $row['jum']; ?></td>
                    </tr>
                <?php } ?>
            </table>
        </div>
    <?php } else if ($url == 'topsis') { ?>
        <div class="container">
            <h3 style="margin-top:20px;">Topsis Pembagi</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Kriteria</td>
                    <td>Nama Kriteria</td>
                    <td>Pangkat</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT vmatrixkeputusan.idkriteria,vmatrixkeputusan.namakriteria,SQRT(SUM(POW(vmatrixkeputusan.nilai,2))) AS bagi FROM vmatrixkeputusan GROUP BY vmatrixkeputusan.idkriteria";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idkriteria']; ?></td>
                        <td><?php echo $row['namakriteria']; ?></td>
                        <td><?php echo $row['bagi']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">Topsis Normalisasi</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Matrix</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>ID Kriteria</td>
                    <td>Nama Kriteria</td>
                    <td>ID Bobot</td>
                    <td>Value</td>
                    <td>Nilai</td>
                    <td>Keterangan</td>
                    <td>Normalisasi</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT vmatrixkeputusan.*,(vmatrixkeputusan.nilai/topsis_pembagi.bagi) AS normalisasi FROM vmatrixkeputusan,topsis_pembagi WHERE topsis_pembagi.idkriteria=vmatrixkeputusan.idkriteria GROUP BY vmatrixkeputusan.idmatrix ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idmatrix']; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['idkriteria']; ?></td>
                        <td><?php echo $row['namakriteria']; ?></td>
                        <td><?php echo $row['idbobot']; ?></td>
                        <td><?php echo $row['value']; ?></td>
                        <td><?php echo $row['nilai']; ?></td>
                        <td><?php echo $row['keterangan']; ?></td>
                        <td><?php echo $row['normalisasi']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">Topsis Terbobot</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Matrix</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>ID Kriteria</td>
                    <td>Nama Kriteria</td>
                    <td>ID Bobot</td>
                    <td>Value</td>
                    <td>Nilai</td>
                    <td>Keterangan</td>
                    <td>Normalisasi</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT topsis_normalisasi.*,(bobot.value*topsis_normalisasi.normalisasi) AS terbobot FROM topsis_normalisasi,bobot WHERE bobot.idkriteria=topsis_normalisasi.idkriteria ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idmatrix']; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['idkriteria']; ?></td>
                        <td><?php echo $row['namakriteria']; ?></td>
                        <td><?php echo $row['idbobot']; ?></td>
                        <td><?php echo $row['value']; ?></td>
                        <td><?php echo $row['nilai']; ?></td>
                        <td><?php echo $row['keterangan']; ?></td>
                        <td><?php echo $row['normalisasi']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">Topsis MaxMin</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Matrix</td>
                    <td>ID Kriteria</td>
                    <td>Nama Kriteria</td>
                    <td>Maximum</td>
                    <td>Minimum</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT topsis_normalisasi.idmatrix,topsis_normalisasi.idkriteria,topsis_normalisasi.namakriteria,MAX(bobot.value*topsis_normalisasi.normalisasi) AS maximum,MIN(bobot.value*topsis_normalisasi.normalisasi) AS minimum FROM topsis_normalisasi,bobot WHERE bobot.idkriteria=topsis_normalisasi.idkriteria GROUP BY topsis_normalisasi.idmatrix ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idmatrix']; ?></td>
                        <td><?php echo $row['idkriteria']; ?></td>
                        <td><?php echo $row['namakriteria']; ?></td>
                        <td><?php echo $row['maximum']; ?></td>
                        <td><?php echo $row['minimum']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">Topsis SIP SIN</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Alternatif</td>
                    <td>Dplus</td>
                    <td>Dmin</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT topsis_terbobot.idalternatif,(topsis_maxmin.maximum-topsis_terbobot.terbobot) AS dplus,(topsis_maxmin.minimum-topsis_terbobot.terbobot) AS dmin FROM topsis_terbobot,topsis_maxmin WHERE topsis_terbobot.idkriteria=topsis_maxmin.idkriteria ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['dplus']; ?></td>
                        <td><?php echo $row['dmin']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">Topsis Nilai Preferensi Alternatif ( V )</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Alternatif</td>
                    <td>Dplus</td>
                    <td>Dmin</td>
                    <td>Nilai V</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT topsis_sipsin.*,(topsis_sipsin.dmin/(topsis_sipsin.dplus+topsis_sipsin.dmin)) AS nilai_v FROM topsis_sipsin ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['dplus']; ?></td>
                        <td><?php echo $row['dmin']; ?></td>
                        <td><?php echo $row['nilai_v']; ?></td>
                    </tr>
                <?php } ?>
            </table>
        </div>
    <?php } else if ($url == 'multimoora') { ?>
        <div class="container">
            <h3 style="margin-top:20px;">Multimoora 1</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Matrix</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>ID Kriteria</td>
                    <td>Nama Kriteria</td>
                    <td>ID Bobot</td>
                    <td>Value</td>
                    <td>Nilai</td>
                    <td>Keterangan</td>
                    <td>Pra</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT vmatrixkeputusan.*,vmatrixkeputusan.nilai AS pra FROM vmatrixkeputusan ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idmatrix']; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['idkriteria']; ?></td>
                        <td><?php echo $row['namakriteria']; ?></td>
                        <td><?php echo $row['idbobot']; ?></td>
                        <td><?php echo $row['value']; ?></td>
                        <td><?php echo $row['nilai']; ?></td>
                        <td><?php echo $row['keterangan']; ?></td>
                        <td><?php echo $row['pra']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">Multimoora 2</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Matrix</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>ID Kriteria</td>
                    <td>Nama Kriteria</td>
                    <td>ID Bobot</td>
                    <td>Value</td>
                    <td>Nilai</td>
                    <td>Keterangan</td>
                    <td>Pra</td>
                    <td>Normalisasi</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT vmatrixkeputusan.*,multimoora_1.pra, (vmatrixkeputusan.nilai/multimoora_1.pra) AS normalisasi FROM vmatrixkeputusan,multimoora_1 WHERE multimoora_1.idkriteria=vmatrixkeputusan.idkriteria ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idmatrix']; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['idkriteria']; ?></td>
                        <td><?php echo $row['namakriteria']; ?></td>
                        <td><?php echo $row['idbobot']; ?></td>
                        <td><?php echo $row['value']; ?></td>
                        <td><?php echo $row['nilai']; ?></td>
                        <td><?php echo $row['keterangan']; ?></td>
                        <td><?php echo $row['pra']; ?></td>
                        <td><?php echo $row['normalisasi']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">Multimoora 3</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Matrix</td>
                    <td>ID Alternatif</td>
                    <td>Nama Alternatif</td>
                    <td>ID Kriteria</td>
                    <td>Nama Kriteria</td>
                    <td>ID Bobot</td>
                    <td>Value</td>
                    <td>Nilai</td>
                    <td>Keterangan</td>
                    <td>Pra</td>
                    <td>Normalisasi</td>
                    <td>Normalisasi Bobot</td>
                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT multimoora_2.*,(multimoora_2.normalisasi*multimoora_2.value) AS normalisasibobot FROM multimoora_2 ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idmatrix']; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['namaalternatif']; ?></td>
                        <td><?php echo $row['idkriteria']; ?></td>
                        <td><?php echo $row['namakriteria']; ?></td>
                        <td><?php echo $row['idbobot']; ?></td>
                        <td><?php echo $row['value']; ?></td>
                        <td><?php echo $row['nilai']; ?></td>
                        <td><?php echo $row['keterangan']; ?></td>
                        <td><?php echo $row['pra']; ?></td>
                        <td><?php echo $row['normalisasi']; ?></td>
                        <td><?php echo $row['normalisasibobot']; ?></td>
                    </tr>
                <?php } ?>
            </table>

            <h3 style="margin-top:20px;">Multimoora 4</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td>No</td>
                    <td>ID Matrix</td>
                    <td>ID Alternatif</td>

                </tr>

                <!-- dimulainya connection -->
                <?php
                include 'config.php';
                $no = 1;
                $query = "SELECT multimoora_3.idalternatif,SUM(multimoora_3.normalisasibobot) AS hasil FROM multimoora_3 GROUP BY multimoora_3.idalternatif ";
                $result = $conn->query($query);
                while ($row = $result->fetch_array()) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $row['idalternatif']; ?></td>
                        <td><?php echo $row['hasil']; ?></td>

                    </tr>
                <?php } ?>
            </table>
        </div>
    <?php } else { ?>
        <div class="container">
            <h3>Anda belum memasukkan $_GET. Contoh seperti result.php?metode=saw</h3>
        </div>
    <?php } ?>
</body>

</html>