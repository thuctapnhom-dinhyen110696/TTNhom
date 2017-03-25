create table HANGHOA(
MaHH char(10) primary key,
TenHH nvarchar(50),
NoiSX nvarchar(50),
DonVi nvarchar(10),
MaKho char(10) 
)
alter table HANGHOA
  add constraint ZK foreign key (MaKho) references KHO(MaKho)
alter table HANGHOA
  add Gia money

  create table HOADONBAN (
MaHDB char(10) primary key,
NgayBan date,
MaNV char(10),
MaKH char(10),
TongTien money
)
alter table HOADONBAN
  add constraint AK foreign key (MaNV) references NHANVIEN(MaNV) 
alter table HOADONBAN
  add constraint KK foreign key (MaKH) references KHACHHANG(MaKH)

create table CHITIETPHIEUBAN(
MaHDB char(10) ,
MaHH char(10),
SoLuong int,
DonGia money,
ThanhTien money,
primary key(MaHDB,MaHH)
)
alter table CHITIETPHIEUBAN
  add constraint MK foreign key (MaHDB) references HOADONBAN(MaHDB)
alter table CHITIETPHIEUBAN
  add constraint NK foreign key (MaHH) references HANGHOA(MaHH)


  create table HOADONNHAP(
MaHDN char(10) primary key,
NgayNhap date,
MaNV char(10),
TongTien money
)
alter table HOADONNHAP
  add constraint UK foreign key (MaNV) references NHANVIEN(MaNV)

create table CHITIETPHIEUNHAP(
MaHDN char(10),
MaHH char(10) ,
SoLuong int,
DonGia money,
ThanhTien money,
MaKH char(10),
primary key (MaHDN,MaHH)
)
alter table CHITIETPHIEUNHAP
  add constraint DK foreign key (MaHDN) references HOADONNHAP(MaHDN) 
alter table CHITIETPHIEUNHAP
  add constraint OK foreign key (MaHH) references HANGHOA(MaHH)

  create table KHO(
MaKho char(10) primary key,
TenKho nvarchar(50),
ViTri nvarchar(100),
MaNV char(10)
)
alter table KHO
add constraint EK FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)

create table NHANVIEN(
MaNV char(10) primary key,
TenNV nvarchar(30),
GioiTinh nvarchar(10) check(GioiTinh in(N'Nam',N'Nữ')),
NgaySinh date,
DiaChi nvarchar(50),
Luong money
)

create table KHACHHANG(
MaKH char(10) primary key,
TenKH nvarchar(50),
NgaySinh datetime,
DiaChi nvarchar(100),
SDT char(20),
DiemTL money
)
create table ADDMIN(
Name varchar(50),
Pass varchar(50),
HoTen nvarchar(50),
DiaChi nvarchar(100),
NgaySinh datetime,
Email varchar(100),
SDT varchar(20)
)
 
 