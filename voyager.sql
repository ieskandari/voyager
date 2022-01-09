-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 09, 2022 at 12:13 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voyager`
--

-- --------------------------------------------------------

--
-- Table structure for table `vo_accountsides`
--

DROP TABLE IF EXISTS `vo_accountsides`;
CREATE TABLE IF NOT EXISTS `vo_accountsides` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_accountsides`
--

INSERT INTO `vo_accountsides` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'سجاد اسکندری', 'شسکام', '2022-01-09 02:54:39', '2022-01-09 02:54:39'),
(2, 'جلیل نوری', 'شسکام', '2022-01-09 02:54:56', '2022-01-09 02:54:56');

-- --------------------------------------------------------

--
-- Table structure for table `vo_banks`
--

DROP TABLE IF EXISTS `vo_banks`;
CREATE TABLE IF NOT EXISTS `vo_banks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_banks`
--

INSERT INTO `vo_banks` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'بانک سپه', 'بانک سپه', '2022-01-09 02:25:09', '2022-01-09 02:25:09'),
(2, 'بانک ملت', 'بانک ملت', '2022-01-09 02:25:23', '2022-01-09 02:25:23');

-- --------------------------------------------------------

--
-- Table structure for table `vo_categories`
--

DROP TABLE IF EXISTS `vo_categories`;
CREATE TABLE IF NOT EXISTS `vo_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vo_categories_slug_unique` (`slug`),
  KEY `vo_categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_categories`
--

INSERT INTO `vo_categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2022-01-08 03:53:15', '2022-01-08 03:53:15'),
(2, NULL, 1, 'Category 2', 'category-2', '2022-01-08 03:53:15', '2022-01-08 03:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `vo_data_rows`
--

DROP TABLE IF EXISTS `vo_data_rows`;
CREATE TABLE IF NOT EXISTS `vo_data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `vo_data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_data_rows`
--

INSERT INTO `vo_data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(82, 32, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(83, 32, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(84, 32, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(85, 32, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 4),
(86, 32, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(87, 33, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(88, 33, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(89, 33, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(90, 33, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 4),
(91, 33, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(92, 34, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(93, 34, 'accountside_id', 'text', 'Accountside Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(94, 34, 'bank_id', 'text', 'Bank Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(95, 34, 'bed', 'number', 'بدهکار', 0, 1, 1, 1, 1, 1, '{}', 6),
(96, 34, 'bes', 'number', 'بستانکار', 0, 1, 1, 1, 1, 1, '{}', 7),
(97, 34, 'created_at', 'timestamp', 'تاریخ ایجاد', 0, 1, 1, 0, 0, 0, '{}', 8),
(98, 34, 'sanad_date', 'date', 'تاریخ سند', 1, 1, 1, 1, 1, 1, '{}', 9),
(99, 34, 'documnet_hasone_vo_accountside_relationship', 'relationship', 'نام طرف حساب', 1, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Accountside\",\"table\":\"vo_accountsides\",\"type\":\"belongsTo\",\"column\":\"accountside_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"vo_accountsides\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(100, 34, 'documnet_belongsto_vo_bank_relationship', 'relationship', 'نام بانک', 1, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Bank\",\"table\":\"vo_banks\",\"type\":\"belongsTo\",\"column\":\"bank_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"vo_accountsides\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(101, 34, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);

-- --------------------------------------------------------

--
-- Table structure for table `vo_data_types`
--

DROP TABLE IF EXISTS `vo_data_types`;
CREATE TABLE IF NOT EXISTS `vo_data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vo_data_types_name_unique` (`name`),
  UNIQUE KEY `vo_data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_data_types`
--

INSERT INTO `vo_data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-01-08 03:53:09', '2022-01-08 03:53:09'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-01-08 03:53:09', '2022-01-08 03:53:09'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-01-08 03:53:09', '2022-01-08 03:53:09'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2022-01-08 03:53:14', '2022-01-08 03:53:14'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2022-01-08 03:53:15', '2022-01-08 03:53:15'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(32, 'accountsides', 'accountsides', 'Accountside', 'Accountsides', NULL, 'TCG\\Voyager\\Models\\Accountside', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2022-01-09 06:57:35', '2022-01-09 06:57:35'),
(33, 'banks', 'banks', 'Bank', 'Banks', NULL, 'TCG\\Voyager\\Models\\Bank', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-01-09 06:58:24', '2022-01-09 06:58:38'),
(34, 'documnets', 'documnets', 'Documnet', 'Documnets', NULL, 'TCG\\Voyager\\Models\\Documnet', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-09 06:59:11', '2022-01-09 08:04:09');

-- --------------------------------------------------------

--
-- Table structure for table `vo_documnets`
--

DROP TABLE IF EXISTS `vo_documnets`;
CREATE TABLE IF NOT EXISTS `vo_documnets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `accountside_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `bed` int(11) DEFAULT '0',
  `bes` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `sanad_date` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_documnets`
--

INSERT INTO `vo_documnets` (`id`, `accountside_id`, `bank_id`, `bed`, `bes`, `created_at`, `sanad_date`, `updated_at`) VALUES
(1, 1, 1, 12000, 0, '2022-01-09 08:04:35', '2022-01-09 00:00:00', '2022-01-09 08:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `vo_failed_jobs`
--

DROP TABLE IF EXISTS `vo_failed_jobs`;
CREATE TABLE IF NOT EXISTS `vo_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vo_failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vo_menus`
--

DROP TABLE IF EXISTS `vo_menus`;
CREATE TABLE IF NOT EXISTS `vo_menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vo_menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_menus`
--

INSERT INTO `vo_menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-01-08 03:53:10', '2022-01-08 03:53:10'),
(2, 'حسابدار', '2022-01-08 04:02:54', '2022-01-08 04:02:54');

-- --------------------------------------------------------

--
-- Table structure for table `vo_menu_items`
--

DROP TABLE IF EXISTS `vo_menu_items`;
CREATE TABLE IF NOT EXISTS `vo_menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `vo_menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_menu_items`
--

INSERT INTO `vo_menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-01-08 03:53:10', '2022-01-08 03:53:10', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2022-01-08 03:53:10', '2022-01-08 03:53:10', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2022-01-08 03:53:10', '2022-01-08 03:53:10', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2022-01-08 03:53:10', '2022-01-08 03:53:10', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2022-01-08 03:53:10', '2022-01-08 03:53:10', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2022-01-08 03:53:10', '2022-01-08 03:53:10', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2022-01-08 03:53:11', '2022-01-08 03:53:11', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2022-01-08 03:53:11', '2022-01-08 03:53:11', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2022-01-08 03:53:11', '2022-01-08 03:53:11', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2022-01-08 03:53:11', '2022-01-08 03:53:11', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2022-01-08 03:53:15', '2022-01-08 03:53:15', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2022-01-08 03:53:16', '2022-01-08 03:53:16', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2022-01-08 03:53:16', '2022-01-08 03:53:16', 'voyager.pages.index', NULL),
(15, 2, 'بانک ها', 'Banks', '_self', NULL, '#000000', NULL, 16, '2022-01-09 01:28:04', '2022-01-09 01:28:04', NULL, ''),
(19, 2, 'طرف حساب', 'Accountsides', '_self', NULL, '#000000', NULL, 19, '2022-01-09 02:57:10', '2022-01-09 02:57:10', NULL, ''),
(21, 1, 'Accountsides', '', '_self', NULL, NULL, NULL, 21, '2022-01-09 06:57:35', '2022-01-09 06:57:35', 'voyager.accountsides.index', NULL),
(22, 1, 'Banks', '', '_self', NULL, NULL, NULL, 22, '2022-01-09 06:58:24', '2022-01-09 06:58:24', 'voyager.banks.index', NULL),
(23, 1, 'Documnets', '', '_self', NULL, NULL, NULL, 23, '2022-01-09 06:59:11', '2022-01-09 06:59:11', 'voyager.documnets.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vo_migrations`
--

DROP TABLE IF EXISTS `vo_migrations`;
CREATE TABLE IF NOT EXISTS `vo_migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_migrations`
--

INSERT INTO `vo_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vo_pages`
--

DROP TABLE IF EXISTS `vo_pages`;
CREATE TABLE IF NOT EXISTS `vo_pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vo_pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_pages`
--

INSERT INTO `vo_pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2022-01-08 03:53:16', '2022-01-08 03:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `vo_password_resets`
--

DROP TABLE IF EXISTS `vo_password_resets`;
CREATE TABLE IF NOT EXISTS `vo_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `vo_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vo_permissions`
--

DROP TABLE IF EXISTS `vo_permissions`;
CREATE TABLE IF NOT EXISTS `vo_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vo_permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_permissions`
--

INSERT INTO `vo_permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(2, 'browse_bread', NULL, '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(3, 'browse_database', NULL, '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(4, 'browse_media', NULL, '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(5, 'browse_compass', NULL, '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(6, 'browse_menus', 'menus', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(7, 'read_menus', 'menus', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(8, 'edit_menus', 'menus', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(9, 'add_menus', 'menus', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(10, 'delete_menus', 'menus', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(11, 'browse_roles', 'roles', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(12, 'read_roles', 'roles', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(13, 'edit_roles', 'roles', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(14, 'add_roles', 'roles', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(15, 'delete_roles', 'roles', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(16, 'browse_users', 'users', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(17, 'read_users', 'users', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(18, 'edit_users', 'users', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(19, 'add_users', 'users', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(20, 'delete_users', 'users', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(21, 'browse_settings', 'settings', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(22, 'read_settings', 'settings', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(23, 'edit_settings', 'settings', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(24, 'add_settings', 'settings', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(25, 'delete_settings', 'settings', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(26, 'browse_categories', 'categories', '2022-01-08 03:53:15', '2022-01-08 03:53:15'),
(27, 'read_categories', 'categories', '2022-01-08 03:53:15', '2022-01-08 03:53:15'),
(28, 'edit_categories', 'categories', '2022-01-08 03:53:15', '2022-01-08 03:53:15'),
(29, 'add_categories', 'categories', '2022-01-08 03:53:15', '2022-01-08 03:53:15'),
(30, 'delete_categories', 'categories', '2022-01-08 03:53:15', '2022-01-08 03:53:15'),
(31, 'browse_posts', 'posts', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(32, 'read_posts', 'posts', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(33, 'edit_posts', 'posts', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(34, 'add_posts', 'posts', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(35, 'delete_posts', 'posts', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(36, 'browse_pages', 'pages', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(37, 'read_pages', 'pages', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(38, 'edit_pages', 'pages', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(39, 'add_pages', 'pages', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(40, 'delete_pages', 'pages', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(66, 'browse_accountsides', 'accountsides', '2022-01-09 06:57:35', '2022-01-09 06:57:35'),
(67, 'read_accountsides', 'accountsides', '2022-01-09 06:57:35', '2022-01-09 06:57:35'),
(68, 'edit_accountsides', 'accountsides', '2022-01-09 06:57:35', '2022-01-09 06:57:35'),
(69, 'add_accountsides', 'accountsides', '2022-01-09 06:57:35', '2022-01-09 06:57:35'),
(70, 'delete_accountsides', 'accountsides', '2022-01-09 06:57:35', '2022-01-09 06:57:35'),
(71, 'browse_banks', 'banks', '2022-01-09 06:58:24', '2022-01-09 06:58:24'),
(72, 'read_banks', 'banks', '2022-01-09 06:58:24', '2022-01-09 06:58:24'),
(73, 'edit_banks', 'banks', '2022-01-09 06:58:24', '2022-01-09 06:58:24'),
(74, 'add_banks', 'banks', '2022-01-09 06:58:24', '2022-01-09 06:58:24'),
(75, 'delete_banks', 'banks', '2022-01-09 06:58:24', '2022-01-09 06:58:24'),
(76, 'browse_documnets', 'documnets', '2022-01-09 06:59:11', '2022-01-09 06:59:11'),
(77, 'read_documnets', 'documnets', '2022-01-09 06:59:11', '2022-01-09 06:59:11'),
(78, 'edit_documnets', 'documnets', '2022-01-09 06:59:11', '2022-01-09 06:59:11'),
(79, 'add_documnets', 'documnets', '2022-01-09 06:59:11', '2022-01-09 06:59:11'),
(80, 'delete_documnets', 'documnets', '2022-01-09 06:59:11', '2022-01-09 06:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `vo_permission_role`
--

DROP TABLE IF EXISTS `vo_permission_role`;
CREATE TABLE IF NOT EXISTS `vo_permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `vo_permission_role_permission_id_index` (`permission_id`),
  KEY `vo_permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_permission_role`
--

INSERT INTO `vo_permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vo_personal_access_tokens`
--

DROP TABLE IF EXISTS `vo_personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `vo_personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vo_personal_access_tokens_token_unique` (`token`),
  KEY `vo_personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vo_posts`
--

DROP TABLE IF EXISTS `vo_posts`;
CREATE TABLE IF NOT EXISTS `vo_posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vo_posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_posts`
--

INSERT INTO `vo_posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-01-08 03:53:16', '2022-01-08 03:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `vo_roles`
--

DROP TABLE IF EXISTS `vo_roles`;
CREATE TABLE IF NOT EXISTS `vo_roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vo_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_roles`
--

INSERT INTO `vo_roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-01-08 03:53:11', '2022-01-08 03:53:11'),
(2, 'user', 'کاربر عادی', '2022-01-08 03:53:11', '2022-01-08 05:14:57'),
(3, 'accounting', 'حسابدار', '2022-01-09 01:40:22', '2022-01-09 01:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `vo_settings`
--

DROP TABLE IF EXISTS `vo_settings`;
CREATE TABLE IF NOT EXISTS `vo_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vo_settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_settings`
--

INSERT INTO `vo_settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `vo_translations`
--

DROP TABLE IF EXISTS `vo_translations`;
CREATE TABLE IF NOT EXISTS `vo_translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vo_translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_translations`
--

INSERT INTO `vo_translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-01-08 03:53:16', '2022-01-08 03:53:16'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-01-08 03:53:17', '2022-01-08 03:53:17'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-01-08 03:53:17', '2022-01-08 03:53:17');

-- --------------------------------------------------------

--
-- Table structure for table `vo_users`
--

DROP TABLE IF EXISTS `vo_users`;
CREATE TABLE IF NOT EXISTS `vo_users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vo_users_email_unique` (`email`),
  KEY `vo_users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vo_users`
--

INSERT INTO `vo_users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$nhacnaPhjuXILtIgzrR3tOzajyDAjPC3aTKmAvrg95DD3L.C9FUoa', 'GEqPuDblkX7NbcEM77mBuKV2pZWRkLi0O5JQpR9X0Zf8KaU3G8yVZHP8Za5B', '{\"locale\":\"fa\"}', '2022-01-08 03:53:15', '2022-01-08 10:04:00'),
(4, 3, 'جلیل نوری', 'jalil@nori.com', 'users/default.png', NULL, '$2y$10$F3rVfrjbG.Qvxq1Ge6K2Y.KbltnrvMrmbjMKDwB9QbACvpPWi4YFK', NULL, '{\"locale\":\"fa\"}', '2022-01-09 02:01:16', '2022-01-09 02:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `vo_user_roles`
--

DROP TABLE IF EXISTS `vo_user_roles`;
CREATE TABLE IF NOT EXISTS `vo_user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `vo_user_roles_user_id_index` (`user_id`),
  KEY `vo_user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vo_categories`
--
ALTER TABLE `vo_categories`
  ADD CONSTRAINT `vo_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `vo_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `vo_data_rows`
--
ALTER TABLE `vo_data_rows`
  ADD CONSTRAINT `vo_data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `vo_data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vo_menu_items`
--
ALTER TABLE `vo_menu_items`
  ADD CONSTRAINT `vo_menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `vo_menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vo_permission_role`
--
ALTER TABLE `vo_permission_role`
  ADD CONSTRAINT `vo_permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `vo_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vo_permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `vo_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vo_users`
--
ALTER TABLE `vo_users`
  ADD CONSTRAINT `vo_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `vo_roles` (`id`);

--
-- Constraints for table `vo_user_roles`
--
ALTER TABLE `vo_user_roles`
  ADD CONSTRAINT `vo_user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `vo_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vo_user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vo_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
