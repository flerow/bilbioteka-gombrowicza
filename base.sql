-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: workshops_3
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (3,'Bakakaj','Witold Gombrowicz','Tom Bakakaj i inne opowiadania zawiera wczesne, a już doskonałe utwory pisarza. Ich lektura daje pojęcie o literackim mistrzostwie i osobliwym zamyśle obserwacyjnym Gombrowicza, ułatwia poznawanie późniejszych jego książek. '),(4,'Bestiarium','Tadeusz Rozycki','Elementy rzeczywistości splatają się z wizjami, tajemnice rodzinne przeobrażają się w groteskę i zarazem prywatną mitologię. Przeżywamy wielką przygodę wyobraźni w świecie stworzonym przez poetę, który brawurowo operuje słowem i - podobnie jak w znakomitych Dwunastu stacjach - bawi się językiem, pod kostiumem komizmu ukrywającym prawdy zaskakująco istotne. '),(5,'Kosmos','Witold Gombrowicz',' Późne, dojrzałe dzieło wielkiego pisarza stanowi kwintesencję jego poglądów na życie i sztukę. Dowodem na uniwersalność i doniosłość przesłania powieści jest uhonorowanie jej międzynarodową nagrodą Prix Formentor, najwyższym europejskim wyróżnieniem po Literackiej Nagrodzie Nobla. '),(8,'Pornografia','Witold Gombrowicz','Pornografia jest dziełem wielkim. Żadna lektura ani żadna interpretacja nie jest w stanie wyczerpać jej sensów, stanowi tylko formę zbliżenia, formę wydobycia tych znaczeń, ujęć, symboli, które wydają się najdonoślejsze. Wielkie dzieło przerasta bowiem to, co jest w stanie o nim powiedzieć czytelnik i interpretator; gdyby tego nie czyniło, nie byłoby wielkim dziełem. A Gombrowiczowska Pornografia jest nim niewątpliwie. (Z posłowia Michała Głowińskiego) '),(11,'Ferdydurke','Witold Gombrowicz',' Wyjątkowe, jubileuszowe wydanie z okazji 75-lecia jednej z najważniejszych powieści polskiej XX wieku. '),(17,'Trans-Atlantyk','Witold Gombrowicz','Jedyny w swoim rodzaju utwór-wyzwanie, utwór-prowokacja, kapitalna rozprawa Gombrowicza z polskością, z podtrzymywanymi przez tradycję stereotypami narodowymi. Genialny humor i cudowny język, zadziwiające wykorzystanie przez pisarza form gawędy szlacheckiej, nie milknące pytania, które w każdym pokoleniu powinniśmy sobie zadawać'),(18,'','','dd...');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-28 11:56:39
