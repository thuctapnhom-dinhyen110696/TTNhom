--them sua xoa tim kiem nhan vien
create proc them_nv (
@manv char(10),
@ten nvarchar(50),
@gt nchar(10),
@ns datetime,
@diachi nvarchar(50),
@luong money
)
as 
insert into NHANVIEN(MaNV,TenNV,GioiTinh,NgaySinh,DiaChi,Luong)
values (@manv,@ten,@gt,@ns,@diachi,@luong)
go
  --xóa
create proc xoa_nv (
@manv char(10)
)
as 
delete NHANVIEN where MaNV=@manv
go
  --sửa
create proc sua_nv (
@manv char(10),
@ten nvarchar(50),
@gt nchar(10),
@ns datetime,
@diachi nvarchar(50),
@luong money
)
as
begin
update NHANVIEN
set TenNV=@ten,GioiTinh=@gt,NgaySinh=@ns,DiaChi=@diachi,Luong=@luong
where MaNV=@manv
end
go
  --Tìm kiếm
create proc load_nv (
@manv char(10)
)
as select *from NHANVIEN where MaNV like @manv 
go

--kho
create proc them_kho(
@mak char(10),
@tenk nvarchar(50),
@vitri nvarchar(100),
@manv char(10)
) as insert into KHO(MaKho,TenKho,ViTri,MaNV)
values (@mak,@tenk,@vitri,@manv)
go 

create proc sua_kho(
@mak char(10),
@tenk nvarchar(50),
@vitri nvarchar(50),
@manv char(10)
) as update KHO
set TenKho=@tenk,ViTri=@vitri,MaNV=@manv
where MaKho=@mak
go

create proc xoa_kho(
@mak char(10)
) as 
delete KHO where MaKho=@mak
go
--Hàng hóa
  --thêm
create proc them_hh (
@mahh char(10),
@tenhh nvarchar(50),
@noisx nvarchar(50),
@donvi nvarchar(10),
@makho char(10),
@gia money
) as
insert into HANGHOA(MaHH,TenHH,NoiSX,DonVi,MaKho,Gia)
values (@mahh,@tenhh,@noisx,@donvi,@makho,@gia)
go

create proc sua_hh(
@mahh char(10),
@tenhh nvarchar(50),
@noisx nvarchar(50),
@donvi nvarchar(10),
@makho char(10),
@gia money
) as
update HANGHOA
set TenHH=@tenhh,NoiSX=@noisx,DonVi=@donvi,MaKho=@makho,Gia=@gia
where MaHH=@mahh
go 

create proc xoa_hh(
@mahh char(10)
) as select * from HANGHOA 
delete HANGHOA where MaHH=@mahh
go
--tìm kiếm
 create proc load_hh(
 @mahh char(10)
 ) AS select *from HANGHOA where MaHH like @mahh
 go

 --hóa đơn bán
 create proc them_hdb(
 @mahd char(10),
 @ngay datetime,
 @manv char(10),
 @makh char(10),
 @tong money
 ) as
 insert into HOADONBAN(MaHDB,NgayBan,MaNV,MaKH,TongTien)
 values(@mahd,@ngay,@manv,@makh,@tong)
 go

 create proc sua_hdb(
 @mahd char(10),
 @ngay datetime,
 @manv char(10),
 @makh char(10),
 @tong money
 ) as
 update HOADONBAN
 set NgayBan=@ngay,MaNV=@manv,MaKH=@makh,TongTien=@tong
 where MaHDB=@mahd
 go

  create proc xoa_hdb(
  @mahd char(10)
  ) as
  delete HOADONBAN where MaHDB=@mahd
  go
  create proc load_hdb(
 @mahdb char(10)
 ) AS select *from HOADONBAN where MaHDB like @mahdb
 go
 --tự động tính tổng hóa đơn
 create proc TT(@MaHDB char(10))
as 
begin
select  sum(ThanhTien) as TongTien
from CHITIETPHIEUBAN,HOADONBAN
where CHITIETPHIEUBAN.MaHDB=HOADONBAN.MaHDB and HOADONBAN.MaHDB=@MaHDB
end 
go
TT 'PB01'
 --chi tiết phiếu bán
create proc xem_gia(@mapb char(10),@mahh char(10))
as
begin 
select HANGHOA.MaHH,HANGHOA.Gia
from CHITIETPHIEUBAN,HANGHOA
WHERE CHITIETPHIEUBAN.MaHH=HANGHOA.MaHH and HANGHOA.MaHH=@mahh and CHITIETPHIEUBAN.MaHDB=@mapb
END
go

 create proc them_ctpb(
 @mahh char(10),
 @sl int,
 @gia money,
 @tt money
 ) as 
 insert into CHITIETPHIEUBAN (MaHH,SoLuong,DonGia,ThanhTien)
 values (@mahh,@sl,@gia,@tt)
 go

 create proc xem_ctpb(@mahdb char(10)) 
 as
 begin
   select TenHH,SoLuong,CHITIETPHIEUBAN.DonGia,ThanhTien
   from CHITIETPHIEUBAN,HANGHOA
   where MaHDB=@mahdb AND CHITIETPHIEUBAN.MaHH=HANGHOA.MaHH
end
go 
--tự động tính thành tiền 
create proc thanhtien(@sl int,@gia money,@tt money) as
begin
select SoLuong=@sl,DonGia=@gia
from CHITIETPHIEUBAN
where SoLuong!=null and DonGia!=null and @tt=(select SoLuong*DonGia from CHITIETPHIEUBAN)
end

 create proc sua_ctpb(
 @mahdb char(10),
 @mahh char(10),
 @sl int
 ) as 
 update CHITIETPHIEUBAN 
 set SoLuong=@sl,ThanhTien=@sl*DonGia
 where MaHH=@mahh and MaHDB=@mahdb
 go
 
 create proc xoa_ctpb(
 @mahdb char(10),
 @mahh char(10)
 ) as
 delete CHITIETPHIEUBAN WHERE MaHDB=@mahdb AND MaHH=@mahh
 go
 --hóa đơn nhập
 create proc them_hdn(
 @mahd char(10),
 @ngay date,
 @manv char(10)
 ) as 
 insert into HOADONNHAP (MaHDN,NgayNhap,MaNV)
 values (@mahd,@ngay,@manv)
 go

 create proc sua_hdn(
 @mahd char(10),
 @ngay date,
 @manv char(10)
 ) as
 update HOADONNHAP 
 set NgayNhap=@ngay,MaNV=@manv
 where MaHDN=@mahd
 go

 create proc xoa_hdn(
 @ma char(10)
 ) as
 delete HOADONNHAP where MaHDN=@ma 
 go
 --chi tiết phiếu nhập
 create proc them_ctpn(
 @mahdn char(10),
 @mahh char(10),
 @sl int,
 @gia money,
 @tt money
 ) as
 insert into CHITIETPHIEUNHAP (MaHDN,MaHH,SoLuong,DonGia,ThanhTien)
 values (@mahdn,@mahh,@sl,@gia,@tt)
 go

 create proc sua_ctpn(
 @mahdn char(10),
 @mahh char(10),
 @sl int,
 @gia money,
 @tt money
 ) as
 update CHITIETPHIEUNHAP 
 set SoLuong=@sl,DonGia=@gia,ThanhTien=@tt
 where MaHDN=@mahdn and MaHH=@mahh
 go

 create proc xoa_ctpn(
 @mahdn char(10),
 @mahh char(10)
 ) as
 delete CHITIETPHIEUNHAP where  MaHH=@mahh and MaHDN=@mahdn
 go
 create proc xem_ctpn(@mahdn char(10)) 
 as
 begin
   select TenHH,SoLuong,CHITIETPHIEUNHAP.DonGia,ThanhTien
   from CHITIETPHIEUNHAP,HANGHOA
   where MaHDN=@mahdn AND CHITIETPHIEUNHAP.MaHH=HANGHOA.MaHH
end
go 
xem_ctpn 'PN01'
--trigger 
   --xóa mã hóa đơn bán đồg thời xóa mã bên bảg chi tiết bán 
 create trigger tg_hdb on HOADONBAN 
 for delete
 as 
 begin 
 declare @mahdB char(10)
 select @mahdB=MaHDB from deleted
 delete from CHITIETPHIEUBAN where MaHDB=@mahdB
 end
 go
   --xóa mã hóa đơn nhập ->xóa mã bên chi tiết
   create trigger tg_hdn on HOADONNHAP
 for delete
 as 
 begin 
 declare @mahdn char(10)
 select @mahdn=MaHDN from deleted
 delete from CHITIETPHIEUNHAP where MaHDN=@mahdn
 end
 go
 --thêm mã hóa đơn ->đồg thời bên chi tiết cũg cập nhật thêm mã mới
   create trigger tg_Themhdn on HOADONNHAP
   for insert 
   as
   begin
   declare @ma varchar(10)
   select @ma=MaHDN
   from inserted
   insert into CHITIETPHIEUNHAP (MaHDN)
   values (@ma)
   end
   go

   --thêm hóa đơn bán 
   create trigger tg_Themhdb on HOADONBAN
   for insert 
   as
   begin
   declare @ma varchar(10)
   select @ma=MaHDB
   from inserted
   insert into CHITIETPHIEUBAN(MaHDB)
   values (@ma) 
   end
   go
   --update tien bang con tro phieu ban
DECLARE @MAPN NCHAR(10),@THANHTIEN MONEY,@TONGTIEN MONEY
DECLARE UPDATETIEN1 CURSOR FORWARD_ONLY
FOR SELECT MaHDB,(SoLuong*DonGia) FROM CHITIETPHIEUBAN
OPEN UPDATETIEN1
WHILE 0=0
BEGIN
 FETCH NEXT FROM UPDATETIEN1
 INTO @MAPN,@THANHTIEN
 IF @@FETCH_STATUS<>0
	BREAK
	
 UPDATE CHITIETPHIEUBAN
 SET ThanhTien=@THANHTIEN
 WHERE MaHDB=@MAPN

 UPDATE HOADONBAN
 SET TongTien=(SELECT SUM(ThanhTien) from CHITIETPHIEUBAN CP WHERE CP.MaHDB=P.MaHDB)
 FROM HOADONBAN P
 
END
CLOSE UPDATETIEN1
DEALLOCATE UPDATETIEN1
--khi  thêm hàg hóa thì sẽ thay đổi giá trị cột tổg tiền BÁN

   create TRIGGER UPDATE_TIEN ON CHITIETPHIEUBAN
   FOR INSERT,UPDATE
   AS
   BEGIN
    UPDATE CHITIETPHIEUBAN
	--đây là thành tiền của mỗi mã hàg 
    SET ThanhTien=(SELECT (SoLuong*DonGia)
                  FROM CHITIETPHIEUBAN P2 
                  WHERE P1.MaHDB=P2.MaHDB AND P1.MaHH=P2.MaHH)
   FROM CHITIETPHIEUBAN P1,inserted I
  WHERE P1.MaHDB=I.MaHDB AND P1.MaHH=I.MaHH

  update HOADONBAN
  SET TongTien=(select sum(ThanhTien) from CHITIETPHIEUBAN where CHITIETPHIEUBAN.MaHDB=P1.MaHDB)
  FROM HOADONBAN P1,inserted I
  WHERE P1.MaHDB=I.MaHDB
  END 
  GO

  --THỐNG KÊ
  --thốg kê các mặt hàg bán từ ngày này đến ngày kia (ngày,số hđ,sl,đơn giá,thành tiền)
 create proc tk_daban (
@Date1 datetime,
@Date2 datetime)
as
select MaHDB, hh.MaHH,hh.TenHH,b.SoLuong,hh.DonVi,b.Tongtien
from HangHoa hh,(select MaHDB,MaHH,Sum(SoLuong) As SoLuong,Sum(ThanhTien) as Tongtien
	             from CHITIETPHIEUBAN
	             where MaHDB in (select MaHDB from HOADONBAN where NgayBan between @Date1 and @Date2)
	             group by MaHDB,MaHH) b
where hh.MaHH=b.MaHH  
ORDER BY MaHDB 
go
tk_daban '2016-10-20','2016-10-21'

--thốg kê hàg hóa tồn kho
  create proc tk_tonkho(@ngaybd datetime,@ngaykt datetime)
  as
  begin
  if exists(select (b.SoLuong-a.SoLuong) from CHITIETPHIEUBAN a,CHITIETPHIEUNHAP b where  a.MaHH=b.MaHH and (b.SoLuong-a.SoLuong)>0 )
    begin
	   select b.MaHH,(b.SoLuong-a.SoLuong) as soluong
	   from CHITIETPHIEUBAN a,HOADONBAN c,CHITIETPHIEUNHAP b,HOADONNHAP d
	   where a.MaHH=b.MaHH and c.MaHDB=a.MaHDB and d.MaHDN=b.MaHDN and c.NgayBan between @ngaybd and @ngaykt 
	end
	else
	 print N'Hàng đã hết'
 end

 tk_tonkho '2016-10-20','2016-10-21'