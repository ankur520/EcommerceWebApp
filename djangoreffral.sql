-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2021 at 04:00 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `djangoreffral`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add admin signup forms', 7, 'add_adminsignupforms'),
(26, 'Can change admin signup forms', 7, 'change_adminsignupforms'),
(27, 'Can delete admin signup forms', 7, 'delete_adminsignupforms'),
(28, 'Can view admin signup forms', 7, 'view_adminsignupforms'),
(29, 'Can add admin forms', 7, 'add_adminforms'),
(30, 'Can change admin forms', 7, 'change_adminforms'),
(31, 'Can delete admin forms', 7, 'delete_adminforms'),
(32, 'Can view admin forms', 7, 'view_adminforms'),
(33, 'Can add user forms', 8, 'add_userforms'),
(34, 'Can change user forms', 8, 'change_userforms'),
(35, 'Can delete user forms', 8, 'delete_userforms'),
(36, 'Can view user forms', 8, 'view_userforms'),
(37, 'Can add add sectors', 9, 'add_addsectors'),
(38, 'Can change add sectors', 9, 'change_addsectors'),
(39, 'Can delete add sectors', 9, 'delete_addsectors'),
(40, 'Can view add sectors', 9, 'view_addsectors'),
(41, 'Can add add category', 10, 'add_addcategory'),
(42, 'Can change add category', 10, 'change_addcategory'),
(43, 'Can delete add category', 10, 'delete_addcategory'),
(44, 'Can view add category', 10, 'view_addcategory'),
(45, 'Can add add sub category', 11, 'add_addsubcategory'),
(46, 'Can change add sub category', 11, 'change_addsubcategory'),
(47, 'Can delete add sub category', 11, 'delete_addsubcategory'),
(48, 'Can view add sub category', 11, 'view_addsubcategory'),
(49, 'Can add add product services', 12, 'add_addproductservices'),
(50, 'Can change add product services', 12, 'change_addproductservices'),
(51, 'Can delete add product services', 12, 'delete_addproductservices'),
(52, 'Can view add product services', 12, 'view_addproductservices'),
(53, 'Can add affliate link', 13, 'add_affliatelink'),
(54, 'Can change affliate link', 13, 'change_affliatelink'),
(55, 'Can delete affliate link', 13, 'delete_affliatelink'),
(56, 'Can view affliate link', 13, 'view_affliatelink');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(10, 'home', 'addcategory'),
(12, 'home', 'addproductservices'),
(9, 'home', 'addsectors'),
(11, 'home', 'addsubcategory'),
(7, 'home', 'adminforms'),
(13, 'home', 'affliatelink'),
(8, 'home', 'userforms'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-10-10 10:29:30.967179'),
(2, 'auth', '0001_initial', '2021-10-10 10:29:38.562506'),
(3, 'admin', '0001_initial', '2021-10-10 10:29:40.768578'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-10-10 10:29:40.847184'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-10-10 10:29:40.890539'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-10-10 10:29:41.966316'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-10-10 10:29:43.211036'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-10-10 10:29:43.501544'),
(9, 'auth', '0004_alter_user_username_opts', '2021-10-10 10:29:43.549316'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-10-10 10:29:43.981660'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-10-10 10:29:44.015532'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-10-10 10:29:44.075733'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-10-10 10:29:44.171022'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-10-10 10:29:44.258875'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-10-10 10:29:44.372102'),
(16, 'auth', '0011_update_proxy_permissions', '2021-10-10 10:29:44.528627'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-10-10 10:29:44.649361'),
(18, 'sessions', '0001_initial', '2021-10-10 10:29:45.189522'),
(19, 'home', '0001_initial', '2021-10-10 14:13:27.741890'),
(20, 'home', '0002_rename_adminsignupforms_adminforms', '2021-10-10 15:19:38.645166'),
(21, 'home', '0003_userforms', '2021-10-12 10:38:01.457186'),
(22, 'home', '0004_addsectors', '2021-10-13 09:43:08.368320'),
(23, 'home', '0005_addcategory', '2021-10-13 11:50:40.428134'),
(24, 'home', '0006_addsubcategory', '2021-10-15 14:53:01.217163'),
(25, 'home', '0007_userforms_usertype', '2021-10-15 17:03:01.437193'),
(26, 'home', '0008_addproductservices', '2021-10-17 12:48:26.300209'),
(27, 'home', '0009_auto_20211017_1817', '2021-10-17 12:48:28.534764'),
(28, 'home', '0010_auto_20211017_1824', '2021-10-17 12:54:54.251369'),
(29, 'home', '0011_auto_20211018_0925', '2021-10-18 03:55:31.041801'),
(30, 'home', '0012_auto_20211018_0955', '2021-10-18 04:26:01.263585'),
(31, 'home', '0013_auto_20211018_1209', '2021-10-18 06:39:17.281200'),
(32, 'home', '0014_auto_20211018_1438', '2021-10-18 09:09:00.246444'),
(33, 'home', '0015_alter_addproductservices_imageurl_1', '2021-10-18 09:19:44.674400'),
(34, 'home', '0016_alter_addproductservices_imageurl_1', '2021-10-18 09:31:32.608500'),
(35, 'home', '0017_auto_20211018_1520', '2021-10-18 09:50:42.774758'),
(36, 'home', '0018_affliatelink', '2021-10-19 09:43:05.670463');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7agj178pzadiu35q891xu8v48lqb9we9', 'e30:1mZyoT:MuPa8j_D7YNd2f8KC3_4JVwOMiYzzdSP_htwT15lQh0', '2021-10-25 17:10:09.682447'),
('82l4nmh8zgfqwt2w8kn7cmri23j61uqp', 'e30:1maEnd:mqJp2zrEU4ENuGIhv6KmvVsSmp5G_CiKH40MLOvo4H0', '2021-10-26 10:14:21.233261'),
('9cdh5qpeybxgs7o584qq7x1fbrxg2z2b', '.eJyrVkpMyc3M88lPT09N8cxTsiopKk3VQRZ0zU3MzPFMUbJSSnRIB7H1kvNzlVCU-CXmpoLkiwoyS1BlQotTi0B6DY1qAdE_JN0:1maDyD:_O-qn4NvlfySNExSdVjQvppLYfXwMUA9BIsA8T-0QaE', '2021-10-26 09:21:13.349677'),
('dlx9x13i12c5stsfw28psd1v08ut0r3u', '.eJyrViotTi3yyU9PT03xzFOyKikqTdVBEnPNTczM8UxRslJKcUgHsfWS83OVkFX4JeamAqUj89NTizMUvEtzE4tQ5EOBLJAB5rUALeYl-w:1mck8u:imPLn2vQTE127gqmNVCgoiv1vGusJXaUyGC9bnUmjuw', '2021-11-02 08:06:40.113317'),
('w4imnzwf8oy86vd5jpb8xi1jrlx4ux4a', '.eJyrVkpMyc3M88lPT09N8cxTsiopKk3VQRZ0zU3MzPFMUbJSKs7MS89IzEqsLHBIBwnqJefnKqGo9UvMTQUqTCwqyCxBlQktTi0CGWJoUgsAW5MorA:1maDzf:w54zOQeA3stw5g-RBUsTJHHGBJoKKqUpH2eY_YDvHOA', '2021-10-26 09:22:43.205418');

-- --------------------------------------------------------

--
-- Table structure for table `home_addcategory`
--

CREATE TABLE `home_addcategory` (
  `id` bigint(20) NOT NULL,
  `sectorId` varchar(200) NOT NULL,
  `sectorName` varchar(200) NOT NULL,
  `categoryName` varchar(200) NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home_addcategory`
--

INSERT INTO `home_addcategory` (`id`, `sectorId`, `sectorName`, `categoryName`, `date`) VALUES
(1, '1', 'Crypto Currency', 'Signal', '2021-10-13 21:55:22.045581'),
(2, '7', 'Health Care', 'Medical Insurances', '2021-10-13 21:55:30.936798'),
(3, '9', 'Ecommerce', 'Mobile', '2021-10-13 21:55:37.200711'),
(4, '1', 'Crypto Currency', 'btc', '2021-10-13 21:58:19.557550'),
(5, '1', 'Crypto Currency', 'eth', '2021-10-13 21:58:44.116451'),
(6, '8', 'Schools', 'Admission', '2021-10-15 11:48:44.393370'),
(7, '9', 'Ecommerce', 'Electronics & Appliances', '2021-10-17 10:18:57.007492');

-- --------------------------------------------------------

--
-- Table structure for table `home_addproductservices`
--

CREATE TABLE `home_addproductservices` (
  `id` bigint(20) NOT NULL,
  `productName` varchar(200) NOT NULL,
  `sectorId` varchar(200) NOT NULL,
  `categoryId` varchar(200) NOT NULL,
  `subCatId` varchar(200) NOT NULL,
  `imageUrl_1` varchar(100) NOT NULL,
  `imageUrl_2` varchar(100) NOT NULL,
  `productPrice` varchar(200) NOT NULL,
  `productHighlights` varchar(5000) NOT NULL,
  `productDescription` varchar(5000) NOT NULL,
  `date` datetime(6) NOT NULL,
  `userId` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home_addproductservices`
--

INSERT INTO `home_addproductservices` (`id`, `productName`, `sectorId`, `categoryId`, `subCatId`, `imageUrl_1`, `imageUrl_2`, `productPrice`, `productHighlights`, `productDescription`, `date`, `userId`) VALUES
(27, 'samsung Fridge 27', '9', '7', '4', 'productimages/gl-b201aspy-4-2020-lg-original-imag35keudpanyx3.jpeg', 'productimages/gl-b201aspy-4-2020-lg-original-imag35keudpanyx3.jpeg', '20199', '190 L : Good for couples and small families\r\nSmart Inverter Compressor\r\n4 Star : For Energy savings up to 45%\r\nDirect Cool : Economical, consumes less electricity, requires manual defrosting', 'Drinks, fresh fruits, or leftover meals - your kitchen will always have something delicious to relish with this LG 190 L refrigerator in your home. This essential kitchen appliance features LG’s Smart Inverter Compressor, Smart Connect Technology, and an Anti-bacterial Gasket for effective cooling and long-lasting consistent performance. ', '2021-10-18 15:20:54.254682', '5'),
(28, 'LG Washing Machine 28', '9', '7', '6', 'productimages/resize-16345523722016607995imgonlinecomuaresizerlWncDYnJX.jpg', 'productimages/resize-16345523722016607995imgonlinecomuaresizerlWncDYnJX.jpg', '15200', 'Semi Automatic Top Load\r\n1300 rpm : Higher the spin speed, lower the drying time\r\n5 Star Rating\r\n7 kg', 'If washing heaps of laundry every day feels strenuous, then you can bring home this Samsung washing machine and let it help you like a trusted companion. It features a Magic Filter which keeps your laundry clean by collecting lint and fluff. It also has caster wheels, so you won’t have to seek help from anyone if you want to move it to a different location in your house. What’s more, it is long-lasting too, as its body is made of rust-proof plastic', '2021-10-18 15:22:45.316023', '6'),
(29, 'SAMSUNG Galaxy Z Fold3 5G 29', '9', '3', '5', 'productimages/galaxy-z-fold3-5g-sm-f926bzkdinu-samsung-original-imag662a7zgxn2fv.jpeg', 'productimages/galaxy-z-fold3-5g-sm-f926bzkdinu-samsung-original-imag662azwhyh9bc.jpeg', '149999', '12 GB RAM | 512 GB ROM\r\n19.3 cm (7.6 inch) QXGA+ Display\r\n12MP + 12MP + 12MP | 10MP Front Camera\r\n4400 mAh Lithium-ion Battery\r\nQualcomm Snapdragon 888 Octa-Core Processor', 'Handset, Non-removable Battery Included, Data Cable (C-to-C), Ejection Pin, Protective Vinyl, Protective Films (Pre-installed on Main & Cover Display), Quick Start Guide', '2021-10-18 15:24:37.089304', '5'),
(30, 'samsung Fridge 30', '9', '7', '4', 'productimages/gl-b201aspy-4-2020-lg-original-imag35keudpanyx3.jpeg', 'productimages/gl-b201aspy-4-2020-lg-original-imag35keudpanyx3.jpeg', '15699', '190 L : Good for couples and small families\r\nSmart Inverter Compressor\r\n4 Star : For Energy savings up to 45%\r\nDirect Cool : Economical, consumes less electricity, requires manual defrosting', 'Drinks, fresh fruits, or leftover meals - your kitchen will always have something delicious to relish with this LG 190 L refrigerator in your home. This essential kitchen appliance features LG’s Smart Inverter Compressor, Smart Connect Technology, and an Anti-bacterial Gasket for effective cooling and long-lasting consistent performance. ', '2021-10-18 15:20:54.254682', '5'),
(31, 'LG Washing Machine 31', '9', '7', '6', 'productimages/resize-16345523722016607995imgonlinecomuaresizerlWncDYnJX.jpg', 'productimages/resize-16345523722016607995imgonlinecomuaresizerlWncDYnJX.jpg', '25300', 'Semi Automatic Top Load\r\n1300 rpm : Higher the spin speed, lower the drying time\r\n5 Star Rating\r\n7 kg', 'If washing heaps of laundry every day feels strenuous, then you can bring home this Samsung washing machine and let it help you like a trusted companion. It features a Magic Filter which keeps your laundry clean by collecting lint and fluff. It also has caster wheels, so you won’t have to seek help from anyone if you want to move it to a different location in your house. What’s more, it is long-lasting too, as its body is made of rust-proof plastic', '2021-10-18 15:22:45.316023', '5'),
(32, 'SAMSUNG Galaxy Z Fold3 5G 32', '9', '3', '5', 'productimages/galaxy-z-fold3-5g-sm-f926bzkdinu-samsung-original-imag662a7zgxn2fv.jpeg', 'productimages/galaxy-z-fold3-5g-sm-f926bzkdinu-samsung-original-imag662azwhyh9bc.jpeg', '99999', '12 GB RAM | 512 GB ROM\r\n19.3 cm (7.6 inch) QXGA+ Display\r\n12MP + 12MP + 12MP | 10MP Front Camera\r\n4400 mAh Lithium-ion Battery\r\nQualcomm Snapdragon 888 Octa-Core Processor', 'Handset, Non-removable Battery Included, Data Cable (C-to-C), Ejection Pin, Protective Vinyl, Protective Films (Pre-installed on Main & Cover Display), Quick Start Guide', '2021-10-18 15:24:37.089304', '5');

-- --------------------------------------------------------

--
-- Table structure for table `home_addsectors`
--

CREATE TABLE `home_addsectors` (
  `id` bigint(20) NOT NULL,
  `sectorName` varchar(200) NOT NULL,
  `uDate` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home_addsectors`
--

INSERT INTO `home_addsectors` (`id`, `sectorName`, `uDate`) VALUES
(1, 'Crypto Currency', '2021-10-13 18:02:38.709517'),
(7, 'Health Care', '2021-10-13 17:04:10.634032'),
(8, 'Schools', '2021-10-13 17:59:29.000483'),
(9, 'Ecommerce', '2021-10-13 17:59:46.721181');

-- --------------------------------------------------------

--
-- Table structure for table `home_addsubcategory`
--

CREATE TABLE `home_addsubcategory` (
  `id` bigint(20) NOT NULL,
  `sectorId` varchar(200) NOT NULL,
  `sectorName` varchar(200) NOT NULL,
  `categoryId` varchar(200) NOT NULL,
  `categoryName` varchar(200) NOT NULL,
  `subCategoryName` varchar(200) NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home_addsubcategory`
--

INSERT INTO `home_addsubcategory` (`id`, `sectorId`, `sectorName`, `categoryId`, `categoryName`, `subCategoryName`, `date`) VALUES
(2, '1', 'Crypto Currency', '4', 'btc', ' contract', '2021-10-15 20:57:33.630777'),
(3, '7', 'Health Care', '2', 'Medical Insurances', 'LIC', '2021-10-15 20:58:12.173760'),
(4, '9', 'Ecommerce', '7', 'Electronics & Appliances', 'Refrigerators', '2021-10-17 10:19:20.067293'),
(5, '9', 'Ecommerce', '3', 'Mobile', 'Samsung', '2021-10-17 18:58:28.378770'),
(6, '9', 'Ecommerce', '7', 'Electronics & Appliances', 'Washing Machine', '2021-10-18 15:14:57.385563');

-- --------------------------------------------------------

--
-- Table structure for table `home_adminforms`
--

CREATE TABLE `home_adminforms` (
  `id` bigint(20) NOT NULL,
  `inputName` varchar(200) NOT NULL,
  `inputEmail` varchar(200) NOT NULL,
  `inputPassword` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home_adminforms`
--

INSERT INTO `home_adminforms` (`id`, `inputName`, `inputEmail`, `inputPassword`) VALUES
(12, 'arpit', 'a@gmail.com', '123'),
(13, 'ankur', 'singhratap606@gmail.com', 'sa'),
(14, 'pranav', 'singhajayp@gmail.com', 'dsaf'),
(17, 'Anisha Begam', 'ravi@gmail.com', '216845');

-- --------------------------------------------------------

--
-- Table structure for table `home_affliatelink`
--

CREATE TABLE `home_affliatelink` (
  `id` bigint(20) NOT NULL,
  `userId` varchar(200) NOT NULL,
  `productId` varchar(200) NOT NULL,
  `affliateCode` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home_affliatelink`
--

INSERT INTO `home_affliatelink` (`id`, `userId`, `productId`, `affliateCode`) VALUES
(1, '7', '27', 'eLhBDJ1M2P72292777'),
(2, '7', '32', 'zQJtLpKIlM77037068');

-- --------------------------------------------------------

--
-- Table structure for table `home_userforms`
--

CREATE TABLE `home_userforms` (
  `id` bigint(20) NOT NULL,
  `uName` varchar(200) NOT NULL,
  `uEmail` varchar(200) NOT NULL,
  `uPassword` varchar(200) NOT NULL,
  `uDate` datetime(6) NOT NULL,
  `userType` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home_userforms`
--

INSERT INTO `home_userforms` (`id`, `uName`, `uEmail`, `uPassword`, `uDate`, `userType`) VALUES
(1, 'ajay pratap singh', 'a@gmail.com', 'a', '2021-10-12 16:15:36.191225', 'Visitor'),
(5, 'ajay pratap singh', 'b@gmail.com', 'b', '2021-10-15 22:34:29.939199', 'Both'),
(6, 'Anisha Begam', 'c@gmail.com', 'c', '2021-10-15 23:23:13.292158', 'Creater'),
(7, 'Yogesh Kumar', 'd@gmail.com', 'd', '2021-10-15 23:23:43.071166', 'Affliater');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `home_addcategory`
--
ALTER TABLE `home_addcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_addproductservices`
--
ALTER TABLE `home_addproductservices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_addsectors`
--
ALTER TABLE `home_addsectors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_addsubcategory`
--
ALTER TABLE `home_addsubcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_adminforms`
--
ALTER TABLE `home_adminforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_affliatelink`
--
ALTER TABLE `home_affliatelink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_userforms`
--
ALTER TABLE `home_userforms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `home_addcategory`
--
ALTER TABLE `home_addcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `home_addproductservices`
--
ALTER TABLE `home_addproductservices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `home_addsectors`
--
ALTER TABLE `home_addsectors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `home_addsubcategory`
--
ALTER TABLE `home_addsubcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `home_adminforms`
--
ALTER TABLE `home_adminforms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `home_affliatelink`
--
ALTER TABLE `home_affliatelink`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `home_userforms`
--
ALTER TABLE `home_userforms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
