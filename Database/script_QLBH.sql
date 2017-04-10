USE [tt_nhom]
GO
/****** Object:  Table [dbo].[ADDMIN]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADDMIN](
	[Name] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[NgaySinh] [datetime] NULL,
	[Email] [varchar](100) NULL,
	[SDT] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHITIETPHIEUBAN]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETPHIEUBAN](
	[MaHDB] [char](10) NOT NULL,
	[MaHH] [char](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
	[ThanhTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHITIETPHIEUNHAP]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETPHIEUNHAP](
	[MaHDN] [char](10) NOT NULL,
	[MaHH] [char](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
	[ThanhTien] [money] NULL,
	[MaKH] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HANGHOA]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HANGHOA](
	[MaHH] [char](10) NOT NULL,
	[TenHH] [nvarchar](50) NULL,
	[NoiSX] [nvarchar](50) NULL,
	[DonVi] [nvarchar](10) NULL,
	[MaKho] [char](10) NULL,
	[Gia] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HOADONBAN]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOADONBAN](
	[MaHDB] [char](10) NOT NULL,
	[NgayBan] [date] NULL,
	[MaNV] [char](10) NULL,
	[MaKH] [char](10) NULL,
	[TongTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HOADONNHAP]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOADONNHAP](
	[MaHDN] [char](10) NOT NULL,
	[NgayNhap] [date] NULL,
	[MaNV] [char](10) NULL,
	[TongTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [char](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [char](20) NULL,
	[DiemTL] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHO]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHO](
	[MaKho] [char](10) NOT NULL,
	[TenKho] [nvarchar](50) NULL,
	[ViTri] [nvarchar](100) NULL,
	[MaNV] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [char](10) NOT NULL,
	[TenNV] [nvarchar](30) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Luong] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CHITIETPHIEUBAN]  WITH CHECK ADD  CONSTRAINT [MK] FOREIGN KEY([MaHDB])
REFERENCES [dbo].[HOADONBAN] ([MaHDB])
GO
ALTER TABLE [dbo].[CHITIETPHIEUBAN] CHECK CONSTRAINT [MK]
GO
ALTER TABLE [dbo].[CHITIETPHIEUBAN]  WITH CHECK ADD  CONSTRAINT [NK] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HANGHOA] ([MaHH])
GO
ALTER TABLE [dbo].[CHITIETPHIEUBAN] CHECK CONSTRAINT [NK]
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [DK] FOREIGN KEY([MaHDN])
REFERENCES [dbo].[HOADONNHAP] ([MaHDN])
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAP] CHECK CONSTRAINT [DK]
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [OK] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HANGHOA] ([MaHH])
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAP] CHECK CONSTRAINT [OK]
GO
ALTER TABLE [dbo].[HOADONBAN]  WITH CHECK ADD  CONSTRAINT [AK] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[HOADONBAN] CHECK CONSTRAINT [AK]
GO
ALTER TABLE [dbo].[HOADONBAN]  WITH CHECK ADD  CONSTRAINT [KK] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[HOADONBAN] CHECK CONSTRAINT [KK]
GO
ALTER TABLE [dbo].[HOADONNHAP]  WITH CHECK ADD  CONSTRAINT [UK] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[HOADONNHAP] CHECK CONSTRAINT [UK]
GO
ALTER TABLE [dbo].[KHO]  WITH CHECK ADD  CONSTRAINT [EK] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[KHO] CHECK CONSTRAINT [EK]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD CHECK  (([GioiTinh]=N'Nữ' OR [GioiTinh]=N'Nam'))
GO
/****** Object:  StoredProcedure [dbo].[load_nv]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  --Tìm kiếm
create proc [dbo].[load_nv] (
@manv char(10)
)
as select *from NHANVIEN where MaNV like @manv 

GO
/****** Object:  StoredProcedure [dbo].[Sp_ListHH]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_ListHH]
as
begin
	select 
		MaHH as 'Mã Hàng Hóa',
		TenHH as 'Tên Hàng Hóa',
		NoiSX as 'Nơi sản xuất',
		DonVi as 'Đơn vị',
		MaKho as 'Mã kho',
		Gia as 'Giá Hàng Hóa'
	from HANGHOA
end

GO
/****** Object:  StoredProcedure [dbo].[Sp_ListKho]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_ListKho]
as
begin
	select 
		MaKho as 'Mã Kho',
		TenKho as 'Tên Kho',
		ViTri as 'Vị trí',
		MaNV as 'Mã Nhân Viên'
	from KHO
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListNV]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_ListNV] 
as
begin
	select 
		MaNV, TenNV
	from NHANVIEN
end

GO
/****** Object:  StoredProcedure [dbo].[Sp_MaMaxHH]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_MaMaxHH] 
as
begin
	select 
		MAX(MaHH)
	from HANGHOA
end

GO
/****** Object:  StoredProcedure [dbo].[Sp_MaMaxKho]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_MaMaxKho] 
as
begin
	select 
		MAX(MaKho)
	from KHO
end

GO
/****** Object:  StoredProcedure [dbo].[Sp_searchHH]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_searchHH](
	@key nvarchar(250)
)
 as 
 select 
		MaHH as 'Mã Hàng Hóa',
		TenHH as 'Tên Hàng Hóa',
		NoiSX as 'Nơi sản xuất',
		DonVi as 'Đơn vị',
		MaKho as 'Mã kho',
		Gia as 'Giá Hàng Hóa'
	from HANGHOA
	where TenHH like '%' + @key + '%'
			or NoiSX like '%' + @key + '%'
			or DonVi like '%' + @key + '%'
GO
/****** Object:  StoredProcedure [dbo].[Sp_searchKho]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_searchKho](
	@key nvarchar(250)
)
 as 
 select 
		MaKho as 'Mã Kho',
		TenKho as 'Tên Kho',
		ViTri as 'Vị trí',
		MaNV as 'Mã Nhân Viên'
	from KHO
	where TenKho like '%' + @key + '%'
			or ViTri like '%' + @key + '%'

GO
/****** Object:  StoredProcedure [dbo].[sua_hh]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sua_hh](
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

GO
/****** Object:  StoredProcedure [dbo].[sua_kho]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sua_kho](
	@makho char(10),
	@tenkho nvarchar(50),
	@vitri nvarchar(50),
	@manv char(10)
)
 as update KHO
set TenKho=@tenkho,ViTri=@vitri,MaNV=@manv
where MaKho=@makho
GO
/****** Object:  StoredProcedure [dbo].[sua_nv]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  --sửa
create proc [dbo].[sua_nv] (
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

GO
/****** Object:  StoredProcedure [dbo].[them_hh]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[them_hh] (
@mahh char(10),
@tenhh nvarchar(50),
@noisx nvarchar(50),
@donvi nvarchar(10),
@makho char(10),
@gia money
) as
insert into HANGHOA(MaHH,TenHH,NoiSX,DonVi,MaKho,Gia)
values (@mahh,@tenhh,@noisx,@donvi,@makho,@gia)

GO
/****** Object:  StoredProcedure [dbo].[them_kho]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--kho
CREATE proc [dbo].[them_kho](
@makho char(10),
@tenkho nvarchar(50),
@vitri nvarchar(100),
@manv char(10)
) as insert into KHO(MaKho,TenKho,ViTri,MaNV)
values (@makho,@tenkho,@vitri,@manv)

GO
/****** Object:  StoredProcedure [dbo].[them_nv]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[them_nv] (
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

GO
/****** Object:  StoredProcedure [dbo].[xoa_hh]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[xoa_hh](
@mahh char(10)
) as select * from HANGHOA 
delete HANGHOA where MaHH=@mahh

GO
/****** Object:  StoredProcedure [dbo].[xoa_kho]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[xoa_kho](
@makho char(10)
) as 
delete KHO where MaKho=@makho

GO
/****** Object:  StoredProcedure [dbo].[xoa_nv]    Script Date: 04/11/2017 12:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  --xóa
create proc [dbo].[xoa_nv] (
@manv char(10)
)
as 
delete NHANVIEN where MaNV=@manv

GO
