-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: citas
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
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `CitNumero` int NOT NULL AUTO_INCREMENT,
  `CitFecha` date NOT NULL,
  `CitHora` varchar(10) NOT NULL,
  `CitPaciente` char(10) NOT NULL,
  `CitMedico` char(10) NOT NULL,
  `CitConsultorio` int NOT NULL,
  `CitEstado` enum('Asignada','Cumplida') NOT NULL DEFAULT 'Asignada',
  `CitObservaciones` text NOT NULL,
  PRIMARY KEY (`CitNumero`),
  KEY `CitPaciente` (`CitPaciente`),
  KEY `CitMedico` (`CitMedico`),
  KEY `CitConsultorio` (`CitConsultorio`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`CitPaciente`) REFERENCES `pacientes` (`PacIdentificacion`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`CitMedico`) REFERENCES `medicos` (`MedIdentificacion`),
  CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`CitConsultorio`) REFERENCES `consultorios` (`ConNumero`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (1,'2024-04-22','2:00 PM','77191950','12767958',1,'Asignada','Sin Observaciones'),(2,'2024-04-12','12:00 PM','1077547776','13667458',2,'Asignada','Sin Observaciones'),(3,'2024-04-15','9:00 AM','7635695783','91290102',3,'Asignada','Sin Observaciones'),(4,'2024-05-17','7:00 AM','45185775','14653478',3,'Asignada','Sin Observaciones'),(5,'2024-05-19','6:00 AM','1077847640','14973478',1,'Asignada','Sin Observaciones');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorios`
--

DROP TABLE IF EXISTS `consultorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultorios` (
  `ConNumero` int NOT NULL,
  `ConNombre` varchar(50) NOT NULL,
  PRIMARY KEY (`ConNumero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorios`
--

LOCK TABLES `consultorios` WRITE;
/*!40000 ALTER TABLE `consultorios` DISABLE KEYS */;
INSERT INTO `consultorios` VALUES (1,'Laboratorio Dental'),(2,'Consultorio 1'),(3,'Toma de Muestras');
/*!40000 ALTER TABLE `consultorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `MedIdentificacion` char(10) NOT NULL,
  `MedNombres` varchar(50) NOT NULL,
  `MedApellidos` varchar(50) NOT NULL,
  PRIMARY KEY (`MedIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES ('1111111111','Reinaldo','Rojas'),('12767958','andres ramiro','zapata rojas'),('13664478','Cristian camilo','Parra'),('13667458','Fernanda','gomez'),('14653478','Sara','Poveda'),('14973478','michael','Perdomo'),('91290102','Oswaldo','Arenas');
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `PacIdentificacion` char(10) NOT NULL,
  `PacNombres` varchar(50) NOT NULL,
  `PacApellidos` varchar(50) NOT NULL,
  `PacFechaNacimiento` date NOT NULL,
  `PacSexo` enum('M','F') NOT NULL,
  PRIMARY KEY (`PacIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES ('1007357640','nancy','gomez','2006-05-06','F'),('1007387760','Andres','trujillo','2002-05-12','M'),('1077547776','laura','Bolaños','2001-02-22','M'),('1077838776','Alexandra','Cortes','2002-05-15','F'),('1077847640','Andres Julian','Salcedo','2005-12-06','M'),('37821203','Mari Fernanda','Rodriguez Perez','1970-07-28','M'),('45185775','vanessa','gomez torres','2002-11-03','F'),('45678765','Anderson david','perez gomez','2000-08-12','M'),('64699184','Jose Rodolofo','valenzuela bermeo','1999-10-25','M'),('76183759','Alejandra','ramirez gutierrez','2005-02-13','F'),('7635695783','Maria Andrea','Galindo lozano','2003-06-22','F'),('77191950','Carlos Jose','Arias Rojas','1980-04-12','M');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamientos`
--

DROP TABLE IF EXISTS `tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamientos` (
  `Tranumero` int NOT NULL AUTO_INCREMENT,
  `TraFechasignado` date NOT NULL,
  `TraDescripcion` text NOT NULL,
  `TraFechaInicio` date NOT NULL,
  `TraFechaFin` date NOT NULL,
  `TraObservaciones` text NOT NULL,
  `TraPaciente` char(10) NOT NULL,
  PRIMARY KEY (`Tranumero`),
  KEY `TraPaciente` (`TraPaciente`),
  CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY (`TraPaciente`) REFERENCES `pacientes` (`PacIdentificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamientos`
--

LOCK TABLES `tratamientos` WRITE;
/*!40000 ALTER TABLE `tratamientos` DISABLE KEYS */;
INSERT INTO `tratamientos` VALUES (1,'2012-08-17','blanqueamineto Dental','2012-08-21','2012-09-21','La paciente es Diabetica','37821203'),(2,'2012-08-17','Blanqueamiento dental','2012-08-21','2012-09-21','La paciente es Diabetica','37821203'),(3,'2012-08-17','Blanqueamiento dental','2012-08-21','2012-09-21','La paciente es Diabetica','37821203');
/*!40000 ALTER TABLE `tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'citas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-18 15:07:05
