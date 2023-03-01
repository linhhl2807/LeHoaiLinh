create database QLDA1
drop database QLSV
create database test
exec spClearDB '' ;
create database QuanLyDeAn
use QuanLyDeAn
Create	table NHANVIEN
(
	HONV	nvarchar(15),
	TENLOT	nvarchar(15),
	TENNV	nvarchar(15) not null,
	MANV	char	(9) not null,
	NGSINH	Datetime,
	DCHI	nvarchar(30),
	PHAI	nvarchar(3),
	LUONG	float,
	MA_NQL	char(9),
	PHG	int,
	constraint PK_NHANVIEN primary key(MANV),
	
)

Create	table PHONGBAN
(
	TENPHG	nvarchar(15),
	MAPHG	int not null,
	TRPHG	char(9),
	NG_NHANCHUC Datetime
	constraint PK_PHONGBAN primary key(MAPHG)
)


Create table DIADIEM_PHG
(
	MAPHG	int,
	DIADIEM nvarchar(50)
	constraint PK_DIADIEM_PHG primary key (MAPHG, DIADIEM)
)

Create table DEAN
(
	TENDA	nvarchar(15),
	MADA	int,
	DDIEM_DA nvarchar(50),
	PHONG	int,
	constraint PK_DEAN primary key(MADA)
)

Create table CONGVIEC
(
	MADA int,
	STT  int,
	TEN_CONG_VIEC nvarchar(50),
	constraint PK_CONGVIEC primary key (MADA, STT)
	
)

Create table PHANCONG
(
	MA_NVIEN char(9),
	MADA	 int,
	THOIGIAN float,
	constraint PK_PHANCONG primary key (MA_NVIEN, MADA)
)

Create	table THANNHAN
(
	MA_NVIEN char(9),
	TENTN	 nvarchar(15),
	PHAI	 nvarchar(3),
	NGSINH	Datetime,
	QUANHE 	nvarchar(15),
	constraint PK_THANNHAN primary key (MA_NVIEN, TENTN) 
)


----------------------------------*tao khoa ngoai*---------------------------
--tao khoa ngoai cho bang NHANVIEN
alter table NHANVIEN
add 
constraint FK_NHANVIEN_NHANVIEN foreign key(MA_NQL) references NHANVIEN(MANV),
constraint FK_NHANVIEN_PHONGBAN foreign key(PHG) references PHONGBAN(MAPHG)
--tao khoa ngoai cho bang PHONGBAN
alter table PHONGBAN
add
constraint FK_PHONGBAN_NHANVIEN foreign key(TRPHG) references NHANVIEN(MANV)
--tao khoa ngoai cho bang DIADIEM_PHG
alter table DIADIEM_PHG
add
constraint FK_DIADIEMPHG_PHONGBAN foreign key(MAPHG) references PHONGBAN(MAPHG)
--tao khoa ngoai cho bang DEAN
alter table DEAN
add
constraint FK_DEAN_PHONGBAN foreign key(PHONG) references PHONGBAN(MAPHG)
--tao khoa ngoai cho CONGVIEC
alter table CONGVIEC
add
constraint FK_CONGVIEC_DEAN foreign key(MADA) references DEAN(MADA)
--tao khoa ngoai cho PHANCONG
alter table PHANCONG
add
constraint FK_PHANCONG_CONGVIEC foreign key(MADA, STT) references CONGVIEC(MADA, STT)
--tao khoa ngoai cho THANNHAN
/*alter table THANNHAN
add
*/
alter table PHANCONG
add
constraint FK_PHANCONG_DEAN foreign key(MADA) references DEAN(MADA),
constraint FK_PHANCONG_NHANVIEN foreign key(MA_NVIEN) references NHANVIEN(MANV)
alter table THANNHAN
add constraint FK_THANNHAN_NHANVIEN foreign key(MA_NVIEN) references NHANVIEN(MANV)
--------------------------Chen du lieu -------------------------------------------
set dateformat dmy
select * from nhanvien
delete  nhanvien
insert into NHANVIEN values(N'Vương', N'Ngọc', N'Quyền', 
'006', '01/01/1965', N'45 Trưng Vương Hà Nội', N'Nữ', 55000, null, null)

insert into NHANVIEN values(N'Nguyễn', N'Thanh', N'Tùng', 
'005', '20/08/1962', N'222 Nguyễn Văn Cừ TPHCM', N'Nam', 40000, NULL, null) /*006*/

insert into NHANVIEN values(N'Lê', N'Thị', N'Nhàn', 
'001', '01/02/1967', N'291 Hồ Văn Huê TPHCM', N'Nữ', 43000, NULL, null)/*006*/

insert into NHANVIEN values(N'Nguyễn', N'Mạnh', N'Hùng', 
'004', '04/03/1967', N'95 Bà Rịa Vũng Tàu', N'Nam', 38000, NULL, null)/*005*/

insert into NHANVIEN values(N'Trần', N'Thanh', N'Tâm', 
'003', '04/05/1957', N'34 Mai Thị Lựu TPHCM', N'Nam', 25000, NULL, null) /*005*/

insert into NHANVIEN values(N'Bùi', N'Thúy', N'Bư', 
'007', '11/03/1954', N'332 Nguyễn Thái Học TPHCM', N'Nam', 25000, NULL, null)/*001*/

insert into NHANVIEN values(N'Trần', N'Hồng', N'Quang', 
'008', '01/09/1967', N'80 Lê Hồng Phong TPHCM', N'Nam', 25000, NULL, null) /*001*/

insert into NHANVIEN values(N'Đinh', N'Bá', N'Tiến', 
'009', '12/01/1960', N'119 Cống Quỳnh TPHCM', N'Nam', 30000, NULL, null) /*005*/

--update cho nhan vien Dinh Ba tien
/*book online :
	UPDATE titles
    SET ytd_sales = t.ytd_sales + s.qty
    FROM titles t, sales s
    WHERE t.title_id = s.title_id
*/
select *
from NHANVIEN

-- nhap du lieu cho PHONGBAN

insert into PHONGBAN values(N'Nghiên Cứu', 5, '005', '22/05/1987')
insert into PHONGBAN values(N'Diều Hành', 4, '008', '01/01/1985')
insert into PHONGBAN values(N'Quản Lý', 1, '006', '19/06/1971')
SELECT * FROM PHONGBAN
--cap nhat lai du lieu PHONG cho nhan vien

update NHANVIEN
set    PHG = 5
where  MANV = '009'

update NHANVIEN
set    PHG = 5
where  MANV = '005'

update NHANVIEN
set    PHG = 4
where  MANV = '007'

update NHANVIEN
set    PHG = 4
where  MANV = '001'

update NHANVIEN
set    PHG = 5
where  MANV = '003'

update NHANVIEN
set    PHG = 5
where  MANV = '004'

update NHANVIEN
set    PHG = 4
where  MANV = '008'

update NHANVIEN
set    PHG = 1
where  MANV = '006'

update NHANVIEN
set    PHG = 5
where  MANV = '009'

select *
from NHANVIEN

--cap nhat du lieu cho bang DIADIEM_PHG

insert into DIADIEM_PHG values(1, 'TP HCM')
insert into DIADIEM_PHG values(4, 'HA NOI')
insert into DIADIEM_PHG values(5, 'VUNG TAU')

select *
from DIADIEM_PHG

--cap nhat du lieu cho bang DEAN
insert into DEAN values(N'Sản phẩm X', 1, 'VUNG TAU', 5)
insert into DEAN values(N'Sản phẩm Y', 2, 'NHA TRANG', 5)
insert into DEAN values(N'Sản phẩm Z', 3, 'TP HCM', 5)
insert into DEAN values(N'Tin học hóa', 10, 'HA NOI', 4)
insert into DEAN values(N'Cap Quang', 20, 'TP HCM', 1)
insert into DEAN values(N'Đào Tạo', 30, 'HA NOI', 4)

select *
from DEAN

--cap nhat du lieu cho bang CONGVIEC

insert into CONGVIEC values(1, 1, N'Thiết kế sản phẩm X')
insert into CONGVIEC values(1, 2, N'Thử nghiệm sản phẩm X')
insert into CONGVIEC values(2, 1, N'Sản xuất sản phẩm Y')
insert into CONGVIEC values(2, 2, N'Quảng cáo sản phẩm Y')
insert into CONGVIEC values(3, 1, N'Khuyến mãi sản phẩm Z')
insert into CONGVIEC values(10, 1, N'Tin học hóa nhân sự tiền lương')
insert into CONGVIEC values(10, 2, N'Tin học hóa phòng kinh doanh')
insert into CONGVIEC values(20, 1, N'lắp đặt cáp quang')
insert into CONGVIEC values(30, 1, N'Đào tạo nhân viên maketing')
insert into CONGVIEC values(30, 2, N'Đào tạo chuyên viên thiết kế')

select *
from CONGVIEC

--cap nhat du lieu cho bang THANNHAN
insert into THANNHAN values('005', N'Quang', N'Nữ', '05/04/1976', N'Con gái')
insert into THANNHAN values('005', N'Khang', N'Nam', '25/10/1973', N'Con trai')
insert into THANNHAN values('005', N'Dương', N'Nữ', '03/05/1948', N'Vợ chồng')
insert into THANNHAN values('001', N'Đăng', N'Nam', '19/02/1932', N'Vợ chồng')
insert into THANNHAN values('009', N'Duy', N'Nam', '01/01/1978', N'Con trai')
insert into THANNHAN values('009', N'Châu', N'Nữ', '30/12/1978', N'Con gái')
insert into THANNHAN values('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')

select *
from THANNHAN

--chen du lieu cho bang PHANCONG
insert into PHANCONG values('009', 1, 32)
insert into PHANCONG values('009', 2, 8)
insert into PHANCONG values('004', 3, 40)
insert into PHANCONG values('003', 1, 20)
insert into PHANCONG values('003', 2, 20)
insert into PHANCONG values('008', 10,35)
insert into PHANCONG values('008', 30,5)
insert into PHANCONG values('001', 30,20)
insert into PHANCONG values('001', 20,15)
insert into PHANCONG values('006', 20,30)
insert into PHANCONG values('005', 3, 10)
insert into PHANCONG values('005', 10,10)
insert into PHANCONG values('005', 20,10)
insert into PHANCONG values('007', 30,30)
insert into PHANCONG values('007', 10,10)

select *
from	PHANCONG

--===================###CAC CAU TRUY VAN###===========================
--Cac cau truy van don gian
--1 Tim nhung nhan vien lam viec o phong so 4

select NV.MANV, NV.HONV, NV.TENLOT, NV.TENNV
from NHANVIEN NV
where PHG = 4

--2 Tim nhung nhan vien co muc luong ten 30000

select NV.MANV, NV.HONV, NV.TENLOT, NV.TENNV, NV.LUONG, NV.PHG
from NHANVIEN NV
where NV.LUONG > 30000

--3
	/*
	Tim cac nhan vien co muc luong tren 25000 o PHG = 4 hay
	cac nhan vien co muc luong tren 30000 o PHG = 5
	*/

select NV.MANV, NV.HONV, NV.TENLOT, NV.TENNV, NV.LUONG, NV.PHG
from NHANVIEN NV
where NV.LUONG > 25000 and PHG = 4 or NV.LUONG > 30000 and PHG = 5

--4 cho biet ho ten day du cua cac nhan vien o TPHCM

select NV.MANV, NV.HONV, NV.TENLOT, NV.TENNV
from NHANVIEN NV, DIADIEM_PHG
where NV.PHG = DIADIEM_PHG.MAPHG and DIADIEM_PHG.DIADIEM = 'TP HCM'

select *
from NHANVIEN


--5 cho biet ngay sinh va dia chi cua nhan vien DInh Ba Tien

select NV.NGSINH, NV.DCHI
from   NHANVIEN NV
where  NV.HONV = 'Đinh' and NV.TENLOT = 'Bá' and NV.TENNV = 'Tiến'


SELECT MANV, HONV + ' ' + TENLOT + ' ' + TENNV AS TENNHANVIEN
FROM NHANVIEN NV, PHONGBAN PB
WHERE NV.PHG = PB.MAPHG AND TENPHG = N'Nghiên Cứu'

SELECT MANV, HONV, TENLOT, TENNV
FROM NHANVIEN NV
WHERE MANV IN 
	(SELECT MA_NVIEN 
	FROM  PHANCONG PC , DEAN DA 
	WHERE PC.MADA = DA.MADA AND TENDA = N'Sản phẩm X')
AND MANV IN 
	(SELECT MA_NVIEN 
	FROM  PHANCONG PC , DEAN DA 
	WHERE PC.MADA = DA.MADA AND TENDA = N'Sản phẩm Y')
SELECT * FROM PHANCONG

SELECT MANV, HONV, TENLOT, TENNV
FROM NHANVIEN NV, PHANCONG PC1 , DEAN DA1, PHANCONG PC2 , DEAN DA2 
WHERE NV. MANV = PC1.MA_NVIEN AND 
PC1.MADA = DA1.MADA AND 
DA1.TENDA = N'Sản phẩm X' AND
NV.MANV = PC2.MA_NVIEN AND 
PC2.MADA = DA2.MADA AND
DA2.TENDA = N'Sản phẩm Y'



SELECT PB.MAPHG, TENPHG, COUNT(*) 
FROM DIADIEM_PHG DDP, PHONGBAN PB
WHERE DDP.MAPHG = PB.MAPHG
GROUP BY PB.MAPHG, TENPHG
HAVING COUNT(*) >1

SELECT DISTINCT MAPHG
FROM DIADIEM_PHG DDP1
WHERE EXISTS 
(SELECT * FROM DIADIEM_PHG  DDP2
WHERE DDP2.MAPHG = DDP1.MAPHG 
AND DDP2.DIADIEM <> DDP1.DIADIEM)




SELECT * FROM DIADIEM_PHG

SELECT PHG, TENPHG, AVG (LUONG)
FROM NHANVIEN NV, PHONGBAN PB
WHERE NV.PHG = PB.MAPHG
GROUP BY PHG, TENPHG
HAVING AVG (LUONG) >= ALL ( SELECT AVG (LUONG)
			FROM NHANVIEN
			GROUP BY PHG)

SELECT PHG, TENPHG, AVG (LUONG)
FROM NHANVIEN NV, PHONGBAN PB
WHERE NV.PHG = PB.MAPHG
GROUP BY PHG, TENPHG
HAVING AVG (LUONG) > 3000

SELECT DISTINCT MA_NVIEN, TENNV
FROM PHANCONG PC1, NHANVIEN NV
WHERE NV.MANV = PC1.MA_NVIEN AND NOT EXISTS (SELECT * FROM DEAN DA1
		WHERE PHONG = 5 AND NOT EXISTS (SELECT * FROM PHANCONG PC2
				WHERE PC2.MADA = DA1.MADA AND 
				PC2.MA_NVIEN = PC1.MA_NVIEN))
SELECT NV1.*
FROM NHANVIEN nv1, NHANVIEN NV2
WHERE NV1.MA_NQL = NV2.MANV
		AND NV2.HONV = N'Nguyễn' AND 
		NV2.TENLOT = N'Thanh' AND 
		NV2.TENNV = N'Tùng'
SELECT * FROM NHANVIEN
SELECT NV.*
FROM PHANCONG PC, DEAN DA, NHANVIEN NV
WHERE NV.MANV = PC.MA_NVIEN AND PC.MADA = DA.MADA
 AND DCHI = 'TP.HCM' AND NV.PHG NOT IN 
(SELECT MAPHG 
FROM DIADIEM_PHG
G
WHERE DIADIEM ='TP.HCM')

SELECT NV.*
FROM PHANCONG PC, DEAN DA, NHANVIEN NV
WHERE NV.MANV = PC.MA_NVIEN AND PC.MADA = DA.MADA
 AND NV.PHG NOT IN 
(SELECT MAPHG 
FROM DIADIEM_PHG
WHERE DIADIEM ='TP.HCM')

SELECT PHG,TENPHG, COUNT(*) AS SONV
FROM NHANVIEN NV, PHONGBAN PB
WHERE NV.PHG = PB.MAPHG
GROUP BY PHG,TENPHG
HAVING AVG(LUONG) > 32000

--18.
SELECT NV.PHG,TENPHG,NV1.TENNV, COUNT(*)
FROM NHANVIEN NV, PHONGBAN PB, NHANVIEN NV1 
WHERE NV.PHG = PB.MAPHG
AND PB.TRPHG = NV1.MANV
GROUP BY NV.PHG,TENPHG,NV1.TENNV
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
			FROM NHANVIEN
			GROUP BY PHG)

--19.
SELECT MANV,HONV,TENLOT,TENNV,MAPHG,TENPHG,LUONG
FROM NHANVIEN NV1, PHONGBAN PB
WHERE NV1.PHG = PB.MAPHG
AND LUONG = (SELECT MAX(LUONG)
		FROM NHANVIEN
		WHERE PHG = NV1.PHG )

--20. 
SELECT MA_NVIEN,COUNT(*) AS SLDA, SUM(THOIGIAN) AS TONG
FROM PHANCONG
GROUP BY MA_NVIEN
HAVING COUNT(*) > 2 AND SUM(THOIGIAN)> 10

--21.
SELECT MANV, TENNV
FROM NHANVIEN, DEAN DA1, PHANCONG PC1
WHERE MANV = MA_NVIEN AND PC1.MADA=DA1.MADA 
AND TENDA=N'Sản phẩm X'
AND NOT EXISTS(SELECT *
	FROM DEAN DA2, PHANCONG PC2
	WHERE PC2.MADA=DA2.MADA 
		AND TENDA=N'Sản phẩm Y' 
		AND PC1.MA_NVIEN=PC2.MA_NVIEN)

SELECT MANV, TENNV
FROM NHANVIEN, DEAN DA1, PHANCONG PC1
WHERE MANV = MA_NVIEN AND PC1.MADA=DA1.MADA 
AND TENDA=N'Sản phẩm X'
AND MANV NOT IN(SELECT PC2.MA_NVIEN
	FROM DEAN DA2, PHANCONG PC2
	WHERE PC2.MADA=DA2.MADA 
		AND TENDA=N'Sản phẩm Y' 
		)
--23.
SELECT MA_NVIEN, COUNT (*)
FROM PHANCONG PC 
GROUP BY MA_NVIEN
HAVING COUNT(*) =1

SELECT MA_NVIEN
FROM PHANCONG PC1
WHERE NOT EXISTS (SELECT * 
		FROM PHANCONG PC2
		WHERE PC2.MA_NVIEN = PC1.MA_NVIEN
		AND PC2.MADA <> PC1.MADA)
		
--22.
SELECT MA_NVIEN 
FROM PHANCONG PC, DEAN DA
WHERE PC.MADA = DA.MADA 
AND TENDA = N'Sản phẩm X'
AND MA_NVIEN IN (SELECT MA_NVIEN
		FROM PHANCONG
		GROUP BY MA_NVIEN
		HAVING COUNT(*) =1
		)

SELECT MA_NVIEN 
FROM PHANCONG PC, DEAN DA
WHERE PC.MADA = DA.MADA 
AND TENDA = N'Sản phẩm X'
AND (SELECT COUNT(*)
		FROM PHANCONG PC1
		WHERE PC1.MA_NVIEN = PC.MA_NVIEN
		) = 1

SELECT MA_NVIEN
FROM PHANCONG PC1, DEAN DA1
WHERE PC1.MADA = DA1.MADA
AND TENDA = N'Sản phẩm X'
AND NOT EXISTS (SELECT * 
		FROM PHANCONG PC2 
		WHERE PC2.MA_NVIEN = PC1.MA_NVIEN
		AND PC2.MADA <> PC1.MADA)
SELECT * FROM PHANCONG


SELECT DISTINCT MA_NVIEN FROM PHANCONG
SELECT * FROM PHANCONG

SELECT MA_NVIEN
FROM PHANCONG
WHERE MADA = 20
UNION
SELECT MA_NVIEN
FROM PHANCONG
WHERE MADA = 3

SELECT DISTINCT MA_NVIEN
FROM PHANCONG
WHERE MADA = 20 OR MADA = 3

SELECT MA_NVIEN
FROM PHANCONG
WHERE MADA = 3 AND MA_NVIEN NOT IN (SELECT MA_NVIEN
				FROM PHANCONG
				WHERE MADA = 20)

SELECT MA_NVIEN
FROM PHANCONG
WHERE MADA = 3 AND MA_NVIEN IN (SELECT MA_NVIEN
				FROM PHANCONG
				WHERE MADA = 20)
SELECT TRPHG
FROM PHONGBAN 
UNION 
SELECT MA_NQL
FROM NHANVIEN

SELECT MANV
FROM NHANVIEN
WHERE MANV IN (SELECT TRPHG FROM PHONGBAN)
OR MANV IN (SELECT MA_NQL FROM NHANVIEN)