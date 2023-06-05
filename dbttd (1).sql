-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jun 2023 pada 14.23
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbttd`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `documents`
--

INSERT INTO `documents` (`id`, `name`, `filename`, `description`, `created_at`, `updated_at`, `id_user`) VALUES
(42, 'doc2', 'Contoh Proposal BIP - LPDP BC.pdf', 'doc2', '2023-06-02 11:55:34', '2023-06-02 11:55:34', 16),
(45, 'doc baru', 'HILDAN AWALUDIN BAB II.pdf', 'doc baru', '2023-06-03 15:40:45', '2023-06-03 15:40:45', 16),
(46, '1234', '8257-18534-1-SM.pdf', '1234', '2023-06-04 09:46:22', '2023-06-04 09:46:22', 19),
(47, 'doc 10', '243209-none-ee3ceac8.pdf', 'baru', '2023-06-04 12:09:59', '2023-06-04 12:09:59', 16),
(48, 'doc2', 'Contoh Proposal BIP - LPDP BC.pdf', 'doc2', '2023-06-04 12:10:23', '2023-06-04 12:10:23', 19);

-- --------------------------------------------------------

--
-- Struktur dari tabel `signature`
--

CREATE TABLE `signature` (
  `id_signature` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_penerima` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `signed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `signature`
--

INSERT INTO `signature` (`id_signature`, `user_id`, `id_penerima`, `document_id`, `jabatan`, `status`, `signed_at`, `created_at`, `updated_at`) VALUES
(31, 16, 18, 42, 'Dekan', 'Waiting', '2023-06-04 05:40:49', '2023-06-04 05:40:49', '2023-06-04 05:40:49'),
(32, 19, 14, 46, 'Dekan', 'Waiting', '2023-06-04 12:01:16', '2023-06-04 12:01:16', '2023-06-04 12:01:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `institute_name` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `sign_img` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `nik`, `institute_name`, `city`, `active`, `sign_img`, `created_at`, `updated_at`) VALUES
(12, 'Nadini Annisa Byant 12265', '1@gmail.com', '$2a$10$.53vNwLnFDnOxJR/2axRieTypJ4DWADzr81jRxsROlSEhek7/Dxdm', '123434536574', 'unand', 'padang', 1, 'WhatsApp Image 2023-05-19 at 22.24.24.jpg', '2023-05-23 13:54:12', '2023-06-04 09:06:48'),
(13, 'abcdefgh', '2@gmail.com', '$2a$10$RnXfnvlEJmq2Si3u2JzVhOpDzUSm0BAKMYLDmeTwu7WGG4aNzV6Em', '2', '2', '2', 1, 'WhatsApp Image 2023-05-19 at 22.24.24.jpg', '2023-05-23 13:54:58', '2023-05-23 13:54:58'),
(14, 'abcdefghijklmno', 'admin@gmail.com', '$2a$10$uOl34flDUH0jUS0C//NAyuCMBBBnGklWGoZnhyZ1bhLu9SZQSvVr6', '1', '1', '1', 1, 'WhatsApp Image 2023-05-19 at 22.24.24.jpg', '2023-05-23 13:56:22', '2023-05-23 13:56:22'),
(15, 'nadiniannisa1226', 'dini@gmail.com', '$2a$10$PKeXtUpJsVkkTOg3tQjFy.o0prLGfzOOQkpuO/DffSghr93uR4WWC', '1', '1', '1', 1, 'WhatsApp Image 2023-05-19 at 22.24.24.jpg', '2023-05-23 14:26:24', '2023-05-23 14:26:24'),
(16, 'agibsayanggivan', 'agibwaw@gmail.com', '$2a$10$MmbROxoB2vys3sOVeljNb.jZv6JixzlpPFINV45rUTWx58mO5SUNS', '33333313', 'unand', 'Padang', 1, 'WhatsApp Image 2023-05-19 at 22.24.24.jpg', '2023-05-24 07:45:41', '2023-05-24 07:45:41'),
(17, 'nadiniannisabyant1226', 'dini123@gmail.com', '$2a$10$.JdK8uvTXmMPMCuPI0bbqOQWSx7h4dH0anwUUFLA4qTh9cvYzGhK6', '23', '123', '123', 1, 'budiman.jpg', '2023-06-01 13:21:27', '2023-06-01 13:21:27'),
(18, '2111522021234234234', 'samsung@gmail.com', '$2a$10$fbVmimA/53E0eiuUDpbn6u5r7gGFwOmEQxl2OZkWO0rn9gtLFUyG.', '123', '123', '123', 1, 'tes.png', '2023-06-01 14:00:44', '2023-06-01 14:00:44'),
(19, 'Nadini Byant Byant', 'test@gmail.com', '$2a$10$2TBuTAAPNbFF3Yt34B9WV.KTnwsvTkpIUB7v1.olfbuoOOmek/xAC', '1371046606', 'unand', 'padang', 1, 'budiman.jpg', '2023-06-04 09:42:24', '2023-06-04 10:22:56');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `signature`
--
ALTER TABLE `signature`
  ADD PRIMARY KEY (`id_signature`),
  ADD KEY `document_id` (`document_id`),
  ADD KEY `id_penerima` (`id_penerima`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `signature`
--
ALTER TABLE `signature`
  MODIFY `id_signature` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `signature`
--
ALTER TABLE `signature`
  ADD CONSTRAINT `signature_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `signature_ibfk_4` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `signature_ibfk_5` FOREIGN KEY (`id_penerima`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
