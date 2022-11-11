-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for riduan
CREATE DATABASE IF NOT EXISTS `riduan` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `riduan`;

-- Dumping structure for table riduan.alternatif
CREATE TABLE IF NOT EXISTS `alternatif` (
  `idalternatif` int(11) NOT NULL AUTO_INCREMENT,
  `namaalternatif` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idalternatif`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table riduan.alternatif: ~4 rows (approximately)
/*!40000 ALTER TABLE `alternatif` DISABLE KEYS */;
INSERT INTO `alternatif` (`idalternatif`, `namaalternatif`) VALUES
	(1, 'sangat baik'),
	(2, 'baik'),
	(3, 'kurang'),
	(4, 'sangat kurang');
/*!40000 ALTER TABLE `alternatif` ENABLE KEYS */;

-- Dumping structure for table riduan.bobot
CREATE TABLE IF NOT EXISTS `bobot` (
  `idbobot` int(11) NOT NULL AUTO_INCREMENT,
  `idkriteria` int(11) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idbobot`),
  KEY `idkriteria` (`idkriteria`),
  CONSTRAINT `FK_bobot_kriteria` FOREIGN KEY (`idkriteria`) REFERENCES `kriteria` (`idkriteria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table riduan.bobot: ~4 rows (approximately)
/*!40000 ALTER TABLE `bobot` DISABLE KEYS */;
INSERT INTO `bobot` (`idbobot`, `idkriteria`, `value`) VALUES
	(1, 1, '0.456'),
	(2, 2, '0.256'),
	(3, 3, '0.156'),
	(4, 4, '0.09');
/*!40000 ALTER TABLE `bobot` ENABLE KEYS */;

-- Dumping structure for table riduan.kriteria
CREATE TABLE IF NOT EXISTS `kriteria` (
  `idkriteria` int(11) NOT NULL AUTO_INCREMENT,
  `namakriteria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idkriteria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table riduan.kriteria: ~4 rows (approximately)
/*!40000 ALTER TABLE `kriteria` DISABLE KEYS */;
INSERT INTO `kriteria` (`idkriteria`, `namakriteria`) VALUES
	(1, 'hardskill'),
	(2, 'minat'),
	(3, 'kemampuan'),
	(4, 'adaptasi');
/*!40000 ALTER TABLE `kriteria` ENABLE KEYS */;

-- Dumping structure for table riduan.matixkeputusan
CREATE TABLE IF NOT EXISTS `matixkeputusan` (
  `idmatrix` int(11) NOT NULL AUTO_INCREMENT,
  `idalternatif` int(11) DEFAULT NULL,
  `idbobot` int(11) DEFAULT NULL,
  `idskala` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmatrix`),
  KEY `FK__alternatif` (`idalternatif`),
  KEY `FK__bobot` (`idbobot`),
  KEY `FK__kriteria` (`idskala`),
  CONSTRAINT `FK__alternatif` FOREIGN KEY (`idalternatif`) REFERENCES `alternatif` (`idalternatif`),
  CONSTRAINT `FK__bobot` FOREIGN KEY (`idbobot`) REFERENCES `bobot` (`idbobot`),
  CONSTRAINT `FK__kriteria` FOREIGN KEY (`idskala`) REFERENCES `kriteria` (`idkriteria`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table riduan.matixkeputusan: ~16 rows (approximately)
/*!40000 ALTER TABLE `matixkeputusan` DISABLE KEYS */;
INSERT INTO `matixkeputusan` (`idmatrix`, `idalternatif`, `idbobot`, `idskala`) VALUES
	(1, 1, 1, 1),
	(2, 1, 2, 1),
	(3, 1, 3, 1),
	(4, 1, 4, 1),
	(5, 2, 1, 2),
	(6, 2, 2, 2),
	(7, 2, 3, 2),
	(8, 2, 4, 2),
	(9, 3, 1, 3),
	(10, 3, 2, 3),
	(11, 3, 3, 3),
	(12, 3, 4, 3),
	(13, 4, 1, 4),
	(14, 4, 2, 4),
	(15, 4, 3, 4),
	(16, 4, 4, 4);
/*!40000 ALTER TABLE `matixkeputusan` ENABLE KEYS */;

-- Dumping structure for view riduan.multimoora_1
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `multimoora_1` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`pra` INT(11) NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.multimoora_2
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `multimoora_2` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`pra` INT(11) NULL,
	`normalisasi` DECIMAL(14,4) NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.multimoora_3
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `multimoora_3` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`pra` INT(11) NULL,
	`normalisasi` DECIMAL(14,4) NULL,
	`normalisasibobot` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.multimoora_4
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `multimoora_4` (
	`idalternatif` INT(11) NOT NULL,
	`hasil` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.nilaimax
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `nilaimax` (
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`maksimum` INT(11) NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.prarangking
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `prarangking` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi` DECIMAL(14,4) NULL,
	`prarangking` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for table riduan.skala
CREATE TABLE IF NOT EXISTS `skala` (
  `idskala` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idskala`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table riduan.skala: ~4 rows (approximately)
/*!40000 ALTER TABLE `skala` DISABLE KEYS */;
INSERT INTO `skala` (`idskala`, `value`, `keterangan`) VALUES
	(1, 1, 'sangat kurang'),
	(2, 2, 'kurang'),
	(3, 3, 'baik'),
	(4, 4, 'sangat baik');
/*!40000 ALTER TABLE `skala` ENABLE KEYS */;

-- Dumping structure for view riduan.topsis_maxmin
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `topsis_maxmin` (
	`idmatrix` INT(11) NOT NULL,
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`maximum` DOUBLE NULL,
	`minimum` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.topsis_nilaiv
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `topsis_nilaiv` (
	`idalternatif` INT(11) NOT NULL,
	`dplus` DOUBLE NULL,
	`dmin` DOUBLE NULL,
	`nilaiv` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.topsis_normalisasi
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `topsis_normalisasi` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.topsis_pembagi
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `topsis_pembagi` (
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`bagi` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.topsis_sipsin
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `topsis_sipsin` (
	`idalternatif` INT(11) NOT NULL,
	`dplus` DOUBLE NULL,
	`dmin` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.topsis_terbobot
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `topsis_terbobot` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi` DOUBLE NULL,
	`terbobot` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.vmatrixkeputusan
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vmatrixkeputusan` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view riduan.vnormalisasi
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vnormalisasi` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi` DECIMAL(14,4) NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.vrangking
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vrangking` (
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`rangking` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.wp_jumlahbobot
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_jumlahbobot` (
	`jumlah` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.wp_nilai_s
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_nilai_s` (
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai_s` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.wp_nilai_v
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_nilai_v` (
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai_v` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.wp_normalisasibobot
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_normalisasibobot` (
	`idbobot` INT(11) NOT NULL,
	`idkriteria` INT(11) NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`jumlah` DOUBLE NULL,
	`normalisasi_w` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.wp_pangkat
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_pangkat` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi_w` DOUBLE NULL,
	`pangkat` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.wp_sum_s
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_sum_s` (
	`jum` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view riduan.wp_vmatrixkeputusan
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_vmatrixkeputusan` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`namaalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`namakriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view riduan.multimoora_1
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `multimoora_1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `multimoora_1` AS SELECT vmatrixkeputusan.*,vmatrixkeputusan.nilai AS pra FROM vmatrixkeputusan ;

-- Dumping structure for view riduan.multimoora_2
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `multimoora_2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `multimoora_2` AS SELECT vmatrixkeputusan.*,multimoora_1.pra, (vmatrixkeputusan.nilai/multimoora_1.pra) AS normalisasi FROM vmatrixkeputusan,multimoora_1 WHERE multimoora_1.idkriteria=vmatrixkeputusan.idkriteria ;

-- Dumping structure for view riduan.multimoora_3
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `multimoora_3`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `multimoora_3` AS SELECT multimoora_2.*,(multimoora_2.normalisasi*multimoora_2.value) AS normalisasibobot FROM multimoora_2 ;

-- Dumping structure for view riduan.multimoora_4
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `multimoora_4`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `multimoora_4` AS SELECT multimoora_3.idalternatif,SUM(multimoora_3.normalisasibobot) AS hasil FROM multimoora_3 GROUP BY multimoora_3.idalternatif ;

-- Dumping structure for view riduan.nilaimax
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `nilaimax`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nilaimax` AS SELECT idkriteria,namakriteria,MAX(nilai) AS maksimum FROM vmatrixkeputusan GROUP BY idkriteria ;

-- Dumping structure for view riduan.prarangking
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `prarangking`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prarangking` AS SELECT vnormalisasi.*,(vnormalisasi.value*vnormalisasi.normalisasi) AS prarangking FROM vnormalisasi GROUP BY vnormalisasi.idmatrix ;

-- Dumping structure for view riduan.topsis_maxmin
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `topsis_maxmin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsis_maxmin` AS SELECT topsis_terbobot.idmatrix, topsis_terbobot.idkriteria, topsis_terbobot.namakriteria, MAX(topsis_terbobot.terbobot) AS maximum, MIN(topsis_terbobot.terbobot) AS minimum
FROM topsis_terbobot GROUP BY topsis_terbobot.idkriteria ;

-- Dumping structure for view riduan.topsis_nilaiv
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `topsis_nilaiv`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsis_nilaiv` AS SELECT topsis_sipsin.*, (topsis_sipsin.dmin/(topsis_sipsin.dplus+topsis_sipsin.dmin)) AS nilaiv from topsis_sipsin GROUP BY topsis_sipsin.idalternatif ;

-- Dumping structure for view riduan.topsis_normalisasi
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `topsis_normalisasi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsis_normalisasi` AS SELECT vmatrixkeputusan.*, (vmatrixkeputusan.nilai/topsis_pembagi.bagi) AS normalisasi FROM vmatrixkeputusan, topsis_pembagi WHERE topsis_pembagi.idkriteria=vmatrixkeputusan.idkriteria
GROUP BY vmatrixkeputusan.idmatrix ;

-- Dumping structure for view riduan.topsis_pembagi
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `topsis_pembagi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsis_pembagi` AS SELECT vmatrixkeputusan.idkriteria, vmatrixkeputusan.namakriteria, SQRT(SUM(POW(vmatrixkeputusan.nilai,2))) AS bagi FROM vmatrixkeputusan
GROUP BY vmatrixkeputusan.idkriteria ;

-- Dumping structure for view riduan.topsis_sipsin
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `topsis_sipsin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsis_sipsin` AS SELECT topsis_terbobot.idalternatif, SQRT(SUM(POW((topsis_maxmin.maximum-topsis_terbobot.terbobot),2))) AS dplus, SQRT(SUM(POW((topsis_maxmin.minimum-topsis_terbobot.terbobot),2))) AS dmin
FROM topsis_terbobot, topsis_maxmin WHERE topsis_terbobot.idkriteria=topsis_maxmin.idkriteria GROUP BY topsis_terbobot.idalternatif ;

-- Dumping structure for view riduan.topsis_terbobot
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `topsis_terbobot`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsis_terbobot` AS SELECT topsis_normalisasi.*, (bobot.value*topsis_normalisasi.normalisasi) AS terbobot FROM topsis_normalisasi, bobot WHERE bobot.idkriteria=topsis_normalisasi.idkriteria
GROUP BY topsis_normalisasi.idmatrix ;

-- Dumping structure for view riduan.vmatrixkeputusan
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vmatrixkeputusan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vmatrixkeputusan` AS SELECT matixkeputusan.idmatrix,alternatif.*,kriteria.*,bobot.idbobot,bobot.value,skala.value AS nilai,skala.keterangan FROM matixkeputusan,skala,bobot,kriteria,alternatif WHERE matixkeputusan.idalternatif=alternatif.idalternatif AND matixkeputusan.idbobot=bobot.idbobot AND matixkeputusan.idskala=skala.idskala AND kriteria.idkriteria=bobot.idkriteria ;

-- Dumping structure for view riduan.vnormalisasi
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vnormalisasi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnormalisasi` AS SELECT vmatrixkeputusan.*,(vmatrixkeputusan.nilai/nilaimax.maksimum) AS normalisasi FROM vmatrixkeputusan,nilaimax WHERE nilaimax.idkriteria=vmatrixkeputusan.idkriteria GROUP BY vmatrixkeputusan.idmatrix ;

-- Dumping structure for view riduan.vrangking
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vrangking`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vrangking` AS SELECT idalternatif,namaalternatif,SUM(prarangking) AS rangking FROM prarangking GROUP BY idalternatif ;

-- Dumping structure for view riduan.wp_jumlahbobot
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_jumlahbobot`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_jumlahbobot` AS SELECT SUM(VALUE) AS jumlah FROM bobot ;

-- Dumping structure for view riduan.wp_nilai_s
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_nilai_s`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_nilai_s` AS SELECT idalternatif,namaalternatif,EXP(SUM(LOG(wp_pangkat.pangkat))) AS nilai_s FROM wp_pangkat GROUP BY idalternatif ;

-- Dumping structure for view riduan.wp_nilai_v
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_nilai_v`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_nilai_v` AS SELECT wp_nilai_s.idalternatif,wp_nilai_s.namaalternatif, (nilai_s/jum) AS nilai_v FROM wp_nilai_s,wp_sum_s ;

-- Dumping structure for view riduan.wp_normalisasibobot
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_normalisasibobot`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_normalisasibobot` AS SELECT bobot.*,wp_jumlahbobot.jumlah,(bobot.value/wp_jumlahbobot.jumlah) AS normalisasi_w FROM bobot, wp_jumlahbobot ;

-- Dumping structure for view riduan.wp_pangkat
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_pangkat`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_pangkat` AS SELECT vmatrixkeputusan.*,wp_normalisasibobot.normalisasi_w,POW(vmatrixkeputusan.nilai,wp_normalisasibobot.normalisasi_w) AS pangkat FROM vmatrixkeputusan,wp_normalisasibobot WHERE wp_normalisasibobot.idkriteria=vmatrixkeputusan.idkriteria ;

-- Dumping structure for view riduan.wp_sum_s
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_sum_s`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_sum_s` AS SELECT SUM(wp_nilai_s.nilai_s) AS jum FROM wp_nilai_s ;

-- Dumping structure for view riduan.wp_vmatrixkeputusan
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_vmatrixkeputusan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_vmatrixkeputusan` AS SELECT matixkeputusan.idmatrix,alternatif.*,kriteria.*,bobot.idbobot,bobot.value,skala.value 
AS nilai,skala.keterangan FROM matixkeputusan,skala,bobot,kriteria,alternatif 
WHERE matixkeputusan.idalternatif=alternatif.idalternatif AND matixkeputusan.idbobot=bobot.idbobot 
AND matixkeputusan.idskala=skala.idskala AND kriteria.idkriteria=bobot.idkriteria ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
