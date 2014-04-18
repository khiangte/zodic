-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: zodic_development
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2

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
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meaning` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `example` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2331 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO words (word,thumal,pos,meaning,example,user,active) VALUES ('sang','sáng','adj','tall, high','Kima chu naupang sáng tak a ni! <i>Kima is a [very] tall kid!</i>','imasseu@gmail.com',1),('sang','säng','Noun','thousand, thousandth, a thousandth part','Naupang säng thum.<i> Three thousand children.</i>','imasseu@gmail.com',1),('ka','ka','Pronoun','I, my','Ka kut a ná. <i>My hand hurts</i><br/>Lehkhathawn ka ziak. <i>I am writing a letter</i>','imasseu@gmail.com',1),('ka','ká','Noun','mouth','I ká áng rawh. <i>Open your mouth.</i>','imasseu@gmail.com',1),('ang','ang','Postposition','like, similar to, of the same kind','Máwia pen ang ka nei. <i>I have a pen like Máwia\'s. </i>','imasseu@gmail.com',1),('ang','áng','Verb','to open one\'s mouth','I ká áng rawh. <i>Open your mouth.</i>','imasseu@gmail.com',1),('ang','ang','Aux. Verb','denoting the future tense, will, shall','Ka häw ang. <i>I will go home.</i>','imasseu@gmail.com',1),('sam','sam','Noun','hair (of the head)','A sam a buáng. <i>His/Her hair is blonde</i>','imasseu@gmail.com',1),('nei','nei','Verb','to own, to have','Bike ka nei. <i> I have/own a bike.<i>','imasseu@gmail.com',1),('i','i','Pronoun','you, your (singular), plural <i>in</i>','I ká áng rawh. <i>Open your mouth.</i><br>I kal tâ em? <i>Did you go?</i>','imasseu@gmail.com',1),('zam','zäm','adj','nervous, be worried','Kima chu an zai dáwn a, a zäm khawp mai! <i>They are going to operate on Kima, he is very nervous!</i>','imasseu@gmail.com',1),('naupang','naupang','Noun','child, children','Naupang säng thum. <i> Three thousand children</i>','imasseu@gmail.com',1),('mipa','mipa','Noun','a male human','Mipa ka ni. <i>I am a man/boy</i>','imasseu@gmail.com',1),('puitling','puitling','Noun','adult','Puitling hlïr an ni. <i>They are all adults</i>','imasseu@gmail.com',1),('hlir','hlïr','Postposition','a group or collection of x belonging to the same type/kind','Puitling hlïr an ni. <i>They are all adults</i>','imasseu@gmail.com',1),('an','an','Pronoun','they','Puitling hlïr an ni. <i>They are all adults.</i>','imasseu@gmail.com',1),('ni','ni','Verb','to be','Puitling hlïr an ni. <i>They are all adults.</i>','imasseu@gmail.com',1),('ni','ní','Noun','the sun<br>day<br>paternal aunt','Ní a chhuak tawh e. <i>The sun has risen.</i><br>Vawiin hi eng ní nge? <i>What day is today?</i><br>Ka ní a lám. <i>My aunt is dancing.</i>','imasseu@gmail.com',1),('ta','tâ','Aux. Verb','denoting the past tense','I kal tâ em? <i>Did you go?</i>','imasseu@gmail.com',1),('ta','tä','Noun','belonging','Hë pen hi ka tä a ni. <i>This pen is mine/my belonging. </i><br>Hei hi Kima tä a ni. <i>This is Kima\'s belonging.</i> ','imasseu@gmail.com',1),('al','al','adj','salty','Tuï al. <i>Salty water</i>','imasseu@gmail.com',1),('al','al','Verb','to add salt to make sth salty','Chawhmeh kha al rawh. <i>Add salt to the side dish.</i>','imasseu@gmail.com',1),('ak','ak','Verb','to carry sth in a bag/pocket, to carry a bag by putting the strap on one\'s shoulder','Iptë ka ak. <i>I am carrying a bag [putting the strap on my shoulder].</i><br>Lehkhabû ka ak. <i>I am carrying a book [in a bag].</i>','imasseu@gmail.com',1),('sangha','sanghâ','Noun','fish','Sanghâ ka kháwi. <i>I pet fish.</i>','imasseu@gmail.com',1),('sanghal','sanghal','Noun','wild boar','Thanga\'n sanghal a kâp. <i>Thanga shot a wild boar</i>','imasseu@gmail.com',1),('sanghar','sanghar','Noun','wildcat','Sanghal ka man. <i>I caught a wildcat.</i>','imasseu@gmail.com',1),('sava','savâ','Noun','bird','Savâ a thlâwk. <i>A bird is flying. </i>','imasseu@gmail.com',1),('savawm','savawm','Noun','bear','Savawm chu ramsa hlauhawm tak an ni. <i>Bears are dangerous [wild] animals. </i>','imasseu@gmail.com',1),('thlawk','thlâwk','Verb','to fly','Savâ a thlâwk. <i>A bird is flying. </i>','imasseu@gmail.com',1),('khawi','kháwi','Verb','to tame, to pet, to keep in cage','Sanghâ ka kháwi. <i>I pet fish.</i>','imasseu@gmail.com',1),('sa','sâ','Noun','meat, animal','Sâ kg khat. <i>One kg of meat.</i>','imasseu@gmail.com',1),('sa','sâ','Aux. Verb','denoting sth done in the past/already done','Khawiah nge ka lehkhathawn ziah sâ kha a awm? <i>Where is the letter that I have written.</i>','imasseu@gmail.com',1),('sa','sá','adj','hot [temperature]','Hë bél hi a sá. <i>This pot is hot.</i>','imasseu@gmail.com',1),('ha','há','Noun','tooth, teeth','Ka há a ná. <i>My tooth aches.</i><br>Kháwl há. <i>Machine teeth(such as those of a saw or other cutting tools).</i>','imasseu@gmail.com',1),('kum','kum','Noun','year','Kum thum. <i>Three years</i>','imasseu@gmail.com',1),('kha','khà','Adj','bitter','Hë tuï hi a khà! <i>This water is bitter!</i>','imasseu@gmail.com',1),('thing','thing','Noun','tree, wood','Thing tam tak. <i>Many trees.</i>','imasseu@gmail.com',1),('sei','sei','Adj','long','Sam sei <i>long hair</i>','imasseu@gmail.com',1),('thingkung','thingkûng','Noun','tree','thingkûng buk <i>bushy tree</i>','imasseu@gmail.com',1),('dum','dum','Adj','black','pentuï dum <i>black ink</i>','imasseu@gmail.com',1);

