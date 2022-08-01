USE [salonspa]
GO
/****** Object:  UserDefinedFunction [dbo].[tvf_SplitString]    Script Date: 8/2/2022 12:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tvf_SplitString]
(    
      @Input NVARCHAR(MAX),
      @Character CHAR(1)
)
RETURNS @Output TABLE (
      Item NVARCHAR(1000)
)
AS
BEGIN
      DECLARE @StartIndex INT, @EndIndex INT
 
      SET @StartIndex = 1
      IF SUBSTRING(@Input, LEN(@Input) - 1, LEN(@Input)) <> @Character
      BEGIN
            SET @Input = @Input + @Character
      END
 
      WHILE CHARINDEX(@Character, @Input) > 0
      BEGIN
            SET @EndIndex = CHARINDEX(@Character, @Input)
           
            INSERT INTO @Output(Item)
            SELECT SUBSTRING(@Input, @StartIndex, @EndIndex - 1)
           
            SET @Input = SUBSTRING(@Input, @EndIndex + 1, LEN(@Input))
      END
		delete from @Output where Item = ''
      RETURN
END

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/2/2022 12:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/2/2022 12:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ClaimType] [nvarchar](250) NULL,
	[ClaimValue] [nvarchar](250) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [bigint] NOT NULL,
	[RoleId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Business]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business](
	[BusinessId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BusinessName] [nvarchar](250) NOT NULL,
	[BusinessCategoryId] [bigint] NOT NULL,
	[BusinessEmail] [nvarchar](250) NOT NULL,
	[PrimaryPhoneNumber] [nvarchar](max) NOT NULL,
	[SecondPhoneNumber] [nvarchar](max) NULL,
	[CompleteAddress] [nvarchar](max) NOT NULL,
	[CityId] [bigint] NOT NULL,
	[Desciption] [nvarchar](max) NULL,
	[TimeOpen] [nvarchar](10) NULL,
	[TimeClose] [nvarchar](10) NULL,
	[IsVerified] [bit] NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[IsSuspended] [bit] NOT NULL,
	[Rating] [float] NULL,
	[ViewCount] [bigint] NULL,
	[BannerImageFile] [bigint] NULL,
	[DatePermitExpired] [date] NULL,
	[EntityStatusId] [bigint] NOT NULL,
 CONSTRAINT [PK_Business] PRIMARY KEY CLUSTERED 
(
	[BusinessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusinessCategory]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessCategory](
	[BusinessCategoryId] [bigint] NOT NULL,
	[BusinessCategoryName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_BusinessCategory] PRIMARY KEY CLUSTERED 
(
	[BusinessCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[MiddleName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[GenderId] [bigint] NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[Age] [bigint] NULL,
	[Email] [nvarchar](250) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[CompleteAddress] [nvarchar](max) NOT NULL,
	[EntityStatusId] [bigint] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityApprovalStatus]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityApprovalStatus](
	[ApprovalStatusId] [bigint] NOT NULL,
	[ApprovalStatusName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_EntityApprovalStatus] PRIMARY KEY CLUSTERED 
(
	[ApprovalStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityGender]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityGender](
	[GenderId] [bigint] NOT NULL,
	[GenderName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_EntityGender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityStatus]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityStatus](
	[EntityStatusId] [bigint] NOT NULL,
	[EntityStatusName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_EntityStatus] PRIMARY KEY CLUSTERED 
(
	[EntityStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[File]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[File](
	[FileId] [bigint] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](250) NOT NULL,
	[MimeType] [nvarchar](100) NOT NULL,
	[FileSize] [bigint] NOT NULL,
	[FileContent] [varbinary](max) NULL,
	[IsFromStorage] [bit] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](100) NULL,
	[LastUpdatedAt] [datetime] NULL,
	[EntityStatusId] [bigint] NOT NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeId] [bigint] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnabled] [bit] NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ProfilePictureFile] [bigint] NOT NULL,
	[DateCreated] [date] NOT NULL,
	[EntityStatusId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[UserTypeId] [bigint] NOT NULL,
	[UserTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_SystemUserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BusinessView]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[BusinessView]
AS
SELECT        dbo.Business.BusinessId, dbo.Business.BusinessName, dbo.Business.BusinessEmail, dbo.Business.PrimaryPhoneNumber, dbo.Business.SecondPhoneNumber, dbo.Business.CompleteAddress, dbo.Business.Desciption, 
                         dbo.Business.TimeOpen, dbo.Business.TimeClose, dbo.Business.IsVerified, dbo.Business.IsPaid, dbo.Business.IsSuspended, dbo.Business.Rating, dbo.Business.ViewCount, dbo.Business.BannerImageFile, 
                         dbo.Business.DatePermitExpired, dbo.Business.EntityStatusId, dbo.BusinessCategory.BusinessCategoryId, dbo.BusinessCategory.BusinessCategoryName, dbo.City.CityId, dbo.City.Name, dbo.Users.UserId, 
                         dbo.Users.UserName, dbo.UserType.UserTypeId, dbo.UserType.UserTypeName, dbo.[File].FileId, dbo.[File].FileName, dbo.[File].MimeType, dbo.[File].FileSize, dbo.[File].FileContent, dbo.[File].IsFromStorage
FROM            dbo.Business LEFT OUTER JOIN
                         dbo.Users ON dbo.Business.UserId = dbo.Users.UserId LEFT OUTER JOIN
                         dbo.UserType ON dbo.Users.UserTypeId = dbo.UserType.UserTypeId LEFT OUTER JOIN
                         dbo.[File] ON dbo.Users.ProfilePictureFile = dbo.[File].FileId LEFT OUTER JOIN
                         dbo.BusinessCategory ON dbo.Business.BusinessCategoryId = dbo.BusinessCategory.BusinessCategoryId LEFT OUTER JOIN
                         dbo.City ON dbo.Business.CityId = dbo.City.CityId
GO
/****** Object:  View [dbo].[CustomerView]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[CustomerView]
AS
SELECT        dbo.Customer.CustomerId, dbo.Customer.FirstName, dbo.Customer.MiddleName, dbo.Customer.LastName, dbo.Customer.BirthDate, dbo.Customer.Age, dbo.Customer.Email, dbo.Customer.PhoneNumber, 
                         dbo.Customer.CompleteAddress, dbo.Users.UserId, dbo.Users.UserName, dbo.EntityGender.GenderId, dbo.EntityGender.GenderName, dbo.UserType.UserTypeId, dbo.UserType.UserTypeName
FROM            dbo.Customer LEFT OUTER JOIN
                         dbo.Users ON dbo.Customer.UserId = dbo.Users.UserId LEFT OUTER JOIN
                         dbo.EntityGender ON dbo.Customer.GenderId = dbo.EntityGender.GenderId LEFT OUTER JOIN
                         dbo.UserType ON dbo.Users.UserTypeId = dbo.UserType.UserTypeId
GO
/****** Object:  View [dbo].[UserView]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserView]
AS
SELECT        dbo.Users.UserId, dbo.Users.UserName, dbo.Users.Email, dbo.Users.EmailConfirmed, dbo.Users.PhoneNumber, dbo.Users.PhoneNumberConfirmed, dbo.Users.DateCreated, dbo.UserType.UserTypeId, 
                         dbo.UserType.UserTypeName, dbo.[File].FileId, dbo.[File].FileName, dbo.[File].MimeType, dbo.[File].FileSize, dbo.[File].FileContent, dbo.[File].IsFromStorage, dbo.[File].EntityStatusId
FROM            dbo.Users LEFT OUTER JOIN
                         dbo.UserType ON dbo.Users.UserTypeId = dbo.UserType.UserTypeId LEFT OUTER JOIN
                         dbo.[File] ON dbo.Users.ProfilePictureFile = dbo.[File].FileId
GO
INSERT [dbo].[BusinessCategory] ([BusinessCategoryId], [BusinessCategoryName]) VALUES (1, N'Salon')
GO
INSERT [dbo].[BusinessCategory] ([BusinessCategoryId], [BusinessCategoryName]) VALUES (2, N'Spa')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (1, N'Caloocan')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (2, N'Las Piñas')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (3, N'Makati')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (4, N'Malabon')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (5, N'Mandaluyong')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (6, N'Manila')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (7, N'Marikina')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (8, N'Muntinlupa')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (9, N'Navotas')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (10, N'Parañaque')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (11, N'Pasay')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (12, N'Pasig')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (13, N'Pateros')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (14, N'Quezon City')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (15, N'San Juan')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (16, N'Taguig')
GO
INSERT [dbo].[City] ([CityId], [Name]) VALUES (17, N'Valenzuela')
GO
INSERT [dbo].[EntityApprovalStatus] ([ApprovalStatusId], [ApprovalStatusName]) VALUES (1, N'Approved')
GO
INSERT [dbo].[EntityApprovalStatus] ([ApprovalStatusId], [ApprovalStatusName]) VALUES (2, N'Declined')
GO
INSERT [dbo].[EntityApprovalStatus] ([ApprovalStatusId], [ApprovalStatusName]) VALUES (3, N'Pending')
GO
INSERT [dbo].[EntityGender] ([GenderId], [GenderName]) VALUES (1, N'Male')
GO
INSERT [dbo].[EntityGender] ([GenderId], [GenderName]) VALUES (2, N'Female')
GO
INSERT [dbo].[EntityStatus] ([EntityStatusId], [EntityStatusName]) VALUES (1, N'Active')
GO
INSERT [dbo].[EntityStatus] ([EntityStatusId], [EntityStatusName]) VALUES (2, N'Deleted')
GO
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName]) VALUES (1, N'Customer')
GO
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName]) VALUES (2, N'Business')
GO
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName]) VALUES (3, N'Admin')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins]    Script Date: 8/2/2022 12:05:17 AM ******/
ALTER TABLE [dbo].[AspNetUserLogins] ADD  CONSTRAINT [IX_AspNetUserLogins] UNIQUE NONCLUSTERED 
(
	[LoginProvider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Business] ADD  CONSTRAINT [DF_Business_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[Business] ADD  CONSTRAINT [DF_Business_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[Business] ADD  CONSTRAINT [DF_Business_IsSuspended]  DEFAULT ((0)) FOR [IsSuspended]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Age]  DEFAULT ((0)) FOR [Age]
GO
ALTER TABLE [dbo].[File] ADD  CONSTRAINT [DF_File_FileSize]  DEFAULT ((0)) FOR [FileSize]
GO
ALTER TABLE [dbo].[File] ADD  CONSTRAINT [DF_File_IsFromStorage]  DEFAULT ((0)) FOR [IsFromStorage]
GO
ALTER TABLE [dbo].[File] ADD  CONSTRAINT [DF_File_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[File] ADD  CONSTRAINT [DF_File_EntityStatusId]  DEFAULT ((1)) FOR [EntityStatusId]
GO
ALTER TABLE [dbo].[Business]  WITH CHECK ADD  CONSTRAINT [FK_Business_BusinessCategory] FOREIGN KEY([BusinessCategoryId])
REFERENCES [dbo].[BusinessCategory] ([BusinessCategoryId])
GO
ALTER TABLE [dbo].[Business] CHECK CONSTRAINT [FK_Business_BusinessCategory]
GO
ALTER TABLE [dbo].[Business]  WITH CHECK ADD  CONSTRAINT [FK_Business_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[Business] CHECK CONSTRAINT [FK_Business_City]
GO
ALTER TABLE [dbo].[Business]  WITH CHECK ADD  CONSTRAINT [FK_Business_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Business] CHECK CONSTRAINT [FK_Business_Users]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_EntityGender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[EntityGender] ([GenderId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_EntityGender]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_EntityStatus] FOREIGN KEY([EntityStatusId])
REFERENCES [dbo].[EntityStatus] ([EntityStatusId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_EntityStatus]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Users]
GO
/****** Object:  StoredProcedure [dbo].[usp_Reset]    Script Date: 8/2/2022 12:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ====================================================================
-- Created date: Sept 25, 2020
-- Author: 
-- ====================================================================
CREATE PROCEDURE [dbo].[usp_Reset]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
		SET NOCOUNT ON;
		
		DELETE FROM [dbo].[Business];
		DBCC CHECKIDENT ('Business', RESEED, 0)
		DELETE FROM [dbo].[Customer];
		DBCC CHECKIDENT ('Customer', RESEED, 0)
		DELETE FROM [dbo].[Users];
		DBCC CHECKIDENT ('Users', RESEED, 0)
		DELETE FROM [dbo].[File];
		DBCC CHECKIDENT ('File', RESEED, 0)
        
    END TRY
    BEGIN CATCH

        SELECT
            'Error'           AS Status,
            ERROR_NUMBER()    AS ErrorNumber,
            ERROR_SEVERITY()  AS ErrorSeverity,
            ERROR_STATE()     AS ErrorState,
            ERROR_PROCEDURE() AS ErrorProcedure,
            ERROR_LINE()      AS ErrorLine,
            ERROR_MESSAGE()   AS ErrorMessage;

    END CATCH

END


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[12] 2[52] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -17
      End
      Begin Tables = 
         Begin Table = "Business"
            Begin Extent = 
               Top = 245
               Left = 36
               Bottom = 375
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BusinessCategory"
            Begin Extent = 
               Top = 466
               Left = 252
               Bottom = 584
               Right = 466
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "City"
            Begin Extent = 
               Top = 452
               Left = 65
               Bottom = 548
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "File"
            Begin Extent = 
               Top = 439
               Left = 548
               Bottom = 569
               Right = 718
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 211
               Left = 287
               Bottom = 356
               Right = 511
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "UserType"
            Begin Extent = 
               Top = 257
               Left = 650
               Bottom = 353
               Right = 820
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BusinessView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BusinessView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BusinessView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 259
               Bottom = 136
               Right = 483
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EntityGender"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserType"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 174
               Right = 185
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "UserType"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 102
               Right = 470
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "File"
            Begin Extent = 
               Top = 102
               Left = 223
               Bottom = 232
               Right = 393
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserView'
GO
