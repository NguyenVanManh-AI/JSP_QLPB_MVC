-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 27, 2022 lúc 07:59 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dulieupbjsp`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`username`, `password`, `created_at`, `updated_at`) VALUES
('vanmanh', 'vanmanh', '2022-09-09 18:50:44', '2022-11-27 00:27:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `IDNV` varchar(100) NOT NULL,
  `Hoten` varchar(500) NOT NULL,
  `IDPB` varchar(100) NOT NULL,
  `Diachi` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`IDNV`, `Hoten`, `IDPB`, `Diachi`, `created_at`, `updated_at`) VALUES
('NV01', 'Nguyễn Văn Mạnh', 'PB01', 'Phú Vang Huế', '2022-09-10 10:48:37', '2022-09-10 17:48:37'),
('NV02', 'Trần Thanh Nguyên', 'PB03', 'Cẩm Lệ Đà Nẵng', '2022-09-10 10:49:14', '2022-09-10 17:49:14'),
('NV03', 'Trương Ngọc Hương Giang', 'PB07', 'Huế Việt Nam', '2022-09-10 10:53:56', '2022-09-10 17:53:56'),
('NV04', 'Trần Văn Vũ', 'PB02', 'Hồ Chí Minh - Việt Nam', '2022-09-10 10:54:59', '2022-09-10 17:54:59'),
('NV05', 'Nguyễn Thị Nhật Linh', 'PB05', 'Huế ', '2022-09-10 10:54:23', '2022-09-10 17:54:23'),
('NV07', 'Joma Tech', 'PB01', 'New York - USA ', '2022-09-10 10:55:54', '2022-09-10 17:55:54'),
('NV09', 'Trần Thị Thùy Dương', 'PB02', 'Huế', '2022-09-10 09:02:40', '2022-09-10 16:02:40'),
('NV10', 'Nguyễn Thị Mỹ An', 'PB03', 'Phú Đa Phú Vang TT Huế', '2022-09-10 09:03:38', '2022-09-10 16:03:38'),
('NV14', 'Mai Thị Kim Khánh ', 'PB02 ', 'Phú Vang Huế ', '2022-11-13 12:23:44', '2022-11-13 19:23:44'),
('NV16', 'Nguyễn Văn Mạnh Pro', 'PB01', 'Phú Vang Huế Việt Nam', '2022-11-13 12:34:38', '2022-11-13 19:34:38'),
('NV22', 'Nguyễn Văn Mạnh', 'PB02', 'Địa chỉ', '2022-11-27 04:09:47', '2022-11-27 11:09:47'),
('NV29', 'Nguyễn Văn Mạnh Pro Vip', 'PB01', 'Phú Vang Huế Việt Nam', '2022-11-27 06:57:24', '2022-11-27 13:57:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phongban`
--

CREATE TABLE `phongban` (
  `IDPB` varchar(100) NOT NULL,
  `Tenpb` varchar(500) NOT NULL,
  `Mota` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `phongban`
--

INSERT INTO `phongban` (`IDPB`, `Tenpb`, `Mota`, `created_at`, `updated_at`) VALUES
('PB01', 'Phòng ban 1', 'Phòng ban chất lượng cao 999 AAAAA', '2022-09-09 14:45:36', '2022-11-27 12:58:14'),
('PB02', 'Phòng ban số 22222', 'Phòng ban chất lượng cao số 2 Pro ', '2022-09-09 14:46:07', '2022-11-13 22:00:22'),
('PB03', 'Phòng ban số 33333', 'Phòng ban chất lượng cao số 3 Pro', '2022-09-09 14:46:40', '2022-11-13 22:00:58'),
('PB04', 'Phòng ban số 4', 'AAAAA', '2022-09-09 19:04:22', '2022-11-27 12:39:33'),
('PB05', 'Phòng 5', 'AAAAAA', '2022-09-09 19:04:32', '2022-11-27 12:46:02'),
('PB06', 'Phòng ban số 6', 'Phòng ban pro vip AAAAAAAA', '2022-09-09 19:04:42', '2022-11-27 13:58:01'),
('PB07', 'Phòng ban số 7', 'Phòng ban siêu cấp vip pro', '2022-09-09 19:04:54', '2022-11-27 13:06:44');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`IDNV`),
  ADD KEY `IDPB` (`IDPB`);

--
-- Chỉ mục cho bảng `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`IDPB`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`IDPB`) REFERENCES `phongban` (`IDPB`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
