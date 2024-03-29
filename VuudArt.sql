USE [master]
GO
/****** Object:  Database [DbVuudArt]    Script Date: 8.07.2022 12:19:01 ******/
CREATE DATABASE [DbVuudArt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbVuudArt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbVuudArt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbVuudArt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbVuudArt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbVuudArt] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbVuudArt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbVuudArt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbVuudArt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbVuudArt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbVuudArt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbVuudArt] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbVuudArt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbVuudArt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbVuudArt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbVuudArt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbVuudArt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbVuudArt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbVuudArt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbVuudArt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbVuudArt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbVuudArt] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbVuudArt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbVuudArt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbVuudArt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbVuudArt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbVuudArt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbVuudArt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbVuudArt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbVuudArt] SET RECOVERY FULL 
GO
ALTER DATABASE [DbVuudArt] SET  MULTI_USER 
GO
ALTER DATABASE [DbVuudArt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbVuudArt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbVuudArt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbVuudArt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbVuudArt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbVuudArt] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbVuudArt', N'ON'
GO
ALTER DATABASE [DbVuudArt] SET QUERY_STORE = OFF
GO
USE [DbVuudArt]
GO
/****** Object:  Table [dbo].[GelenMail]    Script Date: 8.07.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GelenMail](
	[MailID] [int] IDENTITY(10,10) NOT NULL,
	[Mail] [nvarchar](70) NOT NULL,
	[KonuBaslik] [nvarchar](100) NOT NULL,
	[MailMesaj] [nvarchar](500) NOT NULL,
	[TarihSaat] [smalldatetime] NOT NULL,
	[Durum] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GonderilenMail]    Script Date: 8.07.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GonderilenMail](
	[MailID] [int] IDENTITY(10,10) NOT NULL,
	[Tur] [int] NOT NULL,
	[GonderilenTur] [int] NOT NULL,
	[Gonderilen] [nvarchar](70) NULL,
	[KonuBaslik] [nvarchar](100) NOT NULL,
	[MailMesaj] [nvarchar](500) NOT NULL,
	[GonderenUnvan] [nvarchar](80) NOT NULL,
	[TarihSaat] [smalldatetime] NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK__Gonderil__09A874FA57A48B03] PRIMARY KEY CLUSTERED 
(
	[MailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hammaddeler]    Script Date: 8.07.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hammaddeler](
	[HammaddeID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[HammaddeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 8.07.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Olculer]    Script Date: 8.07.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Olculer](
	[Barkod] [nvarchar](30) NOT NULL,
	[Genislik] [int] NULL,
	[Uzunluk] [int] NULL,
	[Yukseklik] [int] NULL,
	[Kalinlik] [int] NULL,
	[Yaricap] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sepet]    Script Date: 8.07.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sepet](
	[SepetID] [int] IDENTITY(1,1) NOT NULL,
	[UrunBarkod] [nvarchar](30) NOT NULL,
	[UrunAdet] [int] NOT NULL,
	[UyeMail] [nvarchar](30) NOT NULL,
	[Durum] [bit] NOT NULL,
	[Tarih] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SepetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 8.07.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[Barkod] [nvarchar](30) NOT NULL,
	[Baslik] [nvarchar](40) NOT NULL,
	[SliderGorsel] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unvanlar]    Script Date: 8.07.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unvanlar](
	[UnvanId] [int] IDENTITY(1,1) NOT NULL,
	[Unvan] [nvarchar](30) NOT NULL,
	[Aciklama] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[UnvanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 8.07.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[Barkod] [nvarchar](30) NOT NULL,
	[Ad] [nvarchar](100) NOT NULL,
	[Kategori] [int] NOT NULL,
	[Hammadde] [int] NOT NULL,
	[Aciklama] [nvarchar](300) NULL,
	[Gorsel1] [nvarchar](200) NOT NULL,
	[Gorsel2] [nvarchar](200) NULL,
	[Gorsel3] [nvarchar](200) NULL,
	[Fiyat] [float] NOT NULL,
	[StokAdet] [int] NOT NULL,
	[KdvOran] [float] NOT NULL,
	[KargoKg] [int] NOT NULL,
 CONSTRAINT [PK__Urunler__623D364B4C47D686] PRIMARY KEY CLUSTERED 
(
	[Barkod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 8.07.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[KullaniciAdi] [nvarchar](30) NOT NULL,
	[UyeMail] [nvarchar](30) NOT NULL,
	[Ad] [nvarchar](30) NOT NULL,
	[Soyad] [nvarchar](30) NOT NULL,
	[Sifre] [nvarchar](200) NOT NULL,
	[Tc] [nvarchar](11) NULL,
	[Telefon] [nvarchar](11) NULL,
	[Ulke] [nvarchar](30) NULL,
	[Sehir] [nvarchar](30) NULL,
	[PostaKod] [nvarchar](30) NULL,
	[Adres] [nvarchar](300) NULL,
	[Pfotograf] [nvarchar](200) NULL,
	[DKod] [nvarchar](6) NOT NULL,
	[Durum] [int] NOT NULL,
	[MailOnay] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KullaniciAdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yoneticiler]    Script Date: 8.07.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yoneticiler](
	[YoneticiTc] [nvarchar](11) NOT NULL,
	[Ad] [nvarchar](30) NOT NULL,
	[Soyad] [nvarchar](30) NOT NULL,
	[Mail] [nvarchar](30) NOT NULL,
	[Sifre] [nvarchar](200) NOT NULL,
	[Telefon] [nvarchar](11) NOT NULL,
	[Unvan] [int] NOT NULL,
	[Pfotograf] [nvarchar](200) NULL,
 CONSTRAINT [PK__Yonetici__2E840A56D27643FF] PRIMARY KEY CLUSTERED 
(
	[YoneticiTc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GelenMail] ON 

INSERT [dbo].[GelenMail] ([MailID], [Mail], [KonuBaslik], [MailMesaj], [TarihSaat], [Durum]) VALUES (30, N'akdogan123@gmail.com', N'Kargom hakkında bilgi almak istiyorum', N'Almış olduğum ürünün kargo süreci hakkında bilgi almak istiyorum.', CAST(N'2022-07-07T23:59:00' AS SmallDateTime), 0)
INSERT [dbo].[GelenMail] ([MailID], [Mail], [KonuBaslik], [MailMesaj], [TarihSaat], [Durum]) VALUES (40, N'salih_akdogan1@hotmail.com', N'Ürünler hakkında bilgi almak istiyorum', N'Almış olduğum ürünün kargo süreci hakkında bilgi almak istiyorum.', CAST(N'2022-07-08T00:01:00' AS SmallDateTime), 1)
INSERT [dbo].[GelenMail] ([MailID], [Mail], [KonuBaslik], [MailMesaj], [TarihSaat], [Durum]) VALUES (50, N'eren123@hotmail.com', N'Geri dönüş sağlayabilir misiniz?', N'Bana geri dönüş sağlarsanız sevinirim.', CAST(N'2022-07-08T00:02:00' AS SmallDateTime), 1)
INSERT [dbo].[GelenMail] ([MailID], [Mail], [KonuBaslik], [MailMesaj], [TarihSaat], [Durum]) VALUES (60, N'osmansalih@hotmail.com', N'Artık reklam maili almak istemiyorum', N'Artık reklam maili almak istemiyorum mail göndermezseniz sevinirim.', CAST(N'2022-07-08T00:03:00' AS SmallDateTime), 0)
SET IDENTITY_INSERT [dbo].[GelenMail] OFF
GO
SET IDENTITY_INSERT [dbo].[GonderilenMail] ON 

INSERT [dbo].[GonderilenMail] ([MailID], [Tur], [GonderilenTur], [Gonderilen], [KonuBaslik], [MailMesaj], [GonderenUnvan], [TarihSaat], [Durum]) VALUES (90, 0, 0, N'salih_akdogan1@hotmail.com', N'Gönderdiğiniz ''Ürünler hakkında bilgi almak istiyorum'' başlıklı mail hakkında:', N'Kargonuz iki iş günü içerisinde adresinize gönderilecektir.', N'Salih Akdoğan - Yönetici', CAST(N'2022-07-08T00:09:00' AS SmallDateTime), 0)
INSERT [dbo].[GonderilenMail] ([MailID], [Tur], [GonderilenTur], [Gonderilen], [KonuBaslik], [MailMesaj], [GonderenUnvan], [TarihSaat], [Durum]) VALUES (160, 0, 0, N'eren123@hotmail.com', N'Gönderdiğiniz ''Geri dönüş sağlayabilir misiniz?'' başlıklı mail hakkında:', N'Hangi konuda yardım almak istersiniz?', N'Salih Akdoğan - Yönetici', CAST(N'2022-07-08T11:26:00' AS SmallDateTime), 0)
INSERT [dbo].[GonderilenMail] ([MailID], [Tur], [GonderilenTur], [Gonderilen], [KonuBaslik], [MailMesaj], [GonderenUnvan], [TarihSaat], [Durum]) VALUES (170, 1, 1, N'Tüm yöneticiler', N'Tüm yöneticilerin dikkatine !', N'08.07.2022 tarihinde saat 19.30''da zoom üzerinden genel toplantı yapılacaktır. Herkesin katılması önemle rica olunur.', N'Salih Akdoğan - Yönetici', CAST(N'2022-07-08T11:46:00' AS SmallDateTime), 0)
INSERT [dbo].[GonderilenMail] ([MailID], [Tur], [GonderilenTur], [Gonderilen], [KonuBaslik], [MailMesaj], [GonderenUnvan], [TarihSaat], [Durum]) VALUES (180, 1, 1, N'Mail iletisi isteyen tüm üyeler', N'Açılışa özel fiyatlar ve indirim fırsatları', N'Açılışa özel fiyatlar ve %50 ye varan indirim fırsatları için hemen sitemizi ziyaret edin.', N'Salih Akdoğan - Yönetici', CAST(N'2022-07-08T11:55:00' AS SmallDateTime), 0)
SET IDENTITY_INSERT [dbo].[GonderilenMail] OFF
GO
SET IDENTITY_INSERT [dbo].[Hammaddeler] ON 

INSERT [dbo].[Hammaddeler] ([HammaddeID], [Ad], [Aciklama]) VALUES (1011, N'Ceviz Ağacı', NULL)
INSERT [dbo].[Hammaddeler] ([HammaddeID], [Ad], [Aciklama]) VALUES (1012, N'Ihlamur Ağacı', NULL)
INSERT [dbo].[Hammaddeler] ([HammaddeID], [Ad], [Aciklama]) VALUES (1013, N'Çınar Ağacı', NULL)
INSERT [dbo].[Hammaddeler] ([HammaddeID], [Ad], [Aciklama]) VALUES (1014, N'Gürgen Ağacı', NULL)
INSERT [dbo].[Hammaddeler] ([HammaddeID], [Ad], [Aciklama]) VALUES (1015, N'Masif Ahşap', NULL)
INSERT [dbo].[Hammaddeler] ([HammaddeID], [Ad], [Aciklama]) VALUES (1016, N'Ladin Ağacı', NULL)
INSERT [dbo].[Hammaddeler] ([HammaddeID], [Ad], [Aciklama]) VALUES (1017, N'Huş Ağacı ', NULL)
INSERT [dbo].[Hammaddeler] ([HammaddeID], [Ad], [Aciklama]) VALUES (1018, N'Meşe Ağacı', NULL)
SET IDENTITY_INSERT [dbo].[Hammaddeler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategoriID], [Ad], [Aciklama]) VALUES (1056, N'Ahşap Arabalar', NULL)
INSERT [dbo].[Kategoriler] ([KategoriID], [Ad], [Aciklama]) VALUES (1057, N'Oyuncak Kılıçlar', NULL)
INSERT [dbo].[Kategoriler] ([KategoriID], [Ad], [Aciklama]) VALUES (1058, N'Ahşap Oyuncaklar', N'img/kategori_gorsel/kate3.png')
INSERT [dbo].[Kategoriler] ([KategoriID], [Ad], [Aciklama]) VALUES (1059, N'Ofis Ürünleri', N'img/kategori_gorsel/kate2.png')
INSERT [dbo].[Kategoriler] ([KategoriID], [Ad], [Aciklama]) VALUES (1060, N'Ahşap Müzik Aletleri', N'img/kategori_gorsel/kate1.png')
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210001', 10, 18, 10, 0, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210002', 10, 18, 10, 0, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210003', 10, 18, 10, 0, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210005', 12, 22, 13, 0, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210006', 9, 16, 5, 0, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210007', 37, 41, 0, 4, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210008', 13, 54, 0, 8, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210009', 13, 60, 0, 8, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210010', 13, 63, 0, 8, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210011', 15, 51, 0, 8, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210012', 0, 0, 0, 0, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210013', 0, 0, 0, 0, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210014', 0, 0, 0, 0, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210015', 0, 0, 0, 0, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210016', 0, 0, 0, 0, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210017', 0, 0, 0, 0, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210018', 0, 0, 0, 1, 14)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210019', 0, 0, 0, 1, 17)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210020', 3, 54, 0, 1, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210021', 19, 54, 0, 3, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210022', 19, 54, 0, 3, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210023', 8, 7, 7, 0, 0)
INSERT [dbo].[Olculer] ([Barkod], [Genislik], [Uzunluk], [Yukseklik], [Kalinlik], [Yaricap]) VALUES (N'VA-1312210024', 8, 7, 7, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Sepet] ON 

INSERT [dbo].[Sepet] ([SepetID], [UrunBarkod], [UrunAdet], [UyeMail], [Durum], [Tarih]) VALUES (32, N'VA-1312210024', 3, N'salihakdogan1@gmail.com', 0, CAST(N'2022-07-08' AS Date))
INSERT [dbo].[Sepet] ([SepetID], [UrunBarkod], [UrunAdet], [UyeMail], [Durum], [Tarih]) VALUES (33, N'VA-1312210021', 1, N'salihakdogan1@gmail.com', 0, CAST(N'2022-07-08' AS Date))
INSERT [dbo].[Sepet] ([SepetID], [UrunBarkod], [UrunAdet], [UyeMail], [Durum], [Tarih]) VALUES (34, N'VA-1312210018', 2, N'salihakdogan1@gmail.com', 0, CAST(N'2022-07-08' AS Date))
INSERT [dbo].[Sepet] ([SepetID], [UrunBarkod], [UrunAdet], [UyeMail], [Durum], [Tarih]) VALUES (35, N'VA-1312210015', 5, N'erencuha@gmail.com', 0, CAST(N'2022-07-08' AS Date))
INSERT [dbo].[Sepet] ([SepetID], [UrunBarkod], [UrunAdet], [UyeMail], [Durum], [Tarih]) VALUES (36, N'VA-1312210020', 1, N'erencuha@gmail.com', 0, CAST(N'2022-07-08' AS Date))
INSERT [dbo].[Sepet] ([SepetID], [UrunBarkod], [UrunAdet], [UyeMail], [Durum], [Tarih]) VALUES (37, N'VA-1312210019', 1, N'erencuha@gmail.com', 0, CAST(N'2022-07-08' AS Date))
SET IDENTITY_INSERT [dbo].[Sepet] OFF
GO
INSERT [dbo].[Slider] ([Barkod], [Baslik], [SliderGorsel]) VALUES (N'VA-1312210002', N'El Yapımı Arabalar', N'img/slider_gorsel/slider1.png')
INSERT [dbo].[Slider] ([Barkod], [Baslik], [SliderGorsel]) VALUES (N'VA-1312210024', N'Ofis Ürünleri', N'img/slider_gorsel/slider2.png')
INSERT [dbo].[Slider] ([Barkod], [Baslik], [SliderGorsel]) VALUES (N'VA-1312210022', N'Oyuncak Müzik Aletleri', N'img/slider_gorsel/slider3.png')
GO
SET IDENTITY_INSERT [dbo].[Unvanlar] ON 

INSERT [dbo].[Unvanlar] ([UnvanId], [Unvan], [Aciklama]) VALUES (1, N'Yönetici', N'Yönetici arayüzünü kullanır')
INSERT [dbo].[Unvanlar] ([UnvanId], [Unvan], [Aciklama]) VALUES (2, N'Personel', N'Genel personel')
INSERT [dbo].[Unvanlar] ([UnvanId], [Unvan], [Aciklama]) VALUES (4, N'Grafik Tasarımcı', N'Grafik tasarımcı')
SET IDENTITY_INSERT [dbo].[Unvanlar] OFF
GO
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210001', N'Oyuncak Arazi Aracı Açık Renk', 1056, 1011, N'VA-1312210001 / Oyuncak Arazi Aracı Açık Renk', N'img/urun_gorsel/07062022_224040_1.png', N'img/urun_gorsel/07062022_224040_2.png', N'img/urun_gorsel/07062022_224040_3.png', 150, 180, 18, 5)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210002', N'Arazi Aracı Koyu Renk', 1056, 1011, N'VA-1312210002 / Arazi Aracı Koyu Renk', N'img/urun_gorsel/07062022_122533_1.png', N'img/urun_gorsel/07062022_122533_2.png', N'img/urun_gorsel/07062022_122533_3.png', 150, 280, 18, 6)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210003', N'Arazi Aracı Kasalı Açık Renk', 1056, 1012, N'VA-1312210003 / Arazi Aracı Kasalı Açık Renk', N'img/urun_gorsel/07062022_122616_1.png', N'img/urun_gorsel/07062022_122616_2.png', N'img/urun_gorsel/07062022_122616_4.png', 150, 290, 18, 6)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210005', N'Canavar Jip Arazi Aracı', 1056, 1017, N'VA-1312210005 / Canavar Jip Arazi Aracı', N'img/urun_gorsel/07062022_122927_1.png', N'img/urun_gorsel/07062022_122927_2.png', N'img/urun_gorsel/07062022_122927_3.png', 160, 20, 18, 6)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210006', N'Formula Yarış Aracı', 1056, 1013, N'VA-1312210006 / Formula Yarış Aracı', N'img/urun_gorsel/07062022_123315_1.png', N'img/urun_gorsel/07062022_123315_2.png', N'img/urun_gorsel/07062022_123315_3.png', 90, 65, 18, 5)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210007', N'Kalkan Kayı Boyu', 1057, 1015, N'VA-1312210007 / Kalkan Kayı Boyu', N'img/urun_gorsel/07062022_123540_1.png', N'img/urun_gorsel/07062022_123540_2.png', N'', 45, 65, 18, 1)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210008', N'Kılıç Kayı Boyu Bamsı Alp', 1057, 1015, N'VA-1312210008 / Kılıç Kayı Boyu Bamsı Alp', N'img/urun_gorsel/07062022_122729_1.png', N'img/urun_gorsel/07062022_122729_2.png', N'', 45, 65, 18, 1)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210009', N'Kılıç Kayı Boyu Ertuğrul Gazi', 1057, 1017, N'VA-1312210009 / Kılıç Kayı Boyu Ertuğrul Gazi', N'img/urun_gorsel/07062022_123025_1.png', N'img/urun_gorsel/07062022_123025_2.png', N'', 45, 120, 18, 1)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210010', N'Kılıç Kayı Boyu Aliyar Bey', 1057, 1014, N'VA-1312210010 / Kılıç Kayı Boyu Aliyar Bey', N'img/urun_gorsel/07062022_122318_1.png', N'img/urun_gorsel/07062022_122318_2.png', N'', 55, 130, 18, 1)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210011', N'Balta Kayı Boyu Turgut Alp', 1057, 1012, N'VA-1312210011 / Balta Kayı Boyu Turgut Alp', N'img/urun_gorsel/07062022_124114_1.png', N'img/urun_gorsel/07062022_124114_2.png', N'', 45, 120, 18, 1)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210012', N'Kılıç Kalkan Seti Bamsı Alp', 1057, 1013, N'VA-1312210012 / Kılıç Kalkan Seti Bamsı Alp', N'img/urun_gorsel/07062022_122848_1.png', N'img/urun_gorsel/07062022_122848_2.png', N'img/urun_gorsel/07062022_122848_3.png', 85, 170, 18, 3)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210013', N'Kılıç Kalkan Seti Ertuğrul Gazi', 1057, 1013, N'VA-1312210013 / Kılıç Kalkan Seti Ertuğrul Gazi', N'img/urun_gorsel/07062022_123216_1.png', N'img/urun_gorsel/07062022_123216_2.png', N'img/urun_gorsel/07062022_123216_3.png', 85, 170, 18, 3)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210014', N'Kılıç Kalkan Seti Aliyar Bey', 1057, 1017, N'VA-1312210014 / Kılıç Kalkan Seti Aliyar Bey', N'img/urun_gorsel/07062022_122403_1.png', N'img/urun_gorsel/07062022_122403_2.png', N'img/urun_gorsel/07062022_122403_3.png', 85, 200, 18, 3)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210015', N'Balta Kalkan Seti Turgut Alp', 1057, 1012, N'VA-1312210015 / Balta Kalkan Seti Turgut Alp', N'img/urun_gorsel/07062022_124138_1.png', N'img/urun_gorsel/07062022_124138_2.png', N'img/urun_gorsel/07062022_124138_3.png', 85, 200, 18, 3)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210016', N'Kılıç Balta Kalkan Seti', 1057, 1012, N'VA-1312210016 / Kılıç Balta Kalkan Seti', N'img/urun_gorsel/07062022_123619_1.png', N'img/urun_gorsel/07062022_123619_2.png', N'img/urun_gorsel/07062022_123619_3.png', 130, 140, 18, 3)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210017', N'Tabanca Kılıç Balta Kalkan Seti', 1057, 1017, N'VA-1312210017 / Tabanca Kılıç Balta Kalkan Seti', N'img/urun_gorsel/07062022_123657_1.png', N'img/urun_gorsel/07062022_123657_2.png', N'img/urun_gorsel/07062022_123657_5.png', 130, 150, 18, 3)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210018', N'Pizza Dilimli Set Küçük Boy', 1058, 1012, N'VA-1312210018 / Pizza Dilimli Set Küçük Boy', N'img/urun_gorsel/07062022_123832_1.png', N'img/urun_gorsel/07062022_123832_2.png', N'img/urun_gorsel/07062022_123832_3.png', 80, 150, 18, 3)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210019', N'Pizza Dilimli Set Büyük Boy', 1058, 1012, N'VA-1312210019 / Pizza Dilimli Set Büyük Boy', N'img/urun_gorsel/07062022_123909_1.png', N'img/urun_gorsel/07062022_123909_2.png', N'img/urun_gorsel/07062022_123909_3.png', 100, 70, 18, 3)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210020', N'Balık Oltası Seti', 1058, 1014, N'VA-1312210020 / Balık Oltası Seti', N'img/urun_gorsel/07062022_123755_1.jpg', N'img/urun_gorsel/07062022_123755_2.jpg', N'img/urun_gorsel/07062022_123755_3.jpg', 85, 70, 18, 3)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210021', N'Oyuncak Gitar', 1060, 1012, N'VA-1312210021 / Oyuncak Gitar', N'img/urun_gorsel/07062022_123417_1.png', N'img/urun_gorsel/07062022_123417_2.png', N'', 100, 40, 18, 3)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210022', N'Oyuncak Elektro Gitar', 1060, 1012, N'VA-1312210022 / Oyuncak Elektro Gitar', N'img/urun_gorsel/07062022_123502_1.png', N'img/urun_gorsel/07062022_123502_2.png', N'', 100, 70, 18, 3)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210023', N'Sonsuz Masa Takvimi Türkçe', 1059, 1018, N'VA-1312210023 / Sonsuz Masa Takvimi Türkçe', N'img/urun_gorsel/07062022_124007_1.jpg', N'img/urun_gorsel/07062022_124007_2.jpg', N'img/urun_gorsel/07062022_124007_4.jpg', 85, 70, 18, 3)
INSERT [dbo].[Urunler] ([Barkod], [Ad], [Kategori], [Hammadde], [Aciklama], [Gorsel1], [Gorsel2], [Gorsel3], [Fiyat], [StokAdet], [KdvOran], [KargoKg]) VALUES (N'VA-1312210024', N'Sonsuz Masa Takvimi Ingilizce', 1059, 1018, N'VA-1312210024 / Sonsuz Masa Takvimi İngilizce', N'img/urun_gorsel/07062022_124039_1.jpg', N'img/urun_gorsel/07062022_124039_2.jpg', N'img/urun_gorsel/07062022_124039_4.jpg', 85, 70, 18, 3)
GO
INSERT [dbo].[Uyeler] ([KullaniciAdi], [UyeMail], [Ad], [Soyad], [Sifre], [Tc], [Telefon], [Ulke], [Sehir], [PostaKod], [Adres], [Pfotograf], [DKod], [Durum], [MailOnay]) VALUES (N'ErenCuha', N'erencuha@gmail.com', N'Eren', N'Çuha', N'yUzJnDCcRc7GcNN8iJAgbA==', NULL, NULL, NULL, NULL, NULL, NULL, N'img/uye_profil/default_uye_profil.png', N'F2A1M4', 1, 0)
INSERT [dbo].[Uyeler] ([KullaniciAdi], [UyeMail], [Ad], [Soyad], [Sifre], [Tc], [Telefon], [Ulke], [Sehir], [PostaKod], [Adres], [Pfotograf], [DKod], [Durum], [MailOnay]) VALUES (N'Salih1', N'salihakdogan1@gmail.com', N'Salih', N'Akdoğan', N'A4U0bd6yMDrv9bjbyXqorA==', NULL, NULL, NULL, NULL, NULL, NULL, N'img/uye_profil/default_uye_profil.png', N'W8G3W8', 1, 1)
INSERT [dbo].[Uyeler] ([KullaniciAdi], [UyeMail], [Ad], [Soyad], [Sifre], [Tc], [Telefon], [Ulke], [Sehir], [PostaKod], [Adres], [Pfotograf], [DKod], [Durum], [MailOnay]) VALUES (N'Salih2022', N'salih_akdogan1@hotmail.com', N'Salih', N'Akdoğan', N'A4U0bd6yMDrv9bjbyXqorA==', NULL, NULL, NULL, NULL, NULL, NULL, N'img/uye_profil/default_uye_profil.png', N'I3R6D2', 0, 1)
GO
INSERT [dbo].[Yoneticiler] ([YoneticiTc], [Ad], [Soyad], [Mail], [Sifre], [Telefon], [Unvan], [Pfotograf]) VALUES (N'11111111111', N'Murat', N'Çatmalı', N'murat2022@gmail.com', N'6bS9DqcRsqfv9bjbyXqorA==', N'55555555555', 1, N'img/yonetici_profil/07072022_234305_indir.jfif')
INSERT [dbo].[Yoneticiler] ([YoneticiTc], [Ad], [Soyad], [Mail], [Sifre], [Telefon], [Unvan], [Pfotograf]) VALUES (N'19200000000', N'Salih', N'Akdoğan', N'salihakdogan1@gmail.com', N'A4U0bd6yMDrv9bjbyXqorA==', N'05432622253', 1, N'img/yonetici_profil/1657269227573.jpg')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Hammadde__3214AD00CBCA4D1E]    Script Date: 8.07.2022 12:19:02 ******/
ALTER TABLE [dbo].[Hammaddeler] ADD UNIQUE NONCLUSTERED 
(
	[Ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Kategori__3214AD00103E4DC0]    Script Date: 8.07.2022 12:19:02 ******/
ALTER TABLE [dbo].[Kategoriler] ADD UNIQUE NONCLUSTERED 
(
	[Ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Olculer__CBC7D8CD80A8180B]    Script Date: 8.07.2022 12:19:02 ******/
ALTER TABLE [dbo].[Olculer] ADD UNIQUE NONCLUSTERED 
(
	[Barkod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Slider__CBC7D8CDA2854313]    Script Date: 8.07.2022 12:19:02 ******/
ALTER TABLE [dbo].[Slider] ADD UNIQUE NONCLUSTERED 
(
	[Barkod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Unvanlar__E1B4EEC0DF570596]    Script Date: 8.07.2022 12:19:02 ******/
ALTER TABLE [dbo].[Unvanlar] ADD UNIQUE NONCLUSTERED 
(
	[Unvan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Urunler__CBC7D8CDD2B6306C]    Script Date: 8.07.2022 12:19:02 ******/
ALTER TABLE [dbo].[Urunler] ADD  CONSTRAINT [UQ__Urunler__CBC7D8CDD2B6306C] UNIQUE NONCLUSTERED 
(
	[Barkod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Uyeler__3F56A8DEC98788BB]    Script Date: 8.07.2022 12:19:02 ******/
ALTER TABLE [dbo].[Uyeler] ADD UNIQUE NONCLUSTERED 
(
	[UyeMail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Yonetici__2724B2D18C947E25]    Script Date: 8.07.2022 12:19:02 ******/
ALTER TABLE [dbo].[Yoneticiler] ADD  CONSTRAINT [UQ__Yonetici__2724B2D18C947E25] UNIQUE NONCLUSTERED 
(
	[Mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Olculer]  WITH CHECK ADD  CONSTRAINT [fk_Barkod] FOREIGN KEY([Barkod])
REFERENCES [dbo].[Urunler] ([Barkod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Olculer] CHECK CONSTRAINT [fk_Barkod]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [fk_SilderBarkod] FOREIGN KEY([Barkod])
REFERENCES [dbo].[Urunler] ([Barkod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [fk_SilderBarkod]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [fk_Hammadde] FOREIGN KEY([Hammadde])
REFERENCES [dbo].[Hammaddeler] ([HammaddeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [fk_Hammadde]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [fk_Kategori] FOREIGN KEY([Kategori])
REFERENCES [dbo].[Kategoriler] ([KategoriID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [fk_Kategori]
GO
ALTER TABLE [dbo].[Yoneticiler]  WITH CHECK ADD  CONSTRAINT [fk_Unvan] FOREIGN KEY([Unvan])
REFERENCES [dbo].[Unvanlar] ([UnvanId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Yoneticiler] CHECK CONSTRAINT [fk_Unvan]
GO
USE [master]
GO
ALTER DATABASE [DbVuudArt] SET  READ_WRITE 
GO
