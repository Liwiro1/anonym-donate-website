-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 02 Şub 2024, 14:36:31
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `e_donate`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `comment` varchar(10000) DEFAULT NULL,
  `comment_owner_id` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `contact_us`
--

INSERT INTO `contact_us` (`id`, `user_id`, `message`, `time`) VALUES
(1, 4, 'Merhaba Siteniz Çok güzel Olmuş', '2022-11-26 12:24:16'),
(2, 4, 'Çok Güzel Site', '2022-11-26 12:25:22'),
(3, 4, 'deneme mesaj', '2024-02-02 13:02:15');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `order_status` varchar(200) NOT NULL DEFAULT 'Satıcı Onayı Bekleniyor.',
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `quantity`, `total_price`, `order_status`, `time`) VALUES
(1, 4, 1, 5, 18500, 'Alıcıya Ulaştırıldı', '2024-02-02 13:18:52'),
(2, 4, 2, 1, 1250, 'Onaylandı', '2024-02-02 13:22:14');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `detail` varchar(2000) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `categorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `product_name`, `detail`, `price`, `img_url`, `categorie`) VALUES
(1, 'Amd Ryzen Threadrıpper Pro 3975Wx', 'SOKET TİPİ : WRX8<br>\r\nİŞLEMCİ AİLESİ : AMD Ryzen™ Threadripper™ PRO<br>\r\nİŞLEMCİ MODELİ : 3975WX<br>\r\nÖN BELLEK : Toplam L1 Ön Bellek : 2MB Toplam L2<br>\r\nÖn Bellek : 16MB Toplam L3 Ön Bellek : 128MB<br>\r\nİŞLEMCİ HIZI : 3.5GHz<br>\r\nTURBO BOOST : Up to 4.2GHz<br>\r\nÇEKİRDEK SAYISI : 32<br>\r\nİŞLEM SAYISI : 64<br>\r\nENTEGRE GRAFİK : Yok<br>\r\nSOĞUTUCU : Yok<br>\r\nGÜÇ TÜKETİMİ : 280W<br>', 3700, 'images/processor/amdsWRX8.jpg', 'processor'),
(2, 'Intel Core i9-12900F', 'Intel Core i9-12900F 2.4GHz 30MB 1700P 12.nesil Tray Işlemci - Fansız', 1250, 'images/processor/12900.jpg', 'processor'),
(3, 'Amd Ryzen 9 7950X', 'AMD RYZEN 9 7950X 4.50GHZ 80MB AM5 BOX', 1000, 'images/processor/7950x.jpg', 'processor'),
(4, 'Intel Core I9 10940X', 'Çekirdek sayısı: 14<br>\r\nİş Parçacığı Sayısı: 28<br>\r\nMaks Turbo Frekansı 4,60 GHz<br>\r\nIntel® Turbo Boost Max Teknolojisi 3.0 Frekansı 4,80 GHz<br>\r\nİşlemci Temel Frekansı 3,30 GHz<br>\r\nÖnbellek 19,25 MB Intel® Smart Cache<br>\r\nMaksimum Bellek Boyutu (bellek türüne bağlıdır): 256 GB', 1000, 'images/processor/i9x.jpg', 'processor'),
(5, 'Intel Xeon Silver 4110', 'Çekirdek sayısı: 8\r\nİş Parçacığı Sayısı: 16\r\nMaks Turbo Frekansı: 3,00 GHz\r\nİşlemci Temel Frekansı: 2,10 GHz\r\nÖnbellek: 11 MB L3 Cache\r\nUPI Bağlantısı Sayısı: 2\r\nTDP: 85W', 750, 'images/processor/xeon.jpg', 'processor'),
(6, 'Pny Nvıdıa Quadro Rtx 6000', 'PNY NVIDIA Quadro RTX 6000 24GB GDDR6 384Bit', 5800, 'images/graphic/rtx6000.jpg', 'graphic'),
(7, 'GIGABYTE RTX 4090 GAMING', 'GIGABYTE RTX 4090 GAMING OC 24GB GDDR6X 384 Bit RGB LED Nvidia Ekran Kartı', 3000, 'images/graphic/4090.jpg', 'graphic'),
(8, 'MSI GeForce RTX 3090 Ti Gaming X Trio', 'GEFORCE RTX 3090 TI GAMING X TRIO 24G', 2600, 'images/graphic/3090ti.jpg', 'graphic'),
(9, 'Gigabyte Aorus Xtreme Waterforce GeForce RTX 3080', 'Gigabyte Aorus Xtreme Waterforce GeForce RTX 3080 10GB 320Bit GDDR6X PCI-Express 4.0 Ekran Kartı', 1800, 'images/graphic/3080.jpg', 'graphic'),
(10, 'MSI VGA Radeon RX 6950 XT Gaming x Trio', 'RADEON RX 6950 XT GAMING X TRIO 16G', 2150, 'images/graphic/6950.jpg', 'graphic'),
(11, 'MSI Meg X670E Ace', 'MSI Meg X670E Ace Am5 Ddr5 4x M.2 USB 3.2 10G Lan Amd Wıfı 6e Rgb Eatx', 1150, 'images/motherboard/x670e.jpg', 'motherboard'),
(12, 'Asus ROG Maximus XIII Extreme', '18+2 güç aşaması, beş adet M.2 slotu, USB 3.2 Gen 2x2 ön panel bağlantısı, USB 3.2 Gen 2 ön panel bağlantısı, çift Thunderbolt™ 4, Marvell® AQtion 10 Gb Ethernet, Intel® 2.5 Gb Ethernet, PCIe® 4.0, yerleşik WiFi 6E (802.11ax) ve Aura Sync RGB aydınlatma özelliklerine sahip Intel® Z590 EATX anakart', 1075, 'images/motherboard/maximus.jpg', 'motherboard'),
(13, 'Asus WS C422', 'Asus WS C422 Sage/10G Intel C422 DDR4 2933 MHz Lga2066 CEB Anakart', 1000, 'images/motherboard/c422.jpg', 'motherboard'),
(14, 'Asus Pro WS X299 Sage II', 'Asus Pro WS X299 SAGE II Intel X299 2066 DDR4 4266 MHz CEB Anakart', 980, 'images/motherboard/x299.jpg', 'motherboard'),
(15, 'ASUS ROG STRIX Z690', 'ASUS ROG STRIX Z690 Intel 6600MHz DDR5 LGA1700 ATX Anakart ROG MAXIMUS Z690 APEX', 900, 'images/motherboard/z690.jpg', 'motherboard'),
(16, 'Gıgabyte Aorus Gen4 2tb', 'Gıgabyte Aorus Gen4 2tb Pcı-Express 4.0x4, Nvme 1.3 5000/4400 SSD GP-ASM2NE6200TTTD Bakır Soğutma', 570, 'images/ssd/aorus.jpg', 'ssd'),
(17, 'Corsair 128GB(4x32GB)', 'Corsair 128GB(4x32GB) 3200MHz DDR4 Ram CMW128GX4M4Z3200C16', 1350, 'images/ram/cor128.jpg', 'ram'),
(18, 'G.Skill Trident Z5 Rgb', 'G.Skill Trident Z5 Rgb Siyah Ddr5 6000MHZ CL36 32GB (2X16GB) Dual (36-36-36-76) 1.3V (F5-6000U3636E16GX2-TZ5RK) Ram', 1150, 'images/ram/tridentz5.jpg', 'ram'),
(19, 'Corsair 32GB(2x16GB)', 'Corsair CMT32GX5M2X6200C36 32GB (2X16GB) DDR5 Dram 6200MHZ C36 Platınum Rgb Domınator Black Lpx Sogutuculu Bellek', 300, 'images/ram/dominator.jpg', 'ram'),
(20, 'HP 64 GB SUNUCU RAM', 'HP 64 GB 2933 Mhz DDR4 Sunucu RAM Bellek P00930-B21', 1000, 'images/ram/serverram.jpg', 'ram'),
(21, 'Gskill Trident Z Royal Gold Rgb', 'Gskıll Trident Z Royal Gold Rgb DDR4-3600MHZ CL18 64GB (2X32GB) Dual (18-22-22-42) 1.35V Ram F4-3600C18D-64GTRG', 1075, 'images/ram/tridentz.jpg', 'ram'),
(22, 'Lenovo 3.84TB Thinksystem De Series', 'Lenovo 3.84TB 4XB7A14173 Thınksystem De Serıes 1dwd 2.5in SSD 2U24', 2500, 'images/ssd/lenovossd.jpg', 'ssd'),
(23, 'Kingston Fury Renegade', 'Kingston Fury Renegade 7300MB/S - 7000MB/S SFYRS/4000G Pcıe 4.0 Nvme M.2 SSD', 750, 'images/ssd/kingfury.jpg', 'ssd'),
(24, 'Wd Black SN850', 'Wd Black SN850 WDS200T1XHE 2tb Pcıe 4.0 Nvme Sogutuculu M.2 2280 SSD', 790, 'images/ssd/wdblack.jpg', 'ssd'),
(25, 'Samsung 870 QVO 8TB', 'Samsung 870 QVO 8TB 560MB-530MB/s Sata 3 SSD (MZ-77Q8T0BW)', 750, 'images/ssd/samsung.jpg', 'ssd');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sss`
--

CREATE TABLE `sss` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `sss`
--

INSERT INTO `sss` (`id`, `title`, `description`) VALUES
(9, 'Neden Monero(XMR)?', 'Monero(XMR) tamamen anonim bir transfer ağına sahip olduğu için tercih edilmiştir.'),
(10, 'Site Yöneticisi Kimdir?', 'Yusuf Türken\'dir. Kendisi Bilecik Şeyh Edebali Üniversitesi Bilgisayar Mühendisliği 3.Sınıf Öğrencisidir.'),
(11, 'Yusuf Türken hangi alanda kendini geliştirmektedir?', 'Daha çok kendisini Full Stack Web Development ve Cloud Computing üzerine geliştirmektedir.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `wallet` varchar(100) DEFAULT 'Size Özel XMR Cüzdan Numarası 12 saat içinde tanımlanacaktır!',
  `balance` float NOT NULL DEFAULT 0,
  `user_type` varchar(50) NOT NULL DEFAULT 'user',
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `wallet`, `balance`, `user_type`, `time`) VALUES
(2, 'yusuftrken@gmail.com', 'Liwirov1', 'ef4ce77f8320ccccddd1a7863c195275', 'Size Özel XMR Cüzdan Numarası 12 saat içinde tanımlanacaktır!', 0, 'user', '2022-11-25 10:33:52'),
(3, 'asdfasdf@gmail.com', 'yusuf11', 'ef4ce77f8320ccccddd1a7863c195275', 'Size Özel XMR Cüzdan Numarası 12 saat içinde tanımlanacaktır!', 0, 'user', '2022-11-25 10:38:16'),
(4, 'yusuftrken@gmail.com', 'liwiro', 'ef4ce77f8320ccccddd1a7863c195275', 'Size Özel XMR Cüzdan Numarası 12 saat içinde tanımlanacaktır!', 9867.49, 'admin', '2024-02-02 13:18:58'),
(5, 'asdfafsd@gmail.com', 'liwirodeneme', 'ef4ce77f8320ccccddd1a7863c195275', 'Size Özel XMR Cüzdan Numarası 12 saat içinde tanımlanacaktır!', 0, 'user', '2024-02-02 12:44:59'),
(6, 'Pehlivaaan@gmail.com', 'Pehlivan', 'f1397607ecb24f42078b25785a09e308', 'Size Özel XMR Cüzdan Numarası 12 saat içinde tanımlanacaktır!', 0, 'user', '2024-02-02 13:12:47');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `xmr`
--

CREATE TABLE `xmr` (
  `id` int(11) NOT NULL,
  `xmr` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `xmr`
--

INSERT INTO `xmr` (`id`, `xmr`) VALUES
(1, 150.17);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `xmr_request`
--

CREATE TABLE `xmr_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `xmr_adres` varchar(100) NOT NULL,
  `xmr_tutar` double NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `islem_durumu` varchar(1000) NOT NULL DEFAULT 'Çekim isteği gönderildi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sss`
--
ALTER TABLE `sss`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`username`);

--
-- Tablo için indeksler `xmr`
--
ALTER TABLE `xmr`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `xmr_request`
--
ALTER TABLE `xmr_request`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Tablo için AUTO_INCREMENT değeri `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Tablo için AUTO_INCREMENT değeri `sss`
--
ALTER TABLE `sss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `xmr`
--
ALTER TABLE `xmr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `xmr_request`
--
ALTER TABLE `xmr_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
