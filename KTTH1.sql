﻿-- Tạo login cho trưởng nhóm trưởng nhóm
CREATE LOGIN TruongNhom WITH PASSWORD = '12042002';
GO

-- Tạo user cho trưởng nhóm trưởng nhóm
USE AdventureWorks2008R2;
CREATE USER TruongNhom FOR LOGIN TruongNhom;
GO

-- Tạo login cho nhân viên NV
CREATE LOGIN NhanVien WITH PASSWORD = '12042002';
GO

-- Tạo user cho nhân viên NV
USE AdventureWorks2008R2;
CREATE USER NhanVien FOR LOGIN NhanVien;
GO

-- Tạo login cho nhân viên QuanLy
CREATE LOGIN QuanLy WITH PASSWORD = '12042002';
GO

-- Tạo user cho nhân viên QL
USE AdventureWorks2008R2;
CREATE USER QuanLy FOR LOGIN QuanLy;
GO

--b. Phân quyền cho các nhân viên:

-- Phân quyền cho trưởng nhóm TN
USE AdventureWorks2008R2;
GRANT SELECT, UPDATE,DELETE ON Production.ProductInventory TO TruongNhom;
GO

-- Phân quyền cho nhân viên NV
USE AdventureWorks2008R2;
GRANT SELECT,UPDATE, DELETE ON Production.ProductInventory TO NhanVien;
GO

-- Phân quyền cho nhân viên QL
USE AdventureWorks2008R2;
GRANT SELECT ON Production.ProductInventory TO QuanLy;
GO

-- Admin phải có quyền CONTROL trên tất cả các đối tượng trong cơ sở dữ liệu
USE AdventureWorks2008R2;
GRANT CONTROL TO [Admin];
GO

--c. Đăng nhập và thực hiện các yêu cầu:

-- Đăng nhập với tài khoản của trưởng nhóm TN
USE AdventureWorks2008R2;
EXECUTE AS USER = 'TN';

-- Sửa 1 dòng dữ liệu tùy ý trong bảng Production.ProductInventory
UPDATE Production.ProductInventory
SET Quantity = 20
WHERE ProductID = 1;

-- Kết thúc quyền của trưởng nhóm TN
REVERT;

-- Đăng nhập với tài khoản của nhân viên NV
USE AdventureWorks2008R2;
EXECUTE AS USER = 'NV';

-- Xóa 1 dòng dữ liệu tùy ý trong bảng Production.ProductInventory
DELETE FROM Production.ProductInventory
WHERE ProductID = 2;

-- Kết thúc quyền của nhân viên NV
REVERT;

-- Đăng nhập với tài khoản của nhân viên QL
USE AdventureWorks2008R2;
EXECUTE AS USER = 'QL';

-- Xem lại kết quả thực hiện của trưởng nhóm TN và nhân viên NV
SELECT * FROM Production.ProductInventory;

-- Kết thúc quyền của nhân viên QL
REVERT;

--d. Ai có thể sửa được dữ liệu bảng Production.Product ?

--Chỉ có trưởng nhóm TN và nhân viên QL có thể sửa được dữ liệu bảng Production.Product, vì họ được phân quyền SELECT và UPDATE trên bảng này.

--e. Thu hồi quyền cấp cho nhân viên NV:

-- Thu hồi quyền của nhân viên NV
USE AdventureWorks2008R2;
REVOKE SELECT, DELETE ON Production.ProductInventory FROM NV;
GO

-- Xóa user của nhân viên NV
USE AdventureWorks2008R2;
DROP USER NV;
GO
--f.Vô hiệu hóa
ALTER LOGIN TruongNhom DISABLE;
ALTER LOGIN NhanVien DISABLE;
--CÂU 2
--T1
backup database AdventureWorks2008R2 to disk = 'd:\bk\Adven.bak'
--T2
UPDATE Production.Product
SET SafetyStockLevel = SafetyStockLevel * 1.1;
--T3
backup database AdventureWorks2008R2 to disk = 'd\sql\Adven_Diff.bak' with differential
--T4
truncate table Person.Emailaddress;
--T6
INSERT INTO Person.ContactType(ContactTypeID,Name, ModifiedDate)
VALUES
    (14, 'Linh', '2002-07-28');
--T7
backup log AdventureWorks2008R2 to disk = 'D:\sql\Adven.trn'
--T8
DROP DATABASE AdventureWorks2008R2;
--T9
restore log AdventureWorks2008R2 from disk = 'D:\sql\Adven.trn'