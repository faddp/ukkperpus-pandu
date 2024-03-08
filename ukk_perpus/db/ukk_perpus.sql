-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Mar 2024 pada 03.19
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk_perpus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `sampul` varchar(20) NOT NULL,
  `judul` varchar(20) DEFAULT NULL,
  `penulis` varchar(50) DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `sampul`, `judul`, `penulis`, `tahun_terbit`, `deskripsi`, `stok`) VALUES
(93, 9, 'maling kundang.webp', 'Maling Kundang     ', 'pandu     ', 1922, 'Anak yang dikutuk menjadi batu', 7),
(97, 10, 'ruang sunyi.webp', 'Ruang Sunyi', 'ilham', 2022, 'Ruang sunyi', 17),
(103, 11, 'b.indonesia.jpg', 'B.Indonesia   ', 'fadfa  ', 1998, 'Pelajaran B.indonesia kelas 12', 20),
(104, 12, 'ingrs.jpg', 'B.inggris', 'Elga', 2024, 'Buku mapel B.ingris kelas 11', 27);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
(9, 'FIKSI'),
(10, 'NOVEL'),
(11, 'B.INDONESIA'),
(12, 'B.INGGRIS'),
(13, 'B.JAWA'),
(14, 'MATEMATIKA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `tanggal_peminjaman` varchar(50) DEFAULT NULL,
  `tanggal_pengembalian` varchar(50) DEFAULT NULL,
  `status_peminjaman` enum('dipinjam','dikembalikan','belum dikonfirmasi') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_user`, `id_buku`, `tanggal_peminjaman`, `tanggal_pengembalian`, `status_peminjaman`) VALUES
(26, 25, 103, '2024-02-28', '2024-02-29', 'dikembalikan'),
(27, 25, 103, '2024-02-27', '2024-02-28', 'dikembalikan'),
(36, 25, 93, '2024-02-28', '2024-02-29', 'dikembalikan'),
(37, 25, 103, '2024-02-27', '2024-03-01', 'belum dikonfirmasi'),
(38, 26, 103, '2024-02-28', '2024-03-01', 'belum dikonfirmasi'),
(39, 26, 103, '2024-02-26', '2024-02-29', 'belum dikonfirmasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasan`
--

CREATE TABLE `ulasan` (
  `id_ulasan` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `ulasan` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ulasan`
--

INSERT INTO `ulasan` (`id_ulasan`, `id_user`, `id_buku`, `ulasan`, `rating`) VALUES
(10, 20, 97, 'Ceritanya sanggat bisa untuk direkomendasikan ', 8),
(12, 25, 103, 'bukunya sanggat bagus yjy', 9),
(13, 26, 93, 'ceritanya sanggat bagus', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_telpon` varchar(50) DEFAULT NULL,
  `level` enum('admin','petugas','peminjam') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `email`, `alamat`, `no_telpon`, `level`) VALUES
(14, 'Administrator', 'admin ', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', 'Ponorogo', '098765', 'admin'),
(15, 'Petugas 1', 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas@gmail.com', 'Ponorogo', '1223455', 'petugas'),
(16, 'Siswa 1', 'siswa 1', 'bcd724d15cde8c47650fda962968f102', 'siswa1@gmail.com', 'Pulung', '5386358', 'peminjam'),
(17, 'Administrator 2', 'admin 2', 'd41d8cd98f00b204e9800998ecf8427e', 'admin2@gmail.com', 'Ponorogo', '11111', 'admin'),
(19, 'sqsqs', 'petugasdq', '7625c65cfe5b0f9cb3dff7514907e024', 'sqsss', 'dqqd', '12112', 'petugas'),
(20, 'Peminjam 10', 'siswa 10', '5ca4a94eb7b4a88904d9824ff42024e7', 'siswa10@gmail.com', 'Bungkal', '22333', 'peminjam'),
(22, 'Peminjam 10', 'siswa 10', '5ca4a94eb7b4a88904d9824ff42024e7', 'siswa10@gmail.com', 'Bungkal', '22333', 'peminjam'),
(23, 'Petugas 10', 'petugas 10', '559d08762ee146fcd4203bde5d14c0e2', 'petugas10@gmail.com', 'Siman', '33333', 'petugas'),
(25, 'elga', 'elga', '853f0d277c9ebfda2c8dd35b270d041a', 'elga@gmail.com', 'Ponorogo', '1111', 'peminjam'),
(26, 'pandu', 'pandu', 'c4ca4238a0b923820dcc509a6f75849b', 'pandu@gmail.com', 'Ponorogo', '111', 'peminjam');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD UNIQUE KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_kategori_2` (`id_kategori`),
  ADD KEY `id_kategori_3` (`id_kategori`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_buku_2` (`id_buku`);

--
-- Indeks untuk tabel `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id_ulasan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `ulasan`
--
ALTER TABLE `ulasan`
  MODIFY `id_ulasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ulasan_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
