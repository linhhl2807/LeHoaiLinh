﻿--1:
select *
from NHANVIEN
--2:
select MANV, HOVN, TENLOT, TENNV
from NHANVIEN 
where PHG = 5
--3:
select MANV, HOVN, TENLOT, TENNV, LUONG, PHG
from NHANVIEN 
where LUONG > 6000000
--4:
select MANV, HOVN, TENLOT, TENNV, LUONG, PHG
from NHANVIEN 
where LUONG > 6500000 and PHG = 1 or LUONG > 5000000 and PHG = 4
--5:
select MANV, HONV, TENLOT, TENNV
from NHANVIEN , DIADIEM_PHG
where NHANVIEN.PHG = DIADIEM_PHG.MAPHG and DIADIEM_PHG.DIADIEM = 'QUANG NGAI'

select *
from NHANVIEN
--6:
select HONV + ' ' +TENLOT+ ' ' +TENNV as 'Họ Và Tên'
from NHANVIEN
where NHANVIEN.HONV like N'N%'
-----7. Cho biết ngày sinh và địa chỉ của nhân viên Cao Thanh Huyền
SELECT NHANVIEN.NGSINH, NHANVIEN.DCHI
FROM NHANVIEN
WHERE NHANVIEN.HONV = N'Cao' AND
		  NHANVIEN.TENLOT = N'Thanh' AND
		  NHANVIEN.TENNV = N'Huyền'
--8:
SELECT * FROM NHANVIEN
WHERE NGSINH BETWEEN 1955 AND 1975;
--9:
Select HONV + ' ' +TENLOT+ ' ' +TENNV as 'Họ Và Tên' , YEAR(NGSINH) as 'Năm Sinh'
from NHANVIEN
--10. Cho biết họ tên và tuổi của tất cả các nhân viên

select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', (2023 - YEAR(NGSINH)) as 'Tuổi' from NHANVIEN

--11. Tìm tên những người trưởng phòng của từng phòng ban

select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên Trưởng Phòng' from PHONGBAN,NHANVIEN
where PHONGBAN.TRPHG = NHANVIEN.MANV

-----12.Tìm tên và địa chỉ của tất cả các nhân viên của phòng 'Điều hành'

select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', DCHI from NHANVIEN inner join PHONGBAN on NHANVIEN.PHG = PHONGBAN.MAPHG
where PHONGBAN.MAPHG = 4

--13. Với mỗi đề án ở Tp Quảng Ngãi, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.

select TENDA, TENPHG, HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', NG_NHANCHUC 
from NHANVIEN inner join PHONGBAN 
ON NHANVIEN.PHG = PHONGBAN.MAPHG 
inner join DEAN ON DEAN.PHONG = PHONGBAN.MAPHG
where PHONGBAN.TRPHG = NHANVIEN.MANV and DCHI like '%Tp Quảng Ngãi'

--14. Tìm tên những nữ nhân viên và tên người thân của họ

select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', TENTN as 'Tên người thân' 
from NHANVIEN inner join THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN
where NHANVIEN.PHAI = N'Nữ'

-----15. Với mỗi nhân viên, cho biết họ tên của nhân viên, họ tên trưởng phòng của phòng ban mà nhân viên đó đang làm việc.

select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as 'Họ và tên nhân viên', QL.HONV+ ' ' + QL.TENLOT + ' ' + QL.TENNV as 'Họ và tên quản lí'
	from NHANVIEN NV,NHANVIEN QL
	where NV.MA_NQL = QL.MANV

--16. Tên những nhân viên phòng Nghiên cứu có tham gia vào đề án "Xây dựng nhà máy chế biến thủy sản"

select HONV+ ' ' + TENLOT + ' ' + TENNV as 'Họ và tên' 
from NHANVIEN inner join DEAN ON NHANVIEN.PHG = DEAN.PHONG
where DEAN.TENDA= 'Xây dựng nhà máy chế biến thủy sản'

--17. Cho biết tên các đề án mà nhân viên Trần Thanh Tâm đã tham gia.

select TENDA as 'Tên đề án'
from NHANVIEN inner join DEAN ON NHANVIEN.PHG = DEAN.PHONG
where NHANVIEN.HONV = N'Trần' and NHANVIEN.TENLOT = N'Thanh' and NHANVIEN.TENNV = N'Tâm'