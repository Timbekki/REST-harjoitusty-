-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20.12.2023 klo 20:37
-- Palvelimen versio: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `r13autokauppa`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `pw` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Vedos taulusta `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `username`, `pw`) VALUES
(1, 'Baby', 'Simpson', 'baby', '$2b$10$vTqnEHTpdVAlq4X2ckLiAOR3wCCx5bnCJf/05.B1qfHsSEViT67Hy'),
(2, 'Bart', 'Simpson', 'bart', '$2b$10$rCrp7gl65afWi/ks1kiXJuwSY.nqLem9OLvmnpp27M73pzPEbHiJa'),
(3, 'Homer', 'Simpson', 'homer', '$2b$10$zeZRehkZ2e/wXbyZgvISluZ5iW2qZhknDVwG1vo3phsptAZw3D.sO'),
(4, 'Lisa', 'Simpson', 'lisa', '$2b$10$wLE2iHfOVT..PkAaw.jm1uGwkyhDFMRLSXq7VuFge4P21udijJcBi'),
(5, 'Marge', 'Simpson', 'marge', '$2b$10$r6/WFt1pACtgCXTppl0C5uPbBjLkY6P4J6MI2MJlLr71Ow/ejZ.si');

-- --------------------------------------------------------

--
-- Rakenne taululle `customer_order`
--

CREATE TABLE `customer_order` (
  `id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `nickname` varchar(255) DEFAULT NULL,
  `feedback_text` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Vedos taulusta `feedback`
--

INSERT INTO `feedback` (`id`, `nickname`, `feedback_text`) VALUES
(1, 'HomerSimpson', 'Kiitos hyvästä palvelusta!'),
(2, 'Marge', 'Kiitos hyvistä kaupoista!'),
(3, 'Pekka Pouta', 'Aurinkoinen kauppahetki sateen keskellä! '),
(4, 'Pipsa Possu', 'Röh röh saatiin ostettua hieno uusi auto! '),
(5, 'Baby Simpson', 'Tympeitä myyjiä. ');

-- --------------------------------------------------------

--
-- Rakenne taululle `order_line`
--

CREATE TABLE `order_line` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `product`
--

CREATE TABLE `product` (
  `id` smallint(6) NOT NULL,
  `merkki` varchar(255) NOT NULL,
  `malli` varchar(255) NOT NULL,
  `korimalli` varchar(12) NOT NULL,
  `hinta` decimal(10,2) NOT NULL,
  `kayttovoima` varchar(12) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `vari` varchar(24) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vedos taulusta `product`
--

INSERT INTO `product` (`id`, `merkki`, `malli`, `korimalli`, `hinta`, `kayttovoima`, `image_url`, `vari`) VALUES
(1, 'Audi', 'A6 Sedan 50 TFSI e', 'Sedan', 63990.00, 'Hybridi', 'https://www.audi.fi/dam/nemo/fi/kuvia/2023/leadoo/730x730_a6_sedan_tfsie_leadoo.jpg?imwidth=730', 'Hopea'),
(2, 'Audi', 'Q8 SUV 50 e-tron', 'Farmari', 76990.00, 'Sähkö', 'https://www.audi.fi/dam/nemo/models/q8/q8-tfsi-e/my-2021/1920x1920-mtc-xl-1-1/1920x1920-audi-q8-tfsi-e-my2021-1444.jpg?imwidth=1920', 'Hopea'),
(3, 'Audi', 'Q5 50 TFSI e quattro', 'Farmari', 61995.00, 'Hybridi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2-RUMy5iIrpVN6QymxAN-QsaMS2cIfF2wnJpDm2-vXAzDNYDLek2W5lLfJ1tGW2LxsXI&usqp=CAU', 'Punainen'),
(4, 'BMW', 'i7 M70 xDrive', 'Sedan', 175820.00, 'Sähkö', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnVGO6V6fE1-YmdX0AUKNdh0xPST59Uc4jkm9xbMFQ2LGyAMtMybKepNJDkvQkaciZHbM&usqp=CAU', 'Sininen'),
(5, 'BMW', 'M3 Touring', 'Farmari', 153699.00, 'Bensiini', 'https://cdn.bmwblog.com/wp-content/uploads/2020/09/2025-bmw-m3-touring-renderings-12.jpg', 'Punainen'),
(6, 'BMW', '520d xDrive', 'Sedan', 65162.00, 'Diesel', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFn_K7ZQP5TyKPJ1d30UJQz7Z4S_tQS_dD4FmM1e4vm7A6BLYL-bJYjxHpjtRMr9ZMMZ4&usqp=CAU', 'Musta'),
(7, 'Mercedes-Benz', 'C 300 e 4MATIC', 'Sedan', 87158.00, 'Hybridi', 'https://veho.studio.crasman.cloud/pub/system/files/new-vehicles/100/1000293602/65733284eb4d71_1000293602.jpg?c=system_x1080', 'Hopea'),
(8, 'Mercedes-Benz', 'CLA 200 d 4MATIC A Shooting Brake', 'Farmari', 49043.00, 'Diesel', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnMYhWjUi4y9CWwmjbMnMxSHeu7FbyQXcFvFgM_CFyK0H274H63YV4SomPoL5T6sKkRwo&usqp=CAU', 'Punainen'),
(9, 'Mercedes-Benz', '300 e pitkä A3', 'Pakettiauto', 98200.00, 'Sähkö', 'https://images.netdirector.co.uk/gforces-auto/image/upload/w_554,h_369,q_auto,c_fill,f_auto,fl_lossy/auto-client/604634bd14145c6e9cc9fd1a985bbdc1/5627761_vans507795.jpg', 'Hopea'),
(10, 'Audi', 'A3 Sedan 30 TFSI MHEV Progress', 'Sedan', 33989.00, 'Bensiini', 'https://www.audi.fi/dam/nemo/fi/kuvia/2023/leadoo/730x730_rs3_sedan_leadoo.jpg?imwidth=730', 'Hopea');

-- --------------------------------------------------------

--
-- Rakenne taululle `toiveet`
--

CREATE TABLE `toiveet` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `carDescription` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `toiveet`
--

INSERT INTO `toiveet` (`id`, `name`, `phoneNumber`, `carDescription`, `createdAt`) VALUES
(2, 'Pertti', '04041131311', 'Audi A3 Sedan 30 TFSI MHEV Progress', '2023-12-20 19:34:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`merkki`(250));

--
-- Indexes for table `toiveet`
--
ALTER TABLE `toiveet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `toiveet`
--
ALTER TABLE `toiveet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
