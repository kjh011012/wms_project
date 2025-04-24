-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: backend
-- ------------------------------------------------------
-- Server version	10.3.39-MariaDB-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BackupTable`
--

DROP TABLE IF EXISTS `BackupTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BackupTable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(50) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_number` varchar(100) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `pallet_size` enum('S','M','L') NOT NULL,
  `pallet_num` int(11) DEFAULT 0,
  `width_size` int(11) DEFAULT 0,
  `length_size` int(11) DEFAULT 0,
  `height_size` int(11) DEFAULT 0,
  `inbound_quantity` int(11) DEFAULT 0,
  `warehouse_location` varchar(255) DEFAULT NULL,
  `warehouse_type` enum('냉장','냉동','상온') NOT NULL,
  `warehouse_num` varchar(255) DEFAULT NULL,
  `inbound_status` enum('입고 준비','입고 대기','입고 중','입고 완료') DEFAULT '입고 준비',
  `outbound_status` enum('입고완료','출고요청','출고완료') DEFAULT '입고완료',
  `contract_date` date DEFAULT NULL,
  `inbound_date` date DEFAULT NULL,
  `subscription_inbound_date` date DEFAULT NULL,
  `outbound_date` date DEFAULT NULL,
  `last_outbound_date` date DEFAULT NULL,
  `storage_duration` int(11) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `barcode_num` varchar(255) DEFAULT NULL,
  `inbound_detail` text DEFAULT NULL,
  `outbound_details` text DEFAULT NULL,
  `estimate` text DEFAULT NULL,
  `estimate_description` text DEFAULT NULL COMMENT '견적 요청서',
  `img_inbound` text DEFAULT NULL,
  `img_pallet` text DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BackupTable`
--

LOCK TABLES `BackupTable` WRITE;
/*!40000 ALTER TABLE `BackupTable` DISABLE KEYS */;
INSERT INTO `BackupTable` VALUES (1,'Example Company','John Doe','010-1234-5678','123 Main Street, Seoul, South Korea','Sample Product','PROD-12345','High-quality sample product.','Electronics',12.50,'M',2,100,50,30,100,'Warehouse A','냉장','WH-001','입고 완료','출고완료','2025-01-01','2025-01-02','2025-01-01','2025-01-10','2025-01-15',14,'BAR-12345','BCN-67890','Inbound request details.','Outbound request details.','Estimate details.','Outbound estimate request.','img_inbound.jpg','img_pallet.jpg',1500.00,'2025-01-08 06:30:44');
/*!40000 ALTER TABLE `BackupTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContractForms`
--

DROP TABLE IF EXISTS `ContractForms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContractForms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `signature` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `terms` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_id` (`contract_id`),
  CONSTRAINT `ContractForms_ibfk_1` FOREIGN KEY (`contract_id`) REFERENCES `MainTable` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContractForms`
--

LOCK TABLES `ContractForms` WRITE;
/*!40000 ALTER TABLE `ContractForms` DISABLE KEYS */;
INSERT INTO `ContractForms` VALUES (6,6,'드디어되나?ggg','어찌되나?ggg','정훈킴','2025-01-09 11:22:25','2025-01-09 11:22:55',NULL);
/*!40000 ALTER TABLE `ContractForms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InboundEstimate1`
--

DROP TABLE IF EXISTS `InboundEstimate1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InboundEstimate1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_table_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `inbound_quantity` int(11) DEFAULT 0,
  `storage_condition` enum('냉장','냉동','상온') NOT NULL,
  `total_weight` decimal(10,2) DEFAULT NULL,
  `each_weight` decimal(10,2) DEFAULT NULL,
  `width_size` int(11) DEFAULT 0,
  `length_size` int(11) DEFAULT 0,
  `height_size` int(11) DEFAULT 0,
  `inbound_date` date DEFAULT NULL,
  `subscription_inbound_date` date DEFAULT NULL,
  `outbound_date` date DEFAULT NULL,
  `storage_duration` int(11) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `inbound_detail` text DEFAULT NULL,
  `estimate_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `inbound_totalcost` decimal(10,2) DEFAULT NULL,
  `inbound_size` enum('소','중','대') DEFAULT NULL,
  `pallet_count` int(11) NOT NULL,
  `total_cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_table_id` (`main_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InboundEstimate1`
--

LOCK TABLES `InboundEstimate1` WRITE;
/*!40000 ALTER TABLE `InboundEstimate1` DISABLE KEYS */;
INSERT INTO `InboundEstimate1` VALUES (1,NULL,NULL,NULL,'ㄴㅇㄹㄴㄹ','ㄴㅇㄹㄴㄹ',10,'상온',100.00,10.00,100,100,100,NULL,'2025-01-09','2025-01-31',22,NULL,NULL,NULL,'2025-01-09 07:21:20',NULL,'소',2,4400.00);
/*!40000 ALTER TABLE `InboundEstimate1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MainTable`
--

DROP TABLE IF EXISTS `MainTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MainTable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(50) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_number` varchar(100) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `pallet_size` enum('S','M','L') NOT NULL,
  `pallet_num` int(11) DEFAULT 0,
  `width_size` int(11) DEFAULT 0,
  `length_size` int(11) DEFAULT 0,
  `height_size` int(11) DEFAULT 0,
  `inbound_quantity` int(11) DEFAULT 0,
  `warehouse_location` varchar(255) DEFAULT NULL,
  `warehouse_type` enum('냉장','냉동','상온') NOT NULL,
  `warehouse_num` varchar(255) DEFAULT NULL,
  `inbound_status` enum('입고 준비','입고 대기','입고 중','입고 완료') DEFAULT '입고 준비',
  `outbound_status` enum('입고완료','출고요청','출고완료') DEFAULT '입고완료',
  `contract_date` date DEFAULT NULL,
  `inbound_date` date DEFAULT NULL,
  `subscription_inbound_date` date DEFAULT NULL,
  `outbound_date` date DEFAULT NULL,
  `last_outbound_date` date DEFAULT NULL,
  `storage_duration` int(11) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `barcode_num` varchar(255) DEFAULT NULL,
  `inbound_detail` text DEFAULT NULL,
  `outbound_details` text DEFAULT NULL,
  `estimate` text DEFAULT NULL,
  `estimate_description` text DEFAULT NULL COMMENT '견적 요청서',
  `img_inbound` text DEFAULT NULL,
  `img_pallet` text DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_number` (`product_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MainTable`
--

LOCK TABLES `MainTable` WRITE;
/*!40000 ALTER TABLE `MainTable` DISABLE KEYS */;
INSERT INTO `MainTable` VALUES (1,'ABC 물류','김철수','010-1234-5678','서울특별시 강남구 테헤란로 10길 20','전자제품','PRD-1234','최신형 스마트폰','전자',1.25,'L',2,50,30,10,100,'서울 창고 A','상온','W001','입고 준비','출고요청','2025-01-09','2023-12-20','2023-12-19','2023-12-30','2023-12-30',30,'123456789','BC12345','빠른 배송 요청','출고 요청 세부사항','===========================================\n                  견적서\n===========================================\n발행일      : 2025년 01월 09일\n-------------------------------------------\n수신 회사명 : ABC 물류\n\n1. 제품 정보\n   상품명       : 전자제품\n   입고 수량    : 100 개\n   무게         : 1.25 kg\n   제품 번호    : PRD-1234\n\n2. 창고 정보\n   창고 위치    : 서울 창고 A\n   창고 타입    : 상온\n   입고 날짜    : 2023년 12월 19일\n   출고 날짜    : 2023년 12월 30일\n   보관 기간    : 11 일\n\n3. 팔레트 정보\n   팔레트 크기  : L\n   팔레트 개수  : 2 개\n\n4. 비용 정보\n   총 비용       : 550000 원\n===========================================\n   본 견적서는 발행일로부터 30일간 유효합니다.\n===========================================\n','견적 요청서 A','img1.jpg','img_pal1.jpg',550000.00,'2025-01-11 06:25:13'),(2,'XYZ 물류','이영희','010-2345-6789','부산광역시 해운대구 우동 123-45','의류','P54321','겨울용 코트','패션',2.30,'L',20,60,40,20,200,'부산 창고 B','냉장','W002','입고 대기','출고요청','2023-12-01','2023-12-05','2023-12-02','2023-12-10','2023-12-11',45,'987654321','BC54321','특급 배송 요청','출고 상세 설명 B','견적 내용 B','견적 요청서 B','img2.jpg','img_pal2.jpg',200000.75,'2025-01-08 05:59:32'),(3,'MNO 물류','박민수','010-3456-7890','인천광역시 남동구 남동대로 12번길 10','화장품','P67890','프리미엄 화장품 세트','미용',1.10,'S',5,40,20,10,50,'인천 창고 C','상온','W003','입고 중','출고완료','2023-12-10','2023-12-12','2023-12-11','2023-12-15','2023-12-16',20,'456789123','BC67890','정확한 검수 요청','출고 상세 설명 C','견적 내용 C','견적 요청서 C','img3.jpg','img_pal3.jpg',50000.00,'2025-01-08 05:59:32'),(4,'JKL 물류','최지훈','010-4567-8901','대구광역시 동구 동촌로 25길 15','가구','P98765','고급형 책상','가구',15.50,'L',30,120,60,80,300,'대구 창고 D','냉동','W004','입고 완료','입고완료','2023-12-05','2023-12-08','2023-12-07','2023-12-14','2023-12-15',60,'654321987','BC98765','정확한 수량 요청','출고 상세 설명 D','견적 내용 D','견적 요청서 D','img4.jpg','img_pal4.jpg',1500000.00,'2025-01-08 05:59:32'),(5,'OPQ 물류','한예슬','010-5678-9012','광주광역시 북구 북문대로 50길 5','도서','P24680','전문 서적 세트','출판',5.00,'M',15,80,50,30,150,'광주 창고 E','냉장','W005','입고 대기','출고완료','2023-11-20','2023-11-25','2023-11-21','2023-11-30','2023-12-01',10,'135792468','BC24680','특별 관리 요청','출고 상세 설명 E','견적 내용 E','견적 요청서 E','img5.jpg','img_pal5.jpg',750000.00,'2025-01-08 05:59:32'),(6,'럭키',NULL,'0123456789',NULL,'ㄴㅇㄹㄴㄹ','PRD-1111',NULL,'ㄴㅇㄹㄴㄹ',100.00,'L',3,100,100,100,10,'광주 창고 F','상온',NULL,'입고 완료','입고완료','2025-01-09',NULL,'2025-01-09','2025-01-31',NULL,22,'/var/human/wms/manager/backend/inbound/barcode/barcode6.png','CONTRACT006',NULL,NULL,'===========================================\n                  견적서\n===========================================\n발행일      : 2025년 01월 09일\n-------------------------------------------\n수신 회사명 : 럭키\n\n1. 제품 정보\n   상품명       : ㄴㅇㄹㄴㄹ\n   입고 수량    : 10 개\n   무게         : 100 kg\n   제품 번호    : PRD-1111\n\n2. 창고 정보\n   창고 위치    : 광주 창고 F\n   창고 타입    : 상온\n   입고 날짜    : 2025년 01월 09일\n   출고 날짜    : 2025년 01월 31일\n   보관 기간    : 22 일\n\n3. 팔레트 정보\n   팔레트 크기  : L\n   팔레트 개수  : 3 개\n\n4. 비용 정보\n   총 비용       : 1650000 원\n===========================================\n   본 견적서는 발행일로부터 30일간 유효합니다.\n===========================================\n',NULL,NULL,NULL,1650000.00,'2025-01-09 11:59:18');
/*!40000 ALTER TABLE `MainTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-08  0:00:59
