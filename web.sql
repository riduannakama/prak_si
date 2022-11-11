-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for web
CREATE DATABASE IF NOT EXISTS `web` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `web`;

-- Dumping structure for table web.barang
CREATE TABLE IF NOT EXISTS `barang` (
  `namabarang` varchar(50) NOT NULL,
  `stok` int(50) DEFAULT NULL,
  PRIMARY KEY (`namabarang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table web.barang: ~0 rows (approximately)
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;

-- Dumping structure for table web.document
CREATE TABLE IF NOT EXISTS `document` (
  `kode_doc` int(11) NOT NULL AUTO_INCREMENT,
  `tgl` varchar(20) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `file` mediumblob DEFAULT NULL,
  `nama_file` varchar(100) DEFAULT NULL,
  `tipe_file` varchar(100) DEFAULT NULL,
  `ukuran_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table web.document: ~0 rows (approximately)
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;

-- Dumping structure for table web.pembelian
CREATE TABLE IF NOT EXISTS `pembelian` (
  `namabarang` varchar(50) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tanggal` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`namabarang`) USING BTREE,
  KEY `namabarang` (`namabarang`),
  CONSTRAINT `FK_pembelian_barang` FOREIGN KEY (`namabarang`) REFERENCES `barang` (`namabarang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table web.pembelian: ~0 rows (approximately)
/*!40000 ALTER TABLE `pembelian` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembelian` ENABLE KEYS */;

-- Dumping structure for table web.penjualan
CREATE TABLE IF NOT EXISTS `penjualan` (
  `namabarang` varchar(50) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tanggal` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`namabarang`),
  KEY `namabarang` (`namabarang`),
  CONSTRAINT `FK_penjualan_barang` FOREIGN KEY (`namabarang`) REFERENCES `barang` (`namabarang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table web.penjualan: ~0 rows (approximately)
/*!40000 ALTER TABLE `penjualan` DISABLE KEYS */;
/*!40000 ALTER TABLE `penjualan` ENABLE KEYS */;

-- Dumping structure for table web.register
CREATE TABLE IF NOT EXISTS `register` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `namalengkap` varchar(100) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table web.register: ~0 rows (approximately)
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;

-- Dumping structure for trigger web.trigger_pembelian
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_pembelian` AFTER INSERT ON `pembelian` FOR EACH ROW BEGIN
UPDATE barang SET stok = stok + NEW.jumlah
WHERE namabarang = NEW.namabarang;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger web.trigger_penjualan
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_penjualan` AFTER INSERT ON `penjualan` FOR EACH ROW BEGIN
UPDATE barang SET stok = stok - NEW.jumlah
WHERE namabarang = NEW.namabarang;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
