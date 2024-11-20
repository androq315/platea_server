/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



drop database if exists platea;
create database  platea;
use platea;
-- Table structure 
-- Table structure for table aprobacion
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
  CONSTRAINT `FK_Producto_Calificacion` FOREIGN KEY (`IdProductoFK`) REFERENCES `producto` (`IdProducto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprobacion`
--

LOCK TABLES `aprobacion` WRITE;
/*!40000 ALTER TABLE `aprobacion` DISABLE KEYS */;
INSERT INTO `aprobacion` VALUES (17,'No me gustó, muy malo',1.0,'2024-09-21 10:00:00',20,6),(18,'Aceptable, podría mejorar',3.0,'2024-09-21 10:05:00',21,6),(19,'Excelente, lo recomiendo',5.0,'2024-09-21 10:10:00',22,6),(20,'Deficiente, no lo volvería a comprar',1.0,'2024-09-21 10:15:00',23,7),(21,'Buena calidad, satisface las expectativas',4.0,'2024-09-21 10:20:00',24,7),(22,'Regular, esperaba más',3.0,'2024-09-21 10:25:00',25,7),(23,'Desastroso, no lo compren',1.0,'2024-09-21 10:30:00',26,8),(24,'Muy bueno, volveré a comprar',4.0,'2024-09-21 10:35:00',20,8),(25,'Satisfactorio, cumple su función',3.0,'2024-09-21 10:40:00',21,8),(26,'Malo, no vale la pena',1.0,'2024-09-21 10:45:00',22,9),(27,'Excelente producto, me encantó',5.0,'2024-09-21 10:50:00',23,9),(28,'Regular, podría ser mejor',3.0,'2024-09-21 10:55:00',24,9),(29,'Pésimo, no lo compren',1.0,'2024-09-21 11:00:00',25,10),(30,'Muy bueno, lo recomiendo a todos',4.0,'2024-09-21 11:05:00',26,10),(31,'Cumple con lo prometido',3.0,'2024-09-21 11:10:00',20,10),(32,'Deficiente, no lo volvería a comprar',1.0,'2024-09-21 11:15:00',21,11),(33,'Gran calidad, estoy satisfecho',4.0,'2024-09-21 11:20:00',22,11),(34,'Regular, no es lo que esperaba',3.0,'2024-09-21 11:25:00',23,11),(35,'Malo, no lo compren',1.0,'2024-09-21 11:30:00',24,12),(36,'Excelente, volveré a comprar',4.0,'2024-09-21 11:35:00',25,12),(37,'Suficiente, podría mejorar',3.0,'2024-09-21 11:40:00',26,12),(38,'Malo, no vale la pena',1.0,'2024-09-21 11:45:00',20,13),(39,'Muy bueno, lo volvería a comprar',4.0,'2024-09-21 11:50:00',21,13),(40,'Regular, aceptable',3.0,'2024-09-21 11:55:00',22,13),(41,'Desastroso, no lo compren',1.0,'2024-09-21 12:00:00',23,14),(42,'Excelente, lo recomiendo a todos',4.0,'2024-09-21 12:05:00',24,14),(43,'Satisfactorio, cumple su función',3.0,'2024-09-21 12:10:00',25,14),(53,'Deficiente, no lo volvería a comprar',1.0,'2024-09-21 13:00:00',21,18),(54,'Gran calidad, estoy satisfecho',4.0,'2024-09-21 13:05:00',22,18),(55,'Regular, no es lo que esperaba',3.0,'2024-09-21 13:10:00',23,18),(56,'Malo, no lo compren',1.0,'2024-09-21 13:15:00',24,19),(57,'Excelente, volveré a comprar',4.0,'2024-09-21 13:20:00',25,19),(58,'Suficiente, podría mejorar',3.0,'2024-09-21 13:25:00',26,19),(59,'Malo, no vale la pena',1.0,'2024-09-21 13:30:00',20,20),(60,'Muy bueno, lo volvería a comprar',4.0,'2024-09-21 13:35:00',21,20),(61,'Regular, aceptable',3.0,'2024-09-21 13:40:00',22,20),(65,'Malo, no lo compren',1.0,'2024-09-21 14:00:00',26,22),(66,'Muy bueno, lo volvería a comprar',4.0,'2024-09-21 14:05:00',20,22),(67,'Regular, aceptable',3.0,'2024-09-21 14:10:00',21,22),(68,'Malo, no lo compren',1.0,'2024-09-21 14:15:00',22,23),(69,'Excelente, lo recomiendo a todos',4.0,'2024-09-21 14:20:00',23,23),(70,'Regular, no es lo que esperaba',3.0,'2024-09-21 14:25:00',24,23),(71,'Malo, no lo compren',1.0,'2024-09-21 14:30:00',25,24),(72,'Excelente, volveré a comprar',4.0,'2024-09-21 14:35:00',26,24),(73,'Suficiente, podría mejorar',3.0,'2024-09-21 14:40:00',20,24),(74,'Malo, no lo compren',1.0,'2024-09-21 14:45:00',21,25),(75,'Muy bueno, lo volvería a comprar',4.0,'2024-09-21 14:50:00',22,25),(76,'Regular, aceptable',3.0,'2024-09-21 14:55:00',23,25),(77,'Malo, no lo compren',1.0,'2024-09-21 15:00:00',24,26),(78,'Excelente, lo recomiendo a todos',4.0,'2024-09-21 15:05:00',25,26),(79,'Suficiente, podría mejorar',3.0,'2024-09-21 15:10:00',26,26),(80,'Malo, no lo compren',1.0,'2024-09-21 15:15:00',20,27),(81,'Regular, esperaba más',3.0,'2024-09-21 15:20:00',21,27),(82,'Excelente, lo recomiendo',5.0,'2024-09-21 15:25:00',22,27),(83,'Deficiente, no lo volvería a comprar',1.0,'2024-09-21 15:30:00',23,28),(84,'Buena calidad, satisface las expectativas',4.0,'2024-09-21 15:35:00',24,28),(85,'Satisfactorio, cumple su función',3.0,'2024-09-21 15:40:00',25,28),(86,'Desastroso, no lo compren',1.0,'2024-09-21 15:45:00',26,29),(87,'Muy bueno, volveré a comprar',4.0,'2024-09-21 15:50:00',20,29),(88,'Regular, aceptable',3.0,'2024-09-21 15:55:00',21,29),(89,'Malo, no vale la pena',1.0,'2024-09-21 16:00:00',22,30),(90,'Excelente, lo recomiendo a todos',4.0,'2024-09-21 16:05:00',23,30),(91,'Cumple con lo prometido',3.0,'2024-09-21 16:10:00',24,30),(92,'Pésimo, no lo compren',1.0,'2024-09-21 16:15:00',25,31),(93,'Muy bueno, lo volvería a comprar',4.0,'2024-09-21 16:20:00',26,31),(94,'Suficiente, podría mejorar',3.0,'2024-09-21 16:25:00',20,31),(95,'Deficiente, no lo volvería a comprar',1.0,'2024-09-21 16:30:00',21,32),(96,'Gran calidad, estoy satisfecho',4.0,'2024-09-21 16:35:00',22,32),(97,'Regular, no es lo que esperaba',3.0,'2024-09-21 16:40:00',23,32),(98,'Malo, no lo compren',1.0,'2024-09-21 16:45:00',24,33),(99,'Excelente, volveré a comprar',4.0,'2024-09-21 16:50:00',25,33),(100,'Suficiente, podría mejorar',3.0,'2024-09-21 16:55:00',26,33),(101,'Malo, no vale la pena',1.0,'2024-09-21 17:00:00',20,34),(102,'Muy bueno, lo volvería a comprar',4.0,'2024-09-21 17:05:00',21,34),(103,'Regular, aceptable',3.0,'2024-09-21 17:10:00',22,34),(104,'Desastroso, no lo compren',1.0,'2024-09-21 17:15:00',23,35),(105,'Excelente, lo recomiendo a todos',4.0,'2024-09-21 17:20:00',24,35),(106,'Satisfactorio, cumple su función',3.0,'2024-09-21 17:25:00',25,35),(107,'Malo, no lo compren',1.0,'2024-09-21 17:30:00',26,36),(108,'Muy bueno, volveré a comprar',4.0,'2024-09-21 17:35:00',20,36),(109,'Regular, esperaba más',3.0,'2024-09-21 17:40:00',21,36);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrendatario`
--

LOCK TABLES `arrendatario` WRITE;
/*!40000 ALTER TABLE `arrendatario` DISABLE KEYS */;
INSERT INTO `arrendatario` VALUES (6,'2024-08-30 04:02:56','2024-10-30 04:02:56',NULL,1,13),(7,'2024-08-30 04:13:31','2024-10-30 04:13:31',NULL,1,14),(8,'2024-08-30 03:57:56','2024-10-30 03:57:56',NULL,1,15),(9,'2024-08-30 04:00:49','2024-10-30 04:00:49',NULL,1,16),(10,'2024-09-20 00:45:20','2024-11-20 00:45:20',NULL,1,20);
/*!40000 ALTER TABLE `arrendatario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `belleza`
--

DROP TABLE IF EXISTS `belleza`;
/*!50001 DROP VIEW IF EXISTS `belleza`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `belleza` AS SELECT 
 1 AS `IdTienda`,
 1 AS `DireccionTienda`,
 1 AS `FechaAperturaTienda`,
 1 AS `NombreTienda`,
 1 AS `CalificacionTienda`,
 1 AS `CiudadTienda`,
 1 AS `DescripcionTienda`,
 1 AS `EstadoTienda`,
 1 AS `MiniaturaTienda`,
 1 AS `MiniaturaTiendaURL`,
 1 AS `BannerTienda`,
 1 AS `BannerTiendaURL`,
 1 AS `IdCategoriaFK`,
 1 AS `IdArrendatarioFK`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `IdCarrito` int(11) NOT NULL AUTO_INCREMENT,
  `IdPersonaFK` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`IdCarrito`),
  KEY `FK_Persona_Carrito` (`IdPersonaFK`),
  CONSTRAINT `FK_Persona_Carrito` FOREIGN KEY (`IdPersonaFK`) REFERENCES `persona` (`IdPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (17,NULL,'2024-09-08 18:08:58'),(18,17,'2024-09-09 15:52:30'),(19,20,'2024-09-20 02:55:41'),(22,23,'2024-10-20 00:52:52');
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
  `FotoCategoria` text DEFAULT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Moda','http://localhost:4000/uploads/img/categoria/moda_1726827063879.jpg'),(2,'Electrodometicos','http://localhost:4000/uploads/img/categoria/electrodomesticos_1726827079713.jpg'),(3,'Hogar','http://localhost:4000/uploads/img/categoria/hogar_1726827091613.jpg'),(4,'Deportes','http://localhost:4000/uploads/img/categoria/deportes_1726827807855.jpg'),(5,'Juguetes','http://localhost:4000/uploads/img/categoria/juguetes_1726827817923.jpg'),(6,'Belleza','http://localhost:4000/uploads/img/categoria/belleza_1726827828251.jpg'),(7,'Electrónica','http://localhost:4000/uploads/img/categoria/1_1726827838022.jpg'),(8,'Libros','http://localhost:4000/uploads/img/categoria/libros_1726827844567.avif'),(9,'Comida','http://localhost:4000/uploads/img/categoria/ham_1726827851007.jpg'),(10,'Salud','http://localhost:4000/uploads/img/categoria/med_1726827857165.jpg'),(11,'Oficina','http://localhost:4000/uploads/img/categoria/ofi_1726827862991.jpg');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Bogotá','Bogotá D.C.'),(2,'Medellín','Antioquia'),(3,'Cali','Valle del Cauca'),(4,'Barranquilla','Atlántico'),(5,'Cartagena','Bolívar'),(6,'Bucaramanga','Santander'),(7,'Cúcuta','Norte de Santander'),(8,'Santa Marta','Magdalena'),(9,'Manizales','Caldas'),(10,'Pereira','Risaralda'),(11,'Villavicencio','Meta'),(12,'Montería','Córdoba'),(13,'Ibagué','Tolima'),(14,'Pasto','Nariño'),(15,'Popayán','Cauca'),(16,'Quibdó','Chocó');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `deportes`
--

DROP TABLE IF EXISTS `deportes`;
/*!50001 DROP VIEW IF EXISTS `deportes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `deportes` AS SELECT 
 1 AS `IdTienda`,
 1 AS `DireccionTienda`,
 1 AS `FechaAperturaTienda`,
 1 AS `NombreTienda`,
 1 AS `CalificacionTienda`,
 1 AS `CiudadTienda`,
 1 AS `DescripcionTienda`,
 1 AS `EstadoTienda`,
 1 AS `MiniaturaTienda`,
 1 AS `MiniaturaTiendaURL`,
 1 AS `BannerTienda`,
 1 AS `BannerTiendaURL`,
 1 AS `IdCategoriaFK`,
 1 AS `IdArrendatarioFK`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `detallecarrito`
--

DROP TABLE IF EXISTS `detallecarrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallecarrito` (
  `IdDetalleCarrito` int(11) NOT NULL AUTO_INCREMENT,
  `IdCarritoFK` int(11) NOT NULL,
  `IdProductoFK` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT 1,
  PRIMARY KEY (`IdDetalleCarrito`),
  KEY `FK_Producto_DetalleCarrito` (`IdProductoFK`),
  KEY `FK_Carrito_DetalleCarrito` (`IdCarritoFK`),
  CONSTRAINT `FK_Carrito_DetalleCarrito` FOREIGN KEY (`IdCarritoFK`) REFERENCES `carrito` (`IdCarrito`),
  CONSTRAINT `FK_Producto_DetalleCarrito` FOREIGN KEY (`IdProductoFK`) REFERENCES `producto` (`IdProducto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecarrito`
--

LOCK TABLES `detallecarrito` WRITE;
/*!40000 ALTER TABLE `detallecarrito` DISABLE KEYS */;
INSERT INTO `detallecarrito` VALUES (1,17,6,1),(7,18,25,1),(9,18,23,3),(47,22,25,2),(48,22,24,1),(49,22,9,1),(52,19,24,9);
/*!40000 ALTER TABLE `detallecarrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Carrera 88a'),(2,''),(3,'Cra 2 #79-18 sur'),(4,''),(5,'Cra 2 #79-18 sur'),(6,'Cra 2 #79-18 sur'),(7,'Cra 2 #79-18 sur'),(8,'Cra 2 #79-18 sur'),(9,'Cra 2 #79-18 sur'),(10,'Cra 2 #79-18 sur'),(11,'Cra 2 #79-18 sur'),(12,'Cra 2 #79-18 sur'),(13,'Cra 2 #79-18 sur'),(14,'Cra 2 #79-18 sur'),(15,'calle127D95a77'),(16,'carrera 96A 127C 68'),(17,'Dirección: Calle 68 #18-40, Local'),(18,'calle127D95a77'),(19,'Dirección: Carrera 20 #8-55, Local'),(20,'carrera 96A 127C 68'),(21,'carrera 96A 127C 68'),(22,'Dirección: Carrera 20 #8-55, Local'),(23,'Cra 2 #79-18 sur');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `electrodomesticos`
--

DROP TABLE IF EXISTS `electrodomesticos`;
/*!50001 DROP VIEW IF EXISTS `electrodomesticos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `electrodomesticos` AS SELECT 
 1 AS `IdTienda`,
 1 AS `DireccionTienda`,
 1 AS `FechaAperturaTienda`,
 1 AS `NombreTienda`,
 1 AS `CalificacionTienda`,
 1 AS `CiudadTienda`,
 1 AS `DescripcionTienda`,
 1 AS `EstadoTienda`,
 1 AS `MiniaturaTienda`,
 1 AS `MiniaturaTiendaURL`,
 1 AS `BannerTienda`,
 1 AS `BannerTiendaURL`,
 1 AS `IdCategoriaFK`,
 1 AS `IdArrendatarioFK`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `hogar`
--

DROP TABLE IF EXISTS `hogar`;
/*!50001 DROP VIEW IF EXISTS `hogar`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `hogar` AS SELECT 
 1 AS `IdTienda`,
 1 AS `DireccionTienda`,
 1 AS `FechaAperturaTienda`,
 1 AS `NombreTienda`,
 1 AS `CalificacionTienda`,
 1 AS `CiudadTienda`,
 1 AS `DescripcionTienda`,
 1 AS `EstadoTienda`,
 1 AS `MiniaturaTienda`,
 1 AS `MiniaturaTiendaURL`,
 1 AS `BannerTienda`,
 1 AS `BannerTiendaURL`,
 1 AS `IdCategoriaFK`,
 1 AS `IdArrendatarioFK`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `juguetes`
--

DROP TABLE IF EXISTS `juguetes`;
/*!50001 DROP VIEW IF EXISTS `juguetes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `juguetes` AS SELECT 
 1 AS `IdTienda`,
 1 AS `DireccionTienda`,
 1 AS `FechaAperturaTienda`,
 1 AS `NombreTienda`,
 1 AS `CalificacionTienda`,
 1 AS `CiudadTienda`,
 1 AS `DescripcionTienda`,
 1 AS `EstadoTienda`,
 1 AS `MiniaturaTienda`,
 1 AS `MiniaturaTiendaURL`,
 1 AS `BannerTienda`,
 1 AS `BannerTiendaURL`,
 1 AS `IdCategoriaFK`,
 1 AS `IdArrendatarioFK`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `moda`
--

DROP TABLE IF EXISTS `moda`;
/*!50001 DROP VIEW IF EXISTS `moda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `moda` AS SELECT 
 1 AS `IdTienda`,
 1 AS `DireccionTienda`,
 1 AS `FechaAperturaTienda`,
 1 AS `NombreTienda`,
 1 AS `CalificacionTienda`,
 1 AS `CiudadTienda`,
 1 AS `DescripcionTienda`,
 1 AS `EstadoTienda`,
 1 AS `MiniaturaTienda`,
 1 AS `MiniaturaTiendaURL`,
 1 AS `BannerTienda`,
 1 AS `BannerTiendaURL`,
 1 AS `IdCategoriaFK`,
 1 AS `IdArrendatarioFK`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `IdPedido` int(11) NOT NULL AUTO_INCREMENT,
  `IdPersonaFK` int(11) NOT NULL,
  `IdDireccionFK` int(11) DEFAULT NULL,
  `IdCiudadFK` int(11) DEFAULT NULL,
  `FechaPedido` datetime DEFAULT current_timestamp(),
  `EstadoPedido` enum('Pendiente','Enviado','Entregado','Cancelado','En Proceso') DEFAULT 'Pendiente',
  `Total` decimal(10,2) NOT NULL,
  `FechaEnvio` datetime DEFAULT NULL,
  `FechaEntrega` datetime DEFAULT NULL,
  `NumeroPedido` int(11) NOT NULL,
  PRIMARY KEY (`IdPedido`),
  KEY `IdPersonaFK` (`IdPersonaFK`),
  KEY `pedido_ibfk_2` (`IdDireccionFK`),
  KEY `pedido_ibfk_3` (`IdCiudadFK`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`IdPersonaFK`) REFERENCES `persona` (`IdPersona`) ON DELETE CASCADE,
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`IdDireccionFK`) REFERENCES `direccion` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`IdCiudadFK`) REFERENCES `ciudades` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (23,20,23,2,'2024-10-24 13:19:52','Pendiente',265000.00,NULL,NULL,1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_insert_pedido
BEFORE INSERT ON pedido
FOR EACH ROW
BEGIN
    DECLARE max_numero INT DEFAULT 0;

    -- Obtener el número máximo de pedido existente para el cliente
    SELECT COALESCE(MAX(NumeroPedido), 0) INTO max_numero
    FROM pedido
    WHERE IdPersonaFK = NEW.IdPersonaFK;

    -- Asignar el siguiente número de pedido
    SET NEW.NumeroPedido = max_numero + 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedidoproducto`
--

DROP TABLE IF EXISTS `pedidoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidoproducto` (
  `IdPedidoFK` int(11) NOT NULL,
  `IdProductoFK` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`IdPedidoFK`,`IdProductoFK`),
  KEY `IdProductoFK` (`IdProductoFK`),
  CONSTRAINT `pedidoproducto_ibfk_1` FOREIGN KEY (`IdPedidoFK`) REFERENCES `pedido` (`IdPedido`) ON DELETE CASCADE,
  CONSTRAINT `pedidoproducto_ibfk_2` FOREIGN KEY (`IdProductoFK`) REFERENCES `producto` (`IdProducto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoproducto`
--

LOCK TABLES `pedidoproducto` WRITE;
/*!40000 ALTER TABLE `pedidoproducto` DISABLE KEYS */;
INSERT INTO `pedidoproducto` VALUES (23,32,1);
/*!40000 ALTER TABLE `pedidoproducto` ENABLE KEYS */;
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
  `CorreoPersona` varchar(250) NOT NULL,
  `DescripcionPersona` text DEFAULT NULL,
  `ClavePersona` blob NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
INSERT INTO persona VALUES 
('20', 'ANDRES', 'SUAREZ', 'anuelaaa549@gmail.com', ' ', aes_encrypt('$2b$10$yP9GmqkeTVDazns.qioexukfgN3BoAz61TRGzED6c2l8kBnXFIDnG','bd_secret_key'), '1', '2147483647', './uploads/img/persona_avatar/descarga_1726785209057.jpeg', 'http://localhost:4000/./uploads/img/persona_avatar/descarga_1726785209057.jpeg', './uploads/img/banner/gatito_1726785209061.gif', 'http://localhost:4000/./uploads/img/banner/gatito_1726785209061.gif', '2'),
('21', 'ANDRES', 'MEZA', 'andresf@gmail.com', NULL, aes_encrypt('$2b$10$yP9GmqkeTVDazns.qioexukfgN3BoAz61TRGzED6c2l8kBnXFIDnG','bd_secret_key'), '1', '2147483647', NULL, NULL, NULL, NULL, '2'),
('22', 'DANNER', 'ARIAS', 'danner@info.com', NULL, aes_encrypt('$2b$10$yP9GmqkeTVDazns.qioexukfgN3BoAz61TRGzED6c2l8kBnXFIDnG','bd_secret_key'), '1', '2147483647', NULL, NULL, NULL, NULL, '3'),
('24', 'anyi', 'mendivelso', 'anyicamilamendivelsorojas@gmail.com', 'null', aes_encrypt('$2b$10$yP9GmqkeTVDazns.qioexukfgN3BoAz61TRGzED6c2l8kBnXFIDnG','bd_secret_key'), '1', '2147483647', './uploads/img/persona_avatar/perfil1_1729757252767.jpeg', 'http://localhost:4000/./uploads/img/persona_avatar/perfil1_1729757252767.jpeg', NULL, NULL, '3'),
('25', 'carlos', 'martinez', 'cmmartinez871@soy.sena.edu.co', 'null', aes_encrypt('$2b$10$yP9GmqkeTVDazns.qioexukfgN3BoAz61TRGzED6c2l8kBnXFIDnG','bd_secret_key'), '1', '1232133213', './uploads/img/persona_avatar/perfil2_1729757401476.jpeg', 'http://localhost:4000/./uploads/img/persona_avatar/perfil2_1729757401476.jpeg', NULL, NULL, '3'),
('26', 'johan', 'orostegui', 'aorostegui2@gmail.com', 'null', aes_encrypt('$2b$10$yP9GmqkeTVDazns.qioexukfgN3BoAz61TRGzED6c2l8kBnXFIDnG','bd_secret_key'), '1', '2147483647', './uploads/img/persona_avatar/perfil3_1729757507690.jpeg', 'http://localhost:4000/./uploads/img/persona_avatar/perfil3_1729757507690.jpeg', NULL, NULL, '3');
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
  `PrecioProducto` int(11) NOT NULL,
  `FotoProducto` text DEFAULT NULL,
  `FotoProductoURL` text DEFAULT NULL,
  `IdCategoriaFK` int(11) DEFAULT NULL,
  `IdTiendaFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `FK_Categoria_Producto` (`IdCategoriaFK`),
  KEY `FK_Tienda_Producto` (`IdTiendaFK`),
  CONSTRAINT `FK_Categoria_Producto` FOREIGN KEY (`IdCategoriaFK`) REFERENCES `categoria` (`IdCategoria`),
  CONSTRAINT `FK_Tienda_Producto` FOREIGN KEY (`IdTiendaFK`) REFERENCES `tienda` (`IdTienda`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (6,'rey silente','¡Presentamos al Rey Silente, la figura suprema de los Necrones en Warhammer 40K! Este impresionante modelo captura a Szarekh en todo su poder, sentado en su trono y flanqueado por sus fieles Triarcas. Perfecto para cualquier coleccionista o jugador que desee comandar la galaxia.\r\n',1,750000,'uploads/img/producto/rey_1725009352229.jpg','http://localhost:4000/uploads/img/producto/rey_1725009352229.jpg',5,30),(7,'caballero del caos','¡Conoce al Caballero del Caos de Warhammer 40K! Este imponente modelo representa a un titánico Caballero al servicio de las fuerzas del Caos, con detalles siniestros y una apariencia amenazante que destaca en cualquier ejército. Equipado con armas devastadoras y adornado con iconografía caótica, es una pieza clave para los seguidores del Caos que buscan dominar el campo de batalla.\r\n',11,3500000,'uploads/img/producto/caballero_1725009396947.jpg','http://localhost:4000/uploads/img/producto/caballero_1725009396947.jpg',5,30),(8,'ultra marine','¡Presentamos al Ultramarine! Este modelo de Warhammer 40K captura la esencia de los famosos Marines Espaciales de los Ultramarines, conocidos por su disciplina y valentía. Perfecto para completar tu ejército o para cualquier colección, este soldado está detallado con el icónico esquema de color azul y el símbolo de los Ultramarines.\r\n\r\n',-1,50000,'uploads/img/producto/marine_1725009458032.jpg','http://localhost:4000/uploads/img/producto/marine_1725009458032.jpg',5,30),(9,'fulgrim ','¡Conoce a Fulgrim, Príncipe Demonio de Warhammer 40K! Este impresionante modelo representa a Fulgrim, el Primarca caído de los Emperadores Hijos, transformado en un temible Príncipe Demonio del Caos. Con su diseño detallado y su aura de decadencia, es una figura central para cualquier ejército del Caos y un desafío formidable en el campo de batalla.\r\n',12,450000,'uploads/img/producto/fulgrim_1725009514488.jpg','http://localhost:4000/uploads/img/producto/fulgrim_1725009514488.jpg',5,30),(10,'rylanor','¡Conoce a Rylanor, el Despertado, de los Hijos del Emperador! Este modelo representa a uno de los legendarios Guerreros de los Emperadores Hijos, despertado de su largo letargo para unirse a la batalla. Con una estética impresionante y una historia rica en el lore de Warhammer 40K, Rylanor encarna la fuerza y el honor de su legión',121,120000,'uploads/img/producto/raylanor_1725009551908.jpg','http://localhost:4000/uploads/img/producto/raylanor_1725009551908.jpg',5,30),(11,'Lion ElJonson','¡Descubre a Lion ElJonson, el Primarca de los Ángeles Oscuros en Warhammer 40K! Este modelo representa al legendario líder de los Ángeles Oscuros, conocido por su habilidad en la batalla y su presencia imponente. Con su armadura detallada y su espada de energía, Lion ElJonson es una figura clave para cualquier ejército de los Ángeles Oscuros y un símbolo de la fuerza de su legión.\r\n',1,120000,'uploads/img/producto/lion_1725009606156.jpg','http://localhost:4000/uploads/img/producto/lion_1725009606156.jpg',5,30),(12,'Trazin el Infinito','¡Descubre a Trazin el Infinito, el inmortal Señor de la Colección de los Necrones en Warhammer 40K! Este modelo captura al enigmático y poderoso Necron, conocido por su obsesión con la recolección de artefactos y secretos del universo. Equipado con su icónica vara y una armadura intricada, Trazin el Infinito es una pieza clave para cualquier ejército Necron y un símbolo de su misterio y poder interminable.\r\n',4,150000,'uploads/img/producto/trazin_1725009643824.jpg','http://localhost:4000/uploads/img/producto/trazin_1725009643824.jpg',5,30),(13,'Ghazghkull Mag Uruk Thraka','¡Conoce a Ghazghkull Mag Uruk Thraka, el legendario Warboss Orko en Warhammer 40K! Este modelo representa al temido líder de los Orkos, conocido por su increíble poder y habilidad para liderar a sus huestes en la batalla. Con su impresionante armadura de guerra, su icónico kustom mega-blasta y su presencia imponente, Ghazghkull es un pilar central en cualquier ejército Orko y una figura clave en la lucha por la dominación del universo.\r\n',16,180000,'uploads/img/producto/mag_1725009686389.jpg','http://localhost:4000/uploads/img/producto/mag_1725009686389.jpg',5,30),(14,'Blazer Clásico','¡Eleva tu estilo con nuestro Blazer Clásico! Este blazer es la combinación perfecta de elegancia y versatilidad, ideal para cualquier ocasión, ya sea en el trabajo o en eventos formales. Confeccionado en tela de alta calidad, presenta un corte impecable, solapas de muesca y un ajuste cómodo. Disponible en una variedad de colores sofisticados, es una prenda esencial para el guardarropa de cualquier persona que busque un toque de distinción y profesionalismo en su vestimenta.\r\n',144,220000,'uploads/img/producto/blazer_1725009740549.jpg','http://localhost:4000/uploads/img/producto/blazer_1725009740549.jpg',1,27),(18,'Chaqueta Corta de Viento2','¡Prepárate para cualquier aventura con nuestra Chaqueta Corta de Viento! Diseñada para ofrecer protección contra el viento y la lluvia ligera, esta chaqueta está confeccionada en un material ligero y resistente al agua. Su corte moderno y ajustado proporciona un estilo dinámico, mientras que la capucha ajustable y los bolsillos funcionales añaden comodidad y practicidad. Ideal para actividades al aire libre o para un look casual en días ventosos, esta chaqueta es tu compañera perfecta para el clima cambiante.\r\n',12,180000,'uploads/img/producto/corta_1725009898515.jpg','http://localhost:4000/uploads/img/producto/corta_1725009898515.jpg',1,27),(19,'Ropa Infantil Divertida y Cómoda 3','¡Haz que cada día sea una aventura con nuestra Ropa Infantil Divertida y Cómoda! Nuestra colección está diseñada pensando en la comodidad y el estilo de los más pequeños. Ofrecemos una variedad de prendas, desde coloridos conjuntos y camisetas con estampados alegres hasta pantalones y chaquetas resistentes y prácticos. Con tejidos suaves y duraderos, nuestras prendas garantizan libertad de movimiento y facilidad de uso para que los niños puedan jugar y explorar con total libertad. Perfecta para cualquier ocasión, nuestra ropa infantil combina funcionalidad con diversión.\r\n',1,80000,'uploads/img/producto/niÃ±o_1725010133032.jpg','http://localhost:4000/uploads/img/producto/niÃ±o_1725010133032.jpg',1,27),(20,'Blazer Slim para Hombre','¡Añade un toque de sofisticación a tu vestuario con nuestro Blazer Slim para Hombre! Este blazer, con un corte ajustado y moderno, está diseñado para realzar tu figura y proporcionar un look elegante y contemporáneo. Confeccionado en tejido de alta calidad, ofrece un acabado impecable y un ajuste cómodo. Ideal para eventos formales, reuniones de trabajo o una salida nocturna, su diseño versátil se adapta a cualquier ocasión. Disponible en una gama de colores clásicos, este blazer es una pieza esencial para cualquier armario masculino.\r\n',56,250000,'uploads/img/producto/slim_1725010173632.jpg','http://localhost:4000/uploads/img/producto/slim_1725010173632.jpg',1,27),(22,'Hamburguesa Artesanal','¡Deléitate con nuestra Hamburguesa Artesanal! Preparada con ingredientes frescos y de alta calidad, esta hamburguesa ofrece un sabor auténtico y una textura jugosa que resalta la artesanía detrás de cada bocado. Con una carne de res seleccionada, cocida a la perfección y acompañada de pan artesanal, vegetales frescos y salsas caseras, cada hamburguesa está diseñada para brindar una experiencia gastronómica única. Personaliza tu hamburguesa con una variedad de ingredientes adicionales y disfruta de un plato que celebra la calidad y el sabor.\r\n\r\n',50,150000,'uploads/img/producto/comer_1725010333957.jpg','http://localhost:4000/uploads/img/producto/comer_1725010333957.jpg',9,28),(23,' Perro Caliente Clásico','¡Disfruta del sabor inconfundible de nuestro Perro Caliente Clásico! Preparado con una salchicha jugosa y cocida a la perfección, este perro caliente está servido en un pan suave y fresco. Complementado con tus condimentos favoritos, como mostaza, ketchup, cebolla crujiente y relish, es el bocadillo perfecto para cualquier ocasión. Ideal para un almuerzo rápido o una merienda informal, nuestro perro caliente combina simplicidad y sabor en cada bocado.\r\n',34,45000,'uploads/img/producto/perroc_1725010385955.jpg','http://localhost:4000/uploads/img/producto/perroc_1725010385955.jpg',9,28),(24,'Donas Gourmet','¡Déjate seducir por nuestras Donas Gourmet! Elaboradas con recetas artesanales, estas donas ofrecen una experiencia dulce y deliciosa en cada bocado. Disponibles en una variedad de sabores, desde glaseado clásico hasta combinaciones innovadoras, cada dona está hecha con ingredientes frescos y de alta calidad. Perfectas para acompañar tu café matutino o como un capricho dulce durante el día, nuestras donas son el toque perfecto para cualquier ocasión.',47,25000,'uploads/img/producto/donas_1725010490693.jpg','http://localhost:4000/uploads/img/producto/donas_1725010490693.jpg',9,28),(25,'Empanadas Caseras','¡Saborea nuestras Empanadas Caseras, el auténtico sabor en cada bocado! Hechas con una masa crujiente y dorada, estas empanadas están rellenas con ingredientes frescos y de alta calidad, como carne jugosa, pollo tierno o una mezcla deliciosa de vegetales y quesos. Perfectas para un aperitivo, un almuerzo rápido o una cena informal, nuestras empanadas ofrecen un equilibrio perfecto entre sabor y textura. Ven y disfruta de este clásico delicioso y reconfortante.\r\n',38,20000,'uploads/img/producto/Imagen de WhatsApp 2024-08-30 a las 01_1725010536040.jpg','http://localhost:4000/uploads/img/producto/Imagen de WhatsApp 2024-08-30 a las 01_1725010536040.jpg',9,28),(26,' Salchipapa Sabrosa','¡Descubre nuestra Salchipapa Sabrosa, una combinación irresistible de papas fritas crujientes y salchichas jugosas! Cada porción presenta papas recién fritas y doradas, acompañadas de salchichas de alta calidad, cocidas a la perfección. Puedes personalizar tu salchipapa con una variedad de salsas y condimentos, como ketchup, mayonesa, mostaza o salsa picante, para un toque adicional de sabor. Ideal para compartir con amigos o disfrutar como una comida rápida y deliciosa, nuestra salchipapa es un clásico que siempre satisface.\r\n',66,30000,'uploads/img/producto/salchipapa_1725010594259.jpg','http://localhost:4000/uploads/img/producto/salchipapa_1725010594259.jpg',9,28),(29,'Poppy, La Perrita Que Mueve La Cola','\r\n¡Conoce a Poppy, La Perrita Que Mueve La Cola, el juguete perfecto para tu amigo peludo! Diseñada para proporcionar horas de diversión, Poppy tiene un mecanismo interno que hace que su cola se mueva y suena con diferentes melodías, manteniendo a tu mascota entretenida y activa. Hecha de materiales resistentes y seguros, este juguete es ideal para fomentar el ejercicio y el juego interactivo. ¡Asegúrate de que tu mascota tenga su propia Poppy para una experiencia de juego divertida y estimulante!\r\n',13,50000,'uploads/img/producto/pero_1725010815942.jpg','http://localhost:4000/uploads/img/producto/pero_1725010815942.jpg',5,29),(31,'Muñeca Baby Alive Bebidas de Frutas Manzana 30 cm','¡Descubre la magia de la Muñeca Baby Alive Bebidas de Frutas Manzana de 30 cm! Esta encantadora muñeca está lista para jugar y simular la hora del té con su botella de jugo de manzana y su funcionalidad de bebida. Con una apariencia realista y una actitud adorable, Baby Alive puede \"beber\" su jugo y tener una experiencia interactiva que encantará a los más pequeños. Perfecta para juegos de simulación y cuidado, esta muñeca fomenta la imaginación y el juego creativo.\r\n',0,85000,'uploads/img/producto/MUÃECA_1725011017473.jpg','http://localhost:4000/uploads/img/producto/MUÃECA_1725011017473.jpg',5,29),(32,'Set City Ultimate Garage','¡Prepárate para una aventura emocionante con el Set City Ultimate Garage! Este impresionante set de garaje de la ciudad ofrece un mundo de diversión con múltiples niveles, estaciones de servicio, y una pista de carreras increíble. Equipado con rampas, ascensores y varios accesorios, el Ultimate Garage permite a los niños crear sus propias historias de acción y aventura mientras juegan con sus coches y camiones favoritos. Ideal para fomentar la creatividad y el juego interactivo, este set es perfecto para pequeños entusiastas de los vehículos y constructores en ciernes.\r\n',13,250000,'uploads/img/producto/CARROS_1725011075634.jpg','http://localhost:4000/uploads/img/producto/CARROS_1725011075634.jpg',5,29),(33,'Juego Laboratorio de Ciencia - Clementoni','¡Explora el fascinante mundo de la ciencia con el Juego Laboratorio de Ciencia - Clementoni! Este completo set ofrece a los jóvenes científicos una variedad de experimentos y actividades educativas que estimulan la curiosidad y el aprendizaje. Incluye herramientas y materiales seguros para realizar experimentos como mezclas químicas, reacciones y proyectos divertidos. Con instrucciones claras y fáciles de seguir, el laboratorio permite a los niños desarrollar habilidades científicas mientras se divierten descubriendo los secretos de la ciencia. Ideal para fomentar el interés en la investigación y la experimentación desde una edad temprana.\r\n',50,120000,'uploads/img/producto/Imagen de WhatsApp 2024-08-30 a las 02_1725011157776.jpg','http://localhost:4000/uploads/img/producto/Imagen de WhatsApp 2024-08-30 a las 02_1725011157776.jpg',5,29),(34,' Figura Spawn Mortal Kombat 11 Articulada de 18 cm','¡Añade a tu colección la increíble Figura Spawn Mortal Kombat 11! Esta figura articulada de 18 cm captura la esencia del icónico personaje de Mortal Kombat con un nivel impresionante de detalle. Diseñada con múltiples puntos de articulación, permite poseer y exhibir a Spawn en una variedad de posiciones dinámicas. Incluye accesorios exclusivos que realzan su apariencia, como su capa característica y armas emblemáticas, para una experiencia de colección completa. Perfecta para fanáticos y coleccionistas de Mortal Kombat, esta figura es una pieza imprescindible para cualquier estante de figuras.\r\n',7,150000,'uploads/img/producto/FIGUA_1725011242330.jpg','http://localhost:4000/uploads/img/producto/FIGUA_1725011242330.jpg',5,29),(35,' Star Wars The Child Baby Yoda The Mandalorian con','¡Sumérgete en el universo de Star Wars con la adorable figura de Baby Yoda de The Mandalorian! Este detallado juguete de 12 pulgadas captura la ternura y el encanto del icónico personaje con una alta calidad de acabado. Incluye 4 accesorios exclusivos que permiten recrear momentos memorables de la serie, como su manta y su cúpula de transporte. Con una construcción robusta y detalles precisos, esta figura es perfecta para coleccionistas y fanáticos de todas las edades. ¡No te pierdas la oportunidad de tener a este pequeño y querido personaje en tu colección!\r\n',456,120000,'uploads/img/producto/BABY_1725011334387.jpg','http://localhost:4000/uploads/img/producto/BABY_1725011334387.jpg',5,29),(36,'Figura de Acción Buzz Lightyear | Soriana','\r\n¡Haz que la aventura despegue con la Figura de Acción Buzz Lightyear! Basada en el querido personaje de Toy Story, esta figura de acción presenta a Buzz Lightyear en toda su gloria espacial con detalles auténticos y accesorios interactivos. Con una altura aproximada de 15 cm, Buzz está equipado con alas extensibles, un casco removible y una variedad de articulaciones que permiten múltiples poses y movimientos. Ideal para recrear emocionantes escenas del espacio o para exhibir en tu colección, esta figura captura la esencia del intrépido guardián estelar. Perfecta para fans de todas las edades.\r\n',-1,75000,'uploads/img/producto/BUZZ_1725011717323.jpg','http://localhost:4000/uploads/img/producto/BUZZ_1725011717323.jpg',5,29),(38,'martillo','Martilla',23,450000,'uploads/img/producto/descarga (1)_1729786402154.jpeg','http://localhost:4000/uploads/img/producto/descarga (1)_1729786402154.jpeg',NULL,31),(39,'alicates','largo uso',30,30000,'uploads/img/producto/descarga_1729786434168.jpeg','http://localhost:4000/uploads/img/producto/descarga_1729786434168.jpeg',NULL,31),(40,'par destorinilladores','vida media',22,30000,'uploads/img/producto/descarga (2)_1729786473096.jpeg','http://localhost:4000/uploads/img/producto/descarga (2)_1729786473096.jpeg',NULL,31),(41,'talador','alambrico',15,650000,'uploads/img/producto/descarga (3)_1729786497681.jpeg','http://localhost:4000/uploads/img/producto/descarga (3)_1729786497681.jpeg',NULL,31),(42,'Sofa Cama','color Gris',12,1000000,'uploads/img/producto/descarga (4)_1729786611681.jpeg','http://localhost:4000/uploads/img/producto/descarga (4)_1729786611681.jpeg',NULL,32),(43,'Cama','Larga duracion',40,2000000,'uploads/img/producto/descarga (5)_1729786650616.jpeg','http://localhost:4000/uploads/img/producto/descarga (5)_1729786650616.jpeg',NULL,32),(44,'Sillon','Reclinable',60,600000,'uploads/img/producto/descarga (6)_1729786673249.jpeg','http://localhost:4000/uploads/img/producto/descarga (6)_1729786673249.jpeg',NULL,32),(45,'Mesa','50 x 80',78,450000,'uploads/img/producto/descarga (7)_1729786705632.jpeg','http://localhost:4000/uploads/img/producto/descarga (7)_1729786705632.jpeg',NULL,32);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_detallecarrito_stock
AFTER UPDATE ON producto
FOR EACH ROW
BEGIN
    -- Verifica si el stock ha cambiado
    IF OLD.StockProducto != NEW.StockProducto THEN
        -- Actualiza las cantidades en detallecarrito
        UPDATE detallecarrito
        SET Cantidad = NEW.StockProducto
        WHERE IdProductoFK = NEW.IdProducto AND Cantidad > NEW.StockProducto;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `promedio_calificacion_tienda`
--

DROP TABLE IF EXISTS `promedio_calificacion_tienda`;
/*!50001 DROP VIEW IF EXISTS `promedio_calificacion_tienda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `promedio_calificacion_tienda` AS SELECT 
 1 AS `IdTienda`,
 1 AS `NombreTienda`,
 1 AS `MiniaturaTiendaURL`,
 1 AS `DescripcionTienda`,
 1 AS `PromedioCalificacion`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (27,'Dirección: Calle 72 #15-20, Oficina 203','2024-08-30 08:50:29','Moda Única',0.0,'Pereira','Ubicada en Calle 72 #15-20, Oficina 203, Moda Única es tu destino para ropa y accesorios exclusivos. Ofrecemos una selección única de prendas que combinan tendencias actuales con un toque personal. Ven y descubre cómo encontrar el estilo que te hace destacar.',1,'./uploads/img/tienda_miniatura/modaunica_1725007829671.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/modaunica_1725007829671.jpg','./uploads/img/tienda_banner/modaunica1_1725007829676.jpg','http://localhost:4000/./uploads/img/tienda_banner/modaunica1_1725007829676.jpg',1,10),(28,'Dirección: Carrera 65 #14-20, Local 5','2024-08-30 08:51:41','Burgers Expressss',0.0,'Medellín','Ubicado en Carrera 65 #14-20, Local 5, Burgers Express es tu lugar para disfrutar de hamburguesas deliciosas y rápidas. Con una oferta que abarca desde las clásicas hasta las más innovadoras, cada bocado está preparado con ingredientes frescos y de alta calidad. Ideal para una comida rápida o una cena informal, nuestro ambiente acogedor y servicio ágil garantizan una experiencia satisfactoria. Ven a Burgers Express y saborea la mejor hamburguesa de la ciudad.',1,'./uploads/img/tienda_miniatura/burger_1725007901215.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/burger_1725007901215.jpg','./uploads/img/tienda_banner/burger1_1725007901216.jpg','http://localhost:4000/./uploads/img/tienda_banner/burger1_1725007901216.jpg',3,10),(29,'Dirección: Calle 45 #12-34, Local 2A','2024-08-30 08:52:23','Addi ',0.0,'Bogota','Ubicado en Calle 45 #12-34, Local 2A, Addi es tu tienda de juguetes ideal en Bogotá. Ofrecemos una amplia gama de juguetes para todas las edades, desde los más clásicos hasta las últimas novedades del mercado. Nuestro compromiso es proporcionar productos de alta calidad que fomenten la creatividad y el desarrollo infantil. En Addi, encontrarás un ambiente divertido y acogedor, perfecto para encontrar el regalo perfecto o simplemente disfrutar de una experiencia de compra única',1,'./uploads/img/tienda_miniatura/addi_1725007943072.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/addi_1725007943072.jpg','./uploads/img/tienda_banner/addi1_1725007943074.jpg','http://localhost:4000/./uploads/img/tienda_banner/addi1_1725007943074.jpg',5,10),(30,'Dirección: Calle 56 #22-10, Local 3','2024-08-30 08:53:07','adeptus creaticus show center',0.0,'Cali','Ubicado en Calle 56 #22-10, Local 3, Adeptus Creaticus Show Center es el lugar ideal para los entusiastas de los juegos y el entretenimiento. Especializados en ofrecer una experiencia única, nuestro centro presenta una variedad de actividades y eventos relacionados con la cultura geek, incluyendo exposiciones, torneos y presentaciones en vivo. Con un ambiente vibrante y acogedor, Adeptus Creaticus se dedica a proporcionar un espacio donde los aficionados puedan disfrutar de sus pasatiempos favoritos y conectar con otros entusiastas. Ven y únete a la diversión en Adeptus Creaticus Show Center.',1,'./uploads/img/tienda_miniatura/adeptus_1725007987434.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/adeptus_1725007987434.jpg','./uploads/img/tienda_banner/adeptus1_1725007987437.jpg','http://localhost:4000/./uploads/img/tienda_banner/adeptus1_1725007987437.jpg',5,10),(31,'Dirección: Carrera 34 #15-27, Local 1B','2024-08-30 08:54:26','tool herramientas',0.0,'Barranquilla','Ubicado en Carrera 34 #15-27, Local 1B, Tool Herramientas es tu proveedor confiable de herramientas y equipos en Medellín. Ofrecemos una amplia gama de herramientas manuales y eléctricas de alta calidad, ideales para profesionales y aficionados al bricolaje. Nuestro compromiso es brindar productos duraderos y un servicio al cliente excepcional. Ya sea que necesites herramientas para proyectos domésticos o industriales, en Tool Herramientas encontrarás lo que buscas. Visítanos y descubre nuestra oferta.',1,'./uploads/img/tienda_miniatura/tools_1725008066277.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/tools_1725008066277.jpg','./uploads/img/tienda_banner/tools1_1725008066279.jpg','http://localhost:4000/./uploads/img/tienda_banner/tools1_1725008066279.jpg',3,10),(32,'Dirección: Calle 10 #5-43, Local 2','2024-08-30 08:55:04','soft furnishing',0.0,'Bucaramanga','Ubicado en Calle 10 #5-43, Local 2, Soft Furnishing es tu destino para artículos de decoración y textiles para el hogar en Bogotá. Especializados en cortinas, cojines, alfombras y otros accesorios que aportan confort y estilo a tus espacios, ofrecemos productos de alta calidad y diseño. Nuestro equipo está dedicado a ayudarte a encontrar las soluciones perfectas para embellecer tu hogar con elegancia y funcionalidad.',1,'./uploads/img/tienda_miniatura/sofa_1725008104087.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/sofa_1725008104087.jpg','./uploads/img/tienda_banner/sofa1_1725008104102.jpg','http://localhost:4000/./uploads/img/tienda_banner/sofa1_1725008104102.jpg',3,10),(33,'Dirección: Carrera 50 #10-65, Local 7','2024-08-30 08:56:07','PetHaven',0.0,'Manizales','Ubicado en Carrera 50 #10-65, Local 7, PetHaven es tu tienda especializada en productos y servicios para mascotas en Bogotá. Ofrecemos una amplia gama de alimentos, juguetes, accesorios y productos de cuidado para perros, gatos y otras mascotas. Nuestro objetivo es proporcionar a tus compañeros peludos lo mejor en calidad y confort, con un servicio amable y experto que te ayudará a encontrar todo lo que necesitas para el bienestar de tus animales. Visítanos y descubre cómo podemos mejorar la vida de tus mascotas.',1,'./uploads/img/tienda_miniatura/perito_1725008167600.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/perito_1725008167600.jpg','./uploads/img/tienda_banner/perito1_1725008167602.jpg','http://localhost:4000/./uploads/img/tienda_banner/perito1_1725008167602.jpg',3,10),(34,'Dirección: Calle 68 #18-40, Local','2024-08-30 08:57:01','almacen macrodent',0.0,'Bucaramanga','Ubicado en Calle 68 #18-40, Local 5, Almacén Macrodent en Bogotá es tu tienda especializada en productos dentales y de cuidado oral. Ofrecemos una amplia gama de suministros dentales, equipos y accesorios de alta calidad para profesionales del sector y para el cuidado personal. Nuestro objetivo es proporcionar productos confiables que apoyen la salud dental y oral. Visítanos para encontrar todo lo que necesitas para mantener sonrisas saludables.',1,'./uploads/img/tienda_miniatura/alma_1725008221586.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/alma_1725008221586.jpg','./uploads/img/tienda_banner/alma1_1725008221587.jpg','http://localhost:4000/./uploads/img/tienda_banner/alma1_1725008221587.jpg',6,10),(35,'Dirección: Calle 63 #12-18, Oficina 201','2024-08-30 08:57:56','Sonrisa Perfecta',0.0,'Santa Marta','Ubicado en Calle 63 #12-18, Oficina 201, Sonrisa Perfecta en Bogotá es tu clínica dental especializada en proporcionar tratamientos y servicios para lograr una sonrisa saludable y estética. Ofrecemos una gama completa de servicios dentales, desde limpiezas y blanqueamientos hasta ortodoncia y tratamientos reconstructivos. Nuestro equipo de profesionales está dedicado a ofrecer cuidados personalizados para mejorar tu salud bucal y lograr resultados excepcionales.',1,'./uploads/img/tienda_miniatura/diente_1725008276132.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/diente_1725008276132.jpg','./uploads/img/tienda_banner/diente1_1725008276134.jpg','http://localhost:4000/./uploads/img/tienda_banner/diente1_1725008276134.jpg',6,10),(36,'Dirección: Calle 45 #8-30, Local 1','2024-08-30 08:59:19','suchi bar',0.0,'Quibdó','Ubicado en Calle 45 #8-30, Local 1, Suchi Bar en Bogotá es el lugar perfecto para disfrutar de sushi fresco y deliciosos platos de la cocina japonesa. Ofrecemos una amplia variedad de rollos, sashimi y nigiri, preparados con ingredientes de alta calidad en un ambiente acogedor y moderno. Nuestro menú está diseñado para satisfacer todos los gustos, desde los más tradicionales hasta las combinaciones más innovadoras. Ven y vive una experiencia culinaria única en Suchi Bar.',1,'./uploads/img/tienda_miniatura/sushi1_1725008359945.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/sushi1_1725008359945.jpg','./uploads/img/tienda_banner/sushi_1725008359948.jpg','http://localhost:4000/./uploads/img/tienda_banner/sushi_1725008359948.jpg',3,10),(37,'Dirección: Carrera 34 #22-45, Local 3B','2024-08-30 09:00:08','PixelPlay',0.0,'Ibagué','Ubicado en Carrera 34 #22-45, Local 3B, PixelPlay en Ibagué es tu destino para todo lo relacionado con videojuegos y tecnología. Ofrecemos una amplia gama de consolas, juegos, accesorios y productos de entretenimiento digital en un entorno moderno y emocionante. Ya sea que busques lo último en videojuegos o necesitas asesoramiento sobre tecnología, nuestro equipo está aquí para ayudarte a encontrar lo que necesitas para disfrutar al máximo de tus pasatiempos favoritos.',1,'./uploads/img/tienda_miniatura/juegos_1725008408026.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/juegos_1725008408026.jpg','./uploads/img/tienda_banner/juegos1_1725008408028.jpg','http://localhost:4000/./uploads/img/tienda_banner/juegos1_1725008408028.jpg',5,10),(38,'Dirección: Calle 55 #18-20, Local 3','2024-08-30 09:00:49','Tacos El Rey',0.0,'Cúcuta','Ubicado en Calle 55 #18-20, Local 3, Tacos El Rey en Cúcuta es el lugar perfecto para disfrutar de auténticos tacos mexicanos. Ofrecemos una deliciosa variedad de tacos, desde los tradicionales hasta nuestras especialidades exclusivas, preparados con ingredientes frescos y sabrosos. Ven y prueba nuestros tacos en un ambiente amigable y acogedor, donde cada bocado te transportará al corazón de México.',1,'./uploads/img/tienda_miniatura/tacos_1725008449379.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/tacos_1725008449379.jpg','./uploads/img/tienda_banner/taco1_1725008449381.jpg','http://localhost:4000/./uploads/img/tienda_banner/taco1_1725008449381.jpg',3,10),(39,'Dirección: Calle 42 #15-20, Local 1','2024-08-30 09:01:39','Barbería El Clásico',0.0,'Pereira','Ubicada en Calle 42 #15-20, Local 1, Barbería El Clásico en Pereira es el lugar ideal para obtener cortes de cabello y arreglos de barba con un toque tradicional y profesional. Ofrecemos un ambiente relajado y un servicio personalizado para cada cliente, asegurando que cada visita sea una experiencia de cuidado personal única. Ven y disfruta de nuestro servicio de barbería de calidad, donde la tradición y la moda se encuentran',1,'./uploads/img/tienda_miniatura/barba_1725008499858.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/barba_1725008499858.jpg','./uploads/img/tienda_banner/barba1_1725008499859.jpg','http://localhost:4000/./uploads/img/tienda_banner/barba1_1725008499859.jpg',3,10),(40,'Dirección: Carrera 20 #8-55, Local','2024-08-30 09:02:20','Pollo Real',0.0,'Bucaramanga','Ubicado en Carrera 20 #8-55, Local 4, Pollo Real en Bucaramanga es tu destino para disfrutar del mejor pollo a la brasa de la ciudad. Ofrecemos una variedad de platos con pollo jugoso y bien sazonado, acompañado de guarniciones frescas y deliciosas. Nuestro compromiso es brindar una experiencia gastronómica excepcional en un ambiente acogedor y familiar. Ven y descubre por qué Pollo Real es el rey del pollo a la brasa en Bucaramanga.',1,'./uploads/img/tienda_miniatura/pollo_1725008540150.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/pollo_1725008540150.jpg','./uploads/img/tienda_banner/pollo1_1725008540152.jpg','http://localhost:4000/./uploads/img/tienda_banner/pollo1_1725008540152.jpg',3,10),(41,'Dirección: Calle 45 #8-22, Local 3','2024-08-30 09:02:56','Hamburguesas La Roca',0.0,'Neiva','Ubicado en Calle 45 #8-22, Local 3, Hamburguesas La Roca en Neiva es el lugar perfecto para disfrutar de hamburguesas jugosas y sabrosas. Ofrecemos una amplia variedad de hamburguesas gourmet, preparadas con ingredientes frescos y de alta calidad. Desde opciones clásicas hasta creaciones innovadoras, nuestro menú está diseñado para satisfacer todos los gustos. Ven a Hamburguesas La Roca y experimenta el auténtico sabor de una hamburguesa bien hecha en un ambiente cómodo y amigable.',1,'./uploads/img/tienda_miniatura/roca_1725008576424.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/roca_1725008576424.jpg','./uploads/img/tienda_banner/roca1_1725008576426.jpg','http://localhost:4000/./uploads/img/tienda_banner/roca1_1725008576426.jpg',3,10),(42,'Dirección: Calle 72 #15-30, Bogotá, Colombia','2024-08-30 09:11:13','Urban Style',0.0,'Bogotá','Ubicada en el corazón de Bogotá, Urban Style es la tienda de moda masculina que redefine el estilo urbano. Ofrecemos una selección cuidadosamente curada de ropa y accesorios modernos, pensados para el hombre actual que busca destacar en cualquier entorno. Con un enfoque en calidad y tendencias, aquí encontrarás desde piezas básicas hasta las más vanguardistas, todo bajo un mismo techo.\r\n',1,'./uploads/img/tienda_miniatura/mens_1725009073581.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/mens_1725009073581.jpg','./uploads/img/tienda_banner/mens1_1725009073589.jpg','http://localhost:4000/./uploads/img/tienda_banner/mens1_1725009073589.jpg',1,10),(43,'Carrera 52 #44-30','2024-08-30 09:12:29','ElectroCity',0.0,'Medellín','En ElectroCity, ubicada en el vibrante centro de Medellín, encontrarás la mejor selección de electrodomésticos para tu hogar. Ofrecemos una amplia gama de productos de alta calidad, desde neveras y lavadoras hasta pequeños electrodomésticos que facilitan tu vida diaria. Nuestro compromiso es brindarte tecnología de vanguardia a precios competitivos, con un servicio al cliente excepcional.\r\n',1,'./uploads/img/tienda_miniatura/electro_1725009149102.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/electro_1725009149102.jpg','./uploads/img/tienda_banner/elctro1_1725009149105.jpg','http://localhost:4000/./uploads/img/tienda_banner/elctro1_1725009149105.jpg',2,10),(44,'Avenida 6 Norte #23-45','2024-08-30 09:13:31','Fénix Deportes',0.0,'Cali','es tu destino principal para equiparte y estar siempre en movimiento. Situada en la dinámica ciudad de Cali, ofrecemos una extensa variedad de ropa, calzado, y accesorios deportivos de las mejores marcas. Ya sea que practiques running, fútbol, o fitness, en Fénix Deportes encontrarás todo lo necesario para alcanzar tus metas y rendir al máximo. Nuestro equipo está listo para asesorarte y ayudarte a encontrar el equipo perfecto para tu deporte favorito.\r\n',1,'./uploads/img/tienda_miniatura/fenix_1725009211073.jpg','http://localhost:4000/./uploads/img/tienda_miniatura/fenix_1725009211073.jpg','./uploads/img/tienda_banner/fenix1_1725009211075.jpg','http://localhost:4000/./uploads/img/tienda_banner/fenix1_1725009211075.jpg',4,10);
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top4productos`
--

DROP TABLE IF EXISTS `top4productos`;
/*!50001 DROP VIEW IF EXISTS `top4productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top4productos` AS SELECT 
 1 AS `IdProducto`,
 1 AS `NombreProducto`,
 1 AS `DescripcionProducto`,
 1 AS `FotoProducto`,
 1 AS `FotoProductoURL`,
 1 AS `PromedioCalificacion`,
 1 AS `PrecioProducto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top4tiendas`
--

DROP TABLE IF EXISTS `top4tiendas`;
/*!50001 DROP VIEW IF EXISTS `top4tiendas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top4tiendas` AS SELECT 
 1 AS `IdTienda`,
 1 AS `NombreTienda`,
 1 AS `PromedioCalificacion`,
 1 AS `MiniaturaTiendaURL`,
 1 AS `DescripcionTienda`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vertienda`
--

DROP TABLE IF EXISTS `vertienda`;
/*!50001 DROP VIEW IF EXISTS `vertienda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vertienda` AS SELECT 
 1 AS `IdTienda`,
 1 AS `DireccionTienda`,
 1 AS `FechaAperturaTienda`,
 1 AS `NombreTienda`,
 1 AS `CalificacionTienda`,
 1 AS `CiudadTienda`,
 1 AS `DescripcionTienda`,
 1 AS `EstadoTienda`,
 1 AS `MiniaturaTienda`,
 1 AS `MiniaturaTiendaURL`,
 1 AS `BannerTienda`,
 1 AS `BannerTiendaURL`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'platea'
--

--
-- Dumping routines for database 'platea'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCantidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCantidad`(
    IN p_IdPersona INT,
    IN p_IdProducto INT,
    IN p_NuevaCantidad INT
)
BEGIN
	DECLARE Id INT;
    
    -- Verifica si el usuario ya tiene un carrito
    SELECT IdCarrito INTO Id
    FROM carrito
    WHERE IdPersonaFK = p_IdPersona
    ORDER BY fecha_creacion DESC
    LIMIT 1;

    UPDATE detallecarrito
    SET Cantidad = p_NuevaCantidad
    WHERE IdCarritoFK = Id AND IdProductoFK = p_IdProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarStockProductoPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStockProductoPedido`(IN p_IdPedido INT)
BEGIN
    -- Declarar variables para el producto y cantidad
    DECLARE v_IdProducto INT;
    DECLARE v_Cantidad INT;
    DECLARE done INT DEFAULT 0;

    -- Declarar el cursor para obtener todos los productos y cantidades del pedido
    DECLARE cur CURSOR FOR 
    SELECT p.IdProducto, dc.Cantidad
    FROM detallecarrito dc
    JOIN producto p ON dc.IdProductoFK = p.IdProducto
    JOIN carrito c ON c.IdCarrito = dc.IdCarritoFK
    WHERE c.IdCarrito = p_IdPedido;

    -- Declarar un manejador para el final de los datos del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Abrir el cursor
    OPEN cur;

    -- Loop para leer cada producto y actualizar su stock
    leer_loop: LOOP
        -- Obtener el producto y la cantidad
        FETCH cur INTO v_IdProducto, v_Cantidad;

        -- Si no hay más filas, salir del loop
        IF done THEN
            LEAVE leer_loop;
        END IF;

        -- Actualizar el stock del producto restando la cantidad del pedido
        UPDATE producto 
        SET StockProducto = StockProducto - v_Cantidad
        WHERE IdProducto = v_IdProducto;
    END LOOP;

    -- Cerrar el cursor
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AgregarProductoCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarProductoCarrito`(IN usuario_Id INT, IN producto_id INT)
BEGIN
    DECLARE IdCar INT;
    DECLARE Id INT;

    -- Verifica si el usuario ya tiene un carrito
    SELECT IdCarrito INTO IdCar
    FROM carrito
    WHERE IdPersonaFK = usuario_Id
    ORDER BY fecha_creacion DESC
    LIMIT 1;

    -- Si no hay carrito, crea uno nuevo (esto debe estar en un bloque adicional, si es necesario).

    -- Verifica si el producto ya está en el carrito del usuario
    SELECT IdDetalleCarrito INTO Id
    FROM detallecarrito
    WHERE IdCarritoFK = IdCar AND IdProductoFK = producto_id
    LIMIT 1;

    -- Si el producto no está en el carrito, lo inserta; de lo contrario, devuelve un mensaje
    IF Id IS NULL THEN
        INSERT INTO detallecarrito (IdCarritoFK, IdProductoFK) 
        VALUES (IdCar, producto_id);
    ELSE
        SELECT 'Producto ya añadido' AS Mensaje;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CLAVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CLAVE`(IN _correo text, IN CLAVE_SECRETA TEXT)
BEGIN
	SELECT cast(aes_decrypt(ClavePersona, CLAVE_SECRETA)as char) FROM persona WHERE CorreoPersona = _correo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearComentario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearComentario`(
	in A_ComentarioAprobacion text,
    in A_CalificacionAprobacion DECIMAL(2,1),
    in A_IdPersonaFK int,
    in A_IdProductoFK int

)
begin
	insert into Aprobacion (ComentarioAprobacion, CalificacionAprobacion, IdPersonaFK, IdProductoFK)values
    (A_ComentarioAprobacion,A_CalificacionAprobacion,A_IdPersonaFK,A_IdProductoFK);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CrearPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearPedido`(
    IN p_IdPersonaFK INT,
    IN p_Direccion varchar(240),
    IN p_Ciudad INT

)
BEGIN

	insert into direccion (Direccion)
    values (p_Direccion);

    INSERT INTO Pedido (IdPersonaFK, IdDireccionFK,IdCiudadFK , Total)
    VALUES (p_IdPersonaFK, LAST_INSERT_ID(), p_Ciudad, 0);
    
    -- Retornar el ID del pedido recién creado
    SELECT LAST_INSERT_ID() AS IdPedidoCreado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CrearTienda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `EliminarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProducto`(
    IN Id INT
)
BEGIN

    DELETE FROM detallecarrito
    WHERE IdDetalleCarrito = Id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProductoById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProductoById`(IN p_IdProducto INT)
BEGIN
    SELECT 
        p.IdProducto, 
        p.NombreProducto, 
        p.DescripcionProducto, 
        p.FotoProducto, 
        p.FotoProductoURL, 
        COALESCE(AVG(a.CalificacionAprobacion), 0) AS PromedioCalificacion, 
        p.PrecioProducto,
        p.IdCategoriaFK,
        p.IdTiendaFK
    FROM 
        producto p
    LEFT JOIN 
        aprobacion a ON p.IdProducto = a.IdProductoFK
    WHERE 
        p.IdProducto = p_IdProducto
    GROUP BY
        p.IdProducto, 
        p.NombreProducto, 
        p.DescripcionProducto, 
        p.FotoProducto, 
        p.FotoProductoURL, 
        p.PrecioProducto,
        p.IdCategoriaFK,
        p.IdTiendaFK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MigrarCarritoAPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MigrarCarritoAPedido`(IN p_IdPersona INT, IN p_IdPedido INT)
BEGIN

	DECLARE Id INT;
    DECLARE total INT;
    
    -- Verifica si el usuario ya tiene un carrito
    SELECT IdCarrito INTO Id
    FROM carrito
    WHERE IdPersonaFK = p_IdPersona
    ORDER BY fecha_creacion DESC
    LIMIT 1;
    -- Insertar todos los productos del carrito a la tabla pedidoproducto
    INSERT IGNORE  INTO pedidoproducto (IdPedidoFK, IdProductoFK, Cantidad)
    SELECT p_IdPedido, dc.IdProductoFK, dc.Cantidad
    FROM detallecarrito dc
    WHERE dc.IdCarritoFK = Id;
	
    SELECT SUM(p.PrecioProducto * dc.Cantidad) AS Total
    FROM detallecarrito dc
    INNER JOIN producto p ON p.IdProducto = dc.IdProductoFK
    WHERE dc.IdCarritoFK = Id ;
    -- Opcional: después de migrar, puedes eliminar los productos del carrito si lo deseas
    -- DELETE FROM detallecarrito WHERE IdCarritoFK = p_IdCarrito;

    -- También podrías eliminar el carrito si lo deseas
    -- DELETE FROM carrito WHERE IdCarrito = p_IdCarrito;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Mostrarcomentarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrarcomentarios`(IN productoId INT)
BEGIN
    SELECT 
        p.NombrePersona,          -- Nombre de la persona que hizo el comentario
        a.FechaAprobacion,        -- Fecha en que el comentario fue hecho
        a.ComentarioAprobacion,   -- Texto del comentario
        p.FotoPersonaURL, 
        a.CalificacionAprobacion-- URL de la foto de perfil
    FROM Aprobacion a
    JOIN Persona p ON a.IdPersonaFK = p.IdPersona  -- Une la tabla Aprobacion con Persona para obtener el nombre de la persona y la foto
    WHERE a.IdProductoFK = productoId;  -- Filtra los comentarios para el producto específico
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `navbar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `navbar`(in usuario_Id INT)
BEGIN
	DECLARE Id INT;
	DECLARE num INT;
    
	SELECT IdCarrito INTO Id
    FROM carrito
    WHERE IdPersonaFK = usuario_Id
    ORDER BY fecha_creacion DESC
    LIMIT 1;

	SELECT COUNT(*) INTO num
    FROM detallecarrito dc
    JOIN carrito c ON c.IdCarrito = dc.IdCarritoFK
    WHERE c.IdCarrito = Id;

	SELECT FotoPersonaURL ,idRolFK, num from Persona where IdPersona = usuario_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nuevoStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevoStock`(IN p_IdProdcuto INT,in P_stock  int)
BEGIN
     Update Producto set StockProducto = P_stock where IdProducto = p_IdProdcuto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDireccionPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDireccionPersona`(IN p_IdPersona INT)
BEGIN
    SELECT DISTINCT  d.direccion
    FROM pedido p
    JOIN direccion d ON d.id = p.IdDireccionFK
    JOIN persona p2 ON p2.IdPersona = p.IdPersonaFK
    WHERE p2.IdPersona = p_IdPersona;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProductoPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductoPedido`(IN p_IdPedido INT)
BEGIN
    SELECT 
        p.IdProducto,
        p.StockProducto,
        p.FotoProductoURL,
        p.NombreProducto,
        p.PrecioProducto,
        pp.cantidad,
        a.IdArrendatario,
        pe.correoPersona, 
        t.NombreTienda
    FROM 
        pedidoproducto pp
    JOIN 
        producto p ON pp.IdProductoFK = p.IdProducto
    JOIN 
        pedido p2 ON p2.IdPedido = pp.IdPedidoFK
    JOIN 
        tienda t ON t.IdTienda = p.IdTiendaFK
    JOIN 
        arrendatario a ON a.IdArrendatario = t.IdArrendatarioFK
    JOIN 
        persona pe ON pe.IdPersona = a.IdPersonaFK 
    WHERE 
        p2.IdPedido = p_IdPedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProductosCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductosCarrito`(IN usuario_Id INT)
BEGIN
    DECLARE Id INT;
    
    -- Verifica si el usuario ya tiene un carrito
    SELECT IdCarrito INTO Id
    FROM carrito
    WHERE IdPersonaFK = usuario_Id
    ORDER BY fecha_creacion DESC
    LIMIT 1;

    -- Si no hay carrito, crea uno nuevo
    IF Id IS NULL THEN
        INSERT INTO Carrito (IdPersonaFK, fecha_creacion)
        VALUES (usuarioId, NOW());
        
        -- Obtén el ID del nuevo carrito
        SELECT LAST_INSERT_ID() INTO Id;
    END IF;

    -- Lista los productos del carrito
    SELECT dc.IdDetalleCarrito, p.IdProducto,p.StockProducto ,p.FotoProductoURL, p.NombreProducto, p.PrecioProducto , dc.cantidad, t.NombreTienda
    FROM detallecarrito dc
    JOIN producto p ON dc.IdProductoFK = p.IdProducto
    JOIN tienda t ON t.IdTienda = p.IdTiendaFK
    JOIN carrito c ON c.IdCarrito = dc.IdCarritoFK
    WHERE c.IdCarrito = Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProductosSimilares` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductosSimilares`(IN p_IdProducto INT)
BEGIN
    -- Declara una variable para almacenar la categoría del producto
    DECLARE v_IdCategoria INT;

    -- Obtiene la categoría del producto dado
    SELECT IdCategoriaFK INTO v_IdCategoria
    FROM producto
    WHERE IdProducto = p_IdProducto;

    -- Selecciona los productos que pertenecen a la misma categoría
    SELECT IdProducto, NombreProducto, DescripcionProducto, StockProducto, PrecioProducto, FotoProducto, FotoProductoURL
    FROM producto 
    WHERE IdCategoriaFK = v_IdCategoria
      AND IdProducto <> p_IdProducto;
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
        P.IdPersona = p_IdPersona;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pedidopersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pedidopersona`(IN _Id INT)
BEGIN
    SELECT 
        P.NumeroPedido,  -- Número del pedido
        P.IdPedido,      -- ID del pedido
        D.Direccion,     -- Dirección asociada al pedido
        P.FechaPedido,   -- Fecha del pedido
        P.EstadoPedido,  -- Estado del pedido
        P.Total,         -- Total del pedido
        GROUP_CONCAT(CONCAT(Pr.NombreProducto, ' (', PP.Cantidad, ')') SEPARATOR ', ') AS articulos  -- Productos del pedido con cantidad
    FROM 
        pedido P
    LEFT JOIN 
        pedidoproducto PP ON P.IdPedido = PP.IdPedidoFK
    LEFT JOIN 
        producto Pr ON PP.IdProductoFK = Pr.IdProducto
    LEFT JOIN 
        direccion D ON P.IdDireccionFK = D.id  -- Relación con la tabla dirección
    WHERE 
        P.IdPersonaFK = _Id
    GROUP BY 
        P.IdPedido;  -- Agrupamos por el ID del pedido
END ;;

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductoPedidoTienda`(in _IdTienda int, in _IdPedido int)
Begin
SELECT Pr.IdProducto, Pr.NombreProducto, PP.Cantidad,(PP.Cantidad * Pr.PrecioProducto) as Total
from Tienda AS T
Inner join Producto as Pr
ON  Pr.IdTiendaFK = T.IdTienda
inner join pedidoproducto as pp
on Pr.IdProducto = PP.IdProductoFK
inner join Pedido as Pe
on Pe.IdPedido = pp.IdPedidoFK
Where IdPedido = _IdPedido and IdTienda = _IdTienda;
end;;



CREATE DEFINER=`root`@`localhost` PROCEDURE `pedidosTienda`(IN _idTienda INT)
BEGIN
SELECT Pe.IdPedido,concat(P.NombrePersona," ",P.ApellidoPersona )AS Nombre,P.CorreoPersona,P.TelefonoPersona,D.Direccion, SUM(PP.cantidad) as Cantidad, Pe.FechaPedido
from Tienda AS T
Inner join Producto as Pr
ON  Pr.IdTiendaFK = T.IdTienda
inner join pedidoproducto as pp
on Pr.IdProducto = PP.IdProductoFK
inner join Pedido as Pe
on Pe.IdPedido = pp.IdPedidoFK
inner join Persona as P
on P.IdPersona = Pe.IdPersonaFK
inner join Direccion as D
on Pe.IdDireccionFK = D.id
Where IdTienda = _idTienda
Group by Pe.IdPedido;

END;;
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
    IN p_CorreoPersona VARCHAR(250),
    IN p_ClavePersona VARCHAR(255),
    IN p_TelefonoPersona INT,
    IN claveSecreta TEXT
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
        aes_encrypt(p_ClavePersona,claveSecreta),
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
/*!50003 DROP PROCEDURE IF EXISTS `UPDATEPASSWORD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATEPASSWORD`(
    IN __Gmail VARCHAR(250), 
    IN clavenueva VARCHAR(250), 
    IN claveultrasecreta VARCHAR(250)
)
BEGIN
    UPDATE persona
    SET ClavePersona = AES_ENCRYPT(clavenueva, claveultrasecreta)
    WHERE CorreoPersona = __Gmail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vaciarcarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `vaciarcarrito`(IN p_IdPersona INT)
BEGIN
    declare Id int;
    -- Verifica si el usuario ya tiene un carrito
    SELECT IdCarrito INTO Id
    FROM carrito
    WHERE IdPersonaFK = p_IdPersona
    ORDER BY fecha_creacion DESC
    LIMIT 1;
	
    delete from detallecarrito where IdCarritoFK = Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VerPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VerPedido`(
	in __idPedido INT
)
BEGIN
    SELECT * FROM platea.pedido where IdPedido = __idPedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verTienda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verTienda`(in tienda_Id INT)
BEGIN

	SELECT P.IdPersona, T.IdTienda, T.DireccionTienda, T.FechaAperturaTienda, 
    T.NombreTienda, T.CalificacionTienda, T.CiudadTienda, T.DescripcionTienda,
    T.EstadoTienda, T.MiniaturaTienda, T.MiniaturaTiendaURL, T.BannerTienda, 
    T.BannerTiendaURL, T.IdCategoriaFK, T.IdArrendatarioFK FROM tienda  T
    join arrendatario A on A.IdArrendatario = T.IdArrendatarioFK
    join persona P ON	P.IdPersona = A.IdPersonaFK
	WHERE T.IdTienda =tienda_Id
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verTiendaCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verTiendaCategoria`(in categoria_Id INT)
BEGIN

	SELECT T.* FROM tienda  T
    join categoria C on C.IdCategoria = T.IdCategoriaFK
	WHERE C.IdCategoria = categoria_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `belleza`
--

/*!50001 DROP VIEW IF EXISTS `belleza`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `belleza` AS select `t`.`IdTienda` AS `IdTienda`,`t`.`DireccionTienda` AS `DireccionTienda`,`t`.`FechaAperturaTienda` AS `FechaAperturaTienda`,`t`.`NombreTienda` AS `NombreTienda`,`t`.`CalificacionTienda` AS `CalificacionTienda`,`t`.`CiudadTienda` AS `CiudadTienda`,`t`.`DescripcionTienda` AS `DescripcionTienda`,`t`.`EstadoTienda` AS `EstadoTienda`,`t`.`MiniaturaTienda` AS `MiniaturaTienda`,`t`.`MiniaturaTiendaURL` AS `MiniaturaTiendaURL`,`t`.`BannerTienda` AS `BannerTienda`,`t`.`BannerTiendaURL` AS `BannerTiendaURL`,`t`.`IdCategoriaFK` AS `IdCategoriaFK`,`t`.`IdArrendatarioFK` AS `IdArrendatarioFK` from (`tienda` `t` join `categoria` `c` on(`t`.`IdCategoriaFK` = `c`.`IdCategoria`)) where `c`.`NombreCategoria` = 'Belleza' and `t`.`EstadoTienda` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `deportes`
--

/*!50001 DROP VIEW IF EXISTS `deportes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `deportes` AS select `t`.`IdTienda` AS `IdTienda`,`t`.`DireccionTienda` AS `DireccionTienda`,`t`.`FechaAperturaTienda` AS `FechaAperturaTienda`,`t`.`NombreTienda` AS `NombreTienda`,`t`.`CalificacionTienda` AS `CalificacionTienda`,`t`.`CiudadTienda` AS `CiudadTienda`,`t`.`DescripcionTienda` AS `DescripcionTienda`,`t`.`EstadoTienda` AS `EstadoTienda`,`t`.`MiniaturaTienda` AS `MiniaturaTienda`,`t`.`MiniaturaTiendaURL` AS `MiniaturaTiendaURL`,`t`.`BannerTienda` AS `BannerTienda`,`t`.`BannerTiendaURL` AS `BannerTiendaURL`,`t`.`IdCategoriaFK` AS `IdCategoriaFK`,`t`.`IdArrendatarioFK` AS `IdArrendatarioFK` from (`tienda` `t` join `categoria` `c` on(`t`.`IdCategoriaFK` = `c`.`IdCategoria`)) where `c`.`NombreCategoria` = 'Deportes' and `t`.`EstadoTienda` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `electrodomesticos`
--

/*!50001 DROP VIEW IF EXISTS `electrodomesticos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `electrodomesticos` AS select `t`.`IdTienda` AS `IdTienda`,`t`.`DireccionTienda` AS `DireccionTienda`,`t`.`FechaAperturaTienda` AS `FechaAperturaTienda`,`t`.`NombreTienda` AS `NombreTienda`,`t`.`CalificacionTienda` AS `CalificacionTienda`,`t`.`CiudadTienda` AS `CiudadTienda`,`t`.`DescripcionTienda` AS `DescripcionTienda`,`t`.`EstadoTienda` AS `EstadoTienda`,`t`.`MiniaturaTienda` AS `MiniaturaTienda`,`t`.`MiniaturaTiendaURL` AS `MiniaturaTiendaURL`,`t`.`BannerTienda` AS `BannerTienda`,`t`.`BannerTiendaURL` AS `BannerTiendaURL`,`t`.`IdCategoriaFK` AS `IdCategoriaFK`,`t`.`IdArrendatarioFK` AS `IdArrendatarioFK` from (`tienda` `t` join `categoria` `c` on(`t`.`IdCategoriaFK` = `c`.`IdCategoria`)) where `c`.`NombreCategoria` = 'Electrodomésticos' and `t`.`EstadoTienda` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hogar`
--

/*!50001 DROP VIEW IF EXISTS `hogar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hogar` AS select `t`.`IdTienda` AS `IdTienda`,`t`.`DireccionTienda` AS `DireccionTienda`,`t`.`FechaAperturaTienda` AS `FechaAperturaTienda`,`t`.`NombreTienda` AS `NombreTienda`,`t`.`CalificacionTienda` AS `CalificacionTienda`,`t`.`CiudadTienda` AS `CiudadTienda`,`t`.`DescripcionTienda` AS `DescripcionTienda`,`t`.`EstadoTienda` AS `EstadoTienda`,`t`.`MiniaturaTienda` AS `MiniaturaTienda`,`t`.`MiniaturaTiendaURL` AS `MiniaturaTiendaURL`,`t`.`BannerTienda` AS `BannerTienda`,`t`.`BannerTiendaURL` AS `BannerTiendaURL`,`t`.`IdCategoriaFK` AS `IdCategoriaFK`,`t`.`IdArrendatarioFK` AS `IdArrendatarioFK` from (`tienda` `t` join `categoria` `c` on(`t`.`IdCategoriaFK` = `c`.`IdCategoria`)) where `c`.`NombreCategoria` = 'Hogar' and `t`.`EstadoTienda` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `juguetes`
--

/*!50001 DROP VIEW IF EXISTS `juguetes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `juguetes` AS select `t`.`IdTienda` AS `IdTienda`,`t`.`DireccionTienda` AS `DireccionTienda`,`t`.`FechaAperturaTienda` AS `FechaAperturaTienda`,`t`.`NombreTienda` AS `NombreTienda`,`t`.`CalificacionTienda` AS `CalificacionTienda`,`t`.`CiudadTienda` AS `CiudadTienda`,`t`.`DescripcionTienda` AS `DescripcionTienda`,`t`.`EstadoTienda` AS `EstadoTienda`,`t`.`MiniaturaTienda` AS `MiniaturaTienda`,`t`.`MiniaturaTiendaURL` AS `MiniaturaTiendaURL`,`t`.`BannerTienda` AS `BannerTienda`,`t`.`BannerTiendaURL` AS `BannerTiendaURL`,`t`.`IdCategoriaFK` AS `IdCategoriaFK`,`t`.`IdArrendatarioFK` AS `IdArrendatarioFK` from (`tienda` `t` join `categoria` `c` on(`t`.`IdCategoriaFK` = `c`.`IdCategoria`)) where `c`.`NombreCategoria` = 'Juguetes' and `t`.`EstadoTienda` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `moda`
--

/*!50001 DROP VIEW IF EXISTS `moda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `moda` AS select `t`.`IdTienda` AS `IdTienda`,`t`.`DireccionTienda` AS `DireccionTienda`,`t`.`FechaAperturaTienda` AS `FechaAperturaTienda`,`t`.`NombreTienda` AS `NombreTienda`,`t`.`CalificacionTienda` AS `CalificacionTienda`,`t`.`CiudadTienda` AS `CiudadTienda`,`t`.`DescripcionTienda` AS `DescripcionTienda`,`t`.`EstadoTienda` AS `EstadoTienda`,`t`.`MiniaturaTienda` AS `MiniaturaTienda`,`t`.`MiniaturaTiendaURL` AS `MiniaturaTiendaURL`,`t`.`BannerTienda` AS `BannerTienda`,`t`.`BannerTiendaURL` AS `BannerTiendaURL`,`t`.`IdCategoriaFK` AS `IdCategoriaFK`,`t`.`IdArrendatarioFK` AS `IdArrendatarioFK` from (`tienda` `t` join `categoria` `c` on(`t`.`IdCategoriaFK` = `c`.`IdCategoria`)) where `c`.`NombreCategoria` = 'Moda' and `t`.`EstadoTienda` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `promedio_calificacion_tienda`
--

/*!50001 DROP VIEW IF EXISTS `promedio_calificacion_tienda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `promedio_calificacion_tienda` AS select `t`.`IdTienda` AS `IdTienda`,`t`.`NombreTienda` AS `NombreTienda`,`t`.`MiniaturaTiendaURL` AS `MiniaturaTiendaURL`,`t`.`DescripcionTienda` AS `DescripcionTienda`,avg(`a`.`CalificacionAprobacion`) AS `PromedioCalificacion` from ((`tienda` `t` join `producto` `p` on(`t`.`IdTienda` = `p`.`IdTiendaFK`)) join `aprobacion` `a` on(`p`.`IdProducto` = `a`.`IdProductoFK`)) group by `t`.`IdTienda`,`t`.`NombreTienda` order by avg(`a`.`CalificacionAprobacion`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top4productos`
--

/*!50001 DROP VIEW IF EXISTS `top4productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top4productos` AS select `p`.`IdProducto` AS `IdProducto`,`p`.`NombreProducto` AS `NombreProducto`,`p`.`DescripcionProducto` AS `DescripcionProducto`,`p`.`FotoProducto` AS `FotoProducto`,`p`.`FotoProductoURL` AS `FotoProductoURL`,avg(`a`.`CalificacionAprobacion`) AS `PromedioCalificacion`,`p`.`PrecioProducto` AS `PrecioProducto` from (`producto` `p` join `aprobacion` `a` on(`p`.`IdProducto` = `a`.`IdProductoFK`)) group by `p`.`IdProducto`,`p`.`NombreProducto`,`p`.`DescripcionProducto`,`p`.`FotoProducto`,`p`.`FotoProductoURL` order by avg(`a`.`CalificacionAprobacion`) desc limit 4 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top4tiendas`
--

/*!50001 DROP VIEW IF EXISTS `top4tiendas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top4tiendas` AS select `promedio_calificacion_tienda`.`IdTienda` AS `IdTienda`,`promedio_calificacion_tienda`.`NombreTienda` AS `NombreTienda`,`promedio_calificacion_tienda`.`PromedioCalificacion` AS `PromedioCalificacion`,`promedio_calificacion_tienda`.`MiniaturaTiendaURL` AS `MiniaturaTiendaURL`,`promedio_calificacion_tienda`.`DescripcionTienda` AS `DescripcionTienda` from `promedio_calificacion_tienda` order by `promedio_calificacion_tienda`.`PromedioCalificacion` desc limit 4 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vertienda`
--

/*!50001 DROP VIEW IF EXISTS `vertienda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vertienda` AS select `t`.`IdTienda` AS `IdTienda`,`t`.`DireccionTienda` AS `DireccionTienda`,`t`.`FechaAperturaTienda` AS `FechaAperturaTienda`,`t`.`NombreTienda` AS `NombreTienda`,`t`.`CalificacionTienda` AS `CalificacionTienda`,`t`.`CiudadTienda` AS `CiudadTienda`,`t`.`DescripcionTienda` AS `DescripcionTienda`,`t`.`EstadoTienda` AS `EstadoTienda`,`t`.`MiniaturaTienda` AS `MiniaturaTienda`,`t`.`MiniaturaTiendaURL` AS `MiniaturaTiendaURL`,`t`.`BannerTienda` AS `BannerTienda`,`t`.`BannerTiendaURL` AS `BannerTiendaURL` from `tienda` `t` where `t`.`EstadoTienda` = 1 */;
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

-- Dump completed on 2024-10-24 11:21:08
