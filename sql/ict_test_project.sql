-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 27 Haz 2022, 17:37:01
-- Sunucu sürümü: 10.4.22-MariaDB
-- PHP Sürümü: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `ict_test_project`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `car_brands`
--

CREATE TABLE `car_brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `car_brands`
--

INSERT INTO `car_brands` (`brand_id`, `brand_name`, `status`) VALUES
(2, 'ALFA ROMEO', 1),
(3, 'AUDI', 1),
(4, 'BMW', 1),
(5, 'CITROËN', 1),
(6, 'DACIA', 1),
(7, 'FORD', 1),
(8, 'HYUNDAI', 1),
(9, 'MERCEDES-BENZ', 1),
(10, 'RENAULT', 1),
(11, 'VOLVO', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `car_models`
--

CREATE TABLE `car_models` (
  `model_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `segment` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `model_name` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `car_models`
--

INSERT INTO `car_models` (`model_id`, `brand_id`, `segment`, `model_name`, `status`) VALUES
(2, 2, 'B', '145', 1),
(3, 2, 'B', '146', 1),
(4, 2, 'B', '147', 1),
(5, 2, 'D', 'GIULIA', 1),
(6, 3, 'C', 'A1', 1),
(7, 3, 'C', 'A2', 1),
(8, 3, 'C', 'A3', 1),
(9, 3, 'D', 'A4', 1),
(10, 3, 'D', 'A5', 1),
(11, 3, 'D', 'A6', 1),
(12, 4, 'C', '1', 1),
(13, 4, 'C', '2', 1),
(14, 4, 'D', '3', 1),
(15, 4, 'D', '4', 1),
(16, 4, 'D', '5', 1),
(17, 5, 'B', 'C-ELYSEE', 1),
(18, 5, 'B', 'C1', 1),
(19, 5, 'B', 'C2', 1),
(20, 5, 'B', 'C3', 1),
(21, 5, 'C', 'C4', 1),
(22, 5, 'D', 'C5', 1),
(23, 6, 'B', 'DOKKER', 1),
(24, 6, 'B', 'DUSTER', 1),
(25, 6, 'B', 'LOGAN', 1),
(26, 7, 'B', 'ACTIVA', 1),
(27, 7, 'B', 'C-MAX', 1),
(28, 7, 'B', 'ESCORT', 1),
(29, 7, 'B', 'FIESTA', 1),
(30, 8, 'B', 'ACCENT', 1),
(31, 8, 'C', 'ELANTRA', 1),
(32, 9, 'C', 'A-SERISI', 1),
(33, 9, 'C', 'B-SERISI', 1),
(34, 9, 'C', 'C-SERISI', 1),
(35, 9, 'D', 'E-SERISI', 1),
(36, 10, 'B', 'CLIO', 1),
(37, 10, 'B', 'KANGOO', 1),
(38, 11, 'C', 'S40', 1),
(40, 11, 'C', 'S60', 1),
(41, 11, 'D', 'V40', 1),
(42, 11, 'D', 'V60', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `customer_name_en` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `customer_phone` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `customer_email` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `customer_address` varchar(1000) COLLATE utf8_turkish_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_name_en`, `customer_phone`, `customer_email`, `customer_address`, `status`) VALUES
(1, 'Sergen Cuğ', 'sergen cug', NULL, NULL, NULL, 1),
(2, 'sergen', 'sergen', NULL, NULL, NULL, 1),
(3, 'test', 'test', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
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
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `registration_date` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `registration_date`, `status`) VALUES
(1, 'Bosch Car', '2022-06-27 10:22:00', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `service_history`
--

CREATE TABLE `service_history` (
  `history_id` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `car_brand` int(11) NOT NULL,
  `car_model` int(11) NOT NULL,
  `service_place` int(11) NOT NULL,
  `service_type` int(11) NOT NULL,
  `service_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `history_registration_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `service_history`
--

INSERT INTO `service_history` (`history_id`, `customer`, `service_id`, `car_brand`, `car_model`, `service_place`, `service_type`, `service_date`, `history_registration_date`) VALUES
(1, 1, 1, 2, 2, 1, 2, '2022-06-27 01:30:00', '2022-06-27 14:40:32'),
(2, 1, 1, 3, 3, 2, 4, '2022-06-27 01:30:00', '2022-06-27 14:40:32'),
(3, 2, 1, 8, 8, 3, 8, '2022-06-27 01:30:00', '2022-06-27 14:40:32'),
(4, 3, 1, 4, 4, 2, 3, '2022-06-27 01:30:00', '2022-06-27 14:40:32'),
(5, 3, 1, 6, 6, 3, 7, '2022-06-27 01:30:00', '2022-06-27 14:40:32'),
(6, 2, 1, 3, 3, 1, 6, '2022-06-27 01:30:00', '2022-06-27 14:40:32'),
(7, 2, 1, 9, 9, 1, 6, '2022-06-27 01:30:00', '2022-06-27 14:40:32'),
(8, 2, 1, 9, 9, 2, 5, '2022-06-27 01:30:00', '2022-06-27 14:40:32'),
(9, 2, 1, 5, 5, 3, 9, '2022-06-27 01:30:00', '2022-06-27 14:40:32'),
(11, 2, 1, 5, 5, 3, 9, '2022-05-27 01:30:00', '2022-06-27 14:40:32');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `service_repair_places`
--

CREATE TABLE `service_repair_places` (
  `place_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `place_name` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `place_capacity` int(11) NOT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `service_repair_places`
--

INSERT INTO `service_repair_places` (`place_id`, `service_id`, `place_name`, `place_capacity`, `status`) VALUES
(1, 1, 'Ataşehir', 100, 1),
(2, 1, 'Maltepe', 150, 1),
(3, 1, 'Kadıköy', 250, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `service_repair_types`
--

CREATE TABLE `service_repair_types` (
  `type_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `type_name` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `service_repair_types`
--

INSERT INTO `service_repair_types` (`type_id`, `place_id`, `type_name`, `status`) VALUES
(1, 1, 'Oto Kuaför', 1),
(2, 1, 'Oto Elektrik', 1),
(3, 2, 'Oto Boya', 1),
(4, 2, 'Oto Kaporta', 1),
(5, 2, 'Oto Tamir', 1),
(6, 1, 'Oto Tamir', 1),
(7, 3, 'Oto Elektrik', 1),
(8, 3, 'Oto Kaporta', 1),
(9, 3, 'Oto Tamir', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
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

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `car_brands`
--
ALTER TABLE `car_brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Tablo için indeksler `car_models`
--
ALTER TABLE `car_models`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `car_brands` (`brand_id`);

--
-- Tablo için indeksler `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_name` (`customer_name`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Tablo için indeksler `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Tablo için indeksler `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `service_name` (`service_name`);

--
-- Tablo için indeksler `service_history`
--
ALTER TABLE `service_history`
  ADD PRIMARY KEY (`history_id`);

--
-- Tablo için indeksler `service_repair_places`
--
ALTER TABLE `service_repair_places`
  ADD PRIMARY KEY (`place_id`);

--
-- Tablo için indeksler `service_repair_types`
--
ALTER TABLE `service_repair_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `car_brands`
--
ALTER TABLE `car_brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `car_models`
--
ALTER TABLE `car_models`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Tablo için AUTO_INCREMENT değeri `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `service_history`
--
ALTER TABLE `service_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `service_repair_places`
--
ALTER TABLE `service_repair_places`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `service_repair_types`
--
ALTER TABLE `service_repair_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `car_models`
--
ALTER TABLE `car_models`
  ADD CONSTRAINT `car_brands` FOREIGN KEY (`brand_id`) REFERENCES `car_brands` (`brand_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
