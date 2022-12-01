--bài 1a
CREATE TRIGGER bai1a
   ON NHANVIEN
   FOR INSERT 
AS
   IF (SELECT LUONG FROM inserted)<15000
   BEGIN
      PRINT N'Lương > 15000';
	  ROLLBACK TRAN;
   END;
SELECT * FROM NHANVIEN
INSERT INTO [dbo].[NHANVIEN] ([HONV],[TENLOT],[TENNV],[MANV],[NGSINH],[DCHI],[PHAI],[LUONG],[MA_NQL],[PHG])
VALUES(N'Le',N'Hoai',N'Linh','098','09-13-2020','Tay Ninh','Nam',6000,'005',1)
GO
--bài 1b
CREATE TRIGGER bai1b
   on NHANVIEN
   FOR INSERT
AS
   DECLARE @age INT;
   SELECT @age = DATEDIFF(YEAR, NGSINH, GETDATE())+1 FROM inserted;
   IF @age <18 or @age >65
   BEGIN
      PRINT N'Tuổi của nhân viên không hợp lệ 18<= tuổi <= 65';
	  ROLLBACK TRANSACTION;
   END
INSERT INTO [dbo].[NHANVIEN] ([HONV],[TENLOT],[TENNV] ,[MANV] ,[NGSINH],[DCHI],[PHAI],[LUONG],[MA_NQL],[PHG])
     VALUES(N'Le',N'Hoai',N'Linh','456','2021-07-28','Tay Ninh','Nam',25000,'004',1)
GO
---bài 1c
CREATE TRIGGER trg_CheckUpdateOnAddress
   ON NHANVIEN
   FOR UPDATE
AS
   IF EXISTS (SELECT DCHI FROM inserted WHERE DCHI LIKE '%HCM%')
   BEGIN
      PRINT N'Không thể cập nhật nhân viên ở HCM';
	  ROLLBACK TRAN;
   END;
UPDATE [dbo].[NHANVIEN]
   SET [PHAI] = 'Nam'
 WHERE MaNV = '001';
GO

--bài 2a
CREATE TRIGGER bai2a
   ON NHANVIEN
   AFTER INSERT
AS
   DECLARE @male INT, @female INT;
   SELECT @female = COUNT(Manv) FROM NHANVIEN WHERE PHAI = N'Nữ';
   SELECT @male = COUNT(Manv) FROM NHANVIEN WHERE PHAI = N'Nam';
   PRINT N'Tổng số nhân viên là nữ: ' + CAST(@female AS VARCHAR);
   PRINT N'Tổng số nhân viên là nam: ' + CAST(@male AS VARCHAR);

INSERT INTO [dbo].[NHANVIEN]([HONV],[TENLOT],[TENNV],[MANV],[NGSINH],[DCHI],[PHAI],[LUONG],[MA_NQL],[PHG])
VALUES ('Le','Hoai','Linh','547','1994-07-28','Tay Ninh','Nam',80000,'005',1)
GO
 --bài 2b
CREATE TRIGGER bai2b
ON NHANVIEN
AFTER update
AS
IF (SELECT TOP 1 PHAI FROM deleted) != (SELECT TOP 1 PHAI FROM inserted)
   BEGIN
      DECLARE @male INT, @female INT;
      SELECT @female = COUNT(Manv) FROM NHANVIEN where PHAI = N'Nữ';
      SELECT @male = COUNT(Manv) FROM NHANVIEN where PHAI = N'Nam';
      PRINT N'Tổng số nhân viên là nữ: ' + CAST(@female AS VARCHAR);
      PRINT N'Tổng số nhân viên là nam: ' + CAST(@male AS VARCHAR);
   END;
UPDATE [dbo].[NHANVIEN]
   SET [HONV] = 'Nhi'
      ,[PHAI] = N'Nữ'
 WHERE  MaNV = '835'
GO
--bài 2c
CREATE TRIGGER bai2c
   ON DEAN
   AFTER DELETE
AS
   SELECT MA_NVIEN, COUNT(MaDA) AS 'Tổng sô đề án đã tham gia' FROM PHANCONG
      GROUP BY MA_NVIEN
go

--bài 3a
CREATE TRIGGER bai3a ON NHANVIEN
INSTEAD OF DELETE 
AS
BEGIN
   DELETE FROM THANNHAN WHERE MA_NVIEN IN (SELECT MANV FROM deleted)
   DELETE FROM NHANVIEN WHERE MANV IN (SELECT MANV FROM deleted)
END

DELETE NHANVIEN WHERE MANV='001'
SELECT * FROM THANNHAN

--bài 3b
CREATE TRIGGER bai3b ON NHANVIEN
INSTEAD OF INSERT
AS 
BEGIN 
INSERT INTO PHANCONG VALUES((SELECT MANV FROM INSERTED),1,1,100)
END
INSERT INTO NHANVIEN
VALUES('Le','Hoai','Linh','643','2020-08-27','Tay Ninh','Nam',25000,'005',1)