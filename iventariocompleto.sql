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
DROP DATABASE IF EXISTS `inventario2017`;
CREATE DATABASE IF NOT EXISTS `inventario2017` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `inventario2017`;

-- Volcando estructura para tabla inventario2017.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla inventario2017.categoria: ~7 rows (aproximadamente)
DELETE FROM `categoria`;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`idCategoria`, `nombre`) VALUES
	(32, 'ordenador de mesa'),
	(33, 'portatil'),
	(34, 'raton'),
	(35, 'teclado'),
	(36, 'webcam'),
	(37, 'auriculares'),
	(49, 'balones');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla inventario2017.equipo
DROP TABLE IF EXISTS `equipo`;
CREATE TABLE IF NOT EXISTS `equipo` (
  `idEquipo` int(11) NOT NULL,
  `demoninacion` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `numeroSerie` varchar(255) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL,
  `idPrestatario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEquipo`),
  KEY `FKlt1kj91c3xvn1990w8e22ftjo` (`idCategoria`),
  KEY `FKjtg9fdul7u7dlvy9d7ykscr0l` (`idMarca`),
  KEY `FKs3r6wf7uc4vrsno7v244y81wa` (`idPrestatario`),
  CONSTRAINT `FKjtg9fdul7u7dlvy9d7ykscr0l` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`),
  CONSTRAINT `FKlt1kj91c3xvn1990w8e22ftjo` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  CONSTRAINT `FKs3r6wf7uc4vrsno7v244y81wa` FOREIGN KEY (`idPrestatario`) REFERENCES `prestatarios` (`idPrestatarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla inventario2017.equipo: ~9 rows (aproximadamente)
DELETE FROM `equipo`;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` (`idEquipo`, `demoninacion`, `descripcion`, `numeroSerie`, `idCategoria`, `idMarca`, `idPrestatario`) VALUES
	(5, 'asd', 'asd', 'asd', NULL, NULL, 2),
	(24, 'equipo1', 'prueba', '6267716123', NULL, NULL, 14),
	(38, 'equipo12', 'equipo1', 'equipo1', 34, 26, 21),
	(39, 'equipo13', 'equipo1equipo1', 'equipo1', 33, 28, 21),
	(40, 'equipo14', 'asdasdasd', 'asdasdas', 34, 26, 14),
	(41, 'equipo16', 'asdasd', 'asda', 33, 27, 14),
	(46, 'asdasdasd', 'asdasdasd', '', NULL, NULL, NULL),
	(47, 'asdasdas', 'asdasd', '', NULL, NULL, NULL),
	(48, 'vacio1', '', '', NULL, NULL, NULL);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;

-- Volcando estructura para tabla inventario2017.hibernate_sequence
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla inventario2017.hibernate_sequence: ~6 rows (aproximadamente)
DELETE FROM `hibernate_sequence`;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(54),
	(54),
	(54),
	(54),
	(54),
	(54);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- Volcando estructura para tabla inventario2017.incidencia
DROP TABLE IF EXISTS `incidencia`;
CREATE TABLE IF NOT EXISTS `incidencia` (
  `idIncidencia` int(11) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `resolucion` varchar(255) DEFAULT NULL,
  `seResolvio` datetime DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `idEquipo` int(11) DEFAULT NULL,
  `idPrestatario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idIncidencia`),
  KEY `FKg7cugcbnf1rhogla7kvx74276` (`idEquipo`),
  KEY `FKmr8pp5ei6x1m00ul765woa71m` (`idPrestatario`),
  CONSTRAINT `FKg7cugcbnf1rhogla7kvx74276` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`),
  CONSTRAINT `FKmr8pp5ei6x1m00ul765woa71m` FOREIGN KEY (`idPrestatario`) REFERENCES `prestatarios` (`idPrestatarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla inventario2017.incidencia: ~16 rows (aproximadamente)
DELETE FROM `incidencia`;
/*!40000 ALTER TABLE `incidencia` DISABLE KEYS */;
INSERT INTO `incidencia` (`idIncidencia`, `createDate`, `descripcion`, `estado`, `resolucion`, `seResolvio`, `tipo`, `idEquipo`, `idPrestatario`) VALUES
	(3, '2017-06-04 16:18:35', 'asdasd', 'cerrada', 'cerrada', '2017-06-19 23:36:29', 'error', NULL, NULL),
	(4, '2017-06-04 16:27:08', 'asdasd', 'abierta', NULL, NULL, 'pedido', NULL, NULL),
	(6, '2017-06-04 16:36:17', '', 'cerrada', 'vamos a cerrar', '2017-06-19 23:08:31', 'error', NULL, NULL),
	(7, '2017-06-04 16:36:11', 'asdasd', 'abierta', NULL, NULL, 'error', NULL, NULL),
	(8, '2017-06-04 16:36:35', '', 'abierta', NULL, NULL, 'error', NULL, NULL),
	(9, '2017-06-04 16:38:23', '', 'abierta', NULL, NULL, 'error', 5, NULL),
	(10, '2017-06-04 16:39:40', '', 'abierta', NULL, NULL, 'error', NULL, NULL),
	(11, '2017-06-04 16:41:10', '', 'abierta', NULL, NULL, 'error', 5, 2),
	(12, '2017-06-04 16:41:23', '', 'cerrada', 'vamos a cerrarla', '2017-06-18 11:51:12', 'error', NULL, NULL),
	(15, '2017-06-14 17:19:06', 'asdjkjkasdfajkk', 'abierta', NULL, NULL, 'error', 5, 2),
	(16, '2017-06-14 17:19:25', 'faaaasdasd', 'abierta', NULL, NULL, 'error', 5, 2),
	(17, '2017-06-14 17:19:43', 'asdasdasd', 'abierta', NULL, NULL, 'error', 5, 2),
	(18, '2017-06-14 17:19:45', 'asdasdasd', 'abierta', NULL, NULL, 'error', 5, 2),
	(19, '2017-06-14 17:35:12', 'aasdasd23123', 'abierta', NULL, NULL, 'error', 5, 2),
	(50, '2017-06-19 23:38:38', 'quiero este equipo', 'abierta', NULL, NULL, 'pedido', 46, 21),
	(51, '2017-06-19 23:39:05', 'se ha roto', 'cerrada', 'pues te lo ha arreglado', '2017-06-19 23:40:28', 'error', 38, 21);
/*!40000 ALTER TABLE `incidencia` ENABLE KEYS */;

-- Volcando estructura para tabla inventario2017.marca
DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `idMarca` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla inventario2017.marca: ~7 rows (aproximadamente)
DELETE FROM `marca`;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`idMarca`, `nombre`) VALUES
	(25, 'hp'),
	(26, 'marck gamming'),
	(27, 'asus'),
	(28, 'lenovo'),
	(29, 'apple'),
	(30, 'apqprox'),
	(31, 'Nexux');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Volcando estructura para tabla inventario2017.prestatarios
DROP TABLE IF EXISTS `prestatarios`;
CREATE TABLE IF NOT EXISTS `prestatarios` (
  `idPrestatarios` int(11) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  PRIMARY KEY (`idPrestatarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla inventario2017.prestatarios: ~6 rows (aproximadamente)
DELETE FROM `prestatarios`;
/*!40000 ALTER TABLE `prestatarios` DISABLE KEYS */;
INSERT INTO `prestatarios` (`idPrestatarios`, `apellido`, `nombre`, `telefono`) VALUES
	(2, 'asd', 'asd', 'asd'),
	(14, 'asd', 'asd', '627171936'),
	(21, 'asdasdas', 'prueba2', '924670924'),
	(43, 'retamal', 'rafa', '924670924'),
	(45, 'asdasdasd', 'dasdasd', 'asdasdas'),
	(53, 'no me acuerdo', 'jesus', '');
/*!40000 ALTER TABLE `prestatarios` ENABLE KEYS */;

-- Volcando estructura para tabla inventario2017.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuarios` int(11) NOT NULL,
  `pasword` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `idPrestatarios` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`),
  UNIQUE KEY `UK_863n1y3x0jalatoir4325ehal` (`username`),
  KEY `FKhv48qr1q6l5x82uml4akqu6ub` (`idPrestatarios`),
  CONSTRAINT `FKhv48qr1q6l5x82uml4akqu6ub` FOREIGN KEY (`idPrestatarios`) REFERENCES `prestatarios` (`idPrestatarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla inventario2017.usuario: ~6 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idUsuarios`, `pasword`, `tipo`, `username`, `idPrestatarios`) VALUES
	(1, 'qwe', 'prestatarios', 'qwe', 2),
	(13, 'usuario', 'admin', 'usuario', 14),
	(20, '1234', 'prestatarios', 'prueba', 21),
	(42, '123', 'prestatarios', 'prueba23', 43),
	(44, '1234', 'prestatarios', 'aassdasd', 45),
	(52, 'jesus', 'prestatarios', 'jesus', 53);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
