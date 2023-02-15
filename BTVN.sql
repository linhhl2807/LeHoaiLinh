USE Sales
EXEC sp_addtype Mota, 'NVARCHAR(40)', 'NULL';
EXEC sp_addtype IDKH, 'CHAR(10)', 'NOT NULL';
EXEC sp_addtype DT, 'CHAR(12)', 'NOT NULL';

CREATE TABLE SanPham (
MaSP CHAR(6) NOT NULL,
TenSP VARCHAR(20),
NgayNhap Date,
DVT CHAR(10),
SoLuongTon INT,
DonGiaNhap money,
)
CREATE TABLE HoaDon (
MaHD CHAR(10) NOT NULL,
NgayLap Date,
NgayGiao Date,
MaKH VARCHAR(10),
DienGiai VARCHAR(20),
)
CREATE TABLE KhachHang (
MaKH VARCHAR(10),
TenKH NVARCHAR(30),
DiaCHi NVARCHAR(40),
DienThoai VARCHAR(10),
)
CREATE TABLE ChiTietHD (
MaHD CHAR(10) NOT NULL,
MaSP CHAR(6) NOT NULL,
SoLuong INT
)

-- 3. Trong Table HoaDon, sửa cột DienGiai thành nvarchar(100).
ALTER TABLE HoaDon
ALTER COLUMN DienGiai NVARCHAR(100)
-- 4. Thêm vào bảng SanPham cột TyLeHoaHong float
ALTER TABLE SanPham
ADD TyLeHoaHong float
-- 5. Xóa cột NgayNhap trong bảng SanPham
ALTER TABLE SanPham
DROP COLUMN NgayNhap
---6. Tạo các ràng buộc khoá chính và khoá ngoại 
ALTER TABLE SanPham
ADD
CONSTRAINT pk_sp primary key(MASP)

ALTER TABLE HoaDon
ADD
CONSTRAINT pk_hd primary key(MaHD)

ALTER TABLE KhachHang
ADD
CONSTRAINT pk_khanghang primary key(MaKH)

ALTER TABLE HoaDon
ADD
CONSTRAINT fk_khachhang_hoadon FOREIGN KEY(MaKH) REFERENCES KhachHang(MaKH)

ALTER TABLE ChiTietHD
ADD
CONSTRAINT fk_hoadon_chitiethd FOREIGN KEY(MaHD) REFERENCES HoaDon(MaHD)

ALTER TABLE ChiTietHD
ADD
CONSTRAINT fk_sanpham_chitiethd FOREIGN KEY(MaSP) REFERENCES SanPham(MaSP)
----- 7.Thêm vào bảng HoaDon các ràng buộc
ALTER TABLE HoaDon
ADD CHECK (NgayGiao > NgayLap)

ALTER TABLE HoaDon
ADD CHECK (MaHD like '[A-Z][A-Z][0-9][0-9][0-9][0-9]')

ALTER TABLE HoaDon
ADD CONSTRAINT df_ngaylap DEFAULT GETDATE() FOR NgayLap
-----8. Thêm vào bảng Sản phẩm các ràng buộc
ALTER TABLE SanPham
ADD CHECK (SoLuongTon > 0 and SoLuongTon < 50)

ALTER TABLE SanPham
ADD CHECK (DonGiaNhap > 0)

ALTER TABLE SanPham
ADD CONSTRAINT df_ngaynhap DEFAULT GETDATE() FOR NgayNhap

ALTER TABLE SanPham
ADD CHECK (DVT like 'KG''Thùng''Hộp''Cái')
--9
INSERT INTO SanPham
VALUES ('sp01', 'SANPHAM1', 'đồng', 14, 45000000,0.5),
		('sp02', 'SANPHAM2', 'đồng', 12, 73000000,0.5),
		('sp03', 'SANPHAM3', 'đồng', 16, 14000000,0.5),
		('sp04', 'SANPHAM4', 'đồng', 25, 85000000,0.5),
		('sp05', 'SANPHAM5', 'đồng', 14, 37000000,0.5);
insert into KhachHang
values ('kh01', 'Văn Tiên', 'HCM', 123456789),
		('kh02', 'Bá Sáng', 'HCM', 123456789),
		('kh03', 'Thiên Tính', 'HCM', 123456789),
		('kh04', 'Hoài Linh', 'HCM', 123456789);
insert into HoaDon
values  ('hd01', '2023/2/15','2023/2/30','kh01','vvvv'),
		('hd02', '2023/3/15','2023/3/30','kh02','vvvv'),
		('hd03', '2023/4/15','2023/4/30','kh03','vvvv'),
		('hd04', '2023/5/15','2023/5/30','kh04','vvvv');
insert into ChiTietHD
values ('hd01','sp01', 10),
		('hd02','sp02', 10),
		('hd03','sp03', 10),
		('hd04','sp04', 10);