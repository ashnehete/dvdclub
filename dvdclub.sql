-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2017 at 06:14 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dvdclub`
--

-- --------------------------------------------------------

--
-- Table structure for table `crew`
--

CREATE TABLE `crew` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `job_id` int(10) UNSIGNED NOT NULL,
  `birth_date` date NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `crew`
--

INSERT INTO `crew` (`id`, `name`, `job_id`, `birth_date`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'Nathan Fillion', 1, '1971-03-27', 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTkxODM3ODY2Nl5BMl5BanBnXkFtZTgwMzAyMjU2NzE@._V1_UY317_CR20,0,214,317_AL_.jpg', '2016-10-10 10:29:56', '2016-10-10 10:29:56'),
(2, 'Joss Whedon', 4, '1964-06-23', 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg5MzQ0MDA4MF5BMl5BanBnXkFtZTcwNzUwOTk4OQ@@._V1_UY317_CR12,0,214,317_AL_.jpg', '2016-10-10 11:57:34', '2016-10-10 11:57:34'),
(3, 'Jennifer Aniston', 1, '1969-02-11', 'https://proxy-nl.hide.me/go.php?u=0VCH0dn27IZ6O%2B8MSivY0d5e7GwRJac9smf0AQDQra1%2F3yZJQtigSrcNI9nH7cIr59mKN7S59cLAYQTNYxICxFO%2F5NrDSdLCs62NkiL7CaMiIJNZ33XaW%2BxWUdtQpyirW2W1g0wdG7fF8yCAus%2BPGOfqdslxrfF8S0N771s%3D&b=5', '2016-10-14 01:56:08', '2016-10-14 01:56:08'),
(4, 'Matthew Perry', 1, '1969-08-19', 'https://proxy-nl.hide.me/go.php?u=0VCH0dn27IZ6O%2B8MSivY0d5e7GwRJac9smf0AQDQra1%2F3yZJQtigSrcNI9nH7cIr59q0EfK72%2BiNYQTRKBJ1xFO%2F5NrDSdLCs62NkiL7CaMiIZN3lHb0U%2BtWQdtQpyirW2W1g0wdG7fF8yKbptORG%2BLyact3xe9xWDI%2F9Uz3&b=5', '2016-10-14 01:57:12', '2016-10-14 01:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `crew_dvd`
--

CREATE TABLE `crew_dvd` (
  `crew_id` int(10) UNSIGNED NOT NULL,
  `dvd_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `crew_dvd`
--

INSERT INTO `crew_dvd` (`crew_id`, `dvd_id`) VALUES
(1, 2),
(1, 4),
(2, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `dvds`
--

CREATE TABLE `dvds` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dvd_type` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issued` tinyint(1) NOT NULL,
  `poster_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dvds`
--

INSERT INTO `dvds` (`id`, `title`, `dvd_type`, `description`, `issued`, `poster_url`, `created_at`, `updated_at`) VALUES
(1, 'Iron Man', 1, 'Iron Man', -1, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_UX182_CR0,0,182,268_AL_.jpg', '2016-10-09 13:26:47', '2016-10-25 04:16:04'),
(2, 'Castle', 2, 'Castle', -1, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjM2NjU0ODU0NF5BMl5BanBnXkFtZTgwMDAwMzg5NjE@._V1_UX182_CR0,0,182,268_AL_.jpg', '2016-10-09 13:34:57', '2016-10-09 13:34:57'),
(4, 'Firefly', 2, 'Five hundred years in the future, a renegade crew aboard a small spacecraft tries to survive as they travel the unknown parts of the galaxy and evade warring factions as well as authority agents out to get them.', -1, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTM0OTIzNjM4OV5BMl5BanBnXkFtZTcwNDk4MDU5MQ@@._V1._CR57,54,340,418_UY268_CR18,0,182,268_AL_.jpg', '2016-10-10 12:00:57', '2016-10-14 01:44:10'),
(5, 'Friends', 2, 'Follows the personal and professional lives of six 20 to 30-something yrs old friends living in Manhattan.', -1, 'https://proxy-nl.hide.me/go.php?u=0VCH0dn27IZ6O%2B8MSivY0d5e7GwRJac9smf0AQDQra1%2F3yZJQtigSrcNI9nH7cIr59q0O7G65c7BYRTJLhMCxFO%2F5NrDSdLCs62NkiL7CZkiIYNr3nXkcew1ac0hpyi%2BOAjU9k8AHtG1jSeYubzoceL%2Bd6cFoIAcJEEgpw68%2BSuda3rUwbvG6y0%3D&b=5', '2016-10-14 02:01:10', '2016-10-14 02:01:10'),
(6, 'Friends', 2, 'Follows the personal and professional lives of six 20 to 30-something yrs old friends living in Manhattan.', -1, 'https://proxy-nl.hide.me/go.php?u=0VCH0dn27IZ6O%2B8MSivY0d5e7GwRJac9smf0AQDQra1%2F3yZJQtigSrcNI9nH7cIr59q0O7G65c7BYRTJLhMCxFO%2F5NrDSdLCs62NkiL7CZkiIYNr3nXkcew1ac0hpyi%2BOAjU9k8AHtG1jSeYubzoceL%2Bd6cFoIAcJEEgpw68%2BSuda3rUwbvG6y0%3D&b=5', '2016-10-14 02:01:55', '2016-10-14 02:01:55'),
(7, 'Friends', 2, 'Follows the personal and professional lives of six 20 to 30-something yrs old friends living in Manhattan.', -1, 'https://proxy-nl.hide.me/go.php?u=0VCH0dn27IZ6O%2B8MSivY0d5e7GwRJac9smf0AQDQra1%2F3yZJQtigSrcNI9nH7cIr59q0O7G65c7BYRTJLhMCxFO%2F5NrDSdLCs62NkiL7CZkiIYNr3nXkcew1ac0hpyi%2BOAjU9k8AHtG1jSeYubzoceL%2Bd6cFoIAcJEEgpw68%2BSuda3rUwbvG6y0%3D&b=5', '2016-10-14 02:02:26', '2016-10-14 02:02:26'),
(8, 'Friends', 2, 'Follows the personal and professional lives of six 20 to 30-something yrs old friends living in Manhattan.', -1, 'https://proxy-nl.hide.me/go.php?u=0VCH0dn27IZ6O%2B8MSivY0d5e7GwRJac9smf0AQDQra1%2F3yZJQtigSrcNI9nH7cIr59q0O7G65c7BYRTJLhMCxFO%2F5NrDSdLCs62NkiL7CZkiIYNr3nXkcew1ac0hpyi%2BOAjU9k8AHtG1jSeYubzoceL%2Bd6cFoIAcJEEgpw68%2BSuda3rUwbvG6y0%3D&b=5', '2016-10-14 02:02:51', '2016-10-14 02:02:51'),
(9, 'Friends', 2, 'Follows the personal and professional lives of six 20 to 30-something yrs old friends living in Manhattan.', -1, 'https://proxy-nl.hide.me/go.php?u=0VCH0dn27IZ6O%2B8MSivY0d5e7GwRJac9smf0AQDQra1%2F3yZJQtigSrcNI9nH7cIr59q0O7G65c7BYRTJLhMCxFO%2F5NrDSdLCs62NkiL7CZkiIYNr3nXkcew1ac0hpyi%2BOAjU9k8AHtG1jSeYubzoceL%2Bd6cFoIAcJEEgpw68%2BSuda3rUwbvG6y0%3D&b=5', '2016-10-14 02:03:14', '2016-10-14 02:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `dvd_genre`
--

CREATE TABLE `dvd_genre` (
  `dvd_id` int(10) UNSIGNED NOT NULL,
  `genre_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dvd_genre`
--

INSERT INTO `dvd_genre` (`dvd_id`, `genre_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(4, 1),
(9, 1),
(9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dvd_types`
--

CREATE TABLE `dvd_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dvd_types`
--

INSERT INTO `dvd_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Movie', '2016-10-03 13:00:47', '2016-10-03 13:00:47'),
(2, 'TV Show', '2016-10-03 13:00:47', '2016-10-03 13:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Comedy', '2016-10-03 13:00:47', '2016-10-03 13:00:47'),
(2, 'Romance', '2016-10-03 13:00:47', '2016-10-03 13:00:47'),
(3, 'Thriller', '2016-10-03 13:00:47', '2016-10-03 13:00:47'),
(4, 'Horror', '2016-10-03 13:00:47', '2016-10-03 13:00:47'),
(5, 'Action', '2016-10-03 13:00:47', '2016-10-03 13:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `dvd_id` int(10) UNSIGNED NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `late_fees` int(11) DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `user_id`, `dvd_id`, `issue_date`, `due_date`, `return_date`, `late_fees`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2016-10-14', '2016-10-24', '2016-10-14', 0, 0, '2016-10-14 00:58:57', '2016-10-14 01:25:31'),
(2, 1, 4, '2016-10-14', '2016-10-24', '2016-10-14', 0, 0, '2016-10-14 01:37:58', '2016-10-14 01:38:29'),
(3, 1, 1, '2016-10-14', '2016-10-24', '2016-10-14', 0, 0, '2016-10-14 01:39:38', '2016-10-14 01:41:03'),
(4, 1, 4, '2016-10-14', '2016-10-24', '2016-10-14', 0, 0, '2016-10-14 01:43:28', '2016-10-14 01:44:10'),
(5, 1, 1, '2016-10-25', '2016-11-04', '2016-10-25', 0, 0, '2016-10-25 03:41:01', '2016-10-25 03:41:17'),
(6, 3, 1, '2016-10-25', '2016-11-04', '2016-10-25', 0, 0, '2016-10-25 04:15:11', '2016-10-25 04:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Actor', '2016-10-03 13:00:47', '2016-10-03 13:00:47'),
(2, 'Director', '2016-10-03 13:00:47', '2016-10-03 13:00:47'),
(3, 'Writer', '2016-10-03 13:00:47', '2016-10-03 13:00:47'),
(4, 'Creator', '2016-10-03 13:00:47', '2016-10-03 13:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_10_02_182819_create_genres_table', 1),
('2016_10_02_182926_create_dvd_types_table', 1),
('2016_10_02_183000_create_jobs_table', 1),
('2016_10_02_183212_create_crew_table', 1),
('2016_10_02_184000_create_dvds_table', 1),
('2016_10_02_184504_create_tv_shows_table', 1),
('2016_10_02_184648_create_movies_table', 1),
('2016_10_02_190010_create_issues_table', 1),
('2016_10_02_190114_create_dvd_genre_pivot_table', 1),
('2016_10_02_190303_create_crew_dvd_pivot_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(10) UNSIGNED NOT NULL,
  `dvd_id` int(10) UNSIGNED NOT NULL,
  `release_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `dvd_id`, `release_date`, `created_at`, `updated_at`) VALUES
(1, 1, '2016-10-03', '2016-10-09 13:26:47', '2016-10-09 13:26:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tv_shows`
--

CREATE TABLE `tv_shows` (
  `id` int(10) UNSIGNED NOT NULL,
  `dvd_id` int(10) UNSIGNED NOT NULL,
  `seasons` int(11) NOT NULL,
  `episodes` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tv_shows`
--

INSERT INTO `tv_shows` (`id`, `dvd_id`, `seasons`, `episodes`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 2, 8, 173, '2009-03-09', '2016-05-16', '2016-10-09 13:34:57', '2016-10-09 13:34:57'),
(3, 4, 1, 14, '2002-09-20', '2002-12-20', '2016-10-10 12:00:57', '2016-10-10 12:00:57'),
(4, 5, 10, 236, '1994-09-22', '2004-05-06', '2016-10-14 02:01:10', '2016-10-14 02:01:10'),
(5, 6, 10, 236, '1994-09-22', '2004-05-06', '2016-10-14 02:01:55', '2016-10-14 02:01:55'),
(6, 7, 10, 236, '1994-09-22', '2004-05-06', '2016-10-14 02:02:26', '2016-10-14 02:02:26'),
(7, 8, 10, 236, '1994-09-22', '2004-05-06', '2016-10-14 02:02:51', '2016-10-14 02:02:51'),
(8, 9, 10, 236, '1994-09-22', '2004-05-06', '2016-10-14 02:03:14', '2016-10-14 02:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_id` int(11) NOT NULL DEFAULT '-1',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `issue_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aashish Nehete', 'ashnehete@gmail.com', '$2y$10$V5d3lP3u6la1egPPjftZU.YzDc1f7jNmfIpx.bjJYZmapS4LxxHvW', '9619641945', '8/212, Vijay Nagar, Near Cardinal High School, Bandra (East)', -1, 'xoVToiuoBWc3ndjxYCSyG7A1X8QYe8oSoeCNXCoLCKyxtzsBAYbayiianH6s', '2016-10-05 23:43:56', '2016-10-25 03:46:02'),
(2, 'Jeet Mehta', 'jeetmehta@gmail.com', '$2y$10$KfmLnPz24VaK./eFyNUOFuLX4tXT3etyhB6w8SqTGdYUCHPUmG6q6', '9920896046', 'Bhardawadi', -1, NULL, '2016-10-14 01:52:03', '2016-10-14 01:52:03'),
(3, 'asmita', 'asmita19798@gmail.com', '$2y$10$i2DRgeW7/.xBCGPV5.DpIOhyEVRfVG.HEGBMmfR45aG6Fb6MAQgd6', '9702082144', 'agds', -1, NULL, '2016-10-25 04:11:58', '2016-10-25 04:16:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crew`
--
ALTER TABLE `crew`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crew_job_index` (`job_id`);

--
-- Indexes for table `crew_dvd`
--
ALTER TABLE `crew_dvd`
  ADD PRIMARY KEY (`crew_id`,`dvd_id`),
  ADD KEY `crew_dvd_crew_id_index` (`crew_id`),
  ADD KEY `crew_dvd_dvd_id_index` (`dvd_id`);

--
-- Indexes for table `dvds`
--
ALTER TABLE `dvds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dvds_dvd_type_index` (`dvd_type`);

--
-- Indexes for table `dvd_genre`
--
ALTER TABLE `dvd_genre`
  ADD PRIMARY KEY (`dvd_id`,`genre_id`),
  ADD KEY `dvd_genre_dvd_id_index` (`dvd_id`),
  ADD KEY `dvd_genre_genre_id_index` (`genre_id`);

--
-- Indexes for table `dvd_types`
--
ALTER TABLE `dvd_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issues_user_id_index` (`user_id`),
  ADD KEY `issues_dvd_id_index` (`dvd_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movies_dvd_id_index` (`dvd_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `tv_shows`
--
ALTER TABLE `tv_shows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tv_shows_dvd_id_index` (`dvd_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crew`
--
ALTER TABLE `crew`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dvds`
--
ALTER TABLE `dvds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `dvd_types`
--
ALTER TABLE `dvd_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tv_shows`
--
ALTER TABLE `tv_shows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `crew`
--
ALTER TABLE `crew`
  ADD CONSTRAINT `crew_job_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `crew_dvd`
--
ALTER TABLE `crew_dvd`
  ADD CONSTRAINT `crew_dvd_crew_id_foreign` FOREIGN KEY (`crew_id`) REFERENCES `crew` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `crew_dvd_dvd_id_foreign` FOREIGN KEY (`dvd_id`) REFERENCES `dvds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvds`
--
ALTER TABLE `dvds`
  ADD CONSTRAINT `dvds_dvd_type_foreign` FOREIGN KEY (`dvd_type`) REFERENCES `dvd_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvd_genre`
--
ALTER TABLE `dvd_genre`
  ADD CONSTRAINT `dvd_genre_dvd_id_foreign` FOREIGN KEY (`dvd_id`) REFERENCES `dvds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dvd_genre_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `issues_dvd_id_foreign` FOREIGN KEY (`dvd_id`) REFERENCES `dvds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `issues_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_dvd_id_foreign` FOREIGN KEY (`dvd_id`) REFERENCES `dvds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tv_shows`
--
ALTER TABLE `tv_shows`
  ADD CONSTRAINT `tv_shows_dvd_id_foreign` FOREIGN KEY (`dvd_id`) REFERENCES `dvds` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
