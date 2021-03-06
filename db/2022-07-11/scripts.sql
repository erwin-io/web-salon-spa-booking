USE [salonspa]
GO
/****** Object:  UserDefinedFunction [dbo].[tvf_SplitString]    Script Date: 7/11/2022 6:02:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/11/2022 6:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/11/2022 6:02:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/11/2022 6:02:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/11/2022 6:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [bigint] NOT NULL,
	[RoleId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Business]    Script Date: 7/11/2022 6:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business](
	[BusinessId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[BusinessCategoryId] [bigint] NOT NULL,
	[BusinessEmail] [nvarchar](250) NOT NULL,
	[PrimaryPhoneNumber] [nvarchar](max) NOT NULL,
	[SecondPhoneNumber] [nvarchar](max) NULL,
	[CompleteAddress] [nvarchar](max) NOT NULL,
	[Desciption] [nvarchar](max) NULL,
	[OpenHourStart] [time](7) NULL,
	[OpenHourEnd] [time](7) NULL,
	[IsVerified] [bit] NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[IsSuspended] [bit] NOT NULL,
	[Rating] [float] NULL,
	[ViewCount] [bigint] NULL,
	[BannerImageFile] [bigint] NULL,
	[EntityStatusId] [bigint] NOT NULL,
 CONSTRAINT [PK_Business] PRIMARY KEY CLUSTERED 
(
	[BusinessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusinessCategory]    Script Date: 7/11/2022 6:02:32 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 7/11/2022 6:02:32 PM ******/
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
/****** Object:  Table [dbo].[EntityApprovalStatus]    Script Date: 7/11/2022 6:02:32 PM ******/
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
/****** Object:  Table [dbo].[EntityGender]    Script Date: 7/11/2022 6:02:32 PM ******/
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
/****** Object:  Table [dbo].[EntityStatus]    Script Date: 7/11/2022 6:02:32 PM ******/
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
/****** Object:  Table [dbo].[File]    Script Date: 7/11/2022 6:02:32 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 7/11/2022 6:02:32 PM ******/
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
/****** Object:  Table [dbo].[UserType]    Script Date: 7/11/2022 6:02:32 PM ******/
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
INSERT [dbo].[BusinessCategory] ([BusinessCategoryId], [BusinessCategoryName]) VALUES (1, N'Personal Care Services')
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
/****** Object:  Index [IX_AspNetUserLogins]    Script Date: 7/11/2022 6:02:32 PM ******/
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
ALTER TABLE [dbo].[Business]  WITH CHECK ADD  CONSTRAINT [FK_Business_Business] FOREIGN KEY([BusinessCategoryId])
REFERENCES [dbo].[BusinessCategory] ([BusinessCategoryId])
GO
ALTER TABLE [dbo].[Business] CHECK CONSTRAINT [FK_Business_Business]
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
/****** Object:  StoredProcedure [dbo].[usp_Reset]    Script Date: 7/11/2022 6:02:32 PM ******/
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
