USE [WellBeing_Hospital]
GO
/****** Object:  Table [dbo].[All_Employees]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[All_Employees](
	[Employee_ID] [varchar](10) NOT NULL,
	[First_Name] [varchar](20) NOT NULL,
	[Last_Name] [varchar](20) NOT NULL,
	[Gender] [varchar](6) NOT NULL,
	[Phone] [bigint] NOT NULL,
	[Email_ID] [varchar](50) NULL,
	[DOB] [date] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Employee_Type] [varchar](10) NOT NULL,
	[Blood_Group] [varchar](3) NOT NULL,
 CONSTRAINT [All_Employees_pk] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance_Tracker]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance_Tracker](
	[Attendance_tracker_Id] [int] NOT NULL,
	[Check_In] [datetime] NOT NULL,
	[Check_Out] [datetime] NOT NULL,
	[All_Employees_Employee_ID] [varchar](10) NOT NULL,
	[In_Hours] [time](2) NULL,
 CONSTRAINT [Attendance_Tracker_pk] PRIMARY KEY CLUSTERED 
(
	[Attendance_tracker_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_ID] [varchar](10) NOT NULL,
	[Date_And_Time] [datetime] NOT NULL,
	[Visit_Visit_ID] [varchar](10) NOT NULL,
	[Consult_Consult_ID] [varchar](10) NOT NULL,
	[Surgery_Booking_Surgery_Booking_ID] [varchar](10) NOT NULL,
	[Test_Booking_Test_Booking_ID] [varchar](10) NOT NULL,
 CONSTRAINT [Bill_pk] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consult]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consult](
	[Consult_ID] [varchar](10) NOT NULL,
	[Date_And_Time] [datetime] NOT NULL,
	[Cost] [money] NOT NULL,
	[Payment_Status] [bit] NOT NULL,
	[All_Employees_Employee_ID] [varchar](10) NOT NULL,
	[Visit_Visit_ID] [varchar](10) NOT NULL,
 CONSTRAINT [Consult_pk] PRIMARY KEY CLUSTERED 
(
	[Consult_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Department_ID] [varchar](10) NOT NULL,
	[Department_Name] [varchar](30) NOT NULL,
	[Wing_Number] [varchar](5) NOT NULL,
	[Floor] [int] NOT NULL,
 CONSTRAINT [Department_pk] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department_Surgery]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_Surgery](
	[Department_Surgery_ID] [varchar](10) NOT NULL,
	[Surgery_Surgery_ID] [varchar](10) NOT NULL,
	[Department_Department_ID] [varchar](10) NOT NULL,
 CONSTRAINT [Department_Surgery_pk] PRIMARY KEY CLUSTERED 
(
	[Department_Surgery_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[Designation_ID] [varchar](10) NOT NULL,
	[Designation_Name] [varchar](30) NOT NULL,
 CONSTRAINT [Designation_pk] PRIMARY KEY CLUSTERED 
(
	[Designation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor_Surgery]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor_Surgery](
	[Doctor_Surgery_ID] [int] NOT NULL,
	[All_Employees_Employee_ID] [varchar](10) NOT NULL,
	[Surgery_Surgery_ID] [varchar](10) NOT NULL,
 CONSTRAINT [Doctor_Surgery_pk] PRIMARY KEY CLUSTERED 
(
	[Doctor_Surgery_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Designation_Department]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Designation_Department](
	[Employee_Designation_ID] [varchar](10) NOT NULL,
	[Department_Department_ID] [varchar](10) NOT NULL,
	[Designation_Designation_ID] [varchar](10) NOT NULL,
	[Date_When_Assigned] [date] NOT NULL,
	[All_Employees_Employee_ID] [varchar](10) NOT NULL,
 CONSTRAINT [Employee_Designation_Department_pk] PRIMARY KEY CLUSTERED 
(
	[Employee_Designation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lab]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lab](
	[Lab_ID] [varchar](10) NOT NULL,
	[Wing] [varchar](5) NOT NULL,
	[Floor] [int] NOT NULL,
 CONSTRAINT [Lab_pk] PRIMARY KEY CLUSTERED 
(
	[Lab_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lab_Department_Test]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lab_Department_Test](
	[Lab_Department_Test_ID] [int] NOT NULL,
	[Lab_Lab_ID] [varchar](10) NOT NULL,
	[Tests_Test_ID] [varchar](10) NOT NULL,
	[Department_Department_ID] [varchar](10) NOT NULL,
 CONSTRAINT [Lab_Department_Test_pk] PRIMARY KEY CLUSTERED 
(
	[Lab_Department_Test_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Patient_ID] [varchar](10) NOT NULL,
	[First_Name] [varchar](20) NOT NULL,
	[Last_Name] [varchar](20) NULL,
	[Phone] [bigint] NOT NULL,
	[Email_ID] [varchar](50) NULL,
	[Blood_group] [varchar](3) NOT NULL,
	[Address] [varchar](30) NOT NULL,
	[Gender] [char](1) NULL,
 CONSTRAINT [Patient_pk] PRIMARY KEY CLUSTERED 
(
	[Patient_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_Visit]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Visit](
	[Patient_Patient_ID] [varchar](10) NOT NULL,
	[Visit_Visit_ID] [varchar](10) NOT NULL,
 CONSTRAINT [Patient_Visit_pk] PRIMARY KEY CLUSTERED 
(
	[Patient_Patient_ID] ASC,
	[Visit_Visit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Room_ID] [varchar](5) NOT NULL,
	[Room_Number] [int] NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[Wing] [varchar](5) NOT NULL,
	[Floor] [int] NOT NULL,
	[Cost_Per_Day] [money] NOT NULL,
 CONSTRAINT [Room_pk] PRIMARY KEY CLUSTERED 
(
	[Room_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room_Booking]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_Booking](
	[Room_Booking_ID] [varchar](10) NOT NULL,
	[Date_And_Time] [datetime] NOT NULL,
	[Payment_Status] [bit] NOT NULL,
	[Visit_Visit_ID] [varchar](10) NOT NULL,
	[Room_Room_ID] [varchar](5) NOT NULL,
 CONSTRAINT [Room_Booking_pk] PRIMARY KEY CLUSTERED 
(
	[Room_Booking_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surgery]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surgery](
	[Surgery_ID] [varchar](10) NOT NULL,
	[Surgery_Name] [varchar](255) NOT NULL,
	[Surgery_Cost] [money] NOT NULL,
 CONSTRAINT [Surgery_pk] PRIMARY KEY CLUSTERED 
(
	[Surgery_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surgery_Booking]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surgery_Booking](
	[Surgery_Booking_ID] [varchar](10) NOT NULL,
	[Date_And_Time] [datetime] NOT NULL,
	[Payment_Status] [bit] NOT NULL,
	[Visit_Visit_ID] [varchar](10) NOT NULL,
	[Surgery_Surgery_ID] [varchar](10) NOT NULL,
	[All_Employees_Employee_ID] [varchar](10) NOT NULL,
	[Surgery_Theatre_Surgery_ID] [varchar](10) NOT NULL,
 CONSTRAINT [Surgery_Booking_pk] PRIMARY KEY CLUSTERED 
(
	[Surgery_Booking_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surgery_Theatre]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surgery_Theatre](
	[Surgery_Theatre_ID] [varchar](10) NOT NULL,
	[Wing_Number] [varchar](5) NOT NULL,
	[Floor] [int] NOT NULL,
 CONSTRAINT [Surgery_Theatre_pk] PRIMARY KEY CLUSTERED 
(
	[Surgery_Theatre_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surgery_Tracker]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surgery_Tracker](
	[Surgery_Tracker_ID] [int] NOT NULL,
	[Surgery_Booking_Surgery_Booking_ID] [varchar](10) NOT NULL,
	[Start_Time] [datetime] NULL,
	[End_Time] [datetime] NOT NULL,
 CONSTRAINT [Surgery_Tracker_pk] PRIMARY KEY CLUSTERED 
(
	[Surgery_Tracker_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test_Booking]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_Booking](
	[Test_Booking_ID] [varchar](10) NOT NULL,
	[Date_And_Time] [datetime] NOT NULL,
	[Payment_Status] [bit] NOT NULL,
	[Visit_Visit_ID] [varchar](10) NOT NULL,
	[Tests_Test_ID] [varchar](10) NOT NULL,
	[Lab_Lab_ID] [varchar](10) NOT NULL,
 CONSTRAINT [Test_Booking_pk] PRIMARY KEY CLUSTERED 
(
	[Test_Booking_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[Test_ID] [varchar](10) NOT NULL,
	[Test_Name] [varchar](10) NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [Tests_pk] PRIMARY KEY CLUSTERED 
(
	[Test_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].['Tests and Scans$']    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].['Tests and Scans$'](
	[Test_ID] [nvarchar](255) NULL,
	[Test_Name] [nvarchar](255) NULL,
	[Cost] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 13-09-2019 19:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[Visit_ID] [varchar](10) NOT NULL,
	[DOA] [datetime] NOT NULL,
	[DOD] [datetime] NULL,
	[Visit_Type] [char](2) NOT NULL,
	[Patient_Patient_ID] [varchar](10) NOT NULL,
 CONSTRAINT [Visit_pk] PRIMARY KEY CLUSTERED 
(
	[Visit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendance_Tracker]  WITH CHECK ADD  CONSTRAINT [Attendance_Tracker_All_Employees] FOREIGN KEY([All_Employees_Employee_ID])
REFERENCES [dbo].[All_Employees] ([Employee_ID])
GO
ALTER TABLE [dbo].[Attendance_Tracker] CHECK CONSTRAINT [Attendance_Tracker_All_Employees]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [Bill_Consult] FOREIGN KEY([Consult_Consult_ID])
REFERENCES [dbo].[Consult] ([Consult_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [Bill_Consult]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [Bill_Surgery_Booking] FOREIGN KEY([Surgery_Booking_Surgery_Booking_ID])
REFERENCES [dbo].[Surgery_Booking] ([Surgery_Booking_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [Bill_Surgery_Booking]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [Bill_Test_Booking] FOREIGN KEY([Test_Booking_Test_Booking_ID])
REFERENCES [dbo].[Test_Booking] ([Test_Booking_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [Bill_Test_Booking]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [Bill_Visit] FOREIGN KEY([Visit_Visit_ID])
REFERENCES [dbo].[Visit] ([Visit_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [Bill_Visit]
GO
ALTER TABLE [dbo].[Consult]  WITH CHECK ADD  CONSTRAINT [Consult_All_Employees] FOREIGN KEY([All_Employees_Employee_ID])
REFERENCES [dbo].[All_Employees] ([Employee_ID])
GO
ALTER TABLE [dbo].[Consult] CHECK CONSTRAINT [Consult_All_Employees]
GO
ALTER TABLE [dbo].[Consult]  WITH CHECK ADD  CONSTRAINT [Consult_Visit] FOREIGN KEY([Visit_Visit_ID])
REFERENCES [dbo].[Visit] ([Visit_ID])
GO
ALTER TABLE [dbo].[Consult] CHECK CONSTRAINT [Consult_Visit]
GO
ALTER TABLE [dbo].[Department_Surgery]  WITH CHECK ADD  CONSTRAINT [Department_Surgery_Department] FOREIGN KEY([Department_Department_ID])
REFERENCES [dbo].[Department] ([Department_ID])
GO
ALTER TABLE [dbo].[Department_Surgery] CHECK CONSTRAINT [Department_Surgery_Department]
GO
ALTER TABLE [dbo].[Department_Surgery]  WITH CHECK ADD  CONSTRAINT [Department_Surgery_Surgery] FOREIGN KEY([Surgery_Surgery_ID])
REFERENCES [dbo].[Surgery] ([Surgery_ID])
GO
ALTER TABLE [dbo].[Department_Surgery] CHECK CONSTRAINT [Department_Surgery_Surgery]
GO
ALTER TABLE [dbo].[Doctor_Surgery]  WITH CHECK ADD  CONSTRAINT [Doctor_Surgery_All_Employees] FOREIGN KEY([All_Employees_Employee_ID])
REFERENCES [dbo].[All_Employees] ([Employee_ID])
GO
ALTER TABLE [dbo].[Doctor_Surgery] CHECK CONSTRAINT [Doctor_Surgery_All_Employees]
GO
ALTER TABLE [dbo].[Doctor_Surgery]  WITH CHECK ADD  CONSTRAINT [Doctor_Surgery_Surgery] FOREIGN KEY([Surgery_Surgery_ID])
REFERENCES [dbo].[Surgery] ([Surgery_ID])
GO
ALTER TABLE [dbo].[Doctor_Surgery] CHECK CONSTRAINT [Doctor_Surgery_Surgery]
GO
ALTER TABLE [dbo].[Employee_Designation_Department]  WITH CHECK ADD  CONSTRAINT [Employee_Designation_Department_All_Employees] FOREIGN KEY([All_Employees_Employee_ID])
REFERENCES [dbo].[All_Employees] ([Employee_ID])
GO
ALTER TABLE [dbo].[Employee_Designation_Department] CHECK CONSTRAINT [Employee_Designation_Department_All_Employees]
GO
ALTER TABLE [dbo].[Employee_Designation_Department]  WITH CHECK ADD  CONSTRAINT [Employee_Designation_Department_Department] FOREIGN KEY([Department_Department_ID])
REFERENCES [dbo].[Department] ([Department_ID])
GO
ALTER TABLE [dbo].[Employee_Designation_Department] CHECK CONSTRAINT [Employee_Designation_Department_Department]
GO
ALTER TABLE [dbo].[Employee_Designation_Department]  WITH CHECK ADD  CONSTRAINT [Employee_Designation_Department_Designation] FOREIGN KEY([Designation_Designation_ID])
REFERENCES [dbo].[Designation] ([Designation_ID])
GO
ALTER TABLE [dbo].[Employee_Designation_Department] CHECK CONSTRAINT [Employee_Designation_Department_Designation]
GO
ALTER TABLE [dbo].[Lab_Department_Test]  WITH CHECK ADD  CONSTRAINT [Lab_Department_Test_Department] FOREIGN KEY([Department_Department_ID])
REFERENCES [dbo].[Department] ([Department_ID])
GO
ALTER TABLE [dbo].[Lab_Department_Test] CHECK CONSTRAINT [Lab_Department_Test_Department]
GO
ALTER TABLE [dbo].[Lab_Department_Test]  WITH CHECK ADD  CONSTRAINT [Lab_Department_Test_Lab] FOREIGN KEY([Lab_Lab_ID])
REFERENCES [dbo].[Lab] ([Lab_ID])
GO
ALTER TABLE [dbo].[Lab_Department_Test] CHECK CONSTRAINT [Lab_Department_Test_Lab]
GO
ALTER TABLE [dbo].[Lab_Department_Test]  WITH CHECK ADD  CONSTRAINT [Lab_Department_Test_Tests] FOREIGN KEY([Tests_Test_ID])
REFERENCES [dbo].[Tests] ([Test_ID])
GO
ALTER TABLE [dbo].[Lab_Department_Test] CHECK CONSTRAINT [Lab_Department_Test_Tests]
GO
ALTER TABLE [dbo].[Patient_Visit]  WITH CHECK ADD  CONSTRAINT [Patient_Visit_Patient] FOREIGN KEY([Patient_Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
ALTER TABLE [dbo].[Patient_Visit] CHECK CONSTRAINT [Patient_Visit_Patient]
GO
ALTER TABLE [dbo].[Patient_Visit]  WITH CHECK ADD  CONSTRAINT [Patient_Visit_Visit] FOREIGN KEY([Visit_Visit_ID])
REFERENCES [dbo].[Visit] ([Visit_ID])
GO
ALTER TABLE [dbo].[Patient_Visit] CHECK CONSTRAINT [Patient_Visit_Visit]
GO
ALTER TABLE [dbo].[Room_Booking]  WITH CHECK ADD  CONSTRAINT [Room_Booking_Room] FOREIGN KEY([Room_Room_ID])
REFERENCES [dbo].[Room] ([Room_ID])
GO
ALTER TABLE [dbo].[Room_Booking] CHECK CONSTRAINT [Room_Booking_Room]
GO
ALTER TABLE [dbo].[Room_Booking]  WITH CHECK ADD  CONSTRAINT [Room_Booking_Visit] FOREIGN KEY([Visit_Visit_ID])
REFERENCES [dbo].[Visit] ([Visit_ID])
GO
ALTER TABLE [dbo].[Room_Booking] CHECK CONSTRAINT [Room_Booking_Visit]
GO
ALTER TABLE [dbo].[Surgery_Booking]  WITH CHECK ADD  CONSTRAINT [Surgery_Booking_All_Employees] FOREIGN KEY([All_Employees_Employee_ID])
REFERENCES [dbo].[All_Employees] ([Employee_ID])
GO
ALTER TABLE [dbo].[Surgery_Booking] CHECK CONSTRAINT [Surgery_Booking_All_Employees]
GO
ALTER TABLE [dbo].[Surgery_Booking]  WITH CHECK ADD  CONSTRAINT [Surgery_Booking_Surgery] FOREIGN KEY([Surgery_Surgery_ID])
REFERENCES [dbo].[Surgery] ([Surgery_ID])
GO
ALTER TABLE [dbo].[Surgery_Booking] CHECK CONSTRAINT [Surgery_Booking_Surgery]
GO
ALTER TABLE [dbo].[Surgery_Booking]  WITH CHECK ADD  CONSTRAINT [Surgery_Booking_Surgery_Theatre] FOREIGN KEY([Surgery_Theatre_Surgery_ID])
REFERENCES [dbo].[Surgery_Theatre] ([Surgery_Theatre_ID])
GO
ALTER TABLE [dbo].[Surgery_Booking] CHECK CONSTRAINT [Surgery_Booking_Surgery_Theatre]
GO
ALTER TABLE [dbo].[Surgery_Booking]  WITH CHECK ADD  CONSTRAINT [Surgery_Booking_Visit] FOREIGN KEY([Visit_Visit_ID])
REFERENCES [dbo].[Visit] ([Visit_ID])
GO
ALTER TABLE [dbo].[Surgery_Booking] CHECK CONSTRAINT [Surgery_Booking_Visit]
GO
ALTER TABLE [dbo].[Surgery_Tracker]  WITH CHECK ADD  CONSTRAINT [Surgery_Tracker_Surgery_Booking] FOREIGN KEY([Surgery_Booking_Surgery_Booking_ID])
REFERENCES [dbo].[Surgery_Booking] ([Surgery_Booking_ID])
GO
ALTER TABLE [dbo].[Surgery_Tracker] CHECK CONSTRAINT [Surgery_Tracker_Surgery_Booking]
GO
ALTER TABLE [dbo].[Test_Booking]  WITH CHECK ADD  CONSTRAINT [Test_Booking_Lab] FOREIGN KEY([Lab_Lab_ID])
REFERENCES [dbo].[Lab] ([Lab_ID])
GO
ALTER TABLE [dbo].[Test_Booking] CHECK CONSTRAINT [Test_Booking_Lab]
GO
ALTER TABLE [dbo].[Test_Booking]  WITH CHECK ADD  CONSTRAINT [Test_Booking_Tests] FOREIGN KEY([Tests_Test_ID])
REFERENCES [dbo].[Tests] ([Test_ID])
GO
ALTER TABLE [dbo].[Test_Booking] CHECK CONSTRAINT [Test_Booking_Tests]
GO
ALTER TABLE [dbo].[Test_Booking]  WITH CHECK ADD  CONSTRAINT [Test_Booking_Visit] FOREIGN KEY([Visit_Visit_ID])
REFERENCES [dbo].[Visit] ([Visit_ID])
GO
ALTER TABLE [dbo].[Test_Booking] CHECK CONSTRAINT [Test_Booking_Visit]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [Visit_Patient] FOREIGN KEY([Patient_Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [Visit_Patient]
GO
