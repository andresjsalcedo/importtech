-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: importtech
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `ID_categoria` int NOT NULL,
  `Nom_categoria` varchar(50) NOT NULL,
  `Des_categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Displays','Displays de dispositivos moviles'),(2,'Fundas','Fundas para dispositivos moviles'),(3,'Cargadores','Cargadores Tipo C carga rapida'),(4,'Auriculares','Auriculares inalambricos'),(5,'Tapa posterior','Tapa posterior para dispositivos moviles');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Nip_cliente` int NOT NULL,
  `Nom_cliente` varchar(50) NOT NULL,
  PRIMARY KEY (`Nip_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (5226958,'Camilo Rojas'),(52265491,'Andrea Perez'),(52267632,'Juan Cortes'),(52467658,'Andres Gonzales'),(77777777,'Cristiano ronaldo');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `calle` varchar(50) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `comuna` varchar(50) NOT NULL,
  `cuidad` varchar(50) NOT NULL,
  `cliente_ID` int NOT NULL,
  KEY `cliente_ID` (`cliente_ID`),
  CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`cliente_ID`) REFERENCES `cliente` (`Nip_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES ('19 sur','2-37','9','Bogota',52467658),('10 norte','4-20','12','medellin',5226958),('9 norte','2-21','8','Bogota',52265491),('9 sur','2-24','5','Barranquilla',52267632),('6 norte','3-12','9','Cartagena',77777777);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_venta`
--

DROP TABLE IF EXISTS `factura_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_venta` (
  `ID_factura` int NOT NULL,
  `Fecha_factura` date NOT NULL,
  `descuento_factura` float NOT NULL,
  `precio_total` float NOT NULL,
  `cliente_ID` int NOT NULL,
  PRIMARY KEY (`ID_factura`),
  KEY `cliente_ID` (`cliente_ID`),
  CONSTRAINT `factura_venta_ibfk_1` FOREIGN KEY (`cliente_ID`) REFERENCES `cliente` (`Nip_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_venta`
--

LOCK TABLES `factura_venta` WRITE;
/*!40000 ALTER TABLE `factura_venta` DISABLE KEYS */;
INSERT INTO `factura_venta` VALUES (111111,'2024-02-12',20,200,5226958),(111112,'2024-02-15',35,550,52265491),(111113,'2024-02-15',15,120,52267632),(111114,'2024-02-16',22,155,52467658),(111115,'2024-02-16',25,330,77777777);
/*!40000 ALTER TABLE `factura_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `ID_producto` int NOT NULL,
  `Nom_producto` varchar(50) NOT NULL,
  `precio_producto` float NOT NULL,
  `stock_producto` int NOT NULL,
  `Categoria_ID` int NOT NULL,
  PRIMARY KEY (`ID_producto`),
  KEY `Categoria_ID` (`Categoria_ID`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Categoria_ID`) REFERENCES `categoria` (`ID_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1111,'Display xiaomi note 9s',112000,15,1),(1112,'Display xiaomi note 10',150000,10,1),(1113,'Funda huawei p20 Azul',25000,22,2),(1114,'Apple AirPods Pro',180,10,4),(1115,'Apple AirPods Pro negro',180,10,4);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_factura`
--

DROP TABLE IF EXISTS `producto_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_factura` (
  `Preciounidad_producto` float NOT NULL,
  `cantidad_producto` int NOT NULL,
  `montofinal_factura` float NOT NULL,
  `Producto_ID` int NOT NULL,
  `Factura_ID` int NOT NULL,
  KEY `Producto_ID` (`Producto_ID`),
  KEY `Factura_ID` (`Factura_ID`),
  CONSTRAINT `producto_factura_ibfk_1` FOREIGN KEY (`Producto_ID`) REFERENCES `producto` (`ID_producto`),
  CONSTRAINT `producto_factura_ibfk_2` FOREIGN KEY (`Factura_ID`) REFERENCES `factura_venta` (`ID_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_factura`
--

LOCK TABLES `producto_factura` WRITE;
/*!40000 ALTER TABLE `producto_factura` DISABLE KEYS */;
INSERT INTO `producto_factura` VALUES (180000,5,900000,1114,111111),(180000,5,900000,1115,111112),(25000,20,500000,1113,111113),(150000,5,750000,1112,111112),(112000,5,560000,1111,111111);
/*!40000 ALTER TABLE `producto_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `Nip_Proveedor` int NOT NULL,
  `Nit_Proveedor` varchar(50) NOT NULL,
  `Nom_proveedor` varchar(50) NOT NULL,
  `Dir_provvedor` varchar(50) NOT NULL,
  `PagWeb_provvedor` varchar(50) NOT NULL,
  `Producto_ID` int NOT NULL,
  PRIMARY KEY (`Nip_Proveedor`),
  KEY `Producto_ID` (`Producto_ID`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`Producto_ID`) REFERENCES `producto` (`ID_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (2312,'2432','Mark newman','10 2-34 España','temu.com',1113),(2354,'1123','andres gomez','19 2-23 EEUU','amazon.com',1115),(3254,'2223','Sergio andrade','19 2-23 EEUU','Amazon.com',1114),(3356,'1223','jhonatan moreno','10 2-12 EEUU','alibaba.com',1111),(3357,'1224','sofia bella','10 2-12 EEUU','alibaba.com',1112);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonos` (
  `ID_telefono` varchar(50) NOT NULL,
  `cliente_ID` int NOT NULL,
  KEY `cliente_ID` (`cliente_ID`),
  CONSTRAINT `telefonos_ibfk_1` FOREIGN KEY (`cliente_ID`) REFERENCES `cliente` (`Nip_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos`
--

LOCK TABLES `telefonos` WRITE;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
INSERT INTO `telefonos` VALUES ('3209856194',52467658),('3203114576',5226958),('3203457653',52265491),('3212715653',52267632),('3012681452',77777777);
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'importtech'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-18 13:25:07
