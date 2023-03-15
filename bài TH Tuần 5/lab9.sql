--Câu 1
Create trigger BT1 on NHANVIEN
for UPDATE
AS
if( select TenNV from inserted)=1
begin
print 'khong duoc phep';
rollback transaction
end;