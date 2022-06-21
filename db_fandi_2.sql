-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2022 at 04:45 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_fandi_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `config_payments`
--

CREATE TABLE `config_payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_off_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `config_payments`
--

INSERT INTO `config_payments` (`id`, `name`, `paid_off_amount`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
('5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 'monthly_payment', '50000', 1, NULL, '2022-02-04 15:40:10', '2022-02-04 15:40:10'),
('66e22622-968c-452f-9d0f-37d75ea585d5', 'main_payment', '500000', 1, NULL, '2022-03-11 18:18:29', '2022-03-11 18:18:29'),
('6e21a8c5-fe56-4241-a028-4614ef47d3ef', 'main_payment', '700000', 1, NULL, '2022-02-04 15:40:10', '2022-02-09 11:05:40'),
('a3e7c931-9623-4ace-bc61-6215619ec797', 'monthly_payment', '50000', 1, NULL, '2022-03-11 18:18:29', '2022-03-11 18:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `main_payments`
--

CREATE TABLE `main_payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_payment_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `paid_at` date NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_payments`
--

INSERT INTO `main_payments` (`id`, `user_id`, `config_payment_id`, `amount`, `paid_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
('037c26df-e442-44d8-bd29-e2a9b60558d2', '25554bb7-e85a-41ee-bbb6-1dbbf082efdc', '66e22622-968c-452f-9d0f-37d75ea585d5', 40000, '2022-03-20', NULL, '2022-03-20 15:03:32', '2022-03-20 15:03:32'),
('05388142-2528-4697-bfea-4458874de59c', '67452897-42c4-4bb4-8440-3a5eea43cbd3', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 500000, '2022-02-07', NULL, '2022-02-06 18:03:18', '2022-02-06 18:03:18'),
('05619a39-7348-4bcd-b05c-cc6bdcc08551', '7e67b353-585d-45f0-8e11-378edbe83c99', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-17', NULL, '2022-03-17 13:10:12', '2022-03-17 13:10:12'),
('058f35c0-4124-42fd-a15b-e68db020473a', 'c80864ee-bc31-4847-9b59-5db60342439c', '66e22622-968c-452f-9d0f-37d75ea585d5', 22222, '2022-03-18', NULL, '2022-03-18 02:54:17', '2022-03-18 02:54:17'),
('0b09bdb8-457d-40ce-aac3-6a163cdc9a76', '049cffac-d31f-4fb1-866b-2fb6f967a7cc', '66e22622-968c-452f-9d0f-37d75ea585d5', 11000, '2022-03-18', NULL, '2022-03-17 17:32:55', '2022-03-17 17:32:55'),
('14a6720e-bbaa-47a2-9152-de0de10b6ca8', '049cffac-d31f-4fb1-866b-2fb6f967a7cc', '66e22622-968c-452f-9d0f-37d75ea585d5', 200000, '2022-03-17', NULL, '2022-03-17 14:10:02', '2022-03-17 14:10:02'),
('17ed8e53-43a3-4041-8bc3-3f76b0ab5eca', '9699e020-6ae6-4e84-aba2-a93937d829be', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-21', NULL, '2022-03-21 11:03:41', '2022-03-21 11:03:41'),
('1ecdb8ef-395b-48e4-9f7f-23532011985c', '3616550e-5270-4d70-ae2c-c15772f73887', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 300000, '2022-02-10', NULL, '2022-02-10 11:15:28', '2022-02-10 11:15:28'),
('20573289-8b21-4758-a183-80cc80d397f2', '0c341878-4a12-42d7-8f5b-f46873efb942', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 221212, '2022-02-09', NULL, '2022-02-09 11:10:08', '2022-02-09 11:10:08'),
('23c4ae3d-d9de-4484-b267-a15c093dc585', '25554bb7-e85a-41ee-bbb6-1dbbf082efdc', '66e22622-968c-452f-9d0f-37d75ea585d5', 30000, '2022-03-20', NULL, '2022-03-20 15:02:46', '2022-03-20 15:02:46'),
('26e5e56a-abc0-4298-913e-17eaa9c69ad5', '049cffac-d31f-4fb1-866b-2fb6f967a7cc', '66e22622-968c-452f-9d0f-37d75ea585d5', 22222, '2022-03-17', NULL, '2022-03-17 14:05:20', '2022-03-17 14:05:20'),
('2939dfcf-baf2-4da6-a098-f8de435858cc', '4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-20', NULL, '2022-03-20 15:11:10', '2022-03-20 15:11:10'),
('37571c84-49d7-4b39-902d-08ea1fd0c9f5', '0c341878-4a12-42d7-8f5b-f46873efb942', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 211211, '2022-02-09', NULL, '2022-02-09 11:10:39', '2022-02-09 11:10:39'),
('39879891-029e-4093-94ba-5202cb0c7db7', '22796c38-02cb-45ed-a709-a342946a1c4c', '66e22622-968c-452f-9d0f-37d75ea585d5', 5000, '2022-03-18', NULL, '2022-03-18 02:56:42', '2022-03-18 02:56:42'),
('3e914c44-00dc-4f13-be93-579220b428ee', '4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-20', NULL, '2022-03-20 15:07:32', '2022-03-20 15:07:32'),
('40b4930e-4aa6-477e-aa44-a1b202b9ef27', '22796c38-02cb-45ed-a709-a342946a1c4c', '66e22622-968c-452f-9d0f-37d75ea585d5', 30000, '2022-03-20', NULL, '2022-03-20 14:41:03', '2022-03-20 14:41:03'),
('424e5d06-9a8c-4f96-8b06-bde9691941bd', '7e67b353-585d-45f0-8e11-378edbe83c99', '66e22622-968c-452f-9d0f-37d75ea585d5', 211212, '2022-03-17', NULL, '2022-03-17 13:14:21', '2022-03-17 13:14:21'),
('462685e7-edf1-4454-83df-778b228a22ff', '4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-20', NULL, '2022-03-20 15:08:42', '2022-03-20 15:08:42'),
('46d9def6-acdf-4f77-a3ed-5f4375472ece', '67452897-42c4-4bb4-8440-3a5eea43cbd3', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 250000, '2022-02-07', NULL, '2022-02-06 18:02:58', '2022-02-06 18:02:58'),
('48b57249-8ce7-4d43-bd2d-e3d3242231ee', '0c341878-4a12-42d7-8f5b-f46873efb942', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 121212, '2022-02-09', NULL, '2022-02-09 11:09:42', '2022-02-09 11:09:42'),
('4910b427-f0f3-4d32-9c67-75374ebbbb0d', '9699e020-6ae6-4e84-aba2-a93937d829be', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-21', NULL, '2022-03-20 17:55:20', '2022-03-20 17:55:20'),
('4c3b36bb-fb27-45b3-898e-0d281a28adb7', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-21', NULL, '2022-03-20 17:13:13', '2022-03-20 17:13:13'),
('51303d15-c734-4c71-b50d-72ee5c96988d', '25554bb7-e85a-41ee-bbb6-1dbbf082efdc', '66e22622-968c-452f-9d0f-37d75ea585d5', 30000, '2022-03-20', NULL, '2022-03-20 15:01:31', '2022-03-20 15:01:31'),
('51b3f205-048b-41b6-9d34-461cbd46e207', '9699e020-6ae6-4e84-aba2-a93937d829be', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-21', NULL, '2022-03-21 10:53:26', '2022-03-21 10:53:26'),
('616409d9-e5a9-4ce1-bfca-6bd453a1e459', '9699e020-6ae6-4e84-aba2-a93937d829be', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-21', NULL, '2022-03-20 17:57:00', '2022-03-20 17:57:00'),
('62281cbe-8309-4d07-829d-43371a2ef635', '4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-20', NULL, '2022-03-20 15:11:53', '2022-03-20 15:11:53'),
('641b1ef6-07e2-4346-b34f-a331bea00268', '2edad0bd-6f88-4961-a6af-e6a6f0c53060', '66e22622-968c-452f-9d0f-37d75ea585d5', 200000, '2022-03-17', NULL, '2022-03-17 08:22:56', '2022-03-17 08:22:56'),
('6420140f-c2c6-466e-b088-643bbb2eef4c', '228e99d4-3ad6-4408-9c90-fb0c71e7224c', '66e22622-968c-452f-9d0f-37d75ea585d5', 1500000, '2022-03-17', NULL, '2022-03-17 07:02:14', '2022-03-17 07:02:14'),
('646112ea-16ba-4b05-a356-5878b599c9a4', '4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-20', NULL, '2022-03-20 15:09:40', '2022-03-20 15:09:40'),
('68809eca-a117-4ed7-8453-e8ddf6e6f607', '2edad0bd-6f88-4961-a6af-e6a6f0c53060', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-17', NULL, '2022-03-17 08:21:55', '2022-03-17 08:21:55'),
('690a5b33-ad74-40aa-9fe0-0e391490de04', '99282f6c-81ad-4d2b-b2b4-94c6302cd0e8', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 20000, '2022-02-04', NULL, '2022-02-04 15:45:10', '2022-02-04 15:45:10'),
('6b229ebc-e3c9-4447-819b-ad921686b49f', '7e67b353-585d-45f0-8e11-378edbe83c99', '66e22622-968c-452f-9d0f-37d75ea585d5', 12222, '2022-03-17', NULL, '2022-03-17 13:02:01', '2022-03-17 13:02:01'),
('6b42c356-243c-4083-a428-4e2289590825', '7e67b353-585d-45f0-8e11-378edbe83c99', '66e22622-968c-452f-9d0f-37d75ea585d5', 200000, '2022-03-17', NULL, '2022-03-17 13:02:40', '2022-03-17 13:02:40'),
('6e818cd2-b50e-4088-9dad-3bc584b33964', '0c341878-4a12-42d7-8f5b-f46873efb942', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 22222, '2022-02-09', NULL, '2022-02-09 11:09:24', '2022-02-09 11:09:24'),
('6ecac03f-4a07-458d-a5a0-440490802a94', '4c1edbc8-d4c9-4256-a83d-990a4f77c529', '66e22622-968c-452f-9d0f-37d75ea585d5', 30000, '2022-03-22', NULL, '2022-03-22 08:33:24', '2022-03-22 08:33:24'),
('7137dc73-4695-426a-9892-62cdf45731dc', '9699e020-6ae6-4e84-aba2-a93937d829be', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-21', NULL, '2022-03-21 11:06:06', '2022-03-21 11:06:06'),
('713a5b34-6463-473a-b8f5-afac634cdc06', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-21', NULL, '2022-03-20 17:41:19', '2022-03-20 17:41:19'),
('750e6ee5-0cf8-4f19-a056-25a3b2540590', '3616550e-5270-4d70-ae2c-c15772f73887', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 4, '2022-02-10', NULL, '2022-02-10 11:15:10', '2022-02-10 11:15:10'),
('763b8414-0c8d-47d7-9251-b8f5f746ebe4', '3616550e-5270-4d70-ae2c-c15772f73887', '66e22622-968c-452f-9d0f-37d75ea585d5', 1500000, '2022-03-17', NULL, '2022-03-17 07:01:17', '2022-03-17 07:01:17'),
('7d5c0d78-dade-4f5f-8a5e-c3b73fc4a0cc', '7e67b353-585d-45f0-8e11-378edbe83c99', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-17', NULL, '2022-03-17 13:08:50', '2022-03-17 13:08:50'),
('84a09c07-dfaa-4b42-98f8-9a23e56ffadb', '25554bb7-e85a-41ee-bbb6-1dbbf082efdc', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-20', NULL, '2022-03-20 15:01:01', '2022-03-20 15:01:01'),
('85afca33-9a9f-45ee-8990-bf1ac530d64d', 'b6556cfb-12dc-4c44-9f81-bf9744fe4e78', '66e22622-968c-452f-9d0f-37d75ea585d5', 11000, '2022-03-17', NULL, '2022-03-17 13:22:49', '2022-03-17 13:22:49'),
('8c453f00-ef60-4ee1-8590-e65ce309cb4d', '9699e020-6ae6-4e84-aba2-a93937d829be', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-21', NULL, '2022-03-20 17:50:12', '2022-03-20 17:50:12'),
('8d424ec7-39cc-4b7a-adde-891d26bcefa6', 'b6556cfb-12dc-4c44-9f81-bf9744fe4e78', '66e22622-968c-452f-9d0f-37d75ea585d5', 21212, '2022-03-17', NULL, '2022-03-17 13:17:36', '2022-03-17 13:17:36'),
('8ff81f4f-9e9b-490a-9dc6-66af0e6eac83', '2edad0bd-6f88-4961-a6af-e6a6f0c53060', '66e22622-968c-452f-9d0f-37d75ea585d5', 11000, '2022-03-17', NULL, '2022-03-17 12:59:00', '2022-03-17 12:59:00'),
('938bb2e5-c8e5-43cf-b097-a5c293435144', '25554bb7-e85a-41ee-bbb6-1dbbf082efdc', '66e22622-968c-452f-9d0f-37d75ea585d5', 15000, '2022-03-20', NULL, '2022-03-20 15:00:40', '2022-03-20 15:00:40'),
('9458ee5b-fb7a-4063-bece-daaa92d6ef9f', '049cffac-d31f-4fb1-866b-2fb6f967a7cc', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-17', NULL, '2022-03-17 13:57:02', '2022-03-17 13:57:02'),
('962df8bf-0af0-46c6-89eb-5e33a6bf174b', 'b6556cfb-12dc-4c44-9f81-bf9744fe4e78', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-17', NULL, '2022-03-17 13:27:36', '2022-03-17 13:27:36'),
('9ae787dd-8b90-4069-a62e-99c172b147e3', '2edad0bd-6f88-4961-a6af-e6a6f0c53060', '66e22622-968c-452f-9d0f-37d75ea585d5', 11000, '2022-03-17', NULL, '2022-03-17 12:55:52', '2022-03-17 12:55:52'),
('9da8590e-763c-4c6c-a2df-f314356a66c0', '0c341878-4a12-42d7-8f5b-f46873efb942', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 121221, '2022-02-09', NULL, '2022-02-09 11:10:30', '2022-02-09 11:10:30'),
('9eedb682-45ea-4f88-9703-adfe9dcf6c57', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-20', NULL, '2022-03-20 15:15:42', '2022-03-20 15:15:42'),
('ba458e98-0177-4af5-847a-0b96c7d19dad', '22796c38-02cb-45ed-a709-a342946a1c4c', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-20', NULL, '2022-03-20 14:57:52', '2022-03-20 14:57:52'),
('bd2e1d9b-44da-46e6-aa94-c13aca576df5', '049cffac-d31f-4fb1-866b-2fb6f967a7cc', '66e22622-968c-452f-9d0f-37d75ea585d5', 40000, '2022-03-20', NULL, '2022-03-20 14:59:24', '2022-03-20 14:59:24'),
('bf968271-30f1-44c9-b6f7-1a55a60839af', '4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-20', NULL, '2022-03-20 15:10:33', '2022-03-20 15:10:33'),
('c42b3289-2161-43ac-a2e9-e49a4dbefcac', '2edad0bd-6f88-4961-a6af-e6a6f0c53060', '66e22622-968c-452f-9d0f-37d75ea585d5', 11000, '2022-03-17', NULL, '2022-03-17 12:54:25', '2022-03-17 12:54:25'),
('cb65700f-9c2f-47e4-95d3-291e5ed77648', '049cffac-d31f-4fb1-866b-2fb6f967a7cc', '66e22622-968c-452f-9d0f-37d75ea585d5', 22222, '2022-03-17', NULL, '2022-03-17 13:42:12', '2022-03-17 13:42:12'),
('cbf74fb6-4fb1-4569-9ac9-e2947783be6e', '22796c38-02cb-45ed-a709-a342946a1c4c', '66e22622-968c-452f-9d0f-37d75ea585d5', 8000, '2022-03-18', NULL, '2022-03-18 02:56:56', '2022-03-18 02:56:56'),
('d103e1fc-0e0b-4ce0-a7cf-c94050e0e1d7', '4c1edbc8-d4c9-4256-a83d-990a4f77c529', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-22', NULL, '2022-03-22 08:34:43', '2022-03-22 08:34:43'),
('d29d910f-cb2f-4c8c-bb09-110d0a60ef37', 'b6556cfb-12dc-4c44-9f81-bf9744fe4e78', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-17', NULL, '2022-03-17 13:20:48', '2022-03-17 13:20:48'),
('d6e11f7d-58f7-4eca-8cd0-c6592b588402', '0c341878-4a12-42d7-8f5b-f46873efb942', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 1500000, '2022-02-07', NULL, '2022-03-17 11:10:01', '2022-02-09 11:10:01'),
('d8851633-eefd-45ee-b79a-af4fb60d01eb', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-20', NULL, '2022-03-20 15:18:12', '2022-03-20 15:18:12'),
('db7936b9-f641-4c0c-8675-6f328fccf631', '9699e020-6ae6-4e84-aba2-a93937d829be', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-21', NULL, '2022-03-21 10:50:43', '2022-03-21 10:50:43'),
('e18662a9-c017-4cf8-8bc5-5e22d5d7cce8', '99282f6c-81ad-4d2b-b2b4-94c6302cd0e8', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 1500000, '2022-02-04', NULL, '2022-03-17 15:45:24', '2022-02-04 15:45:24'),
('e1f2ade3-81a6-4570-b953-5e7816699708', '22796c38-02cb-45ed-a709-a342946a1c4c', '66e22622-968c-452f-9d0f-37d75ea585d5', 11000, '2022-03-18', NULL, '2022-03-18 02:57:50', '2022-03-18 02:57:50'),
('e524f063-005e-4c85-ad4a-21a4ceb2d1ad', '049cffac-d31f-4fb1-866b-2fb6f967a7cc', '66e22622-968c-452f-9d0f-37d75ea585d5', 200000, '2022-03-17', NULL, '2022-03-17 14:08:39', '2022-03-17 14:08:39'),
('e5915a66-b11f-440d-bf9b-e332422f87a8', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', '66e22622-968c-452f-9d0f-37d75ea585d5', 30000, '2022-03-21', NULL, '2022-03-20 17:43:22', '2022-03-20 17:43:22'),
('e7bbe0e4-8295-48dc-85ca-a6fe036c6830', 'd7181500-943d-4e7a-8d07-68048e3e1560', '6e21a8c5-fe56-4241-a028-4614ef47d3ef', 1500000, '2022-02-09', NULL, '2022-03-17 11:21:26', '2022-02-09 11:21:26'),
('e8cc49d3-3ff2-47e1-8c5f-445c486a3532', '22796c38-02cb-45ed-a709-a342946a1c4c', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-20', NULL, '2022-03-20 14:58:30', '2022-03-20 14:58:30'),
('e98d5dc5-444e-4b0b-b3a4-df6cecdb634b', '25554bb7-e85a-41ee-bbb6-1dbbf082efdc', '66e22622-968c-452f-9d0f-37d75ea585d5', 40000, '2022-03-20', NULL, '2022-03-20 15:04:04', '2022-03-20 15:04:04'),
('eb0a60da-363c-4947-ac75-edc82dc1d6ca', '2edad0bd-6f88-4961-a6af-e6a6f0c53060', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-17', NULL, '2022-03-17 12:55:15', '2022-03-17 12:55:15'),
('edf530ef-f7fa-498d-a68f-ba99e1eae19c', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-21', NULL, '2022-03-20 17:46:23', '2022-03-20 17:46:23'),
('ef0f3e53-9eb9-4c07-b923-a58b71b8f5da', '2edad0bd-6f88-4961-a6af-e6a6f0c53060', '66e22622-968c-452f-9d0f-37d75ea585d5', 2000, '2022-03-17', NULL, '2022-03-17 08:20:43', '2022-03-17 08:20:43'),
('ef855901-86b0-4b2f-adc1-9d3675b909da', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-20', NULL, '2022-03-20 15:16:27', '2022-03-20 15:16:27'),
('f0aeebad-e4cc-4101-91e1-7827eb3994a9', 'b6556cfb-12dc-4c44-9f81-bf9744fe4e78', '66e22622-968c-452f-9d0f-37d75ea585d5', 22222, '2022-03-17', NULL, '2022-03-17 13:16:19', '2022-03-17 13:16:19'),
('f13f56df-49cd-41cf-8cd9-18c982a26864', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '66e22622-968c-452f-9d0f-37d75ea585d5', 50000, '2022-06-21', NULL, '2022-06-21 13:44:29', '2022-06-21 13:44:29'),
('f5baeeec-19fc-4ab6-a89a-c570c9d8a2dc', 'b6556cfb-12dc-4c44-9f81-bf9744fe4e78', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-03-17', NULL, '2022-03-17 13:26:19', '2022-03-17 13:26:19'),
('fa93f13b-25b8-44e4-b24e-cfd828a22636', '25554bb7-e85a-41ee-bbb6-1dbbf082efdc', '66e22622-968c-452f-9d0f-37d75ea585d5', 30000, '2022-03-20', NULL, '2022-03-20 15:02:27', '2022-03-20 15:02:27'),
('fb81b9af-4aba-481b-9f88-5108b4c83f24', '22796c38-02cb-45ed-a709-a342946a1c4c', '66e22622-968c-452f-9d0f-37d75ea585d5', 30000, '2022-03-20', NULL, '2022-03-20 13:41:06', '2022-03-20 13:41:06'),
('fccdb846-d8ee-4b7a-bc86-85a0fed20a1a', '4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', '66e22622-968c-452f-9d0f-37d75ea585d5', 10000, '2022-03-20', NULL, '2022-03-20 15:10:12', '2022-03-20 15:10:12'),
('fccf4116-2aeb-4826-9af4-b309aa6aecc8', 'b6556cfb-12dc-4c44-9f81-bf9744fe4e78', '66e22622-968c-452f-9d0f-37d75ea585d5', 22222, '2022-03-17', NULL, '2022-03-17 13:24:13', '2022-03-17 13:24:13'),
('fe2fb687-ece2-4b9d-b40c-38eec7d5d339', '7e67b353-585d-45f0-8e11-378edbe83c99', '66e22622-968c-452f-9d0f-37d75ea585d5', 122222, '2022-03-17', NULL, '2022-03-17 13:04:28', '2022-03-17 13:04:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_06_07_063445_create_roles_table', 1),
(2, '2021_06_07_063538_create_users_table', 1),
(3, '2021_06_07_063539_create_wallets_table', 1),
(4, '2021_10_07_172823_create_config_payments_table', 1),
(5, '2021_10_07_172920_create_main_payments_table', 1),
(6, '2021_10_07_172942_create_monthly_payments_table', 1),
(7, '2021_10_07_172959_create_other_payments_table', 1),
(8, '2021_10_07_173112_create_yearly_logs_table', 1),
(9, '2021_10_07_173141_create_withdraws_table', 1),
(10, '2022_02_08_164646_add_payment_year_column_in_monthly_payments', 2),
(11, '2022_02_08_165031_add_payment_year_column_in_other_payments', 2);

-- --------------------------------------------------------

--
-- Table structure for table `monthly_payments`
--

CREATE TABLE `monthly_payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_payment_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_month` int(11) DEFAULT NULL,
  `paid_at` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `monthly_payments`
--

INSERT INTO `monthly_payments` (`id`, `user_id`, `config_payment_id`, `amount`, `payment_month`, `paid_at`, `deleted_at`, `created_at`, `updated_at`, `payment_year`) VALUES
('04dfa631-c86c-43de-ad22-cc39cd45ce84', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 4, NULL, NULL, '2022-06-21 14:30:05', '2022-06-21 14:30:05', '2022'),
('0a492afb-e528-4385-b16a-5f8deabb6311', '7e67b353-585d-45f0-8e11-378edbe83c99', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 8, NULL, NULL, '2022-03-17 13:36:30', '2022-03-17 13:36:30', '2022'),
('0f8c84ac-0afc-4bd4-8824-b7fe55c99480', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 2, NULL, NULL, '2022-06-21 14:30:05', '2022-06-21 14:30:05', '2022'),
('157ec08a-26c6-407b-8424-90f04cd0dfb1', '3616550e-5270-4d70-ae2c-c15772f73887', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 4, NULL, NULL, '2022-03-11 18:45:05', '2022-03-11 18:45:05', '2022'),
('1c36b890-1095-4624-b0e9-a082a71c1fc2', '7e67b353-585d-45f0-8e11-378edbe83c99', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 50000, 2, '2022-06-13', NULL, '2022-03-17 13:36:30', '2022-06-12 19:17:12', '2022'),
('232b37a5-7cf7-4a77-99e1-05016f9c189a', '3616550e-5270-4d70-ae2c-c15772f73887', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 8, NULL, NULL, '2022-03-11 18:45:05', '2022-03-11 18:45:05', '2022'),
('3a5dba5a-f34a-4dac-abae-a6c3cce24d22', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 6, NULL, NULL, '2022-06-21 14:30:05', '2022-06-21 14:30:05', '2022'),
('3a765d6e-c2ef-420e-b182-db9f2001b810', '3616550e-5270-4d70-ae2c-c15772f73887', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 50000, 5, '2022-03-12', NULL, '2022-03-11 18:45:05', '2022-03-11 18:45:12', '2022'),
('416c66f4-e802-4c10-b3d3-46f05d0b3f2c', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 8, NULL, NULL, '2022-06-21 14:30:05', '2022-06-21 14:30:05', '2022'),
('43c9f119-0497-46c1-a608-ca4780d3f6fd', '7e67b353-585d-45f0-8e11-378edbe83c99', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 3, NULL, NULL, '2022-03-17 13:36:30', '2022-03-17 13:36:30', '2022'),
('489cde2b-58e1-49e8-be43-171324772ed3', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 50000, 1, '2022-06-21', NULL, '2022-06-21 14:30:05', '2022-06-21 14:30:06', '2022'),
('51674f6b-395c-438d-b32d-996e15b3e908', '3616550e-5270-4d70-ae2c-c15772f73887', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 3, NULL, NULL, '2022-03-11 18:45:05', '2022-03-11 18:45:05', '2022'),
('522911f9-a78a-48e8-b59c-ca758cf74504', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 12, NULL, NULL, '2022-06-21 14:30:06', '2022-06-21 14:30:06', '2022'),
('5562df45-8c4d-40b9-b545-1c2bf33c7fd8', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 9, NULL, NULL, '2022-06-21 14:30:05', '2022-06-21 14:30:05', '2022'),
('69058495-8d3c-4907-a903-2df1bf09a89a', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 10, NULL, NULL, '2022-06-21 14:30:05', '2022-06-21 14:30:05', '2022'),
('7420d723-5326-472c-b986-775d57efe75b', '7e67b353-585d-45f0-8e11-378edbe83c99', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 6, NULL, NULL, '2022-03-17 13:36:30', '2022-03-17 13:36:30', '2022'),
('854b9f2a-8064-4c59-9dce-b0a4861242b8', '3616550e-5270-4d70-ae2c-c15772f73887', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 7, NULL, NULL, '2022-03-11 18:45:05', '2022-03-11 18:45:05', '2022'),
('8e680805-bfa5-4b10-bc19-6ff68f1e9bd7', '3616550e-5270-4d70-ae2c-c15772f73887', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 50000, 2, '2022-03-12', NULL, '2022-03-11 18:45:05', '2022-03-11 18:45:17', '2022'),
('93e098ef-7c74-4b1b-8513-dd692ad1ab13', '3616550e-5270-4d70-ae2c-c15772f73887', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 12, NULL, NULL, '2022-03-11 18:45:05', '2022-03-11 18:45:05', '2022'),
('9d03aad2-8444-4bf6-9316-c89bdb08c926', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 5, NULL, NULL, '2022-06-21 14:30:05', '2022-06-21 14:30:05', '2022'),
('9eb99786-757c-4716-bf25-ec7733c32374', '7e67b353-585d-45f0-8e11-378edbe83c99', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 10, NULL, NULL, '2022-03-17 13:36:30', '2022-03-17 13:36:30', '2022'),
('9f784e9a-edf6-4dc3-9347-fc9bf7523f78', '7e67b353-585d-45f0-8e11-378edbe83c99', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 50000, 1, '2022-03-17', NULL, '2022-03-17 13:36:29', '2022-03-17 13:36:30', '2022'),
('a09991d5-dea9-4283-888c-a4d2fd292fbf', '7e67b353-585d-45f0-8e11-378edbe83c99', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 7, NULL, NULL, '2022-03-17 13:36:30', '2022-03-17 13:36:30', '2022'),
('a445762a-e20d-4acf-9404-f3d5eb367191', '7e67b353-585d-45f0-8e11-378edbe83c99', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 5, NULL, NULL, '2022-03-17 13:36:30', '2022-03-17 13:36:30', '2022'),
('a5175405-cbf9-42c5-9329-0d04cdf9023b', '3616550e-5270-4d70-ae2c-c15772f73887', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 11, NULL, NULL, '2022-03-11 18:45:05', '2022-03-11 18:45:05', '2022'),
('a7567810-52f8-4d69-91a8-40a300aa299c', '7e67b353-585d-45f0-8e11-378edbe83c99', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 9, NULL, NULL, '2022-03-17 13:36:30', '2022-03-17 13:36:30', '2022'),
('a9298259-c369-4166-8ca3-c1dda8f42b25', '7e67b353-585d-45f0-8e11-378edbe83c99', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 11, NULL, NULL, '2022-03-17 13:36:30', '2022-03-17 13:36:30', '2022'),
('ab03e127-97d7-4896-b1bf-fe73000ccc32', '3616550e-5270-4d70-ae2c-c15772f73887', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 6, NULL, NULL, '2022-03-11 18:45:05', '2022-03-11 18:45:05', '2022'),
('cbb7bf1c-2e50-4171-b7db-68ad8724d517', '3616550e-5270-4d70-ae2c-c15772f73887', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 9, NULL, NULL, '2022-03-11 18:45:05', '2022-03-11 18:45:05', '2022'),
('d34d132d-dc96-49e2-aabe-9c4370a686ad', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 7, NULL, NULL, '2022-06-21 14:30:05', '2022-06-21 14:30:05', '2022'),
('da1dd535-e943-4981-a6ee-0617351b30ae', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 3, NULL, NULL, '2022-06-21 14:30:05', '2022-06-21 14:30:05', '2022'),
('def64c04-bd57-424f-886d-1ec0fa21194f', '3616550e-5270-4d70-ae2c-c15772f73887', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 50000, 1, '2022-03-12', NULL, '2022-03-11 18:45:05', '2022-03-11 18:45:05', '2022'),
('e08d2d73-bec0-4868-898b-7b130f23d7f0', '3616550e-5270-4d70-ae2c-c15772f73887', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 10, NULL, NULL, '2022-03-11 18:45:05', '2022-03-11 18:45:05', '2022'),
('e7758554-6ce9-4ac7-a0fb-aa64da5ee707', '7e67b353-585d-45f0-8e11-378edbe83c99', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 4, NULL, NULL, '2022-03-17 13:36:30', '2022-03-17 13:36:30', '2022'),
('ea9028e8-7c67-481a-a955-ac91f2cde3f6', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 11, NULL, NULL, '2022-06-21 14:30:06', '2022-06-21 14:30:06', '2022'),
('faefebb6-16d3-4828-ac30-42a05bb67e4e', '7e67b353-585d-45f0-8e11-378edbe83c99', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 12, NULL, NULL, '2022-03-17 13:36:30', '2022-03-17 13:36:30', '2022');

-- --------------------------------------------------------

--
-- Table structure for table `other_payments`
--

CREATE TABLE `other_payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_month` int(11) DEFAULT NULL,
  `paid_at` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
('414e5aab-19b7-4bb0-b185-01d0324edc38', 'user', NULL, '2022-03-11 18:18:29', '2022-03-11 18:18:29'),
('5e5279ee-8275-48a0-bdc3-31953db78e7b', 'admin', NULL, '2022-02-04 15:40:10', '2022-02-04 15:40:10'),
('7ad38ef8-f5e7-4635-8cac-5d43c0a65f15', 'admin', NULL, '2022-03-11 18:18:29', '2022-03-11 18:18:29'),
('b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', 'user', NULL, '2022-02-04 15:40:10', '2022-02-04 15:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_belanja`
--

CREATE TABLE `tb_belanja` (
  `id` int(11) NOT NULL,
  `no_trax` varchar(100) NOT NULL,
  `atribut` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_belanja`
--

INSERT INTO `tb_belanja` (`id`, `no_trax`, `atribut`) VALUES
(1, 'TRX9171784-220621035052', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:9:\"Americano\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:13:\"Hot Kopi Aren\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:18000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(2, 'TRX2803815-220621025249', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:9:\"Americano\";}}'),
(3, 'TRX2410531-220621032640', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}}'),
(4, 'TRX134715-220621032335', 'a:2:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}}'),
(5, 'TRX3651913-220621031900', 'a:1:{i:0;a:4:{s:3:\"qty\";i:7;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:56000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}}'),
(6, 'TRX8307029-220621030505', 'a:1:{i:0;a:4:{s:3:\"qty\";i:6;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:48000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}}'),
(7, 'TRX8832163-220621030356', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:15:\"Teh Botol 350ml\";}i:1;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:6000;s:9:\"nm_barang\";s:11:\"Wafelo 2000\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:8:\"Bengbeng\";}}'),
(8, 'TRX9969211-220621025854', 'a:4:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:9:\"Cappucino\";}i:1;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:45000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}i:3;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:8:\"Bengbeng\";}}'),
(9, 'TRX7372106-220621025750', 'a:1:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}}'),
(10, 'TRX7690759-220621025637', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:18000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}}'),
(11, 'TRX4912898-220621025028', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Caramel Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}}'),
(12, 'TRX5410644-220621024520', 'a:5:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:18:\"Ice Hazelnut Latte\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:12:\"kripik tempe\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}}'),
(13, 'TRX6430091-220621023315', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(14, 'TRX1904378-220621022726', 'a:2:{i:0;a:4:{s:3:\"qty\";i:4;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:5:\"Prima\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}}'),
(15, 'TRX1295502-220621022103', 'a:4:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:2;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:7500;s:9:\"nm_barang\";s:11:\"kripik 2500\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:15:\"Teh Botol 350ml\";}}'),
(16, 'TRX6979432-220621021709', 'a:2:{i:0;a:4:{s:3:\"qty\";i:4;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:40000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(17, 'TRX8541967-220621015608', 'a:5:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:16:\"Stea Kotak 200ml\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:7:\"Apetito\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:8:\"Slayolay\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:8:\"Bengbeng\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:10:\"Super Star\";}}'),
(18, 'TRX8008949-220621014411', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:8:\"Cocacola\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:8:\"fruittea\";}}'),
(19, 'TRX9678817-220621012917', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:6000;s:9:\"nm_barang\";s:5:\"Prima\";}}'),
(20, 'TRX7466243-220621011212', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(21, 'TRX4897102-220621125051', 'a:4:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:17:\"Double Tape kecil\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:8:\"Cocacola\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:11:\"kripik 2500\";}}'),
(22, 'TRX3456384-220621124431', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:9:\"Cappucino\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:13:\"Hot Kopi Aren\";}}'),
(23, 'TRX8380946-220621123826', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:9:\"Cappucino\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(24, 'TRX7796577-220621123251', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Caramel Latte\";}}'),
(25, 'TRX1242759-220621122407', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:13:\"Hot Kopi Aren\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}}'),
(26, 'TRX7475902-220621122225', 'a:7:{i:0;a:4:{s:3:\"qty\";i:5;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:50000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:10:\"Marie Gold\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:10:\"Chocolatos\";}i:3;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:9000;s:9:\"nm_barang\";s:5:\"Prima\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:7:\"Basreng\";}i:5;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:7500;s:9:\"nm_barang\";s:11:\"kripik 2500\";}i:6;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:8:\"fruittea\";}}'),
(27, 'TRX4161243-220621121118', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:11:\"Ajib Burger\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:20:\"Teh Botol Kaca 220ml\";}}'),
(28, 'TRX629181-220621105159', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(29, 'TRX8638924-220621103115', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:14:\"Kerupuk Rambak\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:7:\"Apetito\";}}'),
(30, 'TRX6449297-220621102921', 'a:3:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:7500;s:9:\"nm_barang\";s:11:\"kripik 2500\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:8:\"Bengbeng\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}}'),
(31, 'TRX9296465-220621102724', 'a:4:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:12:\"Softex kecil\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:7:\"Basreng\";}i:2;a:4:{s:3:\"qty\";i:4;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:7:\"Apetito\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:8:\"Bengbeng\";}}'),
(32, 'TRX7942000-220621101519', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:11:\"kripik 2500\";}}'),
(33, 'TRX5054293-220621100927', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:12:\"Ice Amercano\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:8:\"Slayolay\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:11:\"Choki choki\";}}'),
(34, 'TRX9682261-220621100354', 'a:1:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:12:\"Ice Amercano\";}}'),
(35, 'TRX7911375-220621095406', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:12:\"Coffee Latte\";}}'),
(36, 'TRX316155-220621094235', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:11:\"kripik 2500\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:1000;s:9:\"nm_barang\";s:11:\"Tissu Basah\";}}'),
(37, 'TRX9642533-220621091225', 'a:5:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:6000;s:9:\"nm_barang\";s:5:\"Prima\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:4000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:5:\"S-Tea\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:20:\"Teh Botol Kaca 220ml\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:15:\"Makaroni Besar \";}}'),
(38, 'TRX1987308-220620040656', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:11:\"Hot Spanish\";}}'),
(39, 'TRX1412010-220620033511', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Caramel Latte\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:7:\"Basreng\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}}'),
(40, 'TRX4367019-220620033344', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:6:\"Cimory\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:7:\"Basreng\";}}'),
(41, 'TRX8137233-220620033322', 'a:7:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:16:\"Buku Tulis Kecil\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1500;s:9:\"sub_total\";i:1500;s:9:\"nm_barang\";s:12:\"spidol kecil\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:7:\"Basreng\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:6:\"Cimory\";}i:5;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:15:\"Penghapus Joyko\";}i:6;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:1000;s:9:\"nm_barang\";s:9:\"Ciki 1000\";}}'),
(42, 'TRX4228692-220620032738', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:9:\"Ice Latte\";}}'),
(43, 'TRX1121314-220620032224', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(44, 'TRX8731865-220620031834', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:11:\"Ajib Burger\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:12:\"Coffee Latte\";}}'),
(45, 'TRX9354973-220620025951', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:11:\"Ajib Burger\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(46, 'TRX330003-220620024347', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:15:\"Teh Botol 350ml\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}}'),
(47, 'TRX8574908-220620021852', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:7:\"Basreng\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:15:\"Makaroni Besar \";}}'),
(48, 'TRX9440884-220620015859', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:55000;s:9:\"sub_total\";i:55000;s:9:\"nm_barang\";s:19:\"Spanish Latte 600ml\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:36000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:3;a:4:{s:3:\"qty\";i:5;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}i:4;a:4:{s:3:\"qty\";i:4;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:5:\"Prima\";}}'),
(49, 'TRX865654-220620015243', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:55000;s:9:\"sub_total\";i:55000;s:9:\"nm_barang\";s:19:\"Spanish Latte 600ml\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:18000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:3;a:4:{s:3:\"qty\";i:5;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}i:4;a:4:{s:3:\"qty\";i:4;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:5:\"Prima\";}}'),
(50, 'TRX3253890-220620015558', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:7:\"Basreng\";}i:1;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:15:\"Makaroni Besar \";}}'),
(51, 'TRX8758560-220620015444', 'a:4:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:7:\"Basreng\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:6:\"Kripca\";}}'),
(52, 'TRX7996848-220620012525', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(53, 'TRX3502572-220620012315', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(54, 'TRX926866-220620011722', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(55, 'TRX2505266-220620010703', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(56, 'TRX8479841-220620010514', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(57, 'TRX8123494-220620125437', 'a:5:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:8:\"fruittea\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:9:\"Ciki 1000\";}i:3;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:1000;s:9:\"nm_barang\";s:6:\"Permen\";}}'),
(58, 'TRX9993611-220620125150', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:6000;s:9:\"nm_barang\";s:21:\"Teh botol kotak 200ml\";}i:1;a:4:{s:3:\"qty\";i:4;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}}'),
(59, 'TRX971836-220620121258', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(60, 'TRX3970070-220620114208', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:7000;s:9:\"sub_total\";i:7000;s:9:\"nm_barang\";s:12:\"Popmie Seduh\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:8:\"fruittea\";}}'),
(61, 'TRX4288861-220620112834', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(62, 'TRX509415-220620112653', 'a:1:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:18:\"Espresso Americano\";}}'),
(63, 'TRX9175508-220620112600', 'a:5:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:8:\"Cocacola\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:4000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:5:\"S-Tea\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:6000;s:9:\"nm_barang\";s:5:\"Prima\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:10:\"Super Star\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:8:\"fruittea\";}}'),
(64, 'TRX9715555-220620112322', 'a:4:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:18000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:38000;s:9:\"sub_total\";i:38000;s:9:\"nm_barang\";s:11:\"Pizza Promo\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:11:\"Ajib Burger\";}}'),
(65, 'TRX2040770-220620104749', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:18000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}}'),
(66, 'TRX1059070-220620111925', 'a:1:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}}'),
(67, 'TRX7562098-220620110733', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(68, 'TRX5089939-220620110525', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 2\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(69, 'TRX1700346-220620110240', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Kentang Sosis\";}}'),
(70, 'TRX5721826-220620104855', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}}'),
(71, 'TRX1125765-220620104709', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:10:\"Marie Gold\";}}'),
(72, 'TRX440212-220620104525', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:7:\"Ice tea\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(73, 'TRX8935278-220620103353', 'a:7:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:7:\"Ice tea\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:7:\"Apetito\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:1000;s:9:\"nm_barang\";s:10:\"Chocolatos\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:1000;s:9:\"nm_barang\";s:10:\"ABC sambal\";}i:5;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1500;s:9:\"sub_total\";i:1500;s:9:\"nm_barang\";s:7:\"BonCabe\";}i:6;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}}'),
(74, 'TRX3553342-220620103232', 'a:4:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:11:\"Sosis Bakar\";}i:2;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:6000;s:9:\"nm_barang\";s:7:\"Apetito\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}}'),
(75, 'TRX5140146-220620102356', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(76, 'TRX6437411-220620101853', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:4000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:5:\"S-Tea\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:5:\"Arden\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:6:\"Better\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:1000;s:9:\"nm_barang\";s:9:\"Ciki 1000\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}}'),
(77, 'TRX1354847-220620100536', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(78, 'TRX646145-220620094802', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:18:\"Iced Vanilla Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:7:\"Apetito\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:6:\"Malkis\";}}'),
(79, 'TRX2080919-220620094144', 'a:7:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:4000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:5:\"S-Tea\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3500;s:9:\"sub_total\";i:3500;s:9:\"nm_barang\";s:10:\"Tolakangin\";}i:3;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:6:\"Malkis\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:1000;s:9:\"nm_barang\";s:11:\"Roma Kelapa\";}i:5;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:1000;s:9:\"nm_barang\";s:10:\"Chocolatos\";}i:6;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:6:\"Permen\";}}'),
(80, 'TRX8970824-220620093607', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(81, 'TRX960735-220620093343', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `tb_poin_fandi`
--

CREATE TABLE `tb_poin_fandi` (
  `id_poin` int(11) NOT NULL,
  `jumlah_poin` int(11) DEFAULT NULL,
  `id_transaksi` varchar(255) DEFAULT NULL,
  `tanggal_poin` date DEFAULT NULL,
  `id_user` varchar(255) NOT NULL,
  `nominal` int(11) DEFAULT NULL,
  `status` enum('hapus','aktif') NOT NULL DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_poin_fandi`
--

INSERT INTO `tb_poin_fandi` (`id_poin`, `jumlah_poin`, `id_transaksi`, `tanggal_poin`, `id_user`, `nominal`, `status`) VALUES
(305, 2, 'TRX9885623-220621040956', '2022-06-21', 'kopkar polindra', 20000, 'aktif'),
(306, 8, 'TRX9171784-220621035052', '2022-06-21', 'kopkar polindra', 67000, 'aktif'),
(307, 9, 'TRX2803815-220621025249', '2022-06-21', 'kopkar polindra', 12000, 'aktif'),
(308, 11, 'TRX2410531-220621032640', '2022-06-21', 'kopkar polindra', 11000, 'aktif'),
(309, 14, 'TRX134715-220621032335', '2022-06-21', 'kopkar polindra', 33000, 'aktif'),
(310, 19, 'TRX3651913-220621031900', '2022-06-21', 'kopkar polindra', 56000, 'aktif'),
(311, 24, 'TRX8307029-220621030505', '2022-06-21', 'kopkar polindra', 48000, 'aktif'),
(312, 26, 'TRX8832163-220621030356', '2022-06-21', 'kopkar polindra', 15000, 'aktif'),
(313, 32, 'TRX9969211-220621025854', '2022-06-21', 'kopkar polindra', 65000, 'aktif'),
(314, 34, 'TRX7372106-220621025750', '2022-06-21', 'kopkar polindra', 20000, 'aktif'),
(315, 36, 'TRX7690759-220621025637', '2022-06-21', 'kopkar polindra', 18000, 'aktif'),
(316, 39, 'TRX4912898-220621025028', '2022-06-21', 'kopkar polindra', 25000, 'aktif'),
(317, 46, 'TRX5410644-220621024520', '2022-06-21', 'kopkar polindra', 73000, 'aktif'),
(318, 47, 'TRX6430091-220621023315', '2022-06-21', 'kopkar polindra', 15000, 'aktif'),
(319, 49, 'TRX1904378-220621022726', '2022-06-21', 'kopkar polindra', 16000, 'aktif'),
(320, 53, 'TRX1295502-220621022103', '2022-06-21', 'kopkar polindra', 40500, 'aktif'),
(321, 58, 'TRX6979432-220621021709', '2022-06-21', 'kopkar polindra', 55000, 'aktif'),
(322, 60, 'TRX8541967-220621015608', '2022-06-21', 'kopkar polindra', 15000, 'aktif'),
(323, 62, 'TRX8008949-220621014411', '2022-06-21', 'kopkar polindra', 18000, 'aktif'),
(324, 63, 'TRX9678817-220621012917', '2022-06-21', 'kopkar polindra', 16000, 'aktif'),
(325, 90, 'TRX7466243-220621011212', '2022-06-21', 'kopkar polindra', 265000, 'aktif'),
(326, 93, 'TRX4897102-220621125051', '2022-06-21', 'kopkar polindra', 30500, 'aktif'),
(327, 95, 'TRX3456384-220621124431', '2022-06-21', 'kopkar polindra', 24000, 'aktif'),
(328, 98, 'TRX8380946-220621123826', '2022-06-21', 'kopkar polindra', 27000, 'aktif'),
(329, 100, 'TRX7796577-220621123251', '2022-06-21', 'kopkar polindra', 15000, 'aktif'),
(330, 103, 'TRX1242759-220621122407', '2022-06-21', 'kopkar polindra', 37000, 'aktif'),
(331, 112, 'TRX7475902-220621122225', '2022-06-21', 'kopkar polindra', 85500, 'aktif'),
(332, 114, 'TRX4161243-220621121118', '2022-06-21', 'kopkar polindra', 17500, 'aktif'),
(333, 116, 'TRX629181-220621105159', '2022-06-21', 'kopkar polindra', 25000, 'aktif'),
(334, 118, 'TRX8638924-220621103115', '2022-06-21', 'kopkar polindra', 16000, 'aktif'),
(335, 119, 'TRX6449297-220621102921', '2022-06-21', 'kopkar polindra', 13500, 'aktif'),
(336, 121, 'TRX9296465-220621102724', '2022-06-21', 'kopkar polindra', 22000, 'aktif'),
(337, 122, 'TRX7942000-220621101519', '2022-06-21', 'kopkar polindra', 12500, 'aktif'),
(338, 124, 'TRX5054293-220621100927', '2022-06-21', 'kopkar polindra', 16000, 'aktif'),
(339, 126, 'TRX9682261-220621100354', '2022-06-21', 'kopkar polindra', 24000, 'aktif'),
(340, 128, 'TRX7911375-220621095406', '2022-06-21', 'kopkar polindra', 12000, 'aktif'),
(341, 130, 'TRX316155-220621094235', '2022-06-21', 'kopkar polindra', 21000, 'aktif'),
(342, 132, 'TRX9642533-220621091225', '2022-06-21', 'kopkar polindra', 22500, 'aktif'),
(343, 1, 'TRX1987308-220620040656', '2022-06-20', 'kopkar polindra', 15000, 'aktif'),
(344, 5, 'TRX1412010-220620033511', '2022-06-20', 'kopkar polindra', 43000, 'aktif'),
(345, 7, 'TRX4367019-220620033344', '2022-06-20', 'kopkar polindra', 15000, 'aktif'),
(346, 10, 'TRX8137233-220620033322', '2022-06-20', 'kopkar polindra', 33500, 'aktif'),
(347, 12, 'TRX4228692-220620032738', '2022-06-20', 'kopkar polindra', 23000, 'aktif'),
(348, 39, 'TRX1121314-220620032224', '2022-06-20', 'kopkar polindra', 265000, 'aktif'),
(349, 42, 'TRX8731865-220620031834', '2022-06-20', 'kopkar polindra', 27000, 'aktif'),
(350, 45, 'TRX9354973-220620025951', '2022-06-20', 'kopkar polindra', 30000, 'aktif'),
(351, 46, 'TRX330003-220620024347', '2022-06-20', 'kopkar polindra', 15000, 'aktif'),
(352, 48, 'TRX8574908-220620021852', '2022-06-20', 'kopkar polindra', 18000, 'aktif'),
(353, 61, 'TRX9440884-220620015859', '2022-06-20', 'kopkar polindra', 133000, 'aktif'),
(354, 73, 'TRX865654-220620015243', '2022-06-20', 'kopkar polindra', 115000, 'aktif'),
(355, 77, 'TRX3253890-220620015558', '2022-06-20', 'kopkar polindra', 44000, 'aktif'),
(356, 81, 'TRX8758560-220620015444', '2022-06-20', 'kopkar polindra', 42000, 'aktif'),
(357, 108, 'TRX7996848-220620012525', '2022-06-20', 'kopkar polindra', 265000, 'aktif'),
(358, 134, 'TRX3502572-220620012315', '2022-06-20', 'kopkar polindra', 265000, 'aktif'),
(359, 161, 'TRX926866-220620011722', '2022-06-20', 'kopkar polindra', 265000, 'aktif'),
(360, 187, 'TRX2505266-220620010703', '2022-06-20', 'kopkar polindra', 265000, 'aktif'),
(361, 214, 'TRX8479841-220620010514', '2022-06-20', 'kopkar polindra', 265000, 'aktif'),
(362, 216, 'TRX8123494-220620125437', '2022-06-20', 'kopkar polindra', 20000, 'aktif'),
(363, 217, 'TRX9993611-220620125150', '2022-06-20', 'kopkar polindra', 14000, 'aktif'),
(364, 220, 'TRX971836-220620121258', '2022-06-20', 'kopkar polindra', 30000, 'aktif'),
(365, 222, 'TRX3970070-220620114208', '2022-06-20', 'kopkar polindra', 14000, 'aktif'),
(366, 248, 'TRX4288861-220620112834', '2022-06-20', 'kopkar polindra', 265000, 'aktif'),
(367, 251, 'TRX509415-220620112653', '2022-06-20', 'kopkar polindra', 24000, 'aktif'),
(368, 253, 'TRX9175508-220620112600', '2022-06-20', 'kopkar polindra', 27000, 'aktif'),
(369, 263, 'TRX9715555-220620112322', '2022-06-20', 'kopkar polindra', 101000, 'aktif'),
(370, 268, 'TRX2040770-220620104749', '2022-06-20', 'kopkar polindra', 48000, 'aktif'),
(371, 270, 'TRX1059070-220620111925', '2022-06-20', 'kopkar polindra', 20000, 'aktif'),
(372, 772, 'TRX7562098-220620110733', '2022-06-20', 'kopkar polindra', 5015000, 'aktif'),
(373, 1273, 'TRX5089939-220620110525', '2022-06-20', 'kopkar polindra', 5015000, 'aktif'),
(374, 1275, 'TRX1700346-220620110240', '2022-06-20', 'kopkar polindra', 15000, 'aktif'),
(375, 1277, 'TRX5721826-220620104855', '2022-06-20', 'kopkar polindra', 28000, 'aktif'),
(376, 1279, 'TRX1125765-220620104709', '2022-06-20', 'kopkar polindra', 19000, 'aktif'),
(377, 1281, 'TRX440212-220620104525', '2022-06-20', 'kopkar polindra', 15000, 'aktif'),
(378, 1283, 'TRX8935278-220620103353', '2022-06-20', 'kopkar polindra', 24500, 'aktif'),
(379, 1286, 'TRX3553342-220620103232', '2022-06-20', 'kopkar polindra', 31000, 'aktif'),
(380, 1313, 'TRX5140146-220620102356', '2022-06-20', 'kopkar polindra', 265000, 'aktif'),
(381, 1314, 'TRX6437411-220620101853', '2022-06-20', 'kopkar polindra', 11000, 'aktif'),
(382, 1341, 'TRX1354847-220620100536', '2022-06-20', 'kopkar polindra', 265000, 'aktif'),
(383, 1342, 'TRX646145-220620094802', '2022-06-20', 'kopkar polindra', 19000, 'aktif'),
(384, 1345, 'TRX2080919-220620094144', '2022-06-20', 'kopkar polindra', 29500, 'aktif'),
(385, 1372, 'TRX8970824-220620093607', '2022-06-20', 'kopkar polindra', 265000, 'aktif'),
(386, 1398, 'TRX960735-220620093343', '2022-06-20', 'kopkar polindra', 265000, 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_banned` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `registered_at` date NOT NULL,
  `tmt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `member_id`, `email`, `username`, `password`, `name`, `phone_number`, `address`, `is_banned`, `status`, `main_payment_status`, `registered_at`, `tmt`, `deleted_at`, `created_at`, `updated_at`) VALUES
('049cffac-d31f-4fb1-866b-2fb6f967a7cc', '414e5aab-19b7-4bb0-b185-01d0324edc38', '12121', 'afandi3120@gmail.com', 'user@gmail.com', '$2y$10$tyG4CSuvMBUDjebxsPVSROsnNRArFTXUsuBH5vLQoxpDsp/8elVP2', 'Imam santosa', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '1', 1, '2022-03-17', '1', '2022-06-10 16:25:28', '2022-03-17 13:41:53', '2022-06-10 16:25:28'),
('0c341878-4a12-42d7-8f5b-f46873efb942', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '21122', 'agus_afandi44@yahoo.com', 'diki', 'diki123', 'diki', '08221122187491', 'indramayu', 0, '1', 1, '2022-02-09', '22', '2022-02-10 11:07:53', '2022-02-09 11:08:19', '2022-02-10 11:07:53'),
('1642f6da-a762-4984-9f69-d81d99d536fc', '414e5aab-19b7-4bb0-b185-01d0324edc38', NULL, 'teest@gmail.com', 'ardiantry', '$2y$10$96LfAVwTfHtphJjVgnPGV.9zht0Pk9RUSAqH1fww21vp91raK7HgS', 'ardian', '1234567898765', 'test', 0, '1', 0, '2022-06-13', '12345678', '2022-06-13 13:04:03', '2022-06-13 12:46:20', '2022-06-13 13:04:03'),
('22796c38-02cb-45ed-a709-a342946a1c4c', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903002', 'isall@gmail.com', 'user@gmail.com', 'user123', 'isal isul', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '0', 0, '2022-03-18', '1', NULL, '2022-03-18 02:56:01', '2022-03-18 02:56:01'),
('228e99d4-3ad6-4408-9c90-fb0c71e7224c', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '212121122121', 'user@gmail.comas', 'user@gmail.as', 'user123', 'wasasdasd', '212121122121', 'assasasa', 0, '0', 1, '2022-02-10', '142', '2022-03-17 08:12:41', '2022-02-10 11:46:37', '2022-03-17 08:12:41'),
('25554bb7-e85a-41ee-bbb6-1dbbf082efdc', '414e5aab-19b7-4bb0-b185-01d0324edc38', '19030122', 'afandi3120@gmail.com', 'user@gmail.com', 'user123', 'mamat hidayat', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '1', 0, '2022-03-17', NULL, '2022-06-10 16:16:23', '2022-03-17 15:24:27', '2022-06-10 16:16:23'),
('2edad0bd-6f88-4961-a6af-e6a6f0c53060', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903020', 'afandi3120@gmail.com', 'agusafandi', 'afandi3120', 'agus afandi', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '1', 0, '2022-03-17', '12', NULL, '2022-03-17 08:18:57', '2022-03-17 08:18:57'),
('3616550e-5270-4d70-ae2c-c15772f73887', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '212121122121', 'adminutama@gmail.com', 'user@gmail.com', 'user123', 'Admin Afandi agus asass', '08212211212', 'indramayu', 0, '1', 1, '2022-02-10', '333', '2022-03-17 08:12:46', '2022-02-10 11:12:35', '2022-03-17 08:12:46'),
('4a5737b0-ccb7-41d1-a260-b0288e1732bb', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903013', 'Halimah@gmail.com', 'halimah syahdiah', '$2y$10$dxTcOM/hXfTmBm1/NDeT/.lBRCFYn0ioBEKgfoARrT5FFPZ/PRjzi', 'halimah', '08178278278278', 'jln. pertiwi', 0, '0', 0, '2022-03-20', NULL, NULL, '2022-03-20 15:14:32', '2022-03-20 15:15:11'),
('4c1edbc8-d4c9-4256-a83d-990a4f77c529', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903027', 'rapi@gmail.com', 'rapi setya', 'kopkar312', 'rai setya', '086621312312', 'sindang', 0, '1', 0, '2022-03-22', NULL, '2022-06-10 16:19:51', '2022-03-22 08:32:08', '2022-06-10 16:19:51'),
('4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903028', 'Uun menari', 'uun', 'kopkar312', 'uun', '08512312672', 'jln. sudirman', 0, '0', 0, '2022-03-20', NULL, NULL, '2022-03-20 15:06:56', '2022-03-20 15:06:56'),
('67452897-42c4-4bb4-8440-3a5eea43cbd3', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '1903020', 'user@gmail.com', 'user', 'afandi', 'afandi', '08212211212', 'nganjuk', 0, '1', 1, '2022-02-07', '1', '2022-02-10 11:07:58', '2022-02-06 18:00:51', '2022-02-10 11:07:58'),
('6b2accc5-3620-4592-8fc1-1b51d5dcd467', '414e5aab-19b7-4bb0-b185-01d0324edc38', '12345678', 'ardiansdr@gmail.com', 'user', '12345678', 'ardian', '085422567825', 'indramayu', 0, '1', 0, '2022-06-13', '123456', '2022-06-13 13:10:43', '2022-06-13 13:05:14', '2022-06-13 13:10:43'),
('7e67b353-585d-45f0-8e11-378edbe83c99', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903012', 'assa0@gmail.com', 'afanid', '$2y$10$WzgevrsmP7fNaFBnJxMN5e0jdMaca1Rw/E2FbPgSs1wvOOT8AgdBO', 'Dicki Prastya', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '0', 1, '2022-03-17', '3222222222222222', NULL, '2022-03-17 13:01:27', '2022-03-17 16:31:09'),
('7f7aaaf9-9067-4a13-bbc1-c650a55c3707', '5e5279ee-8275-48a0-bdc3-31953db78e7b', NULL, NULL, 'admin', '$2y$10$BAR5C0o5oxw6TgDiOWbT5u1MMUJt7jbFu8h4X2ImNIWVS31ScOr5m', 'Superadmin', '0895334623006', NULL, 0, '1', 0, '2022-03-12', NULL, NULL, '2022-03-11 18:18:30', '2022-03-11 18:18:30'),
('9699e020-6ae6-4e84-aba2-a93937d829be', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903001', 'adhitya ilham UI', 'adhitya', 'kopkar312', 'adhitya ilham', '089211667472', 'jln. Gempir jombang', 0, '0', 0, '2022-03-21', NULL, NULL, '2022-03-20 17:49:13', '2022-03-20 17:49:13'),
('99282f6c-81ad-4d2b-b2b4-94c6302cd0e8', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '1903020', 'user@gmail.com', 'afandi', 'afandi', 'afandi', '082232187491', 'nganjuk', 0, '1', 1, '2022-02-04', '1', '2022-02-06 18:00:13', '2022-02-04 15:42:16', '2022-02-06 18:00:13'),
('a8667bf8-55e1-473d-94c0-39f32777b79c', '414e5aab-19b7-4bb0-b185-01d0324edc38', 'kopkar polindra', 'ardiansdr@gmail.com', 'kopkap', '$2y$10$Jv33WJ4Gxm1wcJe8YnQ2FuRpTtMOEMTxWSgW2eihx4pc9fzvPwpWm', 'kopkar polindra', '098765456876', 'indramayu', 0, '1', 1, '2022-06-13', '12345678', NULL, '2022-06-13 13:11:55', '2022-06-21 13:44:29'),
('b6556cfb-12dc-4c44-9f81-bf9744fe4e78', '414e5aab-19b7-4bb0-b185-01d0324edc38', '2112212', 'afandi3120@gmail.com', 'user@gmail.com', '$2y$10$L8/4vW.RgwS7labWZbjcSuDUBO7Gh4ITiUKxlunUOaW90L8NTLTMe', 'Idang wiguna', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '1', 0, '2022-03-17', '2', NULL, '2022-03-17 13:16:04', '2022-03-17 16:33:39'),
('c80864ee-bc31-4847-9b59-5db60342439c', '414e5aab-19b7-4bb0-b185-01d0324edc38', NULL, 'isall@gmail.com', 'isallaku', 'user123', 'isal isul', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '0', 0, '2022-03-18', '1', '2022-03-18 02:54:51', '2022-03-18 02:53:52', '2022-03-18 02:54:51'),
('d7181500-943d-4e7a-8d07-68048e3e1560', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '12311', 'adminutama@gmail.com', 'adminutama@gmail.com', '12212121', 'afandisa', '08212211212', 'waassasa', 0, '1', 1, '2022-02-09', '42', '2022-03-17 08:12:35', '2022-02-09 11:21:07', '2022-03-17 08:12:35'),
('dfff588e-2d03-4d5f-8861-972c4747080a', '5e5279ee-8275-48a0-bdc3-31953db78e7b', NULL, NULL, 'admin', '$2y$10$8vBwbTf7sy9d/0u5ZUcyu.xxF8Mi4SstbYg1lrZxAvOPtV2TpY9aO', 'Superadmin', '0895334623006', NULL, 0, '1', 0, '2022-02-04', NULL, NULL, '2022-02-04 15:40:11', '2022-02-04 15:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `monthly` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `other` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `main`, `monthly`, `other`, `total`, `deleted_at`, `created_at`, `updated_at`) VALUES
('0154b6c3-fc64-4457-b669-ea862d149ed7', '22796c38-02cb-45ed-a709-a342946a1c4c', '114000', '0', '0', '114000', NULL, '2022-03-18 02:56:42', '2022-03-20 14:58:30'),
('031b374f-b16d-4082-b204-e875072249d2', '4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', '110000', '0', '0', '110000', NULL, '2022-03-20 15:07:33', '2022-03-20 15:11:53'),
('07e93ec8-2840-40eb-b124-cd69041b08e9', '67452897-42c4-4bb4-8440-3a5eea43cbd3', '750000', '0', '0', '750000', NULL, '2022-02-06 18:02:58', '2022-02-06 18:03:18'),
('0b95fbef-6f41-463f-89e7-872edc1b99a1', '99282f6c-81ad-4d2b-b2b4-94c6302cd0e8', '520000', '0', '0', '520000', NULL, '2022-02-04 15:45:10', '2022-02-04 15:45:25'),
('124d94d8-4c3e-4c8e-ac13-b5fae62c5ec8', 'b6556cfb-12dc-4c44-9f81-bf9744fe4e78', '136656', '0', '0', '136656', NULL, '2022-03-17 13:16:19', '2022-03-17 13:27:36'),
('5ee24093-5cfa-4ecb-b961-004673562c9f', '4c1edbc8-d4c9-4256-a83d-990a4f77c529', '40000', '0', '0', '40000', '2022-06-10 16:19:51', '2022-03-22 08:33:25', '2022-06-10 16:19:51'),
('60ac5ccc-730b-4bfa-884a-ad6a89925da1', '7e67b353-585d-45f0-8e11-378edbe83c99', '585656', '100000', '0', '685656', NULL, '2022-03-17 13:02:01', '2022-06-12 19:17:12'),
('64d140f4-b169-4434-8cb5-fa2c263d0634', '228e99d4-3ad6-4408-9c90-fb0c71e7224c', '1500000', '0', '0', '1500000', '2022-03-17 08:12:41', '2022-03-17 07:02:16', '2022-03-17 08:12:41'),
('6a847c9e-e94d-4ab7-ba90-de33bbc923a0', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', '100000', '0', '0', '100000', NULL, '2022-03-20 15:15:42', '2022-03-20 17:46:23'),
('70ee0516-fdcb-497c-8d45-7be07d6180f4', '0c341878-4a12-42d7-8f5b-f46873efb942', '808299', '0', '0', '808299', NULL, '2022-02-09 11:09:25', '2022-02-09 11:10:39'),
('8bc6412e-63fe-457b-99a8-f2d03e75c9fb', '25554bb7-e85a-41ee-bbb6-1dbbf082efdc', '195000', '0', '0', '195000', '2022-06-10 16:16:23', '2022-03-20 15:00:40', '2022-06-10 16:16:23'),
('8d6bf6a1-3a08-4ac5-87d7-5ac32f9a9020', 'd7181500-943d-4e7a-8d07-68048e3e1560', '2121221', '0', '0', '2121221', '2022-03-17 08:12:35', '2022-02-09 11:21:26', '2022-03-17 08:12:35'),
('99109f6a-25b1-4b29-9faf-c90c17cb4aef', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '500000', '50000', '0', '550000', NULL, '2022-06-21 13:44:29', '2022-06-21 14:30:06'),
('ba1eda93-9aca-4c6d-9891-e84a35995798', '049cffac-d31f-4fb1-866b-2fb6f967a7cc', '515444', '0', '0', '515444', '2022-06-10 16:25:28', '2022-03-17 13:42:13', '2022-06-10 16:25:28'),
('bdf7ff9a-6a39-412b-a00a-44a0edbdffe4', '3616550e-5270-4d70-ae2c-c15772f73887', '1800004', '150000', '0', '1950004', '2022-03-17 08:12:46', '2022-02-10 11:15:10', '2022-03-17 08:12:46'),
('c157a4cd-0a48-4ed9-867d-7ca3f8adcfc7', '9699e020-6ae6-4e84-aba2-a93937d829be', '70000', '0', '0', '70000', NULL, '2022-03-20 17:50:12', '2022-03-21 11:06:06'),
('dc25cfc3-ade9-44a5-9c1f-c7bdea53c164', '2edad0bd-6f88-4961-a6af-e6a6f0c53060', '275000', '0', '0', '275000', NULL, '2022-03-17 08:20:43', '2022-03-17 12:59:01'),
('fe9c696f-7a97-481a-96d8-e49f407a3466', 'c80864ee-bc31-4847-9b59-5db60342439c', '22222', '0', '0', '22222', '2022-03-18 02:54:51', '2022-03-18 02:54:17', '2022-03-18 02:54:51');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `withdrawn_at` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yearly_logs`
--

CREATE TABLE `yearly_logs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `total_main` int(11) DEFAULT NULL,
  `total_monthly` int(11) DEFAULT NULL,
  `total_other` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yearly_logs`
--

INSERT INTO `yearly_logs` (`id`, `user_id`, `year`, `total_main`, `total_monthly`, `total_other`, `deleted_at`, `created_at`, `updated_at`) VALUES
('1433d0aa-8fb0-435c-ab72-4270a1e37df1', '25554bb7-e85a-41ee-bbb6-1dbbf082efdc', 2022, 195000, NULL, NULL, '2022-06-10 16:16:23', '2022-03-20 15:00:40', '2022-06-10 16:16:23'),
('1449a277-0a60-463b-851c-6732853dc30c', '228e99d4-3ad6-4408-9c90-fb0c71e7224c', 2022, 1500000, NULL, NULL, '2022-03-17 08:12:41', '2022-03-17 07:02:16', '2022-03-17 08:12:41'),
('28745f7f-1818-4b17-8be9-c756cd86b2ae', 'b6556cfb-12dc-4c44-9f81-bf9744fe4e78', 2022, 136656, NULL, NULL, NULL, '2022-03-17 13:16:19', '2022-03-17 13:27:36'),
('2bbd8e49-4e38-4358-af4e-e378ea2dcdce', '99282f6c-81ad-4d2b-b2b4-94c6302cd0e8', 2022, 520000, NULL, NULL, NULL, '2022-02-04 15:45:10', '2022-02-04 15:45:25'),
('2d553336-c80a-4812-a165-3f7ed466131c', '0c341878-4a12-42d7-8f5b-f46873efb942', 2022, 808299, NULL, NULL, NULL, '2022-02-09 11:09:25', '2022-02-09 11:10:39'),
('401cb44a-6842-4a03-903f-9a1ee4ac4ef3', 'd7181500-943d-4e7a-8d07-68048e3e1560', 2022, 2121221, NULL, NULL, '2022-03-17 08:12:35', '2022-02-09 11:21:26', '2022-03-17 08:12:35'),
('41977a21-0f5f-410f-8ed8-6a3f74b840c9', 'a8667bf8-55e1-473d-94c0-39f32777b79c', 2022, 500000, 50000, NULL, NULL, '2022-06-21 13:44:29', '2022-06-21 14:30:06'),
('4b29da4f-9de1-4c22-98a1-36cab6181e87', '3616550e-5270-4d70-ae2c-c15772f73887', 2022, 1800004, 150000, NULL, '2022-03-17 08:12:46', '2022-02-10 11:15:10', '2022-03-17 08:12:46'),
('71c6c51e-4534-4fd4-97e6-673b925be8e6', '22796c38-02cb-45ed-a709-a342946a1c4c', 2022, 114000, NULL, NULL, NULL, '2022-03-18 02:56:42', '2022-03-20 14:58:30'),
('7e0984d2-3faa-4aad-89ff-b480fd8130e2', 'c80864ee-bc31-4847-9b59-5db60342439c', 2022, 22222, NULL, NULL, '2022-03-18 02:54:51', '2022-03-18 02:54:17', '2022-03-18 02:54:51'),
('8ddb4f8e-504e-48d1-ab03-fb645651007c', '2edad0bd-6f88-4961-a6af-e6a6f0c53060', 2022, 275000, NULL, NULL, NULL, '2022-03-17 08:20:43', '2022-03-17 12:59:01'),
('a0a7498d-ebca-4eee-bd2c-d0b16d8e5eff', '049cffac-d31f-4fb1-866b-2fb6f967a7cc', 2022, 515444, NULL, NULL, '2022-06-10 16:25:28', '2022-03-17 13:42:13', '2022-06-10 16:25:28'),
('c127a7c7-e8f1-4d38-b83d-0c0744245167', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', 2022, 100000, NULL, NULL, NULL, '2022-03-20 15:15:42', '2022-03-20 17:46:23'),
('c41fe75a-880e-49be-b676-cdf646d2579d', '67452897-42c4-4bb4-8440-3a5eea43cbd3', 2022, 750000, NULL, NULL, NULL, '2022-02-06 18:02:58', '2022-02-06 18:03:18'),
('cc190ef1-88c3-43f5-bbc6-971d3848dfd1', '4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', 2022, 110000, NULL, NULL, NULL, '2022-03-20 15:07:33', '2022-03-20 15:11:53'),
('d8a06623-c457-4cff-8111-0faae13a9437', '9699e020-6ae6-4e84-aba2-a93937d829be', 2022, 70000, NULL, NULL, NULL, '2022-03-20 17:50:12', '2022-03-21 11:06:06'),
('de1fbac8-cfab-424a-9f5a-b4f68e7e9d2b', '4c1edbc8-d4c9-4256-a83d-990a4f77c529', 2022, 40000, NULL, NULL, '2022-06-10 16:19:51', '2022-03-22 08:33:25', '2022-06-10 16:19:51'),
('e174f354-ad40-46e2-9fd1-6ec1e96a2caf', '7e67b353-585d-45f0-8e11-378edbe83c99', 2022, 585656, 100000, NULL, NULL, '2022-03-17 13:02:01', '2022-06-12 19:17:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `config_payments`
--
ALTER TABLE `config_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_payments`
--
ALTER TABLE `main_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_payments_user_id_foreign` (`user_id`),
  ADD KEY `main_payments_config_payment_id_foreign` (`config_payment_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_payments`
--
ALTER TABLE `monthly_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `monthly_payments_user_id_foreign` (`user_id`),
  ADD KEY `monthly_payments_config_payment_id_foreign` (`config_payment_id`);

--
-- Indexes for table `other_payments`
--
ALTER TABLE `other_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `other_payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_belanja`
--
ALTER TABLE `tb_belanja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_poin_fandi`
--
ALTER TABLE `tb_poin_fandi`
  ADD PRIMARY KEY (`id_poin`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraws_user_id_foreign` (`user_id`);

--
-- Indexes for table `yearly_logs`
--
ALTER TABLE `yearly_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `yearly_logs_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_belanja`
--
ALTER TABLE `tb_belanja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `tb_poin_fandi`
--
ALTER TABLE `tb_poin_fandi`
  MODIFY `id_poin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `main_payments`
--
ALTER TABLE `main_payments`
  ADD CONSTRAINT `main_payments_config_payment_id_foreign` FOREIGN KEY (`config_payment_id`) REFERENCES `config_payments` (`id`),
  ADD CONSTRAINT `main_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `monthly_payments`
--
ALTER TABLE `monthly_payments`
  ADD CONSTRAINT `monthly_payments_config_payment_id_foreign` FOREIGN KEY (`config_payment_id`) REFERENCES `config_payments` (`id`),
  ADD CONSTRAINT `monthly_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `other_payments`
--
ALTER TABLE `other_payments`
  ADD CONSTRAINT `other_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD CONSTRAINT `withdraws_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `yearly_logs`
--
ALTER TABLE `yearly_logs`
  ADD CONSTRAINT `yearly_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
