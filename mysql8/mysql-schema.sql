/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.9-MariaDB, for Linux (x86_64)
--
-- Host: mysql8    Database: xsgcasino_test
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `ace333_accounts`
--

DROP TABLE IF EXISTS `ace333_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ace333_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ace333帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密碼',
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ace333玩家編號',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ace333餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ace333_accounts_username_unique` (`username`),
  KEY `ace333_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `ace333_accounts_player_id_index` (`player_id`),
  KEY `ace333_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ace333_bet_records`
--

DROP TABLE IF EXISTS `ace333_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ace333_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `playerID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家編號',
  `extPlayerID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家編號',
  `gameID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號',
  `transactionType` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易類型(BT:Bet, TU:Top up, WD:Withdraw, JP:Jackpot)',
  `referenceID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易編號(唯一值)',
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '狀態C-Completed',
  `created` datetime NOT NULL COMMENT '投注時間',
  `updated` datetime NOT NULL COMMENT '投注更新時間',
  `betAmount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `winAmount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `jackpotModule` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '彩金模式',
  `jackpotContributionAmt` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩金金額',
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣種',
  `resultUrl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '開獎結果url',
  `roundDetails` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '詳情',
  `platform` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊玩平台',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT 'info',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`referenceID`),
  KEY `ace333_bet_records_playerid_index` (`playerID`),
  KEY `ace333_bet_records_gameid_index` (`gameID`),
  KEY `ace333_bet_records_referenceid_index` (`referenceID`),
  KEY `ace333_bet_records_created_index` (`created`),
  KEY `ace333_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ace333sw_accounts`
--

DROP TABLE IF EXISTS `ace333sw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ace333sw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `vendor_uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲商的玩家 UID-依據遊戲商需求',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家密碼-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家登入用 Token-依據遊戲商需求',
  `admin` int NOT NULL DEFAULT '0' COMMENT '數據操作人員的管理者系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ace333sw_accounts_username_unique` (`username`),
  KEY `ace333sw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `ace333sw_accounts_member_id_index` (`member_id`),
  KEY `ace333sw_accounts_vendor_username_index` (`vendor_username`),
  KEY `ace333sw_accounts_vendor_uid_index` (`vendor_uid`),
  KEY `ace333sw_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ace333sw_bet_records`
--

DROP TABLE IF EXISTS `ace333sw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ace333sw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注單唯一Id, ThemeId',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩、結算時間(UTC)',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未結算,1:已結算',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲 ID-依據遊戲商需求',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼金額-依據遊戲商需求',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '訪問投注單的 Session Token 或 ID 簽章-依據遊戲商需求',
  `info` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ace333sw_bet_records_bet_id_unique` (`bet_id`),
  KEY `ace333sw_bet_records_vendor_info_id_index` (`vendor_info_id`),
  KEY `ace333sw_bet_records_vendor_username_index` (`vendor_username`),
  KEY `ace333sw_bet_records_bet_time_index` (`bet_time`),
  KEY `ace333sw_bet_records_payout_time_index` (`payout_time`),
  KEY `ace333sw_bet_records_session_token_index` (`session_token`),
  KEY `ace333sw_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acewin_accounts`
--

DROP TABLE IF EXISTS `acewin_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acewin_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `vendor_uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲商的玩家 UID-依據遊戲商需求',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家密碼-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家登入用 Token-依據遊戲商需求',
  `admin` int NOT NULL DEFAULT '0' COMMENT '數據操作人員的管理者系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acewin_accounts_username_unique` (`username`),
  KEY `acewin_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `acewin_accounts_member_id_index` (`member_id`),
  KEY `acewin_accounts_vendor_username_index` (`vendor_username`),
  KEY `acewin_accounts_vendor_uid_index` (`vendor_uid`),
  KEY `acewin_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acewin_bet_records`
--

DROP TABLE IF EXISTS `acewin_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acewin_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注單唯一Id, ThemeId',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩、結算時間(UTC)',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未結算,1:已結算',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲 ID-依據遊戲商需求',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼金額-依據遊戲商需求',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '訪問投注單的 Session Token 或 ID 簽章-依據遊戲商需求',
  `info` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acewin_bet_records_bet_id_unique` (`bet_id`),
  KEY `acewin_bet_records_vendor_info_id_index` (`vendor_info_id`),
  KEY `acewin_bet_records_vendor_username_index` (`vendor_username`),
  KEY `acewin_bet_records_bet_time_index` (`bet_time`),
  KEY `acewin_bet_records_payout_time_index` (`payout_time`),
  KEY `acewin_bet_records_session_token_index` (`session_token`),
  KEY `acewin_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_uuid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_logs_log_name_index` (`log_name`),
  KEY `idx_activity_logs_created_at` (`created_at`),
  KEY `idx_activity_logs_causer_created_at` (`causer_id`,`created_at`),
  KEY `idx_activity_logs_subject_created_at` (`subject_id`,`created_at`),
  KEY `idx_activity_logs_log_name_created_at` (`log_name`,`created_at`),
  KEY `idx_activity_logs_causer_type_id_created_at` (`causer_type`,`causer_id`,`created_at`),
  KEY `idx_activity_logs_subject_type_id_created_at` (`subject_type`,`subject_id`,`created_at`),
  KEY `idx_activity_logs_batch_uuid` (`batch_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1418 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adjustment_logs`
--

DROP TABLE IF EXISTS `adjustment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `adjustment_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL DEFAULT '0' COMMENT 'adjustment_types.id',
  `transaction_log_id` int NOT NULL DEFAULT '0' COMMENT 'transaction_logs.id',
  `member_id` int NOT NULL DEFAULT '0' COMMENT 'members.id',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '分數',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `adjustment_logs_transaction_log_id_index` (`transaction_log_id`),
  KEY `adjustment_logs_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adjustment_type_names`
--

DROP TABLE IF EXISTS `adjustment_type_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `adjustment_type_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL COMMENT '語言系統編號',
  `type_id` int NOT NULL COMMENT 'adjustment_types.id',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adjustment_types`
--

DROP TABLE IF EXISTS `adjustment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `adjustment_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別名稱',
  `status` tinyint NOT NULL COMMENT '狀態; 0:關閉, 1:開啟',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advertise_exclude_agents`
--

DROP TABLE IF EXISTS `advertise_exclude_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertise_exclude_agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `advertise_id` int unsigned NOT NULL COMMENT 'advertises.id',
  `agent_id` int unsigned NOT NULL COMMENT 'agents.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `advertise_exclude_agents_advertise_id_index` (`advertise_id`),
  KEY `advertise_exclude_agents_agent_id_index` (`agent_id`),
  KEY `advertise_exclude_agents_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advertise_images`
--

DROP TABLE IF EXISTS `advertise_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertise_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '圖片路徑',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作人員',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advertise_languages`
--

DROP TABLE IF EXISTS `advertise_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertise_languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `advertise_id` int NOT NULL DEFAULT '0' COMMENT '廣告ID(advertises.id)',
  `language_id` int NOT NULL DEFAULT '0' COMMENT '語言ID, 0:全語系, 1~N:參考languages.id',
  `advertise_image_id` int NOT NULL DEFAULT '0' COMMENT '圖片ID(advertise_images.id)',
  `advertise_image_pc_id` int NOT NULL DEFAULT '0' COMMENT 'PC圖片ID(advertise_images.id)',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '廣告標題',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作人員',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advertisement_path_names`
--

DROP TABLE IF EXISTS `advertisement_path_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement_path_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` tinyint NOT NULL COMMENT '語言id(languages.id)',
  `advertisement_path_id` tinyint NOT NULL COMMENT '版面位置id(advertisement_paths.id)',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'name',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作人員',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advertisement_paths`
--

DROP TABLE IF EXISTS `advertisement_paths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement_paths` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別名稱',
  `column` int NOT NULL COMMENT '一列幾欄',
  `width` int NOT NULL COMMENT '圖片寬度',
  `height` int NOT NULL COMMENT '圖片高度',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advertisements`
--

DROP TABLE IF EXISTS `advertisements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `path_id` int NOT NULL COMMENT '版位系統編號',
  `language_id` int NOT NULL COMMENT '語系系統編號',
  `country_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '國家系統編號(Json格式)',
  `agent_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '代理系統編號(Json格式)',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '圖片, 如果為空則取遊戲圖片 ',
  `image_pc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手機版圖片',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '連結網址',
  `game_id` int DEFAULT '0' COMMENT '遊戲編號',
  `game_type_id` int NOT NULL DEFAULT '0' COMMENT '遊戲類型編號',
  `vendor_id` int DEFAULT NULL COMMENT '遊戲商編號',
  `external_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '外部連結',
  `event_id` int NOT NULL DEFAULT '0' COMMENT '活動編號',
  `sort` int NOT NULL COMMENT '排序',
  `start_time` datetime NOT NULL COMMENT '開始日期',
  `end_time` datetime NOT NULL COMMENT '結束日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advertises`
--

DROP TABLE IF EXISTS `advertises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertises` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `advertisement_path_id` tinyint NOT NULL COMMENT '版面位置id(advertisement_paths.id)',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理ID(agents.id)',
  `start_time` datetime NOT NULL COMMENT '開始時間',
  `end_time` datetime NOT NULL COMMENT '結束時間',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '圖片連結類型; 0:無連結, 1:連結至遊戲商, 2:連結至遊戲, 3.連結至遊戲類型, 8:內部連結, 9:外部連結',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '連結類型內容; 1:1(vendor_id), 2:1(game_id), 3:1(game_type_id), 8:depoist/unlimit, 9:http://www.abc.com/',
  `open_window` tinyint(1) NOT NULL DEFAULT '0' COMMENT '另開視窗; 0:不另開(h5:該頁面, app:webview), 1:另開(h5:分頁, app:browser)',
  `sort` tinyint NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態; 0:停用, 1:啟用',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作人員',
  PRIMARY KEY (`id`),
  KEY `advertises_agent_id_index` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aes_accounts`
--

DROP TABLE IF EXISTS `aes_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `aes_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `aes_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `aes_accounts_username_index` (`username`),
  KEY `aes_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aes_bet_records`
--

DROP TABLE IF EXISTS `aes_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `aes_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `gameType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲類別',
  `winAmount` decimal(18,4) NOT NULL COMMENT '贏得金額',
  `bet_time` datetime NOT NULL COMMENT '投注時間',
  `settleStatus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gameInfo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲資訊',
  `realWinAmount` decimal(18,4) NOT NULL COMMENT '實際贏得金額',
  `realBetAmount` decimal(18,4) NOT NULL COMMENT '實際投注金額',
  `updateTime` datetime NOT NULL COMMENT '更新注單時間',
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家名稱',
  `betType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '投注類別',
  `platform` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平台',
  `txStatus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '狀態',
  `betAmount` decimal(18,4) NOT NULL COMMENT '投注金額',
  `platformTxId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gameCode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號',
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣別',
  `jackpotWinAmount` decimal(18,4) NOT NULL COMMENT '彩池贏得金額',
  `jackpotBetAmount` decimal(18,4) NOT NULL COMMENT '彩池投注金額',
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ID',
  `turnover` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roundId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `aes_bet_records_bet_time_txstatus_index` (`bet_time`,`txStatus`),
  KEY `aes_bet_records_updatetime_index` (`updateTime`),
  KEY `aes_bet_records_userid_index` (`userId`),
  KEY `aes_bet_records_gamecode_index` (`gameCode`),
  KEY `aes_bet_records_bet_id_index` (`bet_id`),
  KEY `aes_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `afbsw_accounts`
--

DROP TABLE IF EXISTS `afbsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `afbsw_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `afbsw_accounts_username_unique` (`username`),
  KEY `afbsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `afbsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `afbsw_bet_records`
--

DROP TABLE IF EXISTS `afbsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `afbsw_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員編號',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號 playerId',
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單號 betId',
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲ID',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注額',
  `payout` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注禮碼金額',
  `bet_time` timestamp NOT NULL COMMENT '投注時間',
  `payout_time` timestamp NULL DEFAULT NULL COMMENT '結算時間',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:建立注單,1:已結算',
  `info` json DEFAULT NULL COMMENT '注單信息',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `afbsw_bet_records_bet_id_unique` (`bet_id`),
  KEY `afbsw_bet_records_created_at_index` (`created_at`),
  KEY `afbsw_bet_records_member_id_index` (`member_id`),
  KEY `afbsw_bet_records_username_index` (`username`),
  KEY `afbsw_bet_records_game_code_index` (`game_code`),
  KEY `afbsw_bet_records_bet_time_index` (`bet_time`),
  KEY `afbsw_bet_records_payout_time_index` (`payout_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ag_accounts`
--

DROP TABLE IF EXISTS `ag_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ag_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AG帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AG密碼',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'AG餘額',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT '營運商編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員帳號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ag_accounts_username_unique` (`username`),
  KEY `ag_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `ag_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ag_bet_records`
--

DROP TABLE IF EXISTS `ag_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ag_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `data_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下注記錄詳情',
  `bill_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單流水號',
  `player_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `agent_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '代理商編號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲局號',
  `net_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家輸贏金額',
  `bet_time` datetime NOT NULL COMMENT '投注時間',
  `utc_bet_time` datetime DEFAULT NULL COMMENT '時區+0的投注時間(AG原始的時區為-4)',
  `game_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲代碼',
  `bet_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家投注金額',
  `valid_bet_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `flag` int NOT NULL COMMENT '結算狀態0:未結算,1:已結算,2:下注中,4:撤單套現,-8:取消指定局注單,-9:取消指定注單',
  `play_type` int NOT NULL COMMENT '遊戲玩法',
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '貨幣類型',
  `table_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '桌子編號',
  `login_ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家IP',
  `recalcu_time` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單重新派彩時間',
  `utc_recalcu_time` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '結算時間(UTC時區)',
  `platform_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平台類型',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '額外訊息',
  `round` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平台內大廳類型',
  `result` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '結果',
  `before_credit` decimal(10,2) NOT NULL COMMENT '下注前餘額',
  `device_type` int NOT NULL COMMENT '設備類型',
  `game_category` int NOT NULL COMMENT '0:非電子桌面遊戲,1:電子桌面遊戲',
  `cancel_reason` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '取消原因',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ag_bet_records_bill_no_unique` (`bill_no`),
  KEY `ag_bet_records_player_name_index` (`player_name`),
  KEY `ag_bet_records_game_code_index` (`game_code`),
  KEY `ag_bet_records_bet_time_index` (`bet_time`),
  KEY `ag_bet_records_utc_bet_time_index` (`utc_bet_time`),
  KEY `ag_bet_records_flag_index` (`flag`),
  KEY `ag_bet_records_platform_type_index` (`platform_type`),
  KEY `ag_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_access_tokens`
--

DROP TABLE IF EXISTS `agent_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_access_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `agent_id` int NOT NULL COMMENT '代理系統編號(User)',
  `token` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `expire_date` datetime NOT NULL COMMENT '過期日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `agent_access_tokens_agent_id_index` (`agent_id`),
  KEY `agent_access_tokens_token_index` (`token`),
  KEY `agent_access_tokens_expire_date_index` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_announcements`
--

DROP TABLE IF EXISTS `agent_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_announcements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理id',
  `announcement_id` int NOT NULL COMMENT '公告id',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_authentications`
--

DROP TABLE IF EXISTS `agent_authentications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_authentications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '主帳號的系統編號(不等於0就是子帳號)',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '類型; 1:Google2FA',
  `secret` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'secret key',
  `image` text COLLATE utf8mb4_unicode_ci COMMENT 'img',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '帳號狀態 0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `agent_authentications_agent_id_index` (`agent_id`),
  KEY `agent_authentications_type_index` (`type`),
  KEY `agent_authentications_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代理; ID:3~100預設給系統使用, 如System, Auto, unlimit, ....';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_bank_accounts`
--

DROP TABLE IF EXISTS `agent_bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_bank_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理ID',
  `bank_id` int NOT NULL COMMENT '銀行ID',
  `account_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳號用戶名',
  `account_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳號',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `agent_bank_accounts_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_bank_names`
--

DROP TABLE IF EXISTS `agent_bank_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_bank_names` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `agent_bank_id` bigint unsigned NOT NULL COMMENT '對應 agent_banks.id',
  `language_id` tinyint NOT NULL COMMENT '語系 ID，對應 languages.id',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '該語系下的銀行顯示名稱',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_agent_bank_lang` (`agent_bank_id`,`language_id`),
  KEY `agent_bank_names_agent_bank_id_index` (`agent_bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_banks`
--

DROP TABLE IF EXISTS `agent_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_banks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `agent_group_id` bigint unsigned NOT NULL COMMENT '代理群組 ID，對應 agent_groups.id',
  `bank_id` bigint unsigned NOT NULL COMMENT '標準銀行 ID，對應 banks.id',
  `cash_flow_id` bigint unsigned NOT NULL COMMENT '金流商戶 ID，對應 agent_cash_flows.id',
  `min_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '代理層級最低金額限制（不得超過 cash_flow_banks.min_amount）',
  `max_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '代理層級最高金額限制（0 = 不限制；不得超過 cash_flow_banks.max_amount）',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '狀態：1=啟用, 0=停用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_group_bank_cashflow` (`agent_group_id`,`bank_id`,`cash_flow_id`),
  KEY `idx_group_cashflow_status` (`agent_group_id`,`cash_flow_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_cash_flow_order_types`
--

DROP TABLE IF EXISTS `agent_cash_flow_order_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_cash_flow_order_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cash_flow_info_id` int NOT NULL DEFAULT '0',
  `agent_cash_flow_id` int NOT NULL DEFAULT '0' COMMENT '金流商戶資料編號',
  `order_type_id` int NOT NULL DEFAULT '0' COMMENT '支付方式編號',
  `min_amount` int NOT NULL DEFAULT '0' COMMENT '下限: 0為不限制',
  `max_amount` int NOT NULL DEFAULT '0' COMMENT '上限: 0為不限制',
  `available_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '固額: 150,300,500',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Settings JSON',
  `sorts` int NOT NULL DEFAULT '0' COMMENT '排序權重',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '設置啟用狀態 0:停用, 1:啟用',
  `cost` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '費率數值（搭配 cost_type 使用）',
  `cost_type` tinyint NOT NULL DEFAULT '1' COMMENT '費率類型：1=百分比, 2=固定金額',
  `backend_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '後台顯示 0:隱藏, 1:顯示',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `agent_cash_flow_order_types_agent_cash_flow_id_index` (`agent_cash_flow_id`),
  KEY `agent_cash_flow_order_types_order_type_id_index` (`order_type_id`),
  KEY `agent_cash_flow_order_types_sorts_index` (`sorts`),
  KEY `agent_cash_flow_order_types_status_index` (`status`),
  KEY `idx_cashflow_status_type` (`agent_cash_flow_id`,`status`,`order_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_cash_flows`
--

DROP TABLE IF EXISTS `agent_cash_flows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_cash_flows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `cash_flow_info_id` int NOT NULL DEFAULT '0',
  `cash_flow_id` int NOT NULL COMMENT '金流商系統編號',
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT '代理群組編號',
  `currency_id` int unsigned DEFAULT NULL,
  `rate` decimal(15,9) NOT NULL DEFAULT '0.000000000' COMMENT '轉換比例(2025/05/05提升至9位)',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名稱',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'API使用資訊',
  `sorts` int NOT NULL DEFAULT '0' COMMENT '排序權重',
  `cost` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '設置啟用狀態 0:停用, 1:啟用',
  `backend_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '後台顯示 0:隱藏, 1:顯示',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `agent_cash_flows_cash_flow_info_id_index` (`cash_flow_info_id`),
  KEY `agent_cash_flows_cash_flow_id_index` (`cash_flow_id`),
  KEY `agent_cash_flows_agent_group_id_index` (`agent_group_id`),
  KEY `agent_cash_flows_sorts_index` (`sorts`),
  KEY `agent_cash_flows_status_index` (`status`),
  KEY `idx_agent_cash_flows_currency_id` (`currency_id`),
  KEY `idx_group_status` (`agent_group_id`,`status`),
  KEY `idx_agent_group_cash_flow` (`agent_group_id`,`cash_flow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_customized_settings`
--

DROP TABLE IF EXISTS `agent_customized_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_customized_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK流水號',
  `agent_group_id` int NOT NULL COMMENT '設置分組ID',
  `setting_key` int NOT NULL COMMENT '主要分類鍵值 (請參考 AgentCustomizedSettingKeyEnum)',
  `sub_category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '子分類 (同一組key、可能有多種設置 e.g. 語系)',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '設值數值',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `agent_customized_settings_agent_group_id_index` (`agent_group_id`),
  KEY `agent_customized_settings_setting_key_index` (`setting_key`),
  KEY `agent_customized_settings_sub_category_index` (`sub_category`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代理個性化設置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_domains`
--

DROP TABLE IF EXISTS `agent_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_domains` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理系統編號',
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '網址名稱',
  `template_id` int NOT NULL DEFAULT '0' COMMENT '模版系統編號,0為公版',
  `mobile_templates` tinyint(1) NOT NULL DEFAULT '0' COMMENT '手機模版系統編號',
  `pc_templates` int NOT NULL DEFAULT '0' COMMENT '電腦模版系統編號',
  `logo_pc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '電腦版Logo',
  `logo_mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手機版Logo',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'favorite icon',
  `add_home_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '添加主螢幕教學圖片網址',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '網站名稱',
  `type` tinyint DEFAULT '0' COMMENT '類型: 0:正常, 1:推廣用(因為可能會用到短網址, 故其他在回給前端可能不適合), 2:是遊戲商中轉網址跳轉專用',
  `need_login` tinyint NOT NULL DEFAULT '1' COMMENT '是否可使用公開頁面',
  `info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其他資訊',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0未使用,1使用中',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_domains_domain_unique` (`domain`),
  KEY `agent_domains_agent_id_index` (`agent_id`),
  KEY `agent_domains_type_index` (`type`),
  KEY `agent_domains_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_games`
--

DROP TABLE IF EXISTS `agent_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_games` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理系統編號',
  `game_id` int NOT NULL COMMENT '遊戲ID',
  `status` int NOT NULL DEFAULT '1' COMMENT '狀態; 1:啟用, 0:停用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_games_agent_id_index` (`agent_id`),
  KEY `agent_games_game_id_index` (`game_id`),
  KEY `agent_games_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_group_game_tags`
--

DROP TABLE IF EXISTS `agent_group_game_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_group_game_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_group_id` int NOT NULL COMMENT '遊戲商群組ID(vendor_customize_groups.id)',
  `game_id` int NOT NULL COMMENT '遊戲ID(games.id)',
  `agent_group_tag_id` int NOT NULL COMMENT '遊戲商群組ID(agent_group_tags.id)',
  `sort` int NOT NULL COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:使用中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  PRIMARY KEY (`id`),
  KEY `agent_group_game_tags_agent_group_id_index` (`agent_group_id`),
  KEY `agent_group_game_tags_game_id_index` (`game_id`),
  KEY `agent_group_game_tags_agent_group_tag_id_index` (`agent_group_tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_group_permissions`
--

DROP TABLE IF EXISTS `agent_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_group_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理系統編號',
  `agent_group_id` int NOT NULL COMMENT '代理組別ID',
  `status` int NOT NULL DEFAULT '1' COMMENT '狀態; 1:啟用, 0:停用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_group_permissions_agent_id_index` (`agent_id`),
  KEY `agent_group_permissions_agent_group_id_index` (`agent_group_id`),
  KEY `agent_group_permissions_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_group_tags`
--

DROP TABLE IF EXISTS `agent_group_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_group_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商群組ID(vendor_customize_group.id)',
  `tag_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:使用中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `agent_group_tags_updated_at_index` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_groups`
--

DROP TABLE IF EXISTS `agent_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK流水號',
  `agent_group_type` int NOT NULL COMMENT '1:基本個性化設置組別、2:財務組別  3:簡訊設置組別 4.聊天chatGroup相關',
  `organization_id` int NOT NULL DEFAULT '1' COMMENT '所屬組織',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註顯示名稱(需要多語系嗎)',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `is_default` tinyint NOT NULL COMMENT '是否為預設組別',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `agent_groups_agent_group_type_index` (`agent_group_type`),
  KEY `agent_groups_organization_id_index` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代理設置分組組別';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_hierarchys`
--

DROP TABLE IF EXISTS `agent_hierarchys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_hierarchys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int DEFAULT NULL,
  `sub_agent_id` int DEFAULT NULL,
  `level` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agent_hierarchys_agent_id_index` (`agent_id`),
  KEY `agent_hierarchys_sub_agent_id_index` (`sub_agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_login_ip_logs`
--

DROP TABLE IF EXISTS `agent_login_ip_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_login_ip_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理編號',
  `ip` bigint DEFAULT NULL COMMENT '登入ip',
  `ip_1` int NOT NULL COMMENT 'ip_1',
  `ip_2` int NOT NULL COMMENT 'ip_2',
  `ip_3` int NOT NULL COMMENT 'ip_3',
  `ip_4` int NOT NULL COMMENT 'ip_4',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_login_ip_logs_agent_id_index` (`agent_id`),
  KEY `agent_login_ip_logs_ip_index` (`ip`),
  KEY `agent_login_ip_logs_ip_1_index` (`ip_1`),
  KEY `agent_login_ip_logs_ip_2_index` (`ip_2`),
  KEY `agent_login_ip_logs_ip_3_index` (`ip_3`),
  KEY `agent_login_ip_logs_ip_4_index` (`ip_4`),
  KEY `agent_login_ip_logs_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_login_logs`
--

DROP TABLE IF EXISTS `agent_login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_login_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `agent_id` int NOT NULL COMMENT '代理系統編號(Agent)',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'IP地址',
  `status` tinyint NOT NULL COMMENT '狀態：0失敗，1成功',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_medias`
--

DROP TABLE IF EXISTS `agent_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_medias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理編號',
  `media_id` int NOT NULL COMMENT '影城編號',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態',
  `backend_show` int NOT NULL COMMENT '後台顯示',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_menus`
--

DROP TABLE IF EXISTS `agent_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '檔案名稱',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '選單功能名稱',
  `parent` int NOT NULL COMMENT '代理後台選單系統編號，0為root menu',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '選單網址',
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '選單符號',
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '功能',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '0' COMMENT '狀態',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `agent_menus_code_index` (`code`),
  KEY `agent_menus_parent_index` (`parent`),
  KEY `agent_menus_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_migrate_logs`
--

DROP TABLE IF EXISTS `agent_migrate_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_migrate_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `migrate_datetime` datetime DEFAULT NULL COMMENT '轉移日期',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '身份; 1:代理, 2:會員',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理系統編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `orig_agent_id` int NOT NULL DEFAULT '0' COMMENT '原代理系統編號',
  `orig_hierarchy_path` text COLLATE utf8mb4_unicode_ci COMMENT '原代理階層',
  `memo` text COLLATE utf8mb4_unicode_ci COMMENT '方便技術記錄用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `agent_migrate_logs_migrate_datetime_index` (`migrate_datetime`),
  KEY `agent_migrate_logs_type_index` (`type`),
  KEY `agent_migrate_logs_agent_id_index` (`agent_id`),
  KEY `agent_migrate_logs_member_id_index` (`member_id`),
  KEY `agent_migrate_logs_orig_agent_id_index` (`orig_agent_id`),
  KEY `agent_migrate_logs_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代理; ID:3~100預設給系統使用, 如System, Auto, unlimit, ....';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_operate_general_logs`
--

DROP TABLE IF EXISTS `agent_operate_general_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_operate_general_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `operator_id` int NOT NULL COMMENT '操作员ID',
  `project_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'WEB_Agent' COMMENT '專案名稱',
  `page_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作页面路徑',
  `request_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '請求方法, HTTP Method',
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'IP',
  `content` json NOT NULL COMMENT '操作內容',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `agent_operate_general_logs_operator_id_index` (`operator_id`),
  KEY `agent_operate_general_logs_project_name_index` (`project_name`),
  KEY `agent_operate_general_logs_page_path_index` (`page_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_operate_logs`
--

DROP TABLE IF EXISTS `agent_operate_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_operate_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `debug_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `used_ip` bigint DEFAULT '0',
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代理後台各種操作紀錄(e.g. 改密碼、修改帳號...)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_permissions`
--

DROP TABLE IF EXISTS `agent_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `agent_id` int NOT NULL COMMENT '代理系統編號(Agent)',
  `agent_menu_id` int NOT NULL COMMENT '代理後台選單系統編號(AgentMenu)',
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '可操作功能：view,create,update,delete(逗號分隔)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `agent_permissions_agent_id_index` (`agent_id`),
  KEY `agent_permissions_agent_menu_id_index` (`agent_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_personal_settings`
--

DROP TABLE IF EXISTS `agent_personal_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_personal_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理id',
  `setting_id` int NOT NULL COMMENT '設置鍵值',
  `sub_category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子分類(可能是語系)',
  `value` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '設置value',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `created_by` int NOT NULL COMMENT '建立人',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`agent_id`,`setting_id`,`sub_category`),
  KEY `agent_personal_settings_agent_id_index` (`agent_id`),
  KEY `agent_personal_settings_setting_id_index` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代理帳號個人設置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_proportions`
--

DROP TABLE IF EXISTS `agent_proportions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_proportions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理編號',
  `hierarchy` int NOT NULL COMMENT '代理階層',
  `proportion_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '第一層占成%數',
  `proportion_2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '第二層占成%數',
  `proportion_3` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '第三層占成%數',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_real_name_validation_requests`
--

DROP TABLE IF EXISTS `agent_real_name_validation_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_real_name_validation_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理ID',
  `validator_id` int DEFAULT NULL COMMENT '審核人員ID',
  `real_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真實姓名',
  `bank_id` int NOT NULL COMMENT '銀行ID',
  `bank_account` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '銀行帳號',
  `status` tinyint NOT NULL COMMENT '狀態, 0: 待審核, 1: 通過, 2: 拒絕',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `agent_real_name_validation_requests_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_setting_defines`
--

DROP TABLE IF EXISTS `agent_setting_defines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_setting_defines` (
  `setting_id` int NOT NULL COMMENT 'PK，非自動流水號',
  `parent` int NOT NULL COMMENT '若是type2，會記錄上層分類id',
  `type` int NOT NULL COMMENT 'type: 1 鍵值分類，type 2: 鍵值 (分類相同的設置是整組一起編輯的)',
  `is_visible` int NOT NULL DEFAULT '1' COMMENT '是否後台可看到編輯',
  `agent_edit` tinyint DEFAULT '0' COMMENT '允許代理編輯',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註說明',
  `language_text_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '多語系對應代碼',
  `default_value` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '首次編輯要帶入的預設值',
  `data_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '資料類型',
  `is_data_required` int NOT NULL DEFAULT '0' COMMENT '此類型設置是否為必填',
  `enable_agents` text COLLATE utf8mb4_unicode_ci COMMENT '是否僅有特定代理可編輯此項目',
  `sort` tinyint NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `created_by` int NOT NULL COMMENT '建立人',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`setting_id`),
  KEY `agent_setting_defines_parent_index` (`parent`),
  KEY `agent_setting_defines_type_index` (`type`),
  KEY `agent_setting_defines_is_visible_index` (`is_visible`),
  KEY `agent_setting_defines_language_text_code_index` (`language_text_code`),
  KEY `agent_setting_defines_data_type_index` (`data_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代理個人設置鍵值定義';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_share_logs`
--

DROP TABLE IF EXISTS `agent_share_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_share_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理id',
  `before_share` int NOT NULL COMMENT '更新前股份',
  `after_share` int NOT NULL COMMENT '更新後股份',
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新log',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  KEY `agent_share_logs_agent_id_index` (`agent_id`),
  KEY `agent_share_logs_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_status_logs`
--

DROP TABLE IF EXISTS `agent_status_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_status_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `target_type` int NOT NULL COMMENT '1: 代理商, 2: 會員',
  `target_id` int NOT NULL COMMENT 'target_type = 1: agents.id, target_type = 2: members.id',
  `before_status` tinyint NOT NULL DEFAULT '0' COMMENT '更改前狀態;0: 停用, 1: 啟用',
  `after_status` tinyint NOT NULL DEFAULT '0' COMMENT '更改後狀態;0: 停用, 1: 啟用',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  PRIMARY KEY (`id`),
  KEY `agent_status_logs_target_type_index` (`target_type`),
  KEY `agent_status_logs_target_id_index` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_templates`
--

DROP TABLE IF EXISTS `agent_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理系統編號',
  `template_id` int NOT NULL COMMENT '模版系統編號',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0不可用,1可使用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `agent_templates_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_temps`
--

DROP TABLE IF EXISTS `agent_temps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_temps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `general_agent_id` int NOT NULL DEFAULT '0' COMMENT '總代理',
  `parent` int NOT NULL COMMENT '上層代理系統編號(Agent)',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `hierarchy_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新版hierarchy結構，存成路徑式的數值',
  `level` tinyint NOT NULL DEFAULT '0',
  `customized_setting_group_id` int DEFAULT '1' COMMENT '個性化設置_組別ID (agent_groups 資料表)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_temps_username_unique` (`username`),
  KEY `agent_temps_parent_index` (`parent`),
  KEY `agent_temps_hierarchy_path_index` (`hierarchy_path`),
  KEY `agent_temps_level_index` (`level`),
  KEY `agent_temps_customized_setting_group_id_index` (`customized_setting_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代理; ID:3~100預設給系統使用, 如System, Auto, unlimit, ....';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_validation_items`
--

DROP TABLE IF EXISTS `agent_validation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_validation_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `agent_id` int NOT NULL COMMENT '代理系統編號',
  `validation_type_id` int NOT NULL COMMENT '驗證類型系統編號',
  `status` tinyint(1) NOT NULL COMMENT '狀態0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_vendor_categories`
--

DROP TABLE IF EXISTS `agent_vendor_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_vendor_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_group_id` int NOT NULL COMMENT '遊戲個性化設置編號',
  `type_id` int NOT NULL COMMENT '遊戲商類別編號; 目前是CJ7的代理傭金(1:slot, 2:score, 3:live, 4:sport, 5:other)',
  `vendor_id` int NOT NULL COMMENT '遊戲商編號',
  `game_type_id` int NOT NULL COMMENT '遊戲類別id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_vendor_disables`
--

DROP TABLE IF EXISTS `agent_vendor_disables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_vendor_disables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `agent_id` int NOT NULL COMMENT '代理商編號',
  `vendor_id` int NOT NULL COMMENT '遊戲商編號',
  `flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_vendors`
--

DROP TABLE IF EXISTS `agent_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_vendors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `agent_id` int NOT NULL COMMENT '營運商系統編號',
  `vendor_id` int NOT NULL COMMENT '遊戲商系統編號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態',
  `self_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '只影響自己層級的status開關',
  `backend_show` int NOT NULL DEFAULT '0' COMMENT '後台顯示',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_vendors_agent_id_index` (`agent_id`),
  KEY `agent_vendors_vendor_id_index` (`vendor_id`),
  KEY `agent_vendors_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_wallets`
--

DROP TABLE IF EXISTS `agent_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_wallets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'agents.id',
  `wallet_type_id` int NOT NULL COMMENT '錢包幣型系統編號(wallet_types)',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '錢包金額',
  `is_unlimited` tinyint(1) NOT NULL DEFAULT '0' COMMENT '錢包金額是否為無線(0:否,1:是)',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:關閉,1:啟用',
  `memo` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`agent_id`,`wallet_type_id`),
  KEY `agent_wallets_agent_id_index` (`agent_id`),
  KEY `agent_wallets_wallet_type_id_index` (`wallet_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代理支援錢包種類';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_withdraw_confirms`
--

DROP TABLE IF EXISTS `agent_withdraw_confirms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_withdraw_confirms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'agent_id',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdraw_confirm` tinyint DEFAULT '1' COMMENT '洗分是否需要同意，0:不需要、1:需要',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態; 0:禁用,1:使用中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '51' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `agent_withdraw_confirms_agent_id_index` (`agent_id`),
  KEY `agent_withdraw_confirms_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `host_id` int NOT NULL DEFAULT '0' COMMENT '主帳號的系統編號(不等於0就是子帳號)',
  `parent` int NOT NULL COMMENT '上層代理系統編號(Agent)',
  `role_id` tinyint NOT NULL DEFAULT '0' COMMENT 'roles.id',
  `hierarchy` text COLLATE utf8mb4_unicode_ci COMMENT '階層樹(json型態)',
  `hierarchy_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新版hierarchy結構，存成路徑式的數值',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邀請碼',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `nickname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '暱稱',
  `real_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '餘額',
  `is_balance_unlimited` tinyint NOT NULL DEFAULT '0' COMMENT '錢包是否為無限額',
  `withdraw_confirm` tinyint NOT NULL DEFAULT '1' COMMENT '洗分是否需要同意，0:不需要、1:需要',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '電子信箱',
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `payment_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '代理支付密碼',
  `cs_sync_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '需同步資料的帳號flag為1',
  `im_certify` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'vworld影子帳號密碼',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '聯繫號碼',
  `percentage` decimal(10,2) DEFAULT NULL COMMENT '百分比',
  `CS_API_USER` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '與客服系統串接的帳號',
  `CS_API_KEY` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '與客服系統串接的KEY',
  `timezone_id` int DEFAULT NULL COMMENT '時區系統編號',
  `country_id` int DEFAULT NULL COMMENT '居住國家(FK_Country)',
  `zip_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '郵政編碼',
  `district` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省/地區/郡',
  `city` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城鎮/城市',
  `address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `frontend_register` tinyint(1) DEFAULT '0' COMMENT '前端是否可以註冊(0:不可註冊,1:可註冊)',
  `has_chat` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否開放聊天室',
  `has_pc` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有PC版',
  `has_mobile` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有手機版',
  `has_online_payment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有線上儲值',
  `has_app` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有APP',
  `has_apk` int NOT NULL DEFAULT '0' COMMENT 'APP顯示開關(android)',
  `has_ipa` int NOT NULL DEFAULT '0' COMMENT 'APP顯示開關(ios)',
  `has_2fa` tinyint NOT NULL DEFAULT '0' COMMENT 'Google驗證器開關, 0:關閉, 1:開啟',
  `transaction_all` tinyint(1) NOT NULL DEFAULT '0' COMMENT '進入遊戲時是否將所有錢轉入，0:否1:是',
  `agent_backend_transaction` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可以在代理後台開洗分，0:否1:是',
  `email_validate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '電子郵件是否需要認證0:不需要,1:需要',
  `mobile_validate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '電子郵件是否需要認證0:不需要,1:需要',
  `mobile_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '電話號碼是否綁定',
  `need_username` tinyint(1) NOT NULL DEFAULT '0' COMMENT '忘記密碼是否需要填寫帳號0:不需要,1:需要',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '帳號狀態 0:鎖定,1:正常',
  `sys_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '系統鎖定; 1:鎖定, 0:非解鎖',
  `last_login` datetime DEFAULT NULL COMMENT '最後登入時間',
  `last_login_ip` bigint DEFAULT '0' COMMENT '最後登入IP',
  `proportion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '代理占成',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '方便技術記錄用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL COMMENT '更新者ID',
  `created_by` int NOT NULL DEFAULT '0' COMMENT '創建代理的操作人',
  `agent_mode` tinyint NOT NULL DEFAULT '0' COMMENT '代理模式類型。1:全民代, 2:三層代理(計算含代理),3:三層代理(計算限定會員)',
  `customized_setting_group_id` int DEFAULT '1' COMMENT '個性化設置_組別ID (agent_groups 資料表)',
  `cash_flow_group_id` int DEFAULT '3' COMMENT '群組編號',
  `sms_gateway_group_id` int NOT NULL DEFAULT '0' COMMENT '簡訊群組ID',
  `chat_group_id` int NOT NULL DEFAULT '0' COMMENT '聊天群組ID',
  `vendor_customize_group_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商個性化設置',
  `organization_id` int NOT NULL DEFAULT '1' COMMENT '所屬組織',
  `binding_scope_id` int NOT NULL DEFAULT '0' COMMENT '小組織ID',
  `last_reset_password` timestamp NULL DEFAULT NULL COMMENT '最後更新密碼時間',
  `realname_validate` tinyint NOT NULL DEFAULT '0' COMMENT '代理實名認證, 0:未認證, 1:已認證, 2:認證中',
  PRIMARY KEY (`id`),
  UNIQUE KEY `agents_username_unique` (`username`),
  KEY `agents_id_hierarchy_path_index` (`id`,`hierarchy_path`),
  KEY `agents_host_id_index` (`host_id`),
  KEY `agents_parent_index` (`parent`),
  KEY `agents_role_id_index` (`role_id`),
  KEY `agents_hierarchy_path_index` (`hierarchy_path`),
  KEY `agents_has_2fa_index` (`has_2fa`),
  KEY `agents_status_index` (`status`),
  KEY `agents_customized_setting_group_id_index` (`customized_setting_group_id`),
  KEY `agents_cash_flow_group_id_index` (`cash_flow_group_id`),
  KEY `agents_sms_gateway_group_id_index` (`sms_gateway_group_id`),
  KEY `agents_chat_group_id_index` (`chat_group_id`),
  KEY `agents_vendor_customize_group_id_index` (`vendor_customize_group_id`),
  KEY `agents_organization_id_index` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代理; ID:3~100預設給系統使用, 如System, Auto, unlimit, ....';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `allbet_accounts`
--

DROP TABLE IF EXISTS `allbet_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `allbet_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `allbet_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `allbet_accounts_username_index` (`username`),
  KEY `allbet_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `allbet_bet_records`
--

DROP TABLE IF EXISTS `allbet_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `allbet_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount - BetCoin',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `allbet_bet_records_bet_id_unique` (`bet_id`),
  KEY `allbet_bet_records_username_index` (`username`),
  KEY `allbet_bet_records_game_code_index` (`game_code`),
  KEY `allbet_bet_records_bet_time_index` (`bet_time`),
  KEY `allbet_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analytics`
--

DROP TABLE IF EXISTS `analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `analytics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `agent_id` int NOT NULL COMMENT '代理系統編號,0為平台資料',
  `type` int NOT NULL COMMENT '類型',
  `code` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '程式碼',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcement_messages`
--

DROP TABLE IF EXISTS `announcement_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '標題',
  `message` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訊息內容',
  `memo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `status` int NOT NULL DEFAULT '1' COMMENT '狀態，1:開啟  0:刪除關閉',
  `organization_id` int NOT NULL COMMENT '所屬組織',
  `start_time` datetime DEFAULT NULL COMMENT '顯示起始時間',
  `end_time` datetime DEFAULT NULL COMMENT '顯示結束時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `created_by` int NOT NULL COMMENT '建立人',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `updated_by` int NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='群發公告訊息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcement_messages_participants`
--

DROP TABLE IF EXISTS `announcement_messages_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_messages_participants` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `announcement_message_id` int NOT NULL COMMENT 'FK對應 announcement_message',
  `type` int NOT NULL COMMENT '類型 1: 針對chat_group  2. 針對代理樹狀  3. 針對單一代理  4. 針對特定Member  99. 針對組織 ',
  `chat_group_id` int DEFAULT NULL COMMENT '發送給特定的 chat_group',
  `hierarchy_agent_id` int DEFAULT NULL COMMENT '發送給特定的代理樹狀所有人',
  `single_agent_id` int DEFAULT NULL COMMENT '發送給特定的代理',
  `member_id` int DEFAULT NULL COMMENT '發送給特定的會員',
  `organization_id` int DEFAULT NULL COMMENT '發送給特定的組織',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='群發公告訊息哪些人可以看到';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcement_messages_reads`
--

DROP TABLE IF EXISTS `announcement_messages_reads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_messages_reads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `announcement_message_id` int NOT NULL COMMENT 'FK對應 announcement_message',
  `member_id` int NOT NULL COMMENT '會員id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='紀錄某一則訊息是否已讀';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL COMMENT '公告類別，1:一般 2:遊戲商 3:緊急 4:重要',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告內容',
  `is_top` tinyint NOT NULL DEFAULT '0' COMMENT '是否置頂, 0:否, 1:是',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `astar_accounts`
--

DROP TABLE IF EXISTS `astar_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `astar_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `vendor_uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲商的玩家 UID-依據遊戲商需求',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家密碼-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家登入用 Token-依據遊戲商需求',
  `admin` int NOT NULL DEFAULT '0' COMMENT '數據操作人員的管理者系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `astar_accounts_username_unique` (`username`),
  KEY `astar_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `astar_accounts_member_id_index` (`member_id`),
  KEY `astar_accounts_vendor_username_index` (`vendor_username`),
  KEY `astar_accounts_vendor_uid_index` (`vendor_uid`),
  KEY `astar_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `astar_bet_records`
--

DROP TABLE IF EXISTS `astar_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `astar_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注單唯一Id, ThemeId',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩、結算時間(UTC)',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未結算,1:已結算',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲 ID-依據遊戲商需求',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼金額-依據遊戲商需求',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '訪問訂單的 Session Token 或 ID-依據遊戲商需求',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `astar_bet_records_bet_id_unique` (`bet_id`),
  KEY `astar_bet_records_vendor_username_index` (`vendor_username`),
  KEY `astar_bet_records_bet_time_index` (`bet_time`),
  KEY `astar_bet_records_payout_time_index` (`payout_time`),
  KEY `astar_bet_records_status_index` (`status`),
  KEY `astar_bet_records_session_token_index` (`session_token`),
  KEY `astar_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baison_accounts`
--

DROP TABLE IF EXISTS `baison_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `baison_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `sub_channel_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '子渠道ID',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `baison_accounts_username_unique` (`username`),
  KEY `baison_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `baison_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baison_bet_records`
--

DROP TABLE IF EXISTS `baison_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `baison_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id, round_id from request',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, game_id from request',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `baison_bet_records_bet_id_unique` (`bet_id`),
  KEY `baison_bet_records_username_index` (`username`),
  KEY `baison_bet_records_updated_at_index` (`updated_at`),
  CONSTRAINT `baison_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `baison_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_account_edit_logs`
--

DROP TABLE IF EXISTS `bank_account_edit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_account_edit_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'bank_accounts.id',
  `before_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '初始金額',
  `after_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '變更後金額',
  `operator` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `bank_account_edit_logs_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_type_id` int NOT NULL COMMENT '銀行id',
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳戶名稱',
  `account_nickname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '帳戶簡稱',
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '銀行帳號',
  `is_deposit` tinyint NOT NULL DEFAULT '0' COMMENT '是否可以開分',
  `is_withdrawal` tinyint NOT NULL DEFAULT '0' COMMENT '是否可以洗分',
  `rate` decimal(10,4) NOT NULL DEFAULT '1.0000' COMMENT '匯率',
  `principal` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '銀行本金',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '銀行金額',
  `qrcode` text COLLATE utf8mb4_unicode_ci COMMENT 'QR Code',
  `min_amount` decimal(18,4) NOT NULL COMMENT '帳戶名稱',
  `max_amount` decimal(18,4) NOT NULL COMMENT '帳戶名稱',
  `use_times` int NOT NULL COMMENT '使用次數',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '狀態',
  `amount_threshold` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '通知金額門檻',
  `count_threshold` int NOT NULL DEFAULT '0' COMMENT '通知次數門檻',
  `last_activated_at` timestamp NULL DEFAULT NULL COMMENT '最後啟用時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bank_accounts_order_type_id_index` (`order_type_id`),
  KEY `bank_accounts_is_deposit_index` (`is_deposit`),
  KEY `bank_accounts_is_withdrawal_index` (`is_withdrawal`),
  KEY `bank_accounts_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_names`
--

DROP TABLE IF EXISTS `bank_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL DEFAULT '0' COMMENT '語言系統編號',
  `bank_id` int NOT NULL COMMENT '銀行編號',
  `name` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '銀行名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_order_types`
--

DROP TABLE IF EXISTS `bank_order_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_order_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bank_id` int NOT NULL DEFAULT '0' COMMENT '語言系統編號',
  `order_type_id` int NOT NULL COMMENT '支付銀行編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bank_order_types_bank_id_index` (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_transaction_logs`
--

DROP TABLE IF EXISTS `bank_transaction_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_transaction_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `account_id` int NOT NULL COMMENT 'bank_accounts.id',
  `source` tinyint NOT NULL DEFAULT '0' COMMENT '1.代理開分,2.代理洗分,3.自助上分,4.自助洗分',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '金额',
  `before_amount` decimal(18,4) NOT NULL COMMENT '改動前金额',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT ' ' COMMENT '備註',
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '實際操作者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `bank_transaction_logs_order_id_index` (`order_id`),
  KEY `bank_transaction_logs_account_id_index` (`account_id`),
  KEY `bank_transaction_logs_source_index` (`source`),
  KEY `bank_transaction_logs_member_id_index` (`member_id`),
  KEY `bank_transaction_logs_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT '代理群組編號',
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '類型; 1:銀行號碼, 2:手機號碼, 3:加密貨幣, 4:外幣銀行, 5:未知, 6:澳洲銀行, 7:澳洲PayId',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '銀行代碼',
  `third_party_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '三方銀行代碼',
  `currency_id` int DEFAULT NULL,
  `info` text COLLATE utf8mb4_unicode_ci COMMENT '相關資訊(json)',
  `rate` decimal(14,9) NOT NULL DEFAULT '1.000000000' COMMENT '匯率(2025/05/05提升至9位)',
  `tax_type` tinyint NOT NULL DEFAULT '0' COMMENT '手續費種類',
  `tax` decimal(11,5) NOT NULL DEFAULT '0.00000' COMMENT '手續費',
  `min_amount` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `max_amount` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `image_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '銀行icon',
  `status` tinyint NOT NULL COMMENT '狀態',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `banner_types`
--

DROP TABLE IF EXISTS `banner_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類型名稱',
  `width` int NOT NULL COMMENT '圖片寬度',
  `height` int NOT NULL COMMENT '圖片高度',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `type_id` int NOT NULL COMMENT '類型',
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '圖片',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '連結位置',
  `start_time` datetime NOT NULL COMMENT '開始日期',
  `end_time` datetime NOT NULL COMMENT '結束日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baracayfish_bet_records`
--

DROP TABLE IF EXISTS `baracayfish_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `baracayfish_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id, round_id from request',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, game_id from request',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `baracayfish_bet_records_bet_id_unique` (`bet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bind_reward_details`
--

DROP TABLE IF EXISTS `bind_reward_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bind_reward_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bind_reward_id` int unsigned NOT NULL COMMENT '綁定獎勵 id',
  `grand_agent_id` int unsigned DEFAULT NULL COMMENT '總代理 id',
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手機號碼, 國碼+手機號碼',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態, 0: 未綁定, 1: 已綁定',
  `member_id` int unsigned DEFAULT NULL COMMENT '會員 id',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP',
  `bind_time` timestamp NULL DEFAULT NULL COMMENT '註冊時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`grand_agent_id`,`phone`),
  KEY `bind_reward_details_bind_reward_id_index` (`bind_reward_id`),
  KEY `bind_reward_details_member_id_index` (`member_id`),
  CONSTRAINT `bind_reward_details_bind_reward_id_foreign` FOREIGN KEY (`bind_reward_id`) REFERENCES `bind_rewards` (`id`),
  CONSTRAINT `bind_reward_details_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bind_rewards`
--

DROP TABLE IF EXISTS `bind_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bind_rewards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reward_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '獎勵名稱',
  `agent_id` int unsigned NOT NULL COMMENT '代理 id',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎勵金額',
  `type` int NOT NULL COMMENT '獎勵類型, 1: 平台點數, 2: 禮碼',
  `flow_limits` json DEFAULT NULL COMMENT '稽核流水設定',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '狀態, 1: 啟用, 2: 停用',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '開始時間',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '結束時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `bind_rewards_agent_id_index` (`agent_id`),
  CONSTRAINT `bind_rewards_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bng_accounts`
--

DROP TABLE IF EXISTS `bng_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bng_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bng_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `bng_accounts_username_index` (`username`),
  KEY `bng_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bng_bet_records`
--

DROP TABLE IF EXISTS `bng_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bng_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '開獎時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `bonus_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活動獎勵ID(活動注單才有)',
  `info` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bng_bet_records_bet_id_unique` (`bet_id`),
  KEY `bng_bet_records_username_index` (`username`),
  KEY `bng_bet_records_game_code_index` (`game_code`),
  KEY `bng_bet_records_bet_time_index` (`bet_time`),
  KEY `bng_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bola2_accounts`
--

DROP TABLE IF EXISTS `bola2_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bola2_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bola2_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `bola2_accounts_username_index` (`username`),
  KEY `bola2_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bola2_bet_records`
--

DROP TABLE IF EXISTS `bola2_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bola2_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `RoundDate` datetime NOT NULL COMMENT '算帳時間',
  `bet_time` datetime NOT NULL COMMENT '開獎時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bola2_bet_records_bet_id_unique` (`bet_id`),
  KEY `bola2_bet_records_username_index` (`username`),
  KEY `bola2_bet_records_game_code_index` (`game_code`),
  KEY `bola2_bet_records_bet_time_index` (`bet_time`),
  KEY `bola2_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bolakk4d_accounts`
--

DROP TABLE IF EXISTS `bolakk4d_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolakk4d_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `vendor_uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲商的玩家 UID-依據遊戲商需求',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家密碼-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家登入用 Token-依據遊戲商需求',
  `admin` int NOT NULL DEFAULT '0' COMMENT '數據操作人員的管理者系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bolakk4d_accounts_username_unique` (`username`),
  KEY `bolakk4d_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `bolakk4d_accounts_member_id_index` (`member_id`),
  KEY `bolakk4d_accounts_vendor_username_index` (`vendor_username`),
  KEY `bolakk4d_accounts_vendor_uid_index` (`vendor_uid`),
  KEY `bolakk4d_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bolakk4d_bet_records`
--

DROP TABLE IF EXISTS `bolakk4d_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolakk4d_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注單唯一Id, ThemeId',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩、結算時間(UTC)',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未結算,1:已結算',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲 ID-依據遊戲商需求',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼金額-依據遊戲商需求',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '訪問投注單的 Session Token 或 ID 簽章-依據遊戲商需求',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `draw_date` int NOT NULL DEFAULT '0' COMMENT '開獎日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bolakk4d_bet_records_bet_id_unique` (`bet_id`),
  KEY `bolakk4d_bet_records_vendor_info_id_index` (`vendor_info_id`),
  KEY `bolakk4d_bet_records_vendor_username_index` (`vendor_username`),
  KEY `bolakk4d_bet_records_bet_time_index` (`bet_time`),
  KEY `bolakk4d_bet_records_payout_time_index` (`payout_time`),
  KEY `bolakk4d_bet_records_session_token_index` (`session_token`),
  KEY `bolakk4d_bet_records_draw_date_index` (`draw_date`),
  KEY `bolakk4d_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bolakk4d_bet_records_new`
--

DROP TABLE IF EXISTS `bolakk4d_bet_records_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolakk4d_bet_records_new` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注單唯一Id, ThemeId',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩、結算時間(UTC)',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未結算,1:已結算',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲 ID-依據遊戲商需求',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼金額-依據遊戲商需求',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '訪問投注單的 Session Token 或 ID 簽章-依據遊戲商需求',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `draw_date` int NOT NULL DEFAULT '0' COMMENT '開獎日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bolakk4d_bet_records_new_bet_id_unique` (`bet_id`),
  KEY `bolakk4d_bet_records_new_vendor_username_index` (`vendor_username`),
  KEY `bolakk4d_bet_records_new_bet_time_index` (`bet_time`),
  KEY `bolakk4d_bet_records_new_payout_time_index` (`payout_time`),
  KEY `bolakk4d_bet_records_new_session_token_index` (`session_token`),
  KEY `bolakk4d_bet_records_new_draw_date_index` (`draw_date`),
  KEY `bolakk4d_bet_records_new_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bolesw_accounts`
--

DROP TABLE IF EXISTS `bolesw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolesw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '商戶編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bolesw_accounts_username_unique` (`username`),
  KEY `bolesw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `bolesw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bolesw_bet_records`
--

DROP TABLE IF EXISTS `bolesw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolesw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ticketNum from request',
  `reference_bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '關聯交易 id, ticketId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '類型, 10=上分 11=上分失败回滚 20=下分',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效下注金額',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩/取消/bonus時間',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT '詳細資訊',
  `settle_status` tinyint NOT NULL DEFAULT '0' COMMENT '結算狀態 0=未結算 1=結算成功 2=結算失敗',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bolesw_bet_records_bet_id_unique` (`bet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `boongosw_accounts`
--

DROP TABLE IF EXISTS `boongosw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `boongosw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `session_token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ' COMMENT '登入token',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `boongosw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `boongosw_accounts_username_index` (`username`),
  KEY `boongosw_accounts_member_id_index` (`member_id`),
  KEY `boongosw_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `boongosw_bet_records`
--

DROP TABLE IF EXISTS `boongosw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `boongosw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id',
  `vendor_info_id` int NOT NULL COMMENT '遊戲商設定編號',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩時間',
  `status` tinyint NOT NULL COMMENT '狀態;0:未結算,1:已結算',
  `version` int NOT NULL COMMENT '版本(API回傳用);0:投注時創建,n:後面更改了n次',
  `infos` text COLLATE utf8mb4_unicode_ci COMMENT 'API回傳資料',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `boongosw_bet_records_bet_id_unique` (`bet_id`),
  KEY `boongosw_bet_records_vendor_info_id_index` (`vendor_info_id`),
  KEY `boongosw_bet_records_username_index` (`username`),
  KEY `boongosw_bet_records_payout_time_index` (`payout_time`),
  KEY `boongosw_bet_records_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `boongosw_cancel_records`
--

DROP TABLE IF EXISTS `boongosw_cancel_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `boongosw_cancel_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'boongosw_accounts.username',
  `bet_id` bigint NOT NULL DEFAULT '0' COMMENT 'boongosw_bet_records.bet_id',
  `bet_record_id` bigint NOT NULL DEFAULT '0' COMMENT 'boongosw_bet_records.id',
  `api_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'API回傳的bet',
  `api_win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'API回傳的win',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '處理狀態 0:待處理,1:成功,2:失敗',
  `response_data` text COLLATE utf8mb4_unicode_ci COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `boongosw_cancel_records_bet_id_index` (`bet_id`),
  KEY `boongosw_cancel_records_bet_record_id_index` (`bet_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `boracayfish_accounts`
--

DROP TABLE IF EXISTS `boracayfish_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `boracayfish_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '商戶編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `boracayfish_accounts_username_unique` (`username`),
  KEY `boracayfish_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `boracayfish_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `boracayfish_bet_records`
--

DROP TABLE IF EXISTS `boracayfish_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `boracayfish_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id, round_id from request',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, game_id from request',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `boracayfish_bet_records_bet_id_unique` (`bet_id`),
  KEY `boracayfish_bet_records_username_index` (`username`),
  KEY `boracayfish_bet_records_updated_at_index` (`updated_at`),
  CONSTRAINT `boracayfish_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `boracayfish_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brand_agents`
--

DROP TABLE IF EXISTS `brand_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int NOT NULL DEFAULT '0' COMMENT 'brands.id',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'agents.id',
  `sort` int NOT NULL DEFAULT '0',
  `info` text COLLATE utf8mb4_unicode_ci,
  `lang_content` text COLLATE utf8mb4_unicode_ci COMMENT '語言內容',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`brand_id`,`agent_id`),
  KEY `brand_agents_brand_id_index` (`brand_id`),
  KEY `brand_agents_agent_id_index` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='TGBOT所用的商家資訊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'brand name',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'brand code',
  `bot_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'tg bot id',
  `bot_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'tg bot token',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態; 0:停用, 1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='TGBOT 商家';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulletin_type_names`
--

DROP TABLE IF EXISTS `bulletin_type_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulletin_type_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL COMMENT '語言系統編號',
  `type_id` int NOT NULL COMMENT '會員驗證系統編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲類型名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulletin_types`
--

DROP TABLE IF EXISTS `bulletin_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulletin_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別名稱',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulletins`
--

DROP TABLE IF EXISTS `bulletins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulletins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `type_id` int NOT NULL COMMENT '類型',
  `language_id` int NOT NULL COMMENT '語系系統編號',
  `country_id` int DEFAULT '0' COMMENT '國家系統編號',
  `agent_id` int DEFAULT '0' COMMENT '代理系統編號',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '標題',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '內容',
  `is_public` tinyint(1) NOT NULL COMMENT '0:private,1:public',
  `start_time` datetime NOT NULL COMMENT '開始日期',
  `end_time` datetime NOT NULL COMMENT '結束日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c93_accounts`
--

DROP TABLE IF EXISTS `c93_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `c93_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `c93_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `c93_accounts_username_index` (`username`),
  KEY `c93_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c93_bet_records`
--

DROP TABLE IF EXISTS `c93_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `c93_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `c93_bet_records_bet_id_unique` (`bet_id`),
  KEY `c93_bet_records_username_index` (`username`),
  KEY `c93_bet_records_bet_time_index` (`bet_time`),
  KEY `c93_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancel_unlimit_logs`
--

DROP TABLE IF EXISTS `cancel_unlimit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancel_unlimit_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `date` date NOT NULL COMMENT '日期',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注額',
  `type` tinyint NOT NULL COMMENT '1: 禁止派獎, 2: 可以派獎',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cancel_unlimit_logs_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_flow_banks`
--

DROP TABLE IF EXISTS `cash_flow_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_flow_banks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cash_flow_id` bigint unsigned NOT NULL COMMENT '對應 cash_flows.id',
  `currency_id` bigint unsigned NOT NULL COMMENT '幣別 ID',
  `bank_id` bigint unsigned NOT NULL COMMENT '對應 banks.id（平台銀行主檔）',
  `bank_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '我方銀行代碼，對應 banks.code',
  `provider_bank_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '第三方金流提供的銀行代碼',
  `min_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '渠道層級最低金額限制',
  `max_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '渠道層級最高金額限制（0 = 不限制）',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '狀態: 1=啟用, 0=停用',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT '額外設定，如支行資訊等',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cash_flow_banks_cash_flow_id_currency_id_bank_id_unique` (`cash_flow_id`,`currency_id`,`bank_id`),
  KEY `cash_flow_banks_cash_flow_id_currency_id_index` (`cash_flow_id`,`currency_id`),
  KEY `cash_flow_banks_bank_id_index` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_flow_infos`
--

DROP TABLE IF EXISTS `cash_flow_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_flow_infos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cash_flow_id` int NOT NULL DEFAULT '0' COMMENT 'cash_flows.Id',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT 'API使用資訊',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '設置啟用狀態 0:停用, 1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cash_flow_infos_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_flow_names`
--

DROP TABLE IF EXISTS `cash_flow_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_flow_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL COMMENT '語言系統編號',
  `cash_flow_id` int NOT NULL COMMENT '金流類型系統編號',
  `agent_group_id` int NOT NULL COMMENT '群組編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '金流類型名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `cash_flow_names_language_id_index` (`language_id`),
  KEY `cash_flow_names_cash_flow_id_index` (`cash_flow_id`),
  KEY `cash_flow_names_agent_group_id_index` (`agent_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_flows`
--

DROP TABLE IF EXISTS `cash_flows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_flows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `third_party_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '三方代碼; 如果是聚合金流商, 就用同一個代碼',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '金流商名稱',
  `rate` decimal(11,5) NOT NULL DEFAULT '1.00000',
  `percentage` decimal(11,5) NOT NULL DEFAULT '0.00000',
  `type` int NOT NULL COMMENT '支付類別; 1.線上支付, 2線下支付, 3.代付, 4.自助洗分',
  `status` tinyint(1) NOT NULL COMMENT '狀態0:停用,1:啟用',
  `remark` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `cash_flows_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` int NOT NULL COMMENT 'organizations.id',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'name',
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '代理ID(agents.id)',
  `sort` tinyint NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態; 0:停用, 1:啟用',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作人員',
  PRIMARY KEY (`id`),
  KEY `categories_organization_id_index` (`organization_id`),
  KEY `categories_code_index` (`code`),
  KEY `categories_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category_names`
--

DROP TABLE IF EXISTS `category_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL COMMENT 'categories.id',
  `language_id` int NOT NULL COMMENT 'languages.id',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'name',
  `image_type` tinyint NOT NULL DEFAULT '0' COMMENT '圖片類型; 0:url, 1:base64',
  `image` text COLLATE utf8mb4_unicode_ci COMMENT '圖片',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `category_names_category_id_index` (`category_id`),
  KEY `category_names_language_id_index` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkin_activities`
--

DROP TABLE IF EXISTS `checkin_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_activities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '總代理id',
  `flow_limit_multiple` int unsigned NOT NULL DEFAULT '0' COMMENT '流水限制倍數',
  `ip_block` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否阻擋重複IP',
  `phone_block` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否阻擋重複手機號',
  `account_block` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否阻擋重複真實姓名',
  `start_date` timestamp NULL DEFAULT NULL COMMENT '開始時間',
  `end_date` timestamp NULL DEFAULT NULL COMMENT '結束時間',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '狀態',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkin_activities_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkin_prize_records`
--

DROP TABLE IF EXISTS `checkin_prize_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_prize_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `checkin_record_id` int unsigned NOT NULL COMMENT '打卡紀錄id',
  `checkin_prize_id` int unsigned NOT NULL COMMENT '打卡獎品id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkin_prize_records_checkin_record_id_index` (`checkin_record_id`),
  CONSTRAINT `checkin_prize_records_checkin_record_id_foreign` FOREIGN KEY (`checkin_record_id`) REFERENCES `checkin_records` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkin_prizes`
--

DROP TABLE IF EXISTS `checkin_prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_prizes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `checkin_activity_id` int unsigned NOT NULL COMMENT '打卡活動id',
  `day` int NOT NULL COMMENT '打卡天數',
  `prize_type` int NOT NULL COMMENT '獎品類型 1:平台點數 2:禮碼點數 3:商城點數',
  `prize_amount` decimal(8,2) NOT NULL COMMENT '獎品點數',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkin_prizes_checkin_activity_id_index` (`checkin_activity_id`),
  CONSTRAINT `checkin_prizes_checkin_activity_id_foreign` FOREIGN KEY (`checkin_activity_id`) REFERENCES `checkin_activities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkin_records`
--

DROP TABLE IF EXISTS `checkin_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `checkin_activity_id` int unsigned NOT NULL COMMENT '打卡活動id',
  `member_id` int NOT NULL COMMENT '會員id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkin_records_checkin_activity_id_index` (`checkin_activity_id`),
  KEY `checkin_records_member_id_index` (`member_id`),
  KEY `checkin_records_created_at_index` (`created_at`),
  CONSTRAINT `checkin_records_checkin_activity_id_foreign` FOREIGN KEY (`checkin_activity_id`) REFERENCES `checkin_activities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chicken_game_accounts`
--

DROP TABLE IF EXISTS `chicken_game_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chicken_game_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鬥雞帳號',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '鬥雞餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clear_flow_limit_applications`
--

DROP TABLE IF EXISTS `clear_flow_limit_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clear_flow_limit_applications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT 'members.id',
  `flow_limit_id` int NOT NULL DEFAULT '0' COMMENT 'flow_limits.id',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態; 0: 待審核, 1: 成功, 2:拒絕',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備注',
  `operator` int NOT NULL DEFAULT '0' COMMENT 'agents.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `clear_flow_limit_applications_member_id_index` (`member_id`),
  KEY `clear_flow_limit_applications_operator_index` (`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clotlssw_accounts`
--

DROP TABLE IF EXISTS `clotlssw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clotlssw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '商戶編號',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clotlssw_accounts_username_unique` (`username`),
  KEY `clotlssw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `clotlssw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clotlssw_bet_records`
--

DROP TABLE IF EXISTS `clotlssw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clotlssw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ticketNum from request',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效下注金額',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩/取消/bonus時間',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT '詳細資訊',
  `settle_status` tinyint NOT NULL DEFAULT '0' COMMENT '結算狀態 0=未結算 1=已結算 2=取消',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clotlssw_bet_records_bet_id_unique` (`bet_id`),
  KEY `clotlssw_bet_records_username_index` (`username`),
  KEY `clotlssw_bet_records_payout_time_index` (`payout_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clotp2psw_accounts`
--

DROP TABLE IF EXISTS `clotp2psw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clotp2psw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '商戶編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clotp2psw_accounts_username_unique` (`username`),
  KEY `clotp2psw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `clotp2psw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clotp2psw_bet_records`
--

DROP TABLE IF EXISTS `clotp2psw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clotp2psw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ticketNum from request',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效下注金額',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩/取消/bonus時間',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT '詳細資訊',
  `settle_status` tinyint NOT NULL DEFAULT '0' COMMENT '結算狀態 0=未結算 1=已結算 2=取消',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clotp2psw_bet_records_bet_id_unique` (`bet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clotsw_accounts`
--

DROP TABLE IF EXISTS `clotsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clotsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '商戶編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clotsw_accounts_username_unique` (`username`),
  KEY `clotsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `clotsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clotsw_bet_records`
--

DROP TABLE IF EXISTS `clotsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clotsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ticketNum from request',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效下注金額',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩/取消/bonus時間',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT '詳細資訊',
  `settle_status` tinyint NOT NULL DEFAULT '0' COMMENT '結算狀態 0=未結算 1=已結算 2=取消',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clotsw_bet_records_bet_id_unique` (`bet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coke_fighting_accounts`
--

DROP TABLE IF EXISTS `coke_fighting_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coke_fighting_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鬥雞帳號',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '鬥雞餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `command_logs`
--

DROP TABLE IF EXISTS `command_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `command_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL,
  `command` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `usages` decimal(10,2) DEFAULT NULL,
  `cronjob` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trace_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '追蹤碼，用於追蹤排程任務的所有日誌',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `command_logs_day_index` (`day`),
  KEY `command_logs_command_index` (`command`),
  KEY `command_logs_status_index` (`status`),
  KEY `command_logs_cronjob_index` (`cronjob`),
  KEY `command_logs_trace_id_index` (`trace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '國家代碼',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '國家名稱',
  `country_code` int NOT NULL DEFAULT '0' COMMENT '國碼',
  `phone_rule` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '電話號碼規則',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:啟用',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序權重',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `countries_sort_index` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country_names`
--

DROP TABLE IF EXISTS `country_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL COMMENT '語言系統編號',
  `country_id` int NOT NULL COMMENT '國家系統編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '國家名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coupon_batches`
--

DROP TABLE IF EXISTS `coupon_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_batches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '批次序號',
  `agent_id` int NOT NULL COMMENT '代理編號',
  `all_downline` int NOT NULL DEFAULT '0' COMMENT '是否開啟整條線路',
  `type` tinyint NOT NULL COMMENT '1:點數, 2:禮碼',
  `quantity` int NOT NULL COMMENT '數量',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '金額',
  `flow_limit_multiple` int NOT NULL DEFAULT '0' COMMENT '稽核流水倍數',
  `receive_limit` int NOT NULL DEFAULT '1' COMMENT '會員可領取次數 0:無限制',
  `mobile_daily_limit` int NOT NULL DEFAULT '0' COMMENT '手機號每日可領取次數 0:無限制',
  `realname_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要實名認證',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態; 0:關閉, 1:開啟',
  `start_time` datetime NOT NULL COMMENT '開始時間',
  `end_time` datetime NOT NULL COMMENT '結束時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_batches_batch_code_unique` (`batch_code`),
  KEY `coupon_batches_agent_id_index` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coupon_codes`
--

DROP TABLE IF EXISTS `coupon_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_codes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int NOT NULL COMMENT '批次ID',
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '優惠碼',
  `used_at` datetime DEFAULT NULL COMMENT '使用時間',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手機號碼',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_codes_code_unique` (`code`),
  KEY `coupon_codes_batch_id_index` (`batch_id`),
  KEY `coupon_codes_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crsw_accounts`
--

DROP TABLE IF EXISTS `crsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `crsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `crsw_accounts_username_unique` (`username`),
  KEY `crsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `crsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crsw_bet_records`
--

DROP TABLE IF EXISTS `crsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `crsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單id',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `result` int NOT NULL COMMENT '0:未有結果, 1:輸, 2:贏, 3:和, 4:取消',
  `status` int NOT NULL COMMENT '1:PlaceBet, 2:CancelBet, 3:RevertBet, 4:SettleBet, 5:UnsettleBet',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效下注金額',
  `de_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '實際扣除金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `result_date` datetime DEFAULT NULL COMMENT '算結果的日期時間',
  `settle_date` datetime NOT NULL COMMENT '注單異動時間',
  `order_date` datetime NOT NULL COMMENT '歸帳日期',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `result_infos` json DEFAULT NULL COMMENT 'result 詳細資訊',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `crsw_bet_records_bet_id_unique` (`bet_id`),
  KEY `crsw_bet_records_username_index` (`username`),
  CONSTRAINT `crsw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `crsw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cs_agent_wallets`
--

DROP TABLE IF EXISTS `cs_agent_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_agent_wallets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'agent_id',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit_of_credit` decimal(18,4) DEFAULT '0.0000' COMMENT '開分/洗分額度',
  `used_credit` decimal(18,4) DEFAULT '0.0000' COMMENT '已使用額度',
  `transaction_type` tinyint NOT NULL DEFAULT '1' COMMENT '開洗分模式1:一般2:紅包',
  `withdraw_confirm` tinyint DEFAULT '1' COMMENT '洗分是否需要同意，0:不需要、1:需要',
  `balance_limit` tinyint(1) NOT NULL DEFAULT '1' COMMENT '金額限制; 0:無限,1:有限',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '金額',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態; 0:禁用,1:使用中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '51' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `cs_agent_wallets_agent_id_index` (`agent_id`),
  KEY `cs_agent_wallets_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ct_accounts`
--

DROP TABLE IF EXISTS `ct_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ct_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `ct_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `ct_accounts_username_index` (`username`),
  KEY `ct_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ct_bet_records`
--

DROP TABLE IF EXISTS `ct_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ct_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `betId` bigint NOT NULL DEFAULT '0' COMMENT '注单唯一Id',
  `userName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `GameId` int NOT NULL DEFAULT '0' COMMENT '游戏Id',
  `betTimeUtc` timestamp NULL DEFAULT NULL COMMENT '押注時間 UTC',
  `calTimeUtc` timestamp NULL DEFAULT NULL COMMENT '结算时间 UTC',
  `winOrLoss` decimal(18,4) NOT NULL COMMENT '派彩金额 (输赢应扣除下注金额)',
  `betPoints` decimal(18,4) NOT NULL COMMENT '下注金额',
  `availableBet` decimal(18,4) NOT NULL COMMENT '有效下注金额',
  `isRevocation` int NOT NULL COMMENT '是否结算：0:未结算, 1:已结算, 2:已撤销(该注单为对冲注单)',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ct_bet_records_betid_unique` (`betId`),
  KEY `ct_bet_records_username_index` (`userName`),
  KEY `ct_bet_records_gameid_index` (`GameId`),
  KEY `ct_bet_records_bettimeutc_index` (`betTimeUtc`),
  KEY `ct_bet_records_caltimeutc_index` (`calTimeUtc`),
  KEY `ct_bet_records_isrevocation_index` (`isRevocation`),
  KEY `ct_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '貨幣代碼',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '貨幣名稱',
  `rate` decimal(18,4) NOT NULL COMMENT '匯率',
  `deposit_rate` decimal(20,8) NOT NULL DEFAULT '1.00000000' COMMENT '代收匯率（主要貨幣固定為 1）',
  `withdrawal_rate` decimal(20,8) NOT NULL DEFAULT '1.00000000' COMMENT '代付匯率（主要貨幣固定為 1）',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:啟用',
  `sort` int unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_names`
--

DROP TABLE IF EXISTS `currency_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL COMMENT '語言系統編號',
  `currency_id` int NOT NULL COMMENT '貨幣系統編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '貨幣名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_audit_times`
--

DROP TABLE IF EXISTS `customer_audit_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_audit_times` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL DEFAULT '0' COMMENT '訂單編號',
  `cash_flow_id` int NOT NULL DEFAULT '0' COMMENT '金流資料編號',
  `type` tinyint NOT NULL COMMENT '1:審核 2:通過',
  `operator_time` datetime NOT NULL COMMENT '操作時間',
  `operator` int NOT NULL DEFAULT '0' COMMENT '操作人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `customer_audit_times_order_id_index` (`order_id`),
  KEY `customer_audit_times_cash_flow_id_index` (`cash_flow_id`),
  KEY `customer_audit_times_type_index` (`type`),
  KEY `customer_audit_times_updated_at_index` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_proportions`
--

DROP TABLE IF EXISTS `customer_proportions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_proportions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理編號',
  `type` int NOT NULL COMMENT '類別 1: 總公司 2: 分公司',
  `proportions` decimal(8,2) NOT NULL COMMENT '公司占成',
  `vendor_fee` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司盤費',
  `bonus` decimal(8,2) NOT NULL COMMENT 'Bonus',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dct_accounts`
--

DROP TABLE IF EXISTS `dct_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dct_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dct_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `dct_accounts_username_index` (`username`),
  KEY `dct_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dct_bet_records`
--

DROP TABLE IF EXISTS `dct_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dct_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `pay_time` datetime NOT NULL COMMENT '派彩時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `bet_status` tinyint NOT NULL DEFAULT '1' COMMENT '注單狀態 0: 取消 1:成功',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dct_bet_records_bet_id_unique` (`bet_id`),
  KEY `dct_bet_records_username_index` (`username`),
  KEY `dct_bet_records_game_code_index` (`game_code`),
  KEY `dct_bet_records_bet_time_index` (`bet_time`),
  KEY `dct_bet_records_bet_status_index` (`bet_status`),
  KEY `dct_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dct_records`
--

DROP TABLE IF EXISTS `dct_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dct_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `round_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注单唯一Id, ThemeId',
  `wager_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `wager_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單類型',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '金额',
  `create_time` datetime NOT NULL COMMENT '注單時間(utc)',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`round_id`,`wager_id`),
  KEY `dct_records_round_id_index` (`round_id`),
  KEY `dct_records_wager_id_index` (`wager_id`),
  KEY `dct_records_username_index` (`username`),
  KEY `dct_records_game_code_index` (`game_code`),
  KEY `dct_records_wager_type_index` (`wager_type`),
  KEY `dct_records_create_time_index` (`create_time`),
  KEY `dct_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `debug_info_logs`
--

DROP TABLE IF EXISTS `debug_info_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `debug_info_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分類',
  `msg` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '紀錄',
  `memo_1` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註1',
  `memo_2` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註2',
  `number_value_1` bigint DEFAULT NULL COMMENT '數字資訊1',
  `number_value_2` bigint DEFAULT NULL COMMENT '數字資訊2',
  `user_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP位址',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `user_identity` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用戶識別資訊',
  `info_level` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '資訊等級',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='主要是提供前端紀錄一些debug log資訊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dg_accounts`
--

DROP TABLE IF EXISTS `dg_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dg_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `dg_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `dg_accounts_username_index` (`username`),
  KEY `dg_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dg_bet_records`
--

DROP TABLE IF EXISTS `dg_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dg_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `betId` bigint NOT NULL DEFAULT '0' COMMENT '注单唯一Id',
  `userName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `lobbyId` int NOT NULL DEFAULT '0' COMMENT '游戏大厅号3和4:现场厅, 5:南海厅 , 7:国际厅',
  `tableId` int NOT NULL DEFAULT '0' COMMENT '游戏桌号',
  `shoeId` bigint NOT NULL DEFAULT '0' COMMENT '游戏靴号',
  `playId` bigint NOT NULL DEFAULT '0' COMMENT '游戏局号',
  `GameType` int NOT NULL DEFAULT '0' COMMENT '游戏类型',
  `GameId` int NOT NULL DEFAULT '0' COMMENT '游戏Id',
  `memberId` bigint NOT NULL DEFAULT '0' COMMENT '会员Id',
  `betTime` timestamp NULL DEFAULT NULL COMMENT '押注時間',
  `calTime` timestamp NULL DEFAULT NULL COMMENT '结算时间',
  `betTimeUtc` timestamp NULL DEFAULT NULL COMMENT '押注時間 UTC',
  `calTimeUtc` timestamp NULL DEFAULT NULL COMMENT '结算时间 UTC',
  `winOrLoss` decimal(18,4) NOT NULL COMMENT '派彩金额 (输赢应扣除下注金额)',
  `betPoints` decimal(18,4) NOT NULL COMMENT '下注金额',
  `betPointsz` decimal(18,4) NOT NULL COMMENT '好路追注金额',
  `availableBet` decimal(18,4) NOT NULL COMMENT '有效下注金额',
  `result` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏结果',
  `betDetail` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下注注单',
  `ip` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏结果',
  `ext` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏唯一ID',
  `isRevocation` int NOT NULL COMMENT '是否结算：0:未结算, 1:已结算, 2:已撤销(该注单为对冲注单)',
  `balanceBefore` decimal(18,4) NOT NULL COMMENT '余额',
  `parentBetId` bigint NOT NULL DEFAULT '0' COMMENT '货币ID',
  `currencyId` int NOT NULL DEFAULT '0' COMMENT '撤销的那比注单的ID',
  `deviceType` int NOT NULL DEFAULT '0' COMMENT '下注时客户端类型',
  `pluginid` int NOT NULL DEFAULT '0' COMMENT '追注转账流水号',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dg_bet_records_betid_unique` (`betId`),
  KEY `dg_bet_records_username_index` (`userName`),
  KEY `dg_bet_records_bettimeutc_index` (`betTimeUtc`),
  KEY `dg_bet_records_caltimeutc_index` (`calTimeUtc`),
  KEY `dg_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_agents`
--

DROP TABLE IF EXISTS `domain_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain_agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int NOT NULL COMMENT '網域系統編號;',
  `domain_type_info_id` int NOT NULL COMMENT '網域資訊系統編號;',
  `agent_id` int NOT NULL COMMENT '代理系統編號;',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0未使用,1使用中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '1' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`domain_id`,`agent_id`),
  KEY `domain_agents_domain_id_index` (`domain_id`),
  KEY `domain_agents_domain_type_info_id_index` (`domain_type_info_id`),
  KEY `domain_agents_agent_id_index` (`agent_id`),
  KEY `domain_agents_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_type_infos`
--

DROP TABLE IF EXISTS `domain_type_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain_type_infos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `domain_type_id` int NOT NULL DEFAULT '0' COMMENT '網域類型系統編號,0為公版',
  `template_id` int NOT NULL DEFAULT '0' COMMENT '模版系統編號,0為公版',
  `mobile_templates` tinyint(1) NOT NULL DEFAULT '0' COMMENT '手機模版系統編號',
  `pc_templates` int NOT NULL DEFAULT '0' COMMENT '電腦模版系統編號',
  `logo_pc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '電腦版Logo',
  `logo_mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手機版Logo',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'favorite icon',
  `add_home_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '添加主螢幕教學圖片網址',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '網站名稱',
  `type` tinyint DEFAULT '0' COMMENT '類型: 0:正常, 1:推廣用(因為可能會用到短網址, 故其他在回給前端可能不適合)',
  `need_login` tinyint NOT NULL DEFAULT '1' COMMENT '是否可使用公開頁面',
  `info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其他資訊',
  `memo` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '1' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `domain_type_infos_domain_type_id_index` (`domain_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_types`
--

DROP TABLE IF EXISTS `domain_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '網域類型名稱',
  `memo` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0未使用,1使用中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '1' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `domain_types_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `domains` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `domain_type_id` int NOT NULL COMMENT '網域類型系統編號;',
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '網址名稱',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0未使用,1使用中',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '1' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domains_domain_unique` (`domain`),
  KEY `domains_domain_type_id_index` (`domain_type_id`),
  KEY `domains_status_index` (`status`),
  KEY `domains_sort_index` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ds88_accounts`
--

DROP TABLE IF EXISTS `ds88_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ds88_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ds88_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `ds88_accounts_username_index` (`username`),
  KEY `ds88_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ds88_bet_records`
--

DROP TABLE IF EXISTS `ds88_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ds88_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `settled_time` datetime NOT NULL COMMENT '結算時間(utc)',
  `bet_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單狀態',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ds88_bet_records_bet_id_unique` (`bet_id`),
  KEY `ds88_bet_records_username_index` (`username`),
  KEY `ds88_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ebet_accounts`
--

DROP TABLE IF EXISTS `ebet_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ebet_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ebet帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ebet密碼',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ebet餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `ebet_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `ebet_accounts_username_index` (`username`),
  KEY `ebet_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ebet_bet_records`
--

DROP TABLE IF EXISTS `ebet_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ebet_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用戶名',
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用戶獨立ID',
  `gameType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲類型',
  `gameName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲名稱',
  `betHistoryId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下注記錄ID,唯一ID',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注額',
  `validBet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注額',
  `payout` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '盈餘',
  `payoutWithoutholding` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '單純派彩金額 若沒有預扣金額，參數值會和payout相同 若有預扣金額，計算公式為payout – niuniuWithholdingtotal，其參數值大於0是玩家贏錢，等於0是玩家輸錢',
  `niuniuWithHoldingTotal` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '牛牛預扣加總',
  `betMap` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下注項目',
  `roundNo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '牌局號',
  `payoutDetail` text COLLATE utf8mb4_unicode_ci COMMENT '派彩詳情',
  `judgeResult` text COLLATE utf8mb4_unicode_ci COMMENT '開牌結果',
  `playerCards` text COLLATE utf8mb4_unicode_ci COMMENT '閒家牌型',
  `playerResult` int DEFAULT NULL COMMENT '閒家結果',
  `bankerCards` text COLLATE utf8mb4_unicode_ci COMMENT '庄家牌型',
  `bankerResult` int DEFAULT NULL COMMENT '庄家結果',
  `allDices` text COLLATE utf8mb4_unicode_ci COMMENT '骰寶所有骰子',
  `dragonCard` int DEFAULT NULL COMMENT '龍虎，龍的牌型',
  `tigerCard` int DEFAULT NULL COMMENT '龍虎，虎的牌型',
  `number` int DEFAULT NULL COMMENT '輪盤遊戲，結果數字',
  `niuniuResult` text COLLATE utf8mb4_unicode_ci COMMENT '牛牛牌型比較結果',
  `niuniuWithHoldingDetail` text COLLATE utf8mb4_unicode_ci COMMENT '牛牛預扣betType細節參數',
  `createTime` int DEFAULT NULL COMMENT '開始時間',
  `utc_create_time` datetime DEFAULT NULL COMMENT 'utc開始時間',
  `payoutTime` int DEFAULT NULL COMMENT '結算時間',
  `utc_payout_time` datetime DEFAULT NULL COMMENT 'utc結算時間',
  `platform` int DEFAULT NULL COMMENT '玩家遊戲平台,-1:other,0:andorid,1:iOS,2:Mobile H5,3:PC H5',
  `info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ebet_bet_records_bethistoryid_unique` (`betHistoryId`),
  KEY `ebet_bet_records_username_index` (`username`),
  KEY `ebet_bet_records_gametype_index` (`gameType`),
  KEY `ebet_bet_records_utc_payout_time_index` (`utc_payout_time`),
  KEY `ebet_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `epic_sw_accounts`
--

DROP TABLE IF EXISTS `epic_sw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `epic_sw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `session_token` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登入token',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `epic_sw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `epic_sw_accounts_username_index` (`username`),
  KEY `epic_sw_accounts_member_id_index` (`member_id`),
  KEY `epic_sw_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `epic_sw_bet_records`
--

DROP TABLE IF EXISTS `epic_sw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `epic_sw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'N:normal, B:bonus, J:jackpot',
  `bet_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `result_id` bigint NOT NULL DEFAULT '0',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `payout_time` datetime NOT NULL COMMENT '派彩時間(UTC)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `valid_bet` decimal(18,4) DEFAULT '0.0000' COMMENT '有效投注',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼金额',
  `bonus` decimal(18,4) DEFAULT '0.0000' COMMENT 'bonus/jackpot',
  `status` int NOT NULL DEFAULT '1' COMMENT '注單狀態 0: 取消 1:成功',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`,`payout_time`),
  UNIQUE KEY `unique_index` (`type`,`bet_id`,`payout_time`),
  KEY `epic_sw_bet_records_type_index` (`type`),
  KEY `epic_sw_bet_records_bet_id_index` (`bet_id`),
  KEY `epic_sw_bet_records_result_id_index` (`result_id`),
  KEY `epic_sw_bet_records_username_index` (`username`),
  KEY `epic_sw_bet_records_game_code_index` (`game_code`),
  KEY `epic_sw_bet_records_payout_time_index` (`payout_time`),
  KEY `epic_sw_bet_records_status_index` (`status`),
  KEY `epic_sw_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `epic_sw_event_records`
--

DROP TABLE IF EXISTS `epic_sw_event_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `epic_sw_event_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `operator_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'OperatorId',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注单類型',
  `tran_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'TranId',
  `event_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'BonusId / JackpotId',
  `event_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'BonusName',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'PlayerId',
  `payout_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'Payout',
  `tran_date_time` datetime NOT NULL,
  `session_token` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AuthToken',
  `result` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Result',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:已處理,1:未處理',
  `exchange_rate` decimal(6,4) NOT NULL DEFAULT '0.0000' COMMENT 'ExchangeRate',
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'currency',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`type`,`tran_id`),
  KEY `epic_sw_event_records_tran_id_index` (`tran_id`),
  KEY `epic_sw_event_records_event_id_index` (`event_id`),
  KEY `epic_sw_event_records_username_index` (`username`),
  KEY `epic_sw_event_records_session_token_index` (`session_token`),
  KEY `epic_sw_event_records_status_index` (`status`),
  KEY `epic_sw_event_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `epic_sw_record_histories`
--

DROP TABLE IF EXISTS `epic_sw_record_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `epic_sw_record_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `operator_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'OperatorId',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注单類型',
  `bet_id` bigint NOT NULL DEFAULT '0' COMMENT 'bet_id / tran_id',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'PlayerId',
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'GameCode',
  `round_id` bigint NOT NULL DEFAULT '0' COMMENT 'RoundId',
  `bonus_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'BonusId / ',
  `bet_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'BetAmount',
  `rolling_chip_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼',
  `valid_bet_amount` decimal(18,4) DEFAULT NULL COMMENT 'ValidBetAmount',
  `payout_amount` decimal(18,4) DEFAULT NULL COMMENT 'Payout',
  `win_lose_amount` decimal(18,4) DEFAULT NULL COMMENT 'WinLose',
  `tran_date_time` datetime NOT NULL,
  `session_token` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AuthToken',
  `result_id` bigint DEFAULT NULL COMMENT 'ResultId',
  `result_type` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:Single/Quick Game Round Result,1:Single/Quick Game Refund',
  `result` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Result',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:已處理,1:未處理',
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'currency',
  `exchange_rate` decimal(6,4) NOT NULL DEFAULT '0.0000' COMMENT 'ExchangeRate',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`type`,`bet_id`),
  KEY `epic_sw_record_histories_type_index` (`type`),
  KEY `epic_sw_record_histories_bet_id_index` (`bet_id`),
  KEY `epic_sw_record_histories_username_index` (`username`),
  KEY `epic_sw_record_histories_game_code_index` (`game_code`),
  KEY `epic_sw_record_histories_round_id_index` (`round_id`),
  KEY `epic_sw_record_histories_tran_date_time_index` (`tran_date_time`),
  KEY `epic_sw_record_histories_session_token_index` (`session_token`),
  KEY `epic_sw_record_histories_status_index` (`status`),
  KEY `epic_sw_record_histories_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `epic_sw_records`
--

DROP TABLE IF EXISTS `epic_sw_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `epic_sw_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `operator_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'OperatorId',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注单類型',
  `bet_id` bigint NOT NULL DEFAULT '0' COMMENT 'bet_id / tran_id',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'PlayerId',
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'GameCode',
  `round_id` bigint NOT NULL DEFAULT '0' COMMENT 'RoundId',
  `bonus_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'BonusId / ',
  `bet_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'BetAmount',
  `rolling_chip_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼',
  `valid_bet_amount` decimal(18,4) DEFAULT NULL COMMENT 'ValidBetAmount',
  `payout_amount` decimal(18,4) DEFAULT NULL COMMENT 'Payout',
  `win_lose_amount` decimal(18,4) DEFAULT NULL COMMENT 'WinLose',
  `tran_date_time` datetime NOT NULL,
  `session_token` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AuthToken',
  `result_id` bigint DEFAULT NULL COMMENT 'ResultId',
  `result_type` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:Single/Quick Game Round Result,1:Single/Quick Game Refund',
  `result` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Result',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:已處理,1:未處理',
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'currency',
  `exchange_rate` decimal(6,4) NOT NULL DEFAULT '0.0000' COMMENT 'ExchangeRate',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`type`,`bet_id`),
  KEY `epic_sw_records_type_index` (`type`),
  KEY `epic_sw_records_bet_id_index` (`bet_id`),
  KEY `epic_sw_records_username_index` (`username`),
  KEY `epic_sw_records_game_code_index` (`game_code`),
  KEY `epic_sw_records_round_id_index` (`round_id`),
  KEY `epic_sw_records_tran_date_time_index` (`tran_date_time`),
  KEY `epic_sw_records_session_token_index` (`session_token`),
  KEY `epic_sw_records_status_index` (`status`),
  KEY `epic_sw_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esport_accounts`
--

DROP TABLE IF EXISTS `esport_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `esport_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `esport_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `esport_accounts_username_index` (`username`),
  KEY `esport_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esport_bet_records`
--

DROP TABLE IF EXISTS `esport_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `esport_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '派彩時間(utc)',
  `created_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `bet_status` int NOT NULL,
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `esport_bet_records_bet_id_unique` (`bet_id`),
  KEY `esport_bet_records_username_index` (`username`),
  KEY `esport_bet_records_game_code_index` (`game_code`),
  KEY `esport_bet_records_bet_time_index` (`bet_time`),
  KEY `esport_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_codes`
--

DROP TABLE IF EXISTS `event_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_codes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL COMMENT 'event.id',
  `member_id` int NOT NULL COMMENT '玩家帳號',
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邀請碼',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`event_id`,`member_id`),
  KEY `event_codes_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_details`
--

DROP TABLE IF EXISTS `event_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `event_id` int NOT NULL COMMENT '活動編號',
  `action_id` int NOT NULL COMMENT '行為編號; params.type=event_action',
  `order_type_id` int DEFAULT NULL COMMENT '訂單類型編號',
  `vendor_id` int DEFAULT NULL COMMENT '遊戲商系統編號',
  `game_id` int DEFAULT NULL COMMENT '遊戲系統編號',
  `game_join_event_used` int NOT NULL DEFAULT '1' COMMENT '是否使用games的join_bet_event / join_payout_event',
  `bind_unlimited` tinyint DEFAULT '0' COMMENT '邀請時是否綁定全民代理',
  `rate` decimal(10,2) NOT NULL COMMENT '匯率',
  `game_type_id` tinyint DEFAULT NULL COMMENT '遊戲分類',
  `point` int NOT NULL COMMENT '達標點數',
  `start_time` datetime NOT NULL COMMENT '開始時間',
  `end_time` datetime NOT NULL COMMENT '結束時間',
  `draw_time` datetime NOT NULL COMMENT '派獎時間',
  `expire_hour` int NOT NULL DEFAULT '0' COMMENT '獎勵領取期限(小時)',
  `ip_block` tinyint(1) NOT NULL DEFAULT '0' COMMENT '限制IP',
  `global_ip_block` tinyint NOT NULL DEFAULT '0' COMMENT '全站限制IP 0:不阻擋 1:阻擋',
  `phone_block` tinyint(1) NOT NULL DEFAULT '0' COMMENT '限制電話',
  `global_phone_block` tinyint NOT NULL DEFAULT '0' COMMENT '全站限制電話 0:不阻擋 1:阻擋',
  `browser_block` tinyint(1) NOT NULL DEFAULT '0' COMMENT '限制瀏覽器序號',
  `account_block` tinyint(1) NOT NULL DEFAULT '0' COMMENT '限制真實姓名',
  `global_account_block` tinyint NOT NULL DEFAULT '0' COMMENT '全站限制真實姓名 0:不阻擋 1:阻擋',
  `realname_block` int NOT NULL DEFAULT '0' COMMENT '檢查實名認證',
  `vendor_lock` int NOT NULL DEFAULT '0' COMMENT '是否鎖定遊戲商入口',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `event_details_event_id_index` (`event_id`),
  KEY `event_details_start_time_index` (`start_time`),
  KEY `event_details_end_time_index` (`end_time`),
  KEY `event_details_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_exclude_agents`
--

DROP TABLE IF EXISTS `event_exclude_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_exclude_agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int unsigned NOT NULL COMMENT 'events.id',
  `agent_id` int unsigned NOT NULL COMMENT 'agents.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `event_exclude_agents_event_id_index` (`event_id`),
  KEY `event_exclude_agents_agent_id_index` (`agent_id`),
  KEY `event_exclude_agents_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_fumasw_accounts`
--

DROP TABLE IF EXISTS `event_fumasw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_fumasw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_vendor_info_id` int NOT NULL COMMENT '活動遊戲商設定編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `player_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '三方帳號',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家密碼',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_fumasw_accounts_username_unique` (`username`),
  KEY `event_fumasw_accounts_event_vendor_info_id_index` (`event_vendor_info_id`),
  KEY `event_fumasw_accounts_player_id_index` (`player_id`),
  KEY `event_fumasw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_fumasw_bet_records`
--

DROP TABLE IF EXISTS `event_fumasw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_fumasw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'transferId from request',
  `round_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'roundId, ticketId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別, 1: bet, 2: settle, 3: free settle',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '僅用來記錄投注單狀態, 派彩單不受影響, 0: 未派彩, 1: 已派彩',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_fumasw_bet_records_bet_id_unique` (`bet_id`),
  KEY `event_fumasw_bet_records_round_id_index` (`round_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_images`
--

DROP TABLE IF EXISTS `event_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL COMMENT '語系系統編號',
  `event_id` int NOT NULL COMMENT '活動編號',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '圖片',
  `image_pc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '電腦版圖片',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_invite_records`
--

DROP TABLE IF EXISTS `event_invite_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_invite_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL DEFAULT '0' COMMENT 'events.id',
  `member_id` bigint unsigned NOT NULL COMMENT 'members.id(被邀請人)',
  `invite_member_id` bigint unsigned NOT NULL COMMENT 'members.id(邀請人)',
  `ip_duplicate` int NOT NULL DEFAULT '0' COMMENT '註冊IP是否重複;1:是、0:否',
  `phone_duplicate` int NOT NULL DEFAULT '0' COMMENT '手機號碼是否重複;1:是、0:否',
  `realname_duplicate` int NOT NULL DEFAULT '0' COMMENT '真實姓名是否重複;1:是、0:否',
  `telegram_id_duplicate` int NOT NULL DEFAULT '0' COMMENT 'Telegram ID是否重複;1:是、0:否',
  `block_member_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'members.id(阻擋人)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `event_invite_records_event_id_index` (`event_id`),
  KEY `event_invite_records_member_id_index` (`member_id`),
  KEY `event_invite_records_invite_member_id_index` (`invite_member_id`),
  KEY `event_invite_records_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_jackpot_images`
--

DROP TABLE IF EXISTS `event_jackpot_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_jackpot_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL DEFAULT '0' COMMENT 'languages.id',
  `event_jackpot_id` int NOT NULL DEFAULT '0' COMMENT 'event_jackpots.id',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '圖片',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `event_jackpot_images_language_id_index` (`language_id`),
  KEY `event_jackpot_images_event_jackpot_id_index` (`event_jackpot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_jackpot_records`
--

DROP TABLE IF EXISTS `event_jackpot_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_jackpot_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT 'members.id',
  `event_jackpot_id` int NOT NULL DEFAULT '0' COMMENT 'event_jackpots.id',
  `prize_member_id` int NOT NULL DEFAULT '0' COMMENT 'prize_members.id',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未通知,1:已通知',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `event_jackpot_records_member_id_index` (`member_id`),
  KEY `event_jackpot_records_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_jackpots`
--

DROP TABLE IF EXISTS `event_jackpots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_jackpots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `event_id` int NOT NULL DEFAULT '0' COMMENT '活動編號',
  `type` int NOT NULL DEFAULT '0' COMMENT '1:流水,2:輸分金額',
  `start_time` datetime NOT NULL COMMENT '開始日期',
  `end_time` datetime NOT NULL COMMENT '結束日期',
  `expire_date` datetime NOT NULL COMMENT '獎勵遊戲次數到期日',
  `expire_hour` int NOT NULL DEFAULT '0' COMMENT '獎勵領取期限(小時)',
  `achieve_point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '達成分數',
  `member_number` int NOT NULL DEFAULT '0' COMMENT '最低符合資格玩家數',
  `agent_number` int NOT NULL DEFAULT '0' COMMENT '最低符合資格代理數',
  `pay_number` int NOT NULL DEFAULT '0' COMMENT '派發獎勵人數',
  `number_of_member_in_agent` int NOT NULL DEFAULT '0' COMMENT '每個代理可中獎人數',
  `point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '獎勵金額',
  `flow_limit_multiple` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '稽核流水倍數',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '圖片',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `event_jackpots_event_id_index` (`event_id`),
  KEY `event_jackpots_start_time_index` (`start_time`),
  KEY `event_jackpots_end_time_index` (`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_names`
--

DROP TABLE IF EXISTS `event_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL COMMENT '語言系統編號',
  `event_id` int NOT NULL COMMENT '遊戲類型系統編號',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活動標題',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活動內容',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `event_names_language_id_index` (`language_id`),
  KEY `event_names_event_id_index` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_payout_cancels`
--

DROP TABLE IF EXISTS `event_payout_cancels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_payout_cancels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL DEFAULT '0' COMMENT 'events.id',
  `prize_member_id` int NOT NULL DEFAULT '0' COMMENT 'prize_members.id',
  `prize_content_id` int NOT NULL DEFAULT '0' COMMENT 'prize_contents.id',
  `order_id` int NOT NULL DEFAULT '0' COMMENT 'orders.id',
  `from_member_id` int NOT NULL DEFAULT '0' COMMENT 'orders.id',
  `member_id` int NOT NULL DEFAULT '0' COMMENT 'members.id',
  `type` int NOT NULL DEFAULT '0' COMMENT '重複類型; 1: 真實姓名, 2: 註冊IP, 3: 手機號碼',
  `block_member_id` int NOT NULL DEFAULT '0' COMMENT '重複的會員id',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '備註',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態;0:未派發、 1: 已補派',
  `operator` int NOT NULL DEFAULT '0' COMMENT '操作人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `event_payout_cancels_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_pgssw_accounts`
--

DROP TABLE IF EXISTS `event_pgssw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_pgssw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_vendor_info_id` int NOT NULL DEFAULT '0' COMMENT 'event_vendor_infos.id',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `session_token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登入token',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `event_pgssw_accounts_username_index` (`username`),
  KEY `event_pgssw_accounts_member_id_index` (`member_id`),
  KEY `event_pgssw_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_pgssw_bet_records`
--

DROP TABLE IF EXISTS `event_pgssw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_pgssw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `session_token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單號的session_token',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `event_time` datetime NOT NULL COMMENT '活動結算時間(utc)',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `payout_time` datetime NOT NULL COMMENT '派彩時間(utc)',
  `settlement_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '結算時間',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未結算,1:已結算',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_pgssw_bet_records_bet_id_unique` (`bet_id`),
  KEY `event_pgssw_bet_records_vendor_info_id_index` (`vendor_info_id`),
  KEY `event_pgssw_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_ppsw_accounts`
--

DROP TABLE IF EXISTS `event_ppsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_ppsw_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '活動遊戲商設定編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員編號',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `player_id` int DEFAULT NULL COMMENT '遊戲方玩家編號',
  `token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣別',
  `country` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣別',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_ppsw_accounts_event_vendor_info_id_index` (`event_vendor_info_id`),
  KEY `event_ppsw_accounts_member_id_index` (`member_id`),
  KEY `event_ppsw_accounts_username_index` (`username`),
  KEY `event_ppsw_accounts_player_id_index` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_ppsw_bet_records`
--

DROP TABLE IF EXISTS `event_ppsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_ppsw_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '活動遊戲商設定編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員編號',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號 playerId',
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單號 roundId',
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易號',
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注額',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `bonus` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '額外獎金/錦標賽獎金',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩池獎金',
  `bet_time` timestamp NOT NULL COMMENT '投注時間',
  `payout_time` timestamp NULL DEFAULT NULL COMMENT '結算時間',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:建立注單,1:進行中,2:退款,3:已結算',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_ppsw_bet_records_reference_no_unique` (`reference_no`),
  KEY `event_ppsw_bet_records_event_vendor_info_id_index` (`event_vendor_info_id`),
  KEY `event_ppsw_bet_records_member_id_index` (`member_id`),
  KEY `event_ppsw_bet_records_username_index` (`username`),
  KEY `event_ppsw_bet_records_bet_id_index` (`bet_id`),
  KEY `event_ppsw_bet_records_game_code_index` (`game_code`),
  KEY `event_ppsw_bet_records_bet_time_index` (`bet_time`),
  KEY `event_ppsw_bet_records_payout_time_index` (`payout_time`),
  KEY `event_ppsw_bet_records_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_ppsw_deal_records`
--

DROP TABLE IF EXISTS `event_ppsw_deal_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_ppsw_deal_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `trace_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '追蹤碼',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號 playerId',
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單號 roundId',
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方交易碼',
  `action` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '請求動作',
  `request` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始請求',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:失敗,1:成功',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ppsw_deal_records_idempotency_unique` (`username`,`reference_no`,`action`),
  UNIQUE KEY `event_ppsw_deal_records_trace_id_unique` (`trace_id`),
  KEY `event_ppsw_deal_records_username_index` (`username`),
  KEY `event_ppsw_deal_records_bet_id_index` (`bet_id`),
  KEY `event_ppsw_deal_records_reference_no_index` (`reference_no`),
  KEY `event_ppsw_deal_records_action_index` (`action`),
  KEY `event_ppsw_deal_records_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_processes`
--

DROP TABLE IF EXISTS `event_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_processes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `detail_id` int NOT NULL COMMENT '活動條件系統編號',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '目前點數',
  `received` int DEFAULT '0' COMMENT '已兌換過的金額',
  `last_bet_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '派獎狀態0:未達標1:已達標2:已派獎',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `event_processes_detail_id_index` (`detail_id`),
  KEY `event_processes_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_promotions`
--

DROP TABLE IF EXISTS `event_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_promotions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL COMMENT 'events.id',
  `vendor_id` int NOT NULL COMMENT 'vendors.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  KEY `event_promotions_event_id_index` (`event_id`),
  KEY `event_promotions_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_refresh_ranking_records`
--

DROP TABLE IF EXISTS `event_refresh_ranking_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_refresh_ranking_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_refresh_ranking_id` int NOT NULL DEFAULT '0' COMMENT 'event_refresh_rankings.id',
  `member_id` int NOT NULL DEFAULT '0' COMMENT 'members.id',
  `bet_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `last_bet_time` datetime DEFAULT NULL COMMENT '最後投注時間',
  `prize_content_id` int NOT NULL DEFAULT '0' COMMENT '獎項ID;prize_contents.id',
  `ranking` int NOT NULL DEFAULT '0' COMMENT '名次',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎勵金額',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '是否塞入獎項',
  `is_calc` tinyint NOT NULL DEFAULT '0' COMMENT '是否計算;0:不計算(電話號碼重複),1:計算,2:後台取消',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '提領結果; 0:未領, 1:已領取',
  `time` datetime DEFAULT NULL COMMENT '領取時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`event_refresh_ranking_id`,`member_id`),
  KEY `event_refresh_ranking_records_bet_amount_index` (`bet_amount`),
  KEY `event_refresh_ranking_records_last_bet_time_index` (`last_bet_time`),
  KEY `event_refresh_ranking_records_prize_content_id_index` (`prize_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_refresh_rankings`
--

DROP TABLE IF EXISTS `event_refresh_rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_refresh_rankings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL DEFAULT '0' COMMENT 'events.id',
  `event_detail_id` int NOT NULL DEFAULT '0' COMMENT 'event_details.id',
  `no` int NOT NULL DEFAULT '0' COMMENT '期數',
  `payout_time` datetime DEFAULT NULL COMMENT '派發時間(UTC+0)',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態;0:未派發,1:已派發',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_slot_competition_records`
--

DROP TABLE IF EXISTS `event_slot_competition_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_slot_competition_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_slot_competition_id` int NOT NULL DEFAULT '0' COMMENT 'event_slot_competitions.id',
  `member_id` int NOT NULL DEFAULT '0' COMMENT 'members.id',
  `bet_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `last_bet_time` datetime NOT NULL COMMENT '最後投注時間',
  `prize_content_id` int NOT NULL DEFAULT '0' COMMENT '獎項ID;prize_contents.id',
  `ranking` int NOT NULL DEFAULT '0' COMMENT '名次',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎勵金額',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '中獎結果; 0:未中, 1:中獎',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '提領結果; 0:未領, 1:已領取, 2:領取中',
  `time` datetime DEFAULT NULL COMMENT '領取時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`event_slot_competition_id`,`member_id`),
  KEY `event_slot_competition_records_bet_amount_index` (`bet_amount`),
  KEY `event_slot_competition_records_last_bet_time_index` (`last_bet_time`),
  KEY `event_slot_competition_records_prize_content_id_index` (`prize_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='老虎機活動玩家紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_slot_competitions`
--

DROP TABLE IF EXISTS `event_slot_competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_slot_competitions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL DEFAULT '0' COMMENT 'events.id',
  `event_detail_id` int NOT NULL DEFAULT '0' COMMENT 'event_details.id',
  `no` int NOT NULL DEFAULT '0' COMMENT '期數',
  `draw_time` datetime DEFAULT NULL COMMENT '派發時間',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未派獎,1:已派獎,2:派獎中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `event_slot_competitions_event_id_index` (`event_id`),
  KEY `event_slot_competitions_event_detail_id_index` (`event_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_total_bet_records`
--

DROP TABLE IF EXISTS `event_total_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_total_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '時間',
  `bet_record_id` bigint NOT NULL DEFAULT '0',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `vendor_id` int NOT NULL COMMENT '遊戲商系統編號',
  `game_id` int NOT NULL COMMENT '遊戲系統編號',
  `reference_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '來源單號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `payout_time` datetime NOT NULL COMMENT '派彩、結算時間(UTC)',
  `record_time` datetime NOT NULL COMMENT 'xxx_bet_record.created_at',
  `settlement_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '算帳時間',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `event_total_bet_records_summary_time_index` (`summary_time`),
  KEY `event_total_bet_records_bet_record_id_index` (`bet_record_id`),
  KEY `event_total_bet_records_member_id_index` (`member_id`),
  KEY `event_total_bet_records_vendor_id_index` (`vendor_id`),
  KEY `event_total_bet_records_game_id_index` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_uuslotsw_accounts`
--

DROP TABLE IF EXISTS `event_uuslotsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_uuslotsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_uuslotsw_accounts_username_unique` (`username`),
  KEY `event_uuslotsw_accounts_event_vendor_info_id_index` (`event_vendor_info_id`),
  KEY `event_uuslotsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_uuslotsw_bet_records`
--

DROP TABLE IF EXISTS `event_uuslotsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_uuslotsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id',
  `reference_bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'game result trnas id',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號',
  `status` enum('bet','result','rollback','bonus','jackpot') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'bet: 下注, result: 派彩, rollback: 取消下注, bonus: 紅包, jackpot: 大獎',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '合法下注金額',
  `payout` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `result_infos` json DEFAULT NULL COMMENT 'game result 詳細資訊',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_uuslotsw_bet_records_bet_id_unique` (`bet_id`),
  UNIQUE KEY `event_uuslotsw_bet_records_reference_bet_id_unique` (`reference_bet_id`),
  KEY `event_uuslotsw_bet_records_username_index` (`username`),
  KEY `event_uuslotsw_bet_records_status_index` (`status`),
  KEY `event_uuslotsw_bet_records_payout_time_index` (`payout_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_v2`
--

DROP TABLE IF EXISTS `event_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_v2` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活動名稱',
  `schedule` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活動重製時間',
  `handler_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '處理該活動邏輯的類別',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_v2_accounts`
--

DROP TABLE IF EXISTS `event_v2_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_v2_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL COMMENT '遊戲商id',
  `account_id` int NOT NULL COMMENT '遊戲帳號id',
  `event_v2_user_join_id` int NOT NULL COMMENT '參加活動id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_v2_accounts_vendor_id_account_id_unique` (`vendor_id`,`account_id`),
  KEY `event_v2_accounts_vendor_id_index` (`vendor_id`),
  KEY `event_v2_accounts_account_id_index` (`account_id`),
  KEY `event_v2_accounts_event_v2_user_join_id_index` (`event_v2_user_join_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_v2_detail_exclude_agents`
--

DROP TABLE IF EXISTS `event_v2_detail_exclude_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_v2_detail_exclude_agents` (
  `event_v2_detail_id` int unsigned NOT NULL,
  `agent_id` int unsigned NOT NULL,
  PRIMARY KEY (`event_v2_detail_id`,`agent_id`),
  KEY `event_v2_detail_exclude_agents_agent_id_foreign` (`agent_id`),
  CONSTRAINT `event_v2_detail_exclude_agents_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_v2_detail_exclude_agents_event_v2_detail_id_foreign` FOREIGN KEY (`event_v2_detail_id`) REFERENCES `event_v2_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_v2_detail_exclude_vendors`
--

DROP TABLE IF EXISTS `event_v2_detail_exclude_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_v2_detail_exclude_vendors` (
  `event_v2_detail_id` int unsigned NOT NULL,
  `vendor_id` int unsigned NOT NULL,
  PRIMARY KEY (`event_v2_detail_id`,`vendor_id`),
  KEY `event_v2_detail_exclude_vendors_vendor_id_foreign` (`vendor_id`),
  CONSTRAINT `event_v2_detail_exclude_vendors_event_v2_detail_id_foreign` FOREIGN KEY (`event_v2_detail_id`) REFERENCES `event_v2_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_v2_detail_exclude_vendors_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_v2_detail_game_types`
--

DROP TABLE IF EXISTS `event_v2_detail_game_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_v2_detail_game_types` (
  `event_v2_detail_id` int unsigned NOT NULL,
  `game_type_id` int unsigned NOT NULL,
  PRIMARY KEY (`event_v2_detail_id`,`game_type_id`),
  KEY `event_v2_detail_game_types_game_type_id_foreign` (`game_type_id`),
  CONSTRAINT `event_v2_detail_game_types_event_v2_detail_id_foreign` FOREIGN KEY (`event_v2_detail_id`) REFERENCES `event_v2_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_v2_detail_game_types_game_type_id_foreign` FOREIGN KEY (`game_type_id`) REFERENCES `game_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_v2_detail_langs`
--

DROP TABLE IF EXISTS `event_v2_detail_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_v2_detail_langs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_v2_detail_id` int unsigned NOT NULL COMMENT '活動詳細ID',
  `language_id` int unsigned NOT NULL COMMENT '語系iD',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活動名稱',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活動圖片',
  `reward_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '獎勵名稱',
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '預設顯示活動內容',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_v2_detail_langs_event_v2_detail_id_index` (`event_v2_detail_id`),
  KEY `event_v2_detail_langs_language_id_index` (`language_id`),
  CONSTRAINT `event_v2_detail_langs_event_v2_detail_id_foreign` FOREIGN KEY (`event_v2_detail_id`) REFERENCES `event_v2_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_v2_detail_langs_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_v2_detail_vendors`
--

DROP TABLE IF EXISTS `event_v2_detail_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_v2_detail_vendors` (
  `event_v2_detail_id` int unsigned NOT NULL,
  `vendor_id` int unsigned NOT NULL,
  PRIMARY KEY (`event_v2_detail_id`,`vendor_id`),
  KEY `event_v2_detail_vendors_vendor_id_foreign` (`vendor_id`),
  CONSTRAINT `event_v2_detail_vendors_event_v2_detail_id_foreign` FOREIGN KEY (`event_v2_detail_id`) REFERENCES `event_v2_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_v2_detail_vendors_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_v2_details`
--

DROP TABLE IF EXISTS `event_v2_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_v2_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_v2_id` int NOT NULL COMMENT '活動ID',
  `agent_id` int NOT NULL COMMENT '代理ID',
  `condition_formula` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '領獎條件公式，例如 deposit >= 20 或 20 <= deposit <= 49.99',
  `condition_config` json DEFAULT NULL COMMENT '領獎條件客製化設定',
  `reward_formula` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活動獎勵計算公式，例如 "deposit * 0.5"',
  `reward_config` json DEFAULT NULL COMMENT '活動獎勵計算客製化設定',
  `balance_formula` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '餘額限制的動態公式，例如 "(deposit + bonus) * 3"',
  `balance_config` json DEFAULT NULL COMMENT '餘額限制客製化設定',
  `flow_formula` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流水限制的動態公式，例如 "(deposit + bonus) * 3"',
  `flow_config` json DEFAULT NULL COMMENT '流水限制客製化設定',
  `withdraw_formula` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提款限額的動態公式，例如 "bonus * 3"',
  `withdraw_config` json DEFAULT NULL COMMENT '提款限額客製化設定',
  `ip_block` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_block` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_block` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_withdraw` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否為參加即領獎',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '活動開始時間',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '活動結束時間',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `is_recycle` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否回收',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否啟用該活動',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_v2_details_event_v2_id_index` (`event_v2_id`),
  KEY `event_v2_details_agent_id_index` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_v2_invites`
--

DROP TABLE IF EXISTS `event_v2_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_v2_invites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_v2_user_join_id` int NOT NULL COMMENT '活動參加ID',
  `member_id` int NOT NULL COMMENT '會員ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_v2_invites_event_v2_user_join_id_index` (`event_v2_user_join_id`),
  KEY `event_v2_invites_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_v2_recycles`
--

DROP TABLE IF EXISTS `event_v2_recycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_v2_recycles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_v2_user_join_id` int unsigned NOT NULL COMMENT 'event_v2_user_join_id',
  `final_balance` decimal(18,4) DEFAULT NULL COMMENT '最終餘額',
  `withdraw` decimal(18,4) DEFAULT NULL COMMENT '活動派獎金額',
  `recycle_amount` decimal(18,4) DEFAULT NULL COMMENT '回收金額',
  `status` tinyint unsigned NOT NULL COMMENT '1:系統排程回收2:完成活動回收3:放棄活動回收4:系統重置回收',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_v2_recycles_event_v2_user_join_id_index` (`event_v2_user_join_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_v2_user_joins`
--

DROP TABLE IF EXISTS `event_v2_user_joins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_v2_user_joins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_v2_detail_id` int NOT NULL COMMENT '活動詳細ID',
  `member_id` int NOT NULL COMMENT '會員ID',
  `order_id` int NOT NULL DEFAULT '0' COMMENT 'order ID',
  `reward` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎勵金額',
  `balance_limit` decimal(18,4) DEFAULT NULL COMMENT '餘額限制',
  `flow_limit` decimal(18,4) DEFAULT NULL COMMENT '流水限制',
  `withdraw_limit` decimal(18,4) DEFAULT NULL COMMENT '提款限額',
  `withdraw` decimal(18,4) DEFAULT NULL COMMENT '提款金額',
  `final_balance` decimal(18,4) DEFAULT NULL COMMENT '最終餘額',
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手機',
  `status` tinyint(1) NOT NULL COMMENT '1:參加2:完成3:放棄',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '結束時間',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_v2_user_joins_created_at_index` (`created_at`),
  KEY `event_v2_user_joins_event_v2_detail_id_index` (`event_v2_detail_id`),
  KEY `event_v2_user_joins_member_id_index` (`member_id`),
  KEY `event_v2_user_joins_order_id_index` (`order_id`),
  KEY `event_v2_user_joins_ip_index` (`ip`),
  KEY `event_v2_user_joins_phone_index` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_v2_wallet_transaction_logs`
--

DROP TABLE IF EXISTS `event_v2_wallet_transaction_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_v2_wallet_transaction_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `wallet_transaction_log_id` int DEFAULT NULL COMMENT 'wallet_transaction_logs.id',
  `vendor_id` int DEFAULT NULL COMMENT '遊戲商id',
  `account_id` int DEFAULT NULL COMMENT '遊戲帳號id',
  `account_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲帳號名稱',
  `event_v2_user_join_id` int DEFAULT NULL COMMENT '參加活動id',
  `operate_agent_id` int unsigned DEFAULT NULL COMMENT '操作代理id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_v2_wallet_transaction_logs_wallet_transaction_log_id_index` (`wallet_transaction_log_id`),
  KEY `event_v2_wallet_transaction_logs_vendor_id_index` (`vendor_id`),
  KEY `event_v2_wallet_transaction_logs_account_id_index` (`account_id`),
  KEY `event_v2_wallet_transaction_logs_account_username_index` (`account_username`),
  KEY `event_v2_wallet_transaction_logs_event_v2_user_join_id_index` (`event_v2_user_join_id`),
  KEY `event_v2_wallet_transaction_logs_operate_agent_id_index` (`operate_agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_vendor_info_games`
--

DROP TABLE IF EXISTS `event_vendor_info_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_vendor_info_games` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_vendor_info_id` int NOT NULL DEFAULT '0' COMMENT 'event_vendor_infos.id',
  `game_id` int NOT NULL DEFAULT '0' COMMENT 'games.id',
  `is_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否為新遊戲;0:不是,1:是',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否為熱門遊戲;0:不是,1:是',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_vendor_infos`
--

DROP TABLE IF EXISTS `event_vendor_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_vendor_infos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商戶資訊名稱',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT 'vendors.id',
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣種',
  `rate` decimal(11,5) NOT NULL DEFAULT '1.00000' COMMENT '轉換率',
  `transfer_min_amount` decimal(11,5) NOT NULL DEFAULT '0.01000' COMMENT '最小轉帳金額',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '連接資訊',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '圖片',
  `app_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'app圖片',
  `prepared_account_number` int NOT NULL DEFAULT '0' COMMENT '預備帳號數量',
  `account_prefix` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳號前綴',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_vendor_locks`
--

DROP TABLE IF EXISTS `event_vendor_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_vendor_locks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL DEFAULT '0' COMMENT 'events.id',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT 'vendors.id',
  `game_type_id` int NOT NULL DEFAULT '0' COMMENT 'game_types.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `event_vendor_locks_event_id_index` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_vendors`
--

DROP TABLE IF EXISTS `event_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_vendors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'agents.id',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT 'vendors.id',
  `event_vendor_info_id` int NOT NULL DEFAULT '0' COMMENT 'event_vendor_infos.id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  PRIMARY KEY (`id`),
  KEY `event_vendors_agent_id_index` (`agent_id`),
  KEY `event_vendors_vendor_id_index` (`vendor_id`),
  KEY `event_vendors_event_vendor_info_id_index` (`event_vendor_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_vpowersw_accounts`
--

DROP TABLE IF EXISTS `event_vpowersw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_vpowersw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '活動遊戲商設定編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_vpowersw_accounts_username_unique` (`username`),
  KEY `event_vpowersw_accounts_event_vendor_info_id_index` (`event_vendor_info_id`),
  KEY `event_vpowersw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_vpowersw_bet_records`
--

DROP TABLE IF EXISTS `event_vpowersw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_vpowersw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id, gameRoundId from request',
  `reference_bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '關聯交易 id',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0: 回合未完成, 1: 回合完成',
  `type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_vpowersw_bet_records_bet_id_unique` (`bet_id`),
  KEY `event_vpowersw_bet_records_username_index` (`username`),
  CONSTRAINT `event_vpowersw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `event_vpowersw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_wfsw_accounts`
--

DROP TABLE IF EXISTS `event_wfsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_wfsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '活動遊戲商設定編號',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_wfsw_accounts_username_unique` (`username`),
  KEY `event_wfsw_accounts_event_vendor_info_id_index` (`event_vendor_info_id`),
  KEY `event_wfsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_wfsw_bet_records`
--

DROP TABLE IF EXISTS `event_wfsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_wfsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id, gameRoundId from request',
  `result_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易 id, gameRoundId from request',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `status` int NOT NULL COMMENT '1:bet,2:result,3:rollback,4:bouns,5:jackpot',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `payout` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `result_infos` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`bet_id`),
  KEY `event_wfsw_bet_records_bet_id_index` (`bet_id`),
  KEY `event_wfsw_bet_records_result_id_index` (`result_id`),
  KEY `event_wfsw_bet_records_username_index` (`username`),
  KEY `event_wfsw_bet_records_game_code_index` (`game_code`),
  KEY `event_wfsw_bet_records_bet_time_index` (`bet_time`),
  KEY `event_wfsw_bet_records_payout_time_index` (`payout_time`),
  CONSTRAINT `event_wfsw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `event_wfsw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_wudisw_accounts`
--

DROP TABLE IF EXISTS `event_wudisw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_wudisw_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_vendor_info_id` int NOT NULL COMMENT '商戶編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_wudisw_accounts_username_unique` (`username`),
  KEY `event_wudisw_accounts_event_vendor_info_id_index` (`event_vendor_info_id`),
  KEY `event_wudisw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_wudisw_bet_records`
--

DROP TABLE IF EXISTS `event_wudisw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_wudisw_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ticketNum from request',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0: 未有結果, -1: 取消, 9: 結算',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間, result time',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_wudisw_bet_records_bet_id_unique` (`bet_id`),
  KEY `event_wudisw_bet_records_username_foreign` (`username`),
  CONSTRAINT `event_wudisw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `event_wudisw_accounts` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '預設顯示活動標題',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '預設顯示活動內容',
  `type_id` int NOT NULL COMMENT '類型編號; params.type=event_type',
  `category` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活動類別組別',
  `start_time` datetime DEFAULT NULL COMMENT '開始時間',
  `end_time` datetime DEFAULT NULL COMMENT '結束時間',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `agent_id` int DEFAULT NULL COMMENT '營運商系統編號',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:啟用',
  `auto_increment` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '活動到期自動遞增; call ADMIN_event_automatic_increase',
  `auto_payout` int NOT NULL DEFAULT '0' COMMENT '自動派發獎勵',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `events_agent_id_index` (`agent_id`),
  KEY `events_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evo_accounts`
--

DROP TABLE IF EXISTS `evo_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `evo_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `evo_accounts_username_index` (`username`),
  KEY `evo_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evo_bet_records`
--

DROP TABLE IF EXISTS `evo_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `evo_bet_records_bet_id_unique` (`bet_id`),
  KEY `evo_bet_records_username_index` (`username`),
  KEY `evo_bet_records_bet_time_index` (`bet_time`),
  KEY `evo_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `external_api_keys`
--

DROP TABLE IF EXISTS `external_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_api_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳號',
  `secret_key` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密鑰(可使用MYSQL select UUID() 隨機生成)',
  `agentIds` text COLLATE utf8mb4_unicode_ci COMMENT '開放代理ID, 使用 "," 區隔, 若包含*則代表可查詢所有代理線',
  `whitelist` text COLLATE utf8mb4_unicode_ci COMMENT 'IP 白名單, 使用 "," 區隔, 若包含*則代表不限IP',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:啟用, 0:停用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_api_keys_merchant_id_unique` (`merchant_id`),
  KEY `external_api_keys_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='開放給外部使用的api key';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favourite_games`
--

DROP TABLE IF EXISTS `favourite_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite_games` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `game_id` int NOT NULL COMMENT '遊戲系統編號',
  `status` tinyint(1) NOT NULL COMMENT '狀態0:取消,1:使用中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `favourite_games_member_id_game_id_status_index` (`member_id`,`game_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fffsw_accounts`
--

DROP TABLE IF EXISTS `fffsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fffsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商環境',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '我方會員ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方玩家帳號',
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方玩家密碼',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fffsw_accounts_username_unique` (`username`),
  KEY `fffsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `fffsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fffsw_bet_records`
--

DROP TABLE IF EXISTS `fffsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fffsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注單號碼',
  `period_number` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '期號',
  `member_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '我方會員ID',
  `account_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方帳號 ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲代碼',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` timestamp NULL DEFAULT NULL COMMENT '下注時間',
  `payout_time` timestamp NULL DEFAULT NULL COMMENT '派彩時間',
  `status` tinyint NOT NULL COMMENT '處理狀態: -2=回滾, -1=餘額不足, 0=未完成, 1=已扣款, 2=已派彩',
  `raw` text COLLATE utf8mb4_unicode_ci COMMENT '三方原始數據',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fffsw_bet_records_bet_id_unique` (`bet_id`),
  KEY `fffsw_bet_records_period_number_index` (`period_number`),
  KEY `fffsw_bet_records_member_id_index` (`member_id`),
  KEY `fffsw_bet_records_account_id_index` (`account_id`),
  KEY `fffsw_bet_records_username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `firebase_cloud_messages`
--

DROP TABLE IF EXISTS `firebase_cloud_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `firebase_cloud_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '標題',
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '內容',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'click action網址',
  `multicast_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'multicast_id',
  `message_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'message_id',
  `error` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '錯誤訊息',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態0:未發送,1:發送成功,2:發送失敗',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fishing_accounts`
--

DROP TABLE IF EXISTS `fishing_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fishing_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fishing_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `fishing_accounts_username_index` (`username`),
  KEY `fishing_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fishing_bet_records`
--

DROP TABLE IF EXISTS `fishing_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fishing_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fishing_bet_records_bet_id_unique` (`bet_id`),
  KEY `fishing_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_limit_control_logs`
--

DROP TABLE IF EXISTS `flow_limit_control_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_limit_control_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `stat_start_id` int NOT NULL COMMENT '統計開始ID',
  `stat_end_id` int NOT NULL COMMENT '統計結束ID',
  `exec_start_time` datetime NOT NULL COMMENT '執行開始時間',
  `exec_end_time` datetime NOT NULL COMMENT '執行結束時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_limit_details`
--

DROP TABLE IF EXISTS `flow_limit_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_limit_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `flow_limit_id` int NOT NULL COMMENT 'flow_limits.id',
  `start_total_bet_record_id` bigint NOT NULL COMMENT '該筆稽核流水啟始ID',
  `end_total_bet_record_id` bigint NOT NULL COMMENT '該筆稽核流水結束D',
  `start_flow_limit` decimal(18,4) DEFAULT '0.0000' COMMENT '稽核(起)',
  `end_flow_limit` decimal(18,4) DEFAULT '0.0000' COMMENT '稽核(迄)',
  `reach` decimal(18,4) DEFAULT '0.0000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `flow_limit_details_flow_limit_id_index` (`flow_limit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='稽核流水細表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_limit_restrictions`
--

DROP TABLE IF EXISTS `flow_limit_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_limit_restrictions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `flow_limit_id` int NOT NULL COMMENT '稽核流水編號',
  `vendor_id` int NOT NULL COMMENT '遊戲商編號',
  `type_id` int NOT NULL COMMENT '遊戲類別編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flow_limit_restrictions_flow_limit_id_index` (`flow_limit_id`),
  KEY `flow_limit_restrictions_type_id_index` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_limits`
--

DROP TABLE IF EXISTS `flow_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_limits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL COMMENT '玩家ID',
  `type` int NOT NULL COMMENT '參照類型: 1:transaction_logs',
  `event_id` int DEFAULT '0',
  `reference_id` int NOT NULL COMMENT '參照ID; 依照type',
  `wallet_transaction_log_id` int NOT NULL DEFAULT '0' COMMENT 'wallet_transaction_logs.id',
  `flow_limit` decimal(18,4) NOT NULL COMMENT '流水限制',
  `reach` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '達成',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態; 0:未通過, 1:通過, 9:取消稽核',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `flow_limits_member_id_index` (`member_id`),
  KEY `flow_limits_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fumasw_accounts`
--

DROP TABLE IF EXISTS `fumasw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fumasw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '商戶編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `player_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '三方帳號',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家密碼',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fumasw_accounts_username_unique` (`username`),
  KEY `fumasw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `fumasw_accounts_player_id_index` (`player_id`),
  KEY `fumasw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fumasw_bet_records`
--

DROP TABLE IF EXISTS `fumasw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fumasw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'transferId from request',
  `round_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'roundId, ticketId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別, 1: bet, 2: settle, 3: free settle',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '僅用來記錄投注單狀態, 派彩單不受影響, 0: 未派彩, 1: 已派彩',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fumasw_bet_records_bet_id_unique` (`bet_id`),
  KEY `fumasw_bet_records_round_id_index` (`round_id`),
  KEY `fumasw_bet_records_username_foreign` (`username`),
  CONSTRAINT `fumasw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `fumasw_accounts` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_names`
--

DROP TABLE IF EXISTS `game_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL COMMENT '語言系統編號',
  `game_id` int NOT NULL COMMENT '遊戲系統編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `game_names_language_id_index` (`language_id`),
  KEY `game_names_game_id_index` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_type_names`
--

DROP TABLE IF EXISTS `game_type_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_type_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL COMMENT '語言系統編號',
  `game_type_id` int NOT NULL COMMENT '遊戲類型系統編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲類型名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `game_type_names_language_id_index` (`language_id`),
  KEY `game_type_names_game_type_id_index` (`game_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_types`
--

DROP TABLE IF EXISTS `game_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `parent` int NOT NULL DEFAULT '0' COMMENT '上層選單的系統編號',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別名稱',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商系統編號',
  `type_id` int NOT NULL COMMENT '遊戲類型',
  `join_bet_event` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可參加投注額活動，0:不可，1:可以',
  `join_win_event` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可參加贏分活動，0:不可，1:可以',
  `game_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲代碼',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名稱',
  `lottery_pool` decimal(11,3) DEFAULT '0.000' COMMENT '彩池金額',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲圖片',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否為新遊戲(0:否,1:是)',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否為熱門遊戲(0:否,1:是)',
  `open_window` tinyint NOT NULL DEFAULT '0' COMMENT '是否另開視窗; 1:另開, 0:不另開',
  `status` tinyint NOT NULL COMMENT '狀態：0停用，1啟用',
  `rtp` decimal(5,2) DEFAULT '0.00' COMMENT 'RTP',
  `sort` int DEFAULT '0' COMMENT '排序',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT 'info',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '備註',
  `memo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '內部人員備註用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  `valid_bet_rate` decimal(4,2) DEFAULT '1.00' COMMENT '有效投注轉換比例',
  `calc_flow_limit` tinyint DEFAULT '1' COMMENT '是否計算稽核流水',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`vendor_id`,`game_type`,`remark`),
  KEY `games_vendor_id_index` (`vendor_id`),
  KEY `games_type_id_index` (`type_id`),
  KEY `games_game_type_index` (`game_type`),
  KEY `games_remark_index` (`remark`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gfg2_accounts`
--

DROP TABLE IF EXISTS `gfg2_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gfg2_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `vendor_uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲商的玩家 UID-依據遊戲商需求',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家密碼-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家登入用 Token-依據遊戲商需求',
  `admin` int NOT NULL DEFAULT '0' COMMENT '數據操作人員的管理者系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gfg2_accounts_username_unique` (`username`),
  KEY `gfg2_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `gfg2_accounts_member_id_index` (`member_id`),
  KEY `gfg2_accounts_vendor_username_index` (`vendor_username`),
  KEY `gfg2_accounts_vendor_uid_index` (`vendor_uid`),
  KEY `gfg2_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gfg2_bet_records`
--

DROP TABLE IF EXISTS `gfg2_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gfg2_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注單唯一Id, ThemeId',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩、結算時間(UTC)',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未結算,1:已結算',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲 ID-依據遊戲商需求',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼金額-依據遊戲商需求',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '訪問投注單的 Session Token 或 ID 簽章-依據遊戲商需求',
  `info` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gfg2_bet_records_bet_id_unique` (`bet_id`),
  KEY `gfg2_bet_records_vendor_username_index` (`vendor_username`),
  KEY `gfg2_bet_records_bet_time_index` (`bet_time`),
  KEY `gfg2_bet_records_payout_time_index` (`payout_time`),
  KEY `gfg2_bet_records_session_token_index` (`session_token`),
  KEY `gfg2_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `great_wall_accounts`
--

DROP TABLE IF EXISTS `great_wall_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `great_wall_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'gw99帳號',
  `username_modified` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'gw99帳號',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'gw99餘額',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT '營運商編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員帳號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `great_wall_accounts_username_unique` (`username`),
  KEY `great_wall_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `great_wall_accounts_username_modified_index` (`username_modified`),
  KEY `great_wall_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `great_wall_bet_records`
--

DROP TABLE IF EXISTS `great_wall_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `great_wall_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `themeId` int NOT NULL COMMENT '前四碼遊戲ID，後四碼大廳ID',
  `gameId` varchar(4) COLLATE utf8mb4_unicode_ci GENERATED ALWAYS AS (left(`themeId`,4)) VIRTUAL COMMENT '遊戲ID, 參照themeId',
  `gameNo` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲編號',
  `gameSerialId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲流水號',
  `accountId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '玩家ID',
  `userName` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '玩家帳號',
  `valueBefore` decimal(20,7) DEFAULT '0.0000000' COMMENT '投注前金額',
  `valueAfter` decimal(20,7) DEFAULT '0.0000000' COMMENT '投注後金額',
  `betCoin` decimal(20,7) DEFAULT '0.0000000' COMMENT '投注金額',
  `winAmount` decimal(20,7) DEFAULT '0.0000000' COMMENT '贏得金額',
  `availTotalBet` decimal(20,7) DEFAULT '0.0000000' COMMENT '有效投注金額',
  `availTotalWin` decimal(20,7) DEFAULT '0.0000000' COMMENT '有效贏得金額',
  `remoteIP` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '玩家IP',
  `deviceType` int DEFAULT NULL COMMENT '設備編號',
  `historyCreatedTime` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲記錄建立時間',
  `utc_created_time` datetime DEFAULT NULL COMMENT '遊戲記錄建立UTC時間',
  `info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `great_wall_bet_records_gameserialid_unique` (`gameSerialId`),
  KEY `great_wall_bet_records_username_index` (`userName`),
  KEY `great_wall_bet_records_utc_created_time_index` (`utc_created_time`),
  KEY `great_wall_bet_records_updated_at_index` (`updated_at`),
  KEY `great_wall_bet_records_gameid_index` (`gameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `great_wall_transactions`
--

DROP TABLE IF EXISTS `great_wall_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `great_wall_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `externalTransactionId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GW99系統編號',
  `operationMethod` tinyint NOT NULL DEFAULT '0' COMMENT '執行動作，1: open score, 2: shuffle score, 3: Red envelope (Lucky bag, New Year gift)',
  `playerAccount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '玩家帳號',
  `transAmount` decimal(18,4) NOT NULL COMMENT '金額',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `result` tinyint NOT NULL DEFAULT '0' COMMENT '狀態，0 : unresolved, 1 : success, 2 : failure',
  `createTime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '建立時間(+8時區)',
  `utc_created_time` datetime DEFAULT NULL COMMENT '建立時間(+0時區)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `great_wall_transactions_operationmethod_index` (`operationMethod`),
  KEY `great_wall_transactions_playeraccount_index` (`playerAccount`),
  KEY `great_wall_transactions_utc_created_time_index` (`utc_created_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `haolong_accounts`
--

DROP TABLE IF EXISTS `haolong_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `haolong_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '28win帳號',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '28win餘額',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT '營運商編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員帳號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  `is_vworld` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '是否為vworld舊帳號，舊帳號密碼統一',
  `username_modified` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `haolong_accounts_username_unique` (`username`),
  KEY `haolong_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `haolong_accounts_member_id_index` (`member_id`),
  KEY `haolong_accounts_username_modified_index` (`username_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `haolong_bet_records`
--

DROP TABLE IF EXISTS `haolong_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `haolong_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `login_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '投注者帳號',
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '投注記錄編號',
  `bet_time` datetime NOT NULL COMMENT '投注時間',
  `utc_bet_time` datetime DEFAULT NULL COMMENT '投注的UTC時間',
  `draw_type` int NOT NULL COMMENT '開彩莊家{0:全部, 1:Magnum, 2: PMP, 3: Toto, 4: Singapore, 5: Sabah, 6: Sandakan, 7: Sarawak, 8: GD (豪龙)}',
  `draw_date` date NOT NULL COMMENT '開彩日期',
  `bet_number` int NOT NULL COMMENT '投注號碼',
  `bet_position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '投注位置',
  `bet_amount` decimal(13,7) NOT NULL DEFAULT '0.0000000' COMMENT '投注額',
  `strike` decimal(13,7) DEFAULT '0.0000000' COMMENT '中獎金額',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `haolong_bet_records_login_id_index` (`login_id`),
  KEY `haolong_bet_records_bet_id_index` (`bet_id`),
  KEY `haolong_bet_records_draw_date_index` (`draw_date`),
  KEY `haolong_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `haolong_daily_win_losses`
--

DROP TABLE IF EXISTS `haolong_daily_win_losses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `haolong_daily_win_losses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `draw_date` date NOT NULL COMMENT '開彩日期',
  `login_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '投注者帳號',
  `turnover` decimal(18,4) NOT NULL COMMENT '投注金額',
  `strike` decimal(18,4) NOT NULL COMMENT '中獎金額',
  `commission` decimal(18,4) NOT NULL COMMENT '佣金',
  `total` decimal(18,4) NOT NULL COMMENT '輸贏金額',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `haolong_daily_win_losses_draw_date_index` (`draw_date`),
  KEY `haolong_daily_win_losses_login_id_index` (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ia_accounts`
--

DROP TABLE IF EXISTS `ia_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `ia_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `ia_accounts_username_index` (`username`),
  KEY `ia_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ia_bet_records`
--

DROP TABLE IF EXISTS `ia_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `rowID` bigint NOT NULL COMMENT '唯一id',
  `activity_id` tinyint NOT NULL COMMENT '活動id',
  `betamount` decimal(18,4) NOT NULL COMMENT '投注金額',
  `winamount` decimal(18,4) NOT NULL COMMENT '贏錢金額',
  `money_type` tinyint NOT NULL COMMENT '金錢類型，1=>現金，2=>虛擬幣',
  `currency_id` tinyint NOT NULL COMMENT '幣種id',
  `exchange_rate` decimal(18,7) NOT NULL COMMENT '換人民幣匯率',
  `show_scale` tinyint NOT NULL COMMENT '幣種顯示縮放比例',
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `create_time` datetime NOT NULL COMMENT '生成時間',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用戶名',
  `userip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下注ip',
  `cdnip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下注的cdnip',
  `client_type` int NOT NULL COMMENT '客戶使用的客戶端 1-pc 2-wap 3-app',
  `order_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活動注單號',
  `activity_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活動名稱',
  `utc_create_time` datetime DEFAULT NULL COMMENT '遊戲時間(UTC+0)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `ia_bet_records_username_index` (`username`),
  KEY `ia_bet_records_client_type_index` (`client_type`),
  KEY `ia_bet_records_activity_name_index` (`activity_name`),
  KEY `ia_bet_records_utc_create_time_index` (`utc_create_time`),
  KEY `ia_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ia_daily_win_losses`
--

DROP TABLE IF EXISTS `ia_daily_win_losses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_daily_win_losses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `rowID` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下注唯一id',
  `game_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲id',
  `points_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bonus` decimal(18,4) NOT NULL COMMENT '派獎金額',
  `winner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(18,4) NOT NULL COMMENT '下注總金額',
  `create_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下注時間',
  `update_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '最後更新時間',
  `bonus_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '派獎時間',
  `cancel_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '註單取消時間',
  `is_cancel` tinyint NOT NULL COMMENT '註單是否取消 1-取消 0-未取消',
  `is_getprize` tinyint NOT NULL COMMENT '註單是否結算 1-結算 0-未結算',
  `prize_status` tinyint NOT NULL COMMENT '註單輸贏狀態 1-贏 2-輸',
  `userip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下注IP',
  `cdnip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下注cdnIP',
  `money_type` tinyint NOT NULL COMMENT '金錢類型 1-現金 2-虛擬幣',
  `is_change` int DEFAULT NULL COMMENT '註單是否換隊 1-已換 0-沒換',
  `game_type_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戲類型',
  `odds` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下注時的賠率',
  `client_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客戶使用的客戶端 1-pc 2-wap 3-app',
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下注的註單類型 1-彩池盤 2-固賠 3-滾球',
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '第一局輸贏',
  `cancel_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣種',
  `exchange_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣種對人民幣匯率',
  `show_scale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣種顯示縮放比例',
  `settlement_odds` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '結算賠率',
  `prize_winner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_mark_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receive_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_champion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲名稱',
  `team_name_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '左邊隊伍名稱',
  `team_name_2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '右邊隊伍名稱',
  `team_info_desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '相關隊伍名稱(冠軍盤的時候才有數據)',
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '盤口類型 1-普通 2-冠軍',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用戶名',
  `team_points` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '隊伍賠率',
  `team_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下注的隊伍名稱',
  `event_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '賽事id',
  `user_points` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用戶賠率',
  `win_lose` decimal(18,4) NOT NULL COMMENT '用戶贏或者輸的金額',
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單號',
  `game_start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戲開始時間',
  `original_utc_start_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子盤口開始時間',
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '賽事名稱',
  `utc_update_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '最後更新時間(UTC+0)',
  `updated` int NOT NULL DEFAULT '0' COMMENT '註單是否更新過',
  `info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `ia_daily_win_losses_is_getprize_index` (`is_getprize`),
  KEY `ia_daily_win_losses_username_index` (`username`),
  KEY `ia_daily_win_losses_utc_update_time_index` (`utc_update_time`),
  KEY `ia_daily_win_losses_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `igs_accounts`
--

DROP TABLE IF EXISTS `igs_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `igs_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `player_id` int NOT NULL COMMENT 'igs玩家id',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'igs玩家密碼',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `igs_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `igs_accounts_username_index` (`username`),
  KEY `igs_accounts_player_id_index` (`player_id`),
  KEY `igs_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `igs_bet_records`
--

DROP TABLE IF EXISTS `igs_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `igs_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` bigint NOT NULL DEFAULT '0' COMMENT '注單pk',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `user_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家ID',
  `bet_amount` decimal(18,4) NOT NULL COMMENT '投注金額',
  `win_amount` decimal(18,4) NOT NULL COMMENT '贏得金額',
  `trade_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '局次ID',
  `amount_after` decimal(18,4) NOT NULL COMMENT '投注前金额',
  `game_type` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲代碼',
  `bet_at` datetime NOT NULL COMMENT '投注時間',
  `utc_bet_at` datetime NOT NULL COMMENT '投注時間 UTC',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `type` int NOT NULL DEFAULT '0' COMMENT '交易类型',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`),
  UNIQUE KEY `igs_bet_records_bet_id_unique` (`bet_id`),
  KEY `igs_bet_records_username_index` (`username`),
  KEY `igs_bet_records_game_type_index` (`game_type`),
  KEY `igs_bet_records_utc_bet_at_index` (`utc_bet_at`),
  KEY `igs_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `igs_daily_wins`
--

DROP TABLE IF EXISTS `igs_daily_wins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `igs_daily_wins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家id',
  `date_time` datetime NOT NULL COMMENT '時間',
  `win_lose` decimal(18,4) NOT NULL COMMENT '總輸贏',
  `bet_times` decimal(18,4) NOT NULL COMMENT '總投注量',
  `bet` decimal(18,4) NOT NULL COMMENT '總下注額',
  `utc_date_time` datetime NOT NULL COMMENT 'utc時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`user_id`,`date_time`),
  KEY `igs_daily_wins_user_id_index` (`user_id`),
  KEY `igs_daily_wins_utc_date_time_index` (`utc_date_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `impsw_accounts`
--

DROP TABLE IF EXISTS `impsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `impsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '商戶編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `impsw_accounts_username_unique` (`username`),
  KEY `impsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `impsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `impsw_bet_records`
--

DROP TABLE IF EXISTS `impsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `impsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ticketNum from request',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效下注金額',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩/取消/bonus時間',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT '詳細資訊',
  `settle_status` tinyint NOT NULL DEFAULT '0' COMMENT '結算狀態 0=未結算 1=已結算 2=取消',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `impsw_bet_records_bet_id_unique` (`bet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `information_languages`
--

DROP TABLE IF EXISTS `information_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `information_languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `information_id` int NOT NULL DEFAULT '0' COMMENT 'informations.id',
  `language` int NOT NULL DEFAULT '0' COMMENT 'languages.id',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ' COMMENT '圖片',
  `image_pc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ' COMMENT 'PC版圖片',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  KEY `information_languages_information_id_index` (`information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `informations`
--

DROP TABLE IF EXISTS `informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `informations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT 'agents.customized_setting_group_id',
  `type` int NOT NULL DEFAULT '0' COMMENT '圖片連結類型; 0:無連結, 1:連結至遊戲類型, 2:連結至遊戲, 3.連結至遊戲商, 4:外部連結, 5:內部連結',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_window` tinyint NOT NULL COMMENT '是否另開視窗',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint NOT NULL COMMENT '狀態; 0:關閉, 1:開啟',
  `description` longtext COLLATE utf8mb4_unicode_ci COMMENT '顯示給前端的多語系',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  KEY `informations_agent_group_id_index` (`agent_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `isb_accounts`
--

DROP TABLE IF EXISTS `isb_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `isb_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家編號',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `isb_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `isb_accounts_username_index` (`username`),
  KEY `isb_accounts_player_id_index` (`player_id`),
  KEY `isb_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `isb_bet_records`
--

DROP TABLE IF EXISTS `isb_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `isb_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `playerid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家編號',
  `operator` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '代理名稱',
  `currency` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '幣別',
  `sessionid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SESSION ID',
  `gameid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲編號',
  `roundid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '局號',
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '狀態',
  `channel` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Desktop or Mobile',
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '類型：BET、WIN、CANCEL、FREE_ROUND_BET、FREE_ROUND_WIN',
  `transactionid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易編號',
  `time` datetime NOT NULL COMMENT '投注時間(GMT)',
  `amount` decimal(18,4) DEFAULT NULL COMMENT '投注金額',
  `balance` decimal(18,4) DEFAULT NULL COMMENT '餘額',
  `jpc` decimal(18,4) DEFAULT NULL COMMENT 'Amount of JP contribution, in cents.',
  `jpw` decimal(18,4) DEFAULT NULL COMMENT 'Amount of JP wins, in cents.',
  `jpw_jpc` decimal(18,4) DEFAULT NULL COMMENT 'NGR = bet - win + jpw_from_jpc - jpc.',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `isb_bet_records_transactionid_unique` (`transactionid`),
  KEY `isb_bet_records_playerid_index` (`playerid`),
  KEY `isb_bet_records_gameid_index` (`gameid`),
  KEY `isb_bet_records_roundid_index` (`roundid`),
  KEY `isb_bet_records_time_index` (`time`),
  KEY `isb_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `j3_accounts`
--

DROP TABLE IF EXISTS `j3_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `j3_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int unsigned NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `admin` int NOT NULL DEFAULT '1',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secucode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `j3_accounts_username_unique` (`username`),
  KEY `j3_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `j3_accounts_member_id_index` (`member_id`),
  CONSTRAINT `j3_accounts_vendor_info_id_foreign` FOREIGN KEY (`vendor_info_id`) REFERENCES `vendor_infos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `j3_bet_records`
--

DROP TABLE IF EXISTS `j3_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `j3_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id, round_id from request',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, game_id from request',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `result_infos` json DEFAULT NULL COMMENT '結果資訊',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `j3_bet_records_bet_id_unique` (`bet_id`),
  KEY `j3_bet_records_username_index` (`username`),
  KEY `j3_bet_records_updated_at_index` (`updated_at`),
  CONSTRAINT `j3_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `j3_accounts` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `joker_accounts`
--

DROP TABLE IF EXISTS `joker_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `joker_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Joker帳號',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Joker餘額',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT '營運商編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員帳號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `joker_accounts_username_unique` (`username`),
  KEY `joker_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `joker_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `joker_bet_records`
--

DROP TABLE IF EXISTS `joker_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `joker_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `app_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'APP編號',
  `transaction_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單類型; Game or Jackpot',
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '投注編號唯一值',
  `game_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲類型; wager/endWager/cancelWager/cancelEndWager/appendWagerResult/promopayout/campaign/campaignpayout',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲代碼',
  `bet_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `win_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏分金額',
  `bet_time` datetime NOT NULL COMMENT '投注時間',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`app_id`,`bet_id`),
  KEY `joker_bet_records_transaction_type_index` (`transaction_type`),
  KEY `joker_bet_records_game_type_index` (`game_type`),
  KEY `joker_bet_records_username_index` (`username`),
  KEY `joker_bet_records_game_code_index` (`game_code`),
  KEY `joker_bet_records_bet_time_index` (`bet_time`),
  KEY `joker_bet_records_created_at_index` (`created_at`),
  KEY `joker_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ky_accounts`
--

DROP TABLE IF EXISTS `ky_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ky_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `modified_username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '加上前綴玩家帳號',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '平台餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ky_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `ky_accounts_username_index` (`username`),
  KEY `ky_accounts_modified_username_index` (`modified_username`),
  KEY `ky_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ky_bet_records`
--

DROP TABLE IF EXISTS `ky_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ky_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, GameId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'KindID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `payout_time` datetime NOT NULL COMMENT '派彩時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ky_bet_records_bet_id_unique` (`bet_id`),
  KEY `ky_bet_records_username_index` (`username`),
  KEY `ky_bet_records_game_code_index` (`game_code`),
  KEY `ky_bet_records_payout_time_index` (`payout_time`),
  KEY `ky_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `l4_accounts`
--

DROP TABLE IF EXISTS `l4_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `l4_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `l4_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `l4_accounts_username_index` (`username`),
  KEY `l4_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `l4_bet_records`
--

DROP TABLE IF EXISTS `l4_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `l4_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `l4_bet_records_bet_id_unique` (`bet_id`),
  KEY `l4_bet_records_username_index` (`username`),
  KEY `l4_bet_records_game_code_index` (`game_code`),
  KEY `l4_bet_records_bet_time_index` (`bet_time`),
  KEY `l4_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language_texts`
--

DROP TABLE IF EXISTS `language_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_texts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_text_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '多語系對應代碼',
  `language_id` int NOT NULL COMMENT '語言代碼',
  `text` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '多語系文字',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_texts_language_text_code_language_id_unique` (`language_text_code`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5687 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='綜合性的多語系文字定義';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '語言名稱',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '語言代碼',
  `sort` tinyint NOT NULL DEFAULT '0' COMMENT '排序',
  `wcasino` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '2' COMMENT 'wcasino 遊戲語系',
  `acewin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en-US' COMMENT 'acewin 遊戲語系',
  `ace333sw` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT 'ace333sw 遊戲語系',
  `rcb988` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en' COMMENT 'rcb988 遊戲語系',
  `gfg2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en_us' COMMENT 'gfg2 遊戲語系',
  `bolakk4d` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en-us' COMMENT 'bolakk4d 遊戲語系',
  `m8bet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'EN-US' COMMENT 'm8bet 遊戲語系',
  `wbet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en' COMMENT 'wbet 遊戲語系',
  `astar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en-us' COMMENT 'astar 遊戲語系',
  `lfc888` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en' COMMENT 'lfc888 遊戲語系',
  `ag` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT 'AG LANG代碼',
  `ace333` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ace333遊戲語系',
  `xe88` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'xe88遊戲語系',
  `lucky` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Lucky語系',
  `ebet` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ebet語系',
  `isb` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'isb遊戲語系',
  `pt` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'pt遊戲語系',
  `sbo` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sbo遊戲語系',
  `ygg` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ygg遊戲語系',
  `wm` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'wm遊戲語系',
  `pg` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'pg遊戲語系',
  `ia` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ia遊戲語系',
  `aes` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'aes遊戲語系',
  `pgs` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'pgs遊戲語系',
  `mt` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `igs` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'igs遊戲語系',
  `ct` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ct遊戲語系',
  `dg` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dg遊戲語系',
  `rm` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rm遊戲語系',
  `allbet` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'allbet遊戲語系',
  `terra` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'terra遊戲語系',
  `sa` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sa遊戲語系',
  `sky1388` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'eng' COMMENT 'sky1388 language code',
  `fishing` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'fishing遊戲語系',
  `npt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'npt遊戲語系',
  `v8` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'v8遊戲語系',
  `saba` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'saba遊戲語系',
  `obet33` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obet33遊戲語系',
  `bola2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bola2遊戲語系',
  `plus100` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '100Plus遊戲語系',
  `spadegaming` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SpadeGaming遊戲語系',
  `ns` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'NextSpin遊戲語系',
  `bng` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Booongo遊戲語系',
  `vsport` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'V-sport遊戲語系',
  `pp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'PragmaticPlay遊戲語系',
  `evo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Evolution遊戲語系',
  `pgslot` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'PGSLOT遊戲語系',
  `lbb18` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'LBB18遊戲語系',
  `dct` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'DCT遊戲語系',
  `qtech` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'QTECH遊戲語系',
  `ds88` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'DS88遊戲語系',
  `ky` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'KY遊戲語系',
  `epic` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'en-us' COMMENT 'EPIC WIN',
  `uuslot` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'UUSlot遊戲語系',
  `megawin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'MegaWin遊戲語系',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  `wfsw` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'wfsw遊戲語系',
  `j3` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'j3遊戲語系',
  `clotsw` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en-us' COMMENT 'clot遊戲語系',
  `wesw` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Vpower遊戲語系',
  `vpower` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Vpower遊戲語系',
  `cr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CR遊戲語系',
  `boracayfish` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'BoracayFish遊戲語系',
  `motivationsw` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Vpower遊戲語系',
  `bolesw` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'zh_CN' COMMENT 'bole遊戲語系',
  `impsw` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en' COMMENT 'impsw遊戲語系',
  `tthsw` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'tthsw遊戲語系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lbb_accounts`
--

DROP TABLE IF EXISTS `lbb_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lbb_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `username_modified` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號(含前綴)',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lbb_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `lbb_accounts_username_index` (`username`),
  KEY `lbb_accounts_username_modified_index` (`username_modified`),
  KEY `lbb_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lbb_bet_records`
--

DROP TABLE IF EXISTS `lbb_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lbb_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `match_date` datetime NOT NULL COMMENT '結算時間(utc)',
  `end_date` datetime DEFAULT NULL,
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `bet_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單結果',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lbb_bet_records_bet_id_unique` (`bet_id`),
  KEY `lbb_bet_records_username_index` (`username`),
  KEY `lbb_bet_records_match_date_index` (`match_date`),
  KEY `lbb_bet_records_end_date_index` (`end_date`),
  KEY `lbb_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lfc888_accounts`
--

DROP TABLE IF EXISTS `lfc888_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lfc888_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `username_modified` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號(含前綴)',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '平台餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lfc888_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `lfc888_accounts_username_index` (`username`),
  KEY `lfc888_accounts_username_modified_index` (`username_modified`),
  KEY `lfc888_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lfc888_bet_records`
--

DROP TABLE IF EXISTS `lfc888_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lfc888_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注單唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲 ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `payout_time` datetime NOT NULL COMMENT '派彩、結算時間(UTC)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lfc888_bet_records_bet_id_unique` (`bet_id`),
  KEY `lfc888_bet_records_username_index` (`username`),
  KEY `lfc888_bet_records_game_code_index` (`game_code`),
  KEY `lfc888_bet_records_bet_time_index` (`bet_time`),
  KEY `lfc888_bet_records_payout_time_index` (`payout_time`),
  KEY `lfc888_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `live_chat_accounts`
--

DROP TABLE IF EXISTS `live_chat_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `live_chat_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'response creation_date',
  `license_id` int NOT NULL DEFAULT '0' COMMENT 'LiveChat license id',
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response access_token',
  `entity_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response entity_id',
  `expires_in` int NOT NULL COMMENT 'response expires_in',
  `token_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response token_type',
  `lc_cid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cookie lc_cid',
  `lc_cst` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cookie lc_cst',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `live_chat_accounts_member_id_unique` (`member_id`),
  KEY `live_chat_accounts_license_id_index` (`license_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_event_names`
--

DROP TABLE IF EXISTS `login_event_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_event_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL DEFAULT '0' COMMENT '語言系統編號',
  `login_event_id` int NOT NULL DEFAULT '0' COMMENT '登入獎勵系統編號',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登入獎勵標題',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登入獎勵內容',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `login_event_names_login_event_id_index` (`login_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_events`
--

DROP TABLE IF EXISTS `login_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登入活動名稱',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登入活動內容',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理商編號',
  `type` int NOT NULL COMMENT '可參與活動的條件，1:活動開始後創立之新帳號、2:舊帳號, 且幾日內無開洗分紀錄',
  `how_days` int NOT NULL COMMENT '幾日內無開洗分紀錄',
  `point` int NOT NULL COMMENT '參與活動贈送的點數',
  `times` int NOT NULL COMMENT '解鎖條件：達到贈送點數的幾倍',
  `number_of_people` int NOT NULL COMMENT '可參與的人數(0代表無上限)',
  `number_of_participants` int NOT NULL COMMENT '已參與的人數',
  `start_time` datetime NOT NULL COMMENT '開始時間',
  `end_time` datetime NOT NULL COMMENT '結束時間',
  `repeat_hour` int NOT NULL COMMENT '重複參與時間間隔(最少1小時，0代表不可重複參加)',
  `vendor_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '試玩廠商',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0:停用、1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `login_events_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lucky_accounts`
--

DROP TABLE IF EXISTS `lucky_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lucky_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'lucky帳號',
  `player_id` int DEFAULT NULL COMMENT '玩家帳號',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'lucky餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `lucky_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `lucky_accounts_username_index` (`username`),
  KEY `lucky_accounts_player_id_index` (`player_id`),
  KEY `lucky_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lucky_bet_records`
--

DROP TABLE IF EXISTS `lucky_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lucky_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `round_id` bigint DEFAULT NULL COMMENT '注單ID',
  `userId` int DEFAULT NULL COMMENT '玩家ID',
  `account` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '玩家在網站的唯一標識',
  `cur` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '玩家貨幣符號',
  `mid` int DEFAULT NULL COMMENT '遊戲ID',
  `gid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '一局SPIN的ID，免費遊戲GID相同',
  `tid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '每局遊戲的交易ID',
  `bet` decimal(18,4) NOT NULL COMMENT '投注金額',
  `win` decimal(18,4) NOT NULL COMMENT '贏得金額',
  `left` decimal(18,4) NOT NULL COMMENT '下注後餘額',
  `isGamble` int DEFAULT NULL COMMENT '是否為Gamble，1:是0:否',
  `isFreeSpin` int DEFAULT NULL COMMENT '是否為免費遊戲，1:是0:否',
  `freeSpinNum` int DEFAULT NULL COMMENT '免費遊戲序號',
  `time` int DEFAULT NULL COMMENT '該局結算的UTC時間戳記，單位秒',
  `bet_time` datetime DEFAULT NULL COMMENT '該局結算的UTC時間，單位秒',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lucky_bet_records_tid_unique` (`tid`),
  KEY `lucky_bet_records_userid_index` (`userId`),
  KEY `lucky_bet_records_account_index` (`account`),
  KEY `lucky_bet_records_mid_index` (`mid`),
  KEY `lucky_bet_records_bet_time_index` (`bet_time`),
  KEY `lucky_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lucky_draw_tickets`
--

DROP TABLE IF EXISTS `lucky_draw_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lucky_draw_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `lucky_draw_id` int NOT NULL COMMENT 'lucky_draws.id',
  `member_id` int NOT NULL COMMENT '玩家ID',
  `ticket_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '抽獎券號碼',
  `reward_item_id` int NOT NULL DEFAULT '0' COMMENT '獎項ID',
  `point` decimal(18,4) DEFAULT NULL COMMENT '獎勵金額',
  `type` int NOT NULL DEFAULT '0' COMMENT '中獎結果; 0:未中 , 1:中獎',
  `status` int NOT NULL DEFAULT '0' COMMENT '提領結果; 0:未領 , 1:已領取',
  `time` datetime DEFAULT NULL COMMENT '領取時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lucky_draw_tickets_lucky_draw_id_index` (`lucky_draw_id`),
  KEY `lucky_draw_tickets_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='抽獎券';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lucky_draws`
--

DROP TABLE IF EXISTS `lucky_draws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lucky_draws` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `event_id` int NOT NULL DEFAULT '0' COMMENT '活動ID',
  `event_detail_id` int NOT NULL DEFAULT '0' COMMENT 'event_details.id',
  `no` int NOT NULL DEFAULT '0' COMMENT '期數',
  `draw_time` datetime DEFAULT NULL COMMENT '開獎時間',
  `draw_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '開獎號碼',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態; 0:未開獎, 1:已開奬, 2:已開未派獎, 3:已開派獎中, 4:取消',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lucky_draws_event_id_index` (`event_id`),
  KEY `lucky_draws_event_detail_id_index` (`event_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='抽獎券活動明細';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m8bet_accounts`
--

DROP TABLE IF EXISTS `m8bet_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `m8bet_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `vendor_uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲商的玩家 UID-依據遊戲商需求',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家密碼-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家登入用 Token-依據遊戲商需求',
  `admin` int NOT NULL DEFAULT '0' COMMENT '數據操作人員的管理者系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `m8bet_accounts_username_unique` (`username`),
  KEY `m8bet_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `m8bet_accounts_member_id_index` (`member_id`),
  KEY `m8bet_accounts_vendor_username_index` (`vendor_username`),
  KEY `m8bet_accounts_vendor_uid_index` (`vendor_uid`),
  KEY `m8bet_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m8bet_bet_records`
--

DROP TABLE IF EXISTS `m8bet_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `m8bet_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注單唯一Id, ThemeId',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩、結算時間(UTC)',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未結算,1:已結算',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲 ID-依據遊戲商需求',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼金額-依據遊戲商需求',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '訪問投注單的 Session Token 或 ID 簽章-依據遊戲商需求',
  `info` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `m8bet_bet_records_bet_id_unique` (`bet_id`),
  KEY `m8bet_bet_records_vendor_username_index` (`vendor_username`),
  KEY `m8bet_bet_records_bet_time_index` (`bet_time`),
  KEY `m8bet_bet_records_payout_time_index` (`payout_time`),
  KEY `m8bet_bet_records_session_token_index` (`session_token`),
  KEY `m8bet_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maintenance_whitelists`
--

DROP TABLE IF EXISTS `maintenance_whitelists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_whitelists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL COMMENT '類型: 1.IP 2.代理',
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '白名單的代理或IP',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marquee_text_contents`
--

DROP TABLE IF EXISTS `marquee_text_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `marquee_text_contents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `marquee_text_id` int NOT NULL COMMENT '文字跑馬燈id',
  `language_id` int NOT NULL COMMENT '語系ID',
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '跑馬燈內容',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `marquee_text_contents_marquee_text_id_index` (`marquee_text_id`),
  KEY `marquee_text_contents_language_id_index` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marquee_texts`
--

DROP TABLE IF EXISTS `marquee_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `marquee_texts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理id',
  `exclude_agent_id` int NOT NULL COMMENT '排除代理id',
  `location` int NOT NULL DEFAULT '1' COMMENT '跑馬燈位置;1:大廳、2:聊天室',
  `type` tinyint NOT NULL COMMENT '跑馬燈類別，1:一般 2:重要',
  `status` tinyint NOT NULL DEFAULT '0',
  `start_time` datetime NOT NULL COMMENT '起始時間',
  `end_time` datetime NOT NULL COMMENT '結束時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `marquee_texts_agent_id_index` (`agent_id`),
  KEY `marquee_texts_start_time_index` (`start_time`),
  KEY `marquee_texts_end_time_index` (`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marquee_win_point_records`
--

DROP TABLE IF EXISTS `marquee_win_point_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `marquee_win_point_records` (
  `total_bet_record_id` bigint NOT NULL,
  `win` decimal(18,4) NOT NULL COMMENT '贏分',
  `agent_id` int NOT NULL COMMENT '代理ID',
  `vendor_id` int NOT NULL COMMENT '遊戲商ID',
  `member_id` int NOT NULL COMMENT '玩家ID',
  `game_id` int NOT NULL COMMENT '遊戲ID',
  `payout_time` datetime NOT NULL COMMENT '發放時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  UNIQUE KEY `unique_index` (`total_bet_record_id`,`agent_id`),
  KEY `marquee_win_point_records_agent_id_index` (`agent_id`),
  KEY `marquee_win_point_records_payout_time_index` (`payout_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marquee_win_points`
--

DROP TABLE IF EXISTS `marquee_win_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `marquee_win_points` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理id',
  `exclude_agent_id` int NOT NULL COMMENT '排除代理id',
  `vendor_id` int NOT NULL COMMENT '遊戲商',
  `trigger_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '觸發金額',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`agent_id`,`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medias`
--

DROP TABLE IF EXISTS `medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `medias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '媒體代碼',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '媒體名稱',
  `info` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '媒體資訊',
  `status` tinyint NOT NULL COMMENT '狀態',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mega888_accounts`
--

DROP TABLE IF EXISTS `mega888_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mega888_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'mega888帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密碼',
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '玩家帳號',
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mega888系統內部分配id(登入帳號)',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'mega888餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mega888_accounts_username_unique` (`username`),
  KEY `mega888_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `mega888_accounts_player_id_index` (`player_id`),
  KEY `mega888_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mega888_bet_records`
--

DROP TABLE IF EXISTS `mega888_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mega888_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '識別碼 {player_id}-{game_id}-{bet_time}-{bet_id]',
  `btype` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲分類 (single, live)',
  `class_id` int DEFAULT NULL COMMENT '未知',
  `player_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `bet_time` datetime DEFAULT NULL COMMENT '投注時間',
  `bet_time_utc` datetime DEFAULT NULL COMMENT '投注時間utc',
  `begin_balance` decimal(18,4) DEFAULT NULL COMMENT '投注前餘額',
  `end_balance` decimal(18,4) DEFAULT NULL COMMENT '結算後餘額',
  `game_id` int DEFAULT NULL COMMENT '遊戲ID',
  `game_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲名稱',
  `line_num` int DEFAULT NULL COMMENT '未知',
  `log_data_str` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲記錄',
  `log_data_type` int DEFAULT NULL COMMENT '未知',
  `round_no` int DEFAULT NULL COMMENT '局號',
  `row_num` int DEFAULT NULL COMMENT '未知',
  `table_id` int DEFAULT NULL COMMENT '桌號',
  `win` decimal(18,4) DEFAULT NULL COMMENT '派彩金額',
  `bet` decimal(18,4) DEFAULT NULL COMMENT '投注金額',
  `bet_id` int DEFAULT NULL COMMENT '未知',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `created_by` int NOT NULL COMMENT '建立者ID',
  `updated_by` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mega888_bet_records_ref_id_unique` (`ref_id`),
  KEY `mega888_bet_records_player_id_bet_time_utc_index` (`player_id`,`bet_time_utc`),
  KEY `mega888_bet_records_bet_time_index` (`bet_time`),
  KEY `mega888_bet_records_game_id_index` (`game_id`),
  KEY `mega888_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mega888_daily_wins`
--

DROP TABLE IF EXISTS `mega888_daily_wins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mega888_daily_wins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `date` date NOT NULL COMMENT '日期',
  `type` int NOT NULL COMMENT '類型，1:mega電子遊戲2:BG視訊',
  `loginId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家編號',
  `bet` decimal(13,7) NOT NULL DEFAULT '0.0000000' COMMENT '投注金額',
  `win` decimal(13,7) NOT NULL DEFAULT '0.0000000' COMMENT '贏得金額',
  `yieId` decimal(8,2) NOT NULL COMMENT '收益率',
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家暱稱',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `tel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '電話',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`date`,`type`,`loginId`),
  KEY `mega888_daily_wins_date_index` (`date`),
  KEY `mega888_daily_wins_type_index` (`type`),
  KEY `mega888_daily_wins_loginid_index` (`loginId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `megawinsw_accounts`
--

DROP TABLE IF EXISTS `megawinsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `megawinsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `user_token` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '授權碼',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `megawinsw_accounts_username_unique` (`username`),
  UNIQUE KEY `megawinsw_accounts_user_token_unique` (`user_token`),
  KEY `megawinsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `megawinsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `megawinsw_bet_records`
--

DROP TABLE IF EXISTS `megawinsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `megawinsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id, wagerId from request',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0: 未有結果, L: 輸, W: 贏, D: 取消, N: 和局',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `result_infos` json DEFAULT NULL COMMENT 'game result 詳細資訊',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `megawinsw_bet_records_bet_id_unique` (`bet_id`),
  KEY `megawinsw_bet_records_username_index` (`username`),
  CONSTRAINT `megawinsw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `megawinsw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_access_tokens`
--

DROP TABLE IF EXISTS `member_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_access_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `member_id` int NOT NULL COMMENT '會員帳號系統編號(Member)',
  `token` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `expire_date` datetime NOT NULL COMMENT '過期日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `member_access_tokens_member_id_index` (`member_id`),
  KEY `member_access_tokens_token_index` (`token`),
  KEY `member_access_tokens_expire_date_index` (`expire_date`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_activities`
--

DROP TABLE IF EXISTS `member_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_activities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '統計時間',
  `member_id` int NOT NULL COMMENT '會員編號',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最後登入時間',
  `last_deposit_time` timestamp NULL DEFAULT NULL COMMENT '最後存款時間',
  `last_withdrawal_time` timestamp NULL DEFAULT NULL COMMENT '最後提款時間',
  `last_bet_time` timestamp NULL DEFAULT NULL COMMENT '最後投注時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`data_time`,`member_id`),
  KEY `member_activities_data_time_index` (`data_time`),
  KEY `member_activities_member_id_index` (`member_id`),
  KEY `member_activities_last_login_time_index` (`last_login_time`),
  KEY `member_activities_last_deposit_time_index` (`last_deposit_time`),
  KEY `member_activities_last_withdrawal_time_index` (`last_withdrawal_time`),
  KEY `member_activities_last_bet_time_index` (`last_bet_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_activities_latest`
--

DROP TABLE IF EXISTS `member_activities_latest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_activities_latest` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL COMMENT '會員編號',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最後登入時間',
  `last_deposit_time` timestamp NULL DEFAULT NULL COMMENT '最後存款時間',
  `last_withdrawal_time` timestamp NULL DEFAULT NULL COMMENT '最後提款時間',
  `last_bet_time` timestamp NULL DEFAULT NULL COMMENT '最後投注時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`member_id`),
  KEY `member_activities_latest_member_id_index` (`member_id`),
  KEY `member_activities_latest_last_login_time_index` (`last_login_time`),
  KEY `member_activities_latest_last_deposit_time_index` (`last_deposit_time`),
  KEY `member_activities_latest_last_withdrawal_time_index` (`last_withdrawal_time`),
  KEY `member_activities_latest_last_bet_time_index` (`last_bet_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_agent`
--

DROP TABLE IF EXISTS `member_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_agent` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `member_id` int DEFAULT NULL COMMENT '玩家編號',
  `parent_id` int unsigned DEFAULT NULL COMMENT '上層代理系統編號(User)',
  `topper_member_id` int unsigned DEFAULT '0' COMMENT '上層玩家編號。紀錄上層玩家編號，如果該欄位為null代表為最上層',
  `agent_mode` tinyint DEFAULT '1' COMMENT '代理模式類型。 1:無限代、2:淨利代....',
  `agent_level` tinyint unsigned DEFAULT '1' COMMENT '會員層級',
  `agent_relation` text COLLATE utf8mb4_unicode_ci COMMENT '代理鏈結，格式:id_id_id(包含自己)',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_agent_member_id_unique` (`member_id`),
  KEY `member_agent_parent_id_index` (`parent_id`),
  KEY `member_agent_topper_member_id_index` (`topper_member_id`),
  KEY `member_agent_agent_level_index` (`agent_level`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_authentications`
--

DROP TABLE IF EXISTS `member_authentications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_authentications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '主帳號的系統編號(不等於0就是子帳號)',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '類型; 1:Google2FA',
  `secret` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'secret key',
  `image` text COLLATE utf8mb4_unicode_ci COMMENT 'img',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '帳號狀態 0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `member_authentications_member_id_index` (`member_id`),
  KEY `member_authentications_type_index` (`type`),
  KEY `member_authentications_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_bank_accounts`
--

DROP TABLE IF EXISTS `member_bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_bank_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK流水號',
  `member_id` int NOT NULL COMMENT 'member_id',
  `bank_id` int NOT NULL COMMENT '關聯的銀行; order_types.id',
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳戶名稱',
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳戶帳號',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `operator_cs` int NOT NULL COMMENT '修改人(客服後台)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `member_bank_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='玩家銀行帳戶';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_binding_logs`
--

DROP TABLE IF EXISTS `member_binding_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_binding_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL DEFAULT '0' COMMENT '類別; 1:修改手機, 2:修改email, 3:綁定email',
  `member_id` int NOT NULL DEFAULT '0' COMMENT 'members.id',
  `before_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更換前的值',
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更換後的值',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'IP地址',
  `validate_type` int NOT NULL DEFAULT '0' COMMENT '驗證類別; 1:手機, 2:email',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態; 0:未成功, 1:成功, 2:失敗',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `member_binding_logs_created_at_index` (`created_at`),
  KEY `member_binding_logs_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_codes`
--

DROP TABLE IF EXISTS `member_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_codes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `member_id` int DEFAULT NULL COMMENT '會員ID',
  `agent_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '會員推廣碼',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_codes_agent_code_unique` (`agent_code`),
  KEY `member_codes_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_credit_cards`
--

DROP TABLE IF EXISTS `member_credit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_credit_cards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `user_id` int NOT NULL COMMENT '帳號系統編號(User)',
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '信用卡號',
  `card_holder` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '持卡人姓名',
  `expire_date` date NOT NULL COMMENT '過期日',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_crypto_wallets`
--

DROP TABLE IF EXISTS `member_crypto_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_crypto_wallets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `agent_cash_flow_order_type_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '錢包地址',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態; 0:停用, 1:啟用',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '餘額',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`agent_cash_flow_order_type_id`,`address`),
  KEY `member_crypto_wallets_agent_cash_flow_order_type_id_index` (`agent_cash_flow_order_type_id`),
  KEY `member_crypto_wallets_member_id_index` (`member_id`),
  KEY `member_crypto_wallets_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_input_datas`
--

DROP TABLE IF EXISTS `member_input_datas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_input_datas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `input_id` int NOT NULL COMMENT '輸入框系統編號',
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '值',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_input_types`
--

DROP TABLE IF EXISTS `member_input_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_input_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類型名稱',
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '程式碼',
  `status` tinyint(1) NOT NULL COMMENT '狀態',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_inputs`
--

DROP TABLE IF EXISTS `member_inputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_inputs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `agent_id` int NOT NULL COMMENT '代理系統編號',
  `type_id` int NOT NULL COMMENT '輸入框類型系統編號',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '輸入框標題',
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '輸入框值(json格式,ex:{"male":1,"female":2})',
  `is_required` tinyint(1) NOT NULL COMMENT '是否必填0:選填，1:必填',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_launch_logs`
--

DROP TABLE IF EXISTS `member_launch_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_launch_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `launch_date` datetime NOT NULL COMMENT 'Launch Date',
  `member_id` int NOT NULL COMMENT '玩家系統編號(members.id)',
  `wallet_type_id` int NOT NULL DEFAULT '1' COMMENT '錢包系統編號(wallet_types.id)',
  `game_id` int NOT NULL DEFAULT '0' COMMENT '遊戲系統編號(games.id)',
  `count` int NOT NULL COMMENT '登入次數',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `member_launch_logs_launch_date_index` (`launch_date`),
  KEY `member_launch_logs_member_id_index` (`member_id`),
  KEY `member_launch_logs_wallet_type_id_index` (`wallet_type_id`),
  KEY `member_launch_logs_game_id_index` (`game_id`),
  KEY `member_launch_logs_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_login_ip_logs`
--

DROP TABLE IF EXISTS `member_login_ip_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_login_ip_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL COMMENT '代理編號',
  `ip` bigint DEFAULT NULL COMMENT '登入ip',
  `ip_1` int NOT NULL COMMENT 'ip_1',
  `ip_2` int NOT NULL COMMENT 'ip_2',
  `ip_3` int NOT NULL COMMENT 'ip_3',
  `ip_4` int NOT NULL COMMENT 'ip_4',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `member_login_ip_logs_member_id_index` (`member_id`),
  KEY `member_login_ip_logs_ip_index` (`ip`),
  KEY `member_login_ip_logs_ip_1_index` (`ip_1`),
  KEY `member_login_ip_logs_ip_2_index` (`ip_2`),
  KEY `member_login_ip_logs_ip_3_index` (`ip_3`),
  KEY `member_login_ip_logs_ip_4_index` (`ip_4`),
  KEY `member_login_ip_logs_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_login_logs`
--

DROP TABLE IF EXISTS `member_login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_login_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `member_id` int NOT NULL COMMENT '會員帳號系統編號(Member)',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'IP地址',
  `status` tinyint NOT NULL COMMENT '狀態：0失敗，1成功',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `member_login_logs_member_id_index` (`member_id`),
  KEY `member_login_logs_status_index` (`status`),
  KEY `member_login_logs_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_missions`
--

DROP TABLE IF EXISTS `member_missions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_missions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `summary_time` datetime NOT NULL,
  `member_id` bigint unsigned NOT NULL,
  `mission_id` bigint unsigned NOT NULL,
  `progress` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `is_claimed` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`summary_time`,`member_id`,`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_restrictions`
--

DROP TABLE IF EXISTS `member_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_restrictions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT 'members.id',
  `account_status` int NOT NULL DEFAULT '0' COMMENT '帳號狀態; 1:Suspend(懷疑),2:active',
  `previous_account_status` int NOT NULL DEFAULT '0' COMMENT '上一次的帳號狀態',
  `risk` int NOT NULL DEFAULT '0' COMMENT '風險評估; 1:normal,2:high',
  `previous_risk` int NOT NULL DEFAULT '0' COMMENT '上一次的風險評估',
  `remark` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `previous_remark` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上一次的備註',
  `amend` tinyint NOT NULL DEFAULT '0' COMMENT '是否修改過; 0:否, 1:是',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `member_restrictions_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_settings`
--

DROP TABLE IF EXISTS `member_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `member_id` int NOT NULL COMMENT '帳號系統編號(User)',
  `activity_limit_time` int NOT NULL COMMENT '最長非活動狀態時間(minute)',
  `push_notify` tinyint NOT NULL COMMENT '接受優惠通知-推送通知',
  `sms_notify` tinyint NOT NULL COMMENT '接受優惠通知-短信提示',
  `email_notify` tinyint NOT NULL COMMENT '接受優惠通知-電子郵件',
  `message_box_notify` tinyint NOT NULL COMMENT '站內優惠通知-信息收件箱',
  `message_popup_notify` tinyint NOT NULL COMMENT '站內優惠通知-優惠彈出信息',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_telegram_rels`
--

DROP TABLE IF EXISTS `member_telegram_rels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_telegram_rels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int NOT NULL COMMENT 'brand id',
  `tg_user_id` bigint NOT NULL COMMENT 'tg user_id',
  `member_id` int unsigned NOT NULL COMMENT '會員系統編號',
  `tg_password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'password 明文',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `member_telegram_rels_tg_user_id_index` (`tg_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_tracking_events`
--

DROP TABLE IF EXISTS `member_tracking_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_tracking_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類型',
  `data` json DEFAULT NULL COMMENT '資料',
  `sent_at` timestamp NULL DEFAULT NULL COMMENT '發送時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `member_tracking_events_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_transfer_logs`
--

DROP TABLE IF EXISTS `member_transfer_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_transfer_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT 'members.id',
  `transaction_log_id` int NOT NULL DEFAULT '0' COMMENT 'transaction_logs.id(轉入)',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '金額',
  `tax` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '稅收',
  `operator` int NOT NULL DEFAULT '0' COMMENT 'members.id(操作人)',
  `operator_transaction_log_id` int NOT NULL DEFAULT '0' COMMENT 'transaction_logs.id(轉出)',
  `remark` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態; 0: 失敗, 1: 成功',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `member_transfer_logs_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_unlimit_cancels`
--

DROP TABLE IF EXISTS `member_unlimit_cancels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_unlimit_cancels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `date` date NOT NULL COMMENT '日期',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint NOT NULL COMMENT '狀態',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `member_unlimit_cancels_date_index` (`date`),
  KEY `member_unlimit_cancels_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_validation_type_names`
--

DROP TABLE IF EXISTS `member_validation_type_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_validation_type_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL COMMENT '語言系統編號',
  `type_id` int NOT NULL COMMENT '會員驗證系統編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲類型名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_validation_types`
--

DROP TABLE IF EXISTS `member_validation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_validation_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別名稱',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_validations`
--

DROP TABLE IF EXISTS `member_validations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_validations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `member_id` int NOT NULL COMMENT '帳號系統編號(members)',
  `type_id` tinyint NOT NULL COMMENT '驗證類型系統編號',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '檔案位置',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '是否通過審核 0: 未通過 1:通過 2:拒絕',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_vip_prizes`
--

DROP TABLE IF EXISTS `member_vip_prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_vip_prizes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `vip_content_reward_id` int NOT NULL DEFAULT '0' COMMENT 'VIP獎勵系統編號',
  `point_type` int NOT NULL DEFAULT '1' COMMENT '1:真金 2:禮碼',
  `base_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '基數(用來乘上獎勵%數)',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎勵金額',
  `expired_time` datetime DEFAULT NULL COMMENT '過期時間',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未領取 1:已領取',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `member_vip_prizes_member_id_index` (`member_id`),
  KEY `member_vip_prizes_vip_content_reward_id_index` (`vip_content_reward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_vip_records`
--

DROP TABLE IF EXISTS `member_vip_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_vip_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `before_vip_content_id` int NOT NULL DEFAULT '0' COMMENT '原本VIP系統編號',
  `vip_content_id` int NOT NULL DEFAULT '0' COMMENT 'VIP系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `member_vip_records_member_id_index` (`member_id`),
  KEY `member_vip_records_before_vip_content_id_index` (`before_vip_content_id`),
  KEY `member_vip_records_vip_content_id_index` (`vip_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_vips`
--

DROP TABLE IF EXISTS `member_vips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_vips` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `vip_content_id` int NOT NULL DEFAULT '0' COMMENT 'VIP系統編號',
  `deposit_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '已充值金額',
  `keep_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '累積保級金額',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `target_date` date DEFAULT NULL COMMENT '達標日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `member_vips_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_wallets`
--

DROP TABLE IF EXISTS `member_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_wallets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL COMMENT '玩家帳號',
  `wallet_type_id` int NOT NULL COMMENT '錢包類型; 1:主錢包, 1002:禮碼錢包, 1003:免費幣排行榜活動',
  `balance` decimal(30,10) NOT NULL DEFAULT '0.0000000000' COMMENT '錢包實際金額',
  `first_deposit` datetime DEFAULT NULL COMMENT '首次儲值時間',
  `is_bet` int NOT NULL DEFAULT '0' COMMENT '當天是否投注過',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '帳號狀態 0:未使用,1:使用中,2:鎖定(異常, 無法使用)',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '方便技術記錄用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`member_id`,`wallet_type_id`),
  KEY `member_wallets_member_id_index` (`member_id`),
  KEY `member_wallets_wallet_type_id_index` (`wallet_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `parent` int NOT NULL COMMENT '上層代理系統編號(User)',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `username_bak` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '電子信箱',
  `nickname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '暱稱',
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `payment_password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付密碼',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '平台餘額',
  `balance_bak` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `invitation_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邀請碼',
  `device_id` text COLLATE utf8mb4_unicode_ci COMMENT '推播設備號',
  `device_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '設備種類',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '個人頭像',
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '英文名',
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '英文姓',
  `birthday` date DEFAULT NULL COMMENT '出生年月日',
  `mobile` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '聯繫號碼',
  `timezone_id` int DEFAULT NULL COMMENT '時區系統編號',
  `country_id` int DEFAULT NULL COMMENT '居住國家(FK_Country)',
  `zip_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '郵政編碼',
  `district` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省/地區/郡',
  `city` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城鎮/城市',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `register_country_id` int DEFAULT NULL COMMENT '註冊國家',
  `register_ip` bigint DEFAULT NULL COMMENT '註冊IP',
  `register_ip_detail` text COLLATE utf8mb4_unicode_ci,
  `register_domain` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '註冊網域',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '帳號狀態 0:未認證,1:正常,2:鎖定(密碼輸入錯六次, 系統自動變更)',
  `sys_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '系統鎖定; 1:鎖定, 0:非解鎖',
  `event_mode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否進入活動鎖定模式0:未鎖定，1:鎖定',
  `change_to_single_wallet` tinyint(1) NOT NULL DEFAULT '0' COMMENT '代理是否由多錢包轉換為單一錢包0:否，1:是',
  `is_validate` int NOT NULL DEFAULT '0' COMMENT '是否通過身份驗證',
  `mobile_validate` int NOT NULL DEFAULT '0' COMMENT '是否通過手機驗證',
  `email_validate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態 0:未認證,1:已認證',
  `last_login` datetime DEFAULT NULL COMMENT '最後登入時間',
  `last_login_ip` bigint DEFAULT '0' COMMENT '最後登入IP',
  `first_deposit` datetime DEFAULT NULL COMMENT '首次儲值時間',
  `total_login_fail_count` int DEFAULT '0' COMMENT '總登入錯誤次數',
  `login_fail_count` int DEFAULT '0' COMMENT '登入錯誤次數',
  `forget_pwd_count` int DEFAULT '0' COMMENT '忘記密碼次數',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '方便技術記錄用',
  `has_2fa` tinyint NOT NULL DEFAULT '0' COMMENT 'Google驗證器開關, 0:關閉, 1:開啟',
  `ip_change_mobile_verify` tinyint NOT NULL DEFAULT '0' COMMENT '登入IP變更手機驗證開關',
  `ip_change_email_verify` tinyint NOT NULL DEFAULT '0' COMMENT '登入IP變更email驗證開關',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  `vworld_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'vworld1.0的玩家編號(備用而已)',
  `realname_validate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_username_unique` (`username`),
  KEY `members_parent_index` (`parent`),
  KEY `members_email_index` (`email`),
  KEY `members_nickname_index` (`nickname`),
  KEY `members_invitation_code_index` (`invitation_code`),
  KEY `members_first_name_index` (`first_name`),
  KEY `members_mobile_index` (`mobile`),
  KEY `members_status_index` (`status`),
  KEY `members_is_validate_index` (`is_validate`),
  KEY `members_mobile_validate_index` (`mobile_validate`),
  KEY `members_email_validate_index` (`email_validate`),
  KEY `members_last_login_index` (`last_login`),
  KEY `members_created_at_index` (`created_at`),
  KEY `members_updated_at_index` (`updated_at`),
  KEY `members_register_ip_index` (`register_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=667 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menang88_accounts`
--

DROP TABLE IF EXISTS `menang88_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `menang88_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲帳號ID',
  `player_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '開啟遊戲的玩家token',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `menang88_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `menang88_accounts_username_index` (`username`),
  KEY `menang88_accounts_player_id_index` (`player_id`),
  KEY `menang88_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menang88_bet_records`
--

DROP TABLE IF EXISTS `menang88_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `menang88_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `created_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `bet_time` datetime NOT NULL COMMENT '開獎時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount - BetCoin',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menang88_bet_records_bet_id_unique` (`bet_id`),
  KEY `menang88_bet_records_bet_time_index` (`bet_time`),
  KEY `menang88_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mgc_accounts`
--

DROP TABLE IF EXISTS `mgc_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgc_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mgc_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `mgc_accounts_username_index` (`username`),
  KEY `mgc_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mgc_bet_records`
--

DROP TABLE IF EXISTS `mgc_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgc_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '開獎時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mgc_bet_records_bet_id_unique` (`bet_id`),
  KEY `mgc_bet_records_username_index` (`username`),
  KEY `mgc_bet_records_game_code_index` (`game_code`),
  KEY `mgc_bet_records_bet_time_index` (`bet_time`),
  KEY `mgc_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mgc_transaction_logs`
--

DROP TABLE IF EXISTS `mgc_transaction_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgc_transaction_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'transaction_log.id',
  `trade_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `type` int NOT NULL DEFAULT '0' COMMENT '類別 0:轉回平台,1:轉入遊戲商',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `money` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '轉帳金額',
  `time` int NOT NULL DEFAULT '0' COMMENT '已使用api的次數',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未處理,1:已處理',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mgc_transaction_logs_order_id_unique` (`order_id`),
  UNIQUE KEY `mgc_transaction_logs_trade_id_unique` (`trade_id`),
  KEY `mgc_transaction_logs_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mission_available_agents`
--

DROP TABLE IF EXISTS `mission_available_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_available_agents` (
  `mission_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mission_id`,`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mission_claim_records`
--

DROP TABLE IF EXISTS `mission_claim_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_claim_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mission_id` int unsigned NOT NULL,
  `member_id` int unsigned NOT NULL,
  `reward_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '獎勵類型 MissionRewardTypeEnum',
  `reward_value` double DEFAULT NULL COMMENT '獎勵值',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日期',
  `week` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年週',
  `month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '月份',
  `finish_time` datetime DEFAULT NULL COMMENT '完成時間',
  `claim_time` datetime DEFAULT NULL COMMENT '領取時間',
  `is_claimed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否領取',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mission_claim_records_mission_id_index` (`mission_id`),
  KEY `mission_claim_records_member_id_index` (`member_id`),
  KEY `mission_claim_records_date_index` (`date`),
  KEY `mission_claim_records_week_index` (`week`),
  KEY `mission_claim_records_month_index` (`month`),
  KEY `mission_claim_records_finish_time_index` (`finish_time`),
  KEY `mission_claim_records_claim_time_index` (`claim_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mission_names`
--

DROP TABLE IF EXISTS `mission_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `mission_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`language_id`,`mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `missions`
--

DROP TABLE IF EXISTS `missions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `missions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` int NOT NULL COMMENT '代理ID',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0: never started, 1: active, 2: ended, -1: inactive',
  `reset_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0: daily, 1: weekly, 2: monthly',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作類型, 0: deposit, 1: bet, 2: game',
  `condition_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition_value` decimal(18,4) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `info` json DEFAULT NULL COMMENT '任務資訊, all setting infos like condition, reward, etc.',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motivationsw_accounts`
--

DROP TABLE IF EXISTS `motivationsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `motivationsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `motivationsw_accounts_username_unique` (`username`),
  KEY `motivationsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `motivationsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motivationsw_bet_records`
--

DROP TABLE IF EXISTS `motivationsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `motivationsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單id',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `mtcode` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'mtcode',
  `status` int NOT NULL COMMENT '1:Bet, 2:EndRound, 3:Rollout, 4:Rollin, 5:Refund',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime DEFAULT NULL COMMENT '下注時間',
  `result_date` datetime DEFAULT NULL COMMENT '算結果的日期時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `result_infos` json DEFAULT NULL COMMENT 'result 詳細資訊',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`bet_id`,`mtcode`),
  KEY `motivationsw_bet_records_username_index` (`username`),
  KEY `motivationsw_bet_records_mtcode_index` (`mtcode`),
  KEY `motivationsw_bet_records_bet_time_index` (`bet_time`),
  KEY `motivationsw_bet_records_result_date_index` (`result_date`),
  CONSTRAINT `motivationsw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `motivationsw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mt_accounts`
--

DROP TABLE IF EXISTS `mt_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mt_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `mt_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `mt_accounts_username_index` (`username`),
  KEY `mt_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mt_bet_records`
--

DROP TABLE IF EXISTS `mt_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mt_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `rowID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲紀錄詳情ID',
  `playerName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商戶用戶名稱',
  `gameDate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲時間',
  `gameCode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲代碼',
  `gameType` tinyint NOT NULL COMMENT '遊戲類型',
  `betAmount` decimal(18,4) NOT NULL COMMENT '下注金額',
  `winAmount` decimal(18,4) DEFAULT NULL COMMENT '贏得金額',
  `commissionable` decimal(18,4) NOT NULL COMMENT '有效投注量',
  `roomFee` decimal(18,4) NOT NULL COMMENT '房費',
  `income` decimal(18,4) NOT NULL COMMENT '赢得金額-下注金額-房費',
  `progressive_wins` decimal(18,4) DEFAULT NULL COMMENT '貢獻彩金',
  `progressive_share` decimal(18,4) DEFAULT NULL COMMENT '獲得彩金',
  `merchantId` int NOT NULL DEFAULT '0' COMMENT '商戶ID',
  `utc_gameDate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲時間(UTC+0)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mt_bet_records_rowid_unique` (`rowID`),
  KEY `mt_bet_records_playername_index` (`playerName`),
  KEY `mt_bet_records_gamecode_index` (`gameCode`),
  KEY `mt_bet_records_utc_gamedate_index` (`utc_gameDate`),
  KEY `mt_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `n918_accounts`
--

DROP TABLE IF EXISTS `n918_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `n918_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `n918_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `n918_accounts_username_index` (`username`),
  KEY `n918_accounts_player_id_index` (`player_id`),
  KEY `n918_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `n918_bet_records`
--

DROP TABLE IF EXISTS `n918_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `n918_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金额; WinAmount',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount - BetCoin',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `n918_bet_records_bet_id_unique` (`bet_id`),
  KEY `n918_bet_records_game_code_index` (`game_code`),
  KEY `n918_bet_records_bet_time_index` (`bet_time`),
  KEY `n918_bet_records_updated_at_index` (`updated_at`),
  KEY `n918_bet_records_username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `n918_daily_wins`
--

DROP TABLE IF EXISTS `n918_daily_wins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `n918_daily_wins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '押注時間',
  `player_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinLose',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `n918_daily_wins_date_index` (`date`),
  KEY `n918_daily_wins_player_id_index` (`player_id`),
  KEY `n918_daily_wins_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ncpays`
--

DROP TABLE IF EXISTS `ncpays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ncpays` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `order_id` int DEFAULT NULL COMMENT '訂單系統編號',
  `ncpay_deposit_id` int DEFAULT NULL COMMENT '存款編號',
  `ncpay_order_id` int DEFAULT NULL COMMENT '訂單編號',
  `third_party_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方訂單編號',
  `bank` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '銀行編號',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '金額',
  `fee` decimal(10,2) DEFAULT NULL COMMENT '手續費',
  `index` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '備註',
  `ncpay_status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '狀態文字',
  `ncpay_updated` int NOT NULL DEFAULT '0' COMMENT 'NCPAY更新時間',
  `ncpay_created` int NOT NULL DEFAULT '0' COMMENT 'NCPAY建立時間',
  `error` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '錯誤訊息',
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '錯誤詳情',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態1:待處理,2:處理中,3:成功,4:操作失敗,5:操作取消',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `ncpays_ncpay_order_id_index` (`ncpay_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new4d2026_accounts`
--

DROP TABLE IF EXISTS `new4d2026_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `new4d2026_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `new4d2026_accounts_member_id_index` (`member_id`),
  KEY `new4d2026_accounts_username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new4d2026_bet_records`
--

DROP TABLE IF EXISTS `new4d2026_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `new4d2026_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲代碼',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注額',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `bonus` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '額外獎金/錦標賽獎金',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩池獎金',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注禮碼金額',
  `bet_time` timestamp NOT NULL COMMENT '投注時間',
  `payout_time` timestamp NULL DEFAULT NULL COMMENT '結算時間',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:建立注單,1:已派彩,2:取消注單',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `new4d2026_bet_records_username_index` (`username`),
  KEY `new4d2026_bet_records_bet_id_index` (`bet_id`),
  KEY `new4d2026_bet_records_bet_time_index` (`bet_time`),
  KEY `new4d2026_bet_records_payout_time_index` (`payout_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nex4dsw_accounts`
--

DROP TABLE IF EXISTS `nex4dsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nex4dsw_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員編號',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nex4dsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `nex4dsw_accounts_member_id_index` (`member_id`),
  KEY `nex4dsw_accounts_username_index` (`username`),
  KEY `nex4dsw_accounts_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nex4dsw_bet_records`
--

DROP TABLE IF EXISTS `nex4dsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nex4dsw_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員編號',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號 playerId',
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單號 betId',
  `reference_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `draw_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `draw_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `op_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商戶 OP_CODE',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注額 betAmount',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注額 realBetAmount',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `bonus` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '額外獎金/錦標賽獎金',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩池獎金',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注禮碼金額',
  `bet_time` timestamp NOT NULL COMMENT '投注時間',
  `payout_time` timestamp NULL DEFAULT NULL COMMENT '結算時間',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:建立注單,1:進行中,2:退款,3:已結算',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nex4dsw_bet_records_reference_no_unique` (`reference_no`),
  KEY `nex4dsw_bet_records_vendor_info_id_index` (`vendor_info_id`),
  KEY `nex4dsw_bet_records_member_id_index` (`member_id`),
  KEY `nex4dsw_bet_records_username_index` (`username`),
  KEY `nex4dsw_bet_records_bet_id_index` (`bet_id`),
  KEY `nex4dsw_bet_records_game_code_index` (`game_code`),
  KEY `nex4dsw_bet_records_bet_time_index` (`bet_time`),
  KEY `nex4dsw_bet_records_payout_time_index` (`payout_time`),
  KEY `nex4dsw_bet_records_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nex4dsw_deal_records`
--

DROP TABLE IF EXISTS `nex4dsw_deal_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nex4dsw_deal_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注單號 betId',
  `reference_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '請求動作',
  `trace_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日誌追蹤碼',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:失敗,1:成功',
  `message` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始請求',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nex4dsw_deal_records_bet_id_index` (`bet_id`),
  KEY `nex4dsw_deal_records_reference_no_index` (`reference_no`),
  KEY `nex4dsw_deal_records_action_index` (`action`),
  KEY `nex4dsw_deal_records_trace_id_index` (`trace_id`),
  KEY `nex4dsw_deal_records_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npt_accounts`
--

DROP TABLE IF EXISTS `npt_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npt_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `username_modified` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號(含前綴',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `npt_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `npt_accounts_username_index` (`username`),
  KEY `npt_accounts_username_modified_index` (`username_modified`),
  KEY `npt_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npt_bet_records`
--

DROP TABLE IF EXISTS `npt_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npt_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '開獎時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount - BetCoin',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `npt_bet_records_bet_id_unique` (`bet_id`),
  KEY `npt_bet_records_bet_time_index` (`bet_time`),
  KEY `npt_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ns_accounts`
--

DROP TABLE IF EXISTS `ns_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ns_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ns_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `ns_accounts_username_index` (`username`),
  KEY `ns_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ns_bet_records`
--

DROP TABLE IF EXISTS `ns_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ns_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '開獎時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ns_bet_records_bet_id_unique` (`bet_id`),
  KEY `ns_bet_records_username_index` (`username`),
  KEY `ns_bet_records_game_code_index` (`game_code`),
  KEY `ns_bet_records_bet_time_index` (`bet_time`),
  KEY `ns_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obet33_accounts`
--

DROP TABLE IF EXISTS `obet33_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `obet33_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `username_modified` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號(含前綴)',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'obet33餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `obet33_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `obet33_accounts_username_index` (`username`),
  KEY `obet33_accounts_username_modified_index` (`username_modified`),
  KEY `obet33_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obet33_bet_records`
--

DROP TABLE IF EXISTS `obet33_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `obet33_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `SDate` datetime NOT NULL COMMENT '算帳時間',
  `bet_time` datetime NOT NULL COMMENT '派彩時間(utc)',
  `created_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `bet_status` int NOT NULL,
  `ticket_result` int DEFAULT NULL,
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `valid_bet` decimal(18,4) DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `obet33_bet_records_bet_id_unique` (`bet_id`),
  KEY `obet33_bet_records_username_index` (`username`),
  KEY `obet33_bet_records_game_code_index` (`game_code`),
  KEY `obet33_bet_records_sdate_index` (`SDate`),
  KEY `obet33_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `onebxsw_accounts`
--

DROP TABLE IF EXISTS `onebxsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `onebxsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '商戶編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `onebxsw_accounts_username_unique` (`username`),
  KEY `onebxsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `onebxsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `onebxsw_bet_records`
--

DROP TABLE IF EXISTS `onebxsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `onebxsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'bettransacion_id from request',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0: 未有結果, -1: 取消, 9: 結算',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `onebxsw_bet_records_bet_id_unique` (`bet_id`),
  KEY `onebxsw_bet_records_game_code_index` (`game_code`),
  KEY `onebxsw_bet_records_status_index` (`status`),
  KEY `onebxsw_bet_records_bet_time_index` (`bet_time`),
  KEY `onebxsw_bet_records_payout_time_index` (`payout_time`),
  KEY `onebxsw_bet_records_username_foreign` (`username`),
  CONSTRAINT `onebxsw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `onebxsw_accounts` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_histories`
--

DROP TABLE IF EXISTS `order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單編號',
  `third_party_order_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方金流訂單編號',
  `agent_cash_flow_id` int NOT NULL DEFAULT '0' COMMENT '金流商戶資料編號',
  `cash_flow_info_id` int NOT NULL DEFAULT '0' COMMENT 'cash_flow_infos.id',
  `cash_flow_id` int DEFAULT NULL COMMENT '支付商ID; cash_flows.id',
  `third_party_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付商訂單號',
  `order_type_id` int NOT NULL COMMENT '訂單類別(FK_OrderType)',
  `currency_id` int NOT NULL COMMENT '貨幣類別(FK_Currency)',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'withdrawal_order_agents.id',
  `member_id` int NOT NULL COMMENT '帳號系統編號(User)',
  `amount` decimal(18,4) NOT NULL COMMENT '金額',
  `rate` decimal(12,6) NOT NULL DEFAULT '1.000000' COMMENT '當下匯率轉換',
  `point` decimal(18,4) NOT NULL COMMENT '點數',
  `balance` decimal(18,4) NOT NULL COMMENT '儲值後餘額',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip address',
  `callback` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回調網址',
  `status` smallint NOT NULL DEFAULT '0' COMMENT '狀態 0:建立,1:成功,2:失敗,3:己上分,4:待手動確認上分',
  `extra_content` text COLLATE utf8mb4_unicode_ci COMMENT '訂單額外內容',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `pay_time` datetime DEFAULT NULL COMMENT '支付時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_histories_order_no_unique` (`order_no`),
  KEY `order_histories_third_party_order_no_index` (`third_party_order_no`),
  KEY `order_histories_agent_cash_flow_id_index` (`agent_cash_flow_id`),
  KEY `order_histories_agent_id_index` (`agent_id`),
  KEY `order_histories_member_id_index` (`member_id`),
  KEY `order_histories_status_index` (`status`),
  KEY `order_histories_pay_time_index` (`pay_time`),
  KEY `order_histories_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_images`
--

DROP TABLE IF EXISTS `order_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL COMMENT '訂單id',
  `bank_id` int NOT NULL COMMENT '銀行帳戶id',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '圖片',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_images_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_type_names`
--

DROP TABLE IF EXISTS `order_type_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_type_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL COMMENT '語言系統編號',
  `type_id` int NOT NULL COMMENT '訂單類型系統編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單類型名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`language_id`,`type_id`),
  KEY `order_type_names_language_id_index` (`language_id`),
  KEY `order_type_names_type_id_index` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_types`
--

DROP TABLE IF EXISTS `order_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `cash_flow_id` int NOT NULL DEFAULT '0' COMMENT '金流商編號',
  `parent` int NOT NULL DEFAULT '0' COMMENT '上層支付方式系統編號(order_type)',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別名稱',
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付方式代碼',
  `type` int NOT NULL DEFAULT '0' COMMENT '付款方式;1:電子、2:網銀轉帳、3:QR掃碼、4:加密貨幣',
  `currency_id` int NOT NULL DEFAULT '0' COMMENT '幣別系統編號(currencies.id)',
  `info` text COLLATE utf8mb4_unicode_ci,
  `choose_bank` tinyint NOT NULL DEFAULT '0' COMMENT '是否由我們這邊選擇銀行',
  `need_first_name` tinyint NOT NULL DEFAULT '0' COMMENT '是否需要實名',
  `sorts` int NOT NULL DEFAULT '0' COMMENT '排序權重',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:啟用',
  `image_path` text COLLATE utf8mb4_unicode_ci COMMENT '圖片路徑',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `order_types_cash_flow_id_index` (`cash_flow_id`),
  KEY `order_types_parent_index` (`parent`),
  KEY `order_types_sorts_index` (`sorts`),
  KEY `order_types_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單編號',
  `third_party_order_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方金流訂單編號',
  `agent_cash_flow_id` int NOT NULL DEFAULT '0' COMMENT '金流商戶資料編號',
  `cash_flow_info_id` int NOT NULL DEFAULT '0' COMMENT 'cash_flow_infos.id',
  `cash_flow_id` int DEFAULT NULL COMMENT '支付商ID; cash_flows.id',
  `third_party_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付商訂單號',
  `order_type_id` int NOT NULL COMMENT '訂單類別(FK_OrderType)',
  `currency_id` int NOT NULL COMMENT '貨幣類別(FK_Currency)',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'withdrawal_order_agents.id',
  `member_id` int NOT NULL COMMENT '帳號系統編號(User)',
  `amount` decimal(18,4) NOT NULL COMMENT '金額',
  `rate` decimal(15,9) NOT NULL DEFAULT '1.000000000' COMMENT '當下匯率轉換(2025/05/05提升至9位)',
  `point` decimal(18,4) NOT NULL COMMENT '點數',
  `balance` decimal(18,4) NOT NULL COMMENT '儲值後餘額',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip address',
  `callback` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回調網址',
  `status` smallint NOT NULL DEFAULT '0' COMMENT '狀態 0:建立,1:待審核(成功上傳圖片),2:失敗,3:己上分,4:待手動確認上分',
  `extra_content` text COLLATE utf8mb4_unicode_ci COMMENT '訂單額外內容',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `pay_time` datetime DEFAULT NULL COMMENT '支付時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_no_unique` (`order_no`),
  KEY `orders_third_party_order_no_index` (`third_party_order_no`),
  KEY `orders_agent_cash_flow_id_index` (`agent_cash_flow_id`),
  KEY `orders_agent_id_index` (`agent_id`),
  KEY `orders_member_id_index` (`member_id`),
  KEY `orders_status_index` (`status`),
  KEY `orders_pay_time_index` (`pay_time`),
  KEY `orders_created_at_index` (`created_at`),
  KEY `idx_member_agent_status_id` (`member_id`,`agent_cash_flow_id`,`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organization_languages`
--

DROP TABLE IF EXISTS `organization_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization_languages` (
  `organization_id` tinyint NOT NULL COMMENT 'organization.id',
  `language_id` tinyint NOT NULL COMMENT 'languages.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '組織名稱',
  `currency_id` int NOT NULL DEFAULT '0' COMMENT '使用的貨幣',
  `memo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ota_orders`
--

DROP TABLE IF EXISTS `ota_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ota_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `token` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Token',
  `agent_cash_flow_id` int NOT NULL DEFAULT '0' COMMENT '金流商戶資料編號',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '交易金額',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:訂單建立中,1:訂單建立完成,2:成功,3:失敗',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ota_orders_reference_number_unique` (`reference_number`),
  KEY `ota_orders_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_names`
--

DROP TABLE IF EXISTS `param_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `param_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL COMMENT '語言系統編號',
  `param_id` int NOT NULL COMMENT 'params系統編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類型名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`language_id`,`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `params`
--

DROP TABLE IF EXISTS `params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `params` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類型',
  `parameter` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '參數',
  `value` int NOT NULL COMMENT '值',
  `info` text COLLATE utf8mb4_unicode_ci,
  `sort` int NOT NULL COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '狀態 0:停用,1:啟用',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pg_accounts`
--

DROP TABLE IF EXISTS `pg_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pg_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `pg_accounts_username_index` (`username`),
  KEY `pg_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pg_bet_records`
--

DROP TABLE IF EXISTS `pg_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pg_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `TransactionId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲紀錄詳情ID',
  `ProductGroup` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '產品組別',
  `ExternalUserId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '外部遊戲名稱',
  `GamesessionId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲sessionID',
  `GameId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲ID',
  `Currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣別',
  `ExternalTransactionId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '外部遊戲詳情ID',
  `Balance` decimal(18,4) NOT NULL COMMENT '錢包金額',
  `NumRounds` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '次數',
  `TotalLoss` decimal(18,4) NOT NULL COMMENT '投注金額',
  `TotalGain` decimal(18,4) NOT NULL COMMENT '贏得金額',
  `GamesessionStarted` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲開始時間',
  `GamesessionFinished` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲結束時間',
  `ExchangeRate` decimal(18,4) NOT NULL COMMENT '匯率',
  `ContextId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '開始遊戲時指定的上下文ID',
  `ClientIP` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客戶IP',
  `ExternalFreegameId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '外部免費遊戲ID',
  `JackpotLoss` decimal(18,4) NOT NULL COMMENT '貢獻彩金',
  `JackpotGain` decimal(18,4) NOT NULL COMMENT '獲得彩金',
  `FreegameRounds` decimal(18,4) DEFAULT NULL COMMENT '免費遊戲次數',
  `FreegameBet` decimal(18,4) DEFAULT NULL COMMENT '免費遊戲投注金額',
  `FreegameWin` decimal(18,4) DEFAULT NULL COMMENT '免費遊戲贏得金額',
  `Channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '頻道',
  `MessageId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訊息ID',
  `MessageTimestamp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '獲得訊息時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `pg_bet_records_transactionid_index` (`TransactionId`),
  KEY `pg_bet_records_externaluserid_index` (`ExternalUserId`),
  KEY `pg_bet_records_gameid_index` (`GameId`),
  KEY `pg_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pg_round_bet_records`
--

DROP TABLE IF EXISTS `pg_round_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pg_round_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `TransactionId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲紀錄詳情ID',
  `Status` tinyint NOT NULL COMMENT '交易狀態',
  `Amount` decimal(18,4) NOT NULL COMMENT '加到用戶的金額',
  `OldTime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易時間(UTC+0)',
  `Time` timestamp NULL DEFAULT NULL COMMENT '投注時間',
  `ProductGroup` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '產品組別',
  `ExternalUserId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '外部遊戲名稱',
  `GamesessionId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲sessionID',
  `GamesessionState` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲session狀態',
  `GameId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲ID',
  `RoundId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '回合ID',
  `RoundData` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '詳細回合數據',
  `RoundLoss` decimal(18,4) NOT NULL COMMENT '本回合總投注額',
  `JackpotLoss` decimal(18,4) NOT NULL COMMENT '貢獻彩金',
  `JackpotGain` decimal(18,4) NOT NULL COMMENT '獲得彩金',
  `Currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣種',
  `ExternalTransactionId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '外部遊戲ID',
  `Balance` decimal(18,4) NOT NULL COMMENT '錢包金額',
  `NumRounds` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '回合數',
  `TotalLoss` decimal(18,4) NOT NULL COMMENT '投注金額',
  `TotalGain` decimal(18,4) NOT NULL COMMENT '贏得金額',
  `ExternalFreegameId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '外部免費遊戲ID',
  `Channel` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '頻道',
  `MessageId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訊息ID',
  `MessageTimestamp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '獲得訊息時間',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `pg_round_bet_records_transactionid_index` (`TransactionId`),
  KEY `pg_round_bet_records_time_index` (`Time`),
  KEY `pg_round_bet_records_externaluserid_index` (`ExternalUserId`),
  KEY `pg_round_bet_records_gameid_index` (`GameId`),
  KEY `pg_round_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pgs_accounts`
--

DROP TABLE IF EXISTS `pgs_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgs_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `pgs_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `pgs_accounts_username_index` (`username`),
  KEY `pgs_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pgs_bet_records`
--

DROP TABLE IF EXISTS `pgs_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgs_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `gameID` int NOT NULL DEFAULT '0' COMMENT '遊戲代號',
  `beforeAmount` decimal(18,4) NOT NULL COMMENT '押注前分數',
  `betAmount` decimal(18,4) NOT NULL COMMENT '押注分數',
  `payoutAmount` decimal(18,4) NOT NULL COMMENT '派彩分數',
  `winLossAmount` decimal(18,4) NOT NULL COMMENT '輸贏分數',
  `validAmount` decimal(18,4) NOT NULL COMMENT '有效流水',
  `roundID` int NOT NULL COMMENT '進房代號',
  `betID` bigint NOT NULL COMMENT '注單代號',
  `betTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '押注時間 UTC',
  `roundStartTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '進房時間',
  `roundEndTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '退房時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pgs_bet_records_betid_unique` (`betID`),
  KEY `pgs_bet_records_username_index` (`username`),
  KEY `pgs_bet_records_gameid_index` (`gameID`),
  KEY `pgs_bet_records_bettime_index` (`betTime`),
  KEY `pgs_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pgs_event_records`
--

DROP TABLE IF EXISTS `pgs_event_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgs_event_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `event_id` int NOT NULL DEFAULT '0',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `pay_time` datetime NOT NULL COMMENT '派獎時間(utc)',
  `prize_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎勵金額',
  `info` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pgs_event_records_bet_id_unique` (`bet_id`),
  KEY `pgs_event_records_event_id_index` (`event_id`),
  KEY `pgs_event_records_username_index` (`username`),
  KEY `pgs_event_records_pay_time_index` (`pay_time`),
  KEY `pgs_event_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pgslot_accounts`
--

DROP TABLE IF EXISTS `pgslot_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgslot_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `player_session` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'session_token',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pgslot_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `pgslot_accounts_username_index` (`username`),
  KEY `pgslot_accounts_player_session_index` (`player_session`),
  KEY `pgslot_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pgslot_bet_records`
--

DROP TABLE IF EXISTS `pgslot_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgslot_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `last_row_version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pgslot_bet_records_bet_id_unique` (`bet_id`),
  KEY `pgslot_bet_records_vendor_info_id_index` (`vendor_info_id`),
  KEY `pgslot_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pgssw_accounts`
--

DROP TABLE IF EXISTS `pgssw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgssw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `session_token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登入token',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pgssw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `pgssw_accounts_username_index` (`username`),
  KEY `pgssw_accounts_member_id_index` (`member_id`),
  KEY `pgssw_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pgssw_bet_records`
--

DROP TABLE IF EXISTS `pgssw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgssw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `session_token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單號的session_token',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `payout_time` datetime NOT NULL COMMENT '派彩時間(utc)',
  `settlement_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '結算時間',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼金額',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未結算,1:已結算',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pgssw_bet_records_bet_id_unique` (`bet_id`),
  KEY `pgssw_bet_records_vendor_info_id_index` (`vendor_info_id`),
  KEY `pgssw_bet_records_username_index` (`username`),
  KEY `pgssw_bet_records_game_code_index` (`game_code`),
  KEY `pgssw_bet_records_bet_time_index` (`bet_time`),
  KEY `pgssw_bet_records_settlement_time_index` (`settlement_time`),
  KEY `pgssw_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pgssw_cancel_logs`
--

DROP TABLE IF EXISTS `pgssw_cancel_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgssw_cancel_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pgssw_accounts.username',
  `transaction_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'transactionNo',
  `game_id` int NOT NULL DEFAULT '0' COMMENT '投注游戏',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '處理狀態 0:待處理,1:成功,2:失敗',
  `response_data` text COLLATE utf8mb4_unicode_ci COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pgssw_cancel_logs_transaction_no_unique` (`transaction_no`),
  KEY `pgssw_cancel_logs_username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pgssw_event_records`
--

DROP TABLE IF EXISTS `pgssw_event_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgssw_event_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `game_code` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'reward' COMMENT '用來顯示報表遊戲類別',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `pay_time` datetime NOT NULL COMMENT '派獎時間(utc)',
  `prize_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎勵金額',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pgssw_event_records_bet_id_unique` (`bet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pgssw_transaction_logs`
--

DROP TABLE IF EXISTS `pgssw_transaction_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgssw_transaction_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pgssw_accounts.username',
  `transaction_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'transactionNo',
  `session_token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'session_token',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 1:depoist,2:withdraw',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '轉帳金额',
  `transaction_log_id` int NOT NULL DEFAULT '0' COMMENT 'transaction_log.id',
  `before_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '啟始金额',
  `after_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '結束金额',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:待確認,1:成功',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT 'request data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pgssw_transaction_logs_transaction_no_unique` (`transaction_no`),
  KEY `pgssw_transaction_logs_username_index` (`username`),
  KEY `pgssw_transaction_logs_transaction_log_id_index` (`transaction_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_announcement_exclude_agents`
--

DROP TABLE IF EXISTS `platform_announcement_exclude_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_announcement_exclude_agents` (
  `platform_announcement_id` int unsigned NOT NULL,
  `agent_id` int unsigned NOT NULL,
  PRIMARY KEY (`platform_announcement_id`,`agent_id`),
  KEY `platform_announcement_exclude_agents_agent_id_foreign` (`agent_id`),
  CONSTRAINT `pa_exclude_announcement_id_foreign` FOREIGN KEY (`platform_announcement_id`) REFERENCES `platform_announcements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `platform_announcement_exclude_agents_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_announcement_images`
--

DROP TABLE IF EXISTS `platform_announcement_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_announcement_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '圖片路徑',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作人員',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_announcement_include_agents`
--

DROP TABLE IF EXISTS `platform_announcement_include_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_announcement_include_agents` (
  `platform_announcement_id` int unsigned NOT NULL,
  `agent_id` int unsigned NOT NULL,
  PRIMARY KEY (`platform_announcement_id`,`agent_id`),
  KEY `platform_announcement_include_agents_agent_id_foreign` (`agent_id`),
  CONSTRAINT `pa_include_announcement_id_foreign` FOREIGN KEY (`platform_announcement_id`) REFERENCES `platform_announcements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `platform_announcement_include_agents_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_announcement_languages`
--

DROP TABLE IF EXISTS `platform_announcement_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_announcement_languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `platform_announcement_id` int NOT NULL DEFAULT '0' COMMENT '平台ID',
  `language_id` int NOT NULL DEFAULT '0' COMMENT '語言ID, 0:全語系, 1~N:參考languages.id',
  `title` text COLLATE utf8mb4_unicode_ci COMMENT '標題',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '內容',
  `platform_announcement_image_id` int NOT NULL DEFAULT '0' COMMENT '圖片ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作人員',
  PRIMARY KEY (`id`),
  KEY `platform_announcement_languages_platform_announcement_id_index` (`platform_announcement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_announcement_reads`
--

DROP TABLE IF EXISTS `platform_announcement_reads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_announcement_reads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `last_read_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '會員最後已讀時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `platform_announcement_reads_member_id_unique` (`member_id`),
  KEY `platform_announcement_reads_last_read_time_index` (`last_read_time`),
  KEY `platform_announcement_reads_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='記錄會員最後的已讀時間 (平台公告)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_announcements`
--

DROP TABLE IF EXISTS `platform_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_announcements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理ID(agents.id)',
  `exclude_agent_id` int NOT NULL DEFAULT '0' COMMENT '排除代理ID',
  `start_time` datetime NOT NULL COMMENT '開始時間',
  `end_time` datetime NOT NULL COMMENT '結束時間',
  `tag` tinyint NOT NULL DEFAULT '1' COMMENT '系統標題類別 1:熱門,2:活動,3:更新,4:遊戲,5:維護',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '連結類型; 0:無連結, 1:公告彈窗, 2:站外連結 3:站內連結',
  `title` longtext COLLATE utf8mb4_unicode_ci COMMENT '公告標題',
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '連結類型內容',
  `platform_announcement_image_id` int NOT NULL DEFAULT '0' COMMENT '圖片ID(platform_announcement_image.id)',
  `open_window` tinyint(1) NOT NULL DEFAULT '0' COMMENT '另開視窗; 0:不另開(h5:該頁面, app:webview), 1:另開(h5:分頁, app:browser)',
  `sort` tinyint NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態; 0:停用, 1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作人員',
  PRIMARY KEY (`id`),
  KEY `platform_announcements_agent_id_index` (`agent_id`),
  KEY `platform_announcements_exclude_agent_id_index` (`exclude_agent_id`),
  KEY `platform_announcements_start_time_index` (`start_time`),
  KEY `platform_announcements_end_time_index` (`end_time`),
  KEY `platform_announcements_status_index` (`status`),
  KEY `platform_announcements_created_at_index` (`created_at`),
  KEY `platform_announcements_updated_at_index` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `play8oy_accounts`
--

DROP TABLE IF EXISTS `play8oy_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `play8oy_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `username_modified` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號(含前綴',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `play8oy_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `play8oy_accounts_username_index` (`username`),
  KEY `play8oy_accounts_username_modified_index` (`username_modified`),
  KEY `play8oy_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `play8oy_bet_records`
--

DROP TABLE IF EXISTS `play8oy_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `play8oy_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` bigint NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注; AvailTotalBet',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金额; WinAmount',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount - BetCoin',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `play8oy_bet_records_bet_id_unique` (`bet_id`),
  KEY `play8oy_bet_records_username_index` (`username`),
  KEY `play8oy_bet_records_game_code_index` (`game_code`),
  KEY `play8oy_bet_records_bet_time_index` (`bet_time`),
  KEY `play8oy_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `play8oy_transactions`
--

DROP TABLE IF EXISTS `play8oy_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `play8oy_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部交易Id(OperationMethod＝3此欄位為空值)',
  `type` int NOT NULL COMMENT '類型; OperationMethod; 1:開分,2:洗分,3:紅包(福袋、新年禮物)',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `trans_amount` decimal(18,4) NOT NULL COMMENT '交易金額',
  `transaction_time` datetime NOT NULL COMMENT '交易時間(utc)',
  `status` int NOT NULL COMMENT '狀態; Result 0:未處理,1:成功,2:失敗',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '最後修改人員',
  PRIMARY KEY (`id`),
  KEY `play8oy_transactions_type_index` (`type`),
  KEY `play8oy_transactions_transaction_time_index` (`transaction_time`),
  KEY `play8oy_transactions_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plus100_accounts`
--

DROP TABLE IF EXISTS `plus100_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plus100_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `plus100_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `plus100_accounts_username_index` (`username`),
  KEY `plus100_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plus100_bet_records`
--

DROP TABLE IF EXISTS `plus100_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plus100_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '開獎時間(utc)',
  `wp_time` datetime DEFAULT NULL COMMENT '派彩時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plus100_bet_records_bet_id_unique` (`bet_id`),
  KEY `plus100_bet_records_username_index` (`username`),
  KEY `plus100_bet_records_game_code_index` (`game_code`),
  KEY `plus100_bet_records_wp_time_index` (`wp_time`),
  KEY `plus100_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_accounts`
--

DROP TABLE IF EXISTS `pp_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pp_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `player_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '遊戲商內部ID',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pp_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `pp_accounts_username_index` (`username`),
  KEY `pp_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_bet_record_logs`
--

DROP TABLE IF EXISTS `pp_bet_record_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pp_bet_record_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '撈取注單類型',
  `start_time` datetime NOT NULL COMMENT '開始時間',
  `end_time` datetime NOT NULL COMMENT '結束時間',
  `count` int NOT NULL DEFAULT '0' COMMENT '筆數',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `pp_bet_record_logs_type_index` (`type`),
  KEY `pp_bet_record_logs_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_bet_records`
--

DROP TABLE IF EXISTS `pp_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pp_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` bigint NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `data_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類型; RNG(老虎機), LC(真人), CANCAL(取消單)',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `end_time` datetime NOT NULL COMMENT '結算時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `bet_status` tinyint NOT NULL DEFAULT '1' COMMENT '注單狀態 0:取消 1:已派彩',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`bet_id`,`data_type`),
  KEY `pp_bet_records_data_type_index` (`data_type`),
  KEY `pp_bet_records_username_index` (`username`),
  KEY `pp_bet_records_game_code_index` (`game_code`),
  KEY `pp_bet_records_bet_time_index` (`bet_time`),
  KEY `pp_bet_records_end_time_index` (`end_time`),
  KEY `pp_bet_records_bet_status_index` (`bet_status`),
  KEY `pp_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_event_records`
--

DROP TABLE IF EXISTS `pp_event_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pp_event_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `type` tinyint NOT NULL COMMENT '類別: 1: 錦標賽 2: 活動',
  `pay_time` datetime NOT NULL COMMENT '派獎時間(utc)',
  `prize_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎勵金額',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pp_event_records_bet_id_unique` (`bet_id`),
  KEY `pp_event_records_username_index` (`username`),
  KEY `pp_event_records_pay_time_index` (`pay_time`),
  KEY `pp_event_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ppsw_accounts`
--

DROP TABLE IF EXISTS `ppsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ppsw_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員編號',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `player_id` int DEFAULT NULL COMMENT '遊戲方玩家編號',
  `token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣別',
  `country` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣別',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ppsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `ppsw_accounts_member_id_index` (`member_id`),
  KEY `ppsw_accounts_username_index` (`username`),
  KEY `ppsw_accounts_player_id_index` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ppsw_bet_records`
--

DROP TABLE IF EXISTS `ppsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ppsw_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員編號',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號 playerId',
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單號 roundId',
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易號',
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注額',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `bonus` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '額外獎金/錦標賽獎金',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩池獎金',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注禮碼金額',
  `bet_time` timestamp NOT NULL COMMENT '投注時間',
  `payout_time` timestamp NULL DEFAULT NULL COMMENT '結算時間',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:建立注單,1:進行中,2:退款,3:已結算',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ppsw_bet_records_reference_no_unique` (`reference_no`),
  KEY `ppsw_bet_records_vendor_info_id_index` (`vendor_info_id`),
  KEY `ppsw_bet_records_member_id_index` (`member_id`),
  KEY `ppsw_bet_records_username_index` (`username`),
  KEY `ppsw_bet_records_bet_id_index` (`bet_id`),
  KEY `ppsw_bet_records_game_code_index` (`game_code`),
  KEY `ppsw_bet_records_bet_time_index` (`bet_time`),
  KEY `ppsw_bet_records_payout_time_index` (`payout_time`),
  KEY `ppsw_bet_records_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ppsw_deal_records`
--

DROP TABLE IF EXISTS `ppsw_deal_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ppsw_deal_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `trace_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '追蹤碼',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號 playerId',
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單號 roundId',
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方交易碼',
  `action` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '請求動作',
  `request` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始請求',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:失敗,1:成功',
  `transaction_log_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ppsw_deal_records_idempotency_unique` (`username`,`reference_no`,`action`),
  UNIQUE KEY `ppsw_deal_records_trace_id_unique` (`trace_id`),
  KEY `ppsw_deal_records_username_index` (`username`),
  KEY `ppsw_deal_records_bet_id_index` (`bet_id`),
  KEY `ppsw_deal_records_reference_no_index` (`reference_no`),
  KEY `ppsw_deal_records_action_index` (`action`),
  KEY `ppsw_deal_records_status_index` (`status`),
  KEY `ppsw_deal_records_transaction_log_id_index` (`transaction_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prize_assigns`
--

DROP TABLE IF EXISTS `prize_assigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prize_assigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `event_id` int NOT NULL COMMENT '活動系統編號',
  `agent_id` int NOT NULL COMMENT '營運商系統編號',
  `percentage` decimal(10,2) NOT NULL COMMENT '開獎比例',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態0:停用1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prize_content_flow_limits`
--

DROP TABLE IF EXISTS `prize_content_flow_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prize_content_flow_limits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `prize_content_id` int NOT NULL COMMENT 'prize_contents.id',
  `vendor_id` int NOT NULL COMMENT 'vendors.id',
  `game_type_id` int NOT NULL COMMENT 'game_types.id',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `prize_content_flow_limits_prize_content_id_index` (`prize_content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prize_content_names`
--

DROP TABLE IF EXISTS `prize_content_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prize_content_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL DEFAULT '0' COMMENT '語言系統編號',
  `prize_content_id` int NOT NULL COMMENT '獎項編號',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '獎項名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prize_contents`
--

DROP TABLE IF EXISTS `prize_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prize_contents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `prize_id` int NOT NULL COMMENT '獎勵系統編號',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '點數類型; 0:固定金額, 1:%數',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '獎項名稱',
  `number` int NOT NULL COMMENT '獎項數量',
  `level` tinyint NOT NULL DEFAULT '0',
  `distribute` int NOT NULL DEFAULT '0' COMMENT '派發數量',
  `sent` int DEFAULT '0' COMMENT '已送出',
  `achieve_point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '多獎勵達標金額',
  `percentage` int NOT NULL COMMENT '中獎機率',
  `point_type` int NOT NULL DEFAULT '1' COMMENT '1:平台分數 2:禮碼',
  `point` int NOT NULL DEFAULT '0' COMMENT '平台點數',
  `random_point_max` int DEFAULT NULL COMMENT '隨機獎金上限',
  `point_percentage` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT '%數',
  `flow_limit_multiple` bigint NOT NULL DEFAULT '0' COMMENT '稽核流水倍數',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態0:停用1:使用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `prize_contents_prize_id_index` (`prize_id`),
  KEY `prize_contents_type_index` (`type`),
  KEY `prize_contents_point_type_index` (`point_type`),
  KEY `prize_contents_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prize_member_orders`
--

DROP TABLE IF EXISTS `prize_member_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prize_member_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `prize_member_id` int NOT NULL DEFAULT '0' COMMENT 'prize_members.id',
  `order_id` int NOT NULL DEFAULT '0' COMMENT 'orders.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `prize_member_orders_prize_member_id_index` (`prize_member_id`),
  KEY `prize_member_orders_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prize_members`
--

DROP TABLE IF EXISTS `prize_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prize_members` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `member_id` int NOT NULL COMMENT '玩家系統編號',
  `prize_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '獎勵遊戲系統編號',
  `content_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '獲得獎項系統編號',
  `event_detail_id` int DEFAULT '0' COMMENT 'event_details.id',
  `expired_time` datetime DEFAULT NULL COMMENT '領獎期限',
  `lottery_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '摸彩卷號碼',
  `lottery_point` decimal(18,4) DEFAULT NULL COMMENT '獎勵金額',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '領獎時的ip位置',
  `status` int NOT NULL COMMENT '狀態;\n投注活動; 0:未使用,1:已使用,3:取消\nV-jackpot; 0:未開始,1:中獎,2:未中獎,3:取消\nW-jackpot; 0:未開始,1:中獎,2:未中獎,3:取消,9:派發中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `prize_members_member_id_index` (`member_id`),
  KEY `prize_members_prize_id_index` (`prize_id`),
  KEY `prize_members_event_detail_id_index` (`event_detail_id`),
  KEY `prize_members_status_index` (`status`),
  KEY `prize_members_created_at_index` (`created_at`),
  KEY `prize_members_updated_at_index` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prize_type_names`
--

DROP TABLE IF EXISTS `prize_type_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prize_type_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `language_id` int NOT NULL COMMENT '語言系統編號',
  `type_id` int NOT NULL COMMENT '獎勵類型系統編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '獎勵類型名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prize_types`
--

DROP TABLE IF EXISTS `prize_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prize_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類型名稱',
  `status` tinyint(1) NOT NULL COMMENT '狀態0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prizes`
--

DROP TABLE IF EXISTS `prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prizes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `event_id` int NOT NULL COMMENT '活動編號',
  `type_id` int NOT NULL COMMENT '獎勵遊戲類型編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '獎勵活動名稱',
  `background` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '背景圖',
  `number` int NOT NULL COMMENT '獎勵遊戲獲得次數',
  `is_repeatedly` tinyint(1) DEFAULT '0' COMMENT '可否重覆獲獎0:不可,1:可以',
  `flow_limit_multiple` int NOT NULL DEFAULT '0' COMMENT '稽核流水倍數',
  `max_point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最大中獎金額',
  `withdrawal_cancel_reward` tinyint NOT NULL DEFAULT '0' COMMENT '發紅包與洗分取消領獎限制',
  `cancel_other_reward` tinyint NOT NULL DEFAULT '0' COMMENT '領獎後取消其他同訂單活動獎勵',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT '其他相關設定',
  `expire_date` datetime NOT NULL COMMENT '獎勵遊戲次數到期日',
  `draw_date` datetime DEFAULT NULL COMMENT '摸彩卷的開獎日期',
  `status` tinyint(1) NOT NULL COMMENT '狀態0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `prizes_event_id_index` (`event_id`),
  KEY `prizes_expire_date_index` (`expire_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedure_hashes`
--

DROP TABLE IF EXISTS `procedure_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedure_hashes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `procedure_hashes_file_name_unique` (`file_name`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_wallet_logs`
--

DROP TABLE IF EXISTS `promotion_wallet_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion_wallet_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '單號',
  `agent_id` int NOT NULL COMMENT 'agents.id',
  `member_id` int NOT NULL COMMENT 'members.id',
  `event_id` int NOT NULL COMMENT 'events.id',
  `promotion_wallet_id` int NOT NULL DEFAULT '0' COMMENT 'promotion_wallets.id',
  `vendor_id` int NOT NULL COMMENT 'vendors.id',
  `order_id` int NOT NULL COMMENT '訂單系統編號',
  `type` int NOT NULL COMMENT '類型1:平台轉入遊戲商,2:遊戲商轉入平台',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '平台金額',
  `vendor_point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '遊戲商金額',
  `rate` decimal(10,4) NOT NULL DEFAULT '1.0000' COMMENT '平台點數與遊戲點數的比例',
  `before_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '變更前金額',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '平台餘額',
  `vendor_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '遊戲商餘額',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態編號',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `result` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '結果',
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  KEY `promotion_wallet_logs_member_id_index` (`member_id`),
  KEY `promotion_wallet_logs_event_id_index` (`event_id`),
  KEY `promotion_wallet_logs_promotion_wallet_id_index` (`promotion_wallet_id`),
  KEY `promotion_wallet_logs_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_wallets`
--

DROP TABLE IF EXISTS `promotion_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion_wallets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL COMMENT 'events.id',
  `parent` int NOT NULL COMMENT 'agents.id',
  `member_id` int NOT NULL COMMENT 'members.id',
  `balance` decimal(18,4) NOT NULL COMMENT '分數',
  `unlock_type` int NOT NULL DEFAULT '0' COMMENT '0:未解綁,1:達成條件,2:未達條件',
  `status` tinyint NOT NULL COMMENT '狀態 0:解鎖,1:鎖定',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  KEY `promotion_wallets_event_id_index` (`event_id`),
  KEY `promotion_wallets_member_id_index` (`member_id`),
  KEY `promotion_wallets_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pt_accounts`
--

DROP TABLE IF EXISTS `pt_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pt_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `pt_accounts_username_index` (`username`),
  KEY `pt_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pt_bet_records`
--

DROP TABLE IF EXISTS `pt_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pt_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `player_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `window_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '窗口號',
  `game_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '窗口號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲局號',
  `game_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲類型',
  `game_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲名稱',
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '期號',
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣別',
  `bet` decimal(13,7) DEFAULT NULL COMMENT '投注額',
  `win` decimal(13,7) DEFAULT NULL COMMENT '贏得金額',
  `progress_ive_bet` decimal(13,7) DEFAULT NULL COMMENT '獎池投注額',
  `progress_ive_win` decimal(13,7) DEFAULT NULL COMMENT '獎池贏得金額',
  `balance` decimal(13,7) DEFAULT NULL COMMENT '餘額',
  `current_bet` decimal(13,7) DEFAULT NULL COMMENT '當局投注',
  `game_date` datetime NOT NULL COMMENT '投注時間(時區+8)',
  `utc_game_date` datetime NOT NULL COMMENT '投注時間(UTC+0)',
  `info` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '詳細信息',
  `live_network` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '現場分類',
  `rnum` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類型',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `game_name_modified` varchar(30) COLLATE utf8mb4_unicode_ci GENERATED ALWAYS AS (replace(substring_index(`game_name`,_utf8mb4'(',-(1)),_utf8mb4')',_utf8mb4'')) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `pt_bet_records_player_name_index` (`player_name`),
  KEY `pt_bet_records_game_code_index` (`game_code`),
  KEY `pt_bet_records_utc_game_date_index` (`utc_game_date`),
  KEY `pt_bet_records_updated_at_index` (`updated_at`),
  KEY `pt_bet_records_game_name_modified_index` (`game_name_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ptsw_accounts`
--

DROP TABLE IF EXISTS `ptsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ptsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商環境',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '我方會員ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方玩家帳號',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '外部令牌，用於標識玩家的遊戲週期。必須包含kiosk 前綴。',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ptsw_accounts_username_unique` (`username`),
  KEY `ptsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `ptsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ptsw_bet_records`
--

DROP TABLE IF EXISTS `ptsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ptsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '我方會員ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方玩家帳號',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '外部令牌，用於標識玩家的遊戲週期。必須包含kiosk 前綴。',
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注單號碼',
  `transaction_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '三方交易代號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲代碼',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎池彩金',
  `bet_time` timestamp NULL DEFAULT NULL COMMENT '下注時間',
  `payout_time` timestamp NULL DEFAULT NULL COMMENT '派彩時間',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '處理狀態: -2=回滾, -1=餘額不足, 0=待處理, 1=遊戲中, 2=遊戲回合結束',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ptsw_bet_records_bet_id_unique` (`bet_id`),
  UNIQUE KEY `ptsw_bet_records_transaction_code_unique` (`transaction_code`),
  KEY `ptsw_bet_records_member_id_index` (`member_id`),
  KEY `ptsw_bet_records_username_index` (`username`),
  CONSTRAINT `ptsw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `ptsw_accounts` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ptsw_deal_records`
--

DROP TABLE IF EXISTS `ptsw_deal_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ptsw_deal_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `request_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '三方請求 ID',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '三方玩家帳號',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'token',
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注單號碼',
  `transaction_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '三方交易代號',
  `type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '三方交易行為',
  `bet_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `win_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金額',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩池中獎金額',
  `external_transaction_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '我司交易代號',
  `external_transaction_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '我司交易時間',
  `applied_at` timestamp NULL DEFAULT NULL,
  `raw` text COLLATE utf8mb4_unicode_ci COMMENT '三方原始數據',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ptsw_deal_records_request_id_unique` (`request_id`),
  UNIQUE KEY `ptsw_deal_records_transaction_code_unique` (`transaction_code`),
  KEY `ptsw_deal_records_username_index` (`username`),
  KEY `ptsw_deal_records_bet_id_index` (`bet_id`),
  KEY `ptsw_deal_records_type_index` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pussy888_accounts`
--

DROP TABLE IF EXISTS `pussy888_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pussy888_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `player_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pussy888玩家帳號',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `pussy888_accounts_username_index` (`username`),
  KEY `pussy888_accounts_player_id_index` (`player_id`),
  KEY `pussy888_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pussy888_bet_records`
--

DROP TABLE IF EXISTS `pussy888_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pussy888_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `class_id` int NOT NULL COMMENT 'ClassID',
  `account` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pussy888玩家帳號',
  `bet_time` datetime NOT NULL COMMENT '注單生成時間',
  `bet_time_utc` datetime NOT NULL COMMENT '注單生成時間(UTC)',
  `begin_balance` decimal(18,4) NOT NULL COMMENT '遊戲開始金額',
  `end_balance` decimal(18,4) NOT NULL COMMENT '遊戲結束金額',
  `game_id` int NOT NULL COMMENT '遊戲ID',
  `game_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲名稱',
  `line_num` int NOT NULL,
  `log_data_str` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲紀錄',
  `log_data_type` int NOT NULL,
  `round_no` int NOT NULL,
  `row_num` int NOT NULL,
  `table_id` int NOT NULL COMMENT '桌號',
  `win` decimal(18,4) NOT NULL COMMENT '派彩金額',
  `bet` decimal(18,4) NOT NULL COMMENT '下注金額',
  `cday` int NOT NULL,
  `cno` int NOT NULL,
  `uuid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uuid',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT '詳細信息',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pussy888_bet_records_uuid_unique` (`uuid`),
  KEY `pussy888_bet_records_account_index` (`account`),
  KEY `pussy888_bet_records_bet_time_index` (`bet_time`),
  KEY `pussy888_bet_records_bet_time_utc_index` (`bet_time_utc`),
  KEY `pussy888_bet_records_game_id_index` (`game_id`),
  KEY `pussy888_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pussy888_daily_wins`
--

DROP TABLE IF EXISTS `pussy888_daily_wins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pussy888_daily_wins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `date` date NOT NULL COMMENT '時間',
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pussy888玩家帳號',
  `win` decimal(18,4) NOT NULL COMMENT '派彩金額',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `pussy888_daily_wins_date_index` (`date`),
  KEY `pussy888_daily_wins_player_id_index` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qtech_accounts`
--

DROP TABLE IF EXISTS `qtech_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `qtech_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `qtech_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `qtech_accounts_username_index` (`username`),
  KEY `qtech_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qtech_bet_records`
--

DROP TABLE IF EXISTS `qtech_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `qtech_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `pay_time` datetime NOT NULL COMMENT '結算時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `qtech_bet_records_bet_id_unique` (`bet_id`),
  KEY `qtech_bet_records_username_index` (`username`),
  KEY `qtech_bet_records_pay_time_index` (`pay_time`),
  KEY `qtech_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ranking_tbr_records`
--

DROP TABLE IF EXISTS `ranking_tbr_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranking_tbr_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'total_bet_records流水號',
  `summary_time` datetime NOT NULL COMMENT '時間',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `vendor_id` int NOT NULL COMMENT '遊戲商系統編號',
  `game_id` int NOT NULL COMMENT '遊戲系統編號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `payout_time` datetime NOT NULL COMMENT '派彩、結算時間(UTC)',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `ranking_tbr_records_summary_time_index` (`summary_time`),
  KEY `ranking_tbr_records_member_id_index` (`member_id`),
  KEY `ranking_tbr_records_vendor_id_index` (`vendor_id`),
  KEY `ranking_tbr_records_game_id_index` (`game_id`),
  KEY `ranking_tbr_records_win_lose_index` (`win_lose`),
  KEY `ranking_tbr_records_bet_time_index` (`bet_time`),
  KEY `ranking_tbr_records_payout_time_index` (`payout_time`),
  KEY `ranking_tbr_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='存放total_bet_records輸贏有達標的投注記錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rcb988_accounts`
--

DROP TABLE IF EXISTS `rcb988_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rcb988_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `vendor_uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲商的玩家 UID-依據遊戲商需求',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家密碼-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家登入用 Token-依據遊戲商需求',
  `admin` int NOT NULL DEFAULT '0' COMMENT '數據操作人員的管理者系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rcb988_accounts_username_unique` (`username`),
  KEY `rcb988_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `rcb988_accounts_member_id_index` (`member_id`),
  KEY `rcb988_accounts_vendor_username_index` (`vendor_username`),
  KEY `rcb988_accounts_vendor_uid_index` (`vendor_uid`),
  KEY `rcb988_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rcb988_bet_records`
--

DROP TABLE IF EXISTS `rcb988_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rcb988_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注單唯一Id, ThemeId',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩、結算時間(UTC)',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未結算,1:已結算',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲 ID-依據遊戲商需求',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼金額-依據遊戲商需求',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '訪問投注單的 Session Token 或 ID 簽章-依據遊戲商需求',
  `info` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rcb988_bet_records_bet_id_unique` (`bet_id`),
  KEY `rcb988_bet_records_vendor_info_id_index` (`vendor_info_id`),
  KEY `rcb988_bet_records_vendor_username_index` (`vendor_username`),
  KEY `rcb988_bet_records_bet_time_index` (`bet_time`),
  KEY `rcb988_bet_records_payout_time_index` (`payout_time`),
  KEY `rcb988_bet_records_session_token_index` (`session_token`),
  KEY `rcb988_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `realname_validation_requests`
--

DROP TABLE IF EXISTS `realname_validation_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `realname_validation_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validator_id` int DEFAULT NULL COMMENT '審核人員ID',
  `realname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真實姓名',
  `bank_id` int DEFAULT NULL COMMENT '銀行id',
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '銀行名稱',
  `bank_account` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '銀行帳號',
  `status` tinyint NOT NULL COMMENT '狀態, 0: 待審核, 1: 通過, 2: 拒絕',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `realname_validation_requests_username_index` (`username`),
  KEY `realname_validation_requests_created_at_index` (`created_at`),
  KEY `realname_validation_requests_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refresh_ranking_transaction_logs`
--

DROP TABLE IF EXISTS `refresh_ranking_transaction_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_ranking_transaction_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `member_id` int NOT NULL COMMENT 'members.id',
  `type` int NOT NULL COMMENT '類別',
  `before_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '更改前金額',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '變更金額',
  `after_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '更改後金額',
  `status` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `refresh_ranking_transaction_logs_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward_item_histories`
--

DROP TABLE IF EXISTS `reward_item_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reward_item_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reward_item_id` int NOT NULL DEFAULT '0' COMMENT 'reward_items.id',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'agents.id',
  `total_pool_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總彩池數量',
  `total_ticket` int DEFAULT NULL COMMENT '發出獎券數',
  `total_bonus` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '發出獎金',
  `prizes` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reward_item_histories_reward_item_id_index` (`reward_item_id`),
  KEY `reward_item_histories_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='奖励项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward_item_names`
--

DROP TABLE IF EXISTS `reward_item_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reward_item_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `type_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prize_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '獎項名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='奖励项目-多语言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward_items`
--

DROP TABLE IF EXISTS `reward_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reward_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `prize_content_id` int NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '獎項類型; 1: 獎金, 2:獎品',
  `bonus` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `prize_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '獎品名稱',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '狀態; 1:啟用, 0:停用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='奖励项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_accounts`
--

DROP TABLE IF EXISTS `rm_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rm_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `rm_accounts_username_index` (`username`),
  KEY `rm_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_bet_records`
--

DROP TABLE IF EXISTS `rm_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int DEFAULT NULL,
  `bet_id` bigint NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount - BetCoin',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`vendor_info_id`,`bet_id`),
  KEY `rm_bet_records_username_index` (`username`),
  KEY `rm_bet_records_game_code_index` (`game_code`),
  KEY `rm_bet_records_bet_time_index` (`bet_time`),
  KEY `rm_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名稱',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:使用中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rolling_chip_logs`
--

DROP TABLE IF EXISTS `rolling_chip_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolling_chip_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL DEFAULT '0',
  `member_id` int NOT NULL DEFAULT '0',
  `vendor_id` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `before_balance` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `status` int NOT NULL DEFAULT '0',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rolling_chip_logs_member_id_index` (`member_id`),
  KEY `rolling_chip_logs_type_index` (`type`),
  KEY `rolling_chip_logs_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sa_accounts`
--

DROP TABLE IF EXISTS `sa_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sa_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sa_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `sa_accounts_username_index` (`username`),
  KEY `sa_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sa_bet_records`
--

DROP TABLE IF EXISTS `sa_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sa_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sa_bet_records_bet_id_unique` (`bet_id`),
  KEY `sa_bet_records_username_index` (`username`),
  KEY `sa_bet_records_game_code_index` (`game_code`),
  KEY `sa_bet_records_bet_time_index` (`bet_time`),
  KEY `sa_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saba_accounts`
--

DROP TABLE IF EXISTS `saba_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `saba_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `username_modified` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號(含前綴)',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'saba餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `saba_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `saba_accounts_username_index` (`username`),
  KEY `saba_accounts_username_modified_index` (`username_modified`),
  KEY `saba_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saba_bet_records`
--

DROP TABLE IF EXISTS `saba_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `saba_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊ID',
  `bet_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `winlost_datetime` datetime NOT NULL COMMENT '算帳時間',
  `bet_time` datetime NOT NULL COMMENT '派彩時間(utc)',
  `created_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `ticket_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_key` int DEFAULT NULL,
  `last_version_key` int DEFAULT NULL,
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`vendor_id`,`bet_id`),
  KEY `saba_bet_records_vendor_id_index` (`vendor_id`),
  KEY `saba_bet_records_bet_id_index` (`bet_id`),
  KEY `saba_bet_records_username_index` (`username`),
  KEY `saba_bet_records_game_code_index` (`game_code`),
  KEY `saba_bet_records_winlost_datetime_index` (`winlost_datetime`),
  KEY `saba_bet_records_ticket_status_index` (`ticket_status`),
  KEY `saba_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saba_version_keys`
--

DROP TABLE IF EXISTS `saba_version_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `saba_version_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_version_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbo_accounts`
--

DROP TABLE IF EXISTS `sbo_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sbo_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號帳號',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `sbo_accounts_username_index` (`username`),
  KEY `sbo_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbo_bet_records`
--

DROP TABLE IF EXISTS `sbo_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sbo_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `player_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家名稱',
  `vendor_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '產品代碼',
  `game_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲代碼',
  `parent_bet_id` int NOT NULL COMMENT '父注编號',
  `bet_id` int NOT NULL COMMENT '下注編號',
  `trans_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Stake(下注或取消本注)',
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣別',
  `wallet_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '錢包代碼',
  `bet_amount` decimal(18,4) NOT NULL COMMENT '下注金額',
  `win_amount` decimal(18,4) DEFAULT NULL COMMENT '派彩或退回金額',
  `traceId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易編號',
  `create_time` datetime DEFAULT NULL COMMENT '投注時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `sbo_bet_records_player_name_index` (`player_name`),
  KEY `sbo_bet_records_game_code_index` (`game_code`),
  KEY `sbo_bet_records_bet_id_index` (`bet_id`),
  KEY `sbo_bet_records_trans_type_index` (`trans_type`),
  KEY `sbo_bet_records_created_at_index` (`created_at`),
  KEY `sbo_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule_logs`
--

DROP TABLE IF EXISTS `schedule_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `schedule_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exit_code` int NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `usages` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_logs_schedule_name_index` (`schedule_name`),
  KEY `schedule_logs_exit_code_index` (`exit_code`),
  KEY `schedule_logs_start_time_index` (`start_time`),
  KEY `schedule_logs_usages_index` (`usages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scr_accounts`
--

DROP TABLE IF EXISTS `scr_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `scr_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'scr帳號',
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '918玩家帳號',
  `password` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密碼',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'scr餘額',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT '營運商編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員帳號',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態0:未取餘額，1:取得舊帳號餘額，2:轉移完成，3:剩餘點數回收完成',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scr_accounts_username_unique` (`username`),
  KEY `scr_accounts_player_id_index` (`player_id`),
  KEY `scr_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scr_bet_records`
--

DROP TABLE IF EXISTS `scr_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `scr_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL COMMENT '未知',
  `account` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '918玩家帳號',
  `bet_time` datetime DEFAULT NULL COMMENT '投注時間',
  `bet_time_utc` datetime DEFAULT NULL COMMENT '投注時間utc',
  `begin_balance` decimal(10,2) DEFAULT NULL COMMENT '投注前餘額',
  `end_balance` decimal(10,2) DEFAULT NULL COMMENT '結算後餘額',
  `game_id` int DEFAULT NULL COMMENT '遊戲ID',
  `game_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲名稱',
  `line_num` int DEFAULT NULL COMMENT '未知',
  `log_data_str` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲記錄',
  `log_data_type` int DEFAULT NULL COMMENT '1:设置分数, 2:游戏记录, 3:未完成的游戏, 4:JackPot, 5:Double, 6:Game bonus, 8:红包, 13:未完成的纸牌游戏',
  `round_no` int DEFAULT NULL COMMENT '未知',
  `row_num` int DEFAULT NULL COMMENT '未知',
  `table_id` int DEFAULT NULL COMMENT '桌號',
  `win` decimal(10,2) DEFAULT NULL COMMENT '輸贏金額',
  `bet` decimal(10,2) DEFAULT NULL COMMENT '投注金額',
  `cday` int DEFAULT NULL COMMENT '未知',
  `cno` int DEFAULT NULL COMMENT '未知',
  `uuid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '未知',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`account`,`uuid`),
  KEY `scr_bet_records_account_index` (`account`),
  KEY `scr_bet_records_bet_time_index` (`bet_time`),
  KEY `scr_bet_records_bet_time_utc_index` (`bet_time_utc`),
  KEY `scr_bet_records_game_id_index` (`game_id`),
  KEY `scr_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scr_daily_wins`
--

DROP TABLE IF EXISTS `scr_daily_wins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `scr_daily_wins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `date` date NOT NULL COMMENT '日期',
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家編號',
  `win` decimal(13,7) NOT NULL DEFAULT '0.0000000' COMMENT '贏得金額',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `scr_daily_wins_date_index` (`date`),
  KEY `scr_daily_wins_player_id_index` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settlement_report_payouts`
--

DROP TABLE IF EXISTS `settlement_report_payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlement_report_payouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `period` int NOT NULL COMMENT '期數 : summary_settlement_periods.period',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:建立,1:跑完',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settlement_report_reruns`
--

DROP TABLE IF EXISTS `settlement_report_reruns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlement_report_reruns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `settlement_date` date NOT NULL COMMENT '結算日期',
  `period` int NOT NULL DEFAULT '0' COMMENT '期數 : summary_settlement_periods.period',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:建立,1:跑完',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shareholder_api_infos`
--

DROP TABLE IF EXISTS `shareholder_api_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shareholder_api_infos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '本站的總代ID',
  `site_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分站名(使用英數_符號,不要有空格與-號)',
  `foreign_agent_id` int unsigned NOT NULL COMMENT '分站的總代ID',
  `api_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:啟用 0:停用',
  `memo` text COLLATE utf8mb4_unicode_ci COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int unsigned NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分桶分站API資訊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shareholder_cancel_logs`
--

DROP TABLE IF EXISTS `shareholder_cancel_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shareholder_cancel_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '彙總時間(UTC)',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理系統編號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注額',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '1: 禁止派獎, 2: 可以派獎',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  KEY `shareholder_cancel_logs_summary_time_index` (`summary_time`),
  KEY `shareholder_cancel_logs_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shareholder_cancels`
--

DROP TABLE IF EXISTS `shareholder_cancels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shareholder_cancels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_date` date NOT NULL COMMENT '日期',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理系統編號',
  `status` tinyint NOT NULL COMMENT '狀態',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `shareholder_cancels_summary_date_index` (`summary_date`),
  KEY `shareholder_cancels_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shareholder_categories`
--

DROP TABLE IF EXISTS `shareholder_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shareholder_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT '代理個性化設置編號',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '分桶組別名稱',
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '分桶組別代碼',
  `sort` tinyint NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態; 0:disable, 1:enable',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  KEY `shareholder_categories_agent_group_id_index` (`agent_group_id`),
  KEY `shareholder_categories_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shareholder_category_settings`
--

DROP TABLE IF EXISTS `shareholder_category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shareholder_category_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `shareholder_category_id` int NOT NULL DEFAULT '0' COMMENT '份桶類別ID',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商編號',
  `game_type_id` int NOT NULL DEFAULT '0' COMMENT '遊戲類型ID',
  `calc_bet` tinyint(1) NOT NULL DEFAULT '1' COMMENT '計算投注額',
  `calc_win_lose` tinyint(1) NOT NULL DEFAULT '1' COMMENT '計算輸贏',
  `memo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註用',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態; 0:disable, 1:enable',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  KEY `shareholder_category_settings_shareholder_category_id_index` (`shareholder_category_id`),
  KEY `shareholder_category_settings_vendor_id_index` (`vendor_id`),
  KEY `shareholder_category_settings_game_type_id_index` (`game_type_id`),
  KEY `shareholder_category_settings_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shareholder_exchange_rate_logs`
--

DROP TABLE IF EXISTS `shareholder_exchange_rate_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shareholder_exchange_rate_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` int unsigned NOT NULL DEFAULT '0' COMMENT '組織ID',
  `before_change` decimal(18,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '修改前匯率',
  `after_change` decimal(18,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '修改後匯率',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int unsigned NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `shareholder_exchange_rate_logs_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='份桶匯率操作紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shareholder_exchange_rates`
--

DROP TABLE IF EXISTS `shareholder_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shareholder_exchange_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` int unsigned NOT NULL DEFAULT '0' COMMENT '組織ID',
  `exchange_rate_to_USD` decimal(18,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '平台幣轉為USD(共通貨幣)的匯率',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int unsigned NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shareholder_exchange_rates_organization_id_unique` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='份桶匯率, 將平台幣轉為USD(共通貨幣)的匯率';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shareholder_payout_logs`
--

DROP TABLE IF EXISTS `shareholder_payout_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shareholder_payout_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '彙總時間(UTC)',
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT '代理組別編號',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0:未派發, 1:已派發, 2:待派發, 3:已編輯, 4:已結算, 5:已計算, 6:已發佈數\n0:未派發 > 3:已輸入數據(未結算) > 5:已計算 > 6:已發佈數據 > 4:已結算 > 2:待派發 > 1:已派發',
  `memo` text COLLATE utf8mb4_unicode_ci COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`summary_time`,`agent_group_id`),
  KEY `shareholder_payout_logs_summary_time_index` (`summary_time`),
  KEY `shareholder_payout_logs_agent_group_id_index` (`agent_group_id`),
  KEY `shareholder_payout_logs_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simple_settlement_policies`
--

DROP TABLE IF EXISTS `simple_settlement_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_settlement_policies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理商系統編號',
  `period_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '結算期間類型: daily, weekly, monthly',
  `timezone` tinyint NOT NULL COMMENT '時區',
  `is_auto_pay` tinyint NOT NULL COMMENT '是否自動派佣: 0 否, 1 是',
  `is_active` tinyint NOT NULL COMMENT '是否啟用: 0 否, 1 是',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simple_settlement_reports`
--

DROP TABLE IF EXISTS `simple_settlement_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_settlement_reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `simple_settlement_policy_id` int NOT NULL DEFAULT '0' COMMENT 'simple_settlement_policies.id',
  `period_start` datetime NOT NULL COMMENT '結算期間開始時間',
  `agent_id` int NOT NULL COMMENT '代理商系統編號',
  `percentage` decimal(10,2) NOT NULL COMMENT '佔成百分比',
  `bet` decimal(18,4) NOT NULL COMMENT '投注金額',
  `gross_pnl` decimal(18,4) NOT NULL COMMENT '毛利損益',
  `bonus` decimal(18,4) NOT NULL COMMENT '獎勵金額',
  `net_pnl` decimal(18,4) NOT NULL COMMENT '淨利損益',
  `total_commission` decimal(18,4) NOT NULL COMMENT '所有佣金',
  `team_commission` decimal(18,4) NOT NULL COMMENT '下線佣金',
  `commission` decimal(18,4) NOT NULL COMMENT '自己佣金',
  `status` tinyint NOT NULL COMMENT '狀態: -1 禁止派佣, 0 未派佣, 1 已派佣',
  `pay_time` datetime NOT NULL COMMENT '派佣時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sky1388_accounts`
--

DROP TABLE IF EXISTS `sky1388_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sky1388_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sky1388_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `sky1388_accounts_username_index` (`username`),
  KEY `sky1388_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sky1388_bet_records`
--

DROP TABLE IF EXISTS `sky1388_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sky1388_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` bigint NOT NULL DEFAULT '0' COMMENT '注单唯一Id',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏桌号',
  `bet_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `created_time` datetime NOT NULL COMMENT '注單時間(utc)',
  `bet` decimal(18,4) NOT NULL COMMENT '下注金额',
  `win` decimal(18,4) NOT NULL COMMENT '贏得金额',
  `refund` decimal(18,4) NOT NULL COMMENT '退還金额',
  `win_lose` decimal(18,4) NOT NULL COMMENT '輸贏金额',
  `jackpot` decimal(18,4) NOT NULL COMMENT 'jackpot',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sky1388_bet_records_bet_id_unique` (`bet_id`),
  KEY `sky1388_bet_records_username_index` (`username`),
  KEY `sky1388_bet_records_bet_time_index` (`bet_time`),
  KEY `sky1388_bet_records_created_time_index` (`created_time`),
  KEY `sky1388_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skybet_accounts`
--

DROP TABLE IF EXISTS `skybet_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `skybet_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `username_modified` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號(含前綴',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `skybet_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `skybet_accounts_username_index` (`username`),
  KEY `skybet_accounts_username_modified_index` (`username_modified`),
  KEY `skybet_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skybet_bet_records`
--

DROP TABLE IF EXISTS `skybet_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `skybet_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '派彩時間(utc)',
  `created_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `bet_status` int NOT NULL,
  `settlement_status` int NOT NULL,
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注; AvailTotalBet',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金额; WinAmount',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount - BetCoin',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `skybet_bet_records_bet_id_unique` (`bet_id`),
  KEY `skybet_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sl_accounts`
--

DROP TABLE IF EXISTS `sl_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sl_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sl_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `sl_accounts_username_index` (`username`),
  KEY `sl_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sl_bet_records`
--

DROP TABLE IF EXISTS `sl_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sl_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `draw_date` datetime NOT NULL COMMENT '開獎日期(utc)',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sl_bet_records_bet_id_unique` (`bet_id`),
  KEY `sl_bet_records_username_index` (`username`),
  KEY `sl_bet_records_draw_date_index` (`draw_date`),
  KEY `sl_bet_records_bet_time_index` (`bet_time`),
  KEY `sl_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sma_accounts`
--

DROP TABLE IF EXISTS `sma_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '玩家token',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sma_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `sma_accounts_username_index` (`username`),
  KEY `sma_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sma_bet_records`
--

DROP TABLE IF EXISTS `sma_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `record_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '押注记录 id (全局唯一) - recordId',
  `bet_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '游戏局id - requestId',
  `round_id` int NOT NULL DEFAULT '0' COMMENT '当前局的轮次',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sma_bet_records_record_id_unique` (`record_id`),
  KEY `sma_bet_records_bet_id_index` (`bet_id`),
  KEY `sma_bet_records_round_id_index` (`round_id`),
  KEY `sma_bet_records_username_index` (`username`),
  KEY `sma_bet_records_game_code_index` (`game_code`),
  KEY `sma_bet_records_bet_time_index` (`bet_time`),
  KEY `sma_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_gateway_countries`
--

DROP TABLE IF EXISTS `sms_gateway_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_gateway_countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sms_gateway_id` int NOT NULL COMMENT '簡訊商ID; sms_gateways.id',
  `country_id` int NOT NULL COMMENT '國家ID; countries.id',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態; 1:啟用, 0:停用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_gateway_group_details`
--

DROP TABLE IF EXISTS `sms_gateway_group_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_gateway_group_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT 'agent_group.id',
  `setting` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '{}' COMMENT '簡訊商資訊, json格式; {"token_expired":"token有效時間", "max_send":"有效時間最大發送次數"}',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_gateway_info_countries`
--

DROP TABLE IF EXISTS `sms_gateway_info_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_gateway_info_countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sms_gateway_info_id` int NOT NULL COMMENT '簡訊商戶資訊ID; sms_gateway_infos.id',
  `country_id` int NOT NULL COMMENT '國家ID; countries.id',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態; 1:啟用, 0:停用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_gateway_infos`
--

DROP TABLE IF EXISTS `sms_gateway_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_gateway_infos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `sms_gateway_group_id` int NOT NULL DEFAULT '0' COMMENT '簡訊群組ID(sms_gateway_groups.id)',
  `sms_gateway_id` int unsigned NOT NULL DEFAULT '0' COMMENT '簡訊商ID',
  `info` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '{}' COMMENT '簡訊商商戶資訊, 內容使用json儲存',
  `sort` int NOT NULL DEFAULT '0' COMMENT '簡訊商排序',
  `cost` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '成本',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態; 0:停用, 1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_gateways`
--

DROP TABLE IF EXISTS `sms_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_gateways` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '簡訊商名稱',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '簡訊商代碼',
  `info` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '{}' COMMENT '簡訊商輸入資訊',
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '簡訊商 API URL',
  `memo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態; 0:停用, 1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_infobips`
--

DROP TABLE IF EXISTS `sms_infobips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_infobips` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `member_id` int NOT NULL COMMENT '玩家帳號',
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '電話號碼',
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訊息內容',
  `smsCount` int DEFAULT NULL COMMENT '訊息分成幾則',
  `message_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '訊息編號',
  `send_at` datetime DEFAULT NULL COMMENT '發送時間',
  `done_at` datetime DEFAULT NULL COMMENT '完成時間',
  `price` decimal(10,2) DEFAULT NULL COMMENT '費用',
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '幣種',
  `status_group_id` int DEFAULT NULL COMMENT '群組識別碼',
  `status_group_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '群組名稱',
  `status_id` int DEFAULT NULL COMMENT '識別碼',
  `status_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名稱',
  `status_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_send_records`
--

DROP TABLE IF EXISTS `sms_send_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_send_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `sms_gateway_id` int NOT NULL DEFAULT '0' COMMENT '簡訊商ID(sms_gateways.id)',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'agents.id',
  `member_id` int unsigned NOT NULL DEFAULT '0' COMMENT '玩家ID',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '發送號碼',
  `message_content` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '簡訊發送內容',
  `transaction_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '簡訊商發送ID',
  `response_message` text COLLATE utf8mb4_unicode_ci COMMENT '簡訊商response data(json)',
  `status` int NOT NULL DEFAULT '0' COMMENT '發送狀態;0:未發送,1:發送成功,2:發送失敗',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sms_send_records_sms_gateway_id_index` (`sms_gateway_id`),
  KEY `sms_send_records_agent_id_index` (`agent_id`),
  KEY `sms_send_records_member_id_index` (`member_id`),
  KEY `sms_send_records_status_index` (`status`),
  KEY `sms_send_records_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_sms_gets`
--

DROP TABLE IF EXISTS `sms_sms_gets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_sms_gets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手機號碼',
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '簡訊內容',
  `stats` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '發送成功或失敗',
  `error_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訊息代碼',
  `error_msg` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '成功:訊息ID|使用點數|剩餘點數；錯誤:錯誤說明',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_sms_works`
--

DROP TABLE IF EXISTS `sms_sms_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_sms_works` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手機號碼',
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '簡訊內容',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '發送成功或失敗,1:成功',
  `transation_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易編號',
  `response_message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '成功:狀態|交易編號；錯誤:錯誤說明',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_texts`
--

DROP TABLE IF EXISTS `sms_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_texts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `agent_id` int NOT NULL COMMENT '營運商系統編號',
  `sms_gateway_group_id` int NOT NULL DEFAULT '1' COMMENT '簡訊群組ID(sms_gateway_groups.id)',
  `type_id` int NOT NULL COMMENT '類型編號; params.type=sms_text_type',
  `country_id` int NOT NULL COMMENT '國家系統編號',
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訊息內容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態0:禁用1:使用中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `sms_texts_agent_id_index` (`agent_id`),
  KEY `sms_texts_sms_gateway_group_id_index` (`sms_gateway_group_id`),
  KEY `sms_texts_type_id_index` (`type_id`),
  KEY `sms_texts_country_id_index` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sp_logs`
--

DROP TABLE IF EXISTS `sp_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `routine_schema` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '儲存程序的資料庫名稱',
  `routine_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '儲存程序的名稱',
  `routine_definition` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '儲存程序的完整定義',
  `version_number` int NOT NULL COMMENT '儲存程序的版本號（遞增）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '紀錄新增時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`routine_schema`,`routine_name`,`version_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='SP異動紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spadegaming_accounts`
--

DROP TABLE IF EXISTS `spadegaming_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spadegaming_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spadegaming_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `spadegaming_accounts_username_index` (`username`),
  KEY `spadegaming_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spadegaming_bet_records`
--

DROP TABLE IF EXISTS `spadegaming_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spadegaming_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '開獎時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `spadegaming_bet_records_bet_id_unique` (`bet_id`),
  KEY `spadegaming_bet_records_username_index` (`username`),
  KEY `spadegaming_bet_records_game_code_index` (`game_code`),
  KEY `spadegaming_bet_records_bet_time_index` (`bet_time`),
  KEY `spadegaming_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spadegamingsw_accounts`
--

DROP TABLE IF EXISTS `spadegamingsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spadegamingsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spadegamingsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `spadegamingsw_accounts_username_index` (`username`),
  KEY `spadegamingsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spadegamingsw_bet_records`
--

DROP TABLE IF EXISTS `spadegamingsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spadegamingsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id',
  `reference_bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '關聯交易 id',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號',
  `type` int NOT NULL COMMENT '1: 下注, 2: 取消下注, 4: 派彩, 7: 紅包',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '合法下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  PRIMARY KEY (`id`),
  UNIQUE KEY `spadegamingsw_bet_records_bet_id_unique` (`bet_id`),
  KEY `spadegamingsw_bet_records_type_index` (`type`),
  KEY `spadegamingsw_bet_records_payout_time_index` (`payout_time`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_agent_achievements`
--

DROP TABLE IF EXISTS `summary_agent_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_agent_achievements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '彙總時間(UTC)',
  `agent_id` int NOT NULL COMMENT '代理ID',
  `vendor_id` int NOT NULL COMMENT '遊戲商ID',
  `game_type_id` int NOT NULL COMMENT '遊戲商ID',
  `total_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總投注',
  `total_win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總輸贏',
  `total_jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總輸贏',
  `total_share_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總輸贏',
  `total_commission` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總輸贏',
  `total_v_jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總VJackpot',
  `total_cost` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總VJackpot',
  `total_score` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總VJackpot',
  `proportion` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '佔成',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `summary_agent_achievements_summary_time_index` (`summary_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_agent_settlements`
--

DROP TABLE IF EXISTS `summary_agent_settlements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_agent_settlements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理編號',
  `settlement_date` date NOT NULL COMMENT '結算日期',
  `period` int NOT NULL DEFAULT '0' COMMENT '期數 : summary_settlement_periods.period',
  `slot` decimal(14,4) NOT NULL COMMENT 'slot銷售額',
  `score` decimal(14,4) NOT NULL COMMENT 'score銷售額',
  `live` decimal(14,4) NOT NULL COMMENT 'live銷售額',
  `sport` decimal(14,4) NOT NULL COMMENT 'sport銷售額',
  `other` decimal(14,4) NOT NULL COMMENT 'other銷售額',
  `bonus` decimal(14,4) NOT NULL COMMENT 'Bonus',
  `profit_1` decimal(14,4) NOT NULL COMMENT '直屬盈利',
  `profit_2` decimal(14,4) NOT NULL COMMENT '下層盈利',
  `profit_3` decimal(14,4) NOT NULL COMMENT '下下層盈利',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `summary_agent_settlements_settlement_date_index` (`settlement_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_bet_record_agent_teams`
--

DROP TABLE IF EXISTS `summary_bet_record_agent_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_bet_record_agent_teams` (
  `summary_time` datetime NOT NULL COMMENT '彙整時間',
  `data_time` datetime NOT NULL COMMENT '數據時間',
  `agent_id` int unsigned NOT NULL COMMENT '代理系統編號',
  `vendor_id` int unsigned NOT NULL COMMENT '遊戲商系統編號',
  `game_id` int NOT NULL DEFAULT '0' COMMENT '遊戲系統編號',
  `bet_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額-直屬',
  `bet_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額-團隊',
  `win_lose_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額-直屬',
  `win_lose_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額-團隊',
  `rolling_chip_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼-直屬',
  `rolling_chip_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼-團隊',
  `commission_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金-直屬',
  `commission_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金-團隊',
  `jackpot_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩金-直屬',
  `jackpot_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩金-團隊',
  `v_jackpot_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'v_jackpot-直屬',
  `v_jackpot_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'v_jackpot-團隊',
  `cost_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '成本-直屬',
  `cost_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '成本-團隊',
  `share_amount_direct` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '分成金額-直屬',
  `share_amount_team` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '分成金額-團隊',
  `record_count_direct` int NOT NULL DEFAULT '0' COMMENT '資料計數-直屬',
  `record_count_team` int NOT NULL DEFAULT '0' COMMENT '資料計數-團隊',
  `correction` tinyint NOT NULL DEFAULT '0' COMMENT '改正標示',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_index` (`summary_time`,`data_time`,`agent_id`,`vendor_id`,`game_id`),
  KEY `summary_bet_record_agent_teams_summary_time_index` (`summary_time`),
  KEY `summary_bet_record_agent_teams_data_time_index` (`data_time`),
  KEY `summary_bet_record_agent_teams_agent_id_index` (`agent_id`),
  KEY `summary_bet_record_agent_teams_vendor_id_index` (`vendor_id`),
  KEY `summary_bet_record_agent_teams_game_id_index` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_bet_record_agents`
--

DROP TABLE IF EXISTS `summary_bet_record_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_bet_record_agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `summary_time` datetime NOT NULL,
  `agent_id` int NOT NULL,
  `vendor_id` int NOT NULL COMMENT '廠商ID; 大於0為vendor_id, -1:獎勵, -2:v-reward, -3:簡訊, -4:, -5:三層代獎勵',
  `game_type_id` int NOT NULL DEFAULT '0',
  `game_id` int DEFAULT NULL,
  `total_bet` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `total_win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `total_jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `total_share_amount` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `total_commission` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金',
  `total_v_jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `total_cost` decimal(18,4) DEFAULT '0.0000',
  `total_score` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總咬分',
  `proportion` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '占成',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`summary_time`,`agent_id`,`vendor_id`,`game_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_bet_record_by_days`
--

DROP TABLE IF EXISTS `summary_bet_record_by_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_bet_record_by_days` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '時間',
  `agent_id` int NOT NULL COMMENT '代理系統編號',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `vendor_id` int NOT NULL COMMENT '遊戲商系統編號',
  `game_id` int NOT NULL COMMENT '遊戲系統編號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼',
  `commission` decimal(18,4) DEFAULT '0.0000' COMMENT '佣金',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩金',
  `v_jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'v_jackpot',
  `cost` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '成本',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`summary_time`,`member_id`,`vendor_id`,`game_id`),
  KEY `summary_bet_record_by_days_summary_time_index` (`summary_time`),
  KEY `summary_bet_record_by_days_agent_id_index` (`agent_id`),
  KEY `summary_bet_record_by_days_member_id_index` (`member_id`),
  KEY `summary_bet_record_by_days_vendor_id_index` (`vendor_id`),
  KEY `summary_bet_record_by_days_game_id_index` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_bet_record_histories`
--

DROP TABLE IF EXISTS `summary_bet_record_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_bet_record_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '時間',
  `data_time` datetime NOT NULL COMMENT '數據時間',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `vendor_id` int NOT NULL COMMENT '遊戲商系統編號',
  `game_id` int NOT NULL COMMENT '遊戲系統編號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼',
  `commission` decimal(18,4) DEFAULT '0.0000' COMMENT '佣金',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩金',
  `record_count` int NOT NULL DEFAULT '0' COMMENT '資料計數',
  `bak` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '備用',
  `bak1` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '備用',
  `percentage` decimal(8,2) DEFAULT NULL COMMENT '分成百分比',
  `share_amount` decimal(8,2) DEFAULT NULL COMMENT '分成金額',
  `share_range` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分成區間',
  `v_jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'v_jackpot',
  `cost` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '成本',
  `correction` tinyint NOT NULL DEFAULT '0' COMMENT '改正標示',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`,`summary_time`),
  KEY `summary_bet_record_histories_summary_time_index` (`summary_time`),
  KEY `summary_bet_record_histories_data_time_index` (`data_time`),
  KEY `summary_bet_record_histories_member_id_index` (`member_id`),
  KEY `summary_bet_record_histories_vendor_id_index` (`vendor_id`),
  KEY `summary_bet_record_histories_game_id_index` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_bet_records`
--

DROP TABLE IF EXISTS `summary_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '時間',
  `data_time` datetime NOT NULL COMMENT '數據時間',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `vendor_id` int NOT NULL COMMENT '遊戲商系統編號',
  `game_id` int NOT NULL COMMENT '遊戲系統編號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼',
  `commission` decimal(18,4) DEFAULT '0.0000' COMMENT '佣金',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩金',
  `record_count` int NOT NULL DEFAULT '0' COMMENT '資料計數',
  `bak` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '備用',
  `bak1` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '備用',
  `percentage` decimal(8,2) DEFAULT NULL COMMENT '分成百分比',
  `share_amount` decimal(8,2) DEFAULT NULL COMMENT '分成金額',
  `share_range` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分成區間',
  `v_jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'v_jackpot',
  `cost` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '成本',
  `correction` tinyint NOT NULL DEFAULT '0' COMMENT '改正標示',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`,`summary_time`),
  KEY `summary_bet_records_summary_time_index` (`summary_time`),
  KEY `summary_bet_records_data_time_index` (`data_time`),
  KEY `summary_bet_records_member_id_index` (`member_id`),
  KEY `summary_bet_records_vendor_id_index` (`vendor_id`),
  KEY `summary_bet_records_game_id_index` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_bet_records_team`
--

DROP TABLE IF EXISTS `summary_bet_records_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_bet_records_team` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '時間(日)',
  `member_id` int unsigned NOT NULL COMMENT '會員系統編號',
  `vendor_id` int unsigned NOT NULL COMMENT '遊戲商系統編號',
  `game_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲系統編號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額-自己',
  `bet_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額-直屬',
  `bet_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額-團隊',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額-自己',
  `win_lose_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額-直屬',
  `win_lose_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額-團隊',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `summary_bet_records_team_summary_time_index` (`summary_time`),
  KEY `summary_bet_records_team_member_id_index` (`member_id`),
  KEY `summary_bet_records_team_vendor_id_index` (`vendor_id`),
  KEY `summary_bet_records_team_game_id_index` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_bet_records_team_histories`
--

DROP TABLE IF EXISTS `summary_bet_records_team_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_bet_records_team_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '時間(日)',
  `member_id` int unsigned NOT NULL COMMENT '會員系統編號',
  `vendor_id` int unsigned NOT NULL COMMENT '遊戲商系統編號',
  `game_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲系統編號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額-自己',
  `bet_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額-直屬',
  `bet_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額-團隊',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額-自己',
  `win_lose_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額-直屬',
  `win_lose_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額-團隊',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `summary_bet_records_team_histories_summary_time_index` (`summary_time`),
  KEY `summary_bet_records_team_histories_member_id_index` (`member_id`),
  KEY `summary_bet_records_team_histories_vendor_id_index` (`vendor_id`),
  KEY `summary_bet_records_team_histories_game_id_index` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_control_logs`
--

DROP TABLE IF EXISTS `summary_control_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_control_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_id` int DEFAULT NULL COMMENT '1~10000:遊戲商編號,\n10001~11000:SP,\n11001~12000:RD-Studio job',
  `stat_start_time` datetime DEFAULT NULL COMMENT '統計開始時間',
  `stat_end_time` datetime DEFAULT NULL COMMENT '統計結束時間',
  `exec_start_time` datetime DEFAULT NULL COMMENT '執行開始時間',
  `exec_end_time` datetime DEFAULT NULL COMMENT '執行結束時間',
  `params` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  PRIMARY KEY (`id`),
  KEY `summary_control_logs_vendor_id_index` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='彙整排程時間控制表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_control_tables`
--

DROP TABLE IF EXISTS `summary_control_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_control_tables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_id` int DEFAULT NULL COMMENT '遊戲商編號; 10000以上為功能編號',
  `vendor_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲商代碼',
  `stat_start_time` datetime DEFAULT NULL COMMENT '統計開始時間',
  `stat_end_time` datetime DEFAULT NULL COMMENT '統計結束時間',
  `stat_start_id` bigint DEFAULT NULL,
  `stat_end_id` bigint DEFAULT NULL,
  `exec_start_time` datetime DEFAULT NULL COMMENT '執行開始時間',
  `exec_end_time` datetime DEFAULT NULL COMMENT '執行結束時間',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `summary_control_tables_vendor_id_unique` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='彙整排程時間控制表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_customer_settlements`
--

DROP TABLE IF EXISTS `summary_customer_settlements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_customer_settlements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL COMMENT '代理編號',
  `settlement_date` date NOT NULL COMMENT '結算日期',
  `period` int NOT NULL DEFAULT '0' COMMENT '期數 : summary_settlement_periods.period',
  `sales` decimal(14,4) NOT NULL COMMENT '銷售額',
  `bonus` decimal(14,4) NOT NULL COMMENT 'Bonus',
  `commission` decimal(14,4) NOT NULL COMMENT '傭金',
  `vendor_fee` decimal(14,4) NOT NULL COMMENT '公司盤費',
  `rebate` decimal(14,4) NOT NULL COMMENT '返水',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `summary_customer_settlements_settlement_date_index` (`settlement_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_event_record_agents`
--

DROP TABLE IF EXISTS `summary_event_record_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_event_record_agents` (
  `summary_time` datetime NOT NULL COMMENT '數據時間',
  `agent_id` int NOT NULL COMMENT '代理編號',
  `event_id` tinyint NOT NULL COMMENT '事件編號; 1:活動獎勵(含登入活動), 2:無限代獎勵,3:pay fee, 4:sms fee',
  `point` decimal(20,6) DEFAULT '0.000000' COMMENT '點數(不含代理本身)',
  `self_point` decimal(18,4) DEFAULT '0.0000' COMMENT '代理本身所獲得點數',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`summary_time`,`agent_id`,`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_event_record_histories`
--

DROP TABLE IF EXISTS `summary_event_record_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_event_record_histories` (
  `summary_time` datetime NOT NULL COMMENT '數據時間',
  `member_id` int NOT NULL COMMENT '會員編號',
  `event_id` tinyint NOT NULL COMMENT '事件編號; 1:活動獎勵(含登入活動), 2:無限代獎勵, 3:支付成本, 4:SMS成本',
  `point` decimal(20,6) DEFAULT '0.000000' COMMENT '點數',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`summary_time`,`member_id`,`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_event_records`
--

DROP TABLE IF EXISTS `summary_event_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_event_records` (
  `summary_time` datetime NOT NULL COMMENT '數據時間',
  `member_id` int NOT NULL COMMENT '會員編號',
  `event_id` tinyint NOT NULL COMMENT '事件編號; 1:活動獎勵(含登入活動), 2:無限代獎勵, 3:支付成本, 4:SMS成本',
  `point` decimal(20,6) DEFAULT '0.000000' COMMENT '點數',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`summary_time`,`member_id`,`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_point_barrel_winloses`
--

DROP TABLE IF EXISTS `summary_point_barrel_winloses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_point_barrel_winloses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `summary_time` datetime NOT NULL,
  `agent_id` int NOT NULL DEFAULT '0',
  `vendor_id` int NOT NULL DEFAULT '0',
  `turnover` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `game_spending` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `game_profit` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `memo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `summary_point_barrel_winloses_summary_time_index` (`summary_time`),
  KEY `summary_point_barrel_winloses_agent_id_index` (`agent_id`),
  KEY `summary_point_barrel_winloses_vendor_id_index` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_point_barrels`
--

DROP TABLE IF EXISTS `summary_point_barrels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_point_barrels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `summary_time` datetime NOT NULL,
  `agent_id` int NOT NULL DEFAULT '0',
  `parent_id` int NOT NULL DEFAULT '0',
  `vendor_id` int DEFAULT '0',
  `hierarchy_path` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `share_point` int DEFAULT '0',
  `total_turnover` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `total_nett_profit` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `self_turnover` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `self_nett_profit` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`summary_time`,`agent_id`,`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_pp_bet_records`
--

DROP TABLE IF EXISTS `summary_pp_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_pp_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '時間',
  `data_time` datetime NOT NULL COMMENT '數據時間',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `vendor_id` int NOT NULL COMMENT '遊戲商系統編號',
  `game_id` int NOT NULL COMMENT '遊戲系統編號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼',
  `commission` decimal(18,4) DEFAULT '0.0000' COMMENT '佣金',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩金',
  `bak` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '備用',
  `bak1` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '備用',
  `percentage` decimal(8,2) DEFAULT NULL COMMENT '分成百分比',
  `share_amount` decimal(8,2) DEFAULT NULL COMMENT '分成金額',
  `share_range` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分成區間',
  `v_jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'v_jackpot',
  `cost` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '成本',
  `correction` tinyint NOT NULL DEFAULT '0' COMMENT '改正標示',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`,`summary_time`),
  KEY `summary_pp_bet_records_summary_time_index` (`summary_time`),
  KEY `summary_pp_bet_records_data_time_index` (`data_time`),
  KEY `summary_pp_bet_records_member_id_index` (`member_id`),
  KEY `summary_pp_bet_records_vendor_id_index` (`vendor_id`),
  KEY `summary_pp_bet_records_game_id_index` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_rolling_chip_records`
--

DROP TABLE IF EXISTS `summary_rolling_chip_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_rolling_chip_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `summary_time` datetime NOT NULL COMMENT '時間',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `pay_rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派發金額',
  `use_rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '消耗金額',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `summary_rolling_chip_records_summary_time_index` (`summary_time`),
  KEY `summary_rolling_chip_records_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_rolling_chip_records_by_agent`
--

DROP TABLE IF EXISTS `summary_rolling_chip_records_by_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_rolling_chip_records_by_agent` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `summary_time` datetime NOT NULL COMMENT '時間',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理系統編號',
  `pay_rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派發金額',
  `use_rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '消耗金額',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `summary_rolling_chip_records_by_agent_summary_time_index` (`summary_time`),
  KEY `summary_rolling_chip_records_by_agent_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_settlement_periods`
--

DROP TABLE IF EXISTS `summary_settlement_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_settlement_periods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `period` int NOT NULL COMMENT '期數',
  `start_date` date NOT NULL COMMENT '開始日期',
  `end_date` date NOT NULL COMMENT '結束日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_shareholder_records`
--

DROP TABLE IF EXISTS `summary_shareholder_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_shareholder_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '彙總時間(UTC)',
  `agent_id` int NOT NULL COMMENT '代理ID',
  `shareholder_category_id` int NOT NULL DEFAULT '0',
  `direct_turnover` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '自身有效流水',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`summary_time`,`agent_id`,`shareholder_category_id`),
  KEY `summary_shareholder_records_summary_time_index` (`summary_time`),
  KEY `summary_shareholder_records_agent_id_index` (`agent_id`),
  KEY `summary_shareholder_records_shareholder_category_id_index` (`shareholder_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_shareholder_temps`
--

DROP TABLE IF EXISTS `summary_shareholder_temps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_shareholder_temps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '彙總時間(UTC)',
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT '代理群別ID',
  `shareholder_category_id` int NOT NULL DEFAULT '0' COMMENT 'shareholder_category.id',
  `share_point` int NOT NULL DEFAULT '0' COMMENT '分桶分成比例',
  `turnover` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總有效流水',
  `original_turnover` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '原始總有效流水',
  `nett_profit` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總淨利潤',
  `original_nett_profit` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '原始總淨利潤',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`summary_time`,`agent_group_id`,`shareholder_category_id`),
  KEY `summary_shareholder_temps_summary_time_index` (`summary_time`),
  KEY `summary_shareholder_temps_agent_group_id_index` (`agent_group_id`),
  KEY `summary_shareholder_temps_shareholder_category_id_index` (`shareholder_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_shareholder_winlose_temps`
--

DROP TABLE IF EXISTS `summary_shareholder_winlose_temps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_shareholder_winlose_temps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '彙總時間(UTC)',
  `agent_id` int NOT NULL COMMENT '代理ID',
  `shareholder_category_id` int NOT NULL COMMENT '份桶類別ID',
  `turnover` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '營業額',
  `winlose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏',
  `game_spending` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '遊戲支出',
  `game_profit` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '遊戲盈利',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`summary_time`,`agent_id`,`shareholder_category_id`),
  KEY `summary_shareholder_winlose_temps_summary_time_index` (`summary_time`),
  KEY `summary_shareholder_winlose_temps_agent_id_index` (`agent_id`),
  KEY `summary_shareholder_winlose_temps_shareholder_category_id_index` (`shareholder_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_shareholder_winloses`
--

DROP TABLE IF EXISTS `summary_shareholder_winloses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_shareholder_winloses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '彙總時間(UTC)',
  `agent_id` int NOT NULL COMMENT '代理ID',
  `vendor_id` int NOT NULL COMMENT '遊戲商ID',
  `game_type_id` int NOT NULL,
  `turnover` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '營業額',
  `winlose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏',
  `game_spending` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '遊戲支出',
  `game_profit` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '遊戲盈利',
  `memo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`summary_time`,`agent_id`,`vendor_id`,`game_type_id`),
  KEY `summary_shareholder_winloses_summary_time_index` (`summary_time`),
  KEY `summary_shareholder_winloses_agent_id_index` (`agent_id`),
  KEY `summary_shareholder_winloses_vendor_id_index` (`vendor_id`),
  KEY `summary_shareholder_winloses_game_type_id_index` (`game_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_shareholders`
--

DROP TABLE IF EXISTS `summary_shareholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_shareholders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '彙總時間(UTC)',
  `agent_id` int NOT NULL COMMENT '代理ID',
  `parent_id` int NOT NULL COMMENT '父代理ID',
  `shareholder_category_id` int NOT NULL DEFAULT '0',
  `hierarchy_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '代理階層路徑',
  `upper_share_point` int NOT NULL COMMENT '上級分桶分成比例',
  `share_point` int NOT NULL COMMENT '分桶分成比例',
  `rate` decimal(5,4) NOT NULL DEFAULT '0.0000' COMMENT '佔比',
  `direct_turnover` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '自己有效流水',
  `direct_rate` decimal(5,4) NOT NULL DEFAULT '0.0000',
  `direct_nett_profit` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `team_turnover` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `team_rate` decimal(5,4) NOT NULL DEFAULT '0.0000',
  `team_nett_profit` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '利潤(含團隊)',
  `nett_profit` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '實際淨利潤',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '派發狀態',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`summary_time`,`agent_id`,`shareholder_category_id`),
  KEY `summary_shareholders_summary_time_index` (`summary_time`),
  KEY `summary_shareholders_agent_id_index` (`agent_id`),
  KEY `summary_shareholders_parent_id_index` (`parent_id`),
  KEY `summary_shareholders_hierarchy_path_index` (`hierarchy_path`),
  KEY `summary_shareholders_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summary_transaction_logs`
--

DROP TABLE IF EXISTS `summary_transaction_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_transaction_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '統計時間',
  `member_id` int NOT NULL COMMENT '會員編號',
  `type` int NOT NULL COMMENT '類型',
  `count` int NOT NULL COMMENT '交易次數',
  `point` decimal(18,4) NOT NULL COMMENT '點數',
  `first_transaction_at` timestamp NULL DEFAULT NULL COMMENT '時間內首次交易時間',
  `last_transaction_at` timestamp NULL DEFAULT NULL COMMENT '時間內最後一次交易時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`data_time`,`member_id`,`type`),
  KEY `summary_transaction_logs_data_time_index` (`data_time`),
  KEY `summary_transaction_logs_member_id_index` (`member_id`),
  KEY `summary_transaction_logs_type_index` (`type`),
  KEY `summary_transaction_logs_count_index` (`count`),
  KEY `summary_transaction_logs_point_index` (`point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_notification_reads`
--

DROP TABLE IF EXISTS `system_notification_reads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notification_reads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `last_read_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '會員最後已讀時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_notification_reads_member_id_unique` (`member_id`),
  KEY `system_notification_reads_last_read_time_index` (`last_read_time`),
  KEY `system_notification_reads_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='記錄會員最後的已讀時間 (系統通知)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telegram_broadcast_messages`
--

DROP TABLE IF EXISTS `telegram_broadcast_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `telegram_broadcast_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `brand_id` int NOT NULL DEFAULT '0' COMMENT 'brand id',
  `type` enum('text','image','animation','audio','voice') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訊息內文(多國語系JSON)',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態: 0 發送中, 1 暫停發送, 2 發送完畢',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `telegram_broadcast_messages_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telegram_broadcast_records`
--

DROP TABLE IF EXISTS `telegram_broadcast_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `telegram_broadcast_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `telegram_broadcast_message_id` int NOT NULL COMMENT 'telegram_broadcast_messages.id',
  `member_id` int NOT NULL COMMENT 'members.id',
  `request_content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '請求數據',
  `response_content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '請求回應數據',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態: 0 等待發送, 1 發送中, 2 發送成功, 3 發送失敗',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `telegram_broadcast_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telegram_messages`
--

DROP TABLE IF EXISTS `telegram_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `telegram_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` int NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'ERROR' COMMENT '頻道類型; ERROR, WARN, INFO, SUMMARY, ...',
  `parse_mode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '模式; MARKDOWN, HTML',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_agent_hierarchy`
--

DROP TABLE IF EXISTS `temp_agent_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_agent_hierarchy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `root_agent` int NOT NULL,
  `agent_id` int NOT NULL,
  `agent_id_child` int NOT NULL,
  `agent_name_child` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_nickname_child` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `temp_agent_hierarchy_agent_id_child_index` (`agent_id_child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='馬修測試效能用 20200804';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_four_lottery_tickets`
--

DROP TABLE IF EXISTS `temp_four_lottery_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_four_lottery_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `ticket_number` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int unsigned NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `weeks_of_use` tinyint NOT NULL DEFAULT '1' COMMENT '使用週數; 1:單週, 2:雙週',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_lottery_tickets`
--

DROP TABLE IF EXISTS `temp_lottery_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_lottery_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL DEFAULT '0',
  `ticket_number` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int unsigned NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `weeks_of_use` tinyint(1) DEFAULT '1' COMMENT '使用週數; 1:單週, 2:雙週',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`event_id`,`ticket_number`,`weeks_of_use`),
  KEY `temp_lottery_tickets_status_sort_index` (`status`,`sort`),
  KEY `temp_lottery_tickets_weeks_of_use_index` (`weeks_of_use`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_lottery_tickets1`
--

DROP TABLE IF EXISTS `temp_lottery_tickets1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_lottery_tickets1` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ticket_number` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int unsigned NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_lottery_tickets_4d`
--

DROP TABLE IF EXISTS `temp_lottery_tickets_4d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_lottery_tickets_4d` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `ticket_number` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int unsigned NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版名稱',
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版縮圖',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '紀錄是甚麼顏色的皮',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態:0停用,1正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terra_accounts`
--

DROP TABLE IF EXISTS `terra_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `terra_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `terra_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `terra_accounts_username_index` (`username`),
  KEY `terra_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terra_bet_records`
--

DROP TABLE IF EXISTS `terra_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `terra_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` bigint NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount - BetCoin',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `terra_bet_records_bet_id_unique` (`bet_id`),
  KEY `terra_bet_records_username_index` (`username`),
  KEY `terra_bet_records_game_code_index` (`game_code`),
  KEY `terra_bet_records_bet_time_index` (`bet_time`),
  KEY `terra_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tfgamingsw_accounts`
--

DROP TABLE IF EXISTS `tfgamingsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tfgamingsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '商戶編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tfgamingsw_accounts_username_unique` (`username`),
  KEY `tfgamingsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `tfgamingsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tfgamingsw_bet_records`
--

DROP TABLE IF EXISTS `tfgamingsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tfgamingsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ticketNum from request',
  `reference_bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '關聯交易 id, ticketId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0: 未有結果, -1: 取消, 9: 結算',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tfgamingsw_bet_records_bet_id_unique` (`bet_id`),
  KEY `tfgamingsw_bet_records_username_index` (`username`),
  CONSTRAINT `tfgamingsw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `tfgamingsw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `three_hierarchy_bonus_report`
--

DROP TABLE IF EXISTS `three_hierarchy_bonus_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `three_hierarchy_bonus_report` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `summary_time` datetime NOT NULL COMMENT '時間(日)',
  `rebate_type` int NOT NULL DEFAULT '1' COMMENT '類別 1. 投注額 2. 輸分',
  `reward_type` int NOT NULL DEFAULT '2' COMMENT '1:真金 2:禮碼',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理系統編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `from_member_id` int NOT NULL DEFAULT '0' COMMENT '獎勵來源',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT '遊戲系統編號',
  `game_type_id` int NOT NULL DEFAULT '0' COMMENT '遊戲類別系統編號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額-自己',
  `down_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額-下層',
  `down2_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額-下下層',
  `rebate` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注反水-自己',
  `down_rebate` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注反水-下層',
  `down2_rebate` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注反水-下下層',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `three_hierarchy_bonus_report_summary_time_index` (`summary_time`),
  KEY `three_hierarchy_bonus_report_reward_type_index` (`reward_type`),
  KEY `three_hierarchy_bonus_report_agent_id_index` (`agent_id`),
  KEY `three_hierarchy_bonus_report_member_id_index` (`member_id`),
  KEY `three_hierarchy_bonus_report_from_member_id_index` (`from_member_id`),
  KEY `three_hierarchy_bonus_report_vendor_id_index` (`vendor_id`),
  KEY `three_hierarchy_bonus_report_game_type_id_index` (`game_type_id`),
  KEY `three_hierarchy_bonus_report_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `three_hierarchy_bonus_report_agents`
--

DROP TABLE IF EXISTS `three_hierarchy_bonus_report_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `three_hierarchy_bonus_report_agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `summary_time` datetime NOT NULL COMMENT '時間(日)',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理系統編號',
  `performance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '業績',
  `rebate_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '回水金額',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態:0未發送,1000 已發送',
  `payout_time` datetime DEFAULT NULL COMMENT '發送時間',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `three_hierarchy_bonus_report_agents_summary_time_index` (`summary_time`),
  KEY `three_hierarchy_bonus_report_agents_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `three_hierarchy_proportions`
--

DROP TABLE IF EXISTS `three_hierarchy_proportions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `three_hierarchy_proportions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_group_id` int NOT NULL COMMENT '代理組別ID',
  `type` int NOT NULL DEFAULT '1' COMMENT '類別 1. 投注額 2. 輸分',
  `vendor_id` int NOT NULL COMMENT '遊戲商ID',
  `game_type_id` int NOT NULL COMMENT '遊戲類別',
  `proportion_1` decimal(8,4) NOT NULL COMMENT '自身返利%數',
  `proportion_2` decimal(8,4) NOT NULL COMMENT '上層返利%數',
  `proportion_3` decimal(8,4) NOT NULL COMMENT '上上層返利%數',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `three_hierarchy_proportions_agent_group_id_index` (`agent_group_id`),
  KEY `three_hierarchy_proportions_vendor_id_index` (`vendor_id`),
  KEY `three_hierarchy_proportions_game_type_id_index` (`game_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `three_hierarchy_summary_bonus`
--

DROP TABLE IF EXISTS `three_hierarchy_summary_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `three_hierarchy_summary_bonus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `rebate_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '自身返利',
  `down_rebate_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下層返利',
  `down2_rebate_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下下層返利',
  `bonus_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總獎金',
  `withdraw_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '已提領獎金',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`member_id`),
  KEY `three_hierarchy_summary_bonus_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `three_hierarchy_summary_bonus_agents`
--

DROP TABLE IF EXISTS `three_hierarchy_summary_bonus_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `three_hierarchy_summary_bonus_agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `rebate_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '自身返利',
  `down_rebate_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下層返利',
  `down2_rebate_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下下層返利',
  `bonus_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總獎金',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`agent_id`),
  KEY `three_hierarchy_summary_bonus_agents_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `three_hierarchy_withdraw_logs`
--

DROP TABLE IF EXISTS `three_hierarchy_withdraw_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `three_hierarchy_withdraw_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單單號',
  `type` int NOT NULL DEFAULT '1',
  `member_id` int NOT NULL COMMENT '玩家編號',
  `withdraw_point` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '提線金額',
  `remaining_point` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '剩餘金額',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態:0失敗,1成功',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `three_hierarchy_withdraw_logs_member_id_index` (`member_id`),
  KEY `three_hierarchy_withdraw_logs_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tiktok_accounts`
--

DROP TABLE IF EXISTS `tiktok_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiktok_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `media_id` int NOT NULL COMMENT '媒體ID',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '使用者名稱',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `member_id` int NOT NULL COMMENT '會員ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tiktok_logs`
--

DROP TABLE IF EXISTS `tiktok_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiktok_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL COMMENT '會員ID',
  `session_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'session_id',
  `clientID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'clientID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timezones`
--

DROP TABLE IF EXISTS `timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `timezones` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `time_offset` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '偏移時間ex:UTC+12:00',
  `is_summer` tinyint NOT NULL DEFAULT '0' COMMENT '是否為夏令時',
  `summer_start` date NOT NULL COMMENT '夏令時開始日期',
  `summer_end` date NOT NULL COMMENT '夏令時結束日期',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:停用,1:啟用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top55sw_accounts`
--

DROP TABLE IF EXISTS `top55sw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `top55sw_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `top55sw_accounts_username_unique` (`username`),
  KEY `top55sw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `top55sw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top55sw_bet_records`
--

DROP TABLE IF EXISTS `top55sw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `top55sw_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員編號',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號 playerId',
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單號 betId',
  `vendor_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲 vendor_code',
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲ID',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注額',
  `payout` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注禮碼金額',
  `bet_time` timestamp NOT NULL COMMENT '投注時間',
  `payout_time` timestamp NULL DEFAULT NULL COMMENT '結算時間',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:建立注單,1:已結算',
  `info` json DEFAULT NULL COMMENT '注單信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `top55sw_bet_records_bet_id_unique` (`bet_id`),
  KEY `top55sw_bet_records_created_at_index` (`created_at`),
  KEY `top55sw_bet_records_member_id_index` (`member_id`),
  KEY `top55sw_bet_records_username_index` (`username`),
  KEY `top55sw_bet_records_vendor_code_index` (`vendor_code`),
  KEY `top55sw_bet_records_game_code_index` (`game_code`),
  KEY `top55sw_bet_records_bet_time_index` (`bet_time`),
  KEY `top55sw_bet_records_payout_time_index` (`payout_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `total_bet_record_promotion_wallet_logs`
--

DROP TABLE IF EXISTS `total_bet_record_promotion_wallet_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `total_bet_record_promotion_wallet_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_log_id` bigint NOT NULL DEFAULT '0' COMMENT 'promotion_wallet_logs.id',
  `total_bet_record_id` bigint NOT NULL DEFAULT '0' COMMENT 'total_bet_records.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `total_bet_record_promotion_wallet_logs_transaction_log_id_index` (`transaction_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `total_bet_record_transaction_logs`
--

DROP TABLE IF EXISTS `total_bet_record_transaction_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `total_bet_record_transaction_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_log_id` bigint NOT NULL DEFAULT '0' COMMENT 'transaction_logs.id',
  `total_bet_record_id` bigint NOT NULL DEFAULT '0' COMMENT 'total_bet_records.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `total_bet_record_transaction_logs_transaction_log_id_index` (`transaction_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `total_bet_record_wallet_transaction_logs`
--

DROP TABLE IF EXISTS `total_bet_record_wallet_transaction_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `total_bet_record_wallet_transaction_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_log_id` bigint NOT NULL DEFAULT '0' COMMENT 'wallet_transaction_logs.id',
  `total_bet_record_id` bigint NOT NULL DEFAULT '0' COMMENT 'total_bet_records.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `index_transaction_log_id` (`transaction_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `total_bet_records`
--

DROP TABLE IF EXISTS `total_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `total_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `summary_time` datetime NOT NULL COMMENT '時間',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `vendor_id` int NOT NULL COMMENT '遊戲商系統編號',
  `bet_record_id` bigint unsigned NOT NULL COMMENT 'XXX_bet_record.id',
  `game_id` int NOT NULL COMMENT '遊戲系統編號',
  `reference_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '來源單號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'jackpot',
  `bonus` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'bonus',
  `commission` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼',
  `valid_bet_rate` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '轉換比例',
  `bak` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '備用1',
  `bak1` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '備用2',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `payout_time` datetime NOT NULL COMMENT '派彩、結算時間(UTC)',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '51' COMMENT '更新者ID',
  PRIMARY KEY (`id`,`vendor_id`),
  UNIQUE KEY `unique_index` (`vendor_id`,`bet_record_id`),
  KEY `total_bet_records_summary_time_index` (`summary_time`),
  KEY `total_bet_records_member_id_index` (`member_id`),
  KEY `total_bet_records_vendor_id_index` (`vendor_id`),
  KEY `total_bet_records_game_id_index` (`game_id`),
  KEY `total_bet_records_bet_time_index` (`bet_time`),
  KEY `total_bet_records_payout_time_index` (`payout_time`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='存放所有遊戲商的投注記錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_log_agents`
--

DROP TABLE IF EXISTS `transaction_log_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_log_agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `from_agent_id` int NOT NULL COMMENT '發送者的代理系統編號',
  `to_agent_id` int NOT NULL COMMENT '接收者的代理系統編號',
  `type` int NOT NULL COMMENT '類型1:開分, 2:洗分, 3:代理模式獎勵(全民代理三層返水), 4:代理傭金派發, 5:分桶獎勵',
  `order_id` int NOT NULL DEFAULT '0' COMMENT 'withdrawal_order_agents.id',
  `amount` decimal(18,4) NOT NULL COMMENT '金額',
  `rolling_chip_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼',
  `from_limit_of_credit` decimal(18,4) NOT NULL COMMENT '發送者剩餘額度',
  `from_used_credit` decimal(18,4) NOT NULL COMMENT '發送者已使用額度',
  `to_limit_of_credit` decimal(18,4) NOT NULL COMMENT '接收者剩餘額度',
  `to_used_credit` decimal(18,4) NOT NULL COMMENT '接收者已使用額度',
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '實際操作者(有可能是子帳號)',
  `platform` int NOT NULL DEFAULT '1' COMMENT '操作平台1:客服，2:代理後台',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態0:失敗，1:成功',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `transaction_log_agents_from_agent_id_index` (`from_agent_id`),
  KEY `transaction_log_agents_to_agent_id_index` (`to_agent_id`),
  KEY `transaction_log_agents_type_index` (`type`),
  KEY `transaction_log_agents_order_id_index` (`order_id`),
  KEY `transaction_log_agents_operator_index` (`operator`),
  KEY `transaction_log_agents_status_index` (`status`),
  KEY `transaction_log_agents_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_log_histories`
--

DROP TABLE IF EXISTS `transaction_log_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_log_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '單號',
  `agent_id` int DEFAULT '0' COMMENT '代理系統編號(同一個玩家可能由不同代理開洗分)',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `vendor_id` int DEFAULT '0' COMMENT '遊戲商系統編號',
  `order_id` int DEFAULT '0' COMMENT '訂單系統編號',
  `type` int NOT NULL COMMENT '類型1:平台轉入遊戲商,2:遊戲商轉入平台,3:訂單儲值,4:開分,5:洗分,6:發紅包,7:領紅包,8:紅包取消(用戶手動),9:紅包退還(系統自動),10:開分(贈點),11:拒絕洗分,12:退還洗分,13:活動獎勵,14:補帳,15:登入活動獎勵,16:回收登入活動獎勵,17:全民代理,18: v-jackpot,19:首充活動返利,20:註冊送,21:綁定手機送,22:預付網扣款,23:預付網退款,24:充值活動返利,25:每日充值活動返利,26:邀請玩家獎勵活動返利,30:w-jackpot,31:W-Jackpot 6d獎勵\\n101~500:活動獎勵(101:slot comptition)',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '平台金額',
  `tax` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '稅收',
  `vendor_point` decimal(18,4) NOT NULL COMMENT 'Vendor金額',
  `rate` decimal(10,4) NOT NULL COMMENT '平台點數與遊戲點數的比例',
  `before_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '变更前数点',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '平台餘額',
  `vendor_balance` decimal(18,4) DEFAULT '0.0000' COMMENT 'Vendor餘額',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態編號',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `checksum` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '校驗碼',
  `result` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '結果',
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作者',
  `platform` int NOT NULL DEFAULT '0' COMMENT '操作平台0:前台，1:客服，2:代理後台',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `transaction_log_histories_created_at_agent_id_type_status_index` (`created_at`,`agent_id`,`type`,`status`),
  KEY `transaction_log_histories_created_at_member_id_type_status_index` (`created_at`,`member_id`,`type`,`status`),
  KEY `transaction_log_histories_transaction_no_index` (`transaction_no`),
  KEY `transaction_log_histories_agent_id_index` (`agent_id`),
  KEY `transaction_log_histories_member_id_index` (`member_id`),
  KEY `transaction_log_histories_order_id_index` (`order_id`),
  KEY `transaction_log_histories_type_index` (`type`),
  KEY `transaction_log_histories_remark_index` (`remark`),
  KEY `transaction_log_histories_operator_index` (`operator`),
  KEY `transaction_log_histories_created_at_index` (`created_at`),
  KEY `transaction_log_histories_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_log_total_bet_records`
--

DROP TABLE IF EXISTS `transaction_log_total_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_log_total_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_log_id` bigint NOT NULL DEFAULT '0' COMMENT 'transaction_logs.id',
  `total_bet_record_id` bigint NOT NULL DEFAULT '0' COMMENT 'total_bet_records.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `transaction_log_total_bet_records_transaction_log_id_index` (`transaction_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_logs`
--

DROP TABLE IF EXISTS `transaction_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '單號',
  `agent_id` int DEFAULT '0' COMMENT '代理系統編號(同一個玩家可能由不同代理開洗分)',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `vendor_id` int DEFAULT '0' COMMENT '遊戲商系統編號',
  `order_id` int DEFAULT '0' COMMENT '訂單系統編號',
  `type` int NOT NULL COMMENT '類型1:平台轉入遊戲商,2:遊戲商轉入平台,3:訂單儲值,4:開分,5:洗分,6:發紅包,7:領紅包,8:紅包取消(用戶手動),9:紅包退還(系統自動),10:開分(贈點),11:拒絕洗分,12:退還洗分,13:活動獎勵,14:補帳,15:登入活動獎勵,16:回收登入活動獎勵,17:全民代理,18: v-jackpot,19:首充活動返利,20:註冊送,21:綁定手機送,22:預付網扣款,23:預付網退款,24:充值活動返利,25:每日充值活動返利,26:邀請玩家獎勵活動返利,30:w-jackpot,31:W-Jackpot 6d獎勵\\n101~500:活動獎勵(101:slot comptition)',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '平台金額',
  `tax` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '稅收',
  `vendor_point` decimal(18,4) NOT NULL COMMENT 'Vendor金額',
  `rate` decimal(10,4) NOT NULL COMMENT '平台點數與遊戲點數的比例',
  `before_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '变更前数点',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '平台餘額',
  `vendor_balance` decimal(18,4) DEFAULT '0.0000' COMMENT 'Vendor餘額',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態編號',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `checksum` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '校驗碼',
  `result` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '結果',
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作者',
  `platform` int NOT NULL DEFAULT '0' COMMENT '操作平台0:前台，1:客服，2:代理後台',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `transaction_logs_member_id_type_status_created_at_index` (`member_id`,`type`,`status`,`created_at`),
  KEY `transaction_logs_transaction_no_index` (`transaction_no`),
  KEY `transaction_logs_member_id_index` (`member_id`),
  KEY `transaction_logs_order_id_index` (`order_id`),
  KEY `transaction_logs_type_index` (`type`),
  KEY `transaction_logs_remark_index` (`remark`),
  KEY `transaction_logs_operator_index` (`operator`),
  KEY `transaction_logs_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfer_limit_logs`
--

DROP TABLE IF EXISTS `transfer_limit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_limit_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT '代理群組編號',
  `amount` decimal(18,4) NOT NULL COMMENT '變更限額',
  `before_limit` decimal(18,4) NOT NULL COMMENT '變更前限額',
  `after_limit` decimal(18,4) NOT NULL COMMENT '變更後限額',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `transfer_limit_logs_agent_group_id_index` (`agent_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfer_limits`
--

DROP TABLE IF EXISTS `transfer_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_limits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT '代理群組編號',
  `limit` decimal(18,4) NOT NULL COMMENT '限額',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `transfer_limits_agent_group_id_index` (`agent_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tthsw_accounts`
--

DROP TABLE IF EXISTS `tthsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tthsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Auth Token',
  `session_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Session Token',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tthsw_accounts_auth_token_unique` (`auth_token`),
  UNIQUE KEY `tthsw_accounts_session_token_unique` (`session_token`),
  KEY `tthsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `tthsw_accounts_member_id_index` (`member_id`),
  KEY `tthsw_accounts_username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tthsw_bet_records`
--

DROP TABLE IF EXISTS `tthsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tthsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `bet_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單唯一ID',
  `game_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲代碼',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注額',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `bonus` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '額外獎金',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩池獎金',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注禮碼金額',
  `reserve_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '預留金額',
  `reserve_used` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '已使用的預留金額',
  `bet_time` datetime NOT NULL COMMENT '投注時間',
  `payout_time` datetime DEFAULT NULL COMMENT '結算時間',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:建立注單,1:進行中,2:退款,3:已結算',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT 'Response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tthsw_bet_records_bet_id_unique` (`bet_id`),
  KEY `tthsw_bet_records_vendor_info_id_index` (`vendor_info_id`),
  KEY `tthsw_bet_records_username_index` (`username`),
  KEY `tthsw_bet_records_game_code_index` (`game_code`),
  KEY `tthsw_bet_records_bet_time_index` (`bet_time`),
  KEY `tthsw_bet_records_payout_time_index` (`payout_time`),
  KEY `tthsw_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tthsw_deal_records`
--

DROP TABLE IF EXISTS `tthsw_deal_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tthsw_deal_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `game_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲代碼',
  `game_round_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Round Id',
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Transaction Id',
  `transaction_date` datetime NOT NULL COMMENT 'TransactionDate',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '金額',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT 'Type',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '請求動作',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT 'Response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_game_round_transaction_type` (`game_round_id`,`transaction_id`,`type`),
  KEY `tthsw_deal_records_game_code_index` (`game_code`),
  KEY `tthsw_deal_records_game_round_id_index` (`game_round_id`),
  KEY `tthsw_deal_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unlimit_bonus_report_paids`
--

DROP TABLE IF EXISTS `unlimit_bonus_report_paids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unlimit_bonus_report_paids` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `member_id` int NOT NULL COMMENT '玩家ID',
  `summary_date` datetime NOT NULL COMMENT '統計時間',
  `performance_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '績效',
  `bonus_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎勵',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態; 0:未發放, 1:已發放',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`member_id`,`summary_date`),
  KEY `unlimit_bonus_report_paids_member_id_index` (`member_id`),
  KEY `unlimit_bonus_report_paids_summary_date_index` (`summary_date`),
  KEY `unlimit_bonus_report_paids_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unlimit_bonusreport`
--

DROP TABLE IF EXISTS `unlimit_bonusreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unlimit_bonusreport` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '玩家編號',
  `summary_date` datetime NOT NULL COMMENT '時間(日)',
  `performance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '業績-自己',
  `performance_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '業績-直屬',
  `performance_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '業績-團隊',
  `bonus_itself` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎金-自身回水',
  `bonus_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎金-直屬',
  `bonus_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎金-團隊',
  `bonus_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '該級距獎勵金額-參考unlimit_systemrate',
  `correction` tinyint NOT NULL DEFAULT '0' COMMENT '0:否, 1:是',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `unlimit_bonusreport_member_id_index` (`member_id`),
  KEY `unlimit_bonusreport_summary_date_index` (`summary_date`),
  KEY `unlimit_bonusreport_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unlimit_bonusreport_agents`
--

DROP TABLE IF EXISTS `unlimit_bonusreport_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unlimit_bonusreport_agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理編號',
  `summary_date` datetime NOT NULL COMMENT '時間(日)',
  `performance_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '業績-直屬',
  `performance_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '業績-團隊',
  `bonus_direct` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎金-直屬',
  `bonus_team` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎金-團隊',
  `bonus_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '該級距獎勵金額-參考unlimit_systemrate',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態: 1000:success',
  `payout_time` datetime DEFAULT NULL COMMENT '發放時間',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '備註',
  `correction` tinyint NOT NULL DEFAULT '0' COMMENT '0:否, 1:是',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `unlimit_bonusreport_agents_agent_id_index` (`agent_id`),
  KEY `unlimit_bonusreport_agents_summary_date_index` (`summary_date`),
  KEY `unlimit_bonusreport_agents_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unlimit_summary_bonus`
--

DROP TABLE IF EXISTS `unlimit_summary_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unlimit_summary_bonus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT '玩家編號',
  `performance_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '業績金額',
  `bonus_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '未提領獎金',
  `withdraw_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '已提領獎金',
  `flow_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總流水',
  `itself_bonus_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '自身回水獎金',
  `itself_withdraw_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '已提領自身回水獎金',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unlimit_summary_bonus_member_id_unique` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unlimit_systemrate`
--

DROP TABLE IF EXISTS `unlimit_systemrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unlimit_systemrate` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理ID',
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT '無限代群組ID',
  `level` int NOT NULL DEFAULT '0' COMMENT '無限代理等級',
  `min_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '該級距金額下限',
  `max_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '該級距金額上限',
  `bonus_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '該級距獎勵金額',
  `rebate_rate` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '返傭比例',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unlimit_withdrawlog`
--

DROP TABLE IF EXISTS `unlimit_withdrawlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unlimit_withdrawlog` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單單號',
  `member_id` int unsigned NOT NULL COMMENT '玩家編號',
  `reward_point` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '申請前結算金額',
  `withdrawn_point` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '已提領金額',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '提領金額',
  `itself_reward_point` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '申請前自身回水結算金額',
  `itself_withdrawn_point` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '已提領自身回水金額',
  `itself_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '提領自身回水金額',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '支付類型。 0:未發放, 1:已發放、2:拒絕',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `admin` int DEFAULT NULL COMMENT '操作人員',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_access_tokens`
--

DROP TABLE IF EXISTS `user_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_access_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `user_id` int NOT NULL COMMENT '帳號系統編號(User)',
  `token` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `expire_date` datetime NOT NULL COMMENT '過期日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_language_mappings`
--

DROP TABLE IF EXISTS `user_language_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_language_mappings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `user_id` int NOT NULL COMMENT '帳號系統編號(User)',
  `country_id` int NOT NULL COMMENT '國家系統編號(Country)',
  `language_id` int NOT NULL COMMENT '語系系統編號(Language)',
  `sort` datetime NOT NULL COMMENT '排序(由大至小)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_logs`
--

DROP TABLE IF EXISTS `user_login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `user_id` int NOT NULL COMMENT '管理者帳號系統編號(User)',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'IP地址',
  `status` tinyint NOT NULL COMMENT '狀態：0失敗，1成功',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_menus`
--

DROP TABLE IF EXISTS `user_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '檔案名稱',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '選單功能名稱',
  `parent` int NOT NULL COMMENT '選單系統編號，0為root menu',
  `url` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '選單網址',
  `symbol` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '選單符號',
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作動作',
  `status` int NOT NULL COMMENT '狀態 0:隱藏,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_menus_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `user_id` int NOT NULL COMMENT '帳號系統編號(User)',
  `menu_id` int NOT NULL COMMENT '選單系統編號(Menu)',
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '可操作功能：view,add,edit,delete(逗號分隔)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `parent` int NOT NULL COMMENT '上層管理員系統編號(User)',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `nickname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '暱稱',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '電子信箱',
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '聯繫號碼',
  `timezone_id` int DEFAULT NULL COMMENT '時區系統編號',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '帳號狀態 0:未認證,1:正常,2:鎖定',
  `last_login` datetime DEFAULT NULL COMMENT '最後登入時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uuslotsw_accounts`
--

DROP TABLE IF EXISTS `uuslotsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `uuslotsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuslotsw_accounts_username_unique` (`username`),
  KEY `uuslotsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `uuslotsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uuslotsw_bet_records`
--

DROP TABLE IF EXISTS `uuslotsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `uuslotsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id',
  `reference_bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'game result trans id',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號',
  `status` enum('bet','result','rollback','bonus','jackpot') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'bet: 下注, result: 派彩, rollback: 取消下注, bonus: 紅包, jackpot: 大獎',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '合法下注金額',
  `payout` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `result_infos` json DEFAULT NULL COMMENT 'game result 詳細資訊',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuslotsw_bet_records_bet_id_unique` (`bet_id`),
  UNIQUE KEY `uuslotsw_bet_records_reference_bet_id_unique` (`reference_bet_id`),
  KEY `uuslotsw_bet_records_username_index` (`username`),
  KEY `uuslotsw_bet_records_status_index` (`status`),
  KEY `uuslotsw_bet_records_payout_time_index` (`payout_time`),
  CONSTRAINT `uuslotsw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `uuslotsw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v8_accounts`
--

DROP TABLE IF EXISTS `v8_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `v8_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `username_modified` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號(含前綴',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `v8_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `v8_accounts_username_index` (`username`),
  KEY `v8_accounts_username_modified_index` (`username_modified`),
  KEY `v8_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v8_bet_records`
--

DROP TABLE IF EXISTS `v8_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `v8_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '開獎時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount - BetCoin',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `v8_bet_records_bet_id_unique` (`bet_id`),
  KEY `v8_bet_records_username_index` (`username`),
  KEY `v8_bet_records_game_code_index` (`game_code`),
  KEY `v8_bet_records_bet_time_index` (`bet_time`),
  KEY `v8_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `validate_tokens`
--

DROP TABLE IF EXISTS `validate_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `validate_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'agents.id',
  `member_id` int NOT NULL COMMENT '會員系統編號(members)',
  `type_id` tinyint NOT NULL DEFAULT '0' COMMENT '類型(十位數-1:資料驗證, 2:忘記密碼, 3:找回密碼, 4:洗分驗證, 5:支付密碼, 6:忘記支付密碼, 7:洗分驗證, 8:一頁註冊,9:變更手機或email，個位數-1:手機2:Email)',
  `info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '驗證的資料',
  `info_2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其他資訊',
  `token` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `expire_date` datetime NOT NULL COMMENT '過期日期',
  `status` tinyint(1) NOT NULL COMMENT '狀態',
  `times` int NOT NULL DEFAULT '1' COMMENT '簡訊發送次數',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `validate_tokens_agent_id_index` (`agent_id`),
  KEY `validate_tokens_member_id_index` (`member_id`),
  KEY `validate_tokens_token_index` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_api_errors`
--

DROP TABLE IF EXISTS `vendor_api_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_api_errors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0',
  `vendor_id` int NOT NULL DEFAULT '0',
  `vendor_info_id` int NOT NULL DEFAULT '0',
  `vendor_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商名稱',
  `vendor_info_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商戶名稱',
  `request_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日誌追蹤碼',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'API 請求 URL',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'API 用途',
  `error_message` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '錯誤訊息',
  `error_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '錯誤代碼',
  `request_data` text COLLATE utf8mb4_unicode_ci COMMENT '請求的資料',
  `response_data` text COLLATE utf8mb4_unicode_ci COMMENT '遊戲方回應的資料',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '請求的 IP 地址',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_api_errors_member_id_index` (`member_id`),
  KEY `vendor_api_errors_vendor_id_index` (`vendor_id`),
  KEY `vendor_api_errors_vendor_info_id_index` (`vendor_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_customized_items`
--

DROP TABLE IF EXISTS `vendor_customized_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_customized_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT '代理組別vendor_customize_group_id',
  `item_type` tinyint NOT NULL DEFAULT '0' COMMENT '入口類型: 0 : 遊戲商, 1 : 遊戲, 2 : 類型, 3 : 站內連結',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商ID',
  `game_id` int NOT NULL DEFAULT '0' COMMENT '遊戲ID',
  `type_id` int NOT NULL DEFAULT '0' COMMENT '遊戲類型ID',
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '連結',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲商名稱',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲商圖檔路徑',
  `front_page_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲商前置頁圖片',
  `app_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲商圖檔路徑',
  `is_new` tinyint DEFAULT NULL COMMENT '新遊戲標記',
  `is_hot` tinyint DEFAULT NULL COMMENT '熱門遊戲標記',
  `only_one_game` tinyint DEFAULT NULL COMMENT '獨立入口',
  `status` tinyint DEFAULT NULL COMMENT '前台顯示狀態 0: 關閉, 1: 正常, 2: coming soon',
  `sorts` int NOT NULL DEFAULT '0' COMMENT '排序權重',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '操作人員',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`agent_group_id`,`item_type`,`vendor_id`,`game_id`,`type_id`,`path`),
  KEY `vendor_customized_items_agent_group_id_index` (`agent_group_id`),
  KEY `vendor_customized_items_vendor_id_index` (`vendor_id`),
  KEY `vendor_customized_items_sorts_index` (`sorts`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_hour_records`
--

DROP TABLE IF EXISTS `vendor_hour_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_hour_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `date_hour` datetime NOT NULL COMMENT '時間',
  `member_id` int NOT NULL COMMENT '會員系統編號',
  `vendor_id` int NOT NULL COMMENT '營運商編號',
  `game_id` int NOT NULL DEFAULT '0' COMMENT '遊戲編號',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注額',
  `bet_received` int NOT NULL DEFAULT '0' COMMENT '己兌換的投注額',
  `win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '勝分',
  `win_received` int NOT NULL DEFAULT '0' COMMENT '己兌換的贏分',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏',
  `win_lose_received` int NOT NULL DEFAULT '0' COMMENT '己兌換的輸贏',
  `last_bet_time` datetime DEFAULT NULL COMMENT '最後投注時間',
  `valid_bet_rate` decimal(4,2) DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`date_hour`,`member_id`,`vendor_id`,`game_id`),
  KEY `vendor_hour_records_date_hour_index` (`date_hour`),
  KEY `vendor_hour_records_member_id_index` (`member_id`),
  KEY `vendor_hour_records_vendor_id_index` (`vendor_id`),
  KEY `vendor_hour_records_game_id_index` (`game_id`),
  KEY `vendor_hour_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_images`
--

DROP TABLE IF EXISTS `vendor_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT '代理組別編號',
  `vendor_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商編號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商名稱',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商圖片',
  `app_icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商app的圖示',
  `valid_bet_rate` decimal(4,2) DEFAULT NULL COMMENT '有效投注轉換比例',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `vendor_images_vendor_id_index` (`vendor_id`),
  KEY `vendor_images_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_info_games`
--

DROP TABLE IF EXISTS `vendor_info_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_info_games` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '商戶資料ID',
  `game_id` int NOT NULL COMMENT '遊戲ID',
  `join_bet_event` tinyint NOT NULL DEFAULT '0' COMMENT '是否可參加投注額活動(0:不可，1:可以)',
  `join_win_event` tinyint NOT NULL DEFAULT '0' COMMENT '是否可參加贏分活動(0:不可，1:可以)',
  `is_new` tinyint NOT NULL DEFAULT '0' COMMENT '是否為新遊戲(0:否,1:是)',
  `is_hot` tinyint NOT NULL DEFAULT '0' COMMENT '是否為熱門遊戲(0:否,1:是)',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `valid_bet_rate` decimal(4,2) NOT NULL DEFAULT '1.00' COMMENT '有效投注轉換比例',
  `calc_flow_limit` tinyint DEFAULT '1' COMMENT '是否計算稽核流水',
  `status` tinyint NOT NULL COMMENT '狀態(0停用，1啟用)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`vendor_info_id`,`game_id`),
  KEY `vendor_info_games_vendor_info_id_index` (`vendor_info_id`),
  KEY `vendor_info_games_game_id_index` (`game_id`),
  KEY `vendor_info_games_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_info_last_end_times`
--

DROP TABLE IF EXISTS `vendor_info_last_end_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_info_last_end_times` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '廠商系統商戶編號',
  `last_end_time` datetime NOT NULL COMMENT '最後取得時間',
  `last_log` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '最後取得log',
  `last_error` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '最後取得錯誤',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_infos`
--

DROP TABLE IF EXISTS `vendor_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_infos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '方便識別的名稱',
  `type` tinyint NOT NULL COMMENT '遊戲商環境，0:測試，1:正式',
  `vendor_id` int NOT NULL COMMENT '遊戲商系統編號',
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣種代碼',
  `rate` decimal(11,5) NOT NULL DEFAULT '1.00000' COMMENT '轉換率',
  `transfer_min_amount` decimal(11,5) DEFAULT '0.01000',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '連接資訊',
  `prepared_account_number` int NOT NULL DEFAULT '100' COMMENT '預備帳號數量',
  `account_prefix` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳號前綴',
  `cost` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態，0:停用、1:啟用',
  `rolling_chip_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '禮碼開關 1:開啟 0:關閉',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  `deposit_limit` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '存款限制, 0 = 無限制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_languages`
--

DROP TABLE IF EXISTS `vendor_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商編號',
  `third_party_code` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '三方代碼',
  `language_id` int NOT NULL COMMENT '語言編號; 0為預設',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '語言代碼',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`third_party_code`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_limits`
--

DROP TABLE IF EXISTS `vendor_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_limits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `vendor_id` int NOT NULL COMMENT '遊戲商系統編號(Vendors)',
  `curency_id` int NOT NULL DEFAULT '0' COMMENT '幣別系統編號(currencies)',
  `game_type_id` int NOT NULL DEFAULT '0' COMMENT '遊戲類別系統編號(game_types)',
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名稱',
  `min_amount` decimal(18,4) NOT NULL COMMENT '最小下注',
  `max_amount` decimal(18,4) NOT NULL COMMENT '最大下注',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='遊戲商限紅';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_maintenances`
--

DROP TABLE IF EXISTS `vendor_maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_maintenances` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_id` int NOT NULL COMMENT '遊戲商名稱',
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '關閉類型，1:遊戲跟錢包都關閉、2:關閉遊戲、3：關閉錢包',
  `start_time` datetime NOT NULL COMMENT '開始時間',
  `end_time` datetime NOT NULL COMMENT '結束時間',
  `agent_id` int NOT NULL DEFAULT '1' COMMENT '代理ID',
  `exclude_agent_id` int NOT NULL DEFAULT '0' COMMENT '排除代理ID',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態0:停用1:啟用',
  `memo` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `vendor_maintenances_vendor_id_index` (`vendor_id`),
  KEY `vendor_maintenances_start_time_index` (`start_time`),
  KEY `vendor_maintenances_end_time_index` (`end_time`),
  KEY `vendor_maintenances_agent_id_index` (`agent_id`),
  KEY `vendor_maintenances_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_request_fails`
--

DROP TABLE IF EXISTS `vendor_request_fails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_request_fails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_id` int NOT NULL COMMENT '遊戲商系統編號',
  `general_agent_id` int NOT NULL DEFAULT '1' COMMENT '總代理ID編號',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態，0:停止轉帳, 1: 設定維護, 2:恢復轉帳, ',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `vendor_request_fails_vendor_id_index` (`vendor_id`),
  KEY `vendor_request_fails_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商名稱',
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商表格前綴',
  `tname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'agent後台會用tname來找對應的xxx_accounts',
  `third_party_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '三方代碼; 如果是聚合遊戲商, 就用同一個代碼',
  `rate` decimal(11,5) NOT NULL COMMENT '平台點數與遊戲點數的比例',
  `percentage` decimal(11,5) NOT NULL COMMENT '拆帳比例',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '遊戲商圖片',
  `app_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲商app的圖示',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'API使用資訊',
  `is_free` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否為免盤費商戶',
  `is_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否顯示新遊戲商標籤0:不顯示,1:顯示',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否顯示熱門遊戲商標籤0:不顯示,1:顯示',
  `need_login` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需另外登入0:不需要1:需要',
  `only_one_game` tinyint(1) DEFAULT '0' COMMENT '只有一款遊戲',
  `is_single_wallet` tinyint DEFAULT '0' COMMENT '是否為單一錢包遊戲',
  `is_slow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '遊戲商API回應是否較慢，0:否、1:是',
  `event_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可以參加鎖分活動0:不可，1:可以',
  `show_on_mobile` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Mobile版是否顯示0:不顯示，1:顯示',
  `show_on_pc` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'PC版是否顯示0:不顯示，1:顯示',
  `show_on_app` tinyint NOT NULL DEFAULT '0' COMMENT 'APP版是否顯示 0:不顯示，1顯示',
  `open_window` tinyint NOT NULL DEFAULT '0' COMMENT '是否另開視窗; 0:不另開, 1:另開',
  `summary_daily` tinyint NOT NULL DEFAULT '1' COMMENT 'summary時間; 0:不計算, 1:每小時, 2:每天',
  `whitelist` text COLLATE utf8mb4_unicode_ci COMMENT '白名單; ip1,ip2,ip3,ip4,...',
  `valid_bet_rate` decimal(4,2) NOT NULL DEFAULT '1.00' COMMENT '有效投注轉換比例',
  `calc_flow_limit` tinyint DEFAULT '1' COMMENT '是否計算稽核流水',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `memo` text COLLATE utf8mb4_unicode_ci,
  `calc_time_zone` tinyint NOT NULL DEFAULT '8' COMMENT '後台跟三方後台的計算時區',
  `unbind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可以解綁; 0:否, 1:是',
  `sort` int DEFAULT NULL COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_name_unique` (`name`),
  KEY `vendors_valid_bet_rate_index` (`valid_bet_rate`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `agent_group_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'agent_groups.id',
  `agent_id` int NOT NULL COMMENT '代理id',
  `ios_version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1.0.0' COMMENT 'ios版本',
  `ios_link` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ios下載連結',
  `android_version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1.0.0' COMMENT 'android版本',
  `android_link` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'android下載連結',
  `type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '類型; 1:真實版本號, 2:臨時版本號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vip_content_names`
--

DROP TABLE IF EXISTS `vip_content_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vip_content_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL COMMENT '語系系統編號',
  `vip_content_id` int NOT NULL DEFAULT '0' COMMENT 'VIP系統編號',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'VIP名稱',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '圖片',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `vip_content_names_vip_content_id_index` (`vip_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vip_content_rewards`
--

DROP TABLE IF EXISTS `vip_content_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vip_content_rewards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vip_content_id` int NOT NULL DEFAULT '0' COMMENT 'VIP系統編號',
  `vip_reward_id` int NOT NULL DEFAULT '0' COMMENT 'VIP獎勵系統編號',
  `type` int NOT NULL DEFAULT '0' COMMENT '分數類別;0:固定金額(point)、1:%數(point_percentage)、2:額外返水(member_vip_prizes.point)',
  `max_point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '金額上限',
  `point_type` int NOT NULL DEFAULT '0' COMMENT '分數類別;1:平台點數、2:禮碼、3:實體獎勵',
  `condition` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '條件',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '獎項金額',
  `point_percentage` decimal(8,4) NOT NULL DEFAULT '0.0000' COMMENT '分數%數',
  `expired_hour` int NOT NULL DEFAULT '0' COMMENT '幾小時候過期;0:無期限、-1:發獎當天後過期',
  `flow_limit_multiple` int NOT NULL DEFAULT '0' COMMENT '稽核流水倍數',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:關閉 1:開啟',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `vip_content_rewards_vip_content_id_index` (`vip_content_id`),
  KEY `vip_content_rewards_vip_reward_id_index` (`vip_reward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vip_content_withdrawal_types`
--

DROP TABLE IF EXISTS `vip_content_withdrawal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vip_content_withdrawal_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vip_content_id` int NOT NULL DEFAULT '0' COMMENT 'VIP系統編號',
  `withdrawal_type_id` int NOT NULL DEFAULT '0' COMMENT '銀行系統編號',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未領取 1:已領取',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `vip_content_withdrawal_types_vip_content_id_index` (`vip_content_id`),
  KEY `vip_content_withdrawal_types_withdrawal_type_id_index` (`withdrawal_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vip_contents`
--

DROP TABLE IF EXISTS `vip_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vip_contents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int NOT NULL DEFAULT '0' COMMENT '代理系統編號',
  `level` int NOT NULL DEFAULT '0' COMMENT '代理系統編號',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'VIP名稱',
  `target_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '所需充值金額',
  `keep_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '保級金額',
  `withdrawal_times_limit` int NOT NULL DEFAULT '0' COMMENT '提現次數',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '圖片',
  `withdrawal_amount_limit` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '當日提款上限',
  `tax` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '稅收',
  `vip_channel` tinyint NOT NULL DEFAULT '0' COMMENT '支持VIP通道',
  `is_downgrade` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否會被降級',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `vip_contents_agent_id_index` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vip_flow_limits`
--

DROP TABLE IF EXISTS `vip_flow_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vip_flow_limits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL DEFAULT '0',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `deposit_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '充值金額',
  `flow_limit` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '稽核流水金額',
  `reach` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '達成金額',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '達成金額',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未達成 1:已達成',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `vip_flow_limits_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vip_rebate_proportions`
--

DROP TABLE IF EXISTS `vip_rebate_proportions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vip_rebate_proportions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vip_content_id` int NOT NULL COMMENT 'vip_contents.id',
  `game_type_id` int NOT NULL COMMENT 'game_types.id',
  `proportion` decimal(8,4) NOT NULL DEFAULT '0.0000' COMMENT '返水比例',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vip_rebate_summary_records`
--

DROP TABLE IF EXISTS `vip_rebate_summary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vip_rebate_summary_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `summary_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '計算時間區間-開始',
  `summary_end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '計算時間區間-結束',
  `member_id` int NOT NULL DEFAULT '0' COMMENT 'members.id',
  `game_type_id` int NOT NULL DEFAULT '0' COMMENT 'game_types.id',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金額',
  `proportion` decimal(8,4) NOT NULL DEFAULT '0.0000' COMMENT '返水比例',
  `rebate_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '返水金額',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `vip_rebate_summary_records_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vip_reward_payout_logs`
--

DROP TABLE IF EXISTS `vip_reward_payout_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vip_reward_payout_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vip_reward_id` int NOT NULL COMMENT 'vip_rewards.id',
  `summary_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '計算時間區間-開始',
  `summary_end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '計算時間區間-結束',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態:0:未發放,1:已發放',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vip_rewards`
--

DROP TABLE IF EXISTS `vip_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vip_rewards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '獎勵名稱',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未領取 1:已領取',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vplay_accounts`
--

DROP TABLE IF EXISTS `vplay_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vplay_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'vplay帳號',
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '玩家帳號',
  `balance` decimal(18,5) NOT NULL DEFAULT '0.00000' COMMENT 'vplay餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  `username_modified` varchar(30) COLLATE utf8mb4_unicode_ci GENERATED ALWAYS AS (concat(`username`,_utf8mb4'@vworld')) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vplay_accounts_username_unique` (`username`),
  KEY `vplay_accounts_member_id_index` (`member_id`),
  KEY `vplay_accounts_username_modified_index` (`username_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vplay_bet_records`
--

DROP TABLE IF EXISTS `vplay_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vplay_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `WinloseID` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單號',
  `MemberAccount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家名稱',
  `AgentAccount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '代理商名稱',
  `GameTypeID` int NOT NULL COMMENT '遊戲類型代碼',
  `GameTypeName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲類型名稱',
  `GameID` int NOT NULL COMMENT '遊戲代碼',
  `GameENAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲名稱-英文',
  `GameNameZHCN` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲名稱-簡單',
  `Bet` decimal(13,7) NOT NULL DEFAULT '0.0000000' COMMENT '投注額',
  `WinLose` decimal(13,7) NOT NULL DEFAULT '0.0000000' COMMENT '輸贏金額',
  `GongPoint` decimal(13,7) NOT NULL DEFAULT '0.0000000' COMMENT '服務費',
  `BetLM` decimal(13,7) NOT NULL DEFAULT '0.0000000' COMMENT '押注幸運金',
  `WinLoseLM` decimal(13,7) NOT NULL DEFAULT '0.0000000' COMMENT '輸贏幸運金',
  `GetJPMoney` decimal(13,7) NOT NULL DEFAULT '0.0000000' COMMENT 'JP幸運金',
  `BetTime` datetime NOT NULL COMMENT '押注時間(+8時區)',
  `utc_bet_time` datetime NOT NULL COMMENT '押注時間(+0時區)',
  `ReCalcuTime` datetime NOT NULL COMMENT '結算時間(+8時區)',
  `utc_recalcu_time` datetime NOT NULL COMMENT '結算時間(+0時區)',
  `BetState` int NOT NULL COMMENT '狀態(0:未結算,1:已結算,2:退單)',
  `Memo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vplay_bet_records_winloseid_unique` (`WinloseID`),
  KEY `vplay_bet_records_memberaccount_index` (`MemberAccount`),
  KEY `vplay_bet_records_gametypename_index` (`GameTypeName`),
  KEY `vplay_bet_records_gameid_index` (`GameID`),
  KEY `vplay_bet_records_utc_bet_time_index` (`utc_bet_time`),
  KEY `vplay_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vplussw_accounts`
--

DROP TABLE IF EXISTS `vplussw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vplussw_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '商戶編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `ext_uid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '三方帳號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vplussw_accounts_username_unique` (`username`),
  UNIQUE KEY `vplussw_accounts_ext_uid_unique` (`ext_uid`),
  KEY `vplussw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `vplussw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vplussw_bet_records`
--

DROP TABLE IF EXISTS `vplussw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vplussw_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `bet_time` datetime NOT NULL,
  `payout_time` datetime NOT NULL,
  `infos` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vplussw_bet_records_bet_id_unique` (`bet_id`),
  KEY `vplussw_bet_records_username_index` (`username`),
  KEY `vplussw_bet_records_payout_time_index` (`payout_time`),
  KEY `reference_bet_id_index` (`reference_bet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vpower_accounts`
--

DROP TABLE IF EXISTS `vpower_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpower_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號帳號',
  `uid` int NOT NULL DEFAULT '0' COMMENT 'vpower uid',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `vpower_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `vpower_accounts_username_index` (`username`),
  KEY `vpower_accounts_uid_index` (`uid`),
  KEY `vpower_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vpower_bet_records`
--

DROP TABLE IF EXISTS `vpower_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpower_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `uniqleid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單編號(唯一值)',
  `uid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gameid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲ID',
  `tableid` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '桌子ID',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家名稱',
  `pay` decimal(18,4) NOT NULL COMMENT '下注金額',
  `win` decimal(18,4) DEFAULT NULL COMMENT '派彩金額',
  `startscore` decimal(18,4) NOT NULL COMMENT '遊戲開始金額',
  `finalscore` decimal(18,4) NOT NULL COMMENT '遊戲結束金額',
  `time` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '時間',
  `utc_time` datetime NOT NULL COMMENT '時間(UTC)',
  `origin_utc_time` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`time`,`uid`,`uniqleid`,`startscore`,`finalscore`),
  KEY `vpower_bet_records_utc_time_username_index` (`utc_time`,`username`),
  KEY `vpower_bet_records_uniqleid_index` (`uniqleid`),
  KEY `vpower_bet_records_gameid_index` (`gameid`),
  KEY `vpower_bet_records_username_index` (`username`),
  KEY `vpower_bet_records_utc_time_index` (`utc_time`),
  KEY `vpower_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vpowersw_accounts`
--

DROP TABLE IF EXISTS `vpowersw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpowersw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vpowersw_accounts_username_unique` (`username`),
  KEY `vpowersw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `vpowersw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vpowersw_bet_records`
--

DROP TABLE IF EXISTS `vpowersw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpowersw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id, gameRoundId from request',
  `reference_bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '關聯交易 id',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `status` tinyint NOT NULL,
  `type` int NOT NULL,
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vpowersw_bet_records_bet_id_unique` (`bet_id`),
  KEY `vpowersw_bet_records_username_index` (`username`),
  CONSTRAINT `vpowersw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `vpowersw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vspoker_accounts`
--

DROP TABLE IF EXISTS `vspoker_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vspoker_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  `username_modified` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vspoker_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `vspoker_accounts_username_index` (`username`),
  KEY `vspoker_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vspoker_bet_records`
--

DROP TABLE IF EXISTS `vspoker_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vspoker_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额; BetCoin',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额; WinAmount - BetCoin',
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vspoker_bet_records_bet_id_unique` (`bet_id`),
  KEY `vspoker_bet_records_username_index` (`username`),
  KEY `vspoker_bet_records_game_code_index` (`game_code`),
  KEY `vspoker_bet_records_bet_time_index` (`bet_time`),
  KEY `vspoker_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vsport_accounts`
--

DROP TABLE IF EXISTS `vsport_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vsport_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `vsport_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `vsport_accounts_username_index` (`username`),
  KEY `vsport_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vsport_bet_records`
--

DROP TABLE IF EXISTS `vsport_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vsport_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `created_time` datetime NOT NULL COMMENT '押注時間(utc)',
  `bet_time` datetime NOT NULL COMMENT '派彩時間(utc)',
  `work_date` datetime NOT NULL COMMENT '後台對帳時間(utc)',
  `ticket_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vsport_bet_records_bet_id_unique` (`bet_id`),
  KEY `vsport_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `w_jackpot_histories`
--

DROP TABLE IF EXISTS `w_jackpot_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_jackpot_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `w_jackpot_id` int NOT NULL DEFAULT '0' COMMENT 'agents.id',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'agents.id',
  `total_pool_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總彩池數量',
  `total_ticket` int DEFAULT NULL COMMENT '發出獎券數',
  `total_bonus` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '發出獎金',
  `prizes` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `w_jackpot_histories_w_jackpot_id_index` (`w_jackpot_id`),
  KEY `w_jackpot_histories_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='W-Jackpot活動明細';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `w_jackpot_reward_item_names`
--

DROP TABLE IF EXISTS `w_jackpot_reward_item_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_jackpot_reward_item_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `w_jackpot_reward_item_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prize_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '獎項名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `w_jackpot_reward_item_names_language_id_index` (`language_id`),
  KEY `w_jackpot_reward_item_names_w_jackpot_reward_item_id_index` (`w_jackpot_reward_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='W-Jackpot奖励项目-多语言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `w_jackpot_reward_items`
--

DROP TABLE IF EXISTS `w_jackpot_reward_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_jackpot_reward_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `prize_content_id` int NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint NOT NULL DEFAULT '0',
  `type` tinyint DEFAULT '1' COMMENT '獎項類型; 1: 獎金, 2:獎品',
  `bonus` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `prize_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '獎項名稱',
  `memo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '狀態; 1:啟用, 0:停用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='w-jackpot奖励项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `w_jackpot_tickets`
--

DROP TABLE IF EXISTS `w_jackpot_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_jackpot_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `w_jackpot_id` int NOT NULL COMMENT 'w_jackpots.id',
  `member_id` int NOT NULL COMMENT '玩家ID',
  `ticket_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '抽獎券號碼',
  `reward_item_id` int NOT NULL DEFAULT '0' COMMENT '獎項ID',
  `reward_item_ids` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '獎項ID',
  `info` json DEFAULT NULL,
  `point` decimal(18,4) DEFAULT NULL COMMENT '獎勵金額',
  `type` int NOT NULL DEFAULT '0' COMMENT '中獎結果; 0:未中 , 1:中獎, 2:派發中(因wjackpot可重複獲獎, 所以增加這狀態)',
  `status` int NOT NULL DEFAULT '0' COMMENT '提領結果; 0:未領 , 1:已領取',
  `time` datetime DEFAULT NULL COMMENT '領取時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `w_jackpot_tickets_w_jackpot_id_index` (`w_jackpot_id`),
  KEY `w_jackpot_tickets_member_id_index` (`member_id`),
  KEY `w_jackpot_tickets_reward_item_id_index` (`reward_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='wjackpot抽獎券';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `w_jackpots`
--

DROP TABLE IF EXISTS `w_jackpots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_jackpots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL DEFAULT '0',
  `event_detail_id` int NOT NULL DEFAULT '0' COMMENT 'event_details.id',
  `no` int NOT NULL DEFAULT '0',
  `draw_time` datetime DEFAULT NULL,
  `draw_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `draw_number_2` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `draw_number_3` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `draw_number_4` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `draw_number_5` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `w_jackpots_event_id_index` (`event_id`),
  KEY `w_jackpots_event_detail_id_index` (`event_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='W-Jackpot活動明細';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wallet_transaction_log_agents`
--

DROP TABLE IF EXISTS `wallet_transaction_log_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transaction_log_agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `wallet_type_id` int NOT NULL DEFAULT '0' COMMENT '錢包類別ID',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'agents.id',
  `type` int NOT NULL DEFAULT '0' COMMENT '類別',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '金額',
  `before_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '變更前金額',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '變更後金額',
  `operator` int NOT NULL DEFAULT '0' COMMENT 'agents.id(操作人)',
  `operator_before_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '變更前金額(操作人)',
  `operator_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '變更後金額(操作人)',
  `remark` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態; 0: 失敗, 1: 成功',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `wallet_transaction_log_agents_wallet_type_id_index` (`wallet_type_id`),
  KEY `wallet_transaction_log_agents_agent_id_index` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wallet_transaction_logs`
--

DROP TABLE IF EXISTS `wallet_transaction_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transaction_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '單號',
  `wallet_type_id` int NOT NULL DEFAULT '0' COMMENT '錢包類別ID',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'agents.id',
  `member_id` int NOT NULL DEFAULT '0' COMMENT 'members.id',
  `vendor_id` int NOT NULL DEFAULT '0' COMMENT 'vendors.id',
  `order_id` int NOT NULL DEFAULT '0' COMMENT 'orders.id',
  `type` int NOT NULL DEFAULT '0' COMMENT '類別',
  `operator_before_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '操作者變更前點數(代理)',
  `operator_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '操作者餘額(代理)',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '平台金額',
  `vendor_point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '遊戲商金額',
  `tax` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '稅收',
  `rate` decimal(10,4) NOT NULL DEFAULT '1.0000' COMMENT '平台點數與遊戲點數的比例',
  `before_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '變更前點數',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '平台餘額',
  `vendor_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '遊戲商餘額',
  `status` int NOT NULL DEFAULT '0' COMMENT '狀態; 0: 失敗, 1000: 成功',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '備註',
  `checksum` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '校驗碼',
  `result` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '結果',
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作者',
  `platform` int NOT NULL DEFAULT '0' COMMENT '操作平台0:前台，1:客服，2:代理後台',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `wallet_transaction_logs_transaction_no_index` (`transaction_no`),
  KEY `wallet_transaction_logs_wallet_type_id_index` (`wallet_type_id`),
  KEY `wallet_transaction_logs_member_id_index` (`member_id`),
  KEY `wallet_transaction_logs_order_id_index` (`order_id`),
  KEY `wallet_transaction_logs_type_index` (`type`),
  KEY `wallet_transaction_logs_status_index` (`status`),
  KEY `wallet_transaction_logs_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wbet_accounts`
--

DROP TABLE IF EXISTS `wbet_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wbet_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `vendor_uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲商的玩家 UID-依據遊戲商需求',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家密碼-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家登入用 Token-依據遊戲商需求',
  `admin` int NOT NULL DEFAULT '0' COMMENT '數據操作人員的管理者系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wbet_accounts_username_unique` (`username`),
  KEY `wbet_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `wbet_accounts_member_id_index` (`member_id`),
  KEY `wbet_accounts_vendor_username_index` (`vendor_username`),
  KEY `wbet_accounts_vendor_uid_index` (`vendor_uid`),
  KEY `wbet_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wbet_bet_records`
--

DROP TABLE IF EXISTS `wbet_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wbet_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注單唯一Id, ThemeId',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩、結算時間(UTC)',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未結算,1:已結算',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲 ID-依據遊戲商需求',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼金額-依據遊戲商需求',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '訪問投注單的 Session Token 或 ID 簽章-依據遊戲商需求',
  `info` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wbet_bet_records_bet_id_unique` (`bet_id`),
  KEY `wbet_bet_records_vendor_username_index` (`vendor_username`),
  KEY `wbet_bet_records_bet_time_index` (`bet_time`),
  KEY `wbet_bet_records_payout_time_index` (`payout_time`),
  KEY `wbet_bet_records_session_token_index` (`session_token`),
  KEY `wbet_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wcasino_accounts`
--

DROP TABLE IF EXISTS `wcasino_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wcasino_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `vendor_uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲商的玩家 UID-依據遊戲商需求',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家密碼-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家登入用 Token-依據遊戲商需求',
  `admin` int NOT NULL DEFAULT '0' COMMENT '數據操作人員的管理者系統編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wcasino_accounts_username_unique` (`username`),
  KEY `wcasino_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `wcasino_accounts_member_id_index` (`member_id`),
  KEY `wcasino_accounts_vendor_username_index` (`vendor_username`),
  KEY `wcasino_accounts_vendor_uid_index` (`vendor_uid`),
  KEY `wcasino_accounts_session_token_index` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wcasino_bet_records`
--

DROP TABLE IF EXISTS `wcasino_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wcasino_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注單唯一Id, ThemeId',
  `vendor_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `bet_time` datetime NOT NULL COMMENT '投注時間(UTC)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效投注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩、結算時間(UTC)',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:未結算,1:已結算',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '遊戲 ID-依據遊戲商需求',
  `rolling_chip` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '禮碼金額-依據遊戲商需求',
  `jackpot` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '派彩金额-依據遊戲商需求',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '訪問投注單的 Session Token 或 ID 簽章-依據遊戲商需求',
  `info` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wcasino_bet_records_bet_id_unique` (`bet_id`),
  KEY `wcasino_bet_records_vendor_info_id_index` (`vendor_info_id`),
  KEY `wcasino_bet_records_vendor_username_index` (`vendor_username`),
  KEY `wcasino_bet_records_bet_time_index` (`bet_time`),
  KEY `wcasino_bet_records_payout_time_index` (`payout_time`),
  KEY `wcasino_bet_records_session_token_index` (`session_token`),
  KEY `wcasino_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wcasinosw_accounts`
--

DROP TABLE IF EXISTS `wcasinosw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wcasinosw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wcasinosw_accounts_username_unique` (`username`),
  KEY `wcasinosw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `wcasinosw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wcasinosw_bet_records`
--

DROP TABLE IF EXISTS `wcasinosw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wcasinosw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id, serialnumber from request',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0: 未有結果, -1: 取消, 9: 結算',
  `resettlement_count` int unsigned NOT NULL DEFAULT '0' COMMENT '重新結算次數',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wcasinosw_bet_records_bet_id_unique` (`bet_id`),
  KEY `wcasinosw_bet_records_username_index` (`username`),
  CONSTRAINT `wcasinosw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `wcasinosw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wcasinosw_notify_records`
--

DROP TABLE IF EXISTS `wcasinosw_notify_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wcasinosw_notify_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id, serialnumber from request',
  `notify_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通知 id, notifyid from request',
  `type` tinyint NOT NULL COMMENT '請求類型, type from request',
  `is_done` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否完成, 0: 否, 1: 是',
  `is_rollback` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否為撤單, 0: 否, 1: 是',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '金額',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wcasinosw_notify_records_notify_id_unique` (`notify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wesw_accounts`
--

DROP TABLE IF EXISTS `wesw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wesw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wesw_accounts_username_unique` (`username`),
  KEY `wesw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `wesw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wesw_bet_records`
--

DROP TABLE IF EXISTS `wesw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wesw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id, gameRoundId from request',
  `ref_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '與遊戲商核對時的交易編號',
  `game_round_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲回合id',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `status` int NOT NULL COMMENT '1:debit,2:credit,3:rollback,4:resettlement',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易類型(細節查看遊戲商文件)',
  `game_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'TP01',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '有效下注金額',
  `payout` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime DEFAULT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json NOT NULL COMMENT '詳細資訊',
  `result_infos` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wesw_bet_records_bet_id_unique` (`bet_id`),
  UNIQUE KEY `wesw_bet_records_ref_id_unique` (`ref_id`),
  KEY `wesw_bet_records_username_index` (`username`),
  CONSTRAINT `wesw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `wesw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wfsw_accounts`
--

DROP TABLE IF EXISTS `wfsw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wfsw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wfsw_accounts_username_unique` (`username`),
  KEY `wfsw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `wfsw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wfsw_bet_records`
--

DROP TABLE IF EXISTS `wfsw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wfsw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易 id, gameRoundId from request',
  `result_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易 id, gameRoundId from request',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `status` int NOT NULL COMMENT '1:bet,2:result,3:rollback,4:bouns,5:jackpot',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `payout` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '贏得金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `result_infos` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`bet_id`),
  KEY `wfsw_bet_records_bet_id_index` (`bet_id`),
  KEY `wfsw_bet_records_result_id_index` (`result_id`),
  KEY `wfsw_bet_records_username_index` (`username`),
  KEY `wfsw_bet_records_bet_time_index` (`bet_time`),
  KEY `wfsw_bet_records_payout_time_index` (`payout_time`),
  CONSTRAINT `wfsw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `wfsw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `withdrawal_orders`
--

DROP TABLE IF EXISTS `withdrawal_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bank_id` int NOT NULL DEFAULT '0' COMMENT 'banks.id',
  `bank_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '銀行名稱',
  `bank_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '銀行代碼',
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳戶名稱',
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳戶帳號',
  `agent_group_id` int NOT NULL DEFAULT '0' COMMENT '金流商戶資料編號',
  `agent_id` int NOT NULL DEFAULT '0' COMMENT 'withdrawal_order_agents.id',
  `member_id` int NOT NULL COMMENT '帳號系統編號(Members)',
  `amount` decimal(18,4) NOT NULL COMMENT '金額',
  `rate` decimal(14,9) NOT NULL DEFAULT '1.000000000' COMMENT '匯率(2025/05/05提升至9位)',
  `point` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '平台點數',
  `tax` decimal(11,5) NOT NULL DEFAULT '0.00000' COMMENT '手續費',
  `third_party_order_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方金流訂單編號',
  `third_party_response` text COLLATE utf8mb4_unicode_ci COMMENT '三方API的response',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態 0:訂單建立,1:待審核,2:拒絕,3:等待付款,4:已付款,9:退回,21:代付請求中,22:代付處理中,24:已付款(代付),29:代付回應失敗',
  `check_time` datetime DEFAULT NULL COMMENT '審核時間',
  `audit_time` datetime DEFAULT NULL,
  `audit_operator` int DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL COMMENT '付款時間',
  `payment_operator` int DEFAULT NULL,
  `memo` text COLLATE utf8mb4_unicode_ci COMMENT '備註',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  `operator` int NOT NULL DEFAULT '0' COMMENT '審核人',
  `change_logs` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改歷程',
  PRIMARY KEY (`id`),
  KEY `withdrawal_orders_bank_id_index` (`bank_id`),
  KEY `withdrawal_orders_agent_group_id_index` (`agent_group_id`),
  KEY `withdrawal_orders_agent_id_index` (`agent_id`),
  KEY `withdrawal_orders_member_id_index` (`member_id`),
  KEY `withdrawal_orders_status_index` (`status`),
  KEY `withdrawal_orders_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `withdrawal_payout_records`
--

DROP TABLE IF EXISTS `withdrawal_payout_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal_payout_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `cash_flow_id` int NOT NULL DEFAULT '0' COMMENT 'cash_flow_id_支付廠商ID(每家會有固定編號)',
  `agent_cash_flow_id` int NOT NULL DEFAULT '0' COMMENT 'agent_cash_flows.id',
  `withdrawal_order_id` int NOT NULL COMMENT '提款單ID',
  `transaction_no` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '我方系統單號',
  `third_party_transaction_no` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方系統單號',
  `result_amount` decimal(18,4) NOT NULL COMMENT '三方回應的金額',
  `result_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方回應的交易狀態',
  `is_success_payout` int NOT NULL DEFAULT '0' COMMENT '是否定義為成功單',
  `transaction_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '三方回應的交易狀態',
  `sign` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '加密簽名',
  `payout_order_request_body` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '代付請求_request資訊',
  `payout_order_response` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '代付請求_response資訊',
  `callback_request_body` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始request',
  `info_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `callback_time` datetime DEFAULT NULL COMMENT '回調時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `withdrawal_payout_records_withdrawal_order_id_index` (`withdrawal_order_id`),
  KEY `withdrawal_payout_records_third_party_transaction_no_index` (`third_party_transaction_no`),
  KEY `withdrawal_payout_records_is_success_payout_index` (`is_success_payout`),
  KEY `withdrawal_payout_records_callback_time_index` (`callback_time`),
  KEY `withdrawal_payout_records_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `withdrawal_type_names`
--

DROP TABLE IF EXISTS `withdrawal_type_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal_type_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `withdrawal_type_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名稱',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `withdrawal_types`
--

DROP TABLE IF EXISTS `withdrawal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名稱',
  `status` tinyint NOT NULL COMMENT '狀態',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wm_accounts`
--

DROP TABLE IF EXISTS `wm_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wm_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號帳號',
  `user_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '避免同一個USERNAME重覆建立的編號(如果需要创建两次, 回应将会是相同, 但 WAPI 仅在第一次使用时生成新玩家。)',
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '使用者授權碼',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `wm_accounts_user_id_index` (`user_id`),
  KEY `wm_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wm_bet_records`
--

DROP TABLE IF EXISTS `wm_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wm_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `round_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注單號',
  `game_identity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲識別碼',
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣別',
  `wallet_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '區段/錢包類型',
  `external_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '外部編號',
  `external_user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '外部用戶識別',
  `user_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '會員授權碼',
  `session_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '區段授權碼',
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注單下注時間',
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注單結算時間',
  `utc_start_time` datetime DEFAULT NULL COMMENT '注單下注時間(UTC+0)',
  `utc_end_time` datetime DEFAULT NULL COMMENT '注單結算時間(UTC+0)',
  `initial_balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '錢包起始餘額',
  `finial_balance` decimal(18,4) DEFAULT '0.0000' COMMENT '錢包最後餘額',
  `bet_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總投注額',
  `win_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '總贏分',
  `jack_pot_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩池投注額',
  `jack_pot_win` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '彩池總贏分',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `wm_bet_records_round_id_index` (`round_id`),
  KEY `wm_bet_records_game_identity_index` (`game_identity`),
  KEY `wm_bet_records_external_user_id_index` (`external_user_id`),
  KEY `wm_bet_records_utc_start_time_index` (`utc_start_time`),
  KEY `wm_bet_records_utc_end_time_index` (`utc_end_time`),
  KEY `wm_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wm_daily_wins`
--

DROP TABLE IF EXISTS `wm_daily_wins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wm_daily_wins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '系統編號',
  `player_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家名稱(Wallet平台)',
  `player_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '使用者授權碼',
  `skin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '代理/下線',
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幣別',
  `cash_bet` decimal(18,4) NOT NULL COMMENT '現金總投注額',
  `cash_win` decimal(18,4) DEFAULT NULL COMMENT '現金總贏分',
  `bonus_bet` decimal(18,4) NOT NULL COMMENT '紅利總投注額',
  `bonus_win` decimal(18,4) DEFAULT NULL COMMENT '紅利總贏分',
  `free_round_bet` decimal(18,4) NOT NULL COMMENT '免費回合總投注額',
  `free_round_win` decimal(18,4) DEFAULT NULL COMMENT '免費回合總贏分',
  `jack_pot_bet` decimal(18,4) NOT NULL COMMENT '彩池總投注額',
  `jack_pot_win` decimal(18,4) DEFAULT NULL COMMENT '彩池總贏分',
  `gamerounds` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '現金與紅利總注單量',
  `freerounds` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '免費回合總注單量',
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '時間(+0)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wmlivesw_accounts`
--

DROP TABLE IF EXISTS `wmlivesw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wmlivesw_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `nickname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲商的玩家帳號名',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wmlivesw_accounts_username_unique` (`username`),
  KEY `wmlivesw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `wmlivesw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='完美真人遊戲帳號';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wmlivesw_bet_records`
--

DROP TABLE IF EXISTS `wmlivesw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wmlivesw_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注单号',
  `member_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '會員帳號 ID',
  `account_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲帳號 ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'gid 遊戲類別編號',
  `bet_amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'bet 下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'validbet 有效下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'winLoss 輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_deal_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下注 deal_id (多筆)',
  `result_deal_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '派彩 deal_id (輸錢無派彩返回 -1)',
  `bet_time` timestamp NULL DEFAULT NULL COMMENT 'betTime 下注時間',
  `settlement_time` timestamp NULL DEFAULT NULL COMMENT 'settime 結算時間',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '我方處理狀態, 0:未處理, 1:完成, 2:失敗',
  `raw_data` json DEFAULT NULL COMMENT '三方原始數據',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wmlivesw_bet_records_bet_id_unique` (`bet_id`),
  KEY `wmlivesw_bet_records_member_id_index` (`member_id`),
  KEY `wmlivesw_bet_records_account_id_index` (`account_id`),
  KEY `wmlivesw_bet_records_username_index` (`username`),
  KEY `wmlivesw_bet_records_status_index` (`status`),
  CONSTRAINT `wmlivesw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `wmlivesw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='完美真人注單紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wmlivesw_deal_records`
--

DROP TABLE IF EXISTS `wmlivesw_deal_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wmlivesw_deal_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dealid 交易單號',
  `deal_code` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'code 加扣点类型 0:电子游戏结算 1:加点 2:扣点 3:重对加点 4:重对扣点 5:重新派彩',
  `member_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '會員帳號 ID',
  `account_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲帳號 ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲帳號',
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'money 加(扣)该会员的点数',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'gtype 遊戲類別編號',
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注單編號',
  `request_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'requestDate 三方請求時間',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '我方處理狀態, 0:未處理, 1:交易成功, 2:交易失敗(餘額不足)',
  `transaction_log_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易紀錄編號',
  `is_settlement` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0:未結算, 1:結算',
  `is_rollback` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0:未回滾, 1:已回滾',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `raw_data` json DEFAULT NULL COMMENT '三方原始數據',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wmlivesw_deal_records_deal_id_unique` (`deal_id`),
  KEY `wmlivesw_deal_records_member_id_index` (`member_id`),
  KEY `wmlivesw_deal_records_account_id_index` (`account_id`),
  KEY `wmlivesw_deal_records_username_index` (`username`),
  KEY `wmlivesw_deal_records_bet_id_index` (`bet_id`),
  KEY `wmlivesw_deal_records_status_index` (`status`),
  KEY `wmlivesw_deal_records_is_settlement_index` (`is_settlement`),
  KEY `wmlivesw_deal_records_is_rollback_index` (`is_rollback`),
  CONSTRAINT `wmlivesw_deal_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `wmlivesw_accounts` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='完美真人交易紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wudisw_accounts`
--

DROP TABLE IF EXISTS `wudisw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wudisw_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL COMMENT '商戶編號',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理員編號',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wudisw_accounts_username_unique` (`username`),
  KEY `wudisw_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `wudisw_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wudisw_bet_records`
--

DROP TABLE IF EXISTS `wudisw_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wudisw_bet_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ticketNum from request',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '遊戲編號, gameId from request',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0: 未有結果, -1: 取消, 9: 結算',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金額',
  `valid_bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '真實下注金額',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金額',
  `rolling_chips` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '使用禮碼',
  `bet_time` datetime NOT NULL COMMENT '下注時間',
  `payout_time` datetime NOT NULL COMMENT '派彩/取消/bonus時間, result time',
  `infos` json DEFAULT NULL COMMENT '詳細資訊',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wudisw_bet_records_bet_id_unique` (`bet_id`),
  KEY `wudisw_bet_records_username_foreign` (`username`),
  CONSTRAINT `wudisw_bet_records_username_foreign` FOREIGN KEY (`username`) REFERENCES `wudisw_accounts` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xe88_accounts`
--

DROP TABLE IF EXISTS `xe88_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xe88_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商資訊編號',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'xe88帳號',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'xe88餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xe88_accounts_username_unique` (`username`),
  KEY `xe88_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xe88_bet_records`
--

DROP TABLE IF EXISTS `xe88_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xe88_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '玩家帳號',
  `game_id` int DEFAULT NULL COMMENT '遊戲ID',
  `game_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲名稱',
  `bet` decimal(13,7) NOT NULL COMMENT '投注金額',
  `win` decimal(13,7) NOT NULL COMMENT '贏得金額',
  `begin_money` decimal(13,7) NOT NULL COMMENT '下注前餘額',
  `end_money` decimal(13,7) NOT NULL COMMENT '下注後餘額',
  `game_log` text COLLATE utf8mb4_unicode_ci COMMENT '遊戲記錄',
  `log_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原始投注時間',
  `utc_log_time` datetime DEFAULT NULL COMMENT 'UTC投注時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `xe88_bet_records_username_index` (`username`),
  KEY `xe88_bet_records_game_id_index` (`game_id`),
  KEY `xe88_bet_records_begin_money_index` (`begin_money`),
  KEY `xe88_bet_records_log_time_index` (`log_time`),
  KEY `xe88_bet_records_utc_log_time_index` (`utc_log_time`),
  KEY `xe88_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xe88_daily_wins`
--

DROP TABLE IF EXISTS `xe88_daily_wins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xe88_daily_wins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `date` date DEFAULT NULL COMMENT '日期',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '玩家帳號',
  `bets` decimal(13,7) NOT NULL COMMENT '總投注金額',
  `wins` decimal(13,7) NOT NULL COMMENT '總贏得金額',
  `turnover` decimal(13,7) NOT NULL COMMENT '進出金額',
  `houseearnings` decimal(13,7) NOT NULL COMMENT '總輸贏',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0' COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`date`,`username`),
  KEY `xe88_daily_wins_date_index` (`date`),
  KEY `xe88_daily_wins_username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ybet_accounts`
--

DROP TABLE IF EXISTS `ybet_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ybet_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ybet_accounts_vendor_info_id_index` (`vendor_info_id`),
  KEY `ybet_accounts_username_index` (`username`),
  KEY `ybet_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ybet_bet_records`
--

DROP TABLE IF EXISTS `ybet_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ybet_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '注单唯一Id, ThemeId',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號',
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏ID',
  `bet_time` datetime NOT NULL COMMENT '投注時間(utc)',
  `settle_time` datetime NOT NULL COMMENT '開獎時間(utc)',
  `bet` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '下注金额',
  `win_lose` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '輸贏金额',
  `info` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'response data',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `is_endround` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ybet_bet_records_bet_id_unique` (`bet_id`),
  KEY `ybet_bet_records_bet_time_index` (`bet_time`),
  KEY `ybet_bet_records_settle_time_index` (`settle_time`),
  KEY `ybet_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ygg_accounts`
--

DROP TABLE IF EXISTS `ygg_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ygg_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `vendor_info_id` int NOT NULL DEFAULT '0' COMMENT '遊戲商設定編號',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家帳號帳號',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '玩家密碼',
  `balance` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '玩家餘額',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '會員系統編號',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態 0:關閉,1:正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `ygg_accounts_username_index` (`username`),
  KEY `ygg_accounts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ygg_bet_records`
--

DROP TABLE IF EXISTS `ygg_bet_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ygg_bet_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `record_id` int NOT NULL COMMENT '投注記錄流水號',
  `reference` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '投注記錄編號',
  `topOrg` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'TopOrg帳戶',
  `org` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Org組織帳戶',
  `loginname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '玩家帳號',
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '幣種',
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '類型',
  `amount` decimal(18,4) DEFAULT NULL COMMENT '投注金額',
  `beforeAmount` decimal(18,4) DEFAULT NULL COMMENT '投注前餘額',
  `afterAmount` decimal(18,4) DEFAULT NULL COMMENT '投注後餘額',
  `result` decimal(18,4) DEFAULT NULL COMMENT '輸贏',
  `gameName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲名稱',
  `DCGameID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遊戲ID',
  `createTime` datetime NOT NULL COMMENT '投注時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `is_endround` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`reference`,`type`),
  KEY `ygg_bet_records_record_id_index` (`record_id`),
  KEY `ygg_bet_records_reference_index` (`reference`),
  KEY `ygg_bet_records_loginname_index` (`loginname`),
  KEY `ygg_bet_records_type_index` (`type`),
  KEY `ygg_bet_records_gamename_index` (`gameName`),
  KEY `ygg_bet_records_dcgameid_index` (`DCGameID`),
  KEY `ygg_bet_records_createtime_index` (`createTime`),
  KEY `ygg_bet_records_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `yxfs`
--

DROP TABLE IF EXISTS `yxfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `yxfs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `order_id` int NOT NULL COMMENT '訂單系統編號',
  `api_amount` decimal(10,2) NOT NULL COMMENT 'API發起金額',
  `real_amount` decimal(10,2) DEFAULT NULL COMMENT '實際支付金額',
  `url` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '呼叫地址',
  `bank_card_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '銀行卡號',
  `bank_user_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '銀行卡姓名',
  `state` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '狀態文字',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '備註',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '狀態1:待處理,2:處理中,3:成功,4:操作失敗,5:操作取消',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `admin` int NOT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-04-01  3:42:02

insert into migrations (id, migration, batch)
values  (1, '2025_06_11_104138_create_event_payout_cancels_table', 1),
        (2, '2025_06_19_091321_create_ace333_accounts_table', 1),
        (3, '2025_06_19_091321_create_ace333_bet_records_table', 1),
        (4, '2025_06_19_091321_create_ace333sw_accounts_table', 1),
        (5, '2025_06_19_091321_create_ace333sw_bet_records_table', 1),
        (6, '2025_06_19_091321_create_acewin_accounts_table', 1),
        (7, '2025_06_19_091321_create_acewin_bet_records_table', 1),
        (8, '2025_06_19_091321_create_adjustment_logs_table', 1),
        (9, '2025_06_19_091321_create_adjustment_type_names_table', 1),
        (10, '2025_06_19_091321_create_adjustment_types_table', 1),
        (11, '2025_06_19_091321_create_advertise_exclude_agents_table', 1),
        (12, '2025_06_19_091321_create_advertise_images_table', 1),
        (13, '2025_06_19_091321_create_advertise_languages_table', 1),
        (14, '2025_06_19_091321_create_advertisement_path_names_table', 1),
        (15, '2025_06_19_091321_create_advertisement_paths_table', 1),
        (16, '2025_06_19_091321_create_advertisements_table', 1),
        (17, '2025_06_19_091321_create_advertises_table', 1),
        (18, '2025_06_19_091321_create_aes_accounts_table', 1),
        (19, '2025_06_19_091321_create_aes_bet_records_table', 1),
        (20, '2025_06_19_091321_create_ag_accounts_table', 1),
        (21, '2025_06_19_091321_create_ag_bet_records_table', 1),
        (22, '2025_06_19_091321_create_agent_access_tokens_table', 1),
        (23, '2025_06_19_091321_create_agent_announcements_table', 1),
        (24, '2025_06_19_091321_create_agent_authentications_table', 1),
        (25, '2025_06_19_091321_create_agent_cash_flow_order_types_table', 1),
        (26, '2025_06_19_091321_create_agent_cash_flows_table', 1),
        (27, '2025_06_19_091321_create_agent_customized_settings_table', 1),
        (28, '2025_06_19_091321_create_agent_domains_table', 1),
        (29, '2025_06_19_091321_create_agent_games_table', 1),
        (30, '2025_06_19_091321_create_agent_group_game_tags_table', 1),
        (31, '2025_06_19_091321_create_agent_group_permissions_table', 1),
        (32, '2025_06_19_091321_create_agent_group_tags_table', 1),
        (33, '2025_06_19_091321_create_agent_groups_table', 1),
        (34, '2025_06_19_091321_create_agent_hierarchys_table', 1),
        (35, '2025_06_19_091321_create_agent_login_ip_logs_table', 1),
        (36, '2025_06_19_091321_create_agent_login_logs_table', 1),
        (37, '2025_06_19_091321_create_agent_medias_table', 1),
        (38, '2025_06_19_091321_create_agent_menus_table', 1),
        (39, '2025_06_19_091321_create_agent_migrate_logs_table', 1),
        (40, '2025_06_19_091321_create_agent_operate_general_logs_table', 1),
        (41, '2025_06_19_091321_create_agent_operate_logs_table', 1),
        (42, '2025_06_19_091321_create_agent_permissions_table', 1),
        (43, '2025_06_19_091321_create_agent_personal_settings_table', 1),
        (44, '2025_06_19_091321_create_agent_proportions_table', 1),
        (45, '2025_06_19_091321_create_agent_setting_defines_table', 1),
        (46, '2025_06_19_091321_create_agent_share_logs_table', 1),
        (47, '2025_06_19_091321_create_agent_status_logs_table', 1),
        (48, '2025_06_19_091321_create_agent_templates_table', 1),
        (49, '2025_06_19_091321_create_agent_temps_table', 1),
        (50, '2025_06_19_091321_create_agent_validation_items_table', 1),
        (51, '2025_06_19_091321_create_agent_vendor_categories_table', 1),
        (52, '2025_06_19_091321_create_agent_vendor_disables_table', 1),
        (53, '2025_06_19_091321_create_agent_vendors_table', 1),
        (54, '2025_06_19_091321_create_agent_wallets_table', 1),
        (55, '2025_06_19_091321_create_agent_withdraw_confirms_table', 1),
        (56, '2025_06_19_091321_create_agents_table', 1),
        (57, '2025_06_19_091321_create_allbet_accounts_table', 1),
        (58, '2025_06_19_091321_create_allbet_bet_records_table', 1),
        (59, '2025_06_19_091321_create_analytics_table', 1),
        (60, '2025_06_19_091321_create_announcement_messages_participants_table', 1),
        (61, '2025_06_19_091321_create_announcement_messages_reads_table', 1),
        (62, '2025_06_19_091321_create_announcement_messages_table', 1),
        (63, '2025_06_19_091321_create_announcements_table', 1),
        (64, '2025_06_19_091321_create_astar_accounts_table', 1),
        (65, '2025_06_19_091321_create_astar_bet_records_table', 1),
        (66, '2025_06_19_091321_create_baison_accounts_table', 1),
        (67, '2025_06_19_091321_create_baison_bet_records_table', 1),
        (68, '2025_06_19_091321_create_bank_account_edit_logs_table', 1),
        (69, '2025_06_19_091321_create_bank_accounts_table', 1),
        (70, '2025_06_19_091321_create_bank_names_table', 1),
        (71, '2025_06_19_091321_create_bank_order_types_table', 1),
        (72, '2025_06_19_091321_create_bank_transaction_logs_table', 1),
        (73, '2025_06_19_091321_create_banks_table', 1),
        (74, '2025_06_19_091321_create_banner_types_table', 1),
        (75, '2025_06_19_091321_create_banners_table', 1),
        (76, '2025_06_19_091321_create_baracayfish_bet_records_table', 1),
        (77, '2025_06_19_091321_create_bind_rewards_table', 1),
        (78, '2025_06_19_091321_create_bng_accounts_table', 1),
        (79, '2025_06_19_091321_create_bng_bet_records_table', 1),
        (80, '2025_06_19_091321_create_bola2_accounts_table', 1),
        (81, '2025_06_19_091321_create_bola2_bet_records_table', 1),
        (82, '2025_06_19_091321_create_bolakk4d_accounts_table', 1),
        (83, '2025_06_19_091321_create_bolakk4d_bet_records_new_table', 1),
        (84, '2025_06_19_091321_create_bolakk4d_bet_records_table', 1),
        (85, '2025_06_19_091321_create_bolesw_accounts_table', 1),
        (86, '2025_06_19_091321_create_bolesw_bet_records_table', 1),
        (87, '2025_06_19_091321_create_boongosw_accounts_table', 1),
        (88, '2025_06_19_091321_create_boongosw_bet_records_table', 1),
        (89, '2025_06_19_091321_create_boongosw_cancel_records_table', 1),
        (90, '2025_06_19_091321_create_boracayfish_accounts_table', 1),
        (91, '2025_06_19_091321_create_boracayfish_bet_records_table', 1),
        (92, '2025_06_19_091321_create_brand_agents_table', 1),
        (93, '2025_06_19_091321_create_brands_table', 1),
        (94, '2025_06_19_091321_create_bulletin_type_names_table', 1),
        (95, '2025_06_19_091321_create_bulletin_types_table', 1),
        (96, '2025_06_19_091321_create_bulletins_table', 1),
        (97, '2025_06_19_091321_create_c93_accounts_table', 1),
        (98, '2025_06_19_091321_create_c93_bet_records_table', 1),
        (99, '2025_06_19_091321_create_cancel_unlimit_logs_table', 1),
        (100, '2025_06_19_091321_create_cash_flow_infos_table', 1),
        (101, '2025_06_19_091321_create_cash_flow_names_table', 1),
        (102, '2025_06_19_091321_create_cash_flows_table', 1),
        (103, '2025_06_19_091321_create_categories_table', 1),
        (104, '2025_06_19_091321_create_category_names_table', 1),
        (105, '2025_06_19_091321_create_checkin_activities_table', 1),
        (106, '2025_06_19_091321_create_checkin_prizes_table', 1),
        (107, '2025_06_19_091321_create_checkin_records_table', 1),
        (108, '2025_06_19_091321_create_chicken_game_accounts_table', 1),
        (109, '2025_06_19_091321_create_clear_flow_limit_applications_table', 1),
        (110, '2025_06_19_091321_create_clotp2psw_accounts_table', 1),
        (111, '2025_06_19_091321_create_clotp2psw_bet_records_table', 1),
        (112, '2025_06_19_091321_create_clotsw_accounts_table', 1),
        (113, '2025_06_19_091321_create_clotsw_bet_records_table', 1),
        (114, '2025_06_19_091321_create_coke_fighting_accounts_table', 1),
        (115, '2025_06_19_091321_create_countries_table', 1),
        (116, '2025_06_19_091321_create_country_names_table', 1),
        (117, '2025_06_19_091321_create_coupon_batches_table', 1),
        (118, '2025_06_19_091321_create_coupon_codes_table', 1),
        (119, '2025_06_19_091321_create_crsw_accounts_table', 1),
        (120, '2025_06_19_091321_create_crsw_bet_records_table', 1),
        (121, '2025_06_19_091321_create_cs_agent_wallets_table', 1),
        (122, '2025_06_19_091321_create_ct_accounts_table', 1),
        (123, '2025_06_19_091321_create_ct_bet_records_table', 1),
        (124, '2025_06_19_091321_create_currencies_table', 1),
        (125, '2025_06_19_091321_create_currency_names_table', 1),
        (126, '2025_06_19_091321_create_customer_audit_times_table', 1),
        (127, '2025_06_19_091321_create_customer_proportions_table', 1),
        (128, '2025_06_19_091321_create_dct_accounts_table', 1),
        (129, '2025_06_19_091321_create_dct_bet_records_table', 1),
        (130, '2025_06_19_091321_create_dct_records_table', 1),
        (131, '2025_06_19_091321_create_debug_info_logs_table', 1),
        (132, '2025_06_19_091321_create_dg_accounts_table', 1),
        (133, '2025_06_19_091321_create_dg_bet_records_table', 1),
        (134, '2025_06_19_091321_create_domain_agents_table', 1),
        (135, '2025_06_19_091321_create_domain_type_infos_table', 1),
        (136, '2025_06_19_091321_create_domain_types_table', 1),
        (137, '2025_06_19_091321_create_domains_table', 1),
        (138, '2025_06_19_091321_create_ds88_accounts_table', 1),
        (139, '2025_06_19_091321_create_ds88_bet_records_table', 1),
        (140, '2025_06_19_091321_create_ebet_accounts_table', 1),
        (141, '2025_06_19_091321_create_ebet_bet_records_table', 1),
        (142, '2025_06_19_091321_create_epic_sw_accounts_table', 1),
        (143, '2025_06_19_091321_create_epic_sw_bet_records_table', 1),
        (144, '2025_06_19_091321_create_epic_sw_event_records_table', 1),
        (145, '2025_06_19_091321_create_epic_sw_record_histories_table', 1),
        (146, '2025_06_19_091321_create_epic_sw_records_table', 1),
        (147, '2025_06_19_091321_create_esport_accounts_table', 1),
        (148, '2025_06_19_091321_create_esport_bet_records_table', 1),
        (149, '2025_06_19_091321_create_event_codes_table', 1),
        (150, '2025_06_19_091321_create_event_details_table', 1),
        (151, '2025_06_19_091321_create_event_exclude_agents_table', 1),
        (152, '2025_06_19_091321_create_event_images_table', 1),
        (153, '2025_06_19_091321_create_event_jackpots_table', 1),
        (154, '2025_06_19_091321_create_event_names_table', 1),
        (155, '2025_06_19_091321_create_event_pgssw_accounts_table', 1),
        (156, '2025_06_19_091321_create_event_pgssw_bet_records_table', 1),
        (157, '2025_06_19_091321_create_event_processes_table', 1),
        (158, '2025_06_19_091321_create_event_promotions_table', 1),
        (159, '2025_06_19_091321_create_event_refresh_ranking_records_table', 1),
        (160, '2025_06_19_091321_create_event_refresh_rankings_table', 1),
        (161, '2025_06_19_091321_create_event_slot_competition_records_table', 1),
        (162, '2025_06_19_091321_create_event_slot_competitions_table', 1),
        (163, '2025_06_19_091321_create_event_total_bet_records_table', 1),
        (164, '2025_06_19_091321_create_event_uuslotsw_accounts_table', 1),
        (165, '2025_06_19_091321_create_event_uuslotsw_bet_records_table', 1),
        (166, '2025_06_19_091321_create_event_vendor_info_games_table', 1),
        (167, '2025_06_19_091321_create_event_vendor_infos_table', 1),
        (168, '2025_06_19_091321_create_event_vendor_locks_table', 1),
        (169, '2025_06_19_091321_create_event_vendors_table', 1),
        (170, '2025_06_19_091321_create_event_vpowersw_accounts_table', 1),
        (171, '2025_06_19_091321_create_event_vpowersw_bet_records_table', 1),
        (172, '2025_06_19_091321_create_event_wfsw_accounts_table', 1),
        (173, '2025_06_19_091321_create_event_wfsw_bet_records_table', 1),
        (174, '2025_06_19_091321_create_events_table', 1),
        (175, '2025_06_19_091321_create_evo_accounts_table', 1),
        (176, '2025_06_19_091321_create_evo_bet_records_table', 1),
        (177, '2025_06_19_091321_create_external_api_keys_table', 1),
        (178, '2025_06_19_091321_create_favourite_games_table', 1),
        (179, '2025_06_19_091321_create_fffsw_accounts_table', 1),
        (180, '2025_06_19_091321_create_fffsw_bet_records_table', 1),
        (181, '2025_06_19_091321_create_firebase_cloud_messages_table', 1),
        (182, '2025_06_19_091321_create_fishing_accounts_table', 1),
        (183, '2025_06_19_091321_create_fishing_bet_records_table', 1),
        (184, '2025_06_19_091321_create_flow_limit_control_logs_table', 1),
        (185, '2025_06_19_091321_create_flow_limit_details_table', 1),
        (186, '2025_06_19_091321_create_flow_limit_restrictions_table', 1),
        (187, '2025_06_19_091321_create_flow_limits_table', 1),
        (188, '2025_06_19_091321_create_game_names_table', 1),
        (189, '2025_06_19_091321_create_game_type_names_table', 1),
        (190, '2025_06_19_091321_create_game_types_table', 1),
        (191, '2025_06_19_091321_create_games_table', 1),
        (192, '2025_06_19_091321_create_gfg2_accounts_table', 1),
        (193, '2025_06_19_091321_create_gfg2_bet_records_table', 1),
        (194, '2025_06_19_091321_create_great_wall_accounts_table', 1),
        (195, '2025_06_19_091321_create_great_wall_bet_records_table', 1),
        (196, '2025_06_19_091321_create_great_wall_transactions_table', 1),
        (197, '2025_06_19_091321_create_haolong_accounts_table', 1),
        (198, '2025_06_19_091321_create_haolong_bet_records_table', 1),
        (199, '2025_06_19_091321_create_haolong_daily_win_losses_table', 1),
        (200, '2025_06_19_091321_create_ia_accounts_table', 1),
        (201, '2025_06_19_091321_create_ia_bet_records_table', 1),
        (202, '2025_06_19_091321_create_ia_daily_win_losses_table', 1),
        (203, '2025_06_19_091321_create_igs_accounts_table', 1),
        (204, '2025_06_19_091321_create_igs_bet_records_table', 1),
        (205, '2025_06_19_091321_create_igs_daily_wins_table', 1),
        (206, '2025_06_19_091321_create_impsw_accounts_table', 1),
        (207, '2025_06_19_091321_create_impsw_bet_records_table', 1),
        (208, '2025_06_19_091321_create_information_languages_table', 1),
        (209, '2025_06_19_091321_create_informations_table', 1),
        (210, '2025_06_19_091321_create_isb_accounts_table', 1),
        (211, '2025_06_19_091321_create_isb_bet_records_table', 1),
        (212, '2025_06_19_091321_create_joker_accounts_table', 1),
        (213, '2025_06_19_091321_create_joker_bet_records_table', 1),
        (214, '2025_06_19_091321_create_ky_accounts_table', 1),
        (215, '2025_06_19_091321_create_ky_bet_records_table', 1),
        (216, '2025_06_19_091321_create_l4_accounts_table', 1),
        (217, '2025_06_19_091321_create_l4_bet_records_table', 1),
        (218, '2025_06_19_091321_create_language_texts_table', 1),
        (219, '2025_06_19_091321_create_languages_table', 1),
        (220, '2025_06_19_091321_create_lbb_accounts_table', 1),
        (221, '2025_06_19_091321_create_lbb_bet_records_table', 1),
        (222, '2025_06_19_091321_create_lfc888_accounts_table', 1),
        (223, '2025_06_19_091321_create_lfc888_bet_records_table', 1),
        (224, '2025_06_19_091321_create_live_chat_accounts_table', 1),
        (225, '2025_06_19_091321_create_login_event_names_table', 1),
        (226, '2025_06_19_091321_create_login_events_table', 1),
        (227, '2025_06_19_091321_create_lucky_accounts_table', 1),
        (228, '2025_06_19_091321_create_lucky_bet_records_table', 1),
        (229, '2025_06_19_091321_create_lucky_draw_tickets_table', 1),
        (230, '2025_06_19_091321_create_lucky_draws_table', 1),
        (231, '2025_06_19_091321_create_m8bet_accounts_table', 1),
        (232, '2025_06_19_091321_create_m8bet_bet_records_table', 1),
        (233, '2025_06_19_091321_create_maintenance_whitelists_table', 1),
        (234, '2025_06_19_091321_create_marquee_text_contents_table', 1),
        (235, '2025_06_19_091321_create_marquee_texts_table', 1),
        (236, '2025_06_19_091321_create_marquee_win_point_records_table', 1),
        (237, '2025_06_19_091321_create_marquee_win_points_table', 1),
        (238, '2025_06_19_091321_create_medias_table', 1),
        (239, '2025_06_19_091321_create_mega888_accounts_table', 1),
        (240, '2025_06_19_091321_create_mega888_bet_records_table', 1),
        (241, '2025_06_19_091321_create_mega888_daily_wins_table', 1),
        (242, '2025_06_19_091321_create_megawinsw_accounts_table', 1),
        (243, '2025_06_19_091321_create_megawinsw_bet_records_table', 1),
        (244, '2025_06_19_091321_create_member_access_tokens_table', 1),
        (245, '2025_06_19_091321_create_member_activities_latest_table', 1),
        (246, '2025_06_19_091321_create_member_activities_table', 1),
        (247, '2025_06_19_091321_create_member_agent_table', 1),
        (248, '2025_06_19_091321_create_member_authentications_table', 1),
        (249, '2025_06_19_091321_create_member_bank_accounts_table', 1),
        (250, '2025_06_19_091321_create_member_binding_logs_table', 1),
        (251, '2025_06_19_091321_create_member_codes_table', 1),
        (252, '2025_06_19_091321_create_member_credit_cards_table', 1),
        (253, '2025_06_19_091321_create_member_crypto_wallets_table', 1),
        (254, '2025_06_19_091321_create_member_input_datas_table', 1),
        (255, '2025_06_19_091321_create_member_input_types_table', 1),
        (256, '2025_06_19_091321_create_member_inputs_table', 1),
        (257, '2025_06_19_091321_create_member_launch_logs_table', 1),
        (258, '2025_06_19_091321_create_member_login_ip_logs_table', 1),
        (259, '2025_06_19_091321_create_member_login_logs_table', 1),
        (260, '2025_06_19_091321_create_member_missions_table', 1),
        (261, '2025_06_19_091321_create_member_restrictions_table', 1),
        (262, '2025_06_19_091321_create_member_settings_table', 1),
        (263, '2025_06_19_091321_create_member_telegram_rels_table', 1),
        (264, '2025_06_19_091321_create_member_transfer_logs_table', 1),
        (265, '2025_06_19_091321_create_member_unlimit_cancels_table', 1),
        (266, '2025_06_19_091321_create_member_validation_type_names_table', 1),
        (267, '2025_06_19_091321_create_member_validation_types_table', 1),
        (268, '2025_06_19_091321_create_member_validations_table', 1),
        (269, '2025_06_19_091321_create_member_vip_prizes_table', 1),
        (270, '2025_06_19_091321_create_member_vip_records_table', 1),
        (271, '2025_06_19_091321_create_member_vips_table', 1),
        (272, '2025_06_19_091321_create_member_wallets_table', 1),
        (273, '2025_06_19_091321_create_members_table', 1),
        (274, '2025_06_19_091321_create_menang88_accounts_table', 1),
        (275, '2025_06_19_091321_create_menang88_bet_records_table', 1),
        (276, '2025_06_19_091321_create_mgc_accounts_table', 1),
        (277, '2025_06_19_091321_create_mgc_bet_records_table', 1),
        (278, '2025_06_19_091321_create_mgc_transaction_logs_table', 1),
        (279, '2025_06_19_091321_create_mission_available_agents_table', 1),
        (280, '2025_06_19_091321_create_mission_names_table', 1),
        (281, '2025_06_19_091321_create_missions_table', 1),
        (282, '2025_06_19_091321_create_motivationsw_accounts_table', 1),
        (283, '2025_06_19_091321_create_motivationsw_bet_records_table', 1),
        (284, '2025_06_19_091321_create_mt_accounts_table', 1),
        (285, '2025_06_19_091321_create_mt_bet_records_table', 1),
        (286, '2025_06_19_091321_create_n918_accounts_table', 1),
        (287, '2025_06_19_091321_create_n918_bet_records_table', 1),
        (288, '2025_06_19_091321_create_n918_daily_wins_table', 1),
        (289, '2025_06_19_091321_create_ncpays_table', 1),
        (290, '2025_06_19_091321_create_npt_accounts_table', 1),
        (291, '2025_06_19_091321_create_npt_bet_records_table', 1),
        (292, '2025_06_19_091321_create_ns_accounts_table', 1),
        (293, '2025_06_19_091321_create_ns_bet_records_table', 1),
        (294, '2025_06_19_091321_create_obet33_accounts_table', 1),
        (295, '2025_06_19_091321_create_obet33_bet_records_table', 1),
        (296, '2025_06_19_091321_create_order_histories_table', 1),
        (297, '2025_06_19_091321_create_order_images_table', 1),
        (298, '2025_06_19_091321_create_order_type_names_table', 1),
        (299, '2025_06_19_091321_create_order_types_table', 1),
        (300, '2025_06_19_091321_create_orders_table', 1),
        (301, '2025_06_19_091321_create_organization_languages_table', 1),
        (302, '2025_06_19_091321_create_organizations_table', 1),
        (303, '2025_06_19_091321_create_ota_orders_table', 1),
        (304, '2025_06_19_091321_create_param_names_table', 1),
        (305, '2025_06_19_091321_create_params_table', 1),
        (306, '2025_06_19_091321_create_password_resets_table', 1),
        (307, '2025_06_19_091321_create_pg_accounts_table', 1),
        (308, '2025_06_19_091321_create_pg_bet_records_table', 1),
        (309, '2025_06_19_091321_create_pg_round_bet_records_table', 1),
        (310, '2025_06_19_091321_create_pgs_accounts_table', 1),
        (311, '2025_06_19_091321_create_pgs_bet_records_table', 1),
        (312, '2025_06_19_091321_create_pgs_event_records_table', 1),
        (313, '2025_06_19_091321_create_pgslot_accounts_table', 1),
        (314, '2025_06_19_091321_create_pgslot_bet_records_table', 1),
        (315, '2025_06_19_091321_create_pgssw_accounts_table', 1),
        (316, '2025_06_19_091321_create_pgssw_bet_records_table', 1),
        (317, '2025_06_19_091321_create_pgssw_cancel_logs_table', 1),
        (318, '2025_06_19_091321_create_pgssw_event_records_table', 1),
        (319, '2025_06_19_091321_create_pgssw_transaction_logs_table', 1),
        (320, '2025_06_19_091321_create_platform_announcement_images_table', 1),
        (321, '2025_06_19_091321_create_platform_announcement_languages_table', 1),
        (322, '2025_06_19_091321_create_platform_announcement_reads_table', 1),
        (323, '2025_06_19_091321_create_platform_announcements_table', 1),
        (324, '2025_06_19_091321_create_play8oy_accounts_table', 1),
        (325, '2025_06_19_091321_create_play8oy_bet_records_table', 1),
        (326, '2025_06_19_091321_create_play8oy_transactions_table', 1),
        (327, '2025_06_19_091321_create_plus100_accounts_table', 1),
        (328, '2025_06_19_091321_create_plus100_bet_records_table', 1),
        (329, '2025_06_19_091321_create_pp_accounts_table', 1),
        (330, '2025_06_19_091321_create_pp_bet_record_logs_table', 1),
        (331, '2025_06_19_091321_create_pp_bet_records_table', 1),
        (332, '2025_06_19_091321_create_pp_event_records_table', 1),
        (333, '2025_06_19_091321_create_prize_assigns_table', 1),
        (334, '2025_06_19_091321_create_prize_content_flow_limits_table', 1),
        (335, '2025_06_19_091321_create_prize_content_names_table', 1),
        (336, '2025_06_19_091321_create_prize_contents_table', 1),
        (337, '2025_06_19_091321_create_prize_member_orders_table', 1),
        (338, '2025_06_19_091321_create_prize_members_table', 1),
        (339, '2025_06_19_091321_create_prize_type_names_table', 1),
        (340, '2025_06_19_091321_create_prize_types_table', 1),
        (341, '2025_06_19_091321_create_prizes_table', 1),
        (342, '2025_06_19_091321_create_promotion_wallet_logs_table', 1),
        (343, '2025_06_19_091321_create_promotion_wallets_table', 1),
        (344, '2025_06_19_091321_create_pt_accounts_table', 1),
        (345, '2025_06_19_091321_create_pt_bet_records_table', 1),
        (346, '2025_06_19_091321_create_ptsw_accounts_table', 1),
        (347, '2025_06_19_091321_create_ptsw_bet_records_table', 1),
        (348, '2025_06_19_091321_create_ptsw_deal_records_table', 1),
        (349, '2025_06_19_091321_create_pussy888_accounts_table', 1),
        (350, '2025_06_19_091321_create_pussy888_bet_records_table', 1),
        (351, '2025_06_19_091321_create_pussy888_daily_wins_table', 1),
        (352, '2025_06_19_091321_create_qtech_accounts_table', 1),
        (353, '2025_06_19_091321_create_qtech_bet_records_table', 1),
        (354, '2025_06_19_091321_create_ranking_tbr_records_table', 1),
        (355, '2025_06_19_091321_create_rcb988_accounts_table', 1),
        (356, '2025_06_19_091321_create_rcb988_bet_records_table', 1),
        (357, '2025_06_19_091321_create_realname_validation_requests_table', 1),
        (358, '2025_06_19_091321_create_refresh_ranking_transaction_logs_table', 1),
        (359, '2025_06_19_091321_create_reward_item_histories_table', 1),
        (360, '2025_06_19_091321_create_reward_item_names_table', 1),
        (361, '2025_06_19_091321_create_reward_items_table', 1),
        (362, '2025_06_19_091321_create_rm_accounts_table', 1),
        (363, '2025_06_19_091321_create_rm_bet_records_table', 1),
        (364, '2025_06_19_091321_create_roles_table', 1),
        (365, '2025_06_19_091321_create_rolling_chip_logs_table', 1),
        (366, '2025_06_19_091321_create_sa_accounts_table', 1),
        (367, '2025_06_19_091321_create_sa_bet_records_table', 1),
        (368, '2025_06_19_091321_create_saba_accounts_table', 1),
        (369, '2025_06_19_091321_create_saba_bet_records_table', 1),
        (370, '2025_06_19_091321_create_saba_version_keys_table', 1),
        (371, '2025_06_19_091321_create_sbo_accounts_table', 1),
        (372, '2025_06_19_091321_create_sbo_bet_records_table', 1),
        (373, '2025_06_19_091321_create_schedule_logs_table', 1),
        (374, '2025_06_19_091321_create_scr_accounts_table', 1),
        (375, '2025_06_19_091321_create_scr_bet_records_table', 1),
        (376, '2025_06_19_091321_create_scr_daily_wins_table', 1),
        (377, '2025_06_19_091321_create_settlement_report_payouts_table', 1),
        (378, '2025_06_19_091321_create_settlement_report_reruns_table', 1),
        (379, '2025_06_19_091321_create_shareholder_api_infos_table', 1),
        (380, '2025_06_19_091321_create_shareholder_cancel_logs_table', 1),
        (381, '2025_06_19_091321_create_shareholder_cancels_table', 1),
        (382, '2025_06_19_091321_create_shareholder_categories_table', 1),
        (383, '2025_06_19_091321_create_shareholder_category_settings_table', 1),
        (384, '2025_06_19_091321_create_shareholder_exchange_rate_logs_table', 1),
        (385, '2025_06_19_091321_create_shareholder_exchange_rates_table', 1),
        (386, '2025_06_19_091321_create_shareholder_payout_logs_table', 1),
        (387, '2025_06_19_091321_create_simple_settlement_policies_table', 1),
        (388, '2025_06_19_091321_create_simple_settlement_reports_table', 1),
        (389, '2025_06_19_091321_create_sky1388_accounts_table', 1),
        (390, '2025_06_19_091321_create_sky1388_bet_records_table', 1),
        (391, '2025_06_19_091321_create_skybet_accounts_table', 1),
        (392, '2025_06_19_091321_create_skybet_bet_records_table', 1),
        (393, '2025_06_19_091321_create_sl_accounts_table', 1),
        (394, '2025_06_19_091321_create_sl_bet_records_table', 1),
        (395, '2025_06_19_091321_create_sma_accounts_table', 1),
        (396, '2025_06_19_091321_create_sma_bet_records_table', 1),
        (397, '2025_06_19_091321_create_sms_gateway_countries_table', 1),
        (398, '2025_06_19_091321_create_sms_gateway_group_details_table', 1),
        (399, '2025_06_19_091321_create_sms_gateway_info_countries_table', 1),
        (400, '2025_06_19_091321_create_sms_gateway_infos_table', 1),
        (401, '2025_06_19_091321_create_sms_gateways_table', 1),
        (402, '2025_06_19_091321_create_sms_infobips_table', 1),
        (403, '2025_06_19_091321_create_sms_send_records_table', 1),
        (404, '2025_06_19_091321_create_sms_sms_gets_table', 1),
        (405, '2025_06_19_091321_create_sms_sms_works_table', 1),
        (406, '2025_06_19_091321_create_sms_texts_table', 1),
        (407, '2025_06_19_091321_create_sp_logs_table', 1),
        (408, '2025_06_19_091321_create_spadegaming_accounts_table', 1),
        (409, '2025_06_19_091321_create_spadegaming_bet_records_table', 1),
        (410, '2025_06_19_091321_create_spadegamingsw_accounts_table', 1),
        (411, '2025_06_19_091321_create_spadegamingsw_bet_records_table', 1),
        (412, '2025_06_19_091321_create_summary_agent_achievements_table', 1),
        (413, '2025_06_19_091321_create_summary_agent_settlements_table', 1),
        (414, '2025_06_19_091321_create_summary_bet_record_agent_teams_table', 1),
        (415, '2025_06_19_091321_create_summary_bet_record_agents_table', 1),
        (416, '2025_06_19_091321_create_summary_bet_record_by_days_table', 1),
        (417, '2025_06_19_091321_create_summary_bet_record_histories_table', 1),
        (418, '2025_06_19_091321_create_summary_bet_records_table', 1),
        (419, '2025_06_19_091321_create_summary_bet_records_team_histories_table', 1),
        (420, '2025_06_19_091321_create_summary_bet_records_team_table', 1),
        (421, '2025_06_19_091321_create_summary_control_logs_table', 1),
        (422, '2025_06_19_091321_create_summary_control_tables_table', 1),
        (423, '2025_06_19_091321_create_summary_customer_settlements_table', 1),
        (424, '2025_06_19_091321_create_summary_event_record_agents_table', 1),
        (425, '2025_06_19_091321_create_summary_event_record_histories_table', 1),
        (426, '2025_06_19_091321_create_summary_event_records_table', 1),
        (427, '2025_06_19_091321_create_summary_point_barrel_winloses_table', 1),
        (428, '2025_06_19_091321_create_summary_point_barrels_table', 1),
        (429, '2025_06_19_091321_create_summary_pp_bet_records_table', 1),
        (430, '2025_06_19_091321_create_summary_rolling_chip_records_by_agent_table', 1),
        (431, '2025_06_19_091321_create_summary_rolling_chip_records_table', 1),
        (432, '2025_06_19_091321_create_summary_settlement_periods_table', 1),
        (433, '2025_06_19_091321_create_summary_shareholder_records_table', 1),
        (434, '2025_06_19_091321_create_summary_shareholder_temps_table', 1),
        (435, '2025_06_19_091321_create_summary_shareholder_winlose_temps_table', 1),
        (436, '2025_06_19_091321_create_summary_shareholder_winloses_table', 1),
        (437, '2025_06_19_091321_create_summary_shareholders_table', 1),
        (438, '2025_06_19_091321_create_summary_transaction_logs_table', 1),
        (439, '2025_06_19_091321_create_system_notification_reads_table', 1),
        (440, '2025_06_19_091321_create_telegram_broadcast_messages_table', 1),
        (441, '2025_06_19_091321_create_telegram_broadcast_records_table', 1),
        (442, '2025_06_19_091321_create_telegram_messages_table', 1),
        (443, '2025_06_19_091321_create_temp_agent_hierarchy_table', 1),
        (444, '2025_06_19_091321_create_temp_four_lottery_tickets_table', 1),
        (445, '2025_06_19_091321_create_temp_lottery_tickets1_table', 1),
        (446, '2025_06_19_091321_create_temp_lottery_tickets_4d_table', 1),
        (447, '2025_06_19_091321_create_temp_lottery_tickets_table', 1),
        (448, '2025_06_19_091321_create_templates_table', 1),
        (449, '2025_06_19_091321_create_terra_accounts_table', 1),
        (450, '2025_06_19_091321_create_terra_bet_records_table', 1),
        (451, '2025_06_19_091321_create_tfgamingsw_accounts_table', 1),
        (452, '2025_06_19_091321_create_tfgamingsw_bet_records_table', 1),
        (453, '2025_06_19_091321_create_three_hierarchy_bonus_report_agents_table', 1),
        (454, '2025_06_19_091321_create_three_hierarchy_bonus_report_table', 1),
        (455, '2025_06_19_091321_create_three_hierarchy_proportions_table', 1),
        (456, '2025_06_19_091321_create_three_hierarchy_summary_bonus_agents_table', 1),
        (457, '2025_06_19_091321_create_three_hierarchy_summary_bonus_table', 1),
        (458, '2025_06_19_091321_create_three_hierarchy_withdraw_logs_table', 1),
        (459, '2025_06_19_091321_create_tiktok_accounts_table', 1),
        (460, '2025_06_19_091321_create_tiktok_logs_table', 1),
        (461, '2025_06_19_091321_create_timezones_table', 1),
        (462, '2025_06_19_091321_create_total_bet_record_promotion_wallet_logs_table', 1),
        (463, '2025_06_19_091321_create_total_bet_record_transaction_logs_table', 1),
        (464, '2025_06_19_091321_create_total_bet_record_wallet_transaction_logs_table', 1),
        (465, '2025_06_19_091321_create_total_bet_records_table', 1),
        (466, '2025_06_19_091321_create_transaction_log_agents_table', 1),
        (467, '2025_06_19_091321_create_transaction_log_histories_table', 1),
        (468, '2025_06_19_091321_create_transaction_log_total_bet_records_table', 1),
        (469, '2025_06_19_091321_create_transaction_logs_table', 1),
        (470, '2025_06_19_091321_create_transfer_limit_logs_table', 1),
        (471, '2025_06_19_091321_create_transfer_limits_table', 1),
        (472, '2025_06_19_091321_create_unlimit_bonus_report_paids_table', 1),
        (473, '2025_06_19_091321_create_unlimit_bonusreport_agents_table', 1),
        (474, '2025_06_19_091321_create_unlimit_bonusreport_table', 1),
        (475, '2025_06_19_091321_create_unlimit_summary_bonus_table', 1),
        (476, '2025_06_19_091321_create_unlimit_systemrate_table', 1),
        (477, '2025_06_19_091321_create_unlimit_withdrawlog_table', 1),
        (478, '2025_06_19_091321_create_user_access_tokens_table', 1),
        (479, '2025_06_19_091321_create_user_language_mappings_table', 1),
        (480, '2025_06_19_091321_create_user_login_logs_table', 1),
        (481, '2025_06_19_091321_create_user_menus_table', 1),
        (482, '2025_06_19_091321_create_user_permissions_table', 1),
        (483, '2025_06_19_091321_create_users_table', 1),
        (484, '2025_06_19_091321_create_uuslotsw_accounts_table', 1),
        (485, '2025_06_19_091321_create_uuslotsw_bet_records_table', 1),
        (486, '2025_06_19_091321_create_v8_accounts_table', 1),
        (487, '2025_06_19_091321_create_v8_bet_records_table', 1),
        (488, '2025_06_19_091321_create_validate_tokens_table', 1),
        (489, '2025_06_19_091321_create_vendor_customized_items_table', 1),
        (490, '2025_06_19_091321_create_vendor_hour_records_table', 1),
        (491, '2025_06_19_091321_create_vendor_images_table', 1),
        (492, '2025_06_19_091321_create_vendor_info_games_table', 1),
        (493, '2025_06_19_091321_create_vendor_info_last_end_times_table', 1),
        (494, '2025_06_19_091321_create_vendor_infos_table', 1),
        (495, '2025_06_19_091321_create_vendor_languages_table', 1),
        (496, '2025_06_19_091321_create_vendor_limits_table', 1),
        (497, '2025_06_19_091321_create_vendor_maintenances_table', 1),
        (498, '2025_06_19_091321_create_vendor_request_fails_table', 1),
        (499, '2025_06_19_091321_create_vendors_table', 1),
        (500, '2025_06_19_091321_create_versions_table', 1),
        (501, '2025_06_19_091321_create_vip_content_names_table', 1),
        (502, '2025_06_19_091321_create_vip_content_rewards_table', 1),
        (503, '2025_06_19_091321_create_vip_content_withdrawal_types_table', 1),
        (504, '2025_06_19_091321_create_vip_contents_table', 1),
        (505, '2025_06_19_091321_create_vip_flow_limits_table', 1),
        (506, '2025_06_19_091321_create_vip_rebate_proportions_table', 1),
        (507, '2025_06_19_091321_create_vip_rebate_summary_records_table', 1),
        (508, '2025_06_19_091321_create_vip_reward_payout_logs_table', 1),
        (509, '2025_06_19_091321_create_vip_rewards_table', 1),
        (510, '2025_06_19_091321_create_vplay_accounts_table', 1),
        (511, '2025_06_19_091321_create_vplay_bet_records_table', 1),
        (512, '2025_06_19_091321_create_vpower_accounts_table', 1),
        (513, '2025_06_19_091321_create_vpower_bet_records_table', 1),
        (514, '2025_06_19_091321_create_vpowersw_accounts_table', 1),
        (515, '2025_06_19_091321_create_vpowersw_bet_records_table', 1),
        (516, '2025_06_19_091321_create_vspoker_accounts_table', 1),
        (517, '2025_06_19_091321_create_vspoker_bet_records_table', 1),
        (518, '2025_06_19_091321_create_vsport_accounts_table', 1),
        (519, '2025_06_19_091321_create_vsport_bet_records_table', 1),
        (520, '2025_06_19_091321_create_w_jackpot_histories_table', 1),
        (521, '2025_06_19_091321_create_w_jackpot_reward_item_names_table', 1),
        (522, '2025_06_19_091321_create_w_jackpot_reward_items_table', 1),
        (523, '2025_06_19_091321_create_w_jackpot_tickets_table', 1),
        (524, '2025_06_19_091321_create_w_jackpots_table', 1),
        (525, '2025_06_19_091321_create_wallet_transaction_log_agents_table', 1),
        (526, '2025_06_19_091321_create_wallet_transaction_logs_table', 1),
        (527, '2025_06_19_091321_create_wbet_accounts_table', 1),
        (528, '2025_06_19_091321_create_wbet_bet_records_table', 1),
        (529, '2025_06_19_091321_create_wcasino_accounts_table', 1),
        (530, '2025_06_19_091321_create_wcasino_bet_records_table', 1),
        (531, '2025_06_19_091321_create_wcasinosw_accounts_table', 1),
        (532, '2025_06_19_091321_create_wcasinosw_bet_records_table', 1),
        (533, '2025_06_19_091321_create_wcasinosw_notify_records_table', 1),
        (534, '2025_06_19_091321_create_wesw_accounts_table', 1),
        (535, '2025_06_19_091321_create_wesw_bet_records_table', 1),
        (536, '2025_06_19_091321_create_wfsw_accounts_table', 1),
        (537, '2025_06_19_091321_create_wfsw_bet_records_table', 1),
        (538, '2025_06_19_091321_create_withdrawal_orders_table', 1),
        (539, '2025_06_19_091321_create_withdrawal_payout_records_table', 1),
        (540, '2025_06_19_091321_create_withdrawal_type_names_table', 1),
        (541, '2025_06_19_091321_create_withdrawal_types_table', 1),
        (542, '2025_06_19_091321_create_wm_accounts_table', 1),
        (543, '2025_06_19_091321_create_wm_bet_records_table', 1),
        (544, '2025_06_19_091321_create_wm_daily_wins_table', 1),
        (545, '2025_06_19_091321_create_wmlivesw_accounts_table', 1),
        (546, '2025_06_19_091321_create_wmlivesw_bet_records_table', 1),
        (547, '2025_06_19_091321_create_wmlivesw_deal_records_table', 1),
        (548, '2025_06_19_091321_create_xe88_accounts_table', 1),
        (549, '2025_06_19_091321_create_xe88_bet_records_table', 1),
        (550, '2025_06_19_091321_create_xe88_daily_wins_table', 1),
        (551, '2025_06_19_091321_create_ybet_accounts_table', 1),
        (552, '2025_06_19_091321_create_ybet_bet_records_table', 1),
        (553, '2025_06_19_091321_create_ygg_accounts_table', 1),
        (554, '2025_06_19_091321_create_ygg_bet_records_table', 1),
        (555, '2025_06_19_091321_create_yxfs_table', 1),
        (556, '2025_06_19_092000_create_v2_events_table', 1),
        (557, '2025_06_19_092001_add_status_column_to_vendor_account', 1),
        (558, '2025_06_19_092002_create_vendor_api_errors_table', 1),
        (559, '2025_06_20_100000_create_bind_reward_details_table', 1),
        (560, '2025_06_20_100000_create_checkin_prize_records_table', 1),
        (561, '2025_06_20_100000_create_j3_accounts_table', 1),
        (562, '2025_06_20_200000_create_j3_bet_records_table', 1),
        (563, '2025_06_23_071215_alter_table_add_admin_default_value', 1),
        (564, '2025_06_23_072117_alter_table_vip_contents_add_mission_column_is_downgrade', 1),
        (565, '2025_06_23_074143_alter_table_agent_vendors_column_admin_default_value', 1),
        (566, '2025_06_23_100351_create_procedure_hashes_table', 1),
        (567, '2025_06_26_074544_alter_event_v2_block_column', 1),
        (568, '2025_07_03_023454_create_event_v2_detail_related_table', 1),
        (569, '2025_07_09_200000_add_real_name_to_agents_table', 1),
        (570, '2025_07_22_084318_add_event_payout_cancels_column20250722', 1),
        (571, '2025_07_29_100000_add_sort_to_brand_agents_table', 1),
        (572, '2025_07_30_080915_alter_table_vpowersw_bet_records_column_type_type', 1),
        (573, '2025_08_07_105410_add_sort_column_to_countries_table', 1),
        (574, '2025_08_12_100933_create_table_wudisw_accounts', 1),
        (575, '2025_08_14_065356_create_table_wudisw_bet_records', 1),
        (576, '2025_08_18_062343_alter_table_motivationsw_bet_records_change_unique', 1),
        (577, '2025_08_19_101826_create_table_fumasw_accounts', 1),
        (578, '2025_08_20_085621_create_table_fumasw_bet_records', 1),
        (579, '2025_08_21_085945_alter_table_fumasw_bet_records_add_status', 1),
        (580, '2025_08_21_101056_create_table_onebxsw_accounts', 1),
        (581, '2025_08_21_101108_create_table_onebxsw_bet_records', 1),
        (582, '2025_08_21_101250_alter_table_onebxsw_accounts_add_status', 1),
        (583, '2025_08_28_085432_alter_table_realname_validation_requests_add_column_member_id', 1),
        (584, '2025_09_03_100000_add_name_column_to_agent_cash_flows_table', 1),
        (585, '2025_09_04_085031_alter_wudisw_accounts_add_column_status', 1),
        (586, '2025_09_08_074831_create_command_logs_table', 1),
        (587, '2025_09_15_035811_table_language_texts_add_unique_key', 1),
        (588, '2025_09_16_065046_add_coupon_batches_column', 1),
        (589, '2025_09_16_065048_add_coupon_codes_column', 1),
        (590, '2025_09_22_070852_test_trigger_migrate', 1),
        (591, '2025_10_01_023830_create_table_vplussw_accounts', 1),
        (592, '2025_10_01_070339_create_vplussw_bet_records', 1),
        (593, '2025_10_03_055029_add_event_details_column20251003', 1),
        (594, '2025_10_20_081924_add_coupon_batches_column_to_coupons_table', 1),
        (595, '2025_10_21_145037_add_lang_content_to_brand_agents_table', 1),
        (596, '2025_10_22_080052_create_table_member_tracking_events', 1),
        (597, '2025_10_23_000000_add_applied_at_to_ptsw_deal_records_table', 1),
        (598, '2025_10_28_092721_add_password_to_n918_accounts_table', 1),
        (599, '2025_11_03_140515_create_event_invite_records_table', 1),
        (600, '2025_11_04_023832_add_coupon_batches_column', 1),
        (601, '2025_11_04_095150_add_index_918_bet_records_table', 1),
        (602, '2025_11_05_034749_create_ppsw_accounts_table', 1),
        (603, '2025_11_05_034823_create_ppsw_bet_records_table', 1),
        (604, '2025_11_05_034857_create_ppsw_deal_records_table', 1),
        (605, '2025_11_13_072007_add_realname_validation_requests_column', 1),
        (606, '2025_11_14_075504_create_event_v2_account', 1),
        (607, '2025_11_17_084852_create_event_v2_wallet_transaction_logs', 1),
        (608, '2025_11_19_084852_alter_event_v2_wallet_transaction_logs', 1),
        (609, '2025_11_19_095105_create_activity_logs_table', 1),
        (610, '2025_11_20_094055_drop_spy_http_logs_table', 1),
        (611, '2025_11_21_120000_add_currency_id_to_agent_cash_flows', 1),
        (612, '2025_11_24_095242_add_bank_accounts_column', 1),
        (613, '2025_11_25_000000_add_indexes_to_activity_logs_table', 1),
        (614, '2025_11_25_024510_create_cash_flow_banks_table', 1),
        (615, '2025_11_26_064555_add_end_time_column_to_event_v2_user_joins', 1),
        (616, '2025_11_27_073429_create_event_v2_recycle_table', 1),
        (617, '2025_11_27_074226_add_event_details_column', 1),
        (618, '2025_12_02_033751_change_cash_flows_info_to_text', 1),
        (619, '2025_12_03_021455_add_join_withdraw_column_to_event_v2_details', 1),
        (620, '2025_12_03_091044_create_agent_real_name_validation_requests_table', 1),
        (621, '2025_12_03_092137_create_agent_bank_accounts_table', 1),
        (622, '2025_12_03_111432_add_agents_column', 1),
        (623, '2025_12_15_000000_create_nex4dsw_accounts_table', 1),
        (624, '2025_12_15_000001_create_nex4dsw_bet_records_table', 1),
        (625, '2025_12_15_000002_create_nex4dsw_deal_records_table', 1),
        (626, '2025_12_16_034134_create_tthsw_accounts_table', 1),
        (627, '2025_12_16_034135_add_languages_column', 1),
        (628, '2025_12_16_034135_create_tthsw_bet_records_table', 1),
        (629, '2025_12_18_000001_add_trace_id_to_command_logs_table', 1),
        (630, '2025_12_18_081506_add_operate_agent_id_column_to_event_v2_wallet_transaction_logs', 1),
        (631, '2025_12_29_025027_add_transaction_log_id_to_ppsw_deal_records_table', 1),
        (632, '2025_12_29_034003_create_mission_reward_records_table', 1),
        (633, '2025_12_30_000001_altar_bank_accounts_account_name_length', 1),
        (634, '2025_12_30_000002_altar_member_bank_accounts_account_name_length', 1),
        (635, '2025_12_30_000003_altar_withdrawal_orders_account_name_length', 1),
        (636, '2025_12_31_063315_create_tthsw_deal_records_table', 1),
        (637, '2026_01_05_000000_create_new4d2026_accounts_table', 1),
        (638, '2026_01_05_000001_create_new4d2026_bet_records_table', 1),
        (639, '2026_01_05_000002_altar_new4d2026_create_time', 1),
        (640, '2026_01_06_040054_create_top55_accounts_table', 1),
        (641, '2026_01_07_080112_add_location_column_to_marquee_texts', 1),
        (642, '2026_01_08_021109_create_top55_bet_records_table', 1),
        (643, '2026_01_15_000001_create_table_event_wudisw_accounts', 1),
        (644, '2026_01_15_000002_create_table_event_wudisw_bet_records', 1),
        (645, '2026_01_16_062842_increase_banks_name_column_length', 1),
        (646, '2026_01_16_083617_add_event_sort', 1),
        (647, '2026_01_19_000001_altar_activity_logs_batch_uuid_length', 1),
        (648, '2026_01_19_090152_increase_usages_column_length_in_command_logs_table', 1),
        (649, '2026_01_20_091946_create_afbsw_bet_records_table', 1),
        (650, '2026_01_23_000001_altar_information_content_length', 1),
        (651, '2026_01_23_000001_create_clotlssw_accounts_table', 1),
        (652, '2026_01_23_000001_create_clotlssw_bet_records_table', 1),
        (653, '2026_01_26_061302_create_afbsw_accounts_table', 1),
        (654, '2026_01_27_000001_create_table_event_fumasw_accounts', 1),
        (655, '2026_01_27_000002_create_table_event_fumasw_bet_records', 1),
        (656, '2026_01_28_124134_create_event_ppsw_accounts_table', 1),
        (657, '2026_01_28_130457_create_event_ppsw_bet_records_table', 1),
        (658, '2026_01_28_131003_create_event_ppsw_deal_records_table', 1),
        (659, '2026_02_03_000001_altar_vendor_customized_items_sorts_length_table', 1),
        (660, '2026_02_03_071048_create_table_event_jackpot_records', 1),
        (661, '2026_02_04_074032_create_event_jackpot_images_table', 1),
        (662, '2026_02_06_000001_altar_agents_add_binding_scope_id', 1),
        (663, '2026_02_11_065104_alter_is_free_to_vendors', 1),
        (664, '2026_02_11_065448_alter_is_recycle_to_event_v2_details', 1),
        (665, '2026_02_11_081117_create_event_v2_detail_exclude_vendors_table', 1),
        (666, '2026_02_13_041919_add_index_to_reference_bet_id_on_vplussw_bet_records_table', 1),
        (667, '2026_02_18_141542_update_withdrawal_payout_records_table', 1),
        (668, '2026_02_23_033915_add_agent_cash_flows_column', 1),
        (669, '2026_02_24_022046_increase_nex4dsw_columns_length', 1),
        (670, '2026_03_03_000001_alter_currencies_add_sort', 1),
        (671, '2026_03_13_033113_create_platform_announcement_include_agents_table', 1),
        (672, '2026_03_13_033214_create_platform_announcement_exclude_agents_table', 1),
        (673, '2026_03_16_000001_refactor_payment_channel_schema', 1),
        (674, '2026_03_18_000001_add_composite_index_to_orders_table', 1),
        (675, '2026_03_18_000002_add_composite_index_to_agent_cash_flows_table', 1),
        (676, '2026_03_19_070731_add_index_register_ip_members_table', 1),
        (677, '2026_03_19_081315_alter_block_event_v2_detail_table', 1),
        (678, '2026_03_20_033528_add_balance_phone_to_event_v2_user_joins_table', 1),
        (679, '2026_03_23_022305_add_agent_cash_flows_column', 1),
        (680, '2026_03_27_000001_change_input_to_text_in_command_logs_table', 1);