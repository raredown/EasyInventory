-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.16-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para inventario2017
CREATE DATABASE IF NOT EXISTS `inventario2017` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `inventario2017`;

-- Volcando estructura para tabla inventario2017.hibernate_sequence
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla inventario2017.hibernate_sequence: ~1 rows (aproximadamente)
DELETE FROM `hibernate_sequence`;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(21);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- Volcando estructura para tabla inventario2017.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuarios` int(11) NOT NULL,
  `idPrestatario` int(11) NOT NULL,
  `pasword` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla inventario2017.usuario: ~20 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idUsuarios`, `idPrestatario`, `pasword`, `tipo`, `username`) VALUES
	(1, 0, 'asdasd', NULL, 'asd'),
	(2, 0, 'asdasd', NULL, 'asd'),
	(3, 0, 'qeqwe', NULL, 'dfsa'),
	(4, 0, '123', NULL, 'asdas'),
	(5, 0, '123', NULL, 'asd'),
	(6, 0, '123', NULL, 'asd'),
	(7, 0, 'asd', NULL, 'asdasd'),
	(8, 0, 'asd', NULL, ''),
	(9, 0, '123', NULL, 'asd'),
	(10, 0, '123', NULL, 'asd'),
	(11, 0, 'asd', NULL, '123'),
	(12, 0, 'asd', NULL, '123'),
	(13, 0, 'asd', NULL, '123'),
	(14, 0, 'asd', NULL, 'asd'),
	(15, 0, 'asd', NULL, 'asd'),
	(16, 0, 'asd', NULL, 'asd'),
	(17, 0, 'asd', NULL, 'asd'),
	(18, 0, 'asd', NULL, 'asd'),
	(19, 0, 'asd', NULL, 'asd'),
	(20, 0, 'asd', NULL, 'asd');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
