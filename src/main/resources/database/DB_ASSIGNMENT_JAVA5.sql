﻿CREATE DATABASE DB_FINAL_JAVA5_GAU_BONG
USE DB_FINAL_JAVA5_GAU_BONG
GO
-- Account
CREATE TABLE Account(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdKH UNIQUEIDENTIFIER,
username VARCHAR(50) UNIQUE,
Passwords NVARCHAR(50) DEFAULT NULL,
[role] nvarchar(50),
HoTen nvarchar(Max),
Email nvarchar(Max)
)
GO
-- Client
CREATE TABLE Client(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
MaKhachHang VARCHAR(20) UNIQUE,
Ten NVARCHAR(30),
TenDem NVARCHAR(30) DEFAULT NULL,
Ho NVARCHAR(30) DEFAULT NULL,
NgaySinh DATE DEFAULT NULL,
Sdt VARCHAR(30) DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
ThanhPho NVARCHAR(50) DEFAULT NULL,
QuocGia NVARCHAR(50) DEFAULT NULL,
MatKhau VARCHAR(MAX) DEFAULT NULL
)
GO
--Bill
CREATE TABLE Bill(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdKH UNIQUEIDENTIFIER,
IdSP UNIQUEIDENTIFIER,
IdCart UNIQUEIDENTIFIER,
MaHoaDon VARCHAR(20) UNIQUE,
NgayTao DATE DEFAULT NULL,
NgayThanhToan DATE DEFAULT NULL,
NgayShip DATE DEFAULT NULL,
NgayNhan DATE DEFAULT NULL,
TinhTrang INT DEFAULT 0,
TenNguoiNhan NVARCHAR(50) DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
Sdt VARCHAR(30) DEFAULT NULL,
SoLuong INT,
DonGia DECIMAL,
ThanhTien DECIMAL,
)
GO
--Cart
CREATE TABLE Cart(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdKH UNIQUEIDENTIFIER,
IdSP UNIQUEIDENTIFIER,
MaGioHang VARCHAR(20) UNIQUE,
NgayTao DATE DEFAULT NULL,
NgayThanhToan DATE DEFAULT NULL,
TenNguoiNhan NVARCHAR(50) DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
Sdt VARCHAR(30) DEFAULT NULL,
TinhTrang INT DEFAULT 0,
SoLuong INT,
DonGia DECIMAL,
DonGiaGiam DECIMAL,
ThanhTien DECIMAL
)
GO
-- Product
CREATE TABLE Product(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
MaSanPham VARCHAR(30) UNIQUE,
TenSanPham NVARCHAR(50),
HinhAnh NVARCHAR(MAX),
MauSac NVARCHAR(30),
KichThuoc NVARCHAR(20),
ChatLieu NVARCHAR(30),
NamBH INT DEFAULT NULL,
MoTa NVARCHAR(50) DEFAULT NULL,
SoLuong INT,
GiaNhap DECIMAL(20,0) DEFAULT 0,
GiaBan DECIMAL(20,0) DEFAULT 0,
TrangThai BIT,
)
GO
--TẠO QUAN HỆ GIỮA CÁC BẢNG
--account - Client
ALTER TABLE Account ADD FOREIGN KEY(IdKH) REFERENCES Client(Id)
-- Bill - Account
ALTER TABLE Bill ADD FOREIGN KEY (IdKH) REFERENCES Account(Id)
-- Cart - Client
ALTER TABLE Cart ADD FOREIGN KEY (IdKH) REFERENCES Client(Id)
--Bill - Product
ALTER TABLE Bill ADD FOREIGN KEY (IdSP) REFERENCES Product(Id)
--Cart - Product
ALTER TABLE Cart ADD FOREIGN KEY (IdSP) REFERENCES Product(Id)
--Bill - Cart
ALTER TABLE Bill ADD FOREIGN KEY (IdCart) REFERENCES Cart(Id)
--Delete table
DROP TABLE Product
Drop table Bill
drop table Cart
