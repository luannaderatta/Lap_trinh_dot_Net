USE master;
GO
DROP DATABASE QuanLyTourDuLich;
GO
CREATE DATABASE QuanLyTourDuLich ON ( NAME ='QuanLyTourDuLich',
									FILENAME='D:\LAP_TRINH_.NET\BAOCAO\CSDL\QuanLyTourDuLich.mdf',
									SIZE = 10,
									MAXSIZE = 50,
									FILEGROWTH = 5);
GO
USE QuanLyTourDuLich;
GO

CREATE TABLE Tour (
    TourID INT PRIMARY KEY IDENTITY(1,1),
    TenTour NVARCHAR(255) NOT NULL,
    DiemDen NVARCHAR(255) NOT NULL,
    Gia DECIMAL(10, 2) NOT NULL,
    ThoiGian INT NOT NULL, -- số ngày
    MoTa NVARCHAR(MAX)
);

CREATE TABLE LichTrinh (
    LichTrinhID INT PRIMARY KEY IDENTITY(1,1),
    TourID INT NOT NULL,
    Ngay INT NOT NULL,
    MoTa NVARCHAR(MAX) NOT NULL,
    FOREIGN KEY (TourID) REFERENCES Tour(TourID)
);

CREATE TABLE KhachHang (
    KhachHangID INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL UNIQUE,
    SDT NVARCHAR(15) NOT NULL,
    DiaChi NVARCHAR(255)
);

CREATE TABLE DatTour (
    DatTourID INT PRIMARY KEY IDENTITY(1,1),
    KhachHangID INT NOT NULL,
    TourID INT NOT NULL,
    NgayDat DATE NOT NULL,
    SoLuongNguoi INT NOT NULL,
    TrangThai NVARCHAR(50) NOT NULL CHECK (TrangThai IN ('Đã thanh toán', 'Chưa thanh toán', 'Đã hủy')),
    FOREIGN KEY (KhachHangID) REFERENCES KhachHang(KhachHangID),
    FOREIGN KEY (TourID) REFERENCES Tour(TourID)
);

CREATE TABLE ThanhToan (
    ThanhToanID INT PRIMARY KEY IDENTITY(1,1),
    DatTourID INT NOT NULL,
    SoTien DECIMAL(10, 2) NOT NULL,
    ThoiGian DATETIME NOT NULL,
    PhuongThuc NVARCHAR(50) NOT NULL,
    FOREIGN KEY (DatTourID) REFERENCES DatTour(DatTourID)
);

CREATE TABLE PhanHoi (
    PhanHoiID INT PRIMARY KEY IDENTITY(1,1),
    KhachHangID INT NOT NULL,
    TourID INT NOT NULL,
    NoiDung NVARCHAR(MAX) NOT NULL,
    ThoiGian DATETIME NOT NULL,
    FOREIGN KEY (KhachHangID) REFERENCES KhachHang(KhachHangID),
    FOREIGN KEY (TourID) REFERENCES Tour(TourID)
);

CREATE TABLE NhanVien (
    NhanVienID INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(255) NOT NULL,
    ChucVu NVARCHAR(50) NOT NULL,
    SDT NVARCHAR(15) NOT NULL
);

CREATE TABLE DoiTac (
    DoiTacID INT PRIMARY KEY IDENTITY(1,1),
    TenDoiTac NVARCHAR(255) NOT NULL,
    LoaiDichVu NVARCHAR(50) NOT NULL CHECK (LoaiDichVu IN ('KhachSan', 'PhuongTien', 'AnUong')),
    LienHe NVARCHAR(255)
);

CREATE TABLE TourDoiTac (
    TourID INT NOT NULL,
    DoiTacID INT NOT NULL,
    PRIMARY KEY (TourID, DoiTacID),
    FOREIGN KEY (TourID) REFERENCES Tour(TourID),
    FOREIGN KEY (DoiTacID) REFERENCES DoiTac(DoiTacID)
);

CREATE TABLE TaiKhoan (
    TaiKhoanID INT PRIMARY KEY IDENTITY(1,1),
    TenDangNhap NVARCHAR(50) NOT NULL UNIQUE,
    MatKhau NVARCHAR(255) NOT NULL,  -- Gợi ý nên mã hóa khi lưu
    VaiTro NVARCHAR(20) NOT NULL CHECK (VaiTro IN ('KhachHang', 'QuanTri', 'NhanVien')),
    KhachHangID INT NULL,
    NhanVienID INT NULL,
    
    CONSTRAINT FK_TaiKhoan_KhachHang FOREIGN KEY (KhachHangID) REFERENCES KhachHang(KhachHangID),
    CONSTRAINT FK_TaiKhoan_NhanVien FOREIGN KEY (NhanVienID) REFERENCES NhanVien(NhanVienID)
);
