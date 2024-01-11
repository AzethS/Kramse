USE [KramseODS]
GO
/****** Object:  Table [dbo].[ODS_D_Calendar]    Script Date: 6/16/2022 1:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ODS_D_Calendar](
	[CalendarId] [date] NOT NULL,
	[Day_Of_Month] [int] NOT NULL,
	[Calendar_Year] [int] NOT NULL,
	[Calendar_Month_Nr] [int] NOT NULL,
	[Calendar_Quarter] [int] NOT NULL,
	[Calendar_Month_ISO] [nvarchar](7) NOT NULL,
	[Calendar_Month_Name] [nvarchar](10) NOT NULL,
	[Weekday_Nr] [int] NOT NULL,
	[Calendar_Week_ISO] [int] NOT NULL,
	[Calendar_Week_ISO_Long] [nvarchar](8) NOT NULL,
	[Calendar_ISO_Year] [int] NOT NULL,
	[Calendar_Season] [nvarchar](100) NOT NULL,
	[Calendar_Season_Nr] [int] NOT NULL,
 CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED 
(
	[CalendarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ODS_D_Port]    Script Date: 6/16/2022 1:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ODS_D_Port](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Country] [nvarchar](255) NOT NULL,
	[ExtractionDate] [date] NULL,
 CONSTRAINT [PK_Port] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ODS_D_Ship]    Script Date: 6/16/2022 1:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ODS_D_Ship](
	[ShipRowId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[MaxContainers] [int] NULL,
	[SpeedInKnots] [int] NOT NULL,
	[SpeedInKmH] [int] NOT NULL,
	[Country] [nvarchar](255) NOT NULL,
	[YearCost] [money] NOT NULL,
	[TotalFuelConsumption_M_Tonnes] [float] NULL,
	[TotalCO2Emissions_M_Ton] [float] NULL,
	[AnnualAVGFuelConsumptionPerDistanceKg_N_Mile] [float] NULL,
	[AnnualAVGCO2EmissionPerDistance_kg_Per_N_Mile] [float] NULL,
	[Annual_AVG_Fuel_Consumption_Per_Transport_Mass_gPerMTon_nMile] [float] NULL,
	[ExtractionDate] [date] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_Ship] PRIMARY KEY CLUSTERED 
(
	[ShipRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ODS_F_Voyage]    Script Date: 6/16/2022 1:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ODS_F_Voyage](
	[VoyageRowId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [int] NOT NULL,
	[VoyageId] [int] NOT NULL,
	[ShipRowId] [int] NOT NULL,
	[VoyageDateDepart] [date] NOT NULL,
	[PortIdStart] [int] NOT NULL,
	[PortIdEnd] [int] NOT NULL,
	[PortIdCurrent] [int] NULL,
	[PortIdNext] [int] NULL,
	[LegDateDepart] [date] NULL,
	[LegDateArrival] [date] NULL,
	[TrajectDistance] [int] NULL,
	[TotalAmountContainers] [int] NULL,
	[DelayInDays] [int] NULL,
	[ExtractionDate] [date] NULL,
 CONSTRAINT [UK_Voyage] UNIQUE NONCLUSTERED 
(
	[Id] ASC,
	[VoyageId] ASC,
	[ShipRowId] ASC,
	[VoyageDateDepart] ASC,
	[PortIdStart] ASC,
	[PortIdEnd] ASC,
	[PortIdCurrent] ASC,
	[PortIdNext] ASC,
	[LegDateDepart] ASC,
	[LegDateArrival] ASC,
	[TrajectDistance] ASC,
	[TotalAmountContainers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ODS_F_Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_LegDateArrival] FOREIGN KEY([LegDateArrival])
REFERENCES [dbo].[ODS_D_Calendar] ([CalendarId])
GO
ALTER TABLE [dbo].[ODS_F_Voyage] CHECK CONSTRAINT [FK_Voyage_LegDateArrival]
GO
ALTER TABLE [dbo].[ODS_F_Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_LegDateDepart] FOREIGN KEY([LegDateDepart])
REFERENCES [dbo].[ODS_D_Calendar] ([CalendarId])
GO
ALTER TABLE [dbo].[ODS_F_Voyage] CHECK CONSTRAINT [FK_Voyage_LegDateDepart]
GO
ALTER TABLE [dbo].[ODS_F_Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Port_Current] FOREIGN KEY([PortIdCurrent])
REFERENCES [dbo].[ODS_D_Port] ([Id])
GO
ALTER TABLE [dbo].[ODS_F_Voyage] CHECK CONSTRAINT [FK_Voyage_Port_Current]
GO
ALTER TABLE [dbo].[ODS_F_Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Port_End] FOREIGN KEY([PortIdEnd])
REFERENCES [dbo].[ODS_D_Port] ([Id])
GO
ALTER TABLE [dbo].[ODS_F_Voyage] CHECK CONSTRAINT [FK_Voyage_Port_End]
GO
ALTER TABLE [dbo].[ODS_F_Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Port_Next] FOREIGN KEY([PortIdNext])
REFERENCES [dbo].[ODS_D_Port] ([Id])
GO
ALTER TABLE [dbo].[ODS_F_Voyage] CHECK CONSTRAINT [FK_Voyage_Port_Next]
GO
ALTER TABLE [dbo].[ODS_F_Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Port_Start] FOREIGN KEY([PortIdStart])
REFERENCES [dbo].[ODS_D_Port] ([Id])
GO
ALTER TABLE [dbo].[ODS_F_Voyage] CHECK CONSTRAINT [FK_Voyage_Port_Start]
GO
ALTER TABLE [dbo].[ODS_F_Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Ship] FOREIGN KEY([ShipRowId])
REFERENCES [dbo].[ODS_D_Ship] ([ShipRowId])
GO
ALTER TABLE [dbo].[ODS_F_Voyage] CHECK CONSTRAINT [FK_Voyage_Ship]
GO
ALTER TABLE [dbo].[ODS_F_Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_VoyageDateDepart] FOREIGN KEY([VoyageDateDepart])
REFERENCES [dbo].[ODS_D_Calendar] ([CalendarId])
GO
ALTER TABLE [dbo].[ODS_F_Voyage] CHECK CONSTRAINT [FK_Voyage_VoyageDateDepart]
GO
