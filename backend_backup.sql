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
  `cost_difference` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BackupTable`
--

LOCK TABLES `BackupTable` WRITE;
/*!40000 ALTER TABLE `BackupTable` DISABLE KEYS */;
INSERT INTO `BackupTable` VALUES (1,'Example Company','John Doe','010-1234-5678','123 Main Street, Seoul, South Korea','Sample Product','PROD-12345','High-quality sample product.','Electronics',12.50,'M',2,100,50,30,100,'Warehouse A','냉장','WH-001','입고 완료','출고완료','2025-01-01','2025-01-02','2025-01-01','2025-01-10','2025-01-15',14,'BAR-12345','BCN-67890','Inbound request details.','Outbound request details.','Estimate details.','Outbound estimate request.','img_inbound.jpg','img_pallet.jpg',1500.00,'2025-01-08 06:30:44',NULL),(8,'정훈컴퍼니',NULL,'12341234',NULL,'노트북','내노트북',NULL,'전자제품',10.00,'L',4,1000,1000,500,10,'우리집창고','상온',NULL,'입고 완료','출고완료','2025-04-03',NULL,'2025-04-03','2025-04-05',NULL,2,NULL,NULL,NULL,NULL,'===========================================\n                  견적서\n===========================================\n발행일      : 2025년 04월 03일\n-------------------------------------------\n수신 회사명 : 정훈컴퍼니\n\n1. 제품 정보\n   상품명       : 노트북\n   입고 수량    : 10 개\n   무게         : 10 kg\n   제품 번호    : 내노트북\n\n2. 창고 정보\n   창고 위치    : 우리집창고\n   창고 타입    : 상온\n   입고 날짜    : 2025년 04월 03일\n   출고 날짜    : 2025년 04월 05일\n   보관 기간    : 2 일\n\n3. 팔레트 정보\n   팔레트 크기  : L\n   팔레트 개수  : 4 개\n\n4. 비용 정보\n   총 비용       : 200000 원\n===========================================\n   본 견적서는 발행일로부터 30일간 유효합니다.\n===========================================\n',NULL,NULL,NULL,200000.00,'2025-04-04 00:30:51',NULL),(77,'휴먼',NULL,'01000000000',NULL,'립밤3','5665',NULL,'립밤',1.00,'S',1,1,1,1,1,'보관소 B','상온','SLOT-9','입고 준비','출고완료','2025-04-17',NULL,'2025-04-17','2025-04-17','2025-04-17',1,'/home/wms/work/manager/backend/inbound/barcode/barcode77.png','77',NULL,NULL,'===========================================\n                  견적서\n===========================================\n발행일      : 2025년 04월 17일\n-------------------------------------------\n수신 회사명 : 휴먼\n\n1. 제품 정보\n   상품명       : 립밤3\n   입고 수량    : 1 개\n   무게         : 1.00 kg\n   제품 번호    : 5665\n\n2. 창고 정보\n   창고 위치    : 보관소 B\n   창고 타입    : 상온\n   입고 날짜    : 2025년 04월 17일\n   출고 날짜    : 2025년 04월 18일\n   보관 기간    : 1 일\n\n3. 팔레트 정보\n   팔레트 크기  : S\n   팔레트 개수  : 1 개\n\n4. 비용 정보\n   총 비용       : 10000 원\n===========================================\n   본 견적서는 발행일로부터 30일간 유효합니다.\n===========================================\n',NULL,NULL,NULL,0.00,'2025-04-17 03:47:10',-10000.00),(78,'휴먼',NULL,'01000000000',NULL,'립밤5','4433',NULL,'립밤',1.00,'S',3,1,1,1,1,'보관소 B','상온','SLOT-7','입고 준비','출고완료','2025-04-17',NULL,'2025-04-17','2025-04-17','2025-04-17',0,'/home/wms/work/manager/backend/inbound/barcode/barcode78.png','78',NULL,NULL,'===========================================\n                  견적서\n===========================================\n발행일      : 2025년 04월 17일\n-------------------------------------------\n수신 회사명 : 휴먼\n\n1. 제품 정보\n   상품명       : 립밤5\n   입고 수량    : 1 개\n   무게         : 1.00 kg\n   제품 번호    : 4433\n\n2. 창고 정보\n   창고 위치    : 보관소 B\n   창고 타입    : 상온\n   입고 날짜    : 2025년 04월 17일\n   출고 날짜    : 2025년 04월 17일\n   보관 기간    : 0 일\n\n3. 팔레트 정보\n   팔레트 크기  : S\n   팔레트 개수  : 3 개\n\n4. 비용 정보\n   총 비용       : 0 원\n===========================================\n   본 견적서는 발행일로부터 30일간 유효합니다.\n===========================================\n',NULL,NULL,NULL,0.00,'2025-04-17 05:01:42',0.00);
/*!40000 ALTER TABLE `BackupTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BarcodeLogs`
--

DROP TABLE IF EXISTS `BarcodeLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BarcodeLogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode_num` varchar(255) DEFAULT NULL,
  `detected_at` datetime DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BarcodeLogs`
--

LOCK TABLES `BarcodeLogs` WRITE;
/*!40000 ALTER TABLE `BarcodeLogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `BarcodeLogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Checklist`
--

DROP TABLE IF EXISTS `Checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Checklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `direction` enum('inbound','outbound') NOT NULL,
  `phase` varchar(50) NOT NULL,
  `checklist_item` varchar(255) NOT NULL,
  `is_checked` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `Checklist_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `MainTable` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Checklist`
--

LOCK TABLES `Checklist` WRITE;
/*!40000 ALTER TABLE `Checklist` DISABLE KEYS */;
INSERT INTO `Checklist` VALUES (242,113,'inbound','입고 준비','계약서 자동 로딩 확인 (바코드 스캔 결과)',0,'2025-04-30 00:17:52','2025-04-30 05:02:08'),(243,113,'inbound','입고 준비','계약서 내용 확인 및 조건 검토',0,'2025-04-30 00:17:52','2025-04-30 05:02:08'),(244,113,'inbound','입고 준비','계약서 승인 처리 (승인 버튼 클릭)',0,'2025-04-30 00:17:52','2025-04-30 05:02:08'),(245,113,'inbound','입고 준비','담당자 확인 및 배정 여부 체크',0,'2025-04-30 00:17:52','2025-04-30 05:02:09'),(246,113,'inbound','입고 준비','입고 예정 시간 및 날짜 설정',0,'2025-04-30 00:17:52','2025-04-30 05:02:09'),(247,113,'inbound','입고 준비','입고 일정 스케줄 등록 완료 확인',0,'2025-04-30 00:17:52','2025-04-30 05:02:10'),(248,114,'inbound','입고 준비','계약서 자동 로딩 확인 (바코드 스캔 결과)',1,'2025-04-30 00:17:52','2025-04-30 05:55:18'),(249,114,'inbound','입고 준비','계약서 내용 확인 및 조건 검토',1,'2025-04-30 00:17:52','2025-04-30 05:55:18'),(250,114,'inbound','입고 준비','계약서 승인 처리 (승인 버튼 클릭)',1,'2025-04-30 00:17:52','2025-04-30 05:55:19'),(251,114,'inbound','입고 준비','담당자 확인 및 배정 여부 체크',1,'2025-04-30 00:17:52','2025-04-30 05:55:19'),(252,114,'inbound','입고 준비','입고 예정 시간 및 날짜 설정',1,'2025-04-30 00:17:52','2025-04-30 05:55:20'),(253,114,'inbound','입고 준비','입고 일정 스케줄 등록 완료 확인',1,'2025-04-30 00:17:52','2025-04-30 05:55:20'),(254,115,'inbound','입고 준비','계약서 자동 로딩 확인 (바코드 스캔 결과)',0,'2025-04-30 00:17:52','2025-04-30 00:17:52'),(255,115,'inbound','입고 준비','계약서 내용 확인 및 조건 검토',0,'2025-04-30 00:17:52','2025-04-30 00:17:52'),(256,115,'inbound','입고 준비','계약서 승인 처리 (승인 버튼 클릭)',0,'2025-04-30 00:17:52','2025-04-30 00:17:52'),(257,115,'inbound','입고 준비','담당자 확인 및 배정 여부 체크',0,'2025-04-30 00:17:52','2025-04-30 00:17:52'),(258,115,'inbound','입고 준비','입고 예정 시간 및 날짜 설정',0,'2025-04-30 00:17:52','2025-04-30 00:17:52'),(259,115,'inbound','입고 준비','입고 일정 스케줄 등록 완료 확인',0,'2025-04-30 00:17:52','2025-04-30 00:17:52'),(260,116,'inbound','입고 준비','계약서 자동 로딩 확인 (바코드 스캔 결과)',0,'2025-04-30 00:17:52','2025-04-30 06:23:11'),(261,116,'inbound','입고 준비','계약서 내용 확인 및 조건 검토',0,'2025-04-30 00:17:52','2025-04-30 06:23:11'),(262,116,'inbound','입고 준비','계약서 승인 처리 (승인 버튼 클릭)',0,'2025-04-30 00:17:52','2025-04-30 00:17:52'),(263,116,'inbound','입고 준비','담당자 확인 및 배정 여부 체크',0,'2025-04-30 00:17:52','2025-04-30 00:17:52'),(264,116,'inbound','입고 준비','입고 예정 시간 및 날짜 설정',0,'2025-04-30 00:17:52','2025-04-30 00:17:52'),(265,116,'inbound','입고 준비','입고 일정 스케줄 등록 완료 확인',0,'2025-04-30 00:17:52','2025-04-30 00:17:52'),(266,111,'outbound','출고요청','고객 출고 요청 접수 확인',0,'2025-04-30 00:18:32','2025-04-30 04:59:52'),(267,111,'outbound','출고요청','요청서 기반 출고 대상 품목 정리',0,'2025-04-30 00:18:32','2025-04-30 04:59:52'),(268,111,'outbound','출고요청','출고 요청 리스트업 완료',0,'2025-04-30 00:18:32','2025-04-30 04:59:53'),(269,112,'outbound','출고요청','고객 출고 요청 접수 확인',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(270,112,'outbound','출고요청','요청서 기반 출고 대상 품목 정리',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(271,112,'outbound','출고요청','출고 요청 리스트업 완료',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(272,113,'outbound','출고요청','고객 출고 요청 접수 확인',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(273,113,'outbound','출고요청','요청서 기반 출고 대상 품목 정리',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(274,113,'outbound','출고요청','출고 요청 리스트업 완료',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(275,114,'outbound','출고요청','고객 출고 요청 접수 확인',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(276,114,'outbound','출고요청','요청서 기반 출고 대상 품목 정리',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(277,114,'outbound','출고요청','출고 요청 리스트업 완료',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(278,115,'outbound','출고요청','고객 출고 요청 접수 확인',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(279,115,'outbound','출고요청','요청서 기반 출고 대상 품목 정리',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(280,115,'outbound','출고요청','출고 요청 리스트업 완료',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(281,116,'outbound','출고요청','고객 출고 요청 접수 확인',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(282,116,'outbound','출고요청','요청서 기반 출고 대상 품목 정리',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(283,116,'outbound','출고요청','출고 요청 리스트업 완료',0,'2025-04-30 00:18:32','2025-04-30 00:18:32'),(284,117,'inbound','입고 준비','계약서 자동 로딩 확인 (바코드 스캔 결과)',0,'2025-04-30 05:55:16','2025-04-30 05:55:16'),(285,117,'inbound','입고 준비','계약서 내용 확인 및 조건 검토',0,'2025-04-30 05:55:16','2025-04-30 05:55:16'),(286,117,'inbound','입고 준비','계약서 승인 처리 (승인 버튼 클릭)',0,'2025-04-30 05:55:16','2025-04-30 05:55:16'),(287,117,'inbound','입고 준비','담당자 확인 및 배정 여부 체크',0,'2025-04-30 05:55:16','2025-04-30 05:55:16'),(288,117,'inbound','입고 준비','입고 예정 시간 및 날짜 설정',0,'2025-04-30 05:55:16','2025-04-30 05:55:16'),(289,117,'inbound','입고 준비','입고 일정 스케줄 등록 완료 확인',0,'2025-04-30 05:55:16','2025-04-30 05:55:16'),(290,125,'inbound','입고 준비','계약서 자동 로딩 확인 (바코드 스캔 결과)',1,'2025-05-22 04:07:16','2025-05-22 06:35:56'),(291,125,'inbound','입고 준비','계약서 내용 확인 및 조건 검토',1,'2025-05-22 04:07:16','2025-05-22 06:35:57'),(292,125,'inbound','입고 준비','계약서 승인 처리 (승인 버튼 클릭)',1,'2025-05-22 04:07:16','2025-05-22 06:35:57'),(293,125,'inbound','입고 준비','담당자 확인 및 배정 여부 체크',1,'2025-05-22 04:07:16','2025-05-22 06:35:58'),(294,125,'inbound','입고 준비','입고 예정 시간 및 날짜 설정',1,'2025-05-22 04:07:16','2025-05-22 06:35:58'),(295,125,'inbound','입고 준비','입고 일정 스케줄 등록 완료 확인',1,'2025-05-22 04:07:16','2025-05-22 06:35:58'),(296,126,'inbound','입고 준비','계약서 자동 로딩 확인 (바코드 스캔 결과)',0,'2025-05-22 04:07:16','2025-05-22 04:07:16'),(297,126,'inbound','입고 준비','계약서 내용 확인 및 조건 검토',0,'2025-05-22 04:07:16','2025-05-22 04:07:16'),(298,126,'inbound','입고 준비','계약서 승인 처리 (승인 버튼 클릭)',0,'2025-05-22 04:07:16','2025-05-22 04:07:16'),(299,126,'inbound','입고 준비','담당자 확인 및 배정 여부 체크',0,'2025-05-22 04:07:16','2025-05-22 04:07:16'),(300,126,'inbound','입고 준비','입고 예정 시간 및 날짜 설정',0,'2025-05-22 04:07:16','2025-05-22 04:07:16'),(301,126,'inbound','입고 준비','입고 일정 스케줄 등록 완료 확인',0,'2025-05-22 04:07:16','2025-05-22 04:07:16'),(302,130,'inbound','입고 대기','입고 대상 차량 번호 확인',0,'2025-05-22 06:35:49','2025-05-22 06:35:49'),(303,130,'inbound','입고 대기','차량 도착 시간 기록 및 확인',0,'2025-05-22 06:35:49','2025-05-22 06:35:49'),(304,130,'inbound','입고 대기','담당자에게 입고 예정 알림 전송 또는 공유 여부',0,'2025-05-22 06:35:49','2025-05-22 06:35:49'),(305,130,'inbound','입고 대기','창고 입구 라인 정리 및 안내',0,'2025-05-22 06:35:49','2025-05-22 06:35:49'),(306,130,'inbound','입고 대기','계약 정보와 차량 정보 일치 여부 확인',0,'2025-05-22 06:35:49','2025-05-22 06:35:49'),(307,130,'inbound','입고 대기','입고 대기 현황 리스트에 등록 완료',0,'2025-05-22 06:35:49','2025-05-22 06:35:49'),(308,126,'outbound','출고요청','고객 출고 요청 접수 확인',1,'2025-05-22 06:36:57','2025-05-22 06:36:59'),(309,126,'outbound','출고요청','요청서 기반 출고 대상 품목 정리',1,'2025-05-22 06:36:57','2025-05-22 06:37:00'),(310,126,'outbound','출고요청','출고 요청 리스트업 완료',0,'2025-05-22 06:36:57','2025-05-22 06:37:06'),(311,133,'inbound','입고 준비','계약서 자동 로딩 확인 (바코드 스캔 결과)',0,'2025-05-23 05:17:52','2025-05-23 05:34:03'),(312,133,'inbound','입고 준비','계약서 내용 확인 및 조건 검토',0,'2025-05-23 05:17:52','2025-05-23 05:34:02'),(313,133,'inbound','입고 준비','계약서 승인 처리 (승인 버튼 클릭)',0,'2025-05-23 05:17:52','2025-05-23 05:34:02'),(314,133,'inbound','입고 준비','담당자 확인 및 배정 여부 체크',0,'2025-05-23 05:17:52','2025-05-23 05:34:02'),(315,133,'inbound','입고 준비','입고 예정 시간 및 날짜 설정',0,'2025-05-23 05:17:52','2025-05-23 05:17:52'),(316,133,'inbound','입고 준비','입고 일정 스케줄 등록 완료 확인',0,'2025-05-23 05:17:52','2025-05-23 05:17:52'),(317,134,'inbound','입고 준비','계약서 자동 로딩 확인 (바코드 스캔 결과)',1,'2025-05-23 05:17:52','2025-05-23 06:05:45'),(318,134,'inbound','입고 준비','계약서 내용 확인 및 조건 검토',1,'2025-05-23 05:17:52','2025-05-23 06:05:45'),(319,134,'inbound','입고 준비','계약서 승인 처리 (승인 버튼 클릭)',1,'2025-05-23 05:17:52','2025-05-23 06:05:46'),(320,134,'inbound','입고 준비','담당자 확인 및 배정 여부 체크',0,'2025-05-23 05:17:52','2025-05-23 05:17:52'),(321,134,'inbound','입고 준비','입고 예정 시간 및 날짜 설정',0,'2025-05-23 05:17:52','2025-05-23 05:17:52'),(322,134,'inbound','입고 준비','입고 일정 스케줄 등록 완료 확인',0,'2025-05-23 05:17:52','2025-05-23 05:17:52'),(323,135,'inbound','입고 준비','계약서 자동 로딩 확인 (바코드 스캔 결과)',0,'2025-05-23 05:17:52','2025-05-23 05:17:52'),(324,135,'inbound','입고 준비','계약서 내용 확인 및 조건 검토',0,'2025-05-23 05:17:52','2025-05-23 05:17:52'),(325,135,'inbound','입고 준비','계약서 승인 처리 (승인 버튼 클릭)',0,'2025-05-23 05:17:52','2025-05-23 05:17:52'),(326,135,'inbound','입고 준비','담당자 확인 및 배정 여부 체크',0,'2025-05-23 05:17:52','2025-05-23 05:17:52'),(327,135,'inbound','입고 준비','입고 예정 시간 및 날짜 설정',0,'2025-05-23 05:17:52','2025-05-23 05:17:52'),(328,135,'inbound','입고 준비','입고 일정 스케줄 등록 완료 확인',0,'2025-05-23 05:17:52','2025-05-23 05:17:52');
/*!40000 ALTER TABLE `Checklist` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContractForms`
--

LOCK TABLES `ContractForms` WRITE;
/*!40000 ALTER TABLE `ContractForms` DISABLE KEYS */;
INSERT INTO `ContractForms` VALUES (95,98,'fd','fd','fd','2025-04-28 03:50:23','2025-04-28 03:50:23',NULL),(96,99,'fd','fd','fd','2025-04-28 03:50:51','2025-04-28 03:50:51',NULL),(97,100,'fd','fd','fd','2025-04-28 03:51:15','2025-04-28 03:51:15',NULL),(98,101,'fd','fd','fd','2025-04-28 04:58:01','2025-04-28 04:58:01',NULL),(99,102,'dfdf','dfdf','dfdf','2025-04-28 04:58:39','2025-04-28 04:58:39',NULL),(100,103,'fd','fd','df','2025-04-28 04:59:28','2025-04-28 04:59:28',NULL),(101,104,'fd','fd','fd','2025-04-28 04:59:58','2025-04-28 04:59:58',NULL),(102,105,'fd','fd','fd','2025-04-28 05:00:31','2025-04-28 05:00:31',NULL),(103,106,'df','df','df','2025-04-28 05:01:04','2025-04-28 05:01:04',NULL),(104,107,'fd','df','df','2025-04-28 05:03:04','2025-04-28 05:03:04',NULL),(105,108,'fd','fd','fd','2025-04-28 05:03:40','2025-04-28 05:03:40',NULL),(106,109,'fd','df','fd','2025-04-28 05:04:08','2025-04-28 05:04:08',NULL),(107,110,'fd','fd','fd','2025-04-28 05:32:12','2025-04-28 05:32:12',NULL),(108,111,'fd','fd','fd','2025-04-28 05:38:19','2025-04-28 05:38:19',NULL),(109,112,'ㄹㅇ','ㄹㅇ','ㄹㅇ','2025-04-28 05:43:52','2025-04-28 05:43:52',NULL),(110,113,'fd','fd','fd','2025-04-30 00:13:24','2025-04-30 00:13:24',NULL),(111,114,'fd','fd','fd','2025-04-30 00:13:52','2025-04-30 00:13:52',NULL),(112,115,'fd','fd','fd','2025-04-30 00:14:14','2025-04-30 00:14:14',NULL),(113,116,'fd','fd','df','2025-04-30 00:14:35','2025-04-30 00:14:35',NULL),(114,117,'fd','fd','fd','2025-04-30 05:30:29','2025-04-30 05:30:29',NULL),(115,118,'df','df','df','2025-05-14 02:14:11','2025-05-14 02:14:11',NULL),(116,119,'삼성 lg 냉장고','계약 내용','서명자','2025-05-16 01:05:04','2025-05-16 01:05:04',NULL),(117,124,'human 냉장고 계약서','35일동안 슬릇 3개 사용.','관리자','2025-05-21 00:30:08','2025-05-21 00:30:08',NULL),(118,126,'계약합시다','계약','김정훈','2025-05-22 03:36:07','2025-05-22 03:36:07',NULL),(119,127,'DDD','FSFDFSFF','ASFAWEF','2025-05-22 03:37:47','2025-05-22 03:37:47',NULL),(120,128,'ㅁㄴㅇㄻㄴㅇㄻㄴ','ㅁㄴㄹㅈㄷㄹㄹㄷ','ㄷㄹㄷㄹ','2025-05-22 05:22:17','2025-05-22 05:22:17',NULL),(121,129,'ㅁㄴㅇㅎㅇㅎ','ㄴㅇㅀㄴㅇㅎㅇㄹ','ㄴㅇㄷㅎㄱㅎ','2025-05-22 05:35:24','2025-05-22 05:35:24',NULL),(122,130,'ㄴㅇㅁㄻㄴㅇㄻㄴㅇ','ㅈㅁㄹㅈㄷㄹㅈㄹㅈㄷ','ㅈㅂㅈㄹㅈㄹ','2025-05-22 05:52:15','2025-05-22 05:52:15',NULL),(123,131,'123131231','12312321321321321','12312321321312321','2025-05-22 05:59:29','2025-05-22 05:59:29',NULL),(124,132,'vmvmvmvm','fhfhfhfhfh','ekekekekek','2025-05-22 06:31:48','2025-05-22 06:31:48',NULL),(125,133,'123123123213','12312312321213','12312312321321','2025-05-23 04:48:18','2025-05-23 04:48:18',NULL),(126,134,'safsafdf','wefqffqwe','qwefqwefqwef','2025-05-23 04:49:18','2025-05-23 04:49:18',NULL);
/*!40000 ALTER TABLE `ContractForms` ENABLE KEYS */;
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
  `outbound_status` enum('입고완료','출고요청','출고 준비중','출고 준비 완료','배차 완료','출고완료') DEFAULT '입고완료',
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
  `total_cost` decimal(15,2) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cost_difference` decimal(12,2) DEFAULT 0.00,
  `user_id` bigint(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_number` (`product_number`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MainTable`
--

LOCK TABLES `MainTable` WRITE;
/*!40000 ALTER TABLE `MainTable` DISABLE KEYS */;
INSERT INTO `MainTable` VALUES (98,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고','1000',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 A','상온','SLOT-2-0-0','입고 준비','출고요청','2025-04-28',NULL,'2025-04-28','2025-04-29','2025-04-28',1,'/home/wms/work/manager/backend/inbound/barcode/barcode98.png','98',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1000\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-04-29\n                보관기간: 1 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,0.00,'2025-04-28 05:05:07',-10000.00,NULL,'test@example.com'),(99,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고1','1001',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 A','상온','SLOT-1-0-0','입고 완료','출고요청','2025-04-28',NULL,NULL,'2025-05-13','2025-04-28',15,'/home/wms/work/manager/backend/inbound/barcode/barcode99.png','99',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고1\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1001\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/99_inbound.jpg','/images/img_pallet/99_pallet.jpg',0.00,'2025-05-22 01:46:57',-150000.00,NULL,'test@example.com'),(100,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고2','1002',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 A','상온','SLOT-0-0-0','입고 준비','출고요청','2025-04-28',NULL,'2025-04-28','2025-05-13','2025-04-28',15,'/home/wms/work/manager/backend/inbound/barcode/barcode100.png','100',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고2\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1002\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,0.00,'2025-04-28 05:05:11',-150000.00,NULL,'test@example.com'),(101,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고3','1004',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 B','상온','SLOT-2-0-0','입고 완료','출고 준비 완료','2025-04-28',NULL,NULL,'2025-05-13','2025-04-28',15,'/home/wms/work/manager/backend/inbound/barcode/barcode101.png','101',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고3\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1004\n                창고위치: 보관소 B\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/101_inbound.jpg','/images/img_pallet/101_pallet.jpg',0.00,'2025-04-30 00:16:27',0.00,NULL,'test@example.com'),(102,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고4','1005',NULL,'냉장고',1.00,'M',1,1,1,1,15,'보관소 B','상온','SLOT-0-0-0','입고 준비','출고 준비중','2025-04-28',NULL,'2025-04-28','2025-05-13','2025-04-28',15,'/home/wms/work/manager/backend/inbound/barcode/barcode102.png','102',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고4\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1005\n                창고위치: 보관소 B\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: M\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,0.00,'2025-04-28 05:20:04',-225000.00,NULL,'test@example.com'),(103,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고4','1006',NULL,'냉장고',1.00,'M',1,1,1,1,15,'보관소 C','냉장','SLOT-0-0-1','입고 준비','입고완료','2025-04-28',NULL,'2025-04-28','2025-05-13',NULL,15,'/home/wms/work/manager/backend/inbound/barcode/barcode103.png','103',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고4\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1006\n                창고위치: 보관소 C\n                창고타입: 냉장\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: M\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,300000.00,'2025-04-28 05:04:33',0.00,NULL,'test@example.com'),(104,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고5','1007',NULL,'냉장고',1.00,'S',3,1,1,1,15,'보관소 D','상온','SLOT-0-0-0','입고 준비','입고완료','2025-04-28',NULL,'2025-04-28','2025-05-13',NULL,15,'/home/wms/work/manager/backend/inbound/barcode/barcode104.png','104',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고5\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1007\n                창고위치: 보관소 D\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: S\n                팔레트개수: 3 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,450000.00,'2025-04-28 05:04:35',0.00,NULL,'test@example.com'),(105,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고6','1008',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 D','상온','SLOT-1-0-1','입고 준비','입고완료','2025-04-28',NULL,'2025-04-28','2025-05-13',NULL,15,'/home/wms/work/manager/backend/inbound/barcode/barcode105.png','105',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고6\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1008\n                창고위치: 보관소 D\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,150000.00,'2025-04-28 05:04:37',0.00,NULL,'test@example.com'),(106,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고6','1009',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 D','상온','SLOT-1-0-0','입고 준비','입고완료','2025-04-28',NULL,'2025-04-28','2025-05-13',NULL,15,'/home/wms/work/manager/backend/inbound/barcode/barcode106.png','106',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고6\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1009\n                창고위치: 보관소 D\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,150000.00,'2025-04-28 05:04:40',0.00,NULL,'test@example.com'),(107,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고7','1010',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 E','상온','SLOT-2-0-0','입고 준비','입고완료','2025-04-28',NULL,'2025-04-28','2025-05-13',NULL,15,'/home/wms/work/manager/backend/inbound/barcode/barcode107.png','107',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고7\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1010\n                창고위치: 보관소 E\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,150000.00,'2025-04-28 05:04:42',0.00,NULL,'test@example.com'),(108,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고8','1011',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 G','상온','SLOT-2-0-0','입고 준비','입고완료','2025-04-28',NULL,'2025-04-28','2025-05-13',NULL,15,'/home/wms/work/manager/backend/inbound/barcode/barcode108.png','108',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고8\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1011\n                창고위치: 보관소 G\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,150000.00,'2025-04-28 05:04:45',0.00,NULL,'test@example.com'),(109,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고9','1012',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 I','냉동','SLOT-2-0-0','입고 완료','입고완료','2025-04-28',NULL,NULL,'2025-05-13',NULL,15,'/home/wms/work/manager/backend/inbound/barcode/barcode109.png','109',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고9\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1012\n                창고위치: 보관소 I\n                창고타입: 냉동\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/109_inbound.jpg','/images/img_pallet/109_pallet.jpg',375000.00,'2025-04-29 02:07:41',0.00,NULL,'test@example.com'),(110,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고','1030',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 A','상온','SLOT-2-0-2','입고 완료','입고완료','2025-04-28',NULL,NULL,'2025-04-29',NULL,1,'/home/wms/work/manager/backend/inbound/barcode/barcode110.png','110',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1030\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-04-29\n                보관기간: 1 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/110_inbound.jpg','/images/img_pallet/110_pallet.jpg',10000.00,'2025-04-29 09:00:21',0.00,NULL,'test@example.com'),(111,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고1','1040',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 A','상온','SLOT-2-0-1','입고 완료','출고 준비중','2025-04-28',NULL,'2025-04-28','2025-05-13','2025-04-30',15,'/home/wms/work/manager/backend/inbound/barcode/barcode111.png','111',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고1\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1040\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,20000.00,'2025-05-16 01:53:07',-130000.00,NULL,'test@example.com'),(112,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고','1055',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 A','냉장','SLOT-2-0-3','입고 중','출고요청','2025-04-28',NULL,'2025-04-28','2025-04-29','2025-04-30',1,'/home/wms/work/manager/backend/inbound/barcode/barcode112.png','112',NULL,NULL,'\n                발행일: 2025. 4. 28.\n                회사명: 삼성\n                상품명: lg냉장고\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 1055\n                창고위치: 보관소 A\n                창고타입: 냉장\n                입고일: 2025-04-28\n                출고일: 2025-04-29\n                보관기간: 1 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,30000.00,'2025-05-14 02:20:13',15000.00,NULL,'test@example.com'),(113,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고','2000',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 A','상온','SLOT-2-1-1','입고 완료','출고요청','2025-04-30',NULL,NULL,'2025-05-20','2025-04-30',20,'/home/wms/work/manager/backend/inbound/barcode/barcode113.png','113',NULL,NULL,'\n                발행일: 2025. 4. 30.\n                회사명: 삼성\n                상품명: lg냉장고\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 2000\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-04-30\n                출고일: 2025-05-20\n                보관기간: 20 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/113_inbound.jpg','/images/img_pallet/113_pallet.jpg',0.00,'2025-04-30 05:43:17',-200000.00,NULL,'test@example.com'),(114,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고1','2001',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 B','상온','SLOT-1-0-0','입고 준비','출고요청','2025-04-30',NULL,'2025-04-30','2025-05-20','2025-04-30',20,'/home/wms/work/manager/backend/inbound/barcode/barcode114.png','114',NULL,NULL,'\n                발행일: 2025. 4. 30.\n                회사명: 삼성\n                상품명: lg냉장고1\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 2001\n                창고위치: 보관소 B\n                창고타입: 상온\n                입고일: 2025-04-30\n                출고일: 2025-05-20\n                보관기간: 20 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,0.00,'2025-04-30 00:15:14',-200000.00,NULL,'test@example.com'),(115,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고2','2002',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 C','상온','SLOT-2-0-0','입고 완료','출고요청','2025-04-30',NULL,NULL,'2025-05-20','2025-04-30',20,'/home/wms/work/manager/backend/inbound/barcode/barcode115.png','115',NULL,NULL,'\n                발행일: 2025. 4. 30.\n                회사명: 삼성\n                상품명: lg냉장고2\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 2002\n                창고위치: 보관소 C\n                창고타입: 상온\n                입고일: 2025-04-30\n                출고일: 2025-05-20\n                보관기간: 20 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/115_inbound.jpg','/images/img_pallet/115_pallet.jpg',0.00,'2025-04-30 01:18:26',-200000.00,NULL,'test@example.com'),(116,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고3','2003',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 D','상온','SLOT-2-0-0','입고 완료','출고요청','2025-04-30',NULL,NULL,'2025-05-20','2025-04-30',20,'/home/wms/work/manager/backend/inbound/barcode/barcode116.png','116',NULL,NULL,'\n                발행일: 2025. 4. 30.\n                회사명: 삼성\n                상품명: lg냉장고3\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 2003\n                창고위치: 보관소 D\n                창고타입: 상온\n                입고일: 2025-04-30\n                출고일: 2025-05-20\n                보관기간: 20 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/116_inbound.jpg','/images/img_pallet/116_pallet.jpg',0.00,'2025-05-22 01:04:14',-200000.00,NULL,'test@example.com'),(117,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고','2005',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 B','상온','SLOT-2-0-2','입고 완료','출고 준비중','2025-04-30',NULL,NULL,'2025-05-20','2025-04-30',20,'/home/wms/work/manager/backend/inbound/barcode/barcode117.png','117',NULL,NULL,'\n                발행일: 2025. 4. 30.\n                회사명: 삼성\n                상품명: lg냉장고\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 2005\n                창고위치: 보관소 B\n                창고타입: 상온\n                입고일: 2025-04-30\n                출고일: 2025-05-20\n                보관기간: 20 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/117_inbound.jpg','/images/img_pallet/117_pallet.jpg',0.00,'2025-05-12 07:27:26',-200000.00,NULL,'test@example.com'),(118,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고','7000',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 A','상온','SLOT-1-0-1','입고 준비','입고완료','2025-05-14',NULL,'2025-05-14','2025-06-03',NULL,20,'/home/wms/work/manager/backend/inbound/barcode/barcode118.png','118',NULL,NULL,'\n                발행일: 2025. 5. 14.\n                회사명: 삼성\n                상품명: lg냉장고\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 7000\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-05-14\n                출고일: 2025-06-03\n                보관기간: 20 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,200000.00,'2025-05-14 02:14:20',0.00,NULL,'test@example.com'),(119,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고1','7002',NULL,'냉장고',1.00,'S',1,1,1,1,15,'보관소 A','상온','SLOT-1-0-3','입고 대기','출고 준비중','2025-05-16',NULL,'2025-04-28','2025-05-13','2025-05-16',15,'/home/wms/work/manager/backend/inbound/barcode/barcode119.png','119',NULL,NULL,'\n                발행일: 2025. 5. 16.\n                회사명: 삼성\n                상품명: lg냉장고1\n                입고수량: 15 개\n                무게: 1.00 kg\n                제품번호: 7002\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-04-28\n                출고일: 2025-05-13\n                보관기간: 15 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,180000.00,'2025-05-16 01:49:18',30000.00,NULL,'test@example.com'),(120,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고',NULL,NULL,'냉장고',1.00,'S',0,1,1,1,15,NULL,'상온',NULL,'입고 준비','입고완료',NULL,NULL,'2025-04-28','2025-04-29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-05-21 00:11:32',0.00,NULL,'test@example.com'),(121,'삼성','선하','01000000000','삼성로 8가 13','lg냉장고3',NULL,NULL,'냉장고',1.00,'S',0,1,1,1,15,NULL,'상온',NULL,'입고 준비','입고완료',NULL,NULL,'2025-05-21','2025-05-13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-05-21 00:14:03',0.00,NULL,'test@example.com'),(124,'human','human','01000000000','human','냉장고001','7005',NULL,'냉장고',500.00,'M',2,100,100,100,3,'보관소 A','상온','SLOT-2-0-4','입고 완료','출고 준비 완료','2025-05-21',NULL,'2025-05-21','2025-06-25','2025-05-21',35,'/home/wms/work/manager/backend/inbound/barcode/barcode124.png','124',NULL,NULL,'\n                발행일: 2025. 5. 21.\n                회사명: human\n                상품명: 냉장고001\n                입고수량: 3 개\n                무게: 500.00 kg\n                제품번호: 7005\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-05-21\n                출고일: 2025-06-25\n                보관기간: 35 일\n                팔레트크기: M\n                팔레트개수: 2 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/124_inbound.jpg','/images/img_pallet/124_pallet.jpg',0.00,'2025-05-21 01:29:03',-1050000.00,NULL,'human@human.com'),(125,'human','human','01000000000','human','맥북',NULL,NULL,'전자제품',3.00,'S',0,800,400,30,10,NULL,'상온',NULL,'입고 준비','입고완료','2025-05-22',NULL,'2025-05-22','2025-05-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-05-22 03:30:47',0.00,NULL,'human@human.com'),(126,'human','human','01000000000','human','맥북','PRD-1234',NULL,'전자제품',3.00,'M',1,800,400,30,10,'보관소 A','상온','SLOT-0-2-0','입고 준비','출고요청','2025-05-22',NULL,'2025-05-22','2025-05-23','2025-05-22',1,'/home/wms/work/manager/backend/inbound/barcode/barcode126.png','126',NULL,NULL,'\n                발행일: 2025. 5. 22.\n                회사명: human\n                상품명: 맥북\n                입고수량: 10 개\n                무게: 3.00 kg\n                제품번호: PRD-1234\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-05-22\n                출고일: 2025-05-23\n                보관기간: 1 일\n                팔레트크기: M\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,0.00,'2025-05-22 05:18:19',-15000.00,NULL,'human@human.com'),(127,'human','human','01000000000','human','맥북m4','PRD-123123123',NULL,'전자제품',3.00,'M',1,800,400,30,10,'보관소 D','상온','SLOT-1-0-4','입고 완료','입고완료','2025-05-22',NULL,NULL,'2025-05-23',NULL,1,'/home/wms/work/manager/backend/inbound/barcode/barcode127.png','127',NULL,NULL,'\n                발행일: 2025. 5. 22.\n                회사명: human\n                상품명: 맥북m4\n                입고수량: 10 개\n                무게: 3.00 kg\n                제품번호: PRD-123123123\n                창고위치: 보관소 D\n                창고타입: 상온\n                입고일: 2025-05-22\n                출고일: 2025-05-23\n                보관기간: 1 일\n                팔레트크기: M\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/127_inbound.jpg','/images/img_pallet/127_pallet.jpg',15000.00,'2025-05-22 03:51:17',0.00,NULL,'human@human.com'),(128,'human','human','01000000000','human','맥북프로5','7007',NULL,'가전제품',1.00,'M',1,1200,100,100,1,'보관소 A','상온','SLOT-2-2-1','입고 완료','입고완료','2025-05-22',NULL,NULL,'2025-05-23',NULL,1,'/home/wms/work/manager/backend/inbound/barcode/barcode128.png','128',NULL,NULL,'\n                발행일: 2025. 5. 22.\n                회사명: human\n                상품명: 맥북프로5\n                입고수량: 1 개\n                무게: 1.00 kg\n                제품번호: 7007\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-05-22\n                출고일: 2025-05-23\n                보관기간: 1 일\n                팔레트크기: M\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/128_inbound.jpg','/images/img_pallet/128_pallet.jpg',15000.00,'2025-05-22 05:24:44',0.00,NULL,'human@human.com'),(129,'human','human','01000000000','human','맥북프로51','7008',NULL,'가전제품',1.00,'S',1,1200,100,100,1,'보관소 A','상온','SLOT-2-1-2','입고 완료','입고완료','2025-05-22',NULL,NULL,'2025-05-23',NULL,1,'/home/wms/work/manager/backend/inbound/barcode/barcode129.png','129',NULL,NULL,'\n                발행일: 2025. 5. 22.\n                회사명: human\n                상품명: 맥북프로51\n                입고수량: 1 개\n                무게: 1.00 kg\n                제품번호: 7008\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-05-22\n                출고일: 2025-05-23\n                보관기간: 1 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/129_inbound.jpg','/images/img_pallet/129_pallet.jpg',10000.00,'2025-05-22 05:38:01',0.00,NULL,'human@human.com'),(130,'human','human','01000000000','human','맥북프로52','7777777777777',NULL,'가전제품',1.00,'S',1,1200,100,100,1,'보관소 A','상온','SLOT-1-2-3','입고 대기','입고완료','2025-05-22',NULL,'2025-05-22','2025-05-23',NULL,1,'/home/wms/work/manager/backend/inbound/barcode/barcode130.png','130',NULL,NULL,'\n                발행일: 2025. 5. 22.\n                회사명: human\n                상품명: 맥북프로52\n                입고수량: 1 개\n                무게: 1.00 kg\n                제품번호: 7777777777777\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-05-22\n                출고일: 2025-05-23\n                보관기간: 1 일\n                팔레트크기: S\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,10000.00,'2025-05-22 05:55:08',0.00,NULL,'human@human.com'),(131,'human','human','01000000000','human','맥북프로53','123123123123',NULL,'가전제품',1.00,'M',1,1200,100,100,1,'보관소 A','상온','SLOT-1-1-1','입고 완료','출고완료','2025-05-22',NULL,'2025-05-22','2025-05-23','2025-05-22',1,'/home/wms/work/manager/backend/inbound/barcode/barcode131.png','131',NULL,NULL,'\n                발행일: 2025. 5. 22.\n                회사명: human\n                상품명: 맥북프로53\n                입고수량: 1 개\n                무게: 1.00 kg\n                제품번호: 123123123123\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-05-22\n                출고일: 2025-05-23\n                보관기간: 1 일\n                팔레트크기: M\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/131_inbound.jpg','/images/img_pallet/131_pallet.jpg',0.00,'2025-05-22 06:28:22',-15000.00,NULL,'human@human.com'),(132,'human','human','01000000000','human','맥북프로6','7009',NULL,'가전제품',1.00,'M',1,1200,100,100,1,'보관소 B','상온','SLOT-1-2-4','입고 완료','출고완료','2025-05-22',NULL,'2025-05-22','2025-05-23','2025-05-22',1,'/home/wms/work/manager/backend/inbound/barcode/barcode132.png','132',NULL,NULL,'\n                발행일: 2025. 5. 22.\n                회사명: human\n                상품명: 맥북프로6\n                입고수량: 1 개\n                무게: 1.00 kg\n                제품번호: 7009\n                창고위치: 보관소 B\n                창고타입: 상온\n                입고일: 2025-05-22\n                출고일: 2025-05-23\n                보관기간: 1 일\n                팔레트크기: M\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/132_inbound.jpg','/images/img_pallet/132_pallet.jpg',0.00,'2025-05-22 06:35:15',-15000.00,NULL,'human@human.com'),(133,'human','human','01000000000','human','MarBookPro1','12345678901234',NULL,'가전제품',1.00,'M',1,1200,100,100,1,'보관소 A','상온','SLOT-0-1-3','입고 완료','출고완료','2025-05-23',NULL,'2025-05-23','2025-05-23','2025-05-23',0,'/home/wms/work/manager/backend/inbound/barcode/barcode133.png','133',NULL,NULL,'\n                발행일: 2025. 5. 23.\n                회사명: human\n                상품명: MarBookPro1\n                입고수량: 1 개\n                무게: 1.00 kg\n                제품번호: 12345678901234\n                창고위치: 보관소 A\n                창고타입: 상온\n                입고일: 2025-05-23\n                출고일: 2025-05-23\n                보관기간: 0 일\n                팔레트크기: M\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,'/images/img_inbound/133_inbound.jpg','/images/img_pallet/133_pallet.jpg',0.00,'2025-05-23 06:05:10',0.00,NULL,'human@human.com'),(134,'human','human','01000000000','human','MarBookPro2','9876543210',NULL,'가전제품',1.00,'M',1,1200,100,100,1,'보관소 D','상온','SLOT-2-0-4','입고 준비','입고완료','2025-05-23',NULL,'2025-05-23','2025-05-23',NULL,0,'/home/wms/work/manager/backend/inbound/barcode/barcode134.png','134',NULL,NULL,'\n                발행일: 2025. 5. 23.\n                회사명: human\n                상품명: MarBookPro2\n                입고수량: 1 개\n                무게: 1.00 kg\n                제품번호: 9876543210\n                창고위치: 보관소 D\n                창고타입: 상온\n                입고일: 2025-05-23\n                출고일: 2025-05-23\n                보관기간: 0 일\n                팔레트크기: M\n                팔레트개수: 1 개\n                총비용: undefined 원\n                ',NULL,NULL,NULL,0.00,'2025-05-23 04:49:45',0.00,NULL,'human@human.com'),(135,'human','human','01000000000','human','MarBookPro3',NULL,NULL,'가전제품',1.00,'S',0,1200,100,100,1,NULL,'상온',NULL,'입고 준비','입고완료',NULL,NULL,'2025-05-23','2025-05-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-05-23 04:46:26',0.00,NULL,'human@human.com');
/*!40000 ALTER TABLE `MainTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OutboundRequestTable`
--

DROP TABLE IF EXISTS `OutboundRequestTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OutboundRequestTable` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `contact_phone` varchar(50) NOT NULL,
  `inbound_quantity` int(11) DEFAULT 0,
  `warehouse_location` varchar(255) DEFAULT NULL,
  `warehouse_type` enum('냉장','냉동','상온') NOT NULL,
  `outbound_status` enum('입고완료','출고요청','출고 준비중','출고 준비 완료','배차 완료','출고완료') DEFAULT '입고완료',
  `outbound_date` date DEFAULT NULL,
  `last_outbound_date` date DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `pallet_size` enum('S','M','L') DEFAULT NULL,
  `pallet_num` int(11) DEFAULT NULL,
  `width_size` int(11) DEFAULT NULL,
  `length_size` int(11) DEFAULT NULL,
  `height_size` int(11) DEFAULT NULL,
  `barcode_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OutboundRequestTable`
--

LOCK TABLES `OutboundRequestTable` WRITE;
/*!40000 ALTER TABLE `OutboundRequestTable` DISABLE KEYS */;
INSERT INTO `OutboundRequestTable` VALUES (1,'ABC 물류','전자제품','010-1234-5678',100,'서울 창고 A','상온','배차 완료','2023-12-30','2023-12-30','서울특별시 강남구 테헤란로 10길 20','L',2,50,30,10,NULL),(2,'XYZ 물류','의류','010-2345-6789',200,'부산 창고 B','냉장','배차 완료','2023-12-10','2023-12-11','부산광역시 해운대구 우동 123-45','L',20,60,40,20,NULL),(4,'JKL 물류','가구','010-4567-8901',300,'대구 창고 D','냉동','출고 준비 완료','2023-12-14','2025-04-15','대구광역시 동구 동촌로 25길 15','L',30,120,60,80,NULL),(5,'OPQ 물류','도서','010-5678-9012',150,'광주 창고 E','냉장','출고 준비 완료','2023-11-30','2023-12-01','광주광역시 북구 북문대로 50길 5','M',15,80,50,30,'BC24680'),(6,'럭키','ㄴㅇㄹㄴㄹ','0123456789',10,'광주 창고 F','상온','출고 준비 완료','2025-01-31',NULL,NULL,'L',3,100,100,100,NULL),(7,'정훈컴퍼니','ㄴㅇㄹㄴㄹ','12341234',10,NULL,'냉장','출고 준비 완료','2025-01-31',NULL,NULL,'S',0,100,100,100,NULL),(9,'ddd','asdf','12341234',11,'ㅉㅈㄷㄱㄷㄹㄷㄹ','상온','출고 준비 완료','2025-04-04',NULL,NULL,'L',6,111111,11111,11,NULL),(10,'ㄹㄹㄹㄹㄹㄹ','ㅁ','123123123',100,'f','상온','출고 준비 완료','2025-04-05',NULL,NULL,'S',1,1200,100,2400,NULL),(11,'휴먼','lg냉장고','01000000000',30,'z','상온','출고 준비 완료','2025-04-07',NULL,NULL,'S',1,50,30,500,NULL),(12,'박선하','lg프로젝터','01000000000',15,'ㅇㅇ','상온','출고 준비 완료','2025-04-08',NULL,NULL,'S',2,50,30,500,NULL),(18,'휴먼','컴퓨터1','01000000000',1,'z','상온','출고 준비중','2025-04-09','2025-04-15',NULL,'S',2,1,1,1,NULL),(20,'휴먼','컴퓨터3','01000000000',1,'z','상온','출고 준비 완료','2025-04-09','2025-04-15',NULL,'S',2,1,1,1,NULL),(22,'휴먼','컴퓨터5','01000000000',1,'z','상온','출고 준비 완료','2025-04-09',NULL,NULL,'S',2,1,1,1,NULL),(24,'휴먼','냉장고5','01000000000',1,'z','상온','출고 준비중','2025-04-09',NULL,NULL,'S',1,1,1,1,NULL),(25,'휴먼','냉장고1','01000000000',1,'z','상온','출고 준비중','2025-04-09',NULL,NULL,'S',1,1,1,1,NULL),(26,'휴먼','냉장고2','01000000000',1,'z','상온','출고 준비중','2025-04-09',NULL,NULL,'S',1,1,1,1,NULL),(27,'휴먼','냉장고3','01000000000',1,'z','상온','출고 준비중','2025-04-09',NULL,NULL,'S',1,1,1,1,NULL),(28,'휴먼','냉장고4','01000000000',1,'x','상온','출고 준비중','2025-04-09',NULL,NULL,'S',1,1,1,1,NULL),(29,'휴먼','냉장고6','01000000000',1,'x','상온','출고 준비중','2025-04-09',NULL,NULL,'S',1,1,1,1,NULL),(32,'휴먼','냉장고9','01000000000',1,'x','상온','출고 준비중','2025-04-09',NULL,NULL,'S',1,1,1,1,NULL),(33,'휴먼','냉장고10','01000000000',1,'x','냉장','출고요청','2025-04-09',NULL,NULL,'S',1,1,1,1,NULL),(34,'휴먼','핸드폰1','01000000000',1,'x','상온','출고요청','2025-04-10',NULL,NULL,'S',2,1,1,1,NULL),(35,'휴먼','핸드폰2','01000000000',1,'x','냉장','출고 준비중','2025-04-10',NULL,NULL,'S',1,1,1,1,NULL),(36,'휴먼','핸드폰3','01000000000',1,'x','상온','출고요청','2025-04-10',NULL,NULL,'S',-2,1,1,1,NULL),(37,'휴먼','핸드폰4','01000000000',1,'x','상온','출고요청','2025-04-10',NULL,NULL,'S',1,1,1,1,NULL),(38,'휴먼','핸드폰5','01000000000',1,'x','상온','출고요청','2025-04-10',NULL,NULL,'S',2,1,1,1,NULL),(39,'휴먼','핸드폰6','01000000000',1,'x','상온','출고요청','2025-04-10',NULL,NULL,'S',2,1,1,1,NULL),(40,'휴먼','핸드폰7','01000000000',1,'x','상온','출고요청','2025-04-10',NULL,NULL,'S',2,1,1,1,NULL),(41,'휴먼','핸드폰8','01000000000',1,'x','상온','출고요청','2025-04-10',NULL,NULL,'S',1,1,1,1,NULL),(42,'휴먼','핸드폰9','01000000000',1,'x','상온','출고요청','2025-04-10',NULL,NULL,'S',2,1,1,1,NULL),(43,'휴먼','핸드폰10','01000000000',1,'x','상온','출고요청','2025-04-10',NULL,NULL,'S',1,1,1,1,NULL),(44,'휴먼','텀블러1','01000000000',1,'ㅋ','상온','출고요청','2025-04-11','2025-04-15',NULL,'S',2,1,1,1,NULL),(45,'휴먼','텀블러2','01000000000',1,'ㅋ','상온','출고요청','2025-04-11','2025-04-15',NULL,'S',2,1,1,1,NULL),(46,'ㅇㅇ','ㅇㅇ','01000000000',1,'ㄹㅇ','상온','출고요청','2025-04-11','2025-04-15',NULL,'S',1,1,1,1,NULL),(47,'ㅇㅇ','ㅇㅇ1','01000000000',1,'2','상온','출고요청','2025-04-11','2025-04-15',NULL,'S',1,1,1,1,NULL),(48,'ㅇㅇ','ㅇㅇ2','01000000000',1,'ㅋ','상온','출고요청','2025-04-11','2025-04-15',NULL,'S',2,1,1,1,NULL),(50,'ㅇㅇ','ㅇㅇ4','01000000000',1,'ㅇㅇ','상온','출고요청','2025-04-11',NULL,NULL,'S',1,1,1,1,NULL),(51,'ㅇㅇ','ㅇㅇ3','01000000000',1,'ㅇㅇ','상온','출고요청','2025-04-11',NULL,NULL,'S',2,1,1,1,NULL),(56,'휴먼','헤드폰5','01000000000',1,'ㅋㅋ','상온','출고요청','2025-04-14',NULL,NULL,'S',1,1,1,1,NULL),(57,'휴먼','헤드폰7','01000000000',1,'ㅋ','상온','출고요청','2025-04-14',NULL,NULL,'S',1,1,1,1,NULL),(58,'휴먼','컴퓨터9','01000000000',1,'1','상온','출고요청','2025-04-14','2025-04-15',NULL,'S',1,1,1,1,NULL),(59,'휴먼','lg냉장고','01000000000',1,'보관소 A','상온','출고완료','2025-04-14','2025-04-15',NULL,'S',1,1,1,1,NULL),(60,'휴먼','lg냉장고','01000000000',1,'보관소 A','상온','출고요청','2025-04-14','2025-04-15',NULL,'S',1,1,1,1,NULL),(61,'휴먼','lg냉장고3','01000000000',1,'보관소 B','상온','출고요청','2025-04-15','2025-04-15',NULL,'S',2,1,1,1,NULL),(62,'휴먼','lg냉장고4','01000000000',1,'보관소 B','상온','출고요청','2025-04-15','2025-04-15',NULL,'S',1,1,1,1,NULL),(63,'휴먼','lg냉장고5','01000000000',1,'보관소 C','상온','출고요청','2025-04-15','2025-04-15',NULL,'S',2,1,1,1,NULL),(64,'휴먼','핸드크림1','01000000000',1,'보관소 A','상온','출고요청','2025-04-15','2025-04-15',NULL,'S',1,1,1,1,NULL),(65,'휴먼','핸드크림2','01000000000',1,'보관소 A','상온','출고요청','2025-04-15','2025-04-15',NULL,'S',2,1,1,1,NULL),(66,'휴먼','핸드크림3','01000000000',1,'보관소 A','상온','출고요청','2025-04-15','2025-04-15',NULL,'S',2,1,1,1,NULL),(67,'휴먼','핸드크림5','01000000000',1,'보관소 A','상온','출고요청','2025-04-15','2025-04-15',NULL,'S',1,1,1,1,NULL),(68,'휴먼','lg냉장고','01000000000',1,'보관소 A','상온','출고요청','2025-04-15','2025-04-15',NULL,'S',2,1,1,1,NULL),(69,'휴먼','lg냉장고','01000000000',1,'보관소 C','상온','출고요청','2025-04-16','2025-04-15',NULL,'S',2,1,1,1,NULL),(70,'휴먼','lg냉장고','01000000000',1,'보관소 A','상온','출고요청','2025-04-17','2025-04-15',NULL,'S',1,1,1,1,NULL),(71,'휴먼','lg냉장고','01000000000',1,'보관소 C','상온','출고요청','2025-04-19','2025-04-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,'휴먼','lg냉장고','01000000000',1,'보관소 B','상온','출고요청','2025-04-19','2025-04-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,'휴먼','필통1','01000000000',1,'보관소 C','상온','출고요청','2025-04-18','2025-04-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,'휴먼','필통2','01000000000',1,'보관소 C','상온','출고요청','2025-04-18','2025-04-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,'휴먼','립밤1','01000000000',1,'보관소 A','상온','출고요청','2025-04-17','2025-04-17',NULL,'S',2,1,1,1,'75'),(76,'휴먼','립밤2','01000000000',1,'보관소 B','상온','출고요청','2025-04-18','2025-04-17',NULL,'S',1,1,1,1,'76'),(77,'휴먼','립밤3','01000000000',1,'보관소 B','상온','출고완료','2025-04-18','2025-04-17',NULL,'S',1,1,1,1,'77'),(78,'휴먼','립밤5','01000000000',1,'보관소 B','상온','출고완료','2025-04-17','2025-04-17',NULL,'S',3,1,1,1,'78'),(80,'테스트 주식회사','테스트상품','010-1234-5678',200,'B-01','상온','출고요청',NULL,NULL,NULL,'M',2,100,80,50,'TESTBC-0421'),(81,'삼성','필통2','01000000000',1,NULL,'상온','출고요청','2025-04-21',NULL,'삼성로 8가 13','S',0,1,1,1,NULL),(83,'삼성','필통6','01000000000',1,'보관소 C','상온','출고요청','2025-05-02','2025-04-23','삼성로 8가 13','S',1,1,1,1,'83'),(85,'삼성','필통7','01000000000',1,'보관소 B','상온','출고요청','2025-04-18','2025-04-23','삼성로 8가 13','S',1,1,1,1,'85'),(86,'삼성','필통10','01000000000',1,'보관소 B','상온','출고요청','2025-04-18','2025-04-23','삼성로 8가 13','S',1,1,1,1,'86'),(87,'삼성','필통11','01000000000',1,'보관소 B','상온','출고요청','2025-05-02','2025-04-23','삼성로 8가 13','S',1,1,1,1,'87'),(88,'삼성','필통13','01000000000',1,'보관소 B','상온','출고요청','2025-05-02','2025-04-23','삼성로 8가 13','S',1,1,1,1,NULL),(89,'삼성','냉장고5','01000000000',1,'보관소 B','상온','출고요청','2025-05-07','2025-04-23','삼성로 8가 13','S',1,1,1,1,'89'),(98,'삼성','lg냉장고','01000000000',15,'보관소 A','상온','출고요청','2025-04-29','2025-04-28','삼성로 8가 13','S',1,1,1,1,'98'),(99,'삼성','lg냉장고1','01000000000',15,'보관소 A','상온','출고요청','2025-05-13','2025-04-28','삼성로 8가 13','S',1,1,1,1,'99'),(100,'삼성','lg냉장고2','01000000000',15,'보관소 A','상온','출고요청','2025-05-13','2025-04-28','삼성로 8가 13','S',1,1,1,1,'100'),(101,'삼성','lg냉장고3','01000000000',15,'보관소 B','상온','출고 준비 완료','2025-05-13','2025-04-28','삼성로 8가 13','S',1,1,1,1,'101'),(102,'삼성','lg냉장고4','01000000000',15,'보관소 B','상온','출고 준비중','2025-05-13','2025-04-28','삼성로 8가 13','M',1,1,1,1,'102'),(111,'삼성','lg냉장고1','01000000000',15,'보관소 A','상온','출고 준비중','2025-05-13','2025-04-30','삼성로 8가 13','S',1,1,1,1,'111'),(112,'삼성','lg냉장고','01000000000',15,'보관소 A','냉장','출고요청','2025-04-29','2025-04-30','삼성로 8가 13','S',1,1,1,1,'112'),(113,'삼성','lg냉장고','01000000000',15,'보관소 A','상온','출고요청','2025-05-20','2025-04-30','삼성로 8가 13','S',1,1,1,1,'113'),(114,'삼성','lg냉장고1','01000000000',15,'보관소 B','상온','출고요청','2025-05-20','2025-04-30','삼성로 8가 13','S',1,1,1,1,'114'),(115,'삼성','lg냉장고2','01000000000',15,'보관소 C','상온','출고요청','2025-05-20','2025-04-30','삼성로 8가 13','S',1,1,1,1,'115'),(116,'삼성','lg냉장고3','01000000000',15,'보관소 D','상온','출고요청','2025-05-20','2025-04-30','삼성로 8가 13','S',1,1,1,1,'116'),(117,'삼성','lg냉장고','01000000000',15,'보관소 B','상온','출고 준비중','2025-05-20','2025-04-30','삼성로 8가 13','S',1,1,1,1,'117'),(119,'삼성','lg냉장고1','01000000000',15,'보관소 A','상온','출고 준비중','2025-05-13','2025-05-16','삼성로 8가 13','S',1,1,1,1,'119'),(124,'human','냉장고001','01000000000',3,'보관소 A','상온','출고 준비 완료','2025-06-25','2025-05-21','human','M',2,100,100,100,'124'),(126,'human','맥북','01000000000',10,'보관소 A','상온','출고 준비 완료','2025-05-23','2025-05-22','human','M',1,800,400,30,'126'),(131,'human','맥북프로53','01000000000',1,'보관소 A','상온','출고요청','2025-05-23','2025-05-22','human','M',1,1200,100,100,'131'),(132,'human','맥북프로6','01000000000',1,'보관소 B','상온','출고요청','2025-05-23','2025-05-22','human','M',1,1200,100,100,'132');
/*!40000 ALTER TABLE `OutboundRequestTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sm_Phone_Inbound`
--

DROP TABLE IF EXISTS `Sm_Phone_Inbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sm_Phone_Inbound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_number` varchar(100) NOT NULL,
  `inbound_quantity` int(11) NOT NULL,
  `warehouse_type` varchar(100) NOT NULL,
  `warehouse_location` varchar(255) NOT NULL,
  `pallet_size` varchar(50) DEFAULT NULL,
  `pallet_num` int(11) DEFAULT NULL,
  `barcode_num` varchar(255) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `inbound_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sm_Phone_Inbound`
--

LOCK TABLES `Sm_Phone_Inbound` WRITE;
/*!40000 ALTER TABLE `Sm_Phone_Inbound` DISABLE KEYS */;
INSERT INTO `Sm_Phone_Inbound` VALUES (1,'ㄹㄹㄹㄹㄹㄹ','ㅁ','43',100,'상온','f','S',1,'CONTRACT010','/home/wms/work/manager/backend/inbound/barcode/barcode10.png','입고 준비','2025-04-07 07:22:29'),(2,'휴먼','lg냉장고','123',30,'상온','z','S',1,'CONTRACT011','/home/wms/work/manager/backend/inbound/barcode/barcode11.png','입고 준비','2025-04-07 07:22:29'),(3,'ddd','asdf','ㅁㄴㅇㄹㅁㄴㄹㅁㄴㅇㄹ',11,'상온','ㅉㅈㄷㄱㄷㄹㄷㄹ','L',6,'CONTRACT009','/home/wms/work/manager/backend/inbound/barcode/barcode9.png','입고 준비','2025-04-07 08:42:04'),(4,'박선하','lg프로젝터','32',15,'상온','ㅇㅇ','S',2,'CONTRACT012','/home/wms/work/manager/backend/inbound/barcode/barcode12.png','입고 준비','2025-04-08 05:29:29'),(5,'박선하','선하컴퓨터','1',1,'상온','d','S',1,'CONTRACT013','/home/wms/work/manager/backend/inbound/barcode/barcode13.png','입고 준비','2025-04-08 06:53:21'),(6,'박선하','samsung티비','66',30,'상온','d','S',2,'CONTRACT015','/home/wms/work/manager/backend/inbound/barcode/barcode15.png','입고 준비','2025-04-08 07:53:05'),(7,'휴먼','컴퓨터4','4',1,'상온','z','S',2,'CONTRACT021','/home/wms/work/manager/backend/inbound/barcode/barcode21.png','입고 준비','2025-04-09 03:43:51'),(8,'휴먼','컴퓨터3','3',1,'상온','z','S',2,'CONTRACT020','/home/wms/work/manager/backend/inbound/barcode/barcode20.png','입고 준비','2025-04-09 03:43:51');
/*!40000 ALTER TABLE `Sm_Phone_Inbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sm_Phone_Outbound`
--

DROP TABLE IF EXISTS `Sm_Phone_Outbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sm_Phone_Outbound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_number` varchar(100) NOT NULL,
  `warehouse_type` varchar(100) NOT NULL,
  `warehouse_location` varchar(255) NOT NULL,
  `pallet_size` varchar(50) DEFAULT NULL,
  `pallet_num` int(11) DEFAULT NULL,
  `barcode_num` varchar(255) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `outbound_status` varchar(50) NOT NULL,
  `outbound_date` date DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sm_Phone_Outbound`
--

LOCK TABLES `Sm_Phone_Outbound` WRITE;
/*!40000 ALTER TABLE `Sm_Phone_Outbound` DISABLE KEYS */;
INSERT INTO `Sm_Phone_Outbound` VALUES (1,'박선하','lg티비','77','상온','hg','S',2,'CONTRACT014','/home/wms/work/manager/backend/inbound/barcode/barcode14.png','출고요청','2025-04-08',NULL,'2025-04-08 08:17:07','2025-04-08 08:17:07'),(2,'박선하','apple티비','44','상온','dd','S',1,'CONTRACT016','/home/wms/work/manager/backend/inbound/barcode/barcode16.png','출고요청','2025-04-08',NULL,'2025-04-08 08:23:09','2025-04-08 08:23:09'),(3,'ㅇㅇ','ㅇ','65','상온','z','S',2,'CONTRACT017','/home/wms/work/manager/backend/inbound/barcode/barcode17.png','출고요청','2025-04-08',NULL,'2025-04-08 08:50:33','2025-04-08 08:50:33'),(4,'휴먼','컴퓨터1','1','상온','z','S',2,'CONTRACT018','/home/wms/work/manager/backend/inbound/barcode/barcode18.png','출고요청','2025-04-09',NULL,'2025-04-09 00:25:43','2025-04-09 00:25:43'),(5,'휴먼','컴퓨터2','2','상온','zz','S',1,'CONTRACT019','/home/wms/work/manager/backend/inbound/barcode/barcode19.png','출고요청','2025-04-09',NULL,'2025-04-09 00:31:54','2025-04-09 00:31:54'),(6,'휴먼','컴퓨터3','3','상온','z','S',2,'CONTRACT020','/home/wms/work/manager/backend/inbound/barcode/barcode20.png','출고요청','2025-04-09',NULL,'2025-04-09 00:41:37','2025-04-09 00:41:37'),(7,'휴먼','컴퓨터6','6','상온','zz','S',2,'CONTRACT023','/home/wms/work/manager/backend/inbound/barcode/barcode23.png','출고요청','2025-04-09',NULL,'2025-04-09 00:41:37','2025-04-09 00:41:37'),(8,'휴먼','컴퓨터4','4','상온','z','S',2,'CONTRACT021','/home/wms/work/manager/backend/inbound/barcode/barcode21.png','출고요청','2025-04-09',NULL,'2025-04-09 00:56:01','2025-04-09 00:56:01'),(9,'휴먼','컴퓨터5','5','상온','z','S',2,'CONTRACT022','/home/wms/work/manager/backend/inbound/barcode/barcode22.png','출고요청','2025-04-09',NULL,'2025-04-09 01:07:16','2025-04-09 01:07:16'),(10,'휴먼','냉장고7','37','상온','x','S',1,'CONTRACT030','/home/wms/work/manager/backend/inbound/barcode/barcode30.png','출고요청','2025-04-09',NULL,'2025-04-09 05:04:37','2025-04-09 05:04:37'),(11,'휴먼','냉장고8','38','상온','x','S',1,'CONTRACT031','/home/wms/work/manager/backend/inbound/barcode/barcode31.png','출고요청','2025-04-09',NULL,'2025-04-09 06:06:09','2025-04-09 06:06:09'),(12,'ㅇㅇ','ㅇㅇ3','8787','상온','ㅋ','S',2,'49','/home/wms/work/manager/backend/inbound/barcode/barcode49.png','출고완료','2025-04-11',NULL,'2025-04-11 03:35:44','2025-04-11 03:35:44'),(13,'휴먼','헤드폰4','447','상온','zz','S',2,'55','/home/wms/work/manager/backend/inbound/barcode/barcode55.png','출고완료','2025-04-14',NULL,'2025-04-14 02:34:37','2025-04-14 02:34:37'),(14,'휴먼','헤드폰3','446','상온','zz','S',2,'54','/home/wms/work/manager/backend/inbound/barcode/barcode54.png','출고완료','2025-04-14',NULL,'2025-04-14 02:35:08','2025-04-14 02:35:08'),(15,'휴먼','헤드폰2','445','상온','zz','S',1,'53','/home/wms/work/manager/backend/inbound/barcode/barcode53.png','출고완료','2025-04-14',NULL,'2025-04-14 02:35:19','2025-04-14 02:35:19'),(16,'휴먼','헤드폰1','444','상온','zz','S',1,'52','/home/wms/work/manager/backend/inbound/barcode/barcode52.png','출고완료','2025-04-14',NULL,'2025-04-14 02:35:28','2025-04-14 02:35:28');
/*!40000 ALTER TABLE `Sm_Phone_Outbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Smart_Phone_Inbound`
--

DROP TABLE IF EXISTS `Smart_Phone_Inbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Smart_Phone_Inbound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `pallet_size` enum('S','M','L') NOT NULL,
  `width_size` int(11) DEFAULT NULL,
  `length_size` int(11) DEFAULT NULL,
  `warehouse_type` enum('냉장','냉동','상온') NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `warehouse_num` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `barcode_num` varchar(255) DEFAULT NULL,
  `img_inbound` text DEFAULT NULL,
  `img_pallet` text DEFAULT NULL,
  `inbound_status` enum('입고 준비','입고 대기','입고 중','입고 완료') DEFAULT '입고 준비',
  `contract_date` date DEFAULT NULL,
  `inbound_date` date DEFAULT NULL,
  `outbound_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `estimate` text DEFAULT NULL,
  `total_cost` decimal(15,2) DEFAULT NULL,
  `warehouse_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_barcode_num` (`barcode_num`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Smart_Phone_Inbound`
--

LOCK TABLES `Smart_Phone_Inbound` WRITE;
/*!40000 ALTER TABLE `Smart_Phone_Inbound` DISABLE KEYS */;
/*!40000 ALTER TABLE `Smart_Phone_Inbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Smart_Phone_Outbound`
--

DROP TABLE IF EXISTS `Smart_Phone_Outbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Smart_Phone_Outbound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `width_size` int(11) DEFAULT NULL,
  `length_size` int(11) DEFAULT NULL,
  `warehouse_type` enum('냉장','냉동','상온') NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `warehouse_num` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `barcode_num` varchar(255) DEFAULT NULL,
  `outbound_status` enum('입고완료','출고요청','출고 준비중','출고 준비 완료','배차 신청','배차 중','배차 완료','출고완료') DEFAULT '입고완료',
  `contract_date` date DEFAULT NULL,
  `last_outbound_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `warehouse_location` varchar(255) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL COMMENT '배차 신청용 배송지',
  `delivery_customer_name` varchar(255) DEFAULT NULL,
  `delivery_customer_phone` varchar(50) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  `assigned_driver_id` int(11) DEFAULT NULL COMMENT '배정된 배송기사 ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode_num` (`barcode_num`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Smart_Phone_Outbound`
--

LOCK TABLES `Smart_Phone_Outbound` WRITE;
/*!40000 ALTER TABLE `Smart_Phone_Outbound` DISABLE KEYS */;
INSERT INTO `Smart_Phone_Outbound` VALUES (5,'삼성','선하','01000000000','삼성로 8길 13',1.00,1,1,'상온','립밤','SLOT-6','/home/wms/work/manager/backend/inbound/barcode/barcode76.png','76','출고 준비중','2025-04-17','2025-04-17','2025-04-27 10:03:14','보관소 B',NULL,NULL,NULL,NULL,NULL),(6,'삼성','선하','01000000000','삼성로 8길 13',1.00,1,1,'상온','립밤','SLOT-9','/home/wms/work/manager/backend/inbound/barcode/barcode75.png','75','출고완료','2025-04-17','2025-04-17','2025-04-27 10:03:32','보관소 A','삼성로 8길 13','김정훈','123456789','하하하',9),(7,'삼성','선하','01000000000','삼성로 8길 13',1.00,1,1,'상온','필통','SLOT-3','/home/wms/work/manager/backend/inbound/barcode/barcode74.png','74','출고 준비중','2025-04-16','2025-04-16','2025-04-27 10:07:03','보관소 C',NULL,NULL,NULL,NULL,NULL),(8,'삼성','선하','01000000000','삼성로 8길 13',1.00,1,1,'상온','필통','S-0-0-0','/home/wms/work/manager/backend/inbound/barcode/barcode73.png','73','출고 준비중','2025-04-16','2025-04-16','2025-04-27 10:07:29','보관소 C',NULL,NULL,NULL,NULL,NULL),(9,'삼성','선하','01000000000','삼성로 8가 13',1.00,1,1,'상온','냉장고','SLOT-9','/home/wms/work/manager/backend/inbound/barcode/barcode89.png','89','출고요청','2025-04-23','2025-04-23','2025-04-28 03:34:04','보관소 B',NULL,NULL,NULL,NULL,NULL),(10,'삼성','선하','01000000000','삼성로 8가 13',1.00,1,1,'상온','냉장고','SLOT-0-0-0','/home/wms/work/manager/backend/inbound/barcode/barcode100.png','100','배차 완료','2025-04-28','2025-04-28','2025-04-29 08:53:40','보관소 A','삼성로 8가 13','다람쥐','12345678901','다람쥐',9),(11,'삼성','선하','01000000000','삼성로 8가 13',1.00,1,1,'상온','냉장고','SLOT-2-0-0','/home/wms/work/manager/backend/inbound/barcode/barcode116.png','116','출고완료','2025-04-30','2025-04-30','2025-04-30 00:20:36','보관소 D','대전 은행동 이안경원','김정훈','01012341234','하하하',4),(13,'삼성','선하','01000000000','삼성로 8가 13',1.00,1,1,'상온','냉장고','SLOT-2-0-0','/home/wms/work/manager/backend/inbound/barcode/barcode115.png','115','출고 준비중','2025-04-30','2025-04-30','2025-04-30 01:16:07','보관소 C',NULL,NULL,NULL,NULL,NULL),(14,'삼성','선하','01000000000','삼성로 8가 13',1.00,1,1,'상온','냉장고','SLOT-2-0-1','/home/wms/work/manager/backend/inbound/barcode/barcode111.png','111','배차 신청','2025-04-28','2025-04-30','2025-04-30 05:53:36','보관소 A','삼성로 8가 13','ㅈ','1234','하힌',NULL),(18,'삼성','선하','01000000000','삼성로 8가 13',1.00,1,1,'상온','냉장고','SLOT-2-0-0','/home/wms/work/manager/backend/inbound/barcode/barcode98.png','98','배차 신청','2025-04-28','2025-04-28','2025-05-12 07:35:24','보관소 A','삼성로 8가 13','ㄱ','010767948','ㅅㅇ',NULL),(20,'삼성','선하','01000000000','삼성로 8가 13',1.00,1,1,'상온','냉장고','SLOT-2-1-1','/home/wms/work/manager/backend/inbound/barcode/barcode113.png','113','배차 신청','2025-04-30','2025-04-30','2025-05-22 01:09:56','보관소 A','삼성로 8가 13','김정훈','12341234','ㄱㄴㄱ',NULL),(21,'human','human','01000000000','human',3.00,800,400,'상온','전자제품','SLOT-0-2-0','/home/wms/work/manager/backend/inbound/barcode/barcode126.png','126','출고요청','2025-05-22','2025-05-22','2025-05-22 04:58:45','보관소 A',NULL,NULL,NULL,NULL,NULL),(25,'human','human','01000000000','human',1.00,1200,100,'상온','가전제품','SLOT-1-1-1','/home/wms/work/manager/backend/inbound/barcode/barcode131.png','131','출고완료','2025-05-22','2025-05-22','2025-05-22 06:01:59','보관소 A','휴먼','ㅇ','12341234','ㅣ',4),(26,'human','human','01000000000','human',1.00,1200,100,'상온','가전제품','SLOT-1-2-4','/home/wms/work/manager/backend/inbound/barcode/barcode132.png','132','출고완료','2025-05-22','2025-05-22','2025-05-22 06:33:49','보관소 B','human','김정훈','111111111','ㄱ',4),(27,'human','human','01000000000','human',1.00,1200,100,'상온','가전제품','SLOT-0-1-3','/home/wms/work/manager/backend/inbound/barcode/barcode133.png','133','출고완료','2025-05-23','2025-05-23','2025-05-23 06:02:33','보관소 A','human','df','11111','ㅇㄹㅇㄹㅇ',4);
/*!40000 ALTER TABLE `Smart_Phone_Outbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehiclesTable`
--

DROP TABLE IF EXISTS `VehiclesTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VehiclesTable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `truck_type` enum('1톤','1.5톤','5톤','10톤') NOT NULL,
  `current_location` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `storage_condition` enum('냉장','냉동','상온') NOT NULL,
  `truck_size` enum('소','중','대') NOT NULL,
  `driver_name` varchar(100) NOT NULL,
  `driver_phone` varchar(20) NOT NULL,
  `status` enum('배차 가능','배차 완료') DEFAULT '배차 가능',
  `assigned_main_table_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehiclesTable`
--

LOCK TABLES `VehiclesTable` WRITE;
/*!40000 ALTER TABLE `VehiclesTable` DISABLE KEYS */;
INSERT INTO `VehiclesTable` VALUES (1,'5톤','서울','부산','냉장','중','김철수','010-1111-2222','배차 가능',NULL),(2,'1.5톤','경기','대구','냉동','소','박영희','010-2222-3333','배차 가능',NULL),(3,'10톤','부산','광주','상온','대','이민호','010-3333-4444','배차 완료',1),(4,'5톤','서울','대전','상온','중','최수지','010-4444-5555','배차 가능',NULL),(5,'5톤','인천','울산','냉장','중','조민호','010-5555-6666','배차 가능',NULL),(6,'10톤','서울','전주','냉동','대','장세진','010-6666-7777','배차 가능',NULL),(7,'5톤','서울','서울','상온','중','테스트기사','010-0000-0000','배차 가능',NULL),(8,'5톤','부산','부산','냉장','중','테스트기사1','010-0000-0000','배차 완료',2),(9,'5톤','부산','부산','냉장','중','테스트기사','010-9999-9999','배차 가능',NULL);
/*!40000 ALTER TABLE `VehiclesTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_defects`
--

DROP TABLE IF EXISTS `inbound_defects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_defects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inbound_id` int(11) NOT NULL,
  `defect_type` enum('정상','파손','기타') DEFAULT NULL,
  `defect_quantity` int(11) DEFAULT 0,
  `remark` text DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `inbound_id` (`inbound_id`),
  CONSTRAINT `inbound_defects_ibfk_1` FOREIGN KEY (`inbound_id`) REFERENCES `MainTable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_defects`
--

LOCK TABLES `inbound_defects` WRITE;
/*!40000 ALTER TABLE `inbound_defects` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_defects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outbound_id` int(11) NOT NULL,
  `return_type` enum('파손','기타','단순변심') DEFAULT NULL,
  `return_quantity` int(11) DEFAULT 0,
  `remark` text DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `is_market_return` enum('O','X') DEFAULT 'X',
  `created_at` datetime DEFAULT current_timestamp(),
  `backup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backup_id` (`backup_id`),
  CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`backup_id`) REFERENCES `BackupTable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (1,1001,'파손',2,'포장 파손됨',NULL,'O','2025-04-22 06:57:30',NULL),(2,1002,'기타',1,'색상 다름',NULL,'X','2025-04-22 06:57:30',NULL),(3,1003,'단순변심',3,'고객 요청',NULL,'O','2025-04-22 06:57:30',NULL),(4,1004,'파손',1,'박스 찢김',NULL,'X','2025-04-22 06:57:30',NULL),(5,1005,'기타',2,'부속품 누락',NULL,'O','2025-04-22 06:57:30',NULL),(6,1006,'단순변심',1,'크기 다름',NULL,'X','2025-04-22 06:57:30',NULL),(7,1007,'파손',5,'사용 중 고장',NULL,'O','2025-04-22 06:57:30',NULL),(8,1008,'기타',4,'라벨 오류',NULL,'X','2025-04-22 06:57:30',NULL),(9,1009,'단순변심',2,'생각보다 무거움',NULL,'O','2025-04-22 06:57:30',NULL),(10,1010,'기타',1,'설명과 다름',NULL,'X','2025-04-22 06:57:30',NULL),(11,1011,'파손',33,'설명과 다름',NULL,'O','2025-04-22 07:18:50',NULL),(12,123,'파손',32,'','/return_uploads/images.jpg','O','2025-04-22 09:04:52',1),(13,111,'파손',3,'테스트','/return_uploads/6d6e23d36b494825b4cf37740e25b5a6.png','X','2025-04-28 07:00:59',77);
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `provider` varchar(20) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `refresh_token` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'서울','2025-04-04 02:28:43.959566','1층','test3@example.com','$2a$10$gC8OpuGpMi0Q5VqDhW9T2u2xux6/U7E6IPFlvFGXZMrNDDEi.MrQK',NULL,'admin','테스트3',NULL,'','','',NULL),(2,'삼성로 8가 13','2025-04-07 03:43:10.394120','qwe','test@example.com','$2a$10$KiQxWBJYbiIpJ4QnypD.FO1Ltyl0.uRLvUBDvdJegg7NTHKaLWNyG','010-1234-5678','user','test',NULL,'삼성','선하','01000000000',NULL),(3,'서울시 어딘가1','2025-04-07 04:50:04.402171','테스트 관리자 계정입니다.','admin@wms.com','$2a$10$2ZXVFkF.DRu/zXrWKbCZbuDwhfGeLtYP00Nsouhvc1LITC/nxxHXG','010-1234-56781','admin','관리자',NULL,'','','',NULL),(10,'Seoul, Korea','2025-04-10 02:52:10.000000','First test user','testuser1@example.com','hashed_password_1','01012345678','user','홍길동',NULL,'','','',NULL),(12,'서울특별시 강남구 테헤란로','2025-04-10 03:39:46.000000','테스트 사용자입니다.','tester@example.com','hashed_password_1234','01082649748','user','홍길동',NULL,'','','',NULL),(15,'서울특별시 강남구 테헤란로','2025-04-10 03:45:45.000000','테스트 사용자입니다.','tester11@example.test','testtest','01033331111','user','테스터',NULL,'','','',NULL),(16,'','2025-04-11 01:31:10.120370','','','$2a$10$u7CJnV/MMzMn49dAvEXSCOOsaqvN0Vlind/J/GnLTuSuDfYR3qQxS',NULL,'user','',NULL,'','','',NULL),(17,'1243','2025-04-24 06:40:12.926939','1234','test@wms.com','$2a$10$3ANqQgRubmrGh27EW21Z6eSDOpRjJPMsZwoUNYsxcWg4n.icbQ8/S',NULL,'admin','테스트',NULL,NULL,NULL,NULL,NULL),(18,'서울 강남구','2025-04-30 02:15:57.000000','1층','hong1@example.com','dummyhash1','010-1000-1001','user','hong1',NULL,'삼성','이이름','01010001001',NULL),(19,'서울 강북구','2025-04-30 02:15:57.000000','2층','hong2@example.com','dummyhash2','010-1000-1002','user','hong2',NULL,'삼성','이이름','01010001002',NULL),(20,'서울 마포구','2025-04-30 02:15:57.000000','3층','hong3@example.com','dummyhash3','010-8264-9748','user','hong3',NULL,'삼성','이이름','01082649748',NULL),(21,'부산 해운대구','2025-04-30 02:15:57.000000','4층','lee@example.com','dummyhash4','010-2000-2001','user','lee1',NULL,'삼성','이순신','01020002001',NULL),(22,'대구 중구','2025-04-30 02:15:57.000000','5층','kim@example.com','dummyhash5','010-3000-3001','admin','kim1',NULL,'삼성','김유신','01030003001',NULL),(23,'human','2025-05-21 00:04:55.412338','human-1','human@human.com','$2a$10$MLY0o60VqbisEY1H3xJly.9YbQCzdRj3HOthogBsi6eUsZ1.8NrFS','01000000000','user','human',NULL,'human','human','01000000000',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26  7:36:45
