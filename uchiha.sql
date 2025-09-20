-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.4.3 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para clan
CREATE DATABASE IF NOT EXISTS `clan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clan`;

-- Volcando estructura para tabla clan.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint unsigned NOT NULL,
  `num_profile` int NOT NULL,
  `type_account` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'true = Perfil, false = Cuenta completa',
  `date_start` timestamp NOT NULL,
  `date_end` timestamp NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sale_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true = Vendido, false = No Vendido',
  PRIMARY KEY (`id`),
  KEY `accounts_product_id_foreign` (`product_id`),
  KEY `accounts_user_id_foreign` (`user_id`),
  CONSTRAINT `accounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.accounts: ~18 rows (aproximadamente)
INSERT INTO `accounts` (`id`, `name`, `email`, `password`, `product_id`, `num_profile`, `type_account`, `date_start`, `date_end`, `user_id`, `created_at`, `updated_at`, `sale_status`) VALUES
	(1, 'P-Netflix-P-1', 'carolescobar.05.ar@logpremium.xyz', 'butaca4040335', 1, 5, 1, '2024-11-17 17:14:00', '2024-12-18 17:14:00', 1, '2024-12-06 17:14:03', '2024-12-27 09:33:58', 0),
	(2, 'P-Netflix-2', 'jensdan.dk@woxen.xyz', 'ander01', 2, 5, 1, '2024-11-23 13:48:05', '2024-12-23 13:48:14', 2, '2024-12-07 13:48:20', '2024-12-07 13:49:52', 0),
	(5, 'P-Disney+-5', 'camiladiaz3254y@outlook.com', 'butaca4040335', 9, 6, 1, '2024-12-16 12:21:09', '2025-01-16 12:21:12', 1, '2024-12-16 12:21:05', '2024-12-16 12:21:05', 0),
	(6, 'P-Netflix-6', '1ozht.ca@afqrw.com', '283849368', 1, 5, 1, '2024-12-16 12:28:23', '2025-01-16 12:28:27', 1, '2024-12-16 12:28:18', '2024-12-16 12:28:18', 0),
	(7, 'P-Max Estándar-7', 'BulldogFrancesFluffy@zetaplayz.com', 'REDEN123432', 10, 5, 1, '2024-12-16 18:59:10', '2025-01-16 18:59:14', 1, '2024-12-16 18:59:05', '2024-12-16 18:59:05', 0),
	(8, 'P-Netflix-8', 'sos1818.pl@foxonehit.xyz', 'Emerson123*', 1, 5, 1, '2024-12-26 11:16:00', '2025-01-26 11:16:00', 1, '2024-12-26 11:16:38', '2024-12-26 14:38:45', 0),
	(9, 'P-Netflix-9', 'kreuzerjr.us@dotaislifexd.xyz', 'ander01', 12, 2, 1, '2024-12-27 09:29:40', '2025-01-27 09:29:44', 6, '2024-12-27 09:29:50', '2024-12-28 15:39:07', 0),
	(10, 'P-Netflix-10', 'kreuzerjr.us@dotaislifexd.xyz', 'ander01', 12, 1, 1, '2024-12-27 10:18:16', '2025-01-27 10:18:27', 6, '2024-12-27 10:18:32', '2024-12-28 15:39:01', 0),
	(11, 'P-Netflix-11', 'kreuzerjr.us@dotaislifexd.xyz', 'Emerson123*', 12, 1, 1, '2024-12-21 10:36:39', '2025-01-21 10:36:49', 6, '2024-12-27 10:37:01', '2024-12-28 15:38:53', 0),
	(13, 'P-Netflix-12', 'kreuzerjr.us@dotaislifexd.xyz', 'Emerson123*', 12, 1, 1, '2024-12-27 12:19:52', '2025-01-27 12:19:55', 6, '2024-12-27 12:20:00', '2024-12-28 15:38:43', 0),
	(15, 'P-Netflix-14', 'serafinotiago.fr@newdatape.com', 'Emerson123*', 1, 5, 1, '2025-01-02 16:25:36', '2025-02-02 16:25:39', 1, '2024-12-27 16:25:31', '2025-01-02 19:17:44', 0),
	(16, 'C-Netflix-14', 'rociotqm.us@homeuhd.xyz', 'Master123*', 12, 0, 0, '2024-12-27 16:25:27', '2025-01-27 16:25:31', 6, '2024-12-27 16:25:43', '2024-12-27 16:25:43', 0),
	(17, 'P-Prime Video-17', 'rosariocarbajal11@hotmail.com', 'systemy60433', 14, 6, 1, '2024-12-28 11:17:00', '2025-01-28 11:17:00', 1, '2024-12-28 11:17:50', '2024-12-28 11:17:50', 0),
	(18, 'C-Netflix-18', 'ericakellyenf.br@southnorth.xyz', 'abc4122', 12, 0, 0, '2024-12-27 16:06:19', '2025-01-27 16:06:23', 6, '2024-12-28 16:06:30', '2024-12-28 16:06:30', 0),
	(19, 'P-Crunchyroll-19', 'enrneosmaster@gmail.com', 'Emerson123*+', 15, 1, 1, '2024-12-28 18:04:23', '2025-01-28 18:04:27', 6, '2024-12-28 18:04:39', '2024-12-28 18:04:39', 0),
	(20, 'P-Crunchyroll-20', 'enrneosmaster@gmail.com', 'Emerson123*+', 15, 1, 1, '2024-12-28 18:07:37', '2025-01-28 18:07:39', 6, '2024-12-28 18:07:46', '2024-12-28 18:07:46', 0),
	(21, 'P-Dysney-21', 'enrneosmaster@gmail.com', 'Emerson123*+', 13, 1, 1, '2024-12-26 18:13:40', '2024-12-26 18:13:42', 6, '2024-12-28 18:13:48', '2024-12-28 18:13:48', 0),
	(22, 'P-Netflix-23', 'ventasnetflix55@gmail.com', 'jd010203xd', 16, 1, 1, '2025-01-11 11:05:00', '2025-02-12 11:06:00', 8, '2024-12-28 20:57:13', '2024-12-28 21:02:16', 0);

-- Volcando estructura para tabla clan.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.cache: ~17 rows (aproximadamente)
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('273f2bfbbe9b1f78815eea37e3c79f7dbf2d9ec6', 'i:3;', 1743351356),
	('273f2bfbbe9b1f78815eea37e3c79f7dbf2d9ec6:timer', 'i:1743351356;', 1743351356),
	('734379519bd23e81cddb7fc581e8631d0c541db7', 'i:1;', 1736465812),
	('734379519bd23e81cddb7fc581e8631d0c541db7:timer', 'i:1736465812;', 1736465812),
	('7a78d36fabb07251ebcea00d8100c7dcbaf00867', 'i:1;', 1735929980),
	('7a78d36fabb07251ebcea00d8100c7dcbaf00867:timer', 'i:1735929980;', 1735929980),
	('8b2a2581ffe746e0fa87eb5188815b468038001e', 'i:2;', 1736531372),
	('8b2a2581ffe746e0fa87eb5188815b468038001e:timer', 'i:1736531372;', 1736531372),
	('a17961fa74e9275d529f489537f179c05d50c2f3', 'i:2;', 1757124454),
	('a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1757124454;', 1757124454),
	('aa6a6d2a16037af4ed8f5530def50b40ee023510', 'i:1;', 1737076372),
	('aa6a6d2a16037af4ed8f5530def50b40ee023510:timer', 'i:1737076372;', 1737076372),
	('d69fad0dd745864b3628f476b411566ed0e5d8bb', 'i:1;', 1737076352),
	('d69fad0dd745864b3628f476b411566ed0e5d8bb:timer', 'i:1737076352;', 1737076352),
	('f364a08204495dbac09ab78dd465dc971ede8854', 'i:2;', 1735507542),
	('f364a08204495dbac09ab78dd465dc971ede8854:timer', 'i:1735507542;', 1735507542),
	('spatie.permission.cache', 'a:3:{s:5:"alias";a:3:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";}s:11:"permissions";a:1:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:13:"Administrador";s:1:"c";s:3:"web";}}s:5:"roles";a:0:{}}', 1757210843);

-- Volcando estructura para tabla clan.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.cache_locks: ~0 rows (aproximadamente)

-- Volcando estructura para tabla clan.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clients_user_id_foreign` (`user_id`),
  CONSTRAINT `clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.clients: ~20 rows (aproximadamente)
INSERT INTO `clients` (`id`, `name`, `phone`, `telegram`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'Aldo', '+51906211841', NULL, 1, '2024-12-06 17:12:55', '2024-12-06 17:12:55'),
	(3, 'Daniel', '990374086', NULL, 2, '2024-12-07 13:45:44', '2024-12-07 13:45:44'),
	(4, 'Becker', '953774336', NULL, 2, '2024-12-07 13:46:14', '2024-12-07 13:46:14'),
	(5, 'Giovi', '985401252', NULL, 2, '2024-12-07 16:49:29', '2024-12-07 16:49:29'),
	(6, 'Elizabeth', '991061433', NULL, 2, '2024-12-07 16:49:48', '2024-12-07 16:49:48'),
	(7, 'Leticia', '972901210', NULL, 2, '2024-12-07 17:07:45', '2024-12-07 17:07:45'),
	(9, 'Brayhan Chuc.', '+51913376067', NULL, 1, '2024-12-16 12:16:09', '2024-12-27 14:26:48'),
	(10, 'Tuc@', '+51 975 592 924', 'Tuc@', 7, '2024-12-26 23:22:58', '2024-12-26 23:22:58'),
	(11, 'AteneoHouse', NULL, '@ateneahouse', 6, '2024-12-27 09:28:55', '2024-12-27 09:28:55'),
	(13, 'Leticia', '972901210', NULL, 6, '2024-12-27 10:17:26', '2024-12-27 10:43:22'),
	(14, 'Jose', '995957701', NULL, 6, '2024-12-27 10:36:03', '2024-12-27 10:43:28'),
	(15, 'Giovi', '985401252', NULL, 6, '2024-12-27 12:19:28', '2024-12-27 12:19:28'),
	(16, 'Alejandra', '912934563', 'wsp', 9, '2024-12-27 15:14:58', '2024-12-27 15:14:58'),
	(17, 'Becker', '953774336', NULL, 6, '2024-12-27 16:17:10', '2024-12-27 16:17:10'),
	(18, 'Becker', '918816348', NULL, 1, '2024-12-27 16:26:18', '2024-12-27 16:26:18'),
	(19, 'Nicole', '+51991390885', NULL, 1, '2024-12-28 10:34:51', '2024-12-28 10:34:51'),
	(20, 'Poul', '966487658', NULL, 6, '2024-12-28 16:05:23', '2024-12-28 16:05:23'),
	(21, 'Daniel', '990374086', NULL, 6, '2024-12-28 18:00:37', '2024-12-28 18:00:37'),
	(22, 'Kambiosperu', NULL, '@Kambiosperu', 6, '2024-12-28 18:02:41', '2024-12-28 18:02:41'),
	(23, 'Luis', '942991437', '@cristiandox', 8, '2024-12-28 20:54:45', '2024-12-28 20:54:45');

-- Volcando estructura para tabla clan.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla clan.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla clan.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.job_batches: ~0 rows (aproximadamente)

-- Volcando estructura para tabla clan.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.migrations: ~9 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2024_12_05_154541_create_products_table', 1),
	(5, '2024_12_05_154935_create_clients_table', 1),
	(6, '2024_12_05_154945_create_accounts_table', 1),
	(7, '2024_12_05_154951_create_profiles_table', 1),
	(8, '2024_12_05_154956_create_sales_table', 1),
	(9, '2024_12_05_155954_create_permission_tables', 1);

-- Volcando estructura para tabla clan.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.model_has_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla clan.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.model_has_roles: ~8 rows (aproximadamente)
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(2, 'App\\Models\\User', 2),
	(2, 'App\\Models\\User', 3),
	(2, 'App\\Models\\User', 5),
	(2, 'App\\Models\\User', 6),
	(2, 'App\\Models\\User', 7),
	(2, 'App\\Models\\User', 8),
	(2, 'App\\Models\\User', 9);

-- Volcando estructura para tabla clan.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla clan.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.permissions: ~1 rows (aproximadamente)
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', 'web', '2024-12-06 12:32:59', '2024-12-06 12:32:59');

-- Volcando estructura para tabla clan.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_user_id_foreign` (`user_id`),
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.products: ~15 rows (aproximadamente)
INSERT INTO `products` (`id`, `name`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'Netflix', 'Netflix Premiun 4k', 1, '2024-12-06 14:48:18', '2024-12-08 10:36:36'),
	(2, 'Netflix', NULL, 2, '2024-12-07 10:04:34', '2024-12-07 10:04:34'),
	(4, 'Paramount+', NULL, 2, '2024-12-07 10:04:50', '2024-12-07 10:04:50'),
	(5, 'Disney+', NULL, 2, '2024-12-07 10:07:57', '2024-12-07 10:07:57'),
	(6, 'HBO Max', NULL, 2, '2024-12-07 10:10:04', '2024-12-07 10:10:04'),
	(7, 'YouTube', NULL, 2, '2024-12-07 10:10:47', '2024-12-07 10:10:47'),
	(9, 'Disney+', 'Cuenta Premiun', 1, '2024-12-16 12:14:31', '2024-12-16 12:14:44'),
	(10, 'Max Estándar', NULL, 1, '2024-12-16 18:58:32', '2024-12-16 18:58:32'),
	(11, 'User Black', 'Alquiler de Cuentas Socio Black ', 7, '2024-12-26 23:21:03', '2024-12-26 23:21:03'),
	(12, 'Netflix', NULL, 6, '2024-12-27 09:24:17', '2024-12-27 09:24:17'),
	(13, 'Dysney', NULL, 6, '2024-12-27 12:15:52', '2024-12-27 12:15:52'),
	(14, 'Prime Video', 'Solo Tv', 1, '2024-12-28 10:34:20', '2024-12-28 10:34:20'),
	(15, 'Crunchyroll', NULL, 6, '2024-12-28 17:59:05', '2024-12-28 17:59:05'),
	(16, 'Netflix', NULL, 8, '2024-12-28 20:51:37', '2024-12-28 20:51:37'),
	(17, 'Dysney', NULL, 8, '2024-12-28 20:52:12', '2024-12-28 20:52:12');

-- Volcando estructura para tabla clan.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned NOT NULL,
  `type_account` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint unsigned NOT NULL,
  `date_start` timestamp NOT NULL,
  `date_end` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_account_id_foreign` (`account_id`),
  KEY `profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `profiles_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.profiles: ~20 rows (aproximadamente)
INSERT INTO `profiles` (`id`, `name`, `pin`, `account_id`, `type_account`, `user_id`, `date_start`, `date_end`, `created_at`, `updated_at`) VALUES
	(2, 'Micaela', NULL, 2, 0, 2, '2024-12-03 13:57:47', '2025-01-03 13:59:34', '2024-12-07 13:59:45', '2024-12-07 16:51:10'),
	(3, 'Lord', NULL, 2, 0, 2, '2024-12-14 14:00:31', '2025-01-14 14:00:45', '2024-12-07 14:01:00', '2024-12-07 16:51:32'),
	(4, 'Giovi', NULL, 2, 0, 2, '2024-11-27 14:05:30', '2024-12-27 14:05:36', '2024-12-07 14:05:48', '2024-12-07 16:52:51'),
	(5, 'Elizabeth', NULL, 2, 0, 2, '2024-11-29 15:45:51', '2024-12-29 15:45:55', '2024-12-07 15:46:02', '2024-12-07 16:54:28'),
	(6, 'Leticia', NULL, 2, 0, 2, '2024-12-01 17:07:00', '2025-01-01 17:07:03', '2024-12-07 17:07:11', '2024-12-07 17:08:52'),
	(8, 'Aldo', '2005', 15, 0, 1, '2024-11-18 10:39:00', '2025-01-16 10:40:00', '2024-12-08 10:40:30', '2025-01-11 12:38:33'),
	(10, 'Brad', '2005', 5, 0, 1, '2024-12-16 12:21:57', '2025-01-16 12:22:00', '2024-12-16 12:21:53', '2024-12-16 12:22:11'),
	(11, 'Brad', '2005', 15, 0, 1, '2024-12-16 12:29:11', '2025-01-18 12:29:13', '2024-12-16 12:29:05', '2025-01-11 12:39:46'),
	(12, 'Aldo', '2206', 7, 0, 1, '2024-12-16 18:59:42', '2025-01-16 18:59:44', '2024-12-16 18:59:35', '2024-12-16 19:00:03'),
	(13, 'Bea', '2005', 15, 0, 1, '2024-12-26 11:17:00', '2025-01-28 11:17:00', '2024-12-26 11:17:12', '2025-01-11 12:39:32'),
	(14, 'Charly', NULL, 9, 0, 6, '2024-12-27 09:30:21', '2025-01-27 09:30:26', '2024-12-27 09:30:33', '2024-12-27 09:31:14'),
	(15, 'Chino', NULL, 9, 0, 6, '2024-12-27 09:30:47', '2025-01-27 09:30:50', '2024-12-27 09:30:55', '2024-12-27 09:31:59'),
	(16, 'Leticia', NULL, 10, 0, 6, '2024-11-30 10:18:46', '2024-12-31 10:18:49', '2024-12-27 10:19:17', '2024-12-27 10:19:45'),
	(17, 'José Mac', NULL, 11, 0, 6, '2024-12-21 10:50:40', '2025-01-21 10:50:46', '2024-12-27 10:50:51', '2024-12-27 10:51:12'),
	(18, 'Giovi1', NULL, 13, 0, 6, '2024-12-27 12:27:26', '2025-01-27 12:27:29', '2024-12-27 12:27:34', '2024-12-27 12:28:49'),
	(19, 'Lord', '1996', 15, 0, 1, '2024-12-27 16:26:48', '2025-01-29 16:26:51', '2024-12-27 16:26:42', '2025-01-11 12:39:22'),
	(20, 'Dany', NULL, 19, 0, 6, '2024-12-28 18:05:00', '2025-01-28 18:05:04', '2024-12-28 18:05:11', '2024-12-28 18:05:31'),
	(22, 'KambiosPeru', NULL, 20, 0, 6, '2024-12-28 18:07:59', '2025-01-29 18:08:02', '2024-12-28 18:08:10', '2024-12-28 18:09:21'),
	(23, 'Roger', '4545', 22, 1, 8, '2024-01-11 11:05:00', '2024-02-11 11:06:00', '2024-12-28 20:57:57', '2024-12-28 20:57:57'),
	(24, 'Brad', '2005', 7, 0, 1, '2025-01-01 20:01:00', '2025-02-01 20:02:00', '2025-01-01 20:02:07', '2025-01-01 20:02:49');

-- Volcando estructura para tabla clan.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.roles: ~2 rows (aproximadamente)
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', 'web', '2024-12-06 12:33:30', '2024-12-06 12:33:30'),
	(2, 'Revendedor', 'web', '2024-12-06 12:35:46', '2024-12-06 12:35:46');

-- Volcando estructura para tabla clan.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.role_has_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla clan.sales
CREATE TABLE IF NOT EXISTS `sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned DEFAULT NULL,
  `profile_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `type_account` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'true = Perfil, false = Cuenta completa',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_client_id_foreign` (`client_id`),
  KEY `sales_profile_id_foreign` (`profile_id`),
  KEY `sales_account_id_foreign` (`account_id`),
  KEY `sales_user_id_foreign` (`user_id`),
  CONSTRAINT `sales_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.sales: ~23 rows (aproximadamente)
INSERT INTO `sales` (`id`, `client_id`, `profile_id`, `account_id`, `price`, `type_account`, `payment_method`, `user_id`, `created_at`, `updated_at`) VALUES
	(2, 3, 2, NULL, 7.00, 1, 'yape', 2, '2024-12-07 16:51:10', '2024-12-07 16:51:10'),
	(3, 4, 3, NULL, 7.00, 1, 'yape', 2, '2024-12-07 16:51:32', '2024-12-07 16:51:32'),
	(4, 5, 4, NULL, 7.00, 1, 'yape', 2, '2024-12-07 16:52:51', '2024-12-07 16:52:51'),
	(5, 6, 5, NULL, 7.00, 1, 'yape', 2, '2024-12-07 16:54:28', '2024-12-07 16:54:28'),
	(6, 7, 6, NULL, 7.00, 1, 'yape', 2, '2024-12-07 17:08:52', '2024-12-07 17:08:52'),
	(8, 1, 8, NULL, 9.00, 1, 'yape', 1, '2024-12-08 10:41:49', '2024-12-08 10:41:49'),
	(10, 9, 10, NULL, 8.00, 1, 'yape', 1, '2024-12-16 12:22:11', '2024-12-16 12:22:11'),
	(11, 9, 11, NULL, 8.00, 1, 'yape', 1, '2024-12-16 12:29:26', '2024-12-16 12:29:26'),
	(12, 1, 12, NULL, 8.00, 1, 'yape', 1, '2024-12-16 19:00:03', '2024-12-16 19:00:03'),
	(13, 9, 13, NULL, 9.00, 1, 'yape', 1, '2024-12-26 11:17:32', '2024-12-26 11:17:32'),
	(14, 10, NULL, NULL, 25.00, 1, 'agora', 7, '2024-12-26 23:24:04', '2024-12-26 23:24:04'),
	(15, 11, 14, NULL, 5.00, 1, 'yape', 6, '2024-12-27 09:31:14', '2024-12-27 09:31:14'),
	(16, 11, 15, NULL, 5.00, 1, 'yape', 6, '2024-12-27 09:31:28', '2024-12-27 09:31:28'),
	(17, 13, 16, NULL, 7.00, 1, 'yape', 6, '2024-12-27 10:19:45', '2024-12-27 10:19:45'),
	(18, 14, 17, NULL, 7.00, 1, 'yape', 6, '2024-12-27 10:51:12', '2024-12-27 10:51:12'),
	(19, 15, 18, NULL, 7.00, 1, 'yape', 6, '2024-12-27 12:27:55', '2024-12-27 12:27:55'),
	(20, NULL, NULL, NULL, 5.00, 1, 'yape', 9, '2024-12-27 15:07:38', '2024-12-27 15:07:38'),
	(21, 17, NULL, 16, 25.00, 0, 'yape', 6, '2024-12-27 16:26:41', '2024-12-27 16:26:41'),
	(22, 18, 19, NULL, 9.00, 1, 'yape', 1, '2024-12-27 16:28:42', '2024-12-27 16:28:42'),
	(23, 20, NULL, 18, 28.00, 0, 'yape', 6, '2024-12-28 16:07:41', '2024-12-28 16:07:41'),
	(24, 21, 20, NULL, 5.00, 1, 'yape', 6, '2024-12-28 18:05:31', '2024-12-28 18:05:31'),
	(25, 22, 22, NULL, 5.00, 1, 'yape', 6, '2024-12-28 18:09:21', '2024-12-28 18:09:21'),
	(26, 9, 24, NULL, 5.00, 1, 'yape', 1, '2025-01-01 20:02:49', '2025-01-01 20:02:49');

-- Volcando estructura para tabla clan.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.sessions: ~42 rows (aproximadamente)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('3xZA20VroFLvUkTLEfPJe3ApNK1Wmv5SayDAQZF7', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibXdLUFI0SEQ3Q1ZYRTQ2c0d3dzNhSVV6T1Npd2o5eTU1VHFYZ0xWZiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747824018),
	('4f57ATIZBrQzSnty7CWijQfkvqgGp5Ven2SSQU1y', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1I4ZmZMdW9aN3BXVzBYdnJkZjlaTEI5VEw3S3JlMm1uNFV1cmhUQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747886096),
	('5d6gPAY3AuiZWZrDdxes1CstlKEO5n81ke3uOqW2', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQjNCdzRnVHJCUnlwUk5ESGI1SWp3RTJsUzNSems1SmE3VUl0Z1FkciI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747633341),
	('5Ko9XptBQqXf8HmqelfddxVKo43pzOa4KmTAOyjV', NULL, '45.55.208.85', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWZUM3k3bXNKaGVyWVpUMVNYSUxPOVpPYXdzWjZEOU1pSWUzU1dsTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747589399),
	('6aQRvn6uHxK7e9atodyDS5rbIO4HNT1YJ2PU1j9C', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmNZelNwOU5tbFIzNWx6ZTFkV1NvRDIzV2tIb3JoZ2JzYlp1THNoNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747824018),
	('AKVwOamf3Bpm0k027bfwfsTOl5qAWsCQL8pzYDLk', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUVhN1BkcEtZMTN0WEpkaGhQSU14MlozY3dqTEMwOGdXdHdnTXRtQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747569191),
	('B2IR5sF2sM2w98SZGKLroeJxon5pirPMuLuNoafs', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQllTN3JrWG9zWlFKRWZlaEx4bUhZbEZzMFlXTFlGMzBYbkgxZFU5aSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747730689),
	('B8nuNnVQ0P3KEadyzddybfYaKXCvS8JsgC3PvqKg', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlVzNFVTQ1pCRnNyeGJXRHFWTzZxV3I5NHAwbGprUjFvdm1wOUFQMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748252187),
	('crYunfQ3Szaa44fUwuNVEUOshzpjv6ICRAezzln1', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFVaMUwzZ3hBVjdpY0htTno1amV3SEFnNzNSMzhpTG9Jeno5YmlkWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748252187),
	('cXXbRodILyv11tKVvxVo4C7zRwsboeRcIdI5lV4h', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFVVRFk0Q2tkWFJpMUdUdmp3SFVSa2JJb293RGlXNFZLdE11aG1pSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747569191),
	('Ebf4Psb6gS82jFF6t0DyRGxq2DtuZmIDQlmmeoVP', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemFTMGhGUHYyOVFCaGxsY2lNZG53cG9TTGR1ZFNSd1F4OERHSXhzayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748053276),
	('EFF5FHa1Qn8Ee5dc2S8TcCuSAbYVcs8bjaVvTK5l', NULL, '52.90.35.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlJNaUhuZVZLNHRuWTBEMktUYjhVUlBRRkpyTE9FT1NPSklFMk9JbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vd3d3LmMtdWNoaWhhLm1yaXRwZXJ1LmNvbS9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748017614),
	('EXS8FtxseBo9tuFYZH12ypStekyAB1NO5w5a95vh', NULL, '52.90.35.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRG1BelliUFhvV0toMFY1S1J1dm8yb2N3d3UyWDF0dEFwNFRCSGJXcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3LmMtdWNoaWhhLm1yaXRwZXJ1LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748017613),
	('fJ3ThF3dtljniPtcPzer2Qgnp8zqf199QpDaZKx3', NULL, '52.90.35.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoic2FobHZxUTczQjZtTUNrYmVKeThUcVB5dENDVVdPVHJZdW1zVFlXSiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozOToiaHR0cHM6Ly93d3cuYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vd3d3LmMtdWNoaWhhLm1yaXRwZXJ1LmNvbS9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748017614),
	('gn1QmfDUK91Mq09FpGnU0JKfHxd4LwvdmwM9Jut4', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHdSZkpGSzFwY252RURMcjdESHk1dUdNVHFvUWxvSFl3Uk10NWhGMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747633341),
	('gOIpfZDVeuAOH7VeN86c3dCJviDc7nnZ1xm24rhu', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHVlMFlxVHFHdE5zTXd0czlnM2EyU253UlR4S0ZxTzZVQWFvSDlnSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747824018),
	('HfDkSj2iKjaqvdCAanewPM08qLei0JlIw6L8UrZt', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHNYakJjdkRKeGxNUFVzWmpQQVk5S1NDenVEZmdFQzY0ZjZkNlkwSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748053275),
	('HNXIiYO87MroIMaCNeyjNfYlxiK2WYThW3bySZWP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.0 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkNlOGkyN1VjTnlUNWtXRzJvcUVKYk1XN0xMWUhPZEtDWm5Qd2xZTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9jLXVjaGloYS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1757128891),
	('i9LJGUUup8TaWMiOiO1U6waaM7kixAPrWdJjzPQT', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMFBOS0NObGltbUF0cVp5a1dzV1hyRnA1NEN4VkdybzNiUE90UU10cCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747886096),
	('icdt1Ih0sNVPvfRRAKNzZIRXOrwsD2VIdisYbo8w', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzRMdkkxbWw0ZW5DdWFZNzJIbjhxaFY0ZVpCVVFWV0VXbHVpR0NERiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748160953),
	('ItMPCzPIK0HpT74vseOXRFjzn0RR9a2Xp2d5TcHV', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkU3ZUIzVUdWMlZ3SWFHQ2lyeDJxSGQycTlPTjlIUlo5QllsZ2wwdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747886096),
	('JY3qd7E9p8JWFiSl31b28ipHbrjrIskr8NlqCwlB', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVmZiSUV1eDVLOUFSQ2MwOEJKZmtWZHNtUm9KWm9Rc2tVcjZ1SmFMbCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1748160953),
	('LSdswDslf6V4GeWQLoJVbt2hQfM5BgB6QnrBxdVb', NULL, '104.152.52.237', 'curl/7.61.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRE15aGMxdjI4UU9VRHZVVnZLMkcxU3R5TkQ2OVZ0UXBGbkgxdFFpTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748371169),
	('OkIDs7HDfaIKMpNEThhjsyLHlad8S7AC9Ig7k8Bj', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1ByeFUzQmtCSWR6elVpN3RvVllPVk12c3JvNktkV1NMa0haTU1jTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747730688),
	('OmqFBcQtDmjXPFA9r2GEX8ocpdVCNVUcyLK9XSCN', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNmxVeDdjcThac3hpYXBrbnduNk02YmVnVjRremcyUHdUS2dST2xlYiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747999189),
	('Pwc0yGBrAjFM4iDTsf7KCQiaemiYpwhQtU102rZ0', NULL, '20.171.207.197', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.2; +https://openai.com/gptbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYVNGS1BqbU5BT1paZGthcmpVVGVwZko0Wlh1UHhJZFV6TGdtbGF1diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO319', 1747713412),
	('qLUQBM0XKGM7mRDLiWSXGpuMqFCtiKt6HDpEODAg', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaHMwWll3RkwwMEdtT2Z6TDloWnh5bjlGallMYVluNjlrNDJpQU14dCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1748053276),
	('rTwaLYyzNJN1MDSfL0O7N1jQctAheWpBUzc9S5fH', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHNQV0lrRzcxenBjUFV2aVNaUVc3aHdUTUtCVFpVZHNya0pXbHF0OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747730689),
	('S375S1H4NV1rpPKyH9sdNbK9mDJ4CQg0T9HaVSmk', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDd2N2V2WXRTTk5uWXh6bm9pS0ZQS2x3b1hSRGY3TWN2M2VmSFlhaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748160953),
	('SklPxmwr7vpW317quLrUzlL0Dp3XFvxSgnuA4dJZ', NULL, '104.152.52.225', 'curl/7.61.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiME5EYWJtYXZLZHNYSmpEUW5HdFhWZXlvNmhncWVoMHlVMHpReklXbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3LmMtdWNoaWhhLm1yaXRwZXJ1LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747760721),
	('SQ0QtYgyA1ToJAsb5ELbmBEqeoanPgL7tLiCltGi', NULL, '20.171.207.18', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.2; +https://openai.com/gptbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN0VQa0d2ZkhOcnVybldnYWlpU1pOcTAyRnh2Y3UwcUEyZDhrU1JteiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vd3d3LmMtdWNoaWhhLm1yaXRwZXJ1LmNvbS9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mzk6Imh0dHBzOi8vd3d3LmMtdWNoaWhhLm1yaXRwZXJ1LmNvbS9hZG1pbiI7fX0=', 1747713414),
	('tL8kdaAofKD77Gn0oybYwp0xnfz6J86WXvWm1Dzl', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlphU3NNYkJuR1U3YzV6NWRrdGZRNFVPT0xBaXh0dDNRUFZxS0ladiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747999189),
	('UNQDSBFQFjklNhiV9CpDkYJbMdCQEnBCTwyX4Hnq', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiamdlNlh6SjYyS3FzOGhnc2g3TEpGVjFudXAyMnBHMFhBZnRLZkdOVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9jLXVjaGloYS50ZXN0L2FkbWluL3NhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo4OiJmaWxhbWVudCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJGdxYXJJVGdWRDRSN2VxamZFYUNhSnVzbnk1OEdkV3FQd215OTJHNkpWS3RlVDh3UXg4RG4yIjt9', 1757124478),
	('VL1TChjf6hq0N2xp8LRNUCtPBTepgQBU8ypGaHGC', NULL, '52.90.35.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWV4aXVKdDh6bkpaeVRqZ3VaMmVFWXo4SkxYcXdFWnpRTzZFYnZyciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vd3d3LmMtdWNoaWhhLm1yaXRwZXJ1LmNvbS9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748017613),
	('VNs8nu6nUwtFQXNhq7QPykpBH9oyVy14Jz0fNwPv', NULL, '52.90.35.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRFFYQW1JOFJmSjdSNlBCTG1ia3JxZlBKM0VxelJEMkt5V2hRZEFMYiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozOToiaHR0cHM6Ly93d3cuYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vd3d3LmMtdWNoaWhhLm1yaXRwZXJ1LmNvbS9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748017613),
	('vzuLXIhIHW7SRmB6pF6MFsybp60hFWCbKvqAFeN1', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR0RreFBRd3FYajJoYXp2bnd4VFU1aXFIOU43aHVub2FBWUU3dzVnOCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747569191),
	('vZX22InkjAuNyX9CjGCqGm0DhcH83F70vvM764w0', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEZTNllIZU5LOTFUSGJWa3RMYkZWbzZCdUhvT0FYM1B5amZUNkI3aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747999189),
	('wuaSLUbNFqwVf4DnGgHtuNFgtV1FEVr5SpfdQEal', NULL, '104.152.52.225', 'curl/7.61.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjYwblNSWlloRXFhazFobUxKNUN0TEVaQlJZRWRNNzVnVFJXZjdwbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749573233),
	('XBhSq5HQjwbhMXlDgCHwDAMAyqyPL0UsgVEw6YpG', NULL, '104.152.52.155', 'curl/7.61.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUU1M0RGN0VQa24zeUpTR2JBbTh4VTlUU1AyYTZKZlF0Q1FPUmVGSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3LmMtdWNoaWhhLm1yaXRwZXJ1LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748369364),
	('YcdeCNcbVTVsDniYJ0U1FaelDcxm3YuC9Bfo3CiI', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieml2NGJwekVyaWgwaGJPaE5pZW4wUG5LZEtBU2FYMlRzOUlTWmpvcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747633341),
	('YWUbkhW8Ss1rkMvbiqg0hRmuOIfGpU7mCz3sYccU', NULL, '52.90.35.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGJPQWFORlJsV2xYNmU5S2RhUTRkSDE1NUNUYWFSckNrRnVxQXNZWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3LmMtdWNoaWhhLm1yaXRwZXJ1LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748017614),
	('z42jmdYee1nbQvfCkaP7laCJqISKtcotEb7e3jIe', NULL, '2a02:4780:2c:3::5', 'Go-http-client/2.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM01ZUjdzV3ZRWnkyR1l3WkNMZ0MwaFJJc3lsemo3YnI1eVEzcU51cCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNToiaHR0cHM6Ly9jLXVjaGloYS5tcml0cGVydS5jb20vYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1748252187),
	('zlTLxrqSwQbCq8bVFfvkS423fute3an28ToSjBqE', NULL, '104.152.52.201', 'curl/7.61.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWtQa3ZrWktJemJYaTZkYlVwY0dwMHJWZUtPSHFjd2k2aUdQVW4wdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vYy11Y2hpaGEubXJpdHBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748970220);

-- Volcando estructura para tabla clan.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `membership_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic',
  `membership_start_date` timestamp NULL DEFAULT NULL,
  `membership_end_date` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla clan.users: ~8 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `phone`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `membership_type`, `membership_start_date`, `membership_end_date`, `is_active`) VALUES
	(1, 'Becker', NULL, NULL, 'beckveloper@gmail.com', NULL, '$2y$12$gqarITgVD4R7eqjfEaCaJusny58GdWqPwmy92G6JVKteT8wQx8Dn2', '', '2024-12-06 12:30:12', '2025-03-30 11:16:14', 'basic', '2024-12-01 12:34:09', '2025-12-25 12:34:14', 1),
	(2, 'Emerson', '+51907779503', NULL, 'emer200006@gmail.com', NULL, '$2y$12$r94F2DL13f5R.P..r1mieeVl14REWIlaQ.zhfTn2YLBrPc3L2pqkm', NULL, '2024-12-06 12:36:45', '2024-12-06 12:36:45', 'basic', '2024-12-06 12:36:15', '2025-01-06 12:36:18', 1),
	(3, 'Carlos Rimachi', '+5198423472', NULL, 'carlitos@gmail.com', NULL, '$2y$12$/0lL.FenDvomudAlYST3keIVI5DwMvd1T.UeU4untHxFLuCWqxzmW', NULL, '2024-12-11 17:16:51', '2024-12-19 17:48:00', 'basic', '2024-12-09 17:16:46', '2024-12-12 17:16:50', 1),
	(5, 'Miguel Mogrovejo Cardenas', '+51964944896', NULL, 'mogrovejo.456@gmail.com', NULL, '$2y$12$GMC6TlpGrttgE77B5gJxF.MqT2LL9mUgGgq.N8.HubAiphZ/vhTF.', NULL, '2024-12-18 15:49:14', '2024-12-18 15:55:20', 'basic', '2024-12-18 15:48:42', '2024-12-19 15:48:45', 1),
	(6, 'TspectrosT', NULL, NULL, 'tspectrost@gmail.com', NULL, '$2y$12$QFfBeXAmR4Kwj.pWF/03Fupf.3RMRFvUvDwAOn6G3DpMAq7OMZB46', NULL, '2024-12-26 18:48:12', '2024-12-26 18:48:12', 'basic', '2024-12-26 18:47:00', '2025-01-26 18:47:00', 1),
	(7, 'Black Demo', NULL, NULL, 'black@gmail.com', NULL, '$2y$12$mTr7R5shi0MKreStIfg0Z.vyBXCMTq8s81Mjl6F/3M.yVLnwT0kyi', '1l2oVa1gZtqy4qe1ReXsfyi55XFi0ZuuMNhjIBGnH3cJNS3AGNijbxHSOQke', '2024-12-26 23:07:53', '2024-12-26 23:07:53', 'basic', '2024-12-26 23:07:00', '2024-12-27 23:07:00', 1),
	(8, 'Demo', NULL, NULL, 'demo@gmail.com', NULL, '$2y$12$gqarITgVD4R7eqjfEaCaJusny58GdWqPwmy92G6JVKteT8wQx8Dn2', 'DIyqhIg7X3bifmu8UUaAH5mzt9V8FL62qf3R62LJcspmVagOHtTE6MvrCpNF', '2024-12-26 23:10:38', '2025-01-16 20:11:13', 'basic', '2024-12-26 23:10:00', '2025-01-18 23:10:00', 1),
	(9, 'Elfuhrerpicks', NULL, '@Elfuhrerpicks', 'Elfuhrerpicks@gmail.com', NULL, '$2y$12$k9sTeP8.G/KtYYwW5rSbQ.NTw4HUKDu4cD7ju4zYI372JOJazZJ9C', 'K1hBlhw4vOtfVdmKgfm9z9ZRs4Z80fcUJ3hw8nq6C6kwlnkE8B9ETy1954Ij', '2024-12-27 10:59:16', '2024-12-27 11:33:06', 'basic', '2024-12-27 10:58:54', '2024-12-28 10:58:58', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
