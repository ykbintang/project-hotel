-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jan 2022 pada 22.41
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `apartemen`
--

CREATE TABLE `apartemen` (
  `id_apartemen` int(11) NOT NULL,
  `nama_apartemen` varchar(200) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `harga` double NOT NULL,
  `harga_bulan` double NOT NULL,
  `harga_tahun` double NOT NULL,
  `foto` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apartemen`
--

INSERT INTO `apartemen` (`id_apartemen`, `nama_apartemen`, `id_kota`, `harga`, `harga_bulan`, `harga_tahun`, `foto`) VALUES
(1, 'Moedjito Resort Bandung', 1, 540000, 16000000, 194000000, 'mr-bdg.jpg'),
(3, 'Moedjito Resort Bali', 6, 590000, 17500000, 212000000, 'mr-bali.jpg'),
(4, 'Moedjito Resort Yogyakarta', 2, 550000, 16300000, 197500000, 'mr-jogja.jpeg'),
(5, 'Moedjito Resort Semarang', 3, 520000, 15500000, 187000000, 'mr-smg.jpg'),
(6, 'Moedjito Resort Jakarta', 5, 570000, 17000000, 205000000, 'mr-jkt.jpg'),
(7, 'Moedjito Resort Surabaya', 4, 530000, 15500000, 185000000, 'mr-sby.jpg'),
(8, 'Moedjito Villa Bandung', 1, 440000, 13000000, 158000000, 'ma-bdg.jpg'),
(9, 'Moedjito Villa Yogyakarta', 2, 430000, 12700000, 154500000, 'ma-jogja.jpg'),
(10, 'Moedjito Villa Semarang', 3, 420000, 12500000, 151000000, 'ma-smg.jpg'),
(11, 'Moedjito Villa Surabaya', 4, 425000, 12500000, 152800000, 'ma-sby.jpg'),
(12, 'Moedjito Villa Jakarta', 5, 435000, 13000000, 156500000, 'ma-jkt.jpg'),
(13, 'Moedjito Villa Bali', 6, 445000, 13250000, 160000000, 'ma-bali.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota`
--

CREATE TABLE `kota` (
  `id_kota` int(11) NOT NULL,
  `nama_kota` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kota`
--

INSERT INTO `kota` (`id_kota`, `nama_kota`) VALUES
(1, 'Bandung'),
(2, 'Yogyakarta'),
(3, 'Semarang'),
(4, 'Surabaya'),
(5, 'Jakarta'),
(6, 'Bali'),
(7, 'Solo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `kode_booking` varchar(20) NOT NULL,
  `nomor_kamar` varchar(20) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_apartemen` int(11) NOT NULL,
  `hari` int(11) NOT NULL,
  `checkin` date NOT NULL,
  `paket` varchar(200) NOT NULL,
  `jumlah_paket` int(11) NOT NULL,
  `total_bayar` double NOT NULL,
  `bukti_transfer` text DEFAULT NULL,
  `jenis_pembayaran` varchar(100) NOT NULL,
  `status_pembayaran` enum('sudah_dibayar','belum_dibayar','proses_verifikasi','ditolak') NOT NULL DEFAULT 'belum_dibayar',
  `tgl_pesan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `kode_booking`, `nomor_kamar`, `id_user`, `id_apartemen`, `hari`, `checkin`, `paket`, `jumlah_paket`, `total_bayar`, `bukti_transfer`, `jenis_pembayaran`, `status_pembayaran`, `tgl_pesan`) VALUES
(9, 'BK-0009', 'A001', 6, 3, 3, '2021-12-29', 'harian', 3, 1770000, 'bukti-1.png', 'transfer', 'sudah_dibayar', '2022-01-03'),
(10, 'BK-0010', 'A001', 10, 1, 2, '2022-01-03', 'harian', 2, 1080000, NULL, 'cash', 'sudah_dibayar', '2022-01-03'),
(11, 'BK-0011', 'A001', 11, 7, 3, '2022-01-04', 'harian', 3, 1590000, 'bukti-2.png', 'transfer', 'sudah_dibayar', '2022-01-03'),
(12, 'BK-0012', NULL, 6, 12, 2, '2022-01-04', 'harian', 2, 870000, NULL, 'cash', 'belum_dibayar', '2022-01-03'),
(13, 'BK-0013', NULL, 10, 9, 1, '2022-01-08', 'harian', 1, 430000, NULL, 'cash', 'belum_dibayar', '2022-01-04'),
(14, 'BK-0014', NULL, 11, 5, 4, '2022-01-05', 'harian', 4, 2080000, NULL, 'cash', 'belum_dibayar', '2022-01-05'),
(15, 'BK-0015', NULL, 6, 1, 2, '2022-01-06', 'harian', 2, 1080000, 'bukti-11.png', 'transfer', 'proses_verifikasi', '2022-01-06'),
(16, 'BK-0016', 'A001', 12, 3, 1, '2022-01-06', 'harian', 1, 590000, 'bukti-12.png', 'transfer', 'sudah_dibayar', '2022-01-06'),
(17, 'BK-0017', 'A001', 6, 13, 2, '2022-01-10', 'harian', 2, 890000, 'bukti-13.png', 'transfer', 'sudah_dibayar', '2022-01-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 = admin, 2 = tamu'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `alamat`, `no_hp`, `username`, `password`, `level`) VALUES
(1, 'administrator', 'solo', '081229633483', 'admin', '202cb962ac59075b964b07152d234b70', 1),
(6, 'bintang', 'klaten', '081229633483', 'bintang', '202cb962ac59075b964b07152d234b70', 2),
(10, 'adul', 'solo', '085728775702', 'adul', '202cb962ac59075b964b07152d234b70', 2),
(11, 'adit', 'yogyakarta', '085725689537', 'adit', '202cb962ac59075b964b07152d234b70', 2),
(12, 'budi', 'klaten', '081229633483', 'budi', '202cb962ac59075b964b07152d234b70', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `apartemen`
--
ALTER TABLE `apartemen`
  ADD PRIMARY KEY (`id_apartemen`);

--
-- Indeks untuk tabel `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id_kota`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `apartemen`
--
ALTER TABLE `apartemen`
  MODIFY `id_apartemen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `kota`
--
ALTER TABLE `kota`
  MODIFY `id_kota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
