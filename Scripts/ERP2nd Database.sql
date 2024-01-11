USE [KramseERP2ND]
GO
/****** Object:  Table [dbo].[D_Calendar]    Script Date: 6/16/2022 1:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Calendar](
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
/****** Object:  Table [dbo].[D_Port]    Script Date: 6/16/2022 1:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Port](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Country] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Port] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Ship]    Script Date: 6/16/2022 1:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Ship](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[MaxContainers] [int] NULL,
	[SpeedInKnots] [int] NOT NULL,
	[SpeedInKmH] [int] NOT NULL,
	[Country] [nvarchar](255) NOT NULL,
	[YearCost] [money] NOT NULL,
	[TotalFuelConsumption_M_Tonnes] [decimal](18, 0) NULL,
	[TotalCO2Emissions_M_Ton] [decimal](18, 0) NULL,
	[AnnualAVGFuelConsumptionPerDistanceKg_N_Mile] [decimal](18, 0) NULL,
	[AnnualAVGCO2EmissionPerDistance_kg_Per_N_Mile] [decimal](18, 0) NULL,
	[Annual_AVG_Fuel_Consumption_Per_Transport_Mass_gPerMTon_nMile] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Ship] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Shipment]    Script Date: 6/16/2022 1:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Shipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VoyageId] [int] NOT NULL,
	[PortIdFrom] [int] NOT NULL,
	[PortIdTo] [int] NOT NULL,
	[TotalAmountContainers] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Voyage]    Script Date: 6/16/2022 1:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Voyage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VoyageId] [int] NOT NULL,
	[ShipId] [int] NOT NULL,
	[VoyageDateDepart] [date] NOT NULL,
	[PortIdStart] [int] NOT NULL,
	[PortIdEnd] [int] NOT NULL,
	[PortIdCurrent] [int] NULL,
	[PortIdNext] [int] NULL,
	[LegDateDepart] [date] NULL,
	[LegDateArrival] [date] NULL,
	[TrajectDistance] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_PortFrom] FOREIGN KEY([PortIdFrom])
REFERENCES [dbo].[D_Port] ([Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_Shipment_PortFrom]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_PortTo] FOREIGN KEY([PortIdTo])
REFERENCES [dbo].[D_Port] ([Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_Shipment_PortTo]
GO
ALTER TABLE [dbo].[F_Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_LegDateArrival] FOREIGN KEY([LegDateArrival])
REFERENCES [dbo].[D_Calendar] ([CalendarId])
GO
ALTER TABLE [dbo].[F_Voyage] CHECK CONSTRAINT [FK_Voyage_LegDateArrival]
GO
ALTER TABLE [dbo].[F_Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_LegDateDepart] FOREIGN KEY([LegDateDepart])
REFERENCES [dbo].[D_Calendar] ([CalendarId])
GO
ALTER TABLE [dbo].[F_Voyage] CHECK CONSTRAINT [FK_Voyage_LegDateDepart]
GO
ALTER TABLE [dbo].[F_Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_VoyageDateDepart] FOREIGN KEY([VoyageDateDepart])
REFERENCES [dbo].[D_Calendar] ([CalendarId])
GO
ALTER TABLE [dbo].[F_Voyage] CHECK CONSTRAINT [FK_Voyage_VoyageDateDepart]
GO
