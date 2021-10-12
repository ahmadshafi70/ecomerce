-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2021 at 04:28 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `starherbal`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobile_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`, `mobile_photo`) VALUES
(23, NULL, '', 'assets/feature/Slider-1.png', NULL, 'active', '2021-09-22 17:59:01', '2021-09-30 17:54:35', 'assets/feature/Mobile-Slider-1.png'),
(24, NULL, '-2109225909-624', 'assets/feature/Slider-2.png', NULL, 'active', '2021-09-22 17:59:09', '2021-09-30 17:54:28', 'assets/feature/Mobile-Slider-2.png'),
(25, NULL, '-2109225915-940', 'assets/feature/Slider-3.png', NULL, 'active', '2021-09-22 17:59:15', '2021-09-30 17:54:20', 'assets/feature/Mobile-Slider-3.png'),
(26, NULL, '-2109225922-894', 'assets/feature/Slider-4.png', NULL, 'active', '2021-09-22 17:59:22', '2021-09-30 17:54:13', 'assets/feature/Mobile-Slider-4.png'),
(27, NULL, '-2109225927-234', 'assets/feature/Slider-5.png', NULL, 'active', '2021-09-22 17:59:27', '2021-09-30 17:54:00', 'assets/feature/Mobile-Slider-5.png');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'adidas', 'active', '2020-08-14 04:23:00', '2020-08-14 04:23:00'),
(2, 'Nike', 'nike', 'active', '2020-08-14 04:23:08', '2020-08-14 04:23:08'),
(3, 'Kappa', 'kappa', 'active', '2020-08-14 04:23:48', '2020-08-14 04:23:48'),
(4, 'Prada', 'prada', 'active', '2020-08-14 04:24:08', '2020-08-14 04:24:08'),
(6, 'Brand', 'brand', 'active', '2020-08-17 20:50:31', '2020-08-17 20:50:31'),
(7, 'new brand', 'new-brand-2110124659-573', 'active', '2021-10-12 08:46:59', '2021-10-12 08:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(15, 19, 70, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:33:38', '2021-10-07 09:34:05'),
(16, 21, 70, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:34:05', '2021-10-07 09:34:05'),
(17, 19, 71, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:34:32', '2021-10-07 09:34:52'),
(18, 15, 71, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:34:52', '2021-10-07 09:34:52'),
(19, 16, 71, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:34:52', '2021-10-07 09:34:52'),
(20, 17, 71, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:34:52', '2021-10-07 09:34:52'),
(21, 19, 72, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:35:46', '2021-10-07 09:36:23'),
(22, 15, 72, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:36:23', '2021-10-07 09:36:23'),
(23, 16, 72, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:36:23', '2021-10-07 09:36:23'),
(24, 17, 72, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:36:23', '2021-10-07 09:36:23'),
(25, 18, 72, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:36:23', '2021-10-07 09:36:23'),
(26, 19, 72, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:36:23', '2021-10-07 09:36:23'),
(27, 20, 72, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:36:23', '2021-10-07 09:36:23'),
(28, 21, 72, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:36:23', '2021-10-07 09:36:23'),
(29, 19, 73, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:36:49', '2021-10-07 09:37:14'),
(30, 15, 73, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:37:13', '2021-10-07 09:37:14'),
(31, 16, 73, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:37:13', '2021-10-07 09:37:14'),
(32, 17, 73, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:37:13', '2021-10-07 09:37:14'),
(33, 18, 73, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:37:13', '2021-10-07 09:37:14'),
(34, 19, 73, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:37:13', '2021-10-07 09:37:14'),
(35, 20, 73, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:37:13', '2021-10-07 09:37:14'),
(36, 21, 73, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:37:14', '2021-10-07 09:37:14'),
(37, 22, 73, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:37:14', '2021-10-07 09:37:14'),
(38, 23, 73, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:37:14', '2021-10-07 09:37:14'),
(39, 24, 73, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:37:14', '2021-10-07 09:37:14'),
(40, 25, 73, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:37:14', '2021-10-07 09:37:14'),
(41, 26, 73, 57, 1208.79, 'new', 2, 2429.79, '2021-10-07 09:37:14', '2021-10-07 09:37:14'),
(42, 27, 73, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:37:14', '2021-10-07 09:37:14'),
(43, 28, 73, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:37:14', '2021-10-07 09:37:14'),
(44, 29, 73, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:37:14', '2021-10-07 09:37:14'),
(45, 19, 74, 57, 1208.79, 'new', 1, 1208.79, '2021-10-07 09:39:51', '2021-10-07 09:40:15'),
(46, 19, 97, 57, 234.00, 'new', 1, 0.00, '2021-10-08 01:54:31', '2021-10-08 01:54:31'),
(47, 21, 98, 57, 345.00, 'new', 1, 0.00, '2021-10-08 01:55:40', '2021-10-08 01:55:40'),
(48, 21, 99, 57, 1000.00, 'new', 1, 200.00, '2021-10-08 01:57:08', '2021-10-08 01:57:08'),
(49, 21, 100, 53, 200.00, 'new', 1, 200.00, '2021-10-08 01:58:42', '2021-10-08 01:58:42'),
(50, 19, 101, 57, 234.00, 'new', 1, 434.00, '2021-10-08 02:07:13', '2021-10-08 02:07:13'),
(51, 21, 102, 57, 23423.00, 'new', 1, 23423.00, '2021-10-08 02:08:06', '2021-10-08 02:08:06'),
(52, 21, 103, 57, 234.00, 'new', 1, 534.00, '2021-10-08 02:10:02', '2021-10-08 02:10:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(12, 'Tube', 'tube', NULL, NULL, 0, NULL, NULL, 'active', '2021-09-03 18:53:04', '2021-09-03 18:53:04'),
(13, 'serup', 'serup', NULL, NULL, 1, NULL, NULL, 'active', '2021-09-03 18:53:15', '2021-09-03 18:53:15'),
(14, 'Skin care', 'skin-care', NULL, NULL, 1, NULL, NULL, 'active', '2021-09-03 18:54:30', '2021-09-03 18:54:30'),
(15, 'Chinese herbal', 'chinese-herbal', NULL, NULL, 1, NULL, NULL, 'active', '2021-09-03 18:54:44', '2021-09-03 18:54:44'),
(16, 'test cat', '', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 07:29:18', '2021-10-12 07:29:18'),
(17, 'test cat', '-2110122949-476', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 07:29:49', '2021-10-12 07:29:49'),
(18, 'test cat', '-2110123829-237', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 07:38:29', '2021-10-12 07:38:29'),
(19, 'test 1', '-2110124626-847', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 07:46:26', '2021-10-12 07:46:26'),
(20, 'test', 'test', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 07:47:16', '2021-10-12 07:47:16'),
(21, 'test', 'test-2110125455-983', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 07:54:55', '2021-10-12 07:54:55'),
(22, 'test', 'test-2110121557-713', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 08:15:57', '2021-10-12 08:15:57'),
(23, 'testing', 'test-2110121800-633', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 08:18:00', '2021-10-12 08:18:00'),
(24, 'test cat 1', 'test-cat-1', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 08:42:56', '2021-10-12 08:42:56'),
(25, 'test brand', 'test-brand', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 08:42:56', '2021-10-12 08:42:56'),
(26, 'asdfasdf', 'asdfasdf', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 08:45:34', '2021-10-12 08:45:34'),
(27, 'new brand', 'new-brand', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 08:45:34', '2021-10-12 08:45:34'),
(28, 'asdfasdf', 'asdfasdf-2110124659-863', NULL, NULL, 1, NULL, NULL, 'active', '2021-10-12 08:46:59', '2021-10-12 08:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', '300.00', 'active', NULL, NULL),
(2, '111111', 'percent', '10.00', 'active', NULL, NULL),
(5, 'abcd', 'fixed', '250.00', 'active', '2020-08-17 20:54:58', '2020-08-17 20:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Prajwal Rai', 'About price', 'prajwal.iar@gmail.com', NULL, '9807009999', 'Hello sir i am from kathmandu nepal.', '2020-08-14 08:25:46', '2020-08-14 08:00:01', '2020-08-14 08:25:46'),
(2, 'Prajwal Rai', 'About Price', 'prajwal.iar@gmail.com', NULL, '9800099000', 'Hello i am Prajwal Rai', '2020-08-18 03:04:15', '2020-08-15 07:52:39', '2020-08-18 03:04:16'),
(3, 'Prajwal Rai', 'lorem ipsum', 'prajwal.iar@gmail.com', NULL, '1200990009', 'hello sir sdfdfd dfdjf ;dfjd fd ldkfd', NULL, '2020-08-17 21:15:12', '2020-08-17 21:15:12'),
(4, 'test test', 'New Account Notification', 'ahmadpakchamp@gmail.com', NULL, '03054375760', 'sdaasdsadasdsadsaasd', NULL, '2021-09-22 15:03:55', '2021-09-22 15:03:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1),
(21, '2021_09_22_054118_add_phone_to_user', 2),
(22, '2021_09_25_054840_create_newsletters_table', 3),
(23, '2021_09_28_065844_alter_banner_table_for_mobile', 3),
(24, '2021_10_01_102808_alter_order_table_for_comments', 4),
(26, '2021_10_04_105506_alter_orders_table_for_region_city', 5);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1179da6f-3ee8-4a89-9458-39055cfb331f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/product-detail\\/lorem-ipsum-leorm\",\"fas\":\"fa-star\"}', NULL, '2021-09-22 19:58:40', '2021-09-22 19:58:40'),
('12e2163a-fcc3-4f4d-8c40-162d3f4c4c3d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/68\",\"fas\":\"fa-file-alt\"}', NULL, '2021-10-07 08:07:29', '2021-10-07 08:07:29'),
('16d09fe0-9de3-4114-bdda-37959fff649e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/21\",\"fas\":\"fa-file-alt\"}', NULL, '2021-09-08 18:10:18', '2021-09-08 18:10:18'),
('1a4df439-f953-4285-a2f9-e1794dd14bbe', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/73\",\"fas\":\"fa-file-alt\"}', NULL, '2021-10-07 09:37:14', '2021-10-07 09:37:14'),
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('292c97f6-adf2-4b49-93ae-86a49df736f6', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/69\",\"fas\":\"fa-file-alt\"}', NULL, '2021-10-07 08:09:06', '2021-10-07 08:09:06'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('563e3391-dd17-4127-8135-6c3baf4b2806', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/22\",\"fas\":\"fa-file-alt\"}', NULL, '2021-09-08 18:17:20', '2021-09-08 18:17:20'),
('5838c580-3b4e-4bad-b091-cb648d40692a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/66\",\"fas\":\"fa-file-alt\"}', NULL, '2021-10-07 07:59:28', '2021-10-07 07:59:28'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('601c3929-4624-448e-a87e-ccdbda972a73', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/65\",\"fas\":\"fa-file-alt\"}', NULL, '2021-10-07 07:57:21', '2021-10-07 07:57:21'),
('616d5469-8656-45ce-b453-7568bcbec2a4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"https:\\/\\/ecom.maceshub.com\\/public\\/admin\\/order\\/24\",\"fas\":\"fa-file-alt\"}', NULL, '2021-09-26 22:53:59', '2021-09-26 22:53:59'),
('698e6c25-c546-40e0-bbd4-eacfc6218d59', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/product-detail\\/lorem-ipsum-leorm\",\"fas\":\"fa-star\"}', NULL, '2021-09-22 19:58:55', '2021-09-22 19:58:55'),
('727dd954-d2bc-4a37-aba5-e9bff0e0334e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/blog-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fas fa-comment\"}', NULL, '2021-09-22 19:31:25', '2021-09-22 19:31:25'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('74792bbd-f0c3-4a0a-a034-be1dd2334209', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/blog-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fas fa-comment\"}', NULL, '2021-09-22 19:31:25', '2021-09-22 19:31:25'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', '2021-09-02 15:23:27', '2020-08-17 21:17:03', '2021-09-02 15:23:27'),
('ae7a43a4-5571-470f-bd5c-9085319e1173', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/70\",\"fas\":\"fa-file-alt\"}', NULL, '2021-10-07 09:34:05', '2021-10-07 09:34:05'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('b9e6fe89-9ecb-4407-8f45-947bc2b98fd7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/blog-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fas fa-comment\"}', NULL, '2021-09-22 19:31:13', '2021-09-22 19:31:13'),
('c6213389-f1e7-45cf-a172-ac7789003266', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/23\",\"fas\":\"fa-file-alt\"}', NULL, '2021-09-08 18:19:11', '2021-09-08 18:19:11'),
('c965c219-019c-432f-9a9a-79029e685c3b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/blog-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fas fa-comment\"}', NULL, '2021-09-22 19:31:00', '2021-09-22 19:31:00'),
('cf7f2244-905e-454e-8cfd-d2802472f19f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/71\",\"fas\":\"fa-file-alt\"}', NULL, '2021-10-07 09:34:52', '2021-10-07 09:34:52'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('d569afce-54a8-4abe-b24e-f0738afcf4cc', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"https:\\/\\/ecom.maceshub.com\\/public\\/product-detail\\/lorem-ipsum-12\",\"fas\":\"fa-star\"}', NULL, '2021-09-24 06:55:45', '2021-09-24 06:55:45'),
('dcf4d3ff-51a9-4522-8993-0affafbfcaa0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/67\",\"fas\":\"fa-file-alt\"}', NULL, '2021-10-07 08:01:27', '2021-10-07 08:01:27'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('e6dc5afc-adb2-48bc-82d3-597176b49d7f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/74\",\"fas\":\"fa-file-alt\"}', NULL, '2021-10-07 09:40:15', '2021-10-07 09:40:15'),
('fe7a8373-300e-43c9-8c52-2d0a5a5efdb0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/ecomerce\\/public\\/admin\\/order\\/72\",\"fas\":\"fa-file-alt\"}', NULL, '2021-10-07 09:36:23', '2021-10-07 09:36:23'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','recall','cancel','confirmed','delivered','returned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`, `comments`, `region`, `city`) VALUES
(70, 'ORD-JSHNMSGZN1', 57, 4859.58, NULL, NULL, 4859.58, 4, 'cod', 'unpaid', 'new', 'test', 'test', 'ahmadpakchamp@gmail.com', '03054375760', NULL, '54000', 'test', 'test', '2021-10-07 09:34:05', '2021-10-07 09:34:05', NULL, NULL, 'lahore'),
(71, 'ORD-VD1USK8LI3', 57, 7277.16, 31, NULL, 7400.16, 6, 'cod', 'unpaid', 'new', 'test', 'test', 'ahmadpakchamp@gmail.com', '03054375760', NULL, '54000', 'test', 'test', '2021-10-07 09:34:52', '2021-10-08 07:12:15', NULL, 'punjab', 'lahore'),
(72, 'ORD-8TNRRUK0R1', 57, 14554.32, 5, NULL, 14754.32, 12, 'cod', 'unpaid', 'new', 'test', 'test', 'ahmadpakchamp@gmail.com', '03054375760', NULL, '54000', 'test', 'test', '2021-10-07 09:36:23', '2021-10-07 09:36:23', NULL, NULL, 'lahore'),
(73, 'ORD-PEI8FLWZGU', 57, 29108.64, 5, NULL, 29308.64, 24, 'cod', 'unpaid', 'new', 'test', 'test', 'ahmadpakchamp@gmail.com', '03054375760', NULL, '54000', 'test', 'test', '2021-10-07 09:37:14', '2021-10-07 09:37:14', NULL, NULL, 'lahore'),
(74, 'ORD-AAMHXWZCFV', 57, 1208.79, 6, NULL, 1458.79, 1, 'cod', 'unpaid', 'new', 'test', 'test', 'ahmadpakchamp@gmail.com', '03054375760', NULL, '54000', 'test', 'test', '2021-10-07 09:40:15', '2021-10-07 09:40:15', NULL, NULL, 'lahore'),
(75, '18358', 57, 12.00, 5, NULL, 200.00, 1, 'cod', 'paid', 'recall', 'testing', NULL, 'testing@gmail.com', '03054375760', NULL, '54000', 'test\r\ntest', NULL, '2021-10-08 00:14:36', '2021-10-08 00:14:36', 'sdfsdf', 'punjab', 'lahore'),
(76, '63049', 57, 12.00, 5, NULL, 200.00, 1, 'cod', 'paid', 'recall', 'testing', NULL, 'testing@gmail.com', '03054375760', NULL, '54000', 'test\r\ntest', NULL, '2021-10-08 00:15:21', '2021-10-08 00:15:21', 'sdfsdf', 'punjab', 'lahore'),
(77, '30177', 57, 12.00, 5, NULL, 200.00, 1, 'cod', 'paid', 'recall', 'testing', NULL, 'testing@gmail.com', '03054375760', NULL, '54000', 'test\r\ntest', NULL, '2021-10-08 00:16:42', '2021-10-08 00:16:42', 'sdfsdf', 'punjab', 'lahore'),
(78, '28565', 57, 123.00, 16, NULL, 23.00, 12, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '03054375760', NULL, '54000', 'test\r\ntest', NULL, '2021-10-08 00:20:00', '2021-10-08 00:20:00', 'asdads', 'punjab', 'lahore'),
(79, '83699', 57, 123.00, 16, NULL, 23.00, 12, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '03054375760', NULL, '54000', 'test\r\ntest', NULL, '2021-10-08 00:20:34', '2021-10-08 00:20:34', 'asdads', 'punjab', 'lahore'),
(80, '69792', 57, 123.00, 16, NULL, 23.00, 12, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '03054375760', NULL, '54000', 'test\r\ntest', NULL, '2021-10-08 00:21:35', '2021-10-08 00:21:35', 'asdads', 'punjab', 'lahore'),
(81, '87952', 57, 123.00, 16, NULL, 23.00, 12, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '03054375760', NULL, '54000', 'test\r\ntest', NULL, '2021-10-08 00:42:53', '2021-10-08 00:42:53', 'asdads', 'punjab', 'lahore'),
(82, '74504', 57, 123.00, 16, NULL, 23.00, 12, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '03054375760', NULL, '54000', 'test\r\ntest', NULL, '2021-10-08 00:44:19', '2021-10-08 00:44:19', 'asdads', 'punjab', 'lahore'),
(83, '88213', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 00:45:07', '2021-10-08 00:45:07', 'sadfasd', 'punjab', 'lahore'),
(84, '11755', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 00:59:42', '2021-10-08 00:59:42', 'sadfasd', 'punjab', 'lahore'),
(85, '93258', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:03:09', '2021-10-08 01:03:09', 'sadfasd', 'punjab', 'lahore'),
(86, '46483', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:04:00', '2021-10-08 01:04:00', 'sadfasd', 'punjab', 'lahore'),
(87, '41808', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:18:28', '2021-10-08 01:18:28', 'sadfasd', 'punjab', 'lahore'),
(88, '65344', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:18:44', '2021-10-08 01:18:44', 'sadfasd', 'punjab', 'lahore'),
(89, '54510', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:20:24', '2021-10-08 01:20:24', 'sadfasd', 'punjab', 'lahore'),
(90, '97386', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:22:33', '2021-10-08 01:22:33', 'sadfasd', 'punjab', 'lahore'),
(91, '98986', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:31:51', '2021-10-08 01:31:51', 'sadfasd', 'punjab', 'lahore'),
(92, '29288', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:32:38', '2021-10-08 01:32:38', 'sadfasd', 'punjab', 'lahore'),
(93, '87692', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:34:24', '2021-10-08 01:34:24', 'sadfasd', 'punjab', 'lahore'),
(94, '9298', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:34:56', '2021-10-08 01:34:56', 'sadfasd', 'punjab', 'lahore'),
(95, '24190', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:37:20', '2021-10-08 01:37:20', 'sadfasd', 'punjab', 'lahore'),
(96, '2024', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:52:07', '2021-10-08 01:52:07', 'sadfasd', 'punjab', 'lahore'),
(97, '20654', 57, 234.00, 1, NULL, 0.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:54:31', '2021-10-08 01:54:31', 'sadfasd', 'punjab', 'lahore'),
(98, '87117', 57, 345.00, 1, NULL, 0.00, 1, 'cod', 'unpaid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:55:39', '2021-10-08 01:55:39', 'asdasdasdas', 'punjab', 'lahore'),
(99, '39756', 57, 1000.00, 5, NULL, 200.00, 1, 'cod', 'unpaid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:57:08', '2021-10-08 01:57:08', 'asdasdsd', 'punjab', 'lahore'),
(100, '42871', 53, 200.00, 5, NULL, 200.00, 1, 'cod', 'paid', 'new', 'asdasd', NULL, 'ahmadshaf70@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 01:58:42', '2021-10-08 01:58:42', 'ye new ha', 'punjab', 'lahore'),
(101, '45682', 57, 234.00, 5, NULL, 434.00, 1, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 02:07:13', '2021-10-08 02:07:13', 'rssdfdsf', 'punjab', 'lahore'),
(102, '94448', 57, 23423.00, 1, NULL, 23423.00, 2, 'cod', 'paid', 'new', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 02:08:06', '2021-10-08 02:14:26', 'asdasd', 'punjab', 'lahore'),
(103, '40384', 57, 200.00, 7, NULL, 500.00, 1, 'cod', 'paid', 'recall', 'testing', NULL, 'testing@gmail.com', '+923054375760', NULL, '54000', 'Zainab Tower Model Twon link road lahore', NULL, '2021-10-08 02:10:02', '2021-10-08 02:14:00', '2323423', 'punjab', 'lahore');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><hr><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p>', NULL, '/storage/photos/1/Blog/blog3.jpg', 'Enjoy,2020', 2, NULL, 1, 'active', '2020-08-17 20:54:19', '2020-08-17 20:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Travel', 'contrary', 'active', '2020-08-14 01:51:03', '2020-08-14 01:51:39'),
(2, 'Electronics', 'richard', 'active', '2020-08-14 01:51:22', '2020-08-14 01:52:00'),
(3, 'Cloths', 'cloths', 'active', '2020-08-14 01:52:22', '2020-08-14 01:52:22'),
(4, 'enjoy', 'enjoy', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10'),
(5, 'Post Category', 'post-category', 'active', '2020-08-15 06:59:04', '2020-08-15 06:59:04');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Testing comment edited', 'active', NULL, NULL, '2020-08-14 07:08:42', '2020-08-15 06:59:58'),
(2, NULL, NULL, 'testing 2', 'active', NULL, 1, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
(3, 2, NULL, 'That\'s cool', 'active', NULL, 2, '2020-08-14 07:12:27', '2020-08-14 07:12:27'),
(4, 1, NULL, 'nice', 'active', NULL, NULL, '2020-08-15 07:31:19', '2020-08-15 07:31:19'),
(5, NULL, NULL, 'nice blog', 'active', NULL, NULL, '2020-08-15 07:51:01', '2020-08-15 07:51:01'),
(6, 2, NULL, 'nice', 'active', NULL, NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29'),
(7, 2, NULL, 'really', 'active', NULL, 6, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
(8, 1, 6, 'asdassasdasdasdas asdxasxcascascasc', 'active', NULL, NULL, '2021-09-22 19:30:59', '2021-09-22 19:30:59'),
(9, 1, 6, 'assdasassadasdasds', 'active', NULL, 8, '2021-09-22 19:31:13', '2021-09-22 19:31:13'),
(10, 1, 6, 'asdasasdasdasd', 'active', NULL, 9, '2021-09-22 19:31:25', '2021-09-22 19:31:25'),
(11, 1, 6, 'asdasasdasdasd', 'active', NULL, 9, '2021-09-22 19:31:25', '2021-09-22 19:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Enjoy', 'enjoy', 'active', '2020-08-14 01:53:52', '2020-08-14 01:53:52'),
(2, '2020', '2020', 'active', '2020-08-14 01:54:09', '2020-08-14 01:54:09'),
(3, 'Visit nepal 2020', 'visit-nepal-2020', 'active', '2020-08-14 01:54:33', '2020-08-14 01:54:33'),
(4, 'Tag', 'tag', 'active', '2020-08-15 06:59:31', '2020-08-15 06:59:31'),
(5, 'asdasd', 'asdasd', 'active', '2021-09-22 13:53:28', '2021-09-22 13:53:28');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(19, 'Lorem Ipsum 1', 'lorem-ipsum-12', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'assets/feature/58317_1564142644.gif', 1106, '', 'hot', 'active', 1221.00, 1.00, 1, 15, NULL, NULL, '2021-09-03 18:56:19', '2021-09-03 18:56:19'),
(21, 'Lorem Ipsum 2', 'lorem-ipsum-leorm', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'ffsdfdsfsdfsd', 'assets/feature/58317_1564142644.gif', 1003, '', 'hot', 'active', 4000.00, 1.00, 1, 13, NULL, NULL, '2021-09-03 18:56:19', '2021-09-24 06:30:54'),
(25, 'asdas', 'asdas', 'asda', 'asd', 'assets/feature/Mobile-Slider-3.png', 12, '', 'new', 'active', 1233.00, 21.00, 1, 13, NULL, 2, '2021-10-12 08:14:39', '2021-10-12 08:14:39'),
(27, 'TEST', 'test-2110121800-75', 'TEST', 'TEST', 'assets/feature/Mobile-Slider-4.png', 12, '', 'new', 'active', 12.00, 1.00, 1, 23, NULL, 2, '2021-10-12 08:18:00', '2021-10-12 08:18:00'),
(28, '6th test', '6th-test', 'ttest', 'ttest', 'assets/feature/Mobile-Slider-2.png', 12, '', 'new', 'active', 213.00, 1.00, 1, 24, NULL, NULL, '2021-10-12 08:42:56', '2021-10-12 08:42:56'),
(30, 'sdf', 'sdf', 'sdf', 'dfs', 'assets/feature/Mobile-Slider-4.png', 123, '', 'new', 'active', 123.00, 12.00, 1, 28, NULL, 7, '2021-10-12 08:46:59', '2021-10-12 08:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, 5, 'nice', 'inactive', '2020-08-17 21:08:14', '2021-09-23 12:01:34'),
(3, 1, 21, 5, 'asdasdasdasdasd', 'inactive', '2021-09-22 19:58:40', '2021-09-23 12:01:43'),
(4, 1, 21, 5, 'hiiiiiii', 'active', '2021-09-22 19:58:55', '2021-09-22 19:58:55'),
(5, 1, 19, 5, 'asdasasdasdasdas', 'active', '2021-09-24 06:55:45', '2021-09-24 06:55:45');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Star Herbal provides 100% natural herbal products. Our capsules reduces your weight and maintain metabolism digestion constipation.', 'Star Herbal provides you 100% natural herbal products. Our capsules reduces your weight and maintain metabolism digestion constipation.', 'assets/feature/starherballogo.png', 'assets/feature/Slider-5.png', 'NO. 342 - London Oxford Street, 012 United Kingdom.', '+060 (800) 801-582', 'info@starherbal.com', NULL, '2021-09-23 17:53:10');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'custom', '0.00', 'active', '2021-10-06 09:36:22', '2021-10-06 09:36:22'),
(2, 'Free', '0.00', 'active', '2021-10-05 03:07:24', '2021-10-05 03:08:46'),
(5, 'Lahore', '200.00', 'active', '2021-09-07 19:21:06', '2021-10-05 03:03:33'),
(6, 'Faisal abad', '250.00', 'active', '2021-09-07 19:21:21', '2021-10-05 03:08:58'),
(7, 'Karachi', '300.00', 'active', '2021-09-07 19:21:37', '2021-10-05 03:07:04'),
(10, 'asdfasf', '2323.00', 'active', '2021-10-06 06:00:18', '2021-10-06 06:00:18'),
(11, 'asdfasf', '2323.00', 'active', '2021-10-06 06:01:10', '2021-10-06 06:01:10'),
(12, 'asdasd', '23.00', 'active', '2021-10-06 06:01:54', '2021-10-06 06:01:54'),
(13, 'asdasd', '23.00', 'active', '2021-10-06 06:02:07', '2021-10-06 06:02:07'),
(14, 'asdasd', '23.00', 'active', '2021-10-06 06:04:11', '2021-10-06 06:04:11'),
(15, 'adasd', '23.00', 'active', '2021-10-06 06:06:01', '2021-10-06 06:06:01'),
(16, 'adasd', '23.00', 'active', '2021-10-06 06:06:46', '2021-10-06 06:06:46'),
(17, 'werw', '23432.00', 'active', '2021-10-06 06:08:04', '2021-10-06 06:08:04'),
(18, 'rfasdfasd', '23.00', 'active', '2021-10-06 06:09:13', '2021-10-06 06:09:13'),
(19, '234', '23.00', 'active', '2021-10-06 06:10:26', '2021-10-06 06:10:26'),
(20, 'werr234', '2134.00', 'active', '2021-10-06 06:11:29', '2021-10-06 06:11:29'),
(21, 'werr234', '2134.00', 'active', '2021-10-06 06:13:15', '2021-10-06 06:13:15'),
(22, '123', '2345.00', 'active', '2021-10-06 06:17:55', '2021-10-06 06:17:55'),
(23, '2', '234.00', 'active', '2021-10-06 06:20:37', '2021-10-06 06:20:37'),
(24, '2', '234.00', 'active', '2021-10-06 06:21:10', '2021-10-06 06:21:10'),
(25, '2', '234.00', 'active', '2021-10-06 06:21:30', '2021-10-06 06:21:30'),
(26, '2', '23423.00', 'active', '2021-10-06 06:21:56', '2021-10-06 06:21:56'),
(27, '2', '23423.00', 'active', '2021-10-06 06:22:37', '2021-10-06 06:22:37'),
(28, '2', '23423.00', 'active', '2021-10-06 06:22:57', '2021-10-06 06:22:57'),
(29, '2', '23423.00', 'active', '2021-10-06 06:23:39', '2021-10-06 06:23:39'),
(30, '12', '123.00', 'active', '2021-10-06 06:25:29', '2021-10-06 06:25:29'),
(31, '12', '123.00', 'active', '2021-10-06 06:37:27', '2021-10-06 06:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`, `phone`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$/nvF0Q0R57r1G1Rij21sXefYufZ2hMm.23f8RJcZvPIuopFARihCa', 'assets/feature/Logo-125x145-px.png', 'admin', NULL, NULL, 'active', 'nhRj5H3Y9QSIfvlliabbgtIJ2Y4ssecw2BtXfwN5b1OJu3WWBcNaf40AzgHU', NULL, '2021-09-30 05:10:52', '1231231231232'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', 'assets/feature/Logo-125x145-px.png', 'user', NULL, NULL, 'active', NULL, NULL, '2021-09-22 19:00:07', '23123213123123'),
(33, 'asdfdsf', 'admin@site.com', NULL, '$2y$10$jjK6fSV2ck8FlyO0y2OSNObF.qqe/uBsvImnjmwjxxGejvflG6DwO', NULL, 'user', NULL, NULL, 'active', NULL, '2021-09-22 12:45:03', '2021-09-22 19:00:41', '2342342342'),
(53, 'asdasd', 'ahmadshaf70@gmail.com', NULL, '$2y$10$cH2jDFpywQK01eTAaN17de4MdNdcXCWuR/8ZvvWBY1RjnXZLbZmtK', 'assets/feature/whatsapp.png', 'user', NULL, NULL, 'active', NULL, '2021-09-22 17:43:12', '2021-09-22 17:43:12', '23424'),
(54, 'ahmad shafi', 'ahmadpakchamp@gmail.com', NULL, NULL, NULL, 'user', 'google', '100124776169796714123', 'active', NULL, '2021-09-25 06:46:03', '2021-09-25 06:46:03', NULL),
(55, 'ahmad', 'ahmad.shafi@pakchamp.com', NULL, '$2y$10$sRid0dqOTGbk8v1QuDX14ebrxl5kve6JMqvc.HGogLoVG8RPtLi5C', NULL, 'user', NULL, NULL, 'active', NULL, '2021-09-25 07:20:53', '2021-09-25 07:20:53', '03054375760'),
(56, 'test', 'test@gmail.com', NULL, '$2y$10$B8i393P/yYOqb73qeo1KY.HcJu1HUsRfHGyPx/CPGSPC7CEll73hi', NULL, 'user', NULL, NULL, 'active', NULL, '2021-10-07 07:12:47', '2021-10-07 07:12:47', '234242'),
(57, 'testing', 'testing@gmail.com', NULL, '$2y$10$fPPWot9Hgk6s3Gm7TUPnte557yWAl96VZ1ooZjQhpZcwuUSvS6Pw6', NULL, 'user', NULL, NULL, 'active', NULL, '2021-10-07 08:38:43', '2021-10-07 08:38:43', '2342');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
