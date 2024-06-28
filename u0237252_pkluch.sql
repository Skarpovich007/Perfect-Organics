-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 06 2024 г., 21:14
-- Версия сервера: 5.7.27-30
-- Версия PHP: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `u0237252_pkluch`
--

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_auth_assignment`
--

CREATE TABLE `tbl_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `tbl_auth_assignment`
--

INSERT INTO `tbl_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('partner', 3, 1695911741),
('super_admin', 130, 1695909242),
('super_admin', 133, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_auth_item`
--

CREATE TABLE `tbl_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `tbl_auth_item`
--

INSERT INTO `tbl_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'Administrator', NULL, NULL, 1695909240, 1695909240),
('editor', 1, 'Editor', NULL, NULL, 1695909240, 1695909240),
('maintenanceView', 2, 'View a site in maintenance mode', NULL, NULL, 1695909240, 1695909240),
('manager', 1, 'FileStateForm', NULL, NULL, 1695909240, 1695909240),
('managerComments', 2, 'Access to Comments management', NULL, NULL, 1695909240, 1695909240),
('managerConfig', 2, 'Access to the config site', NULL, NULL, 1695909240, 1695909240),
('managerMaintenance', 2, 'Access to Maintenance management', NULL, NULL, 1695909240, 1695909240),
('managerPosts', 2, 'Access to Posts management', NULL, NULL, 1695909240, 1695909240),
('managerRbac', 2, 'Access to RBAC management', NULL, NULL, 1695909240, 1695909240),
('managerUsers', 2, 'Access to Users management', NULL, NULL, 1695909240, 1695909240),
('partner', 1, 'Partner', NULL, NULL, 1695910942, 1695910942),
('super_admin', 1, 'Super Administrator', NULL, NULL, 1695909240, 1695909240),
('updateOwnPost', 2, 'Editing your own post', 'isAuthor', NULL, 1695909241, 1695909241),
('user', 1, 'User', NULL, NULL, 1695909240, 1695909240),
('viewAdminPage', 2, 'Access to the admin area', NULL, NULL, 1695909240, 1695909240);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_auth_item_child`
--

CREATE TABLE `tbl_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `tbl_auth_item_child`
--

INSERT INTO `tbl_auth_item_child` (`parent`, `child`) VALUES
('super_admin', 'admin'),
('manager', 'editor'),
('admin', 'maintenanceView'),
('super_admin', 'maintenanceView'),
('admin', 'manager'),
('admin', 'managerComments'),
('super_admin', 'managerComments'),
('super_admin', 'managerConfig'),
('admin', 'managerMaintenance'),
('super_admin', 'managerMaintenance'),
('admin', 'managerPosts'),
('manager', 'managerPosts'),
('super_admin', 'managerPosts'),
('super_admin', 'managerRbac'),
('admin', 'managerUsers'),
('super_admin', 'managerUsers'),
('editor', 'updateOwnPost'),
('editor', 'user'),
('admin', 'viewAdminPage'),
('editor', 'viewAdminPage'),
('manager', 'viewAdminPage'),
('super_admin', 'viewAdminPage');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_auth_rule`
--

CREATE TABLE `tbl_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `tbl_auth_rule`
--

INSERT INTO `tbl_auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('isAuthor', 0x4f3a33343a226d6f64756c65735c726261635c636f6d706f6e656e74735c417574686f7252756c65223a333a7b733a343a226e616d65223b733a383a226973417574686f72223b733a393a22637265617465644174223b693a313639353930393234303b733a393a22757064617465644174223b693a313639353930393234303b7d, 1695909240, 1695909240);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_catalog_category`
--

CREATE TABLE `tbl_catalog_category` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `lft` int(11) NOT NULL COMMENT 'L.Key',
  `rgt` int(11) NOT NULL COMMENT 'R.Key',
  `depth` int(11) NOT NULL COMMENT 'Depth',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Alias',
  `description` text COLLATE utf8_unicode_ci COMMENT 'Description',
  `created_at` int(11) NOT NULL COMMENT 'Created',
  `updated_at` int(11) NOT NULL COMMENT 'Updated',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Status',
  `meta_description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Meta-description',
  `meta_keywords` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Meta-keywords'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_catalog_order`
--

CREATE TABLE `tbl_catalog_order` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'First Name',
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Last Name',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Phone',
  `address` int(11) DEFAULT NULL COMMENT 'Address',
  `status` smallint(2) DEFAULT '0' COMMENT 'Status',
  `created_at` int(11) NOT NULL COMMENT 'Created',
  `updated_at` int(11) NOT NULL COMMENT 'Updated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_catalog_order_product`
--

CREATE TABLE `tbl_catalog_order_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL COMMENT 'Product',
  `order_id` int(11) NOT NULL COMMENT 'Order',
  `count` int(11) DEFAULT '1' COMMENT 'Count',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Price',
  `created_at` int(11) NOT NULL COMMENT 'Created',
  `updated_at` int(11) NOT NULL COMMENT 'Updated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_catalog_product`
--

CREATE TABLE `tbl_catalog_product` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Code',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Alias',
  `availability` int(11) DEFAULT '0' COMMENT 'Availability',
  `retail` decimal(10,2) DEFAULT NULL COMMENT 'Retail',
  `description` text COLLATE utf8_unicode_ci COMMENT 'Description',
  `category_id` int(11) NOT NULL COMMENT 'Category',
  `position` int(11) DEFAULT '0' COMMENT 'Position',
  `created_at` int(11) NOT NULL COMMENT 'Created',
  `updated_at` int(11) NOT NULL COMMENT 'Updated',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Status',
  `meta_description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Meta-description',
  `meta_keywords` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Meta-keywords'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_catalog_product_image`
--

CREATE TABLE `tbl_catalog_product_image` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `product_id` int(11) NOT NULL COMMENT 'Product',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Image',
  `position` int(11) DEFAULT '0' COMMENT 'Position',
  `created_at` int(11) NOT NULL COMMENT 'Created',
  `updated_at` int(11) NOT NULL COMMENT 'Updated',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_migration`
--

CREATE TABLE `tbl_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_migration`
--

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1695909188),
('modules\\catalog\\migrations\\m171022_212341_create_catalog_table', 1695909191),
('modules\\catalog\\migrations\\m171203_021423_create_catalog_order_table', 1695909191),
('modules\\rbac\\migrations\\m170615_234118_create_rbac_table', 1695909189),
('modules\\users\\migrations\\m161022_180040_create_table_user', 1695909189);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Username',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email',
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Authorization Key',
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Hash Password',
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Password Token',
  `email_confirm_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email Confirm Token',
  `created_at` int(11) NOT NULL COMMENT 'Created',
  `updated_at` int(11) NOT NULL COMMENT 'Updated',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `email`, `auth_key`, `password_hash`, `password_reset_token`, `email_confirm_token`, `created_at`, `updated_at`, `status`) VALUES
(3, '30304', 'it1@orgmlm.ru', '_Sf9XUFCIcq3meEAtBlEzUl3DK3QCJtl', '$2y$13$CJUC1rdNYJpWKT0hB9b.UeDUJdHwkRslKHJY/DQQM5gNWIWuAhs4i', NULL, 'F3E7cUl-Xpi6IgqHLYHOMSbzWzaLWNtg', 1695910045, 1695910045, 1),
(24, '30302', '', '6UMhG7lSu2nuXE_NiTOZwOoSIxd6MbVg', '5135a3711e6a5a7ffb316c8df62c41ad', NULL, NULL, 1695995674, 1695995674, 1),
(130, 'admin', 'it4@orgmlm.ru', 'NqnNDhqTdypsuwnTgFrTf7HCuqvyl6GW', '$2y$13$MQZqdGtu5AkAMD.nW7QiTOFyTY91qjuGe0UKomlU3Urm8oiXCTKqm', NULL, NULL, 1698316335, 1698316335, 1),
(133, 'admin2', 'keke@kek.ke', 'Lk92Ptzu8vlJAPCoWRb__e6heYP4n7Q7', '$2y$13$hxta.BeeDRmiHsDGt547s..9tzZFg5mhLLlQNUgjBABKtD2SPSEWS', NULL, NULL, 1698323787, 1698323787, 1),
(134, '3327', NULL, 'by5Py31eQzBNRHAy5x86zYeQZtGNfDDj', '$2y$13$2.0YtGGy76rez.T/Kcn.yu/dB8xvYO.MHNSM0s/o8gQivOfKsLHtO', NULL, NULL, 1706786872, 1706786872, 1),
(136, '303031', NULL, '`', '5135a3711e6a5a7ffb316c8df62c41ad', NULL, NULL, 1698323499, 1713968241, 1),
(139, '30303', NULL, 'Y5Ftyy_b9KMlYdLRKOrFrb3Hl-3Rp4Tv', '$2y$13$RChlVp9QbWFn4XoJbYZo2ezsm7y6UpvhnWq5F2SZnajYG0aK67clq', NULL, NULL, 1713971238, 1713971673, 1),
(140, '174991', NULL, 'XJcX0Aln_yvXtme-lH_g9Odcd41rck0j', '$2y$13$/mliz2OH2qeBdakL7hH/E.hu1yZH.TlK.HMpWAOawYMOvaOfDp/kW', NULL, NULL, 1714042132, 1714042132, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_user_payments`
--

CREATE TABLE `tbl_user_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Привзяка к id партнера',
  `test` int(10) NOT NULL,
  `status` text NOT NULL COMMENT 'Статус заказа',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text NOT NULL COMMENT 'Какой номер заказа',
  `payment_sum` varchar(255) DEFAULT NULL COMMENT 'Сумма оплаты',
  `payment_id` text NOT NULL COMMENT 'id банковской системы',
  `type` text NOT NULL COMMENT 'тип оплаты (пока карты)',
  `first6` int(10) NOT NULL COMMENT 'первые 6 цифр карты',
  `last4` int(10) NOT NULL COMMENT 'последние 4 цифры карты',
  `rrn` text NOT NULL COMMENT 'ррн банка, для поиска',
  `authCode` text NOT NULL,
  `send_to_is` tinyint(4) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tbl_user_payments`
--

INSERT INTO `tbl_user_payments` (`id`, `user_id`, `test`, `status`, `created_at`, `description`, `payment_sum`, `payment_id`, `type`, `first6`, `last4`, `rrn`, `authCode`, `send_to_is`) VALUES
(1, 130, 0, '', '2023-10-27 12:50:32', '', '1800', '', '', 0, 0, '', '', 0000),
(32, 139, 1, 'pending', '2024-05-06 11:50:13', '1714996213', '200', '2dcad7b5-000f-5000-a000-1e8d6be8d7ae', 'bank_card', 0, 0, '', '', 0000);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_user_profile`
--

CREATE TABLE `tbl_user_profile` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT 'User',
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'First Name',
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Last Name',
  `second_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` text COLLATE utf8_unicode_ci,
  `passport` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` text COLLATE utf8_unicode_ci,
  `region` text COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `index_loc` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bill_store` text COLLATE utf8_unicode_ci,
  `phone` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inn` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kpp` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email',
  `last_visit` int(11) DEFAULT NULL COMMENT 'Last Visit',
  `created_at` int(11) NOT NULL COMMENT 'Created',
  `updated_at` int(11) NOT NULL COMMENT 'Updated',
  `user_num_is` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `tbl_user_profile`
--

INSERT INTO `tbl_user_profile` (`id`, `user_id`, `first_name`, `last_name`, `second_name`, `birthday`, `passport`, `city`, `region`, `address`, `index_loc`, `bill_store`, `phone`, `inn`, `kpp`, `email`, `last_visit`, `created_at`, `updated_at`, `user_num_is`) VALUES
(3, 3, NULL, NULL, '', '0000-00-00', '0', '', '', '', '0', '0', '', '0', '0', 'it1@orgmssm.ru', 1697530465, 1695910045, 1695910045, 0),
(21, 24, NULL, NULL, '', '2023-10-02', '0', '', '', '', '0', '0', '', '0', '0', '', NULL, 1695995674, 1695995674, 0),
(103, 130, 'одмен', 'одменов', 'одменович', '28.10.1829', '11-11 111111', 'какой то город', 'какой то регион', 'полнейший адрес', '111111', '999999', '+7(999)999-99-99', '111111111111', '111111111', 'it4@orgmlm.ru', 1713966835, 1698316335, 1698330359, 0),
(106, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'keke@kek.ke', 1698418748, 1698323787, 1698323787, 0),
(107, 134, 'Дарья', 'Дубинина', 'Владимировна', NULL, '22 07 980176', 'г. Нижний Новгород', 'Нижегородская область', 'ул. Проспект Гагарина, д. 222 к. 177', '603137', '0', '+7(920)253-95-47', NULL, NULL, '9202539547@mail.ru', 1713944757, 1706786872, 1706862371, 3327),
(110, 139, 'Иван', 'Иванов', 'Иванович', '12.04.1989', '13-03 171369', 'Липецк', 'Липецкая область', 'ул. Ленина, д. 80 к. 65', '151145', '1055947', '+7(999)201-50-90', '111111111111', '111111111', 'it1@orgmlm.ru', 1715018636, 1713971238, 1715017623, 30303),
(111, 140, 'Елена', 'Поворотова', 'Александровна', NULL, '57 10 732879', 'Пермь', 'Пермский край', 'ул. Советской Армии, д. 49 кв. 26', '614022', '357.16', '+7(963)884-49-99', NULL, NULL, 'alenapovorotova@yandex.ru', 1714042137, 1714042132, 1714042132, 174991);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `tbl_auth_assignment`
--
ALTER TABLE `tbl_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Индексы таблицы `tbl_auth_item`
--
ALTER TABLE `tbl_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `tbl_auth_item_child`
--
ALTER TABLE `tbl_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `tbl_auth_rule`
--
ALTER TABLE `tbl_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `tbl_catalog_category`
--
ALTER TABLE `tbl_catalog_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_catalog_category_lft` (`lft`),
  ADD KEY `idx_catalog_category_rgt` (`rgt`),
  ADD KEY `idx_catalog_category_depth` (`depth`);

--
-- Индексы таблицы `tbl_catalog_order`
--
ALTER TABLE `tbl_catalog_order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_catalog_order_product`
--
ALTER TABLE `tbl_catalog_order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_catalog_order` (`order_id`),
  ADD KEY `idx_catalog_order_product` (`product_id`);

--
-- Индексы таблицы `tbl_catalog_product`
--
ALTER TABLE `tbl_catalog_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `idx_catalog_product_slug` (`slug`),
  ADD KEY `idx_catalog_product_category` (`category_id`);

--
-- Индексы таблицы `tbl_catalog_product_image`
--
ALTER TABLE `tbl_catalog_product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_catalog_product_image_product` (`product_id`);

--
-- Индексы таблицы `tbl_migration`
--
ALTER TABLE `tbl_migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `auth_key` (`auth_key`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`),
  ADD UNIQUE KEY `email_confirm_token` (`email_confirm_token`);

--
-- Индексы таблицы `tbl_user_payments`
--
ALTER TABLE `tbl_user_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ZG6E` (`user_id`);

--
-- Индексы таблицы `tbl_user_profile`
--
ALTER TABLE `tbl_user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_gravatar` (`email`),
  ADD KEY `IDX_user_profile_user_id` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `tbl_catalog_category`
--
ALTER TABLE `tbl_catalog_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT для таблицы `tbl_catalog_order`
--
ALTER TABLE `tbl_catalog_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tbl_catalog_order_product`
--
ALTER TABLE `tbl_catalog_order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tbl_catalog_product`
--
ALTER TABLE `tbl_catalog_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT для таблицы `tbl_catalog_product_image`
--
ALTER TABLE `tbl_catalog_product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT для таблицы `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT для таблицы `tbl_user_payments`
--
ALTER TABLE `tbl_user_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `tbl_user_profile`
--
ALTER TABLE `tbl_user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=112;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `tbl_auth_assignment`
--
ALTER TABLE `tbl_auth_assignment`
  ADD CONSTRAINT `tbl_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tbl_auth_item`
--
ALTER TABLE `tbl_auth_item`
  ADD CONSTRAINT `tbl_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `tbl_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tbl_auth_item_child`
--
ALTER TABLE `tbl_auth_item_child`
  ADD CONSTRAINT `tbl_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tbl_catalog_order_product`
--
ALTER TABLE `tbl_catalog_order_product`
  ADD CONSTRAINT `FK_catalog_order` FOREIGN KEY (`order_id`) REFERENCES `tbl_catalog_order` (`id`),
  ADD CONSTRAINT `FK_catalog_order_product` FOREIGN KEY (`product_id`) REFERENCES `tbl_catalog_product` (`id`);

--
-- Ограничения внешнего ключа таблицы `tbl_catalog_product`
--
ALTER TABLE `tbl_catalog_product`
  ADD CONSTRAINT `FK_catalog_product_category` FOREIGN KEY (`category_id`) REFERENCES `tbl_catalog_category` (`id`);

--
-- Ограничения внешнего ключа таблицы `tbl_catalog_product_image`
--
ALTER TABLE `tbl_catalog_product_image`
  ADD CONSTRAINT `FK_catalog_product_image` FOREIGN KEY (`product_id`) REFERENCES `tbl_catalog_product` (`id`);

--
-- Ограничения внешнего ключа таблицы `tbl_user_payments`
--
ALTER TABLE `tbl_user_payments`
  ADD CONSTRAINT `FK_ZG6E` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `tbl_user_profile`
--
ALTER TABLE `tbl_user_profile`
  ADD CONSTRAINT `FK-user_profile-user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
