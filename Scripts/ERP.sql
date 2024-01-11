USE [KramseRawdata]
GO
/****** Object:  Table [dbo].[Consignors]    Script Date: 6/16/2022 1:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consignors](
	[Id] [int] NULL,
	[Consignor] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Discount] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Containers]    Script Date: 6/16/2022 1:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Containers](
	[Id] [int] NULL,
	[Type] [nvarchar](255) NULL,
	[RefrigerationFlag] [bit] NULL,
	[PowerFlag] [nvarchar](255) NULL,
	[Length] [decimal](18, 0) NULL,
	[Cubes] [decimal](18, 0) NULL,
	[EuroPricePerKm] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 6/16/2022 1:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] NULL,
	[CountryName_EN] [nvarchar](255) NULL,
	[CountryName_NL] [nvarchar](255) NULL,
	[Alpha_2_Code] [nvarchar](2) NULL,
	[Alpha_3_Code] [nvarchar](3) NULL,
	[CountryName_EN_Alternative] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EU_MRV]    Script Date: 6/16/2022 1:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EU_MRV](
	[IMO_Number] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Ship_Type] [nvarchar](255) NULL,
	[Reporting_Period] [int] NULL,
	[Technical_Efficiency] [nvarchar](255) NULL,
	[Port_Of_Registry] [nvarchar](255) NULL,
	[Home_Port] [nvarchar](255) NULL,
	[Ice_Class] [nvarchar](255) NULL,
	[Verifier_Number] [nvarchar](255) NULL,
	[Verifier_Name] [nvarchar](255) NULL,
	[Verifier_NAB] [nvarchar](255) NULL,
	[Verifier_Address] [nvarchar](255) NULL,
	[Verifier_City] [nvarchar](255) NULL,
	[Verifier_Accreditation_Number] [nvarchar](255) NULL,
	[Verifier_Country] [nvarchar](255) NULL,
	[Total_Fuel_Consumption_M_Tonnes] [decimal](18, 0) NULL,
	[Fuel _Consumptions_On_laden_M_Ton] [decimal](18, 0) NULL,
	[Total_CO2_Emissions_M_Ton] [decimal](18, 0) NULL,
	[CO2_Emissions_Between_Ports_MS_Jurisdic] [decimal](18, 0) NULL,
	[CO2_Emissions_Departed_From_Ports_MS_Jurisdic] [decimal](18, 0) NULL,
	[CO2_Emissions_To_Ports_MS_Jurisdic_M_Ton] [decimal](18, 0) NULL,
	[CO2_Emissions_Ports_MS_Jurisdic_Berth_M_Ton] [decimal](18, 0) NULL,
	[CO2_Emissions_Passenger_Transport_M_Ton] [decimal](18, 0) NULL,
	[CO2_Emissions_Freight_Transport_M_Ton] [decimal](18, 0) NULL,
	[CO2_Emissions_On_Laden_M_Ton] [decimal](18, 0) NULL,
	[Annual_Total_Time_Sea_Hours] [decimal](18, 0) NULL,
	[Annual_AVG_Fuel_Consumption_Per_Distance_Kg_N_Mile] [decimal](18, 0) NULL,
	[Annual_AVG_Fuel_Consumption_Per_Transport_Mass_gPerMTon_nMile] [decimal](18, 0) NULL,
	[Annual_AVG_Fuel_Consumption_Per_Transport_Vol_gPerMCub_nMile] [decimal](18, 0) NULL,
	[Annual_AVG_Fuel_Consumption_Per_Transport_Dwt_gPerDwt_nMile] [decimal](18, 0) NULL,
	[Annual_AVG_Fuel_Consumption_Per_Transport_Pax_gPerPax_nMile] [decimal](18, 0) NULL,
	[Annual_AVG_Fuel_Consumption_Per_Transport_Freight_gPerMTon_nMile] [decimal](18, 0) NULL,
	[Annual_AVG_CO2_Emission_Per_Distance_kgCO2PerNMile] [decimal](18, 0) NULL,
	[Annual_AVG_CO2_Emission_Per_Transport_Mass_gCO2PerMTon_nMile] [decimal](18, 0) NULL,
	[Annual_AVG_CO2_Emission_Per_Transport_Vol_gCO2PerMCub_nMile] [decimal](18, 0) NULL,
	[Annual_AVG_CO2_Emission_Per_Transport_Dwt_gCO2PerNDwt_nMile] [decimal](18, 0) NULL,
	[Annual_AVG_CO2_Emission_Per_Transport_Pax_gCO2PerPax_nMile] [decimal](18, 0) NULL,
	[Annual_AVG_CO2_Emission_Per_Transport_Freig_gCO2PerMTon_nMile] [decimal](18, 0) NULL,
	[Through_Ice_Mile] [decimal](18, 0) NULL,
	[Total_Time_At_Sea_Hours] [decimal](18, 0) NULL,
	[Total_Time_At_Sea_Through_Ice_Hours] [decimal](18, 0) NULL,
	[Fuel_Consumption_Per_Distance_Laden_Voyages_KgPerNMile] [decimal](18, 0) NULL,
	[Fuel_Consumption_Per_Transport_Mass_Laden_Voyages_gPerMTon_nMile] [decimal](18, 0) NULL,
	[Fuel_Consumption_Per_Transport_Vol_Laden_Voyages_gPerMCub_nMile] [decimal](18, 0) NULL,
	[Fuel_Consumption_Per_Transport_Dwt_Laden_Voyages_gPerNDwt_nMile] [decimal](18, 0) NULL,
	[Fuel_Consumption_Per_Transport_Pax_Laden_Voyages_gPerPax_nMile] [decimal](18, 0) NULL,
	[Fuel_Consumption_Per_Transport_Freig_Laden_Voyages_gPermTon_nMile] [decimal](18, 0) NULL,
	[CO2_Emission_Per_Distance_Laden_Voyages_kgCO2PerNmile] [decimal](18, 0) NULL,
	[CO2_Emission_Per_Transport_Mass_Laden_Voyages_gCO2PerMTon_nMile] [decimal](18, 0) NULL,
	[CO2_Emission_Per_Transport_Vol_Laden_Voyages_gCO2PerMCub_nMile] [decimal](18, 0) NULL,
	[CO2_Emission_Per_Transport_Dwt_Laden_Voyages_gCO2PerNDwt_nMile] [decimal](18, 0) NULL,
	[CO2_Emission_Per_Transport_Pax_Laden_Voyages_gCO2PerPax_nMile] [decimal](18, 0) NULL,
	[CO2_Emission_Per_Transport_Freig_Laden_Voyages_gCO2PerMTon_nMile] [decimal](18, 0) NULL,
	[AVG_Density_Cargo_Transported_mTonPerMCub] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 6/16/2022 1:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[item_key] [int] NULL,
	[item_description] [nvarchar](50) NULL,
	[item_category] [nvarchar](50) NULL,
	[item_mfgr] [nvarchar](50) NULL,
	[item_storage_type] [nvarchar](50) NULL,
	[item_hazard_flag] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Port]    Script Date: 6/16/2022 1:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Port](
	[P_PortOrder] [nvarchar](50) NULL,
	[VPS_PortId] [int] NULL,
	[P_PortName] [nvarchar](50) NULL,
	[P_Country] [nvarchar](50) NULL,
	[P_DistanceFromOslo] [int] NULL,
	[P_DistanceFromPiraeus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 6/16/2022 1:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[VS_Shipid] [int] NULL,
	[Sh_Shipname] [nvarchar](50) NULL,
	[Sh_MaxNumberContain] [int] NULL,
	[Sh_SpeedInKnots] [int] NULL,
	[Sh_SpeedInKm_H] [int] NULL,
	[Sh_Country] [nvarchar](50) NULL,
	[Sh_Yearcost] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 6/16/2022 1:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ShipmentId] [int] NULL,
	[VoyageId] [int] NULL,
	[ConsignorId] [int] NULL,
	[PortIdFrom] [int] NULL,
	[PortIdTo] [int] NULL,
	[Distance] [int] NULL,
	[NumberContainers] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDetail]    Script Date: 6/16/2022 1:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDetail](
	[ShipmentId] [int] NULL,
	[ContainerNr] [nvarchar](50) NULL,
	[Item] [int] NULL,
	[ContainertypeId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voyage]    Script Date: 6/16/2022 1:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voyage](
	[VV_VoyageId] [int] NULL,
	[VS_ShipId] [int] NULL,
	[V_DateDepartVoyage] [date] NULL,
	[VPS_PortIdStart] [int] NULL,
	[V_PortIdEnd] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoyagePort]    Script Date: 6/16/2022 1:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoyagePort](
	[VV_VoyageId] [int] NULL,
	[VP_PortIdCurrent] [int] NULL,
	[Vp_PortIdNext] [int] NULL,
	[Vp_LegDateDepart] [date] NULL,
	[Vp_LegDateArrival] [date] NULL,
	[Vp_Traject_Distance] [int] NULL,
	[Vp_PortOrder] [nvarchar](50) NULL
) ON [PRIMARY]
GO
