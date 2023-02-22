select *
from NHANVIEN
where PHG = 4	
GO
select *
from NHANVIEN
where LUONG > 30000
GO
select *
from NHANVIEN
where ( LUONG > 25000 AND PHG = 4 ) OR ( LUONG > 30000 AND PHG = 5 )
GO
select HONV, TENLOT, TENNV, DCHI
from NHANVIEN
where DCHI LIKE '%TP HCM' OR DCHI LIKE '%Tp Hồ Chí Minh'
GO
select HONV, TENLOT, TENNV
from NHANVIEN
where HONV LIKE 'N%'
GO
