-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: localhost    Database: cursos_complementarios
-- ------------------------------------------------------
-- Server version	8.3.0-cluster

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
-- Table structure for table `aprendiz`
--

DROP TABLE IF EXISTS `aprendiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprendiz` (
  `cod_aprendiz` char(10) NOT NULL,
  `nom_aprendiz` varchar(50) NOT NULL,
  `ape_aprendiz` varchar(50) NOT NULL,
  `tel_aprendiz` varchar(15) NOT NULL,
  `email_aprendiz` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_aprendiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprendiz`
--

LOCK TABLES `aprendiz` WRITE;
/*!40000 ALTER TABLE `aprendiz` DISABLE KEYS */;
INSERT INTO `aprendiz` VALUES ('1','juan esteban','gonzales chacon','3209846764','juan69@gmail.com'),('2','camilo','hernandez','3114568901','camilo2@gmail.com'),('3','andres camilo','tovar','3114721991','andres23@gmail.com'),('4','alejandra','gutierrez torres','3114456991','alejagu45@gmail.com'),('5','sofia','hernandez','3112458691','sofi11@gmail.com');
/*!40000 ALTER TABLE `aprendiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `num_ficha` char(7) NOT NULL,
  `nom_curso` varchar(50) NOT NULL,
  `dur_curso` varchar(50) DEFAULT NULL,
  `fecha_ini_curso` date NOT NULL,
  `fecha_fin_curso` date NOT NULL,
  `id_instructor` char(10) NOT NULL,
  PRIMARY KEY (`num_ficha`),
  KEY `id_instructor` (`id_instructor`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_instructor`) REFERENCES `instructor` (`id_instructor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES ('2567987','Gestion deportiva','1 año','2023-05-11','2024-11-12','372619'),('2670687','Analisis y desarollo de software','2 años','2023-02-03','2025-09-22','349762'),('2678657','Cocina','1 año','2023-05-11','2024-11-12','725628'),('2723244','ingles',' 40 horas','2024-03-12','2024-05-22','623848'),('2723654','administracion de empresas','2 años','2023-02-03','2025-09-22','523628');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos_aprendiz`
--

DROP TABLE IF EXISTS `cursos_aprendiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos_aprendiz` (
  `num_ficha_curso` char(7) NOT NULL,
  `cod_aprendiz` char(10) NOT NULL,
  KEY `num_ficha_curso` (`num_ficha_curso`),
  KEY `cod_aprendiz` (`cod_aprendiz`),
  CONSTRAINT `cursos_aprendiz_ibfk_1` FOREIGN KEY (`num_ficha_curso`) REFERENCES `cursos` (`num_ficha`),
  CONSTRAINT `cursos_aprendiz_ibfk_2` FOREIGN KEY (`cod_aprendiz`) REFERENCES `aprendiz` (`cod_aprendiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos_aprendiz`
--

LOCK TABLES `cursos_aprendiz` WRITE;
/*!40000 ALTER TABLE `cursos_aprendiz` DISABLE KEYS */;
INSERT INTO `cursos_aprendiz` VALUES ('2567987','1'),('2670687','2'),('2678657','3'),('2723244','4'),('2723654','5');
/*!40000 ALTER TABLE `cursos_aprendiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `id_instructor` char(10) NOT NULL,
  `nom_instructor` varchar(50) NOT NULL,
  `ape_instructor` varchar(50) NOT NULL,
  `email_instructor` varchar(100) NOT NULL,
  PRIMARY KEY (`id_instructor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('349762','gonzalo','chacon','gonzalo@sena.edu.co'),('372619','andres felipe','quevedo','falipequev@sena.edu.co'),('523628','yalfa','sanchez','yalfa@sena.edu.co'),('623848','Jesus andres','Silva plazas','jesus.sena.edu.co'),('725628','angie','ibarra','angie@sena.edu.co');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cursos_complementarios'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-18 18:39:30
