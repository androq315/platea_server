-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
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
  `Aprobacion` int(11) NOT NULL AUTO_INCREMENT,
  `ComentarioAprobacion` text DEFAULT NULL,
  `CalificacionAprobacion` decimal(2,1) DEFAULT NULL,
  `FechaAprobacion` datetime DEFAULT current_timestamp(),
  `IdClienteFK` int(11) DEFAULT NULL,
  `IdProductoFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`Aprobacion`),
  KEY `FK_Cliente_Aprobacion` (`IdClienteFK`),
  KEY `FK_Producto_Calificacion` (`IdProductoFK`),
  CONSTRAINT `FK_Cliente_Aprobacion` FOREIGN KEY (`IdClienteFK`) REFERENCES `cliente` (`IdCliente`),
  CONSTRAINT `FK_Producto_Calificacion` FOREIGN KEY (`IdProductoFK`) REFERENCES `producto` (`IdProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprobacion`
--

LOCK TABLES `aprobacion` WRITE;
/*!40000 ALTER TABLE `aprobacion` DISABLE KEYS */;
INSERT INTO `aprobacion` VALUES (1,'Excelente producto',5.0,'2024-08-24 14:59:45',1,1),(2,'Muy buena calidad',4.5,'2024-08-24 14:59:45',2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrendatario`
--

LOCK TABLES `arrendatario` WRITE;
/*!40000 ALTER TABLE `arrendatario` DISABLE KEYS */;
INSERT INTO `arrendatario` VALUES (1,'2024-01-01 00:00:00','2024-12-31 23:59:59',NULL,1,1),(2,'2024-06-01 00:00:00',NULL,NULL,1,2);
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
  `IdClienteFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdCarrito`),
  KEY `FK_Cliente_Carrito` (`IdClienteFK`),
  CONSTRAINT `FK_Cliente_Carrito` FOREIGN KEY (`IdClienteFK`) REFERENCES `cliente` (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,1),(2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Electrónica','Productos relacionados con tecnología y gadgets'),(2,'Ropa','Prendas de vestir para todas las edades y géneros'),(3,'Hogar','Artículos y accesorios para el hogar y la cocina'),(4,'Deportes','Equipos y accesorios para diversas actividades deportivas');
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
INSERT INTO `cliente` VALUES (1,'Calle 123','Bogotá',1),(2,'Avenida 456','Medellín',2);
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
INSERT INTO `compra` VALUES (1,'2024-08-23 10:00:00',599.98,0,1),(2,'2024-08-23 11:00:00',29.99,1,2);
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
INSERT INTO `detallecarrito` VALUES (1,1,2),(2,2,1);
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
INSERT INTO `detallepago` VALUES (1,1,1,'Pago por compra de smartphone',599.98),(2,2,2,'Pago por compra de camisa',29.99);
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
INSERT INTO `favorito` VALUES (1,1,1,'2024-08-24 14:59:45'),(2,2,2,'2024-08-24 14:59:45');
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
INSERT INTO `inventario` VALUES (1,1,50),(2,2,100);
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
INSERT INTO `notificacion` VALUES (1,'Nueva promoción en tu tienda favorita','2024-08-24 14:59:45',0,1),(2,'Compra confirmada','2024-08-24 14:59:45',0,2);
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
INSERT INTO `pago` VALUES (1,599.98,'2024-08-24 14:59:45','Tarjeta de crédito'),(2,29.99,'2024-08-24 14:59:45','Efectivo');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Juan','Pérez','juan.perez@example.com','clave1',1,'3001234567','foto1.jpg','http://localhost:4000/fotos/foto1.jpg','banner1.jpg','http://localhost:4000/banners/banner1.jpg',1),(2,'Ana','García','ana.garcia@example.com','clave2',1,'3002345678','foto2.jpg','http://localhost:4000/fotos/foto2.jpg','banner2.jpg','http://localhost:4000/banners/banner2.jpg',2),(3,'alexix','mendivelso audor','wdawda@info.com','123123',0,'1213123','./uploads/img/persona_avatar/bd_1724532020611.png','./uploads/img/persona_avatar/bd_1724532020611.png','./uploads/img/banner/backiee-298776_1724532020613.jpg','./uploads/img/banner/backiee-298776_1724532020613.jpg',2),(6,'alexix','mendivelso audor','wdawdaaaaaa@info.com','123123',0,'1213123','./uploads/img/persona_avatar/bd_1724532522554.png','http://localhost:4000/./uploads/img/persona_avatar/bd_1724532522554.png','./uploads/img/banner/backiee-298776_1724532522555.jpg','http://localhost:4000/./uploads/img/banner/backiee-298776_1724532522555.jpg',2),(7,'andres','suarez','anuellAA@info.co','$2b$10$6wTLJaIUi0zkS40LdtHY2uIF3FTYCtv/o9yYJ2nDG.EDzuIwlsFFG',1,'123123123','./uploads/img/persona_avatar/jenny_1724641384086.jpeg','http://localhost:4000/./uploads/img/persona_avatar/jenny_1724641384086.jpeg',NULL,NULL,1),(8,'Andres','Meza','andresfmeza101@gmail.com','$2b$10$kbjPqN6aayJNVrbHCeUTX.2mD/EPZwwG.tUdpKLRwZdpUQoI9I6qu',1,'2147483647',NULL,NULL,NULL,NULL,3),(9,'Andres','audor','andresf@gmail.com','$2b$10$7qvkTGAGr39nysbhzo.C5udgF1paAfIC4CEuWLvMn4S2ud0cpT.le',1,'2147483647',NULL,NULL,NULL,NULL,3),(10,'anyi','mendivelso','anyi@info.com','$2b$10$j02Cqov.Rw1t0rUhvSn5purT7aVen1HHRK4TWDZku7uRvabAI4CYu',1,'2147483647',NULL,NULL,NULL,NULL,3),(11,'carlotos','martinez','carlos@info.com','$2b$10$aWotBdTPEmkJ.NPS4oiAA.DXpFGQstN3F2ocAHj0tArq9cZl8F/Pe',1,'3223424',NULL,NULL,NULL,NULL,3),(12,'danner carlos','martinez','dannercar@info.com','12345',1,'12342314342','./uploads/img/persona_avatar/a_1724635783455.jpg','http://localhost:4000/./uploads/img/persona_avatar/a_1724635783455.jpg',NULL,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'alexix','mendivelso audor',10,20.00,'uploads/img/producto/bd_1724531609232.png','http://localhost:4000/uploads/img/producto/bd_1724531609232.png',1,1),(2,'Camisa','Camisa de algodón para hombre',100,29.99,NULL,NULL,2,2),(3,'alexix','mendivelso',1,200.00,'uploads/img/producto/a_1724531299762.jpg','http://localhost:4000/uploads/img/producto/a_1724531299762.jpg',NULL,NULL),(5,'alexix','mendivelso',1,200.00,'uploads/img/producto/a_1724531536158.jpg','http://localhost:4000/uploads/img/producto/a_1724531536158.jpg',1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (1,'21eqwd','2024-08-24 14:59:45','fdawdaw',2.0,0,'./uploads/img/tienda_miniatura/50 Fondos para PC HD!!!   Taringa!_1724531223504.jpeg','http://localhost:4000/./uploads/img/tienda_miniatura/50 Fondos para PC HD!!!   Taringa!_1724531223504.jpeg','./uploads/img/tienda_banner/logo_1724531223505.jpg','http://localhost:4000/./uploads/img/tienda_banner/logo_1724531223505.jpg',1,1),(2,'Avenida 101','2024-08-24 14:59:45','RopaModa',4.2,1,NULL,NULL,NULL,NULL,2,2),(3,'21eqwd','2024-08-24 20:03:51','fdawdaw',2.0,1,'./uploads/img/tienda_miniatura/50 Fondos para PC HD!!!   Taringa!_1724529831938.jpeg','./uploads/img/tienda_miniatura/50 Fondos para PC HD!!!   Taringa!_1724529831938.jpeg','./uploads/img/tienda_banner/logo_1724529831940.jpg','./uploads/img/tienda_banner/logo_1724529831940.jpg',1,1),(4,'21eqwd','2024-08-24 20:09:24','fdawdaw',2.0,0,'./uploads/img/tienda_miniatura/50 Fondos para PC HD!!!   Taringa!_1724530774446.jpeg','http://localhost:4000/./uploads/img/tienda_miniatura/50 Fondos para PC HD!!!   Taringa!_1724530774446.jpeg','./uploads/img/tienda_banner/logo_1724530774448.jpg','http://localhost:4000/./uploads/img/tienda_banner/logo_1724530774448.jpg',1,1),(5,'21eqwd','2024-08-24 20:21:05','fdawdaw',2.0,0,'./uploads/img/tienda_miniatura/50 Fondos para PC HD!!!   Taringa!_1724530865875.jpeg','./uploads/img/tienda_miniatura/50 Fondos para PC HD!!!   Taringa!_1724530865875.jpeg','./uploads/img/tienda_banner/logo_1724530865876.jpg','./uploads/img/tienda_banner/logo_1724530865876.jpg',1,1),(6,'21eqwd','2024-08-24 20:26:15','fdawdaw',2.0,0,'./uploads/img/tienda_miniatura/50 Fondos para PC HD!!!   Taringa!_1724531175425.jpeg','http://localhost:4000/./uploads/img/tienda_miniatura/50 Fondos para PC HD!!!   Taringa!_1724531175425.jpeg','./uploads/img/tienda_banner/logo_1724531175427.jpg','http://localhost:4000/./uploads/img/tienda_banner/logo_1724531175427.jpg',1,1),(7,'21eqwd','2024-08-24 20:26:56','fdawdaw',2.0,0,'./uploads/img/tienda_miniatura/50 Fondos para PC HD!!!   Taringa!_1724531216468.jpeg','http://localhost:4000/./uploads/img/tienda_miniatura/50 Fondos para PC HD!!!   Taringa!_1724531216468.jpeg','./uploads/img/tienda_banner/logo_1724531216469.jpg','http://localhost:4000/./uploads/img/tienda_banner/logo_1724531216469.jpg',1,1);
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'platea'
--
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

-- Dump completed on 2024-08-25 22:22:18
