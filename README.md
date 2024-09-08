DROP DATABASE IF EXISTS PLATEA;
CREATE DATABASE PLATEA;

USE PLATEA;

-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: platea
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aprobacion`
--

DROP TABLE IF EXISTS `aprobacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprobacion` (
  `IdAprobacion` int(11) NOT NULL AUTO_INCREMENT,
  `ComentarioAprobacion` text DEFAULT NULL,
  `CalificacionAprobacion` decimal(2,1) DEFAULT NULL,
  `FechaAprobacion` datetime DEFAULT current_timestamp(),
  `IdPersonaFK` int(11) DEFAULT NULL,
  `IdProductoFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdAprobacion`),
  KEY `FK_Persona_Aprobacion` (`IdPersonaFK`),
  KEY `FK_Producto_Calificacion` (`IdProductoFK`),
  CONSTRAINT `FK_Persona_Aprobacion` FOREIGN KEY (`IdPersonaFK`) REFERENCES `persona` (`IdPersona`),
  CONSTRAINT `FK_Producto_Calificacion` FOREIGN KEY (`IdProductoFK`) REFERENCES `producto` (`IdProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprobacion`
--

LOCK TABLES `aprobacion` WRITE;
/*!40000 ALTER TABLE `aprobacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `aprobacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arrendatario`
--

DROP TABLE IF EXISTS `arrendatario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arrendatario` (
  `IdArrendatario` int(11) NOT NULL AUTO_INCREMENT,
  `FechaInicioArrendatario` datetime DEFAULT current_timestamp(),
  `FechaExpiracionArrendatario` datetime DEFAULT NULL,
  `FechaFinArrendatario` datetime DEFAULT NULL,
  `EstadoArrendatario` tinyint(1) DEFAULT 1,
  `IdPersonaFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdArrendatario`),
  KEY `FK_Persona_Arrendatario` (`IdPersonaFK`),
  CONSTRAINT `FK_Persona_Arrendatario` FOREIGN KEY (`IdPersonaFK`) REFERENCES `persona` (`IdPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrendatario`
--

LOCK TABLES `arrendatario` WRITE;
/*!40000 ALTER TABLE `arrendatario` DISABLE KEYS */;
INSERT INTO `arrendatario` VALUES (6,'2024-08-30 04:02:56','2024-10-30 04:02:56',NULL,1,13),(7,'2024-08-30 04:13:31','2024-10-30 04:13:31',NULL,1,14),(8,'2024-08-30 03:57:56','2024-10-30 03:57:56',NULL,1,15),(9,'2024-08-30 04:00:49','2024-10-30 04:00:49',NULL,1,16);
/*!40000 ALTER TABLE `arrendatario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `IdCarrito` int(11) NOT NULL AUTO_INCREMENT,
  `IdPersonaFK` int(11) DEFAULT NULL,
  fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdCarrito`),
  KEY `FK_Persona_Carrito` (`IdPersonaFK`),
  CONSTRAINT `FK_Persona_Carrito` FOREIGN KEY (`IdPersonaFK`) REFERENCES `persona` (`IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `IdCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `NombreCategoria` varchar(50) NOT NULL,
  `DescripcionCategoria` text DEFAULT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Moda',NULL),(2,'Electrodometicos',NULL),(3,'Hogar',NULL),(4,'Deportes',NULL),(5,'Juguetes',NULL),(6,'Belleza',NULL),
(7, 'Electrónica', NULL),
(8, 'Libros', NULL),
(9, 'Comida', NULL),
(10, 'Salud', NULL),
(11, 'Oficina', NULL),
(12, 'Jardín', NULL);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `IdCliente` int(11) NOT NULL AUTO_INCREMENT,
  `DireccionCliente` varchar(100) NOT NULL,
  `CiudadCliente` varchar(50) NOT NULL,
  `IdPersonaFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`),
  KEY `FK_Persona_Cliente` (`IdPersonaFK`),
  CONSTRAINT `FK_Persona_Cliente` FOREIGN KEY (`IdPersonaFK`) REFERENCES `persona` (`IdPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `IdCompra` int(11) NOT NULL AUTO_INCREMENT,
  `FechaHoraCompra` datetime DEFAULT current_timestamp(),
  `TotalCompra` decimal(10,2) NOT NULL,
  `EntregaCompra` tinyint(1) DEFAULT 0,
  `IdCarritoFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdCompra`),
  KEY `FK_Carrito_Compra` (`IdCarritoFK`),
  CONSTRAINT `FK_Carrito_Compra` FOREIGN KEY (`IdCarritoFK`) REFERENCES `carrito` (`IdCarrito`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallecarrito`
--

DROP TABLE IF EXISTS `detallecarrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallecarrito` (
  `IdCarritoFK` int(11) NOT NULL,
  `IdProductoFK` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT 1,
  PRIMARY KEY (`IdCarritoFK`,`IdProductoFK`),
  KEY `FK_Producto_DetalleCarrito` (`IdProductoFK`),
  CONSTRAINT `FK_Carrito_DetalleCarrito` FOREIGN KEY (`IdCarritoFK`) REFERENCES `carrito` (`IdCarrito`),
  CONSTRAINT `FK_Producto_DetalleCarrito` FOREIGN KEY (`IdProductoFK`) REFERENCES `producto` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecarrito`
--

LOCK TABLES `detallecarrito` WRITE;
/*!40000 ALTER TABLE `detallecarrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallecarrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallepago`
--

DROP TABLE IF EXISTS `detallepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallepago` (
  `IdDetallePago` int(11) NOT NULL AUTO_INCREMENT,
  `IdPagoFK` int(11) DEFAULT NULL,
  `IdCompraFK` int(11) DEFAULT NULL,
  `DescripcionDetalle` text DEFAULT NULL,
  `MontoDetalle` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdDetallePago`),
  KEY `FK_Compra_Pago` (`IdCompraFK`),
  KEY `FK_Pago_DetallePago` (`IdPagoFK`),
  CONSTRAINT `FK_Compra_Pago` FOREIGN KEY (`IdCompraFK`) REFERENCES `compra` (`IdCompra`),
  CONSTRAINT `FK_Pago_DetallePago` FOREIGN KEY (`IdPagoFK`) REFERENCES `pago` (`IdPago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepago`
--

LOCK TABLES `detallepago` WRITE;
/*!40000 ALTER TABLE `detallepago` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorito` (
  `IdFavorito` int(11) NOT NULL AUTO_INCREMENT,
  `IdClienteFK` int(11) DEFAULT NULL,
  `IdProductoFK` int(11) DEFAULT NULL,
  `FechaAgregado` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`IdFavorito`),
  KEY `FK_Cliente_Favorito` (`IdClienteFK`),
  KEY `FK_Producto_Favorito` (`IdProductoFK`),
  CONSTRAINT `FK_Cliente_Favorito` FOREIGN KEY (`IdClienteFK`) REFERENCES `cliente` (`IdCliente`),
  CONSTRAINT `FK_Producto_Favorito` FOREIGN KEY (`IdProductoFK`) REFERENCES `producto` (`IdProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `IdInventario` int(11) NOT NULL AUTO_INCREMENT,
  `IdProductoFK` int(11) DEFAULT NULL,
  `CantidadDisponible` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdInventario`),
  KEY `FK_Producto_Inventario` (`IdProductoFK`),
  CONSTRAINT `FK_Producto_Inventario` FOREIGN KEY (`IdProductoFK`) REFERENCES `producto` (`IdProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacion` (
  `IdNotificacion` int(11) NOT NULL AUTO_INCREMENT,
  `MensajeNotificacion` text NOT NULL,
  `FechaNotificacion` datetime DEFAULT current_timestamp(),
  `Leida` tinyint(1) DEFAULT 0,
  `IdPersonaFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdNotificacion`),
  KEY `FK_Persona_Notificacion` (`IdPersonaFK`),
  CONSTRAINT `FK_Persona_Notificacion` FOREIGN KEY (`IdPersonaFK`) REFERENCES `persona` (`IdPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `IdPago` int(11) NOT NULL AUTO_INCREMENT,
  `MontoPago` decimal(10,2) NOT NULL,
  `FechaPago` datetime DEFAULT current_timestamp(),
  `MetodoPago` varchar(50) NOT NULL,
  PRIMARY KEY (`IdPago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `IdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `NombrePersona` varchar(50) NOT NULL,
  `ApellidoPersona` varchar(50) NOT NULL,
  `CorreoPersona` varchar(50) NOT NULL,
  `CiudadPersona` varchar(50) DEFAULT NULL,
  `DescripcionPersona` text DEFAULT NULL,
  `DireccionPersona` text NOT NULL,
  `ClavePersona` text NOT NULL,
  `EstadoPersona` tinyint(1) DEFAULT 1,
  `TelefonoPersona` varchar(15) DEFAULT NULL,
  `FotoPersona` text DEFAULT NULL,
  `FotoPersonaURL` text DEFAULT NULL,
  `bannerPersona` text DEFAULT NULL,
  `bannerPersonaURL` text DEFAULT NULL,
  `idRolFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPersona`),
  UNIQUE KEY `CorreoPersona` (`CorreoPersona`),
  KEY `FK_Rol_Persona` (`idRolFK`),
  CONSTRAINT `FK_Rol_Persona` FOREIGN KEY (`idRolFK`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (13,'Alexix  Johan','Orostegui Audor','aorostegui2@gmail.com',NULL,NULL,'','$2b$10$kDang2qvBQKTzpbV3nIRQOsMrB.bXF9HT1AG5hCz/fLJ.4vl5RQx6',1,'2147483647',NULL,NULL,NULL,NULL,3),(14,'Anyi','Mendivelso','Camila@gmail.com',NULL,NULL,'','$2b$10$Ml/1qtHLuiWJKUkHCShFg.S4Boq.Jgh1yYZcL7LphGzVZlPOZxNa2',1,'2147483647',NULL,NULL,NULL,NULL,3),(15,'Andres','suarez','androq315@gmail.com',NULL,NULL,'','$2b$10$4j4lEQ0BrwmTRsHidgMMbe9ILGToMZs8S6dxaFPlMeo/nM3F8a6kq',1,'2147483647',NULL,NULL,NULL,NULL,3),(16,'Danner','Arias','danner@gmail.com',NULL,NULL,'','$2b$10$TP6q4LfZbt/dluHpDhyJMu6tURzTwwLQZwkbcDVPF3Y0FQ6pmRzDC',1,'2147483647',NULL,NULL,NULL,NULL,3);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `IdProducto` int(11) NOT NULL AUTO_INCREMENT,
  `NombreProducto` varchar(50) NOT NULL,
  `DescripcionProducto` text DEFAULT NULL,
  `StockProducto` int(11) DEFAULT 0,
  `PrecioProducto` decimal(10,2) NOT NULL,
  `FotoProducto` text DEFAULT NULL,
  `FotoProductoURL` text DEFAULT NULL,
  `IdCategoriaFK` int(11) DEFAULT NULL,
  `IdTiendaFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `FK_Categoria_Producto` (`IdCategoriaFK`),
  KEY `FK_Tienda_Producto` (`IdTiendaFK`),
  CONSTRAINT `FK_Categoria_Producto` FOREIGN KEY (`IdCategoriaFK`) REFERENCES `categoria` (`IdCategoria`),
  CONSTRAINT `FK_Tienda_Producto` FOREIGN KEY (`IdTiendaFK`) REFERENCES `tienda` (`IdTienda`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (6,'rey silente','¡Presentamos al Rey Silente, la figura suprema de los Necrones en Warhammer 40K! Este impresionante modelo captura a Szarekh en todo su poder, sentado en su trono y flanqueado por sus fieles Triarcas. Perfecto para cualquier coleccionista o jugador que desee comandar la galaxia.\r\n',1,750.00,'uploads/img/producto/rey_1725009352229.jpg','http://localhost:4000/uploads/img/producto/rey_1725009352229.jpg',NULL,30),(7,'caballero del caos','¡Conoce al Caballero del Caos de Warhammer 40K! Este imponente modelo representa a un titánico Caballero al servicio de las fuerzas del Caos, con detalles siniestros y una apariencia amenazante que destaca en cualquier ejército. Equipado con armas devastadoras y adornado con iconografía caótica, es una pieza clave para los seguidores del Caos que buscan dominar el campo de batalla.\r\n',11,350.00,'uploads/img/producto/caballero_1725009396947.jpg','http://localhost:4000/uploads/img/producto/caballero_1725009396947.jpg',NULL,30),(8,'ultra marine','¡Presentamos al Ultramarine! Este modelo de Warhammer 40K captura la esencia de los famosos Marines Espaciales de los Ultramarines, conocidos por su disciplina y valentía. Perfecto para completar tu ejército o para cualquier colección, este soldado está detallado con el icónico esquema de color azul y el símbolo de los Ultramarines.\r\n\r\n',1,50.00,'uploads/img/producto/marine_1725009458032.jpg','http://localhost:4000/uploads/img/producto/marine_1725009458032.jpg',NULL,30),(9,'fulgrim ','¡Conoce a Fulgrim, Príncipe Demonio de Warhammer 40K! Este impresionante modelo representa a Fulgrim, el Primarca caído de los Emperadores Hijos, transformado en un temible Príncipe Demonio del Caos. Con su diseño detallado y su aura de decadencia, es una figura central para cualquier ejército del Caos y un desafío formidable en el campo de batalla.\r\n',12,450.00,'uploads/img/producto/fulgrim_1725009514488.jpg','http://localhost:4000/uploads/img/producto/fulgrim_1725009514488.jpg',NULL,30),(10,'rylanor','¡Conoce a Rylanor, el Despertado, de los Hijos del Emperador! Este modelo representa a uno de los legendarios Guerreros de los Emperadores Hijos, despertado de su largo letargo para unirse a la batalla. Con una estética impresionante y una historia rica en el lore de Warhammer 40K, Rylanor encarna la fuerza y el honor de su legión',122,120.00,'uploads/img/producto/raylanor_1725009551908.jpg','http://localhost:4000/uploads/img/producto/raylanor_1725009551908.jpg',NULL,30),(11,'Lion El\'Jonson','¡Descubre a Lion El\'Jonson, el Primarca de los Ángeles Oscuros en Warhammer 40K! Este modelo representa al legendario líder de los Ángeles Oscuros, conocido por su habilidad en la batalla y su presencia imponente. Con su armadura detallada y su espada de energía, Lion El\'Jonson es una figura clave para cualquier ejército de los Ángeles Oscuros y un símbolo de la fuerza de su legión.\r\n',1,120.00,'uploads/img/producto/lion_1725009606156.jpg','http://localhost:4000/uploads/img/producto/lion_1725009606156.jpg',NULL,30),(12,'Trazin el Infinito','¡Descubre a Trazin el Infinito, el inmortal Señor de la Colección de los Necrones en Warhammer 40K! Este modelo captura al enigmático y poderoso Necron, conocido por su obsesión con la recolección de artefactos y secretos del universo. Equipado con su icónica vara y una armadura intricada, Trazin el Infinito es una pieza clave para cualquier ejército Necron y un símbolo de su misterio y poder interminable.\r\n',4,150.00,'uploads/img/producto/trazin_1725009643824.jpg','http://localhost:4000/uploads/img/producto/trazin_1725009643824.jpg',NULL,30),(13,'Ghazghkull Mag Uruk Thraka','¡Conoce a Ghazghkull Mag Uruk Thraka, el legendario Warboss Orko en Warhammer 40K! Este modelo representa al temido líder de los Orkos, conocido por su increíble poder y habilidad para liderar a sus huestes en la batalla. Con su impresionante armadura de guerra, su icónico kustom mega-blasta y su presencia imponente, Ghazghkull es un pilar central en cualquier ejército Orko y una figura clave en la lucha por la dominación del universo.\r\n',16,180.00,'uploads/img/producto/mag_1725009686389.jpg','http://localhost:4000/uploads/img/producto/mag_1725009686389.jpg',NULL,30),(14,'Blazer Clásico','¡Eleva tu estilo con nuestro Blazer Clásico! Este blazer es la combinación perfecta de elegancia y versatilidad, ideal para cualquier ocasión, ya sea en el trabajo o en eventos formales. Confeccionado en tela de alta calidad, presenta un corte impecable, solapas de muesca y un ajuste cómodo. Disponible en una variedad de colores sofisticados, es una prenda esencial para el guardarropa de cualquier persona que busque un toque de distinción y profesionalismo en su vestimenta.\r\n',145,220.00,'uploads/img/producto/blazer_1725009740549.jpg','http://localhost:4000/uploads/img/producto/blazer_1725009740549.jpg',NULL,27),(15,'Gaban Elegante','¡Mantente abrigado y a la moda con nuestro Gaban Elegante! Este gaban es perfecto para climas fríos, ofreciendo un diseño sofisticado y funcional. Confeccionado en tejido de alta calidad, cuenta con un corte moderno, cuello alto y botones detallados que aportan un toque de distinción. Ideal para ocasiones formales o para añadir un toque elegante a tu atuendo diario, este gaban es una pieza clave para tu armario durante la temporada de frío.\r\n',56,320.00,'uploads/img/producto/gaban_1725009778264.jpg','http://localhost:4000/uploads/img/producto/gaban_1725009778264.jpg',NULL,27),(16,'Abrigo de Lana Refinado','¡Añade un toque de sofisticación a tu guardarropa con nuestro Abrigo de Lana Refinado! Confeccionado en lana de alta calidad, este abrigo ofrece una calidez excepcional y un ajuste elegante. Su diseño clásico incluye un corte entallado, botones forrados y un cuello de solapa, ideal para combinar con cualquier atuendo formal o casual. Perfecto para enfrentar el frío con estilo, este abrigo es una inversión en elegancia y confort durante la temporada de invierno.\r\n',12,450.00,'uploads/img/producto/abrigo_1725009814020.jpg','http://localhost:4000/uploads/img/producto/abrigo_1725009814020.jpg',NULL,27),(17,'Gaban Clásico para Hombre','¡Mantén el estilo y el confort con nuestro Gaban Clásico para Hombre! Este gaban, confeccionado en un tejido de lana premium, ofrece una combinación perfecta de elegancia y funcionalidad. Con un corte ajustado y sofisticado, presenta un cuello alto y botones elegantes que brindan una protección adicional contra el frío. Ideal para ocasiones formales o para añadir un toque refinado a tu atuendo diario, este gaban es esencial para cualquier armario masculino durante la temporada de frío.\r\n',78,350.00,'uploads/img/producto/gaban clasico_1725009859808.jpg','http://localhost:4000/uploads/img/producto/gaban clasico_1725009859808.jpg',NULL,27),(18,'Chaqueta Corta de Viento','¡Prepárate para cualquier aventura con nuestra Chaqueta Corta de Viento! Diseñada para ofrecer protección contra el viento y la lluvia ligera, esta chaqueta está confeccionada en un material ligero y resistente al agua. Su corte moderno y ajustado proporciona un estilo dinámico, mientras que la capucha ajustable y los bolsillos funcionales añaden comodidad y practicidad. Ideal para actividades al aire libre o para un look casual en días ventosos, esta chaqueta es tu compañera perfecta para el clima cambiante.\r\n',12,180.00,'uploads/img/producto/corta_1725009898515.jpg','http://localhost:4000/uploads/img/producto/corta_1725009898515.jpg',NULL,27),(19,'Ropa Infantil Divertida y Cómoda','¡Haz que cada día sea una aventura con nuestra Ropa Infantil Divertida y Cómoda! Nuestra colección está diseñada pensando en la comodidad y el estilo de los más pequeños. Ofrecemos una variedad de prendas, desde coloridos conjuntos y camisetas con estampados alegres hasta pantalones y chaquetas resistentes y prácticos. Con tejidos suaves y duraderos, nuestras prendas garantizan libertad de movimiento y facilidad de uso para que los niños puedan jugar y explorar con total libertad. Perfecta para cualquier ocasión, nuestra ropa infantil combina funcionalidad con diversión.\r\n',1,80.00,'uploads/img/producto/niÃ±o_1725010133032.jpg','http://localhost:4000/uploads/img/producto/niÃ±o_1725010133032.jpg',NULL,27),(20,'Blazer Slim para Hombre','¡Añade un toque de sofisticación a tu vestuario con nuestro Blazer Slim para Hombre! Este blazer, con un corte ajustado y moderno, está diseñado para realzar tu figura y proporcionar un look elegante y contemporáneo. Confeccionado en tejido de alta calidad, ofrece un acabado impecable y un ajuste cómodo. Ideal para eventos formales, reuniones de trabajo o una salida nocturna, su diseño versátil se adapta a cualquier ocasión. Disponible en una gama de colores clásicos, este blazer es una pieza esencial para cualquier armario masculino.\r\n',56,250.00,'uploads/img/producto/slim_1725010173632.jpg','http://localhost:4000/uploads/img/producto/slim_1725010173632.jpg',NULL,27),(21,'Saco de Vestir para Hombre La Martina','¡Eleva tu estilo con el Saco de Vestir para Hombre La Martina! Con un diseño sofisticado y un corte impecable, este saco de vestir está confeccionado en tejidos de alta calidad que garantizan un ajuste cómodo y elegante. Ideal para ocasiones formales y eventos especiales, su diseño clásico incluye solapas de muesca y detalles refinados que realzan cualquier atuendo. Disponible en colores neutros y versátiles, es la elección perfecta para el hombre moderno que busca combinar estilo y distinción en cada ocasión.\r\n\r\n',21,320.00,'uploads/img/producto/saco_1725010236615.jpg','http://localhost:4000/uploads/img/producto/saco_1725010236615.jpg',NULL,27),(22,'Hamburguesa Artesanal','¡Deléitate con nuestra Hamburguesa Artesanal! Preparada con ingredientes frescos y de alta calidad, esta hamburguesa ofrece un sabor auténtico y una textura jugosa que resalta la artesanía detrás de cada bocado. Con una carne de res seleccionada, cocida a la perfección y acompañada de pan artesanal, vegetales frescos y salsas caseras, cada hamburguesa está diseñada para brindar una experiencia gastronómica única. Personaliza tu hamburguesa con una variedad de ingredientes adicionales y disfruta de un plato que celebra la calidad y el sabor.\r\n\r\n',50,150.00,'uploads/img/producto/comer_1725010333957.jpg','http://localhost:4000/uploads/img/producto/comer_1725010333957.jpg',NULL,28),(23,' Perro Caliente Clásico','¡Disfruta del sabor inconfundible de nuestro Perro Caliente Clásico! Preparado con una salchicha jugosa y cocida a la perfección, este perro caliente está servido en un pan suave y fresco. Complementado con tus condimentos favoritos, como mostaza, ketchup, cebolla crujiente y relish, es el bocadillo perfecto para cualquier ocasión. Ideal para un almuerzo rápido o una merienda informal, nuestro perro caliente combina simplicidad y sabor en cada bocado.\r\n',34,45.00,'uploads/img/producto/perroc_1725010385955.jpg','http://localhost:4000/uploads/img/producto/perroc_1725010385955.jpg',NULL,28),(24,'Donas Gourmet','¡Déjate seducir por nuestras Donas Gourmet! Elaboradas con recetas artesanales, estas donas ofrecen una experiencia dulce y deliciosa en cada bocado. Disponibles en una variedad de sabores, desde glaseado clásico hasta combinaciones innovadoras, cada dona está hecha con ingredientes frescos y de alta calidad. Perfectas para acompañar tu café matutino o como un capricho dulce durante el día, nuestras donas son el toque perfecto para cualquier ocasión.',45,25.00,'uploads/img/producto/donas_1725010490693.jpg','http://localhost:4000/uploads/img/producto/donas_1725010490693.jpg',NULL,28),(25,'Empanadas Caseras','¡Saborea nuestras Empanadas Caseras, el auténtico sabor en cada bocado! Hechas con una masa crujiente y dorada, estas empanadas están rellenas con ingredientes frescos y de alta calidad, como carne jugosa, pollo tierno o una mezcla deliciosa de vegetales y quesos. Perfectas para un aperitivo, un almuerzo rápido o una cena informal, nuestras empanadas ofrecen un equilibrio perfecto entre sabor y textura. Ven y disfruta de este clásico delicioso y reconfortante.\r\n',35,20.00,'uploads/img/producto/Imagen de WhatsApp 2024-08-30 a las 01_1725010536040.jpg','http://localhost:4000/uploads/img/producto/Imagen de WhatsApp 2024-08-30 a las 01_1725010536040.jpg',NULL,28),(26,' Salchipapa Sabrosa','¡Descubre nuestra Salchipapa Sabrosa, una combinación irresistible de papas fritas crujientes y salchichas jugosas! Cada porción presenta papas recién fritas y doradas, acompañadas de salchichas de alta calidad, cocidas a la perfección. Puedes personalizar tu salchipapa con una variedad de salsas y condimentos, como ketchup, mayonesa, mostaza o salsa picante, para un toque adicional de sabor. Ideal para compartir con amigos o disfrutar como una comida rápida y deliciosa, nuestra salchipapa es un clásico que siempre satisface.\r\n',67,30.00,'uploads/img/producto/salchipapa_1725010594259.jpg','http://localhost:4000/uploads/img/producto/salchipapa_1725010594259.jpg',NULL,28),(27,'Helado Casero Artesanal','¡Disfruta del auténtico sabor de nuestro Helado Casero Artesanal! Hecho con ingredientes frescos y naturales, cada porción de nuestro helado ofrece una textura cremosa y un sabor inigualable. Disponibles en una variedad de sabores, desde vainilla clásica y chocolate rico hasta frutas frescas y combinaciones innovadoras, nuestro helado está hecho con amor y cuidado para asegurar la mejor calidad. Perfecto para un postre refrescante o un capricho dulce, nuestro helado casero es una delicia que te hará sonreír.\r\n',31,35.00,'uploads/img/producto/heladito_1725010641607.jpg','http://localhost:4000/uploads/img/producto/heladito_1725010641607.jpg',NULL,28),(28,'Arepa Rellena Saborosa','¡Prueba nuestra Arepa Rellena Saborosa, una delicia tradicional llena de sabor! Hecha con masa de maíz recién preparada, esta arepa está rellena con una variedad de ingredientes frescos y sabrosos, como carne desmechada, pollo a la parrilla, queso fundido o una mezcla de vegetales. Cocida a la perfección, combina una textura suave por dentro con una capa exterior dorada y crujiente. Ideal para un desayuno nutritivo, almuerzo rápido o cena informal, nuestra arepa rellena es un verdadero placer para el paladar.\r\n',1,25.00,'uploads/img/producto/Arepas de caryÂ¿uya_1725010720133.jpg','http://localhost:4000/uploads/img/producto/Arepas de caryÂ¿uya_1725010720133.jpg',NULL,28),(29,'Poppy, La Perrita Que Mueve La Cola','\r\n¡Conoce a Poppy, La Perrita Que Mueve La Cola, el juguete perfecto para tu amigo peludo! Diseñada para proporcionar horas de diversión, Poppy tiene un mecanismo interno que hace que su cola se mueva y suena con diferentes melodías, manteniendo a tu mascota entretenida y activa. Hecha de materiales resistentes y seguros, este juguete es ideal para fomentar el ejercicio y el juego interactivo. ¡Asegúrate de que tu mascota tenga su propia Poppy para una experiencia de juego divertida y estimulante!\r\n',13,50.00,'uploads/img/producto/pero_1725010815942.jpg','http://localhost:4000/uploads/img/producto/pero_1725010815942.jpg',NULL,29),(30,' Figura Dragon Ball Gamma 1','¡Añade a tu colección la impresionante Figura Dragon Ball Gamma 1! Basada en el popular anime Dragon Ball, esta figura captura a Gamma 1 en todo su esplendor con un detallado diseño y una pose dinámica que refleja su carácter en la serie. Fabricada con materiales de alta calidad, la figura incluye acabados precisos y colores vibrantes, además de una base resistente para exhibirla con orgullo. Ideal para coleccionistas y fanáticos de Dragon Ball, esta figura es una pieza esencial que realza cualquier estante de colección',67,120.00,'uploads/img/producto/FIGURA_1725010872186.jpg','http://localhost:4000/uploads/img/producto/FIGURA_1725010872186.jpg',NULL,29),(31,'Muñeca Baby Alive Bebidas de Frutas Manzana 30 cm','¡Descubre la magia de la Muñeca Baby Alive Bebidas de Frutas Manzana de 30 cm! Esta encantadora muñeca está lista para jugar y simular la hora del té con su botella de jugo de manzana y su funcionalidad de bebida. Con una apariencia realista y una actitud adorable, Baby Alive puede \"beber\" su jugo y tener una experiencia interactiva que encantará a los más pequeños. Perfecta para juegos de simulación y cuidado, esta muñeca fomenta la imaginación y el juego creativo.\r\n',1,85.00,'uploads/img/producto/MUÃECA_1725011017473.jpg','http://localhost:4000/uploads/img/producto/MUÃECA_1725011017473.jpg',NULL,29),(32,'Set City Ultimate Garage','¡Prepárate para una aventura emocionante con el Set City Ultimate Garage! Este impresionante set de garaje de la ciudad ofrece un mundo de diversión con múltiples niveles, estaciones de servicio, y una pista de carreras increíble. Equipado con rampas, ascensores y varios accesorios, el Ultimate Garage permite a los niños crear sus propias historias de acción y aventura mientras juegan con sus coches y camiones favoritos. Ideal para fomentar la creatividad y el juego interactivo, este set es perfecto para pequeños entusiastas de los vehículos y constructores en ciernes.\r\n',24,250.00,'uploads/img/producto/CARROS_1725011075634.jpg','http://localhost:4000/uploads/img/producto/CARROS_1725011075634.jpg',NULL,29),(33,'Juego Laboratorio de Ciencia - Clementoni','¡Explora el fascinante mundo de la ciencia con el Juego Laboratorio de Ciencia - Clementoni! Este completo set ofrece a los jóvenes científicos una variedad de experimentos y actividades educativas que estimulan la curiosidad y el aprendizaje. Incluye herramientas y materiales seguros para realizar experimentos como mezclas químicas, reacciones y proyectos divertidos. Con instrucciones claras y fáciles de seguir, el laboratorio permite a los niños desarrollar habilidades científicas mientras se divierten descubriendo los secretos de la ciencia. Ideal para fomentar el interés en la investigación y la experimentación desde una edad temprana.\r\n',56,120.00,'uploads/img/producto/Imagen de WhatsApp 2024-08-30 a las 02_1725011157776.jpg','http://localhost:4000/uploads/img/producto/Imagen de WhatsApp 2024-08-30 a las 02_1725011157776.jpg',NULL,29),(34,' Figura Spawn Mortal Kombat 11 Articulada de 18 cm','¡Añade a tu colección la increíble Figura Spawn Mortal Kombat 11! Esta figura articulada de 18 cm captura la esencia del icónico personaje de Mortal Kombat con un nivel impresionante de detalle. Diseñada con múltiples puntos de articulación, permite poseer y exhibir a Spawn en una variedad de posiciones dinámicas. Incluye accesorios exclusivos que realzan su apariencia, como su capa característica y armas emblemáticas, para una experiencia de colección completa. Perfecta para fanáticos y coleccionistas de Mortal Kombat, esta figura es una pieza imprescindible para cualquier estante de figuras.\r\n',7,150.00,'uploads/img/producto/FIGUA_1725011242330.jpg','http://localhost:4000/uploads/img/producto/FIGUA_1725011242330.jpg',NULL,29),(35,' Star Wars The Child Baby Yoda The Mandalorian con','¡Sumérgete en el universo de Star Wars con la adorable figura de Baby Yoda de The Mandalorian! Este detallado juguete de 12 pulgadas captura la ternura y el encanto del icónico personaje con una alta calidad de acabado. Incluye 4 accesorios exclusivos que permiten recrear momentos memorables de la serie, como su manta y su cúpula de transporte. Con una construcción robusta y detalles precisos, esta figura es perfecta para coleccionistas y fanáticos de todas las edades. ¡No te pierdas la oportunidad de tener a este pequeño y querido personaje en tu colección!\r\n',456,120.00,'uploads/img/producto/BABY_1725011334387.jpg','http://localhost:4000/uploads/img/producto/BABY_1725011334387.jpg',NULL,29),(36,'Figura de Acción Buzz Lightyear | Soriana','\r\n¡Haz que la aventura despegue con la Figura de Acción Buzz Lightyear! Basada en el querido personaje de Toy Story, esta figura de acción presenta a Buzz Lightyear en toda su gloria espacial con detalles auténticos y accesorios interactivos. Con una altura aproximada de 15 cm, Buzz está equipado con alas extensibles, un casco removible y una variedad de articulaciones que permiten múltiples poses y movimientos. Ideal para recrear emocionantes escenas del espacio o para exhibir en tu colección, esta figura captura la esencia del intrépido guardián estelar. Perfecta para fans de todas las edades.\r\n',1,75.00,'uploads/img/producto/BUZZ_1725011717323.jpg','http://localhost:4000/uploads/img/producto/BUZZ_1725011717323.jpg',NULL,29);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `NombreRol` varchar(20) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Arrendatario'),(2,'Administrador'),(3,'Cliente');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `IdTienda` int(11) NOT NULL AUTO_INCREMENT,
  `DireccionTienda` varchar(100) NOT NULL,
  `FechaAperturaTienda` datetime DEFAULT current_timestamp(),
  `NombreTienda` varchar(50) NOT NULL,
  `CalificacionTienda` decimal(2,1) DEFAULT 0.0,
  `CiudadTienda` varchar(20) DEFAULT NULL,
  `DescripcionTienda` text DEFAULT NULL,
  `EstadoTienda` tinyint(1) DEFAULT 1,
  `MiniaturaTienda` text DEFAULT NULL,
  `MiniaturaTiendaURL` text DEFAULT NULL,
  `BannerTienda` text DEFAULT NULL,
  `BannerTiendaURL` text DEFAULT NULL,
  `IdCategoriaFK` int(11) DEFAULT NULL,
  `IdArrendatarioFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdTienda`),
  KEY `FK_Categoria_Tienda` (`IdCategoriaFK`),
  KEY `FK_Arrendatario_Tienda` (`IdArrendatarioFK`),
  CONSTRAINT `FK_Arrendatario_Tienda` FOREIGN KEY (`IdArrendatarioFK`) REFERENCES `arrendatario` (`IdArrendatario`),
  CONSTRAINT `FK_Categoria_Tienda` FOREIGN KEY (`IdCategoriaFK`) REFERENCES `categoria` (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (27,'Dirección: Calle 72 #15-20, Oficina 203','2024-08-30 08:50:29','Moda Única',0.0,'Pereira','Ubicada en Calle 72 #15-20, Oficina 203, Moda Única es tu destino para ropa y accesorios exclusivos. Ofrecemos una selección única de prendas que combinan tendencias actuales con un toque personal. Ven y descubre cómo encontrar el estilo que te hace destacar.',1,'./uploads/img/tienda_miniatura/modaunica_1725007829671.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/modaunica_1725007829671.jpg','./uploads/img/tienda_banner/modaunica1_1725007829676.jpg','http://localhost:4000/./uploads/img/tienda_banner/modaunica1_1725007829676.jpg',1,6),(28,'Dirección: Carrera 65 #14-20, Local 5','2024-08-30 08:51:41','Burgers Express',0.0,'Medellín','Ubicado en Carrera 65 #14-20, Local 5, Burgers Express es tu lugar para disfrutar de hamburguesas deliciosas y rápidas. Con una oferta que abarca desde las clásicas hasta las más innovadoras, cada bocado está preparado con ingredientes frescos y de alta calidad. Ideal para una comida rápida o una cena informal, nuestro ambiente acogedor y servicio ágil garantizan una experiencia satisfactoria. Ven a Burgers Express y saborea la mejor hamburguesa de la ciudad.',1,'./uploads/img/tienda_miniatura/burger_1725007901215.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/burger_1725007901215.jpg','./uploads/img/tienda_banner/burger1_1725007901216.jpg','http://localhost:4000/./uploads/img/tienda_banner/burger1_1725007901216.jpg',3,6),(29,'Dirección: Calle 45 #12-34, Local 2A','2024-08-30 08:52:23','Addi ',0.0,'Bogota','Ubicado en Calle 45 #12-34, Local 2A, Addi es tu tienda de juguetes ideal en Bogotá. Ofrecemos una amplia gama de juguetes para todas las edades, desde los más clásicos hasta las últimas novedades del mercado. Nuestro compromiso es proporcionar productos de alta calidad que fomenten la creatividad y el desarrollo infantil. En Addi, encontrarás un ambiente divertido y acogedor, perfecto para encontrar el regalo perfecto o simplemente disfrutar de una experiencia de compra única',1,'./uploads/img/tienda_miniatura/addi_1725007943072.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/addi_1725007943072.jpg','./uploads/img/tienda_banner/addi1_1725007943074.jpg','http://localhost:4000/./uploads/img/tienda_banner/addi1_1725007943074.jpg',5,6),(30,'Dirección: Calle 56 #22-10, Local 3','2024-08-30 08:53:07','adeptus creaticus show center',0.0,'Cali','Ubicado en Calle 56 #22-10, Local 3, Adeptus Creaticus Show Center es el lugar ideal para los entusiastas de los juegos y el entretenimiento. Especializados en ofrecer una experiencia única, nuestro centro presenta una variedad de actividades y eventos relacionados con la cultura geek, incluyendo exposiciones, torneos y presentaciones en vivo. Con un ambiente vibrante y acogedor, Adeptus Creaticus se dedica a proporcionar un espacio donde los aficionados puedan disfrutar de sus pasatiempos favoritos y conectar con otros entusiastas. Ven y únete a la diversión en Adeptus Creaticus Show Center.',1,'./uploads/img/tienda_miniatura/adeptus_1725007987434.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/adeptus_1725007987434.jpg','./uploads/img/tienda_banner/adeptus1_1725007987437.jpg','http://localhost:4000/./uploads/img/tienda_banner/adeptus1_1725007987437.jpg',5,6),(31,'Dirección: Carrera 34 #15-27, Local 1B','2024-08-30 08:54:26','tool herramientas',0.0,'Barranquilla','Ubicado en Carrera 34 #15-27, Local 1B, Tool Herramientas es tu proveedor confiable de herramientas y equipos en Medellín. Ofrecemos una amplia gama de herramientas manuales y eléctricas de alta calidad, ideales para profesionales y aficionados al bricolaje. Nuestro compromiso es brindar productos duraderos y un servicio al cliente excepcional. Ya sea que necesites herramientas para proyectos domésticos o industriales, en Tool Herramientas encontrarás lo que buscas. Visítanos y descubre nuestra oferta.',1,'./uploads/img/tienda_miniatura/tools_1725008066277.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/tools_1725008066277.jpg','./uploads/img/tienda_banner/tools1_1725008066279.jpg','http://localhost:4000/./uploads/img/tienda_banner/tools1_1725008066279.jpg',3,7),(32,'Dirección: Calle 10 #5-43, Local 2','2024-08-30 08:55:04','soft furnishing',0.0,'Bucaramanga','Ubicado en Calle 10 #5-43, Local 2, Soft Furnishing es tu destino para artículos de decoración y textiles para el hogar en Bogotá. Especializados en cortinas, cojines, alfombras y otros accesorios que aportan confort y estilo a tus espacios, ofrecemos productos de alta calidad y diseño. Nuestro equipo está dedicado a ayudarte a encontrar las soluciones perfectas para embellecer tu hogar con elegancia y funcionalidad.',1,'./uploads/img/tienda_miniatura/sofa_1725008104087.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/sofa_1725008104087.jpg','./uploads/img/tienda_banner/sofa1_1725008104102.jpg','http://localhost:4000/./uploads/img/tienda_banner/sofa1_1725008104102.jpg',3,7),(33,'Dirección: Carrera 50 #10-65, Local 7','2024-08-30 08:56:07','PetHaven',0.0,'Manizales','Ubicado en Carrera 50 #10-65, Local 7, PetHaven es tu tienda especializada en productos y servicios para mascotas en Bogotá. Ofrecemos una amplia gama de alimentos, juguetes, accesorios y productos de cuidado para perros, gatos y otras mascotas. Nuestro objetivo es proporcionar a tus compañeros peludos lo mejor en calidad y confort, con un servicio amable y experto que te ayudará a encontrar todo lo que necesitas para el bienestar de tus animales. Visítanos y descubre cómo podemos mejorar la vida de tus mascotas.',1,'./uploads/img/tienda_miniatura/perito_1725008167600.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/perito_1725008167600.jpg','./uploads/img/tienda_banner/perito1_1725008167602.jpg','http://localhost:4000/./uploads/img/tienda_banner/perito1_1725008167602.jpg',3,8),(34,'Dirección: Calle 68 #18-40, Local','2024-08-30 08:57:01','almacen macrodent',0.0,'Bucaramanga','Ubicado en Calle 68 #18-40, Local 5, Almacén Macrodent en Bogotá es tu tienda especializada en productos dentales y de cuidado oral. Ofrecemos una amplia gama de suministros dentales, equipos y accesorios de alta calidad para profesionales del sector y para el cuidado personal. Nuestro objetivo es proporcionar productos confiables que apoyen la salud dental y oral. Visítanos para encontrar todo lo que necesitas para mantener sonrisas saludables.',1,'./uploads/img/tienda_miniatura/alma_1725008221586.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/alma_1725008221586.jpg','./uploads/img/tienda_banner/alma1_1725008221587.jpg','http://localhost:4000/./uploads/img/tienda_banner/alma1_1725008221587.jpg',6,8),(35,'Dirección: Calle 63 #12-18, Oficina 201','2024-08-30 08:57:56','Sonrisa Perfecta',0.0,'Santa Marta','Ubicado en Calle 63 #12-18, Oficina 201, Sonrisa Perfecta en Bogotá es tu clínica dental especializada en proporcionar tratamientos y servicios para lograr una sonrisa saludable y estética. Ofrecemos una gama completa de servicios dentales, desde limpiezas y blanqueamientos hasta ortodoncia y tratamientos reconstructivos. Nuestro equipo de profesionales está dedicado a ofrecer cuidados personalizados para mejorar tu salud bucal y lograr resultados excepcionales.',1,'./uploads/img/tienda_miniatura/diente_1725008276132.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/diente_1725008276132.jpg','./uploads/img/tienda_banner/diente1_1725008276134.jpg','http://localhost:4000/./uploads/img/tienda_banner/diente1_1725008276134.jpg',6,8),(36,'Dirección: Calle 45 #8-30, Local 1','2024-08-30 08:59:19','suchi bar',0.0,'Quibdó','Ubicado en Calle 45 #8-30, Local 1, Suchi Bar en Bogotá es el lugar perfecto para disfrutar de sushi fresco y deliciosos platos de la cocina japonesa. Ofrecemos una amplia variedad de rollos, sashimi y nigiri, preparados con ingredientes de alta calidad en un ambiente acogedor y moderno. Nuestro menú está diseñado para satisfacer todos los gustos, desde los más tradicionales hasta las combinaciones más innovadoras. Ven y vive una experiencia culinaria única en Suchi Bar.',1,'./uploads/img/tienda_miniatura/sushi1_1725008359945.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/sushi1_1725008359945.jpg','./uploads/img/tienda_banner/sushi_1725008359948.jpg','http://localhost:4000/./uploads/img/tienda_banner/sushi_1725008359948.jpg',3,9),(37,'Dirección: Carrera 34 #22-45, Local 3B','2024-08-30 09:00:08','PixelPlay',0.0,'Ibagué','Ubicado en Carrera 34 #22-45, Local 3B, PixelPlay en Ibagué es tu destino para todo lo relacionado con videojuegos y tecnología. Ofrecemos una amplia gama de consolas, juegos, accesorios y productos de entretenimiento digital en un entorno moderno y emocionante. Ya sea que busques lo último en videojuegos o necesitas asesoramiento sobre tecnología, nuestro equipo está aquí para ayudarte a encontrar lo que necesitas para disfrutar al máximo de tus pasatiempos favoritos.',1,'./uploads/img/tienda_miniatura/juegos_1725008408026.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/juegos_1725008408026.jpg','./uploads/img/tienda_banner/juegos1_1725008408028.jpg','http://localhost:4000/./uploads/img/tienda_banner/juegos1_1725008408028.jpg',5,9),(38,'Dirección: Calle 55 #18-20, Local 3','2024-08-30 09:00:49','Tacos El Rey',0.0,'Cúcuta','Ubicado en Calle 55 #18-20, Local 3, Tacos El Rey en Cúcuta es el lugar perfecto para disfrutar de auténticos tacos mexicanos. Ofrecemos una deliciosa variedad de tacos, desde los tradicionales hasta nuestras especialidades exclusivas, preparados con ingredientes frescos y sabrosos. Ven y prueba nuestros tacos en un ambiente amigable y acogedor, donde cada bocado te transportará al corazón de México.',1,'./uploads/img/tienda_miniatura/tacos_1725008449379.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/tacos_1725008449379.jpg','./uploads/img/tienda_banner/taco1_1725008449381.jpg','http://localhost:4000/./uploads/img/tienda_banner/taco1_1725008449381.jpg',3,9),(39,'Dirección: Calle 42 #15-20, Local 1','2024-08-30 09:01:39','Barbería El Clásico',0.0,'Pereira','Ubicada en Calle 42 #15-20, Local 1, Barbería El Clásico en Pereira es el lugar ideal para obtener cortes de cabello y arreglos de barba con un toque tradicional y profesional. Ofrecemos un ambiente relajado y un servicio personalizado para cada cliente, asegurando que cada visita sea una experiencia de cuidado personal única. Ven y disfruta de nuestro servicio de barbería de calidad, donde la tradición y la moda se encuentran',1,'./uploads/img/tienda_miniatura/barba_1725008499858.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/barba_1725008499858.jpg','./uploads/img/tienda_banner/barba1_1725008499859.jpg','http://localhost:4000/./uploads/img/tienda_banner/barba1_1725008499859.jpg',3,6),(40,'Dirección: Carrera 20 #8-55, Local','2024-08-30 09:02:20','Pollo Real',0.0,'Bucaramanga','Ubicado en Carrera 20 #8-55, Local 4, Pollo Real en Bucaramanga es tu destino para disfrutar del mejor pollo a la brasa de la ciudad. Ofrecemos una variedad de platos con pollo jugoso y bien sazonado, acompañado de guarniciones frescas y deliciosas. Nuestro compromiso es brindar una experiencia gastronómica excepcional en un ambiente acogedor y familiar. Ven y descubre por qué Pollo Real es el rey del pollo a la brasa en Bucaramanga.',1,'./uploads/img/tienda_miniatura/pollo_1725008540150.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/pollo_1725008540150.jpg','./uploads/img/tienda_banner/pollo1_1725008540152.jpg','http://localhost:4000/./uploads/img/tienda_banner/pollo1_1725008540152.jpg',3,6),(41,'Dirección: Calle 45 #8-22, Local 3','2024-08-30 09:02:56','Hamburguesas La Roca',0.0,'Neiva','Ubicado en Calle 45 #8-22, Local 3, Hamburguesas La Roca en Neiva es el lugar perfecto para disfrutar de hamburguesas jugosas y sabrosas. Ofrecemos una amplia variedad de hamburguesas gourmet, preparadas con ingredientes frescos y de alta calidad. Desde opciones clásicas hasta creaciones innovadoras, nuestro menú está diseñado para satisfacer todos los gustos. Ven a Hamburguesas La Roca y experimenta el auténtico sabor de una hamburguesa bien hecha en un ambiente cómodo y amigable.',1,'./uploads/img/tienda_miniatura/roca_1725008576424.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/roca_1725008576424.jpg','./uploads/img/tienda_banner/roca1_1725008576426.jpg','http://localhost:4000/./uploads/img/tienda_banner/roca1_1725008576426.jpg',3,6),(42,'Dirección: Calle 72 #15-30, Bogotá, Colombia','2024-08-30 09:11:13','Urban Style',0.0,'Bogotá','Ubicada en el corazón de Bogotá, Urban Style es la tienda de moda masculina que redefine el estilo urbano. Ofrecemos una selección cuidadosamente curada de ropa y accesorios modernos, pensados para el hombre actual que busca destacar en cualquier entorno. Con un enfoque en calidad y tendencias, aquí encontrarás desde piezas básicas hasta las más vanguardistas, todo bajo un mismo techo.\r\n',1,'./uploads/img/tienda_miniatura/mens_1725009073581.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/mens_1725009073581.jpg','./uploads/img/tienda_banner/mens1_1725009073589.jpg','http://localhost:4000/./uploads/img/tienda_banner/mens1_1725009073589.jpg',1,7),(43,'Carrera 52 #44-30','2024-08-30 09:12:29','ElectroCity',0.0,'Medellín','En ElectroCity, ubicada en el vibrante centro de Medellín, encontrarás la mejor selección de electrodomésticos para tu hogar. Ofrecemos una amplia gama de productos de alta calidad, desde neveras y lavadoras hasta pequeños electrodomésticos que facilitan tu vida diaria. Nuestro compromiso es brindarte tecnología de vanguardia a precios competitivos, con un servicio al cliente excepcional.\r\n',1,'./uploads/img/tienda_miniatura/electro_1725009149102.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/electro_1725009149102.jpg','./uploads/img/tienda_banner/elctro1_1725009149105.jpg','http://localhost:4000/./uploads/img/tienda_banner/elctro1_1725009149105.jpg',2,7),(44,'Avenida 6 Norte #23-45','2024-08-30 09:13:31','Fénix Deportes',0.0,'Cali','es tu destino principal para equiparte y estar siempre en movimiento. Situada en la dinámica ciudad de Cali, ofrecemos una extensa variedad de ropa, calzado, y accesorios deportivos de las mejores marcas. Ya sea que practiques running, fútbol, o fitness, en Fénix Deportes encontrarás todo lo necesario para alcanzar tus metas y rendir al máximo. Nuestro equipo está listo para asesorarte y ayudarte a encontrar el equipo perfecto para tu deporte favorito.\r\n',1,'./uploads/img/tienda_miniatura/fenix_1725009211073.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/fenix_1725009211073.jpg','./uploads/img/tienda_banner/fenix1_1725009211075.jpg','http://localhost:4000/./uploads/img/tienda_banner/fenix1_1725009211075.jpg',4,7);
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30  5:44:42



-- Vista `top4productos`
CREATE VIEW `top4productos` AS 
SELECT 
    p.`IdProducto`,
    p.`NombreProducto`,
    p.`CalificacionProducto`,
    p.`PrecioProducto`,
    p.`StockProducto`,
    p.`FotoProductoURL`
FROM 
    `producto` p
ORDER BY 
    p.`CalificacionProducto` DESC
LIMIT 4;

-- Vista `top4tiendas`
CREATE VIEW `top4tiendas` AS 
SELECT 
    t.`IdTienda`,
    t.`NombreTienda`,
    t.`CalificacionTienda`,
    t.`DireccionTienda`,
    t.`CiudadTienda`,
    t.`MiniaturaTiendaURL`
FROM 
    `tienda` t
ORDER BY 
    t.`CalificacionTienda` DESC
LIMIT 4;

-- Final view structure for view `belleza`
--
-- Vista para la categoría Belleza
CREATE VIEW `belleza` AS 
SELECT 
    t.`IdTienda`,
    t.`DireccionTienda`,
    t.`FechaAperturaTienda`,
    t.`NombreTienda`,
    t.`CalificacionTienda`,
    t.`CiudadTienda`,
    t.`DescripcionTienda`,
    t.`EstadoTienda`,
    t.`MiniaturaTienda`,
    t.`MiniaturaTiendaURL`,
    t.`BannerTienda`,
    t.`BannerTiendaURL`,
    t.`IdCategoriaFK`,
    t.`IdArrendatarioFK`
FROM 
    `tienda` t 
JOIN 
    `categoria` c 
ON 
    t.`IdCategoriaFK` = c.`IdCategoria`
WHERE 
    c.`NombreCategoria` = 'Belleza' 
    AND t.`EstadoTienda` = true;

-- Vista para la categoría Deportes
CREATE VIEW `deportes` AS 
SELECT 
    t.`IdTienda`,
    t.`DireccionTienda`,
    t.`FechaAperturaTienda`,
    t.`NombreTienda`,
    t.`CalificacionTienda`,
    t.`CiudadTienda`,
    t.`DescripcionTienda`,
    t.`EstadoTienda`,
    t.`MiniaturaTienda`,
    t.`MiniaturaTiendaURL`,
    t.`BannerTienda`,
    t.`BannerTiendaURL`,
    t.`IdCategoriaFK`,
    t.`IdArrendatarioFK`
FROM 
    `tienda` t 
JOIN 
    `categoria` c 
ON 
    t.`IdCategoriaFK` = c.`IdCategoria`
WHERE 
    c.`NombreCategoria` = 'Deportes' 
    AND t.`EstadoTienda` = true;

-- Vista para la categoría Electrodomésticos
CREATE VIEW `electrodomesticos` AS 
SELECT 
    t.`IdTienda`,
    t.`DireccionTienda`,
    t.`FechaAperturaTienda`,
    t.`NombreTienda`,
    t.`CalificacionTienda`,
    t.`CiudadTienda`,
    t.`DescripcionTienda`,
    t.`EstadoTienda`,
    t.`MiniaturaTienda`,
    t.`MiniaturaTiendaURL`,
    t.`BannerTienda`,
    t.`BannerTiendaURL`,
    t.`IdCategoriaFK`,
    t.`IdArrendatarioFK`
FROM 
    `tienda` t 
JOIN 
    `categoria` c 
ON 
    t.`IdCategoriaFK` = c.`IdCategoria`
WHERE 
    c.`NombreCategoria` = 'Electrodomésticos' 
    AND t.`EstadoTienda` = true;

-- Vista para la categoría Hogar
CREATE VIEW `hogar` AS 
SELECT 
    t.`IdTienda`,
    t.`DireccionTienda`,
    t.`FechaAperturaTienda`,
    t.`NombreTienda`,
    t.`CalificacionTienda`,
    t.`CiudadTienda`,
    t.`DescripcionTienda`,
    t.`EstadoTienda`,
    t.`MiniaturaTienda`,
    t.`MiniaturaTiendaURL`,
    t.`BannerTienda`,
    t.`BannerTiendaURL`,
    t.`IdCategoriaFK`,
    t.`IdArrendatarioFK`
FROM 
    `tienda` t 
JOIN 
    `categoria` c 
ON 
    t.`IdCategoriaFK` = c.`IdCategoria`
WHERE 
    c.`NombreCategoria` = 'Hogar' 
    AND t.`EstadoTienda` = true;

-- Vista para la categoría Juguetes
CREATE VIEW `juguetes` AS 
SELECT 
    t.`IdTienda`,
    t.`DireccionTienda`,
    t.`FechaAperturaTienda`,
    t.`NombreTienda`,
    t.`CalificacionTienda`,
    t.`CiudadTienda`,
    t.`DescripcionTienda`,
    t.`EstadoTienda`,
    t.`MiniaturaTienda`,
    t.`MiniaturaTiendaURL`,
    t.`BannerTienda`,
    t.`BannerTiendaURL`,
    t.`IdCategoriaFK`,
    t.`IdArrendatarioFK`
FROM 
    `tienda` t 
JOIN 
    `categoria` c 
ON 
    t.`IdCategoriaFK` = c.`IdCategoria`
WHERE 
    c.`NombreCategoria` = 'Juguetes' 
    AND t.`EstadoTienda` = true;

-- Vista para la categoría Moda
CREATE VIEW `moda` AS 
SELECT 
    t.`IdTienda`,
    t.`DireccionTienda`,
    t.`FechaAperturaTienda`,
    t.`NombreTienda`,
    t.`CalificacionTienda`,
    t.`CiudadTienda`,
    t.`DescripcionTienda`,
    t.`EstadoTienda`,
    t.`MiniaturaTienda`,
    t.`MiniaturaTiendaURL`,
    t.`BannerTienda`,
    t.`BannerTiendaURL`,
    t.`IdCategoriaFK`,
    t.`IdArrendatarioFK`
FROM 
    `tienda` t 
JOIN 
    `categoria` c 
ON 
    t.`IdCategoriaFK` = c.`IdCategoria`
WHERE 
    c.`NombreCategoria` = 'Moda' 
    AND t.`EstadoTienda` = true;

--
-- Final view structure for view `top4tiendas`
--

/*!50001 DROP VIEW IF EXISTS `top4tiendas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top4tiendas` AS select `tienda`.`IdTienda` AS `IdTienda`,`tienda`.`NombreTienda` AS `NombreTienda`,`tienda`.`CalificacionTienda` AS `CalificacionTienda`,`tienda`.`DireccionTienda` AS `DireccionTienda`,`tienda`.`CiudadTienda` AS `CiudadTienda`,`tienda`.`MiniaturaTiendaURL` AS `MiniaturaTiendaURL` from `tienda` order by `tienda`.`CalificacionTienda` desc limit 4 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-01 15:01:22

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearTienda`(
    IN p_IdPersona INT,
    IN p_NombreTienda VARCHAR(50),
    IN p_DireccionTienda VARCHAR(100),
    IN p_CiudadTienda VARCHAR(20),
    IN p_DescripcionTienda TEXT,
    IN p_IdCategoriaFK INT,
    IN p_MiniaturaTienda TEXT,
    IN P_MiniaturaTiendaURL TEXT,
    IN P_BannerTienda TEXT,
    IN p_BannerTiendaURL TEXT,
    IN p_FechaInicioArrendatario DATETIME,
    IN p_FechaExpiracionArrendatario DATETIME,
    OUT p_IdTienda INT
)
BEGIN
    DECLARE v_IdArrendatario INT;

    -- Manejar valores predeterminados para fechas
    IF p_FechaInicioArrendatario IS NULL THEN
        SET p_FechaInicioArrendatario = NOW();
    END IF;

    -- Verificar si la persona ya es arrendatario
    SELECT IdArrendatario INTO v_IdArrendatario
    FROM arrendatario
    WHERE IdPersonaFK = p_IdPersona;

    -- Si no es arrendatario, convertir a la persona en arrendatario
    IF v_IdArrendatario IS NULL THEN
        INSERT INTO arrendatario (
            IdPersonaFK,
            FechaInicioArrendatario,
            FechaExpiracionArrendatario
        ) VALUES (
            p_IdPersona,
            p_FechaInicioArrendatario,
            p_FechaExpiracionArrendatario
        );

        -- Obtener el ID del nuevo arrendatario
        SET v_IdArrendatario = LAST_INSERT_ID();
    ELSE
        -- Si ya es arrendatario, actualizar fechas si se proporcionan
        UPDATE arrendatario
        SET FechaInicioArrendatario = IFNULL(p_FechaInicioArrendatario, FechaInicioArrendatario),
            FechaExpiracionArrendatario = p_FechaExpiracionArrendatario
        WHERE IdArrendatario = v_IdArrendatario;
    END IF;

    -- Crear la tienda
    INSERT INTO tienda (
        NombreTienda,
        DireccionTienda,
        CiudadTienda,
        DescripcionTienda,
        MiniaturaTienda, 
        MiniaturaTiendaURL,
        BannerTienda,
        BannerTiendaURL,
        IdCategoriaFK,
        IdArrendatarioFK
    ) VALUES (
        p_NombreTienda,
        p_DireccionTienda,
        p_CiudadTienda,
        p_DescripcionTienda,
        p_MiniaturaTienda, 
        P_MiniaturaTiendaURL,
        P_BannerTienda,
        p_BannerTiendaURL,
        p_IdCategoriaFK,
        v_IdArrendatario
    );

    -- Obtener el ID de la tienda recién creada
    SET p_IdTienda = LAST_INSERT_ID();
END ;;
DELIMITER ;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProductosTienda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductosTienda`(
	IN p_IdTienda INT
)
BEGIN
    SELECT P.IdProducto, P.NombreProducto, P.DescripcionProducto, P.StockProducto, P.PrecioProducto, P.FotoProducto, P.FotoProductoURL, P.IdCategoriaFK, P.IdTiendaFK
    FROM 
        Producto AS P
    INNER JOIN 
        Tienda AS T ON T.IdTienda = P.IdTiendaFK
    WHERE 
        T.IdTienda = p_IdTienda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerTiendasPorPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTiendasPorPersona`(
	IN p_IdPersona INT
)
BEGIN
    SELECT 
        T.IdTienda, 
        T.NombreTienda, 
        T.DescripcionTienda,
        T.MiniaturaTiendaURL
    FROM 
        Tienda AS T
    INNER JOIN 
        Arrendatario AS A ON T.IdArrendatarioFK = A.IdArrendatario
    INNER JOIN 
        Persona AS P ON A.IdPersonaFK = P.IdPersona
    WHERE 
        P.IdPersona = p_IdPersona AND T.EstadoTienda = true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterPersona`(
    IN p_NombrePersona VARCHAR(20),
    IN p_ApellidoPersona VARCHAR(20),
    IN p_CorreoPersona VARCHAR(30),
    IN p_ClavePersona VARCHAR(255), -- Se recomienda usar VARCHAR(255) para contraseñas encriptadas
    IN p_TelefonoPersona INT
)
BEGIN
    INSERT INTO Persona (
        NombrePersona,
        ApellidoPersona,
        CorreoPersona,
        ClavePersona,
        TelefonoPersona,
        EstadoPersona,
        FotoPersona,
        FotoPersonaURL,
        bannerPersona,
        bannerPersonaURL,
        idRolFK
    ) VALUES (
        p_NombrePersona,
        p_ApellidoPersona,
        p_CorreoPersona,
        p_ClavePersona,
        p_TelefonoPersona,
        TRUE,          -- Valor predeterminado para EstadoPersona
        NULL,          -- Valor predeterminado para FotoPersona
        NULL,          -- Valor predeterminado para FotoPersonaURL
        NULL,          -- Valor predeterminado para bannerPersona
        NULL,          -- Valor predeterminado para bannerPersonaURL
        3              -- Valor predeterminado para idRolFK
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 



CREATE VIEW `top4productos` AS 
SELECT 
    p.IdProducto, 
    p.NombreProducto, 
    p.DescripcionProducto, 
    p.FotoProducto ,
    p.FotoProductoURL ,
    AVG(a.CalificacionAprobacion) AS PromedioCalificacion,
    p.PrecioProducto
FROM 
    producto p
INNER JOIN 
    aprobacion a ON p.IdProducto = a.IdProductoFK
GROUP BY 
    p.IdProducto, p.NombreProducto, p.DescripcionProducto, p.FotoProducto, p.FotoProductoURL
ORDER BY 
    PromedioCalificacion DESC
LIMIT 4;



-- Vista `top4tiendas`
CREATE VIEW `top4tiendas` AS 
SELECT 
    t.`IdTienda`,
    t.`NombreTienda`,
    t.`CalificacionTienda`,
    t.`DireccionTienda`,
    t.`CiudadTienda`,
    t.`MiniaturaTiendaURL`
FROM 
    `tienda` t
LIMIT 4;


CREATE VIEW `vertienda` AS 
SELECT 
    t.`IdTienda`,
    t.`DireccionTienda`,
    t.`FechaAperturaTienda`,
    t.`NombreTienda`,
    t.`CalificacionTienda`,
    t.`CiudadTienda`,
    t.`DescripcionTienda`,
    t.`EstadoTienda`,
    t.`MiniaturaTienda`,
    t.`MiniaturaTiendaURL`,
    t.`BannerTienda`,
    t.`BannerTiendaURL`
FROM 
    `tienda` t 
WHERE 
t.`EstadoTienda` = true;




delimiter //
create procedure crearComentario (
	in A_ComentarioAprobacion text,
    in A_CalificacionAprobacion DECIMAL(2,1),
    in A_IdPersonaFK int,
    in A_IdProductoFK int

)begin
	insert into Aprobacion (ComentarioAprobacion, CalificacionAprobacion, IdPersonaFK, IdProductoFK)values
    (A_ComentarioAprobacion,A_CalificacionAprobacion,A_IdPersonaFK,A_IdProductoFK);

end//

delimiter ;
delimiter //

create procedure Mostrarcomentarios (
    in A_IdProductoFK int

)begin
	select*from Aprobacion where IdProductoFK = A_IdProductoFK;

end//








