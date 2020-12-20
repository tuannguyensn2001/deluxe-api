-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 20, 2020 lúc 04:05 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `deluxe`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `fullname`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Cc4wIb1dSVYfSezkxGpNNiGDD2r1', 'bbbbbbbbbbbbbbbbbb', '33333333333333333333333333333333333333', '33333333333333333333333333333333333333333333333333', '2020-12-20 14:31:47', '2020-12-20 14:31:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `collection_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attributes`
--

INSERT INTO `attributes` (`id`, `collection_id`, `name`, `code`, `data_type`, `is_required`, `created_at`, `updated_at`) VALUES
(1, '4', 'Cân', 'weight', 'double', 0, '2020-12-01 09:40:03', '2020-12-01 09:40:03'),
(5, '6', 'cân', 'weight', 'string', 0, '2020-12-01 10:26:01', '2020-12-01 10:26:01'),
(6, '7', 'loại', 'type', 'string', 0, '2020-12-01 10:45:49', '2020-12-01 10:45:49'),
(7, '8', 'số lượng', 'amount', 'int', 0, '2020-12-01 11:16:30', '2020-12-01 11:16:30'),
(8, '8', 'hãng xe', 'manu', 'string', 0, '2020-12-01 11:16:30', '2020-12-01 11:16:30'),
(9, '9', 'hãng', 'manu', 'string', 0, '2020-12-17 09:51:26', '2020-12-17 09:51:26'),
(10, '9', 'số lượng', 'amount', 'int', 0, '2020-12-17 09:51:26', '2020-12-17 09:51:26'),
(11, '4', 'Loai', 'type', 'string', 0, '2020-12-18 02:14:33', '2020-12-18 02:14:33'),
(12, '10', 'hãng', 'Manu', 'string', 0, '2020-12-20 13:43:42', '2020-12-20 13:43:42'),
(13, '10', 'số lượng', 'amuont', 'int', 0, '2020-12-20 13:43:42', '2020-12-20 13:43:42'),
(14, '11', 'loại sản phẩm', 'product type', 'string', 0, '2020-12-20 14:12:25', '2020-12-20 14:12:25'),
(15, '11', 'số lượng', 'amount', 'string', 0, '2020-12-20 14:12:25', '2020-12-20 14:12:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `product_id` varchar(255) DEFAULT NULL,
  `attribute_id` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`product_id`, `attribute_id`, `type`, `created_at`, `updated_at`) VALUES
('36', '30a5bb26-77e0-43c7-ae83-c76f8ebebddf', 'sách tham khảo', '2020-12-01 11:08:21', '2020-12-01 11:08:21'),
('34', '4e70a218-8108-4acf-a443-f48b4c3e5824', 'Sách tham khảo', '2020-12-01 11:02:11', '2020-12-01 11:02:11'),
('30', '51b41415-4207-4118-89ca-544967b8f857', 'Sách đọc', '2020-12-01 10:55:28', '2020-12-01 10:55:28'),
('29', '537a2345-d3dc-45c3-a17c-d84ab886b9bd', 'Sách đọc', '2020-12-01 10:53:16', '2020-12-01 10:53:16'),
('39', '5be471a4-ddc8-4ac5-a739-7325135e80c3', 'Sách tham khảo', '2020-12-01 11:10:57', '2020-12-01 11:10:57'),
('33', '735c238e-d4b0-4d7d-9849-d8e67a6176b2', 'Sách đọc', '2020-12-01 10:58:05', '2020-12-01 10:58:05'),
('38', '82ff2ad8-49f2-4f2c-87e2-f3b3abffde0f', 'sách tham khảo', '2020-12-01 11:10:03', '2020-12-01 11:10:03'),
('27', '864bb702-2ac0-43ef-8527-28f43584acd7', 'sách đọc', '2020-12-01 10:50:59', '2020-12-01 10:50:59'),
('32', '9338c34e-40c3-47d0-94eb-6171b665b091', 'sách đọc', '2020-12-01 10:57:01', '2020-12-01 10:57:01'),
('31', '9ab4b0a3-06e3-45dc-a891-6bb80470924d', 'sách đọc', '2020-12-01 10:56:17', '2020-12-01 10:56:17'),
('41', 'c06882c2-36c3-472b-8bef-e330fce6432e', 'Sách ôn thi', '2020-12-01 11:13:47', '2020-12-01 11:13:47'),
('40', 'db412186-d679-421d-be02-4475c70d6e55', 'Sách ôn thi', '2020-12-01 11:12:12', '2020-12-01 11:12:12'),
('35', 'dbec9e3d-1aa6-41ed-8d2b-678b829d7327', 'sách tham khảo', '2020-12-01 11:03:13', '2020-12-01 11:03:13'),
('28', 'f707fc86-4292-4b2a-add4-ab0fd075d066', 'Sách đọc', '2020-12-01 10:52:10', '2020-12-01 10:52:10'),
('37', 'f7288820-af0b-44b9-a05b-abb1c7504edf', 'sách tham khảo', '2020-12-01 11:09:11', '2020-12-01 11:09:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `number`, `total`, `created_at`, `updated_at`) VALUES
(1, 'Cc4wIb1dSVYfSezkxGpNNiGDD2r1', '14', 2, 40000, '2020-12-18 01:49:38', '2020-12-18 03:39:16'),
(2, 'Cc4wIb1dSVYfSezkxGpNNiGDD2r1', '50', 1, 55000000, '2020-12-18 01:50:51', '2020-12-18 03:40:06'),
(3, 'Cc4wIb1dSVYfSezkxGpNNiGDD2r1', '16', 3, 30000, '2020-12-18 01:51:19', '2020-12-18 03:40:12'),
(4, 'Cc4wIb1dSVYfSezkxGpNNiGDD2r1', '1', 2, 100000, '2020-12-18 02:16:09', '2020-12-18 03:44:32'),
(5, 'Cc4wIb1dSVYfSezkxGpNNiGDD2r1', '52', 1, 30000000, '2020-12-19 01:08:56', '2020-12-19 01:08:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `clock`
--

CREATE TABLE `clock` (
  `product_id` varchar(255) DEFAULT NULL,
  `attribute_id` varchar(255) NOT NULL,
  `Manu` varchar(255) DEFAULT NULL,
  `amuont` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `clock`
--

INSERT INTO `clock` (`product_id`, `attribute_id`, `Manu`, `amuont`, `created_at`, `updated_at`) VALUES
('61', '2e94136f-4ca4-47a8-962a-bdca099bdf0e', 'Titan nổi tiếng của Ấn Độ', 10, '2020-12-20 13:49:22', '2020-12-20 13:49:22'),
('66', '6922ff5c-cfd7-4e15-8241-0e14e98bbbd0', 'Casio Nhật Bản', 7, '2020-12-20 14:07:21', '2020-12-20 14:07:21'),
('67', '79815e5a-7cf2-441b-ac24-e73a36c521fd', 'Casio', 7, '2020-12-20 14:09:30', '2020-12-20 14:09:30'),
('60', '9898c70c-52d3-4bb5-8c60-91faebeb2144', 'Orient của Nhật Bản', 10, '2020-12-20 13:47:57', '2020-12-20 13:47:57'),
('59', 'b265d439-f62d-45ac-9d01-82f28762482f', 'Đồng hồ MVW Việt Nam', 10, '2020-12-20 13:45:38', '2020-12-20 13:45:38'),
('65', 'c1f5dd27-d66a-4c53-8a2a-64052648a0cb', 'Haumi', 5, '2020-12-20 14:01:48', '2020-12-20 14:01:48'),
('63', 'ce703061-9358-4866-b0ae-faeab4706e8d', 'Casio nổi tiếng của Nhật Bản.', 10, '2020-12-20 13:52:47', '2020-12-20 13:52:47'),
('64', 'fc62a512-8303-4794-a641-c5ffccddfb57', 'Apple Watch', 5, '2020-12-20 13:59:32', '2020-12-20 13:59:32'),
('62', 'fcceae13-c777-4b4f-8463-fcadaaed0aa1', 'ICE của Bỉ', 10, '2020-12-20 13:50:50', '2020-12-20 13:50:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `collections`
--

INSERT INTO `collections` (`id`, `name`, `attr_table`, `created_at`, `updated_at`) VALUES
(4, 'Hoa quả', 'fruit', '2020-12-01 09:40:03', '2020-12-01 09:40:03'),
(6, 'Rau củ', 'vegetables', '2020-12-01 10:26:01', '2020-12-01 10:26:01'),
(7, 'sách', 'Book', '2020-12-01 10:45:49', '2020-12-01 10:45:49'),
(8, 'Xe máy', 'Motorbike', '2020-12-01 11:16:30', '2020-12-01 11:16:30'),
(9, 'Điện thoại, Ipad, Table', 'Phone', '2020-12-17 09:51:26', '2020-12-17 09:51:26'),
(10, 'Đồng hồ', 'Clock', '2020-12-20 13:43:42', '2020-12-20 13:43:42'),
(11, 'Phụ kiện', 'accessories', '2020-12-20 14:12:25', '2020-12-20 14:12:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `fruit`
--

CREATE TABLE `fruit` (
  `product_id` varchar(255) DEFAULT NULL,
  `attribute_id` varchar(255) NOT NULL,
  `weight` float DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `fruit`
--

INSERT INTO `fruit` (`product_id`, `attribute_id`, `weight`, `type`, `created_at`, `updated_at`) VALUES
('5', '251a1e0f-8309-434f-baa0-f5a1522ceb07', 25, 'Hoa quả tươi', '2020-12-01 09:50:34', '2020-12-01 09:50:34'),
('6', '256f04a8-979d-4b79-bd56-b34d2836478c', 20, 'Hoa quả tươi', '2020-12-01 09:51:31', '2020-12-01 09:51:31'),
('9', '4975d631-492f-4c5a-851a-cffc6afc3545', 15, 'Hoa quả tươi', '2020-12-01 10:05:45', '2020-12-01 10:05:45'),
('1', '559f77ca-06a3-421c-9eeb-18e2f2ffe54b', 10, 'hoa quả tươi', '2020-12-01 09:42:06', '2020-12-01 09:42:06'),
('12', '57a62b63-3aa0-41ba-8aa9-9826648d82b7', 15, 'Hoa quả tươi', '2020-12-01 10:08:56', '2020-12-01 10:08:56'),
('11', '77d64646-bec7-49d3-9409-6f9017202f12', 10, 'Hoa quả sấy', '2020-12-01 10:08:07', '2020-12-01 10:08:07'),
('10', '79c119b0-40fc-43f6-a8f2-b07084f2bafe', 15, 'Hoa quả tươi', '2020-12-01 10:06:55', '2020-12-01 10:06:55'),
('4', 'b1e5a44f-ceaf-44dc-86ba-55ab367e6122', 0, 'Hoa quả tươi', '2020-12-01 09:47:55', '2020-12-01 09:47:55'),
('7', 'bae6b680-dbea-4db7-9a10-43801d47b973', 15, 'Hoa quả tươi', '2020-12-01 09:56:09', '2020-12-01 09:56:09'),
('8', 'de68a802-3f91-4ec2-8c86-b26ea78b4c09', 10, 'Hoa quả tươi', '2020-12-01 09:57:53', '2020-12-01 09:57:53'),
('3', 'f3fe6b15-342f-4263-a143-3fed957d90f4', 20, 'Hoa quả tươi', '2020-12-01 09:44:19', '2020-12-01 09:44:19'),
('2', 'f458f32f-826f-469b-b1ce-d5148ae41430', 10, 'Hoa quả tươi', '2020-12-01 09:43:22', '2020-12-01 09:43:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_11_19_112324_create_collections_table', 1),
(5, '2020_11_19_112742_create_attributes_table', 1),
(6, '2020_11_21_022447_create_products_table', 1),
(7, '2020_11_25_134936_create_carts_table', 1),
(8, '2020_11_27_151350_create_addresses_table', 1),
(9, '2020_11_27_165617_create_orders_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `motorbike`
--

CREATE TABLE `motorbike` (
  `product_id` varchar(255) DEFAULT NULL,
  `attribute_id` varchar(255) NOT NULL,
  `amount` int(10) DEFAULT NULL,
  `manu` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `motorbike`
--

INSERT INTO `motorbike` (`product_id`, `attribute_id`, `amount`, `manu`, `created_at`, `updated_at`) VALUES
('49', '2bbba218-e9f6-48fe-8ded-42818b876254', 5, 'yamaha', '2020-12-17 09:46:39', '2020-12-17 09:46:39'),
('44', '3405bf23-ab51-4e09-bde1-9baf5e6fbfca', 10, 'Duke', '2020-12-01 11:23:57', '2020-12-01 11:23:57'),
('45', '4c7d2206-601f-4390-a6c5-d8c93c0504e7', 7, 'Honda', '2020-12-17 09:42:57', '2020-12-17 09:42:57'),
('51', '57461b16-a683-4bd0-8807-bb487046ed97', 7, 'honda', '2020-12-17 09:49:36', '2020-12-17 09:49:36'),
('43', '59218d38-4096-40b5-aaf6-a0a09c66074d', 10, 'Suzuki', '2020-12-01 11:22:42', '2020-12-01 11:22:42'),
('48', 'a64f85bd-2a7e-48c2-8791-81d9660ceb99', 5, 'Yamaha', '2020-12-17 09:45:49', '2020-12-17 09:45:49'),
('42', 'a7719799-b37a-4293-988e-d7122b398a2e', 20, 'Honda', '2020-12-01 11:21:16', '2020-12-01 11:21:16'),
('50', 'ac502243-abbe-4c5d-b65a-1978e633db85', 5, 'yamaha', '2020-12-17 09:47:53', '2020-12-17 09:47:53'),
('47', 'd6ebbba5-dbfb-450b-9986-28a875fd4d11', 5, 'Yamaha', '2020-12-17 09:44:55', '2020-12-17 09:44:55'),
('46', 'e7e3d375-21f7-4825-8661-dd2275c39045', 10, 'Honda', '2020-12-17 09:43:59', '2020-12-17 09:43:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`user`)),
  `products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`products`)),
  `money` double NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phone`
--

CREATE TABLE `phone` (
  `product_id` varchar(255) DEFAULT NULL,
  `attribute_id` varchar(255) NOT NULL,
  `manu` varchar(255) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `phone`
--

INSERT INTO `phone` (`product_id`, `attribute_id`, `manu`, `amount`, `created_at`, `updated_at`) VALUES
('56', '35de130f-d0a9-4fc6-99c8-7a82f6f29fee', 'Samsung', 7, '2020-12-19 04:03:15', '2020-12-19 04:03:15'),
('58', '48a74e8a-5871-407f-88c0-5527ac45d328', 'Realme', 5, '2020-12-19 04:13:46', '2020-12-19 04:13:46'),
('53', '5c66ff69-a9b2-46bb-9923-7183d58d1112', 'oppo', 7, '2020-12-17 09:53:53', '2020-12-17 09:53:53'),
('57', '9c849629-0a0f-4a1d-8ba3-bec5bbf858d8', 'Oppo', 7, '2020-12-19 04:12:16', '2020-12-19 04:12:16'),
('55', '9d3503ab-86bd-4dba-979c-0b439e7d8f61', 'Vsmart', 7, '2020-12-19 04:00:42', '2020-12-19 04:00:42'),
('54', 'b27957cb-3a81-4c23-870d-0d5c61933a02', 'Iphone', 6, '2020-12-19 03:59:16', '2020-12-19 03:59:16'),
('52', 'c0b50e92-ab71-4725-9146-d5ad8f9721fa', 'ipad', 5, '2020-12-17 09:52:37', '2020-12-17 09:52:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promotion` double NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `collection_id`, `price`, `thumbnail`, `promotion`, `unit`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Dâu tây', 4, 50000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Funnamed.jpg?alt=media&token=7e7b5888-28f2-4842-8a9f-5ba0a1b9f0ac', 0, 'kg', 'dâu ngon chất lượng', '2020-12-01 09:42:06', '2020-12-01 09:42:30'),
(2, 'Lựu', 4, 20000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2FCong%20dung%20cua%20qua%20luu%201.jpg?alt=media&token=931ac802-a1a1-4875-849b-5e114dee4bc4', 0, 'kg', 'Lựu ngon', '2020-12-01 09:43:22', '2020-12-01 09:43:22'),
(3, 'Xoài', 4, 15000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fcac-loai-trai-cay-nen-va-khong-nen-an-vao-mua-he-2d296e.jpg?alt=media&token=24f4cce3-79fc-4154-bc6a-e70ae00052eb', 0, 'kg', 'Hoa quả tươi ngon chất lượng', '2020-12-01 09:44:19', '2020-12-01 09:45:48'),
(4, 'Chuối', 4, 20000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fchuoi-giup-tang-can.gif?alt=media&token=231bb1c2-1dfa-49c5-b4d4-8032f461b263', 0, 'nải', 'Chất lượng, giá rẻ', '2020-12-01 09:47:55', '2020-12-01 09:47:55'),
(5, 'Cam', 4, 10000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fnhung-trai-cay-tot-cho-suc-khoe-mua-he-1_12141863.jpg?alt=media&token=fd2301d1-8bf7-4948-bc22-d25f7ca63ba0', 0, 'kg', 'Ngon, ngọt', '2020-12-01 09:50:33', '2020-12-01 09:50:33'),
(6, 'Thanh Long', 4, 25000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fqua-thanh-long-1447852598596-0-0-312-424-crop-1447852787613.jpg?alt=media&token=397fec54-0ef7-4197-a2eb-ce3c0ec58c17', 0, 'kg', 'Thanh long ngon, rẻ', '2020-12-01 09:51:31', '2020-12-01 09:51:31'),
(7, 'kiwi', 4, 100000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fkiwi.jpg?alt=media&token=c3ed4d7b-9005-4cd3-9c62-f13ef1797bd7', 0, 'kg', 'chất lượng, rẻ', '2020-12-01 09:56:09', '2020-12-01 09:56:09'),
(8, 'Mâm xôi', 4, 90000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F6141.jpg_wh860.jpg?alt=media&token=e0de0032-d62a-4897-85bf-66f18e831afe', 0, 'kg', 'chất lượng, bổ ích', '2020-12-01 09:57:53', '2020-12-01 09:57:53'),
(9, 'dưa hấu', 4, 20000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F1100342_dc8d02b264bb4bbbb4c359f88564da75_1024x1024.webp?alt=media&token=224c7bb2-121a-4cf7-877d-70c66b52e90f', 0, 'kg', 'Dưa ngon chất lượng', '2020-12-01 10:05:45', '2020-12-01 10:05:45'),
(10, 'Nho', 4, 50000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fbenh-nhan-tieu-duong-va-tieu-duong-thai-ky-an-nho-duoc-khong-5.jpg?alt=media&token=1d78b972-c4b1-4a87-9f8a-8da717882cd2', 0, 'kg', 'Ngọt', '2020-12-01 10:06:55', '2020-12-01 10:06:55'),
(11, 'Nho sấy', 4, 30000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fnho%20s%E1%BA%A5y.jpg?alt=media&token=076d7a5e-7aac-4bf4-8a28-4f8aedf98f3e', 0, 'kg', 'Ngon', '2020-12-01 10:08:07', '2020-12-01 10:08:07'),
(12, 'ổi', 4, 15000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fb87f9611e08e1c0969db75f804157541.jpg?alt=media&token=3dc00455-2d18-4135-a287-17b812949d88', 0, 'kg', 'Giòn, không hạt, ngọt', '2020-12-01 10:08:56', '2020-12-01 10:09:12'),
(13, 'Cải chíp', 5, 15000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Frau-cai-chip.webp?alt=media&token=55e7db98-bb90-440c-9162-17af20999cf9', 0, 'kg', 'Rau sạch, ngon', '2020-12-01 10:20:03', '2020-12-01 10:20:03'),
(14, 'Cải chip', 6, 20000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Frau-cai-chip.webp?alt=media&token=106ccac5-29aa-4ca9-a2d7-e103c8d0c336', 0, 'kg', 'Ngon, sạch', '2020-12-01 10:27:20', '2020-12-01 10:27:20'),
(15, 'Rau dền', 6, 12000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fhat-giong-rau-den-la-tron-600x534.jpg?alt=media&token=b66e88d4-0f33-4a51-b498-edcc130391e2', 0, 'kg', 'Ngon, sạch, rẻ', '2020-12-01 10:28:42', '2020-12-01 10:28:42'),
(16, 'Mồng tơi', 6, 10000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fnhung-loai-rau-trong-san-thuong-thang-3-cang-mua-phun-cang-nhanh-tot-1-1583316341-127-width640height511.jpg?alt=media&token=e3b1a39e-7929-467c-a142-a9c51dea2da2', 0, 'kg', 'Ngon, rẻ', '2020-12-01 10:29:32', '2020-12-01 10:29:32'),
(17, 'rau muống', 6, 10000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Funnamed%20(1).jpg?alt=media&token=0b1deab6-0362-40a7-8fac-45a299636299', 0, 'kg', 'Ngon, sạch', '2020-12-01 10:30:16', '2020-12-01 10:31:28'),
(18, 'rau khoai', 6, 10000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fimage003.jpg?alt=media&token=caa04955-29f1-4ec3-adb8-208e61d8a15c', 0, 'kg', 'Ngon, sạch', '2020-12-01 10:31:08', '2020-12-01 10:31:43'),
(19, 'dưa chuột', 6, 20000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fdua-chuot-co-tac-dung-lam-mat-va-lam-diu-da.jpg?alt=media&token=7015ff21-915f-4905-87d5-e660b4fbc780', 0, 'kg', 'Ngon, giòn', '2020-12-01 10:32:39', '2020-12-01 10:32:39'),
(20, 'Cà rốt', 6, 15000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F30441527_100301624160511_7910663154537857024_n.jpg?alt=media&token=6f4a0a21-5f40-4f40-9f8b-a5b556d5bf68', 0, 'kg', 'giòn, ngon, rẻ', '2020-12-01 10:33:26', '2020-12-01 10:33:26'),
(21, 'rau mùi', 6, 10000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Frau-mui.png?alt=media&token=248b7db5-6c1c-4173-8833-08c4fc8bc450', 0, 'kg', 'rau sạch, thơm', '2020-12-01 10:34:13', '2020-12-01 10:34:13'),
(22, 'Củ cải trắng', 6, 20000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F5413ddc95e44788a02e1c63439b9a2cc.jpg?alt=media&token=836918a0-373c-434a-9926-0a28ae62a76c', 0, 'kg', 'ngon, sạch', '2020-12-01 10:39:42', '2020-12-01 10:39:42'),
(23, 'Súp lơ', 6, 20000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fdiem-mat-cac-loai-rau-cu-giau-caxi-1597034455.jpg?alt=media&token=7a1be9f8-7724-4dda-823a-8ba181d1b6b4', 0, 'kg', 'Ngon, sạch', '2020-12-01 10:40:24', '2020-12-01 10:40:24'),
(24, 'Ngọn bí', 6, 15000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F813c99a3a59cfa574dbe3e75c276673f.jpg?alt=media&token=411ea82c-5f39-4f2c-9dd5-335fcd9068ca', 0, 'kg', 'ngon', '2020-12-01 10:41:09', '2020-12-01 10:41:09'),
(25, 'Đậu đũa', 6, 15000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fstringbeans-sitaw.jpg?alt=media&token=72304535-1e58-4bca-aa3b-009c54138ae4', 0, 'kg', 'Sạch, ngon, giòn, rẻ', '2020-12-01 10:41:55', '2020-12-01 10:41:55'),
(26, 'Mướp canh', 6, 15000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fmuop-huong-vang-lai-rado-235.jpg?alt=media&token=ae06dd24-6a62-4038-b581-2be04271c8d1', 0, 'kg', 'Ngon', '2020-12-01 10:42:31', '2020-12-01 10:42:31'),
(27, 'Trở về nơi hoang dã - Trang Nguyễn', 7, 70000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2FBT10.jpg?alt=media&token=a1d87226-7a2e-49cd-bd5f-582db18f29e5', 0, 'Quyển', 'Mới', '2020-12-01 10:50:59', '2020-12-01 10:50:59'),
(28, 'Con đường thoát hạn', 7, 50000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fsach-hay-ve-nong-nghiep.jpg?alt=media&token=7fce671d-9210-4131-b98b-fdd73003c835', 0, 'Quyển', 'Mới, sạch', '2020-12-01 10:52:10', '2020-12-01 10:52:10'),
(29, 'Săn sóc sự học của các con', 7, 60000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F1.jpg?alt=media&token=e6627281-a076-41da-b76b-de19b623396b', 0, 'Quyển', 'Mới', '2020-12-01 10:53:16', '2020-12-01 10:53:16'),
(30, 'Vô cùng tàn nhẫn, vô cùng yêu thương', 7, 80000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Funnamed%20(2).jpg?alt=media&token=0307db97-3cd8-48df-887c-8945d757d885', 0, 'Quyển', 'rẻ, mới', '2020-12-01 10:55:28', '2020-12-01 10:55:28'),
(31, 'Sức mạnh tình bạn', 7, 80000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fsuc-manh-tinh-ban-alan-loy-mcginnis-149176.jpg?alt=media&token=f4d2f4f8-79bd-4384-b47e-b76917dc7f0d', 0, 'Quyển', 'Mới', '2020-12-01 10:56:17', '2020-12-01 10:56:17'),
(32, 'Đắc nhân tâm', 7, 120000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Funnamed.png?alt=media&token=3a186e8a-479e-48d6-a651-c17cad2bd86a', 0, 'Quyển', 'Mới', '2020-12-01 10:57:01', '2020-12-01 10:57:01'),
(33, '10 phút tĩnh tâm, 71 thói quen cân bằng cuộc sống hiện đại', 7, 130000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F91e20d625fa3cf4071c74b6895ad4483.jpg?alt=media&token=937338f3-a214-4028-9aa1-7ad29245e3e0', 0, 'Quyển', 'Mới', '2020-12-01 10:58:05', '2020-12-01 10:58:05'),
(34, 'Làm chủ môn Toán trong 30 ngày Hình học-11', 7, 150000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Flam-chu-mon-toan-trong-30-ngay-lop-11-hinh-hoc.png?alt=media&token=768a414a-0206-4d77-b91c-6a6a13d523b4', 0, 'Quyển', 'Mới, hay', '2020-12-01 11:02:11', '2020-12-01 11:02:11'),
(35, 'Làm chủ môn Toán Trong 30 ngày Đại số-10', 7, 13000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Flam-chu-mon-toan-trong-30-dai-so-10.png?alt=media&token=a8832109-bf7f-4c17-bb60-fd5e00a0ee05', 0, 'Quyển', 'Hay', '2020-12-01 11:03:12', '2020-12-01 11:03:12'),
(36, 'Làm chủ môn Toán trong 30 ngày Giải Tích tập 12.1', 7, 13000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F45966_03_03_18_lam-chu-mon-toan-trong-30-ngay-giai-tich-12-quyen-1.png?alt=media&token=e80cebd4-975f-4974-9b60-23e46506c9be', 0, 'Quyển', 'Hay', '2020-12-01 11:08:21', '2020-12-01 11:08:21'),
(37, '270 đề & bài văn hay 8', 7, 12000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F270-de-va-bai-van-hay-lop-8-0.jpg?alt=media&token=adcd3520-638a-4067-82a5-292b06be723d', 0, 'Quyển', 'Hay', '2020-12-01 11:09:10', '2020-12-01 11:09:10'),
(38, '207 Đề và bài văn THCS 8', 7, 120000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F207-de-va-bai-van-8-0.jpg?alt=media&token=4b94d16e-46ad-4ddd-bc83-bd268e31f37a', 0, 'Quyển', 'Hay', '2020-12-01 11:10:03', '2020-12-01 11:10:03'),
(39, 'Ngữ pháp và giải thích ngữ pháp Tiếng Anh cơ bản và nâng cao', 7, 150000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Funnamed%20(3).jpg?alt=media&token=c68a8f52-d971-481c-86f9-371c42683602', 0, 'Quyển', 'Hay', '2020-12-01 11:10:57', '2020-12-01 11:10:57'),
(40, '99 Công phá Đề thi THPT Quốc Gia, Bộ đề thi mới nhất Tiếng Anh -1', 7, 200000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fcongphadethitienganhtr_1000x1487.jpg?alt=media&token=2a9337ae-5d89-48c8-8e09-90c66dec78cb', 0, 'Quyển', 'Hay', '2020-12-01 11:12:12', '2020-12-01 11:12:12'),
(41, '60 Đề thi nghe- nói - đọc - viết, Luyện thi chứng chỉ A Tiếng Anh', 7, 250000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F60-de-thi-nghe-noi-doc-viet-luyen-thi-chung-chi-a-tieng-anh.jpg?alt=media&token=2300ac9a-a1bf-4a2a-ad86-ca99527a54a6', 0, 'Quyển', 'Hay, bám sát cấu trúc', '2020-12-01 11:13:47', '2020-12-01 11:13:47'),
(42, 'Xe Vision', 8, 5000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F20dd28c7622378f82e45580004613562.jpg?alt=media&token=bd3a9b5e-558c-43a1-84b5-5bc1948df83e', 0, 'Chiếc', 'Xe đi êm, tốt', '2020-12-01 11:21:16', '2020-12-19 04:01:05'),
(43, 'Xe suzuki', 8, 100000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F3753_bang-gia-xe-may-suzuki-moi-nhat-thang-62019-motor-v-strom-1000-g-2a1219.jpg?alt=media&token=77927a23-1e5c-451f-bf78-e723cfeccde4', 0, 'Chiếc', 'Xe đi khỏe, nhanh', '2020-12-01 11:22:42', '2020-12-01 11:22:42'),
(44, 'Xe duke', 8, 200000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fdanh-gia-ktm-duke-125-2019-gia-xe-ktm-rc-1252.jpg?alt=media&token=c9effe42-ff82-4eab-bb03-f586e0106123', 0, 'Chiếc', 'xe ngon nghẻ quá', '2020-12-01 11:23:57', '2020-12-01 11:23:57'),
(45, 'SH 5i', 8, 40000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fsh%20150i.jpg?alt=media&token=b6993532-fed9-4d4c-843b-613c38b09067', 0, 'Chiếc', 'xe khỏe, đi nhanh, êm', '2020-12-17 09:42:57', '2020-12-17 09:42:57'),
(46, 'WAVE ALPHA', 8, 20000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fwave%20alpha.jpg?alt=media&token=e5f3d9bf-24fe-4470-b368-9f4716726656', 0, 'Chiếc', 'xe êm, khỏe máy', '2020-12-17 09:43:59', '2020-12-17 09:43:59'),
(47, 'Yamaha R15 V3', 8, 30000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fyamaha%20r15%20v3.jpg?alt=media&token=c7d42dfe-41d3-4473-977f-7432c49303c8', 0, 'Chiếc', 'xe đi khỏe', '2020-12-17 09:44:55', '2020-12-17 09:44:55'),
(48, 'Yamaha grande', 8, 35000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fyamaha%20grande.png?alt=media&token=2d5d88f9-a1c5-4ef0-9e9c-bd3294d8cb23', 0, 'Chiếc', 'xe đi khỏe, êm', '2020-12-17 09:45:49', '2020-12-17 09:45:49'),
(49, 'yamaha latte', 8, 40000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fyamaha%20latte.jpg?alt=media&token=02b5737b-1e62-43bf-b447-6b58d8e732a2', 0, 'Chiếc', 'Xe đi khỏe', '2020-12-17 09:46:39', '2020-12-17 09:46:39'),
(50, 'yamaha NVS 155 ABS', 8, 55000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fyamaha%20nvs%20155%20abs.jpeg?alt=media&token=d7b7834a-86dc-4755-9117-8c2976ff830b', 50000, 'Chiếc', 'xe khỏe', '2020-12-17 09:47:53', '2020-12-17 09:47:53'),
(51, 'WAVE RSX FI', 8, 35000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fhonda%20wave%20rsx%20fi.jpg?alt=media&token=f10106c5-1c8d-41de-8c1b-fca35de450e7', 10000, 'Chiếc', 'XE KHỎE, MƯỢT', '2020-12-17 09:49:35', '2020-12-17 09:49:35'),
(52, 'ipad gen 8', 9, 30000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fipad%20gen%208.png?alt=media&token=a553628c-cc99-4f72-9dde-b9a8466679e7', 0, 'Chiếc', 'máy dùng khỏe', '2020-12-17 09:52:37', '2020-12-17 09:52:37'),
(53, 'oppo neo 9', 9, 20000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Foppo%20neo%209.png?alt=media&token=a04894f5-7429-4103-8c49-d99a0970adc2', 0, 'Chiếc', 'máy tốt', '2020-12-17 09:53:53', '2020-12-17 09:53:53'),
(54, 'Iphone 12 pro max', 9, 80000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fiphone-12-pro-max-xanh_1_4.jpg?alt=media&token=1eb41f65-28aa-4060-a059-dd4e8912d795', 0, 'Chiếc', 'Máy sịn xò quá đi', '2020-12-19 03:59:16', '2020-12-19 03:59:16'),
(55, 'Vsmart joy 4', 9, 10000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fvsmart-joy-4_2_.png?alt=media&token=6ee923b8-9960-4cf0-9edf-c4e0891c57c7', 0, 'Chiếc', 'máy oki lắm', '2020-12-19 04:00:42', '2020-12-19 04:00:42'),
(56, 'Samsung s20 plus', 9, 15000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fs20-plus%20s%C3%A1mung.png?alt=media&token=30883e12-c8ca-4306-b8d4-b0ebd5340f2b', 0, 'Chiếc', 'Máy dùng miễn chê', '2020-12-19 04:03:14', '2020-12-19 04:03:14'),
(57, 'oppo A92', 9, 20000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F10045773-dien-thoai-oppo-a92-den-1_1y9q-5x.jpg?alt=media&token=0cec8355-8f00-4279-9215-9373822a737c', 0, 'Chiếc', 'Dùng ko phải lo', '2020-12-19 04:12:16', '2020-12-19 04:12:16'),
(58, 'Realme 6', 9, 10000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Frealme%206.jpg?alt=media&token=5be93ae9-c649-490b-9a2a-4b7d0c6202e7', 0, 'Chiếc', 'máy dùng tốt', '2020-12-19 04:13:46', '2020-12-19 04:13:46'),
(59, 'Đồng hồ MVW MP006', 10, 990000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2F%C4%91h%20nam.PNG?alt=media&token=ca67bc5a-3f9b-4fba-a76e-f045e5fc4d26', 0, 'Chiếc', 'Sang trọng, tinh tế', '2020-12-20 13:45:37', '2020-12-20 13:45:37'),
(60, 'Đồng hồ Nam Orient FUNG2005D0', 10, 2000000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fnam.PNG?alt=media&token=7ff72be6-0450-41c8-8c62-da22df689791', 0, 'Chiếc', 'Sang trọng, đẳng cấp, chất liệu cao cấp', '2020-12-20 13:47:57', '2020-12-20 13:47:57'),
(61, 'Đồng hồ Nam Titan 9162YL02', 10, 1680000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fsg.PNG?alt=media&token=c61d958b-51c4-4380-88f1-b9aa780f41ff', 0, 'Chiếc', 'Thiết kế tinh xảo, đặc sắc', '2020-12-20 13:49:22', '2020-12-20 13:49:22'),
(62, 'Đồng hồ Nam Mini Focus MF0052G.06', 10, 700000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fjds.PNG?alt=media&token=9c88411b-bce6-45be-bfdc-b988dae1c4e6', 0, 'Chiếc', 'Thiết kế tinh xảo, bắt mắt', '2020-12-20 13:50:50', '2020-12-20 13:50:50'),
(63, 'Đồng hồ Nam Casio AE-1300WH-8AVDF', 10, 900000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fgg.PNG?alt=media&token=cc46d61e-00fc-40a6-85af-ca1dcd8a859a', 0, 'Chiếc', 'Tinh hoa của sự sáng tạo', '2020-12-20 13:52:47', '2020-12-20 13:52:47'),
(64, 'Apple Watch S6 LTE 40mm', 10, 14300000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fhfdj.PNG?alt=media&token=31d52eb5-646d-4bb2-9b7b-9e2247b9cfbd', 0, 'Chiếc', 'Kiểu dáng năng động, cá tính', '2020-12-20 13:59:32', '2020-12-20 13:59:32'),
(65, 'Đồng hồ thông minh Huami Amazfit GTR', 10, 2600000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Ffhh.PNG?alt=media&token=d393c55d-dea9-4df2-a200-01b423916a17', 0, 'Chiếc', 'Thiết kế tinh tế, năng động', '2020-12-20 14:01:48', '2020-12-20 14:01:48'),
(66, 'Đồng hồ đôi Casio LTP-V004GL-7AUDF/MTP-V004GL-7AUDF', 10, 1240000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fhfd.PNG?alt=media&token=7cf56ac8-5daf-4393-bbb4-6a58875ea615', 0, 'Chiếc', 'thiết kế hiện đại, sáng tạo', '2020-12-20 14:07:21', '2020-12-20 14:07:21'),
(67, 'Đồng hồ đôi Casio LTP-1314L-7AVDF/MTP-1314L-7AVDF', 10, 1800000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Ffhgfjh.PNG?alt=media&token=df4514cd-ca3f-4185-891a-7c593bd1555b', 0, 'Chiếc', 'Thiết kế hiện đại, độ bền cao', '2020-12-20 14:09:30', '2020-12-20 14:09:30'),
(68, 'Pin sạc dự phòng 10.000mAh AVA DS003-WB', 11, 200000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Ffhg.PNG?alt=media&token=45e426b0-848b-441b-94cc-5efa630c8bc5', 0, 'Chiếc', 'Thiết kế nhỏ gọn, đẹp mắt, lượng pin lớn', '2020-12-20 14:15:19', '2020-12-20 14:15:19'),
(69, 'Pin sạc dự phòng 10.000mAh AVA DS003-WB', 11, 200000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Ffhg.PNG?alt=media&token=1476fc9d-2e6e-46eb-a32f-b6afdc18b13e', 0, 'Chiếc', 'Thiết kế nhỏ gọn, đẹp mắt, lượng pin lớn.', '2020-12-20 14:16:49', '2020-12-20 14:16:49'),
(70, 'Pin sạc dự phòng 10.000mAh AVA DS003-WB', 11, 200000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Ffhg.PNG?alt=media&token=f4b6af59-9b99-4256-91c2-e50729eba27a', 0, 'Chiếc', 'Thiết kế nhỏ gọn, đẹp mắt', '2020-12-20 14:17:04', '2020-12-20 14:17:04'),
(71, 'Pin sạc dự phòng Polymer 10.000mAh Lightning eValu PJ JP189SL', 11, 455000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Ffhd.PNG?alt=media&token=cb4a2630-ada2-4e1b-a8f4-63b17c12c068', 0, 'Chiếc', 'Thiết kệ mỏng nhẹ, tiện mang đi', '2020-12-20 14:18:48', '2020-12-20 14:18:48'),
(72, 'Tai nghe Bluetooth True Wireless Mozard TS13', 11, 480000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Ffdnm.PNG?alt=media&token=9361c52b-7a96-4ddd-bf66-babc9588f287', 0, 'Chiếc', 'Thiết kế nhỏ gọn, sang trọng, đeo dễ chịu', '2020-12-20 14:49:15', '2020-12-20 14:49:15'),
(73, 'Tai nghe Bluetooth True Wireless Mozard DT920', 11, 665000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fjdj.PNG?alt=media&token=72d646a0-248f-45e3-8c6d-44bb4e7f9a39', 0, 'Chiếc', 'Thiết kế nhỏ gọn, màu đen sang trọng', '2020-12-20 14:53:51', '2020-12-20 14:53:51'),
(74, 'Tai nghe Bluetooth True Wireless Mozard AT5', 11, 665000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fdndfkj.PNG?alt=media&token=c3d62e24-9c0f-4852-ac3e-fcdde65ead18', 0, 'Chiếc', 'Thiết kế tiện dụng, thoải mái khi đeo tai nghe và không dễ rơi.', '2020-12-20 14:56:10', '2020-12-20 14:56:10'),
(75, 'Loa vi tính 2.1 Enkor S2880', 11, 1317000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fdfkjk.PNG?alt=media&token=c44df826-c3c6-419f-a104-7e03202cf31d', 0, 'Chiếc', 'Thiết kế nhỏ gọn, dạng vân gỗ đẹp mắt, với bộ 3 loa: 1 loa siêu trầm và 2 loa vệ tinh', '2020-12-20 14:58:10', '2020-12-20 14:58:10'),
(76, 'Loa vi tính Fenda R26BT', 11, 930000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fkdm.PNG?alt=media&token=20b2cb3a-7785-4e28-84ee-7ec7a5d72d26', 0, 'Chiếc', 'Thiết kế giả gỗ sang trọng, đẹp mắt', '2020-12-20 14:59:25', '2020-12-20 14:59:25'),
(77, 'Camera IP 1080P Xiaomi Mi Home Basic ZRM4037US', 11, 900000, 'https://firebasestorage.googleapis.com/v0/b/projectandroid-8d413.appspot.com/o/product%2Fdfmsd.PNG?alt=media&token=e1e82fd1-bacc-42f1-a20c-2eea8190ad28', 0, 'Chiếc', 'Thiết kế đơn giản, tinh tế. Dễ dàng lắp đặt và sử dụng trong nhà', '2020-12-20 15:01:43', '2020-12-20 15:01:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vegetables`
--

CREATE TABLE `vegetables` (
  `product_id` varchar(255) DEFAULT NULL,
  `attribute_id` varchar(255) NOT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `vegetables`
--

INSERT INTO `vegetables` (`product_id`, `attribute_id`, `weight`, `created_at`, `updated_at`) VALUES
('23', '274ca4ea-2478-495a-9003-6572f26bd0a8', '15', '2020-12-01 10:40:24', '2020-12-01 10:40:24'),
('18', '456d9620-ceae-4f67-897c-44f4c77aa2a7', '10', '2020-12-01 10:31:08', '2020-12-01 10:31:08'),
('19', '6d6c8bd6-20f9-44e9-aa0d-57ece85b2354', '20', '2020-12-01 10:32:39', '2020-12-01 10:32:39'),
('22', '6ddff4f6-5636-41e5-aff4-aa1844414740', '15', '2020-12-01 10:39:42', '2020-12-01 10:39:42'),
('25', '77729b9e-5ec5-4cd1-80ad-46f989e563d0', '15', '2020-12-01 10:41:55', '2020-12-01 10:41:55'),
('17', '7b614658-b322-4d90-9e58-0de830960396', '15', '2020-12-01 10:30:16', '2020-12-01 10:30:16'),
('20', '7c398eb4-955a-457d-bf5f-c8fc73ef2f61', '15', '2020-12-01 10:33:26', '2020-12-01 10:33:26'),
('21', '7d2fb558-0d98-4f94-9ce1-642f4040437a', '10', '2020-12-01 10:34:13', '2020-12-01 10:34:13'),
('16', '82a78470-24ff-4401-a69b-2e92b4931825', '10', '2020-12-01 10:29:32', '2020-12-01 10:29:32'),
('14', 'a8296d8c-abfb-46e5-8678-9502ba641d12', '15', '2020-12-01 10:27:20', '2020-12-01 10:27:20'),
('26', 'b2184105-c24d-4ce5-bcec-09ceb284dd64', '10', '2020-12-01 10:42:31', '2020-12-01 10:42:31'),
('24', 'bb3d5fbb-582f-4da5-9bb5-84507a36b382', '10', '2020-12-01 10:41:09', '2020-12-01 10:41:09'),
('15', 'c788ad9c-3d41-42e8-b2b5-8c9214b7770f', '10', '2020-12-01 10:28:42', '2020-12-01 10:28:42');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `clock`
--
ALTER TABLE `clock`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Chỉ mục cho bảng `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `fruit`
--
ALTER TABLE `fruit`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `motorbike`
--
ALTER TABLE `motorbike`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `vegetables`
--
ALTER TABLE `vegetables`
  ADD PRIMARY KEY (`attribute_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
