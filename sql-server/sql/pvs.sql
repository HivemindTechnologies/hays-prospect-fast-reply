USE [PVS]
GO
/****** Object:  Table [dbo].[Abteilung]    Script Date: 19.01.2022 12:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abteilung](
	[Abteilungs_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Abteilungsname] [varchar](200) NOT NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[erstellt_am] [smalldatetime] NULL,
	[Firma] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Abteilungen] PRIMARY KEY NONCLUSTERED 
(
	[Abteilungs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[App_Services]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App_Services](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Assemblypath] [varchar](255) NULL,
	[Servicename] [varchar](50) NULL,
	[Interfacename] [varchar](50) NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_App_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApproachabilityIndex]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApproachabilityIndex](
	[ApproachabilityIndexId] [uniqueidentifier] NOT NULL,
	[BP_Id] [uniqueidentifier] NULL,
	[Kunde_Id] [uniqueidentifier] NULL,
	[APTI_rank] [smallint] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_ApproachabilityIndexId] PRIMARY KEY NONCLUSTERED 
(
	[ApproachabilityIndexId] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arbeitserlaubnisgueltigkeit]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arbeitserlaubnisgueltigkeit](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BPKontakt_ID] [uniqueidentifier] NOT NULL,
	[Arbeitserlaubniskategorie_ID] [uniqueidentifier] NOT NULL,
	[valid_from] [datetime] NULL,
	[valid_until] [datetime] NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NULL,
	[IsUnlimited] [bit] NULL,
	[IsRestricted] [bit] NULL,
	[RestrictionText] [varchar](1024) NULL,
 CONSTRAINT [PK_Arbeitserlaubnisgueltigkeit] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auditprotokoll]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditprotokoll](
	[GUID] [uniqueidentifier] NOT NULL,
	[Tabellename] [sysname] NOT NULL,
	[Aktion] [nvarchar](6) NOT NULL,
	[Datensaetze] [xml] NOT NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[erstellt_am] [datetime2](2) NOT NULL,
 CONSTRAINT [PK_dbo_Auditprotokoll] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bewertungsgruppen_Auspraegung]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bewertungsgruppen_Auspraegung](
	[Bewertungsgruppen_Id] [smallint] NOT NULL,
	[Auspraegung_ID] [tinyint] NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Bewertungsgruppen_Auspraegung] PRIMARY KEY CLUSTERED 
(
	[Bewertungsgruppen_Id] ASC,
	[Auspraegung_ID] ASC,
	[Sprach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BP_Ascena_bereich]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BP_Ascena_bereich](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BP_ID] [uniqueidentifier] NULL,
	[user_id] [uniqueidentifier] NOT NULL,
	[Datum] [smalldatetime] NOT NULL,
	[Zugriffsrolle] [uniqueidentifier] NOT NULL,
	[kunde_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_BP_Ascena_bereich] PRIMARY KEY CLUSTERED 
(
	[id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BP_Mailadressen_Archiv]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BP_Mailadressen_Archiv](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[Mailadresse] [varchar](250) NOT NULL,
	[Erstellt_am] [datetime] NOT NULL,
	[Erstellt_von] [varchar](50) NOT NULL,
	[Geaendert_von] [varchar](50) NULL,
	[Geaendert_am] [datetime] NULL,
 CONSTRAINT [PK_BP_Mailadressen_Archiv] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BP_Zuordnung_WVL]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BP_Zuordnung_WVL](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[user_id] [uniqueidentifier] NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[WV_Datum] [smalldatetime] NULL,
	[Bemerkung] [varchar](2000) NULL,
	[erledigt] [bit] NOT NULL,
	[AppointmentId] [varchar](250) NULL,
 CONSTRAINT [PK_BP_Zuordnung_WVL] PRIMARY KEY CLUSTERED 
(
	[id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusinessPartnerCheck]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessPartnerCheck](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[Tracking_ID] [uniqueidentifier] NOT NULL,
	[Ident_ID] [varchar](50) NOT NULL,
	[StatusCode] [smallint] NOT NULL,
	[OriginalStatusCode] [smallint] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_BusinessPartnerCheck] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidateQS]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateQS](
	[Id] [uniqueidentifier] NOT NULL,
	[BP] [uniqueidentifier] NOT NULL,
	[Qs] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
 CONSTRAINT [PK_CandidateQS_Id] PRIMARY KEY CLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChangeProtocol]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeProtocol](
	[GUID] [uniqueidentifier] NOT NULL,
	[Date] [datetime2](2) NOT NULL,
	[Object_ID] [uniqueidentifier] NOT NULL,
	[ObjectType] [uniqueidentifier] NOT NULL,
	[Reason] [nvarchar](max) NULL,
	[ActionType] [uniqueidentifier] NOT NULL,
	[User_ID] [uniqueidentifier] NOT NULL,
	[internal_comment] [nvarchar](max) NULL,
	[Refer_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ChangeProtocol] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoMa_ht_Kuendigungsfristen]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoMa_ht_Kuendigungsfristen](
	[Guid] [uniqueidentifier] NOT NULL,
	[MANDT] [varchar](3) NOT NULL,
	[ID] [varchar](3) NOT NULL,
	[DESCR] [nvarchar](100) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Created_By] [uniqueidentifier] NOT NULL,
	[Changed] [datetime] NULL,
	[Changed_By] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ht_Kuendigungsfristen] PRIMARY KEY CLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoMa_ht_Kuendigungsfristen_Beschreibung]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoMa_ht_Kuendigungsfristen_Beschreibung](
	[Guid] [uniqueidentifier] NOT NULL,
	[MANDT] [varchar](3) NOT NULL,
	[ID] [varchar](3) NOT NULL,
	[DESCR] [nvarchar](100) NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL,
	[Kuendigungsfristen_ID] [uniqueidentifier] NULL,
	[Created] [datetime] NOT NULL,
	[Created_By] [uniqueidentifier] NOT NULL,
	[Changed] [datetime] NULL,
	[Changed_By] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ht_Kuendigungsfristen_Beschreibung] PRIMARY KEY CLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComLog]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComLog](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[LogDate] [smalldatetime] NOT NULL,
	[TypeObject_ID] [uniqueidentifier] NULL,
	[User_id] [uniqueidentifier] NULL,
	[Text] [text] NULL,
 CONSTRAINT [PK_ComLog] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComObjects]    Script Date: 19.01.2022 12:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComObjects](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ShortDesc] [varchar](50) NULL,
	[Type_ID] [uniqueidentifier] NULL,
	[Ordinal_Position] [int] NOT NULL,
 CONSTRAINT [PK_MessageObjects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComObjectTypes]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComObjectTypes](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MessageObjectTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CP_statuswechsel]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CP_statuswechsel](
	[Wechsel_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Aktueller_Status] [tinyint] NOT NULL,
	[Folgestatus] [tinyint] NOT NULL,
	[AL_Berechtigung] [smallint] NOT NULL,
 CONSTRAINT [PK_CP_statuswechsel] PRIMARY KEY NONCLUSTERED 
(
	[Aktueller_Status] ASC,
	[Folgestatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Beratung_Kontakt]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Beratung_Kontakt](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Mitarbeiterkontakt_ID] [uniqueidentifier] NOT NULL,
	[CT_B_Kontaktart_ID] [uniqueidentifier] NOT NULL,
	[FolgendeSchritte] [varchar](500) NULL,
 CONSTRAINT [PK_CT_Beratung_Kontakt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_BP_Info]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_BP_Info](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[HaysBerater_Beratung] [uniqueidentifier] NOT NULL,
	[HaysBerater_Vermittlung] [uniqueidentifier] NOT NULL,
	[Programm_ID] [uniqueidentifier] NOT NULL,
	[Info1] [varchar](250) NULL,
	[Info2] [varchar](250) NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [datetime] NOT NULL,
 CONSTRAINT [PK_CT_BP_Info] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Vermittlung_Kontakt]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Vermittlung_Kontakt](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Mitarbeiterkontakt_ID] [uniqueidentifier] NOT NULL,
	[CT_V_Kanal_ID] [uniqueidentifier] NOT NULL,
	[CT_V_Kontaktart_ID] [uniqueidentifier] NOT NULL,
	[Zielfirma] [varchar](250) NOT NULL,
	[Position] [varchar](250) NOT NULL,
	[Stichtag] [datetime] NULL,
	[ProspectNr] [varchar](10) NULL,
	[Prospect_ID] [uniqueidentifier] NULL,
	[KAM] [uniqueidentifier] NULL,
 CONSTRAINT [PK_CT_Vermittlung_Kontakt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTI_Telefonliste]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTI_Telefonliste](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Teilnehmer_ID] [uniqueidentifier] NULL,
	[Teilnehmer_Nr] [varchar](255) NULL,
	[Typ_ID] [int] NULL,
 CONSTRAINT [PK_CTI_Telefonliste] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DashboardPlugin]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DashboardPlugin](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UserControlName] [varchar](50) NOT NULL,
	[Icon] [varbinary](max) NULL,
	[Vorschau] [varbinary](max) NULL,
	[MinBreite] [tinyint] NULL,
	[MinHoehe] [tinyint] NULL,
	[OptBreite] [tinyint] NULL,
	[OptHoehe] [tinyint] NULL,
	[MaxBreite] [tinyint] NULL,
	[MaxHoehe] [tinyint] NULL,
	[Aktiv] [bit] NOT NULL,
	[ErstelltVon] [uniqueidentifier] NOT NULL,
	[ErstelltAm] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_DashboardPlugin] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DashboardPluginParameter]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DashboardPluginParameter](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DashboardPluginID] [uniqueidentifier] NOT NULL,
	[UserGUID] [uniqueidentifier] NOT NULL,
	[ParameterXML] [xml] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DashboardPluginParameter] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEUEV_T5D4ATS]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEUEV_T5D4ATS](
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TTSCH] [nvarchar](5) NULL,
	[TTSTX] [nvarchar](230) NULL,
 CONSTRAINT [PK_DEUEV_T5D4ATS] PRIMARY KEY CLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEUEV_T5D4ATS_BRF]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEUEV_T5D4ATS_BRF](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TTSCH] [nvarchar](5) NULL,
	[TTBRF] [nvarchar](3) NULL,
	[BRFTX] [nvarchar](230) NULL,
 CONSTRAINT [PK_DEUEV_T5D4ATS_BRF] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Dokgruppen_Zugriffsrollen]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Dokgruppen_Zugriffsrollen](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Dokumentengruppe] [uniqueidentifier] NOT NULL,
	[Zugriffsrolle] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DokGen_Dokgruppen_Zugriffsrollen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_FirmenTemplateMatrix]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_FirmenTemplateMatrix](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firmen_ID] [uniqueidentifier] NOT NULL,
	[Template_ID] [uniqueidentifier] NOT NULL,
	[Firmenname] [varchar](250) NOT NULL,
	[aktiv] [bit] NOT NULL,
 CONSTRAINT [PK_DokGen_FirmenTemplateMatrix] PRIMARY KEY CLUSTERED 
(
	[Firmen_ID] ASC,
	[Template_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Grafikpool]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Grafikpool](
	[Bezeichnung] [varchar](50) NOT NULL,
	[Grafik] [nvarchar](max) NULL,
	[SprachID] [varchar](50) NOT NULL,
	[Intern] [smallint] NULL,
	[intID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[MandantenID] [int] NULL,
	[Ebene] [uniqueidentifier] NULL,
 CONSTRAINT [PK_DokGen_Grafikpool] PRIMARY KEY CLUSTERED 
(
	[intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_hc_Feldtypen]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_hc_Feldtypen](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Feldtyp] [int] NOT NULL,
	[Bezeichnung] [varchar](100) NOT NULL,
	[Tabelle] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DokGen_hc_Feldtypen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Mandanten]    Script Date: 19.01.2022 12:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Mandanten](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[MandantenID] [int] NOT NULL,
	[Mandantenbezeichnung] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DokGen_Mandanten_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Regelfelder]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Regelfelder](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Feldname] [varchar](100) NOT NULL,
	[Regelfeld] [varchar](100) NOT NULL,
	[Vergleichsoperator] [varchar](5) NOT NULL,
	[Vergleichstext] [varchar](100) NOT NULL,
	[RegelTrueFeld] [text] NOT NULL,
	[RegelFalseFeld] [text] NOT NULL,
	[MandantenID] [int] NULL,
	[Ebene] [uniqueidentifier] NULL,
 CONSTRAINT [PK_DokGen_Regelfelder] PRIMARY KEY CLUSTERED 
(
	[Feldname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Schnittstellen]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Schnittstellen](
	[Objektname] [varchar](50) NOT NULL,
	[Quellfeld] [varchar](50) NOT NULL,
	[DokGenZielfeld] [varchar](50) NOT NULL,
	[intID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[intBemerkung] [varchar](50) NULL,
	[Beschreibung] [text] NULL,
	[MandantenID] [int] NULL,
 CONSTRAINT [PK_DokGen_Schnittstellen] PRIMARY KEY CLUSTERED 
(
	[intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Systemfelder]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Systemfelder](
	[Bereich] [varchar](50) NOT NULL,
	[Feldname] [varchar](50) NOT NULL,
	[Text] [text] NOT NULL,
	[intBemerkung] [varchar](50) NULL,
	[intID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_DokGen_Systemfelder] PRIMARY KEY CLUSTERED 
(
	[intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_TemplateFolge]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_TemplateFolge](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TemplateVorgaenger] [uniqueidentifier] NOT NULL,
	[TemplateNachfolger] [uniqueidentifier] NULL,
	[gueltigAb] [datetime] NULL,
 CONSTRAINT [PK_DokGen_TemplateFolge] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_User]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_User](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Benutzername] [varchar](50) NOT NULL,
	[Vorname] [varchar](50) NULL,
	[Nachname] [varchar](50) NULL,
	[Abteilung] [varchar](100) NULL,
	[Passwort] [varchar](100) NULL,
	[Verwaltungsadmin] [bit] NOT NULL,
	[MandantenID] [int] NOT NULL,
	[PwdChange] [bit] NULL,
 CONSTRAINT [PK_DokGen_User] PRIMARY KEY CLUSTERED 
(
	[Benutzername] ASC,
	[MandantenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Vorlagen]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Vorlagen](
	[Bezeichnung] [varchar](50) NOT NULL,
	[Zugriffstyp] [int] NOT NULL,
	[SprachID] [varchar](50) NOT NULL,
	[Dokument] [varbinary](max) NOT NULL,
	[Vorlagen_ID] [varchar](50) NOT NULL,
	[Dateigroesse] [int] NOT NULL,
	[intID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[MandantenID] [int] NULL,
	[DokumentRTF] [text] NULL,
	[Ebene] [uniqueidentifier] NULL,
	[GueltigAb] [datetime] NULL,
	[GueltigBis] [datetime] NULL,
 CONSTRAINT [PK_DokGen_Vorlagen] PRIMARY KEY CLUSTERED 
(
	[intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Vorlagen_Filler]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Vorlagen_Filler](
	[Bezeichnung] [varchar](50) NOT NULL,
	[Text] [varchar](50) NULL,
	[SprachID] [smallint] NULL,
	[Bereich] [smallint] NOT NULL,
	[Intern] [int] NULL,
	[intBemerkung] [nvarchar](50) NULL,
	[intID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_DokGen_Vorlagen_Filler_1] PRIMARY KEY CLUSTERED 
(
	[Bezeichnung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Vorlagen_Fusszeilen_Global]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Vorlagen_Fusszeilen_Global](
	[Bezeichnung] [varchar](50) NOT NULL,
	[Text] [text] NULL,
	[SprachID] [smallint] NULL,
	[Bereich] [smallint] NOT NULL,
	[Intern] [smallint] NULL,
	[intID] [uniqueidentifier] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_DokGen_Vorlagen_Fusszeilen_Global_1] PRIMARY KEY CLUSTERED 
(
	[Bezeichnung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Vorlagen_Fusszeilen_Standort]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Vorlagen_Fusszeilen_Standort](
	[Bezeichnung] [varchar](50) NOT NULL,
	[Text] [text] NOT NULL,
	[SprachID] [int] NOT NULL,
	[Bereich] [smallint] NOT NULL,
	[Intern] [int] NOT NULL,
	[intID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_DokGen_Vorlagen_Fusszeilen_Standort] PRIMARY KEY CLUSTERED 
(
	[Bezeichnung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Vorlagen_Kopfzeile]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Vorlagen_Kopfzeile](
	[Bezeichnung] [varchar](50) NOT NULL,
	[Text] [text] NULL,
	[SprachID] [smallint] NULL,
	[Bereich] [smallint] NOT NULL,
	[Intern] [int] NULL,
	[intID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_DokGen_Vorlagen_Kopfzeile_1] PRIMARY KEY CLUSTERED 
(
	[Bezeichnung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Vorlagen_UserFields]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Vorlagen_UserFields](
	[Bezeichnung] [varchar](50) NOT NULL,
	[Text] [nvarchar](max) NULL,
	[SprachID] [varchar](50) NOT NULL,
	[Intern] [smallint] NULL,
	[intID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[MandantenID] [int] NULL,
	[Ebene] [uniqueidentifier] NULL,
 CONSTRAINT [PK_DokGen_Vorlagen_UserFields_1] PRIMARY KEY CLUSTERED 
(
	[Bezeichnung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Zugriffsrolle_Dokgruppe_Mitarbeiter]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Zugriffsrolle_Dokgruppe_Mitarbeiter](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DokGruppe_Zugriffsrolle] [uniqueidentifier] NOT NULL,
	[PB_Mitarbeiter] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DokGen_Zugriffsrolle_Dokgruppe_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DokGen_Zugriffsrollen]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DokGen_Zugriffsrollen](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Beschreibung] [varchar](200) NOT NULL,
	[MandantenID] [int] NULL,
 CONSTRAINT [PK_DokGen_Zugriffsrollen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Einheiten]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Einheiten](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Einheit] [varchar](10) NULL,
	[Einheiten] [varchar](10) NULL,
	[Beschreibung] [varchar](50) NULL,
	[Sprache] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorQueue]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorQueue](
	[ID] [uniqueidentifier] NOT NULL,
	[EmailMessage] [nvarchar](max) NULL,
	[ErrorMessage] [nvarchar](max) NOT NULL,
	[ErrorQueuedAt] [datetime] NOT NULL,
	[UserEmail] [nvarchar](max) NULL,
	[Count] [int] NOT NULL,
	[StatusCode] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_ErrorQueue] PRIMARY KEY CLUSTERED 
(
	[ID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSheetTool_FreigabeUebersicht]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSheetTool_FreigabeUebersicht](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Beantrager] [varchar](5) NOT NULL,
	[Freigeber] [varchar](5) NOT NULL,
 CONSTRAINT [PK__FactShee__FC1B88FC48469519] PRIMARY KEY CLUSTERED 
(
	[Beantrager] ASC,
	[Freigeber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSheetTool_Skilluebersicht]    Script Date: 19.01.2022 12:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSheetTool_Skilluebersicht](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Skillgruppe] [varchar](255) NOT NULL,
	[GruppenID] [int] NOT NULL,
	[Skillbezeichnung] [varchar](255) NOT NULL,
	[Bereich] [varchar](50) NOT NULL,
 CONSTRAINT [PK__FactShee__E9D57B88D914CE66] PRIMARY KEY CLUSTERED 
(
	[GruppenID] ASC,
	[Skillbezeichnung] ASC,
	[Bereich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSheetTool_UserDokumente]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSheetTool_UserDokumente](
	[Bezeichnung] [varchar](50) NOT NULL,
	[AGDODokumentID] [uniqueidentifier] NOT NULL,
	[SprachID] [varchar](50) NOT NULL,
	[intID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PB_Mitarbeiter] [uniqueidentifier] NULL,
	[Dokumentengruppe] [uniqueidentifier] NULL,
	[Schublade] [uniqueidentifier] NULL,
	[Fach] [uniqueidentifier] NULL,
	[FreigabeStufe] [int] NULL,
	[FreigabeAnmerkungen] [varchar](250) NULL,
	[Anmerkungen] [varchar](250) NULL,
	[Privateflag] [bit] NULL,
	[FreigabeMailadresse] [varchar](100) NULL,
	[FreigabeBeantragtAm] [date] NULL,
	[Thumbnail] [varchar](max) NULL,
	[Schlagworte] [varchar](250) NULL,
	[Daten] [varchar](max) NULL,
	[OpParameter01] [varchar](250) NULL,
	[OpParameter02] [varchar](250) NULL,
 CONSTRAINT [PK_FactSheetTool_UserDokumente] PRIMARY KEY CLUSTERED 
(
	[intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faehigkeit_Beschreibung]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faehigkeit_Beschreibung](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Faehigkeit_id] [int] NOT NULL,
	[Sprach_id] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](150) NOT NULL,
	[Beschreibung] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Faehigkeit_Beschreibung] PRIMARY KEY CLUSTERED 
(
	[Faehigkeit_id] ASC,
	[Sprach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faehigkeit_Bewertungsgruppe]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faehigkeit_Bewertungsgruppe](
	[id] [smallint] NOT NULL,
	[Beschreibung] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Faehigkeit_Bewertungsgruppe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faehigkeit_falsch]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faehigkeit_falsch](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Skill_IDF] [int] NOT NULL,
	[Skillbez_falsch] [varchar](150) NOT NULL,
	[SAP_mode] [bit] NOT NULL,
 CONSTRAINT [PK_Faehigkeit_falsch] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_Faehigkeit_falsch] UNIQUE CLUSTERED 
(
	[Skillbez_falsch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faehigkeiten]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faehigkeiten](
	[ID] [int] NOT NULL,
	[Gruppen_ID] [smallint] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Prioritaet] [varchar](5) NULL,
	[Erstellungsdatum] [smalldatetime] NULL,
	[Aenderungsdatum] [smalldatetime] NULL,
	[Ausgabeposition] [varchar](20) NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[letzte_aenderung_von] [uniqueidentifier] NULL,
	[Bewertungsgruppe] [smallint] NOT NULL,
	[gelöscht] [bit] NOT NULL,
 CONSTRAINT [PK_Faehigkeiten] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fehlerprotokoll]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fehlerprotokoll](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[User_id] [uniqueidentifier] NOT NULL,
	[datum] [smalldatetime] NOT NULL,
	[Fehlermeldung] [varchar](8000) NOT NULL,
	[modul] [varchar](8000) NOT NULL,
	[Parameter] [varchar](8000) NULL,
 CONSTRAINT [PK_Fehlerprotokoll] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fgruppe]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fgruppe](
	[ID] [smallint] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Beschreibung] [varchar](255) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Prioritaet] [int] NULL,
	[Skillscan] [bit] NULL,
	[Webskill] [bit] NOT NULL,
	[Mainskill] [bit] NOT NULL,
 CONSTRAINT [PK_Fgruppe] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_Fgruppe] UNIQUE CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fgruppe_Beschreibung]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fgruppe_Beschreibung](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Fgruppe_id] [smallint] NOT NULL,
	[Sprach_id] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](100) NULL,
	[Beschreibung] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firma]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firma](
	[firmen_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firmenname] [varchar](255) NOT NULL,
	[Firmenzusatz] [varchar](1000) NULL,
	[Webadresse] [varchar](255) NULL,
	[erstellt_am] [smalldatetime] NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[Konzern_ID] [uniqueidentifier] NULL,
	[Branche] [smallint] NULL,
	[Kreditreform] [bit] NOT NULL,
	[Planungsname] [varchar](255) NULL,
	[Planungskunde_ID] [uniqueidentifier] NULL,
	[Public_Sector] [bit] NOT NULL,
	[Crefo] [smallint] NULL,
	[CrefoInfo] [text] NULL,
	[Freigabe_MassenVV] [bit] NOT NULL,
	[Kennzeichnung] [varchar](100) NULL,
	[KAM] [varchar](100) NULL,
	[variabler_Name] [varchar](100) NULL,
	[HTS_Bemerkung] [varchar](255) NULL,
	[HTS_Kennzeichnung] [varchar](50) NULL,
	[Superbranche_id] [uniqueidentifier] NULL,
	[Startup] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
	[MDMStatus] [smallint] NULL,
	[VATID] [varchar](100) NULL,
	[TAXID] [varchar](100) NULL,
	[DUNS] [varchar](100) NULL,
	[MDMID] [varchar](12) NULL,
	[MDMDeleted] [bit] NULL,
 CONSTRAINT [PK_Firmen2] PRIMARY KEY NONCLUSTERED 
(
	[firmen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firmen_Emergency_Info]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firmen_Emergency_Info](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[firmen_ID] [uniqueidentifier] NOT NULL,
	[Info] [varchar](max) NULL,
	[Rueckfrage_an] [varchar](100) NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[geaendert_am] [smalldatetime] NULL,
	[Notiz] [varchar](1000) NULL,
 CONSTRAINT [PK_Firmen_Emergency_Info] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firmen_HPScan]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firmen_HPScan](
	[Firmen_HPScan_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firmen_ID] [uniqueidentifier] NOT NULL,
	[Link] [varchar](256) NOT NULL,
	[Scan] [bit] NOT NULL,
	[Geschaeftstyp_ID] [smallint] NOT NULL,
	[Standort] [uniqueidentifier] NOT NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [datetime] NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[geaendert_am] [datetime] NULL,
 CONSTRAINT [PK_Firmen_HPScan] PRIMARY KEY CLUSTERED 
(
	[Firmen_HPScan_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firmen_MSP]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firmen_MSP](
	[Firmen_MSP_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firma] [uniqueidentifier] NOT NULL,
	[Fee] [money] NULL,
	[Fee_Waehrung] [varchar](5) NULL,
	[Fee_Basis] [varchar](5) NULL,
	[Gainshare] [money] NULL,
	[Gainshare_Bezug] [varchar](50) NULL,
	[Gainshare_Basis] [varchar](5) NULL,
	[Tagessatzdeckelung] [bit] NOT NULL,
	[erstellt_am] [smalldatetime] NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[geaendert_am] [smalldatetime] NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[Charge] [money] NOT NULL,
	[Charge_Einheit] [int] NOT NULL,
	[Fee_Bezug] [bit] NOT NULL,
	[Fee_Prozent] [money] NULL,
 CONSTRAINT [PK_Firmen_MSP] PRIMARY KEY CLUSTERED 
(
	[Firmen_MSP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firmen_MSP_Zahlungsziele]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firmen_MSP_Zahlungsziele](
	[Firmen_MSP_Zahlungsziele_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firma] [uniqueidentifier] NOT NULL,
	[Zahlungsziel] [varchar](100) NULL,
	[erstellt_am] [smalldatetime] NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[geaendert_am] [smalldatetime] NULL,
	[geaendert_von] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Firmen_MSP_Zahlungsziele] PRIMARY KEY CLUSTERED 
(
	[Firmen_MSP_Zahlungsziele_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[firmen_rechtebereiche]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[firmen_rechtebereiche](
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firmen_Standorts_ID] [uniqueidentifier] NOT NULL,
	[zugeordnet_am] [smalldatetime] NOT NULL,
	[zugeordnet_von] [uniqueidentifier] NOT NULL,
	[Zugriffsrolle] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Zuordnung_firmen_Teams] PRIMARY KEY CLUSTERED 
(
	[Firmen_Standorts_ID] ASC,
	[Zugriffsrolle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firmenkontakt]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firmenkontakt](
	[Kontakt_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Leitsatz] [varchar](255) NOT NULL,
	[Inhalt] [text] NOT NULL,
	[Sortierungstyp] [tinyint] NOT NULL,
	[Firma] [uniqueidentifier] NOT NULL,
	[Erstellt_von] [uniqueidentifier] NULL,
	[aufgenommen_durch] [varchar](5) NULL,
	[Datum] [datetime] NULL,
 CONSTRAINT [PK_Firmenkontakt] PRIMARY KEY NONCLUSTERED 
(
	[Kontakt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firmenstandort]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firmenstandort](
	[standort_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Erstellungsdatum] [smalldatetime] NOT NULL,
	[Strasse] [varchar](200) NULL,
	[PLZ] [varchar](50) NULL,
	[Postfach] [varchar](50) NULL,
	[PLZ_PF] [varchar](50) NULL,
	[Ort] [varchar](200) NOT NULL,
	[Bundesland] [varchar](70) NULL,
	[Telefon] [varchar](50) NULL,
	[Fax] [varchar](20) NULL,
	[Sekretariat] [varchar](50) NULL,
	[Region] [tinyint] NULL,
	[Bemerkungen] [text] NULL,
	[Aenderungsdatum] [smalldatetime] NULL,
	[Firma] [uniqueidentifier] NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[Uebergabekunde] [tinyint] NULL,
	[Strategie] [text] NULL,
	[Anzahl_interne_mitarbeiter] [int] NULL,
	[Anzahl_externer_Mitarbeiter] [int] NULL,
	[land] [uniqueidentifier] NULL,
	[Debitorennummer] [varchar](20) NULL,
	[Exprojektkunde] [bit] NOT NULL,
	[ExSAP] [bit] NOT NULL,
	[AktivSAP] [bit] NOT NULL,
	[SAPRegion] [uniqueidentifier] NULL,
	[PlanSAP] [bit] NOT NULL,
	[BRTV_ID] [smallint] NULL,
	[BRTV_QS] [bit] NOT NULL,
	[BRTV_GS] [varchar](50) NULL,
	[BRTV_LeihZ] [int] NULL,
	[HUeD] [smallint] NOT NULL,
	[UseEqualPay] [tinyint] NOT NULL,
	[EqualPay] [smallint] NOT NULL,
	[AUeG_QS] [tinyint] NOT NULL,
	[Premium_Company_Id] [smallint] NULL,
	[BRTV_GS_Id] [smallint] NULL,
	[PSO] [uniqueidentifier] NULL,
	[Lat] [decimal](13, 9) NULL,
	[Lng] [decimal](13, 9) NULL,
	[Note] [varchar](1024) NULL,
	[MDMID] [varchar](12) NULL,
	[MDMDeleted] [bit] NULL,
 CONSTRAINT [PK_standort_id] PRIMARY KEY NONCLUSTERED 
(
	[standort_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirmenStandortXProspectXhelpcode_Digitale_Merkmale]    Script Date: 19.01.2022 12:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirmenStandortXProspectXhelpcode_Digitale_Merkmale](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[firmenstandort_ID] [uniqueidentifier] NOT NULL,
	[Prospect_ID] [uniqueidentifier] NOT NULL,
	[Merkmal_ID] [uniqueidentifier] NOT NULL,
	[ErstelltVon] [uniqueidentifier] NOT NULL,
	[ErstelltAm] [datetime] NOT NULL,
 CONSTRAINT [PK_FirmenStandortXhelpcode_Digitale_Merkmale] PRIMARY KEY CLUSTERED 
(
	[GUID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grosskunden]    Script Date: 19.01.2022 12:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grosskunden](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firmenname] [varchar](255) NOT NULL,
	[Land] [varchar](3) NOT NULL,
	[Branche] [varchar](255) NULL,
 CONSTRAINT [PK_Grosskunden] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_auspraegung]    Script Date: 19.01.2022 12:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_auspraegung](
	[auspraegung] [tinyint] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_auspraegung] PRIMARY KEY CLUSTERED 
(
	[auspraegung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Helpcode_Branche]    Script Date: 19.01.2022 12:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Helpcode_Branche](
	[id] [smallint] NOT NULL,
	[Kurzbezeichnung] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SAPID] [char](4) NULL,
	[Branche] [int] NULL,
	[Inhalte] [varchar](max) NULL,
	[Branche_Gruppe_ID] [uniqueidentifier] NULL,
	[NACE_Code] [varchar](12) NULL,
	[NACE_Bezeichnung] [varchar](255) NULL,
 CONSTRAINT [PK_Helpcode_Branche] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Branche_Bezeichnung]    Script Date: 19.01.2022 12:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Branche_Bezeichnung](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[branchen_id] [smallint] NOT NULL,
	[Sprach_id] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](255) NOT NULL,
	[NACE_Bezeichnung] [varchar](255) NULL,
 CONSTRAINT [PK_helpcode_Branche_Bezeichnung] PRIMARY KEY CLUSTERED 
(
	[branchen_id] ASC,
	[Sprach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Branche_Gruppe]    Script Date: 19.01.2022 12:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Branche_Gruppe](
	[Branche_Gruppe_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kurzbezeichnung] [varchar](255) NOT NULL,
	[NACE_Code] [varchar](12) NULL,
	[NACE_Bezeichnung] [varchar](255) NULL,
	[Branche_Obergruppe_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_helpcode_Branche_Gruppe] PRIMARY KEY CLUSTERED 
(
	[Branche_Gruppe_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Branche_Gruppe_Bezeichnung]    Script Date: 19.01.2022 12:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Branche_Gruppe_Bezeichnung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Branche_Gruppe_ID] [uniqueidentifier] NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](255) NOT NULL,
	[NACE_Bezeichnung] [varchar](255) NULL,
 CONSTRAINT [PK_helpcode_Branche_Gruppe_Bezeichnung] PRIMARY KEY NONCLUSTERED 
(
	[Branche_Gruppe_ID] ASC,
	[Sprach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Branche_Obergruppe]    Script Date: 19.01.2022 12:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Branche_Obergruppe](
	[Branche_Obergruppe_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kurzbezeichnung] [varchar](255) NOT NULL,
	[NACE_Code] [varchar](12) NULL,
	[NACE_Bezeichnung] [varchar](255) NULL,
	[Branche_Oberobergruppe_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_helpcode_Branche_Obergruppe] PRIMARY KEY NONCLUSTERED 
(
	[Branche_Obergruppe_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Branche_Obergruppe_Bezeichnung]    Script Date: 19.01.2022 12:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Branche_Obergruppe_Bezeichnung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Branche_Obergruppe_ID] [uniqueidentifier] NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](255) NOT NULL,
	[NACE_Bezeichnung] [varchar](255) NULL,
 CONSTRAINT [PK_helpcode_Branche_Obergruppe_Bezeichnung] PRIMARY KEY NONCLUSTERED 
(
	[Branche_Obergruppe_ID] ASC,
	[Sprach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Branche_Oberobergruppe]    Script Date: 19.01.2022 12:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Branche_Oberobergruppe](
	[Branche_Oberobergruppe_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kurzbezeichnung] [varchar](255) NOT NULL,
	[NACE_Code] [varchar](12) NULL,
	[NACE_Bezeichnung] [varchar](255) NULL,
 CONSTRAINT [PK_helpcode_Branche_Oberobergruppe] PRIMARY KEY NONCLUSTERED 
(
	[Branche_Oberobergruppe_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Branche_Oberobergruppe_Bezeichnung]    Script Date: 19.01.2022 12:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Branche_Oberobergruppe_Bezeichnung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Branche_Oberobergruppe_ID] [uniqueidentifier] NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](255) NOT NULL,
	[NACE_Bezeichnung] [varchar](255) NULL,
 CONSTRAINT [PK_helpcode_Branche_Oberobergruppe_Bezeichnung] PRIMARY KEY NONCLUSTERED 
(
	[Branche_Oberobergruppe_ID] ASC,
	[Sprach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_BranchenTarifvertrag]    Script Date: 19.01.2022 12:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_BranchenTarifvertrag](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BRTV_ID] [smallint] NOT NULL,
	[Bezeichnung] [varchar](50) NOT NULL,
	[Bezeichnung_Kurz] [varchar](20) NULL,
	[Beschreibung] [varchar](512) NULL,
	[Gewerkschaft] [varchar](50) NULL,
	[EqualPay] [smallint] NULL,
	[HUED] [smallint] NULL,
 CONSTRAINT [PK_helpcode_BranchenTarifvertrag] PRIMARY KEY CLUSTERED 
(
	[BRTV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_BranchenTarifvertrag_Description]    Script Date: 19.01.2022 12:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_BranchenTarifvertrag_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[BRTV_ID] [smallint] NULL,
	[Term] [varchar](50) NULL,
	[Description] [varchar](512) NULL,
	[TradeUnion] [varchar](50) NULL,
	[LanguageId] [smallint] NULL,
	[CreateDate] [datetime2](0) NULL,
 CONSTRAINT [PK_helpcode_BranchenTarifvertrag_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_BranchenTarifvertrag_keine_Anwendung]    Script Date: 19.01.2022 12:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_BranchenTarifvertrag_keine_Anwendung](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Anwendung_ID] [smallint] NOT NULL,
	[Bezeichnung] [varchar](50) NOT NULL,
 CONSTRAINT [PK_helpcode_BranchenTarifvertrag_keine_Anwendung] PRIMARY KEY CLUSTERED 
(
	[Anwendung_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_BranchenTarifvertrag_keine_Anwendung_Description]    Script Date: 19.01.2022 12:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_BranchenTarifvertrag_keine_Anwendung_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[BRTV_GS_Id] [smallint] NULL,
	[LanguageId] [smallint] NULL,
	[Description] [varchar](50) NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_helpcode_BranchenTarifvertrag_keine_Anwendung_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Bundesland]    Script Date: 19.01.2022 12:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Bundesland](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Bundesland] [varchar](150) NOT NULL,
	[Land_id] [uniqueidentifier] NOT NULL,
	[SAP_Code] [nvarchar](10) NULL,
 CONSTRAINT [PK_helpcode_bundeslaender] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_helpcode_bundeslaender] UNIQUE NONCLUSTERED 
(
	[Bundesland] ASC,
	[Land_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Bundesland_Bezeichnung]    Script Date: 19.01.2022 12:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Bundesland_Bezeichnung](
	[ID] [uniqueidentifier] NOT NULL,
	[Bundesland_ID] [uniqueidentifier] NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](150) NULL,
	[Bezeichnung_plus] [varchar](150) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_Bundesland_Bezeichnung] PRIMARY KEY CLUSTERED 
(
	[Bundesland_ID] ASC,
	[Sprach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_CoMerkmal]    Script Date: 19.01.2022 12:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_CoMerkmal](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Bezeichnung] [varchar](255) NOT NULL,
	[OperationalAreaType_ID] [smallint] NOT NULL,
	[DistributionChannelType_ID] [smallint] NOT NULL,
	[Erstellt_von] [uniqueidentifier] NOT NULL,
	[Erstellt_am] [datetime] NOT NULL,
 CONSTRAINT [PK_helpcode_CoMerkmal] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_CoMerkmal_Bezeichnung]    Script Date: 19.01.2022 12:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_CoMerkmal_Bezeichnung](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[CoMerkmal_GUID] [uniqueidentifier] NOT NULL,
	[Bezeichnung] [varchar](255) NOT NULL,
	[Sprach_ID] [smallint] NOT NULL,
	[Erstellt_von] [uniqueidentifier] NOT NULL,
	[Erstellt_am] [datetime] NOT NULL,
 CONSTRAINT [PK_helpcode_CoMerkmal_Bezeichnung] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Crefo]    Script Date: 19.01.2022 12:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Crefo](
	[Crefo_ID] [int] NOT NULL,
	[Bezeichnung] [varchar](100) NOT NULL,
	[Beschreibung] [text] NOT NULL,
	[SAP_Text] [varchar](100) NULL,
	[Crefo_Farbe] [varchar](60) NULL,
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_Crefo] PRIMARY KEY CLUSTERED 
(
	[Crefo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Crefo_Description]    Script Date: 19.01.2022 12:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Crefo_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[CrefoId] [smallint] NULL,
	[LanguageId] [smallint] NULL,
	[Term] [varchar](100) NULL,
	[Description] [varchar](250) NULL,
	[SAP_Description] [varchar](250) NULL,
	[Color] [varchar](50) NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_helpcode_Crefo_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_CT_BeratungsKontaktart]    Script Date: 19.01.2022 12:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_CT_BeratungsKontaktart](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kontaktart] [varchar](150) NOT NULL,
 CONSTRAINT [PK_helpcode_CT_BeratungsKontaktarten] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_CT_Beratungsmodul]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_CT_Beratungsmodul](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Beschreibung] [varchar](250) NOT NULL,
	[Sort_ID] [tinyint] NOT NULL,
 CONSTRAINT [PK_helpcode_CT_Beratung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_CT_Programm]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_CT_Programm](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Programm] [varchar](250) NOT NULL,
 CONSTRAINT [PK_helpcode_CT_Programm] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_CT_Vermittlungsart]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_CT_Vermittlungsart](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Beschreibung] [varchar](250) NOT NULL,
	[Sort_ID] [tinyint] NOT NULL,
 CONSTRAINT [PK_helpcode_CT_Vermittlung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_CT_Vermittlungskanal]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_CT_Vermittlungskanal](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kanal] [varchar](250) NOT NULL,
	[Sort_ID] [tinyint] NOT NULL,
 CONSTRAINT [PK_helpcode_CT_Vermittlungskanal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_CT_VermittlungsKontaktart]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_CT_VermittlungsKontaktart](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kontaktart] [varchar](150) NOT NULL,
 CONSTRAINT [PK_helpcode_CT_VermittlungsKontaktarten_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Digitale_Merkmale]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Digitale_Merkmale](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Bezeichnung] [varchar](50) NOT NULL,
	[Beschreibung] [varchar](250) NOT NULL,
 CONSTRAINT [PK_helpcode_Digitale_Merkmale] PRIMARY KEY NONCLUSTERED 
(
	[GUID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Digitale_Merkmale_Description]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Digitale_Merkmale_Description](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Merkmal_ID] [uniqueidentifier] NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](50) NOT NULL,
	[Beschreibung] [varchar](250) NULL,
 CONSTRAINT [PK_helpcode_Digitale_Merkmale_Description] PRIMARY KEY CLUSTERED 
(
	[GUID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_entgeltgruppe]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_entgeltgruppe](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Entgeltgruppe] [varchar](10) NOT NULL,
	[Entgelt_in_Euro] [money] NOT NULL,
	[Urlaubsgeld_in_euro] [money] NULL,
	[Textbaustein_Taetigkeit] [varchar](4000) NULL,
	[Entgelttabelle_ID] [smallint] NOT NULL,
 CONSTRAINT [PK_helpcode_entgeltgruppe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_entgeltgruppe_Description]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_entgeltgruppe_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[PayGradeId] [uniqueidentifier] NOT NULL,
	[Description] [varchar](4000) NULL,
	[LanguageId] [smallint] NOT NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_helpcode_entgeltgruppe_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Entgelttabelle]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Entgelttabelle](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Entgelttabelle_ID] [smallint] NOT NULL,
	[Bezeichnung] [varchar](50) NOT NULL,
	[Beschreibung] [varchar](512) NULL,
 CONSTRAINT [PK_helpcode_Entgelttabelle] PRIMARY KEY CLUSTERED 
(
	[Entgelttabelle_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Erstkontakt_Bezeichnung]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Erstkontakt_Bezeichnung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NULL,
	[sprach_id] [tinyint] NOT NULL,
	[Erstkontakt_id] [smallint] NOT NULL,
	[Bezeichnung] [varchar](100) NOT NULL,
	[Web_Bezeichnung] [varchar](100) NULL,
 CONSTRAINT [PK_helpcode_Erstkontakt_Bezeichnung] PRIMARY KEY CLUSTERED 
(
	[sprach_id] ASC,
	[Erstkontakt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Erstkontakt_Gruppen]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Erstkontakt_Gruppen](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Gruppenname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_helpcode_Erstkontakt_Gruppen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Helpcode_erstkontaktart]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Helpcode_erstkontaktart](
	[ErstkontaktID] [smallint] NOT NULL,
	[Erstkontakt_Abk] [varchar](20) NULL,
	[Erstkontakt_Beschreibung] [varchar](100) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[im_web] [bit] NOT NULL,
	[gruppe] [uniqueidentifier] NULL,
	[inaktiv] [bit] NOT NULL,
	[ErstelltVon] [uniqueidentifier] NULL,
	[ErstelltAm] [datetime2](0) NULL,
	[AktualisiertVon] [uniqueidentifier] NULL,
	[AktualisiertAm] [datetime2](0) NULL,
 CONSTRAINT [PK_Helpcode_erstkontaktart] PRIMARY KEY NONCLUSTERED 
(
	[ErstkontaktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Fachschwerpunkt]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Fachschwerpunkt](
	[id] [smallint] NOT NULL,
	[Fachschwerpunkt] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_Fachschwerpunkt] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_familienstand]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_familienstand](
	[id] [tinyint] NOT NULL,
	[Familienstand] [varchar](100) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_familienstand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Familienstand_Bezeichnung]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Familienstand_Bezeichnung](
	[familienstand_id] [tinyint] NOT NULL,
	[Sprach_id] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](100) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_Familienstand_Bezeichnung] PRIMARY KEY CLUSTERED 
(
	[familienstand_id] ASC,
	[Sprach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_geschlecht]    Script Date: 19.01.2022 12:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_geschlecht](
	[id] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](40) NOT NULL,
	[bemerkung] [varchar](255) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SAP_ID] [tinyint] NULL,
 CONSTRAINT [PK_helpcode_geschlecht] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_geschlecht_bezeichnung]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_geschlecht_bezeichnung](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[geschlechts_id] [tinyint] NOT NULL,
	[sprach_id] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](255) NULL,
	[briefanrede] [varchar](255) NULL,
 CONSTRAINT [PK_helpcode_geschlecht_bezeichnung] PRIMARY KEY CLUSTERED 
(
	[geschlechts_id] ASC,
	[sprach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Helpcode_jobboerse]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Helpcode_jobboerse](
	[id] [smallint] NOT NULL,
	[Jobboersenname] [varchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Helpcode_jobboerse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_kundenstatus]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_kundenstatus](
	[id] [char](1) NOT NULL,
	[Kundenstatus] [varchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_kundenstatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_land]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_land](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Landkennung] [varchar](5) NOT NULL,
	[Land] [varchar](50) NOT NULL,
	[Staatsregion] [varchar](20) NULL,
	[Reihenfolge] [int] NOT NULL,
	[Postkennung] [varchar](5) NULL,
	[EU17] [bit] NOT NULL,
	[EU8] [bit] NOT NULL,
 CONSTRAINT [PK_helpcodelaender] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_helpcodelaender] UNIQUE NONCLUSTERED 
(
	[Landkennung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_land_beschreibung]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_land_beschreibung](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Land_id] [uniqueidentifier] NOT NULL,
	[Sprach_id] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](255) NULL,
	[Postkennung] [varchar](10) NULL,
 CONSTRAINT [PK_helpcode_land_beschreibung] PRIMARY KEY NONCLUSTERED 
(
	[Land_id] ASC,
	[Sprach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_leadstatus_kunde]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_leadstatus_kunde](
	[ID] [tinyint] NOT NULL,
	[Beschreibung] [varchar](120) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_leadstatus_kunde] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_leadstatus_kunde_description]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_leadstatus_kunde_description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[LeadStatusId] [int] NULL,
	[LanguageId] [smallint] NULL,
	[Description] [varchar](50) NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_helpcode_leadstatus_kunde_description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_leitsatz]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_leitsatz](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Leitsatz] [varchar](255) NOT NULL,
	[geaendert_am] [smalldatetime] NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
 CONSTRAINT [PK_helpcode_leitsatz] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_helpcode_leitsatz] UNIQUE NONCLUSTERED 
(
	[Leitsatz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_LI_Recruiter]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_LI_Recruiter](
	[ID] [uniqueidentifier] NOT NULL,
	[Kuerzel] [varchar](5) NULL,
	[EMail] [varchar](100) NULL,
	[LI_ID] [varchar](20) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_LI_Recruiter_2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Mitarbeiter_Kategorie]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Mitarbeiter_Kategorie](
	[Kategorie] [char](2) NOT NULL,
	[Beschreibung] [varchar](100) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_Mitarbeiter_Kategorie] PRIMARY KEY CLUSTERED 
(
	[Kategorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Helpcode_mitarbeiterstatus]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Helpcode_mitarbeiterstatus](
	[status_id] [int] NOT NULL,
	[status_text] [varchar](100) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Helpcode_mitarbeiterstatus] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Helpcode_mitarbeiterstatus_Description]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Helpcode_mitarbeiterstatus_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[LanguageId] [smallint] NOT NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_Helpcode_mitarbeiterstatus_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_mitarbeiterterminstatus]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_mitarbeiterterminstatus](
	[id] [tinyint] NOT NULL,
	[statusname] [varchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_mitarbeiterterminstatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_monate]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_monate](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Monats_id] [tinyint] NOT NULL,
	[sprach_id] [tinyint] NOT NULL,
	[Monatsname] [char](10) NOT NULL,
 CONSTRAINT [PK_helpcode_monate] PRIMARY KEY CLUSTERED 
(
	[Monats_id] ASC,
	[sprach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_helpcode_monate] UNIQUE NONCLUSTERED 
(
	[Monats_id] ASC,
	[sprach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_pb_mitarbeiterkontakttyp]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_pb_mitarbeiterkontakttyp](
	[id] [tinyint] NOT NULL,
	[Beschreibung] [varchar](100) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_pb_mitarbeiterkontakttyp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_pcpstatus]    Script Date: 19.01.2022 12:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_pcpstatus](
	[id] [uniqueidentifier] NOT NULL,
	[Wert] [smallint] NOT NULL,
	[Name] [varchar](80) NOT NULL,
	[reihenfolge] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_pcpstatus] PRIMARY KEY NONCLUSTERED 
(
	[Wert] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_pcpstatus_Description]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_pcpstatus_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[PcpId] [smallint] NULL,
	[LanguageId] [smallint] NULL,
	[Description] [varchar](80) NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_helpcode_pcpstatus_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_plz_ort]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_plz_ort](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Land] [varchar](5) NOT NULL,
	[Leitzahl] [varchar](50) NULL,
	[Ort] [varchar](40) NULL,
 CONSTRAINT [PK_helpcode_plz_ort] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_postleitzahl]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_postleitzahl](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Postleitzahl] [varchar](80) NOT NULL,
 CONSTRAINT [PK_helpcode_postleitzahl] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_postleitzahl_bezeichnung]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_postleitzahl_bezeichnung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PLZ_ID] [uniqueidentifier] NOT NULL,
	[Bezeichnung] [varchar](255) NOT NULL,
	[sprach_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_helpocde_postleitzahl_bezeichnung] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_helpocde_postleitzahl_bezeichnung] UNIQUE CLUSTERED 
(
	[PLZ_ID] ASC,
	[sprach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_prospect_absagestatus]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_prospect_absagestatus](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Status] [varchar](100) NOT NULL,
	[Art] [int] NULL,
 CONSTRAINT [PK_helpcode_prospect_absagestatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_prospect_absagestatus_Description]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_prospect_absagestatus_Description](
	[RowGuId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[Art] [int] NULL,
	[Status] [varchar](200) NOT NULL,
	[CultureTypeId] [smallint] NOT NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_helpcode_prospect_absagestatus_Description] PRIMARY KEY CLUSTERED 
(
	[RowGuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Prospect_Anstellungsart]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Prospect_Anstellungsart](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Anstellungsart] [varchar](255) NOT NULL,
 CONSTRAINT [PK_helpcode_Prospect_Anstellungsart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Prospect_Anstellungsart_Beschreibung]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Prospect_Anstellungsart_Beschreibung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Anstellungsart_ID] [uniqueidentifier] NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](255) NOT NULL,
 CONSTRAINT [PK_helpcode_Prospect_Anstellungsart_Beschreibung] PRIMARY KEY CLUSTERED 
(
	[Anstellungsart_ID] ASC,
	[Sprach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Prospect_Anstellungsart_Matrix]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Prospect_Anstellungsart_Matrix](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Anstellungsart_ID] [uniqueidentifier] NOT NULL,
	[PB_Company] [uniqueidentifier] NOT NULL,
	[Geschaeftstyp_ID] [smallint] NOT NULL,
 CONSTRAINT [PK_helpcode_Prospect_Anstellungsart_Matrix] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Helpcode_Prospect_Direktbesetzungsauftrag]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Helpcode_Prospect_Direktbesetzungsauftrag](
	[ID] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](100) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Helpcode_Direktbesetzungsauftrag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Helpcode_Prospect_Direktbesetzungsauftrag_Description]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Helpcode_Prospect_Direktbesetzungsauftrag_Description](
	[RowGuid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ID] [tinyint] NOT NULL,
	[CultureTypeId] [smallint] NOT NULL,
	[Beschreibung] [varchar](30) NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_Helpcode_Prospect_Direktbesetzungsauftrag_Description] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Prospect_Kategorisierung]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Prospect_Kategorisierung](
	[ID] [tinyint] NOT NULL,
	[ABK] [varchar](10) NOT NULL,
	[Bezeichnung] [varchar](150) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_Prospect_Kategorisierung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_prospectmitarbeiterstatus]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_prospectmitarbeiterstatus](
	[id] [tinyint] NOT NULL,
	[Status] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_prospectmitarbeiterstatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_helpcode_prospectmitarbeiterstatus] UNIQUE NONCLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_prospectmitarbeiterstatus_Description]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_prospectmitarbeiterstatus_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[StatusId] [tinyint] NULL,
	[LanguageId] [smallint] NULL,
	[Description] [varchar](255) NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_helpcode_prospectmitarbeiterstatus_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_prospectpriority]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_prospectpriority](
	[id] [tinyint] NOT NULL,
	[Status] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_prospectpriority] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_prospectpriority_Description]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_prospectpriority_Description](
	[RowGuid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ID] [tinyint] NOT NULL,
	[CultureTypeId] [smallint] NOT NULL,
	[Description] [varchar](20) NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_helpcode_prospectpriority_Description] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_prospectstatus]    Script Date: 19.01.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_prospectstatus](
	[ID] [smallint] NOT NULL,
	[Statusbeschreibung] [varchar](20) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_prospectstatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_ProspectStatus_Description]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_ProspectStatus_Description](
	[RowGuid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ID] [smallint] NOT NULL,
	[CultureTypeId] [smallint] NOT NULL,
	[Statusbeschreibung] [varchar](20) NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_helpcode_ProspectStatus_Description] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Rahmenvertraege]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Rahmenvertraege](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Vertragsart] [varchar](100) NULL,
 CONSTRAINT [PK_helpcode_Rahmenvertraege] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_region]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_region](
	[ID] [tinyint] NOT NULL,
	[Beschreibung] [varchar](30) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_help_code_region] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_SAP_Mitarbeiterkreis]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_SAP_Mitarbeiterkreis](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Bezeichnung] [varchar](255) NULL,
	[Mitarbeiterkreis_kuerzel] [varchar](10) NULL,
 CONSTRAINT [PK_helpcode_SAP_Mitarbeiterkreis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_SAP_PersonalBereiche]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_SAP_PersonalBereiche](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Bezeichnung] [varchar](255) NULL,
	[PersonalBereich_ID] [varchar](5) NULL,
	[Aktiv] [bit] NOT NULL,
 CONSTRAINT [PK_helpcode_SAP_Personalbereiche] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_SAP_PersonalBereichMatrix]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_SAP_PersonalBereichMatrix](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PersonalBereich_ID] [varchar](5) NULL,
	[PersonalTeilBereich_ID] [varchar](5) NULL,
	[Mitarbeiterkreis_Kuerzel] [varchar](10) NULL,
 CONSTRAINT [PK_helpcode_SAP_PersBereichMatrix] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_SAP_PersonalTeilBereich]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_SAP_PersonalTeilBereich](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Bezeichnung] [varchar](255) NULL,
	[PersonalBereich_ID] [varchar](5) NULL,
	[PersonalTeilBereich_ID] [varchar](5) NULL,
 CONSTRAINT [PK_helpcode_SAP_Personaltteilbereich] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_SAP_Sprachschluessel]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_SAP_Sprachschluessel](
	[Guid] [uniqueidentifier] NOT NULL,
	[SprachePVS] [smallint] NULL,
	[SpracheSAP] [varchar](3) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_SAP_Zivilstand_CH]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_SAP_Zivilstand_CH](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Bezeichnung] [varchar](30) NULL,
	[Zivilstand_ID] [tinyint] NULL,
 CONSTRAINT [PK_helpcode_SAP_Zivilstand_CH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_SAPRegion]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_SAPRegion](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SAPSprache] [varchar](1) NOT NULL,
	[ISOLand] [varchar](3) NOT NULL,
	[Region] [varchar](3) NOT NULL,
	[Bezeichnung] [varchar](20) NOT NULL,
 CONSTRAINT [PK_helpcode_SAPRegion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_skillsetzart]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_skillsetzart](
	[id] [tinyint] NOT NULL,
	[setzart] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_skillsetzart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_helpcode_skillsetzart] UNIQUE NONCLUSTERED 
(
	[id] ASC,
	[setzart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Sonderregelung]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Sonderregelung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kategorie] [smallint] NULL,
	[Kurztext] [varchar](50) NULL,
	[Langtext] [varchar](255) NULL,
	[inaktiv] [bit] NOT NULL,
	[Langtext2] [text] NULL,
 CONSTRAINT [PK_helpcode_Sonderregelung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_sortierungstyp]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_sortierungstyp](
	[id] [tinyint] NOT NULL,
	[Sortierungstyp] [varchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[MFC_Type] [smallint] NULL,
 CONSTRAINT [PK_helpcode_sortierungstyp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_helpcode_sortierungstyp] UNIQUE NONCLUSTERED 
(
	[Sortierungstyp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Sortierungstyp_Description]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Sortierungstyp_Description](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Sortierungstyp_ID] [tinyint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](50) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_dbo_helpcode_Sortierungstyp_Description] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [AK_dbo_helpcode_Sortierungstyp_Description] UNIQUE NONCLUSTERED 
(
	[Sortierungstyp_ID] ASC,
	[CultureType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_sprachen]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_sprachen](
	[Sprach_id] [tinyint] NOT NULL,
	[Beschreibung] [varchar](50) NOT NULL,
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Interface_Kennung] [varchar](10) NOT NULL,
	[GUI_Kennung] [varchar](10) NULL,
 CONSTRAINT [PK_helpcode_sprachen] PRIMARY KEY NONCLUSTERED 
(
	[Sprach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_sprachen_Description]    Script Date: 19.01.2022 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_sprachen_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[Id] [tinyint] NULL,
	[LanguageId] [smallint] NULL,
	[Description] [varchar](50) NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_helpcode_sprachen_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Helpcode_Standort]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Helpcode_Standort](
	[ST_ID] [tinyint] NOT NULL,
	[Standort] [varchar](35) NOT NULL,
	[SAbkuerzung] [varchar](10) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Helpcode_Standort] PRIMARY KEY NONCLUSTERED 
(
	[ST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Helpcode_textbaustein]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Helpcode_textbaustein](
	[DokID] [int] NOT NULL,
	[VorlagenNr] [int] NOT NULL,
	[VorlagenBeschreibung] [varchar](255) NULL,
	[VorlagenText] [text] NULL,
	[VorlagenNrtxt] [varchar](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[geaendert_am] [smalldatetime] NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[SprachId] [smallint] NULL,
 CONSTRAINT [PK_Helpcode_textbaustein] PRIMARY KEY NONCLUSTERED 
(
	[DokID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_titel]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_titel](
	[id] [smallint] NOT NULL,
	[Bezeichnung] [varchar](255) NOT NULL,
	[Bemerkung] [varchar](255) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_titel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_titel_beschreibung]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_titel_beschreibung](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[titel_id] [smallint] NOT NULL,
	[sprach_id] [tinyint] NOT NULL,
	[geschlechts_id] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](255) NOT NULL,
	[Briefanrede] [varchar](255) NULL,
	[Abkuerzung] [varchar](50) NULL,
 CONSTRAINT [PK_helpcode_titel_beschreibung] PRIMARY KEY CLUSTERED 
(
	[titel_id] ASC,
	[sprach_id] ASC,
	[geschlechts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_tracking_domainGruppen]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_tracking_domainGruppen](
	[tracking_domainGruppenID] [uniqueidentifier] NOT NULL,
	[tracking_domainGruppenName] [varchar](50) NULL,
	[tracking_domainGruppenTypenID] [int] NULL,
	[tracking_domainGruppenPVSID] [int] NULL,
	[tracking_domainGruppenIgnorieren] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_tracking_domainGruppen] PRIMARY KEY CLUSTERED 
(
	[tracking_domainGruppenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_tracking_domainTypen]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_tracking_domainTypen](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[tracking_domainTypenID] [int] NOT NULL,
	[tracking_domainTypenName] [varchar](50) NULL,
	[tracking_domainTypenSort] [int] NOT NULL,
 CONSTRAINT [PK_helpcode_tracking_domainTypen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_uebergabekunde]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_uebergabekunde](
	[id] [tinyint] NOT NULL,
	[Beschreibung] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_uebergabekunde] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_user_parameter]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_user_parameter](
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Parametername] [varchar](255) NOT NULL,
	[id] [int] NOT NULL,
	[Defaultwert] [nvarchar](50) NULL,
	[ParameterTyp] [smallint] NULL,
 CONSTRAINT [PK_helpcode_user_parameter] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_user_parameter_typ]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_user_parameter_typ](
	[id] [smallint] NOT NULL,
	[typ] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_user_parameter_typ] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Helpcode_verfuegbarkeitsarten]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Helpcode_verfuegbarkeitsarten](
	[id] [smallint] NOT NULL,
	[verfuegbarkeitsart] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Helpcode_verfuegbarkeitsarten] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Helpcode_verfuegbarkeitsarten_Description]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Helpcode_verfuegbarkeitsarten_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[VerfügbarkeitsId] [smallint] NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[LanguageId] [smallint] NOT NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_Helpcode_verfuegbarkeitsarten_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_vorlaeufige_Mitarbeiter_Kategorie]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_vorlaeufige_Mitarbeiter_Kategorie](
	[ID] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_vorlaeufige_Mitarbeiter_Kategorie] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_zahlungsziel_zuordnung]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_zahlungsziel_zuordnung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BUKRS] [varchar](10) NULL,
	[VTWEG] [varchar](2) NULL,
	[Sortierung] [tinyint] NULL,
	[Verwendung] [varchar](1) NULL,
	[SAP_ID] [varchar](10) NULL,
	[Standard] [tinyint] NULL,
	[Zterm_ID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_zahlungsziel_zuordnung_Beschreibung]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_zahlungsziel_zuordnung_Beschreibung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Sprach_id] [tinyint] NOT NULL,
	[ABWTEXT] [nvarchar](50) NULL,
	[BUKRS] [varchar](10) NULL,
	[SAPID] [varchar](10) NULL,
	[VTWEG] [varchar](1) NULL,
	[ZTERM_ID] [uniqueidentifier] NULL,
	[Zuordnungs_id] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_Zahlungsziele]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_Zahlungsziele](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Zahlungsziel] [varchar](100) NULL,
	[Reihenfolge] [int] NOT NULL,
	[Default] [bit] NOT NULL,
	[SAP_ID] [varchar](10) NULL,
 CONSTRAINT [PK_helpcode_Zahlungsziele] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_zahlungsziele_beschreibung]    Script Date: 19.01.2022 12:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_zahlungsziele_beschreibung](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Zahlungsziel_ID] [uniqueidentifier] NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL,
	[Term] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__helpcode__3214EC069A1E26B2] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_helpocde_zahlungsziel_bezeichnung] UNIQUE CLUSTERED 
(
	[Zahlungsziel_ID] ASC,
	[Sprach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_zielposition]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_zielposition](
	[id] [tinyint] NOT NULL,
	[Zielposition] [varchar](1000) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_zielposition] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_zugriffsrollen_Bereich]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_zugriffsrollen_Bereich](
	[ID] [smallint] NOT NULL,
	[Beschreibung] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[rowguid4] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SAPID] [varchar](50) NOT NULL,
	[SAP_Bezeichnung] [varchar](50) NOT NULL,
 CONSTRAINT [PK_helpcode_zugriffsrollen_Bereich] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_zugriffsrollen_Geschaeftstyp]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_zugriffsrollen_Geschaeftstyp](
	[ID] [smallint] NOT NULL,
	[Beschreibung] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[rowguid4] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_zugriffsrollen_Geschaeftstyp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[helpcode_zugriffsrollen_zugriffstyp]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpcode_zugriffsrollen_zugriffstyp](
	[ID] [smallint] NOT NULL,
	[Beschreibung] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_helpcode_zugriffsrollen_zugriffstyp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HPI_SurveyResults]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HPI_SurveyResults](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[KontaktID_SurveyID] [uniqueidentifier] NOT NULL,
	[InternalRespondentId] [int] NOT NULL,
	[PVSID] [uniqueidentifier] NOT NULL,
	[PersonType] [varchar](20) NULL,
	[PersonTypeID] [smallint] NULL,
	[EMail] [varchar](75) NULL,
	[QuestionID] [smallint] NULL,
	[Question] [varchar](2000) NULL,
	[AnswerID] [smallint] NULL,
	[Answer] [varchar](max) NULL,
	[PSPNR] [varchar](100) NULL,
	[CreateDate] [datetime2](3) NULL,
	[AnswerText] [varchar](2000) NULL,
 CONSTRAINT [PK_HPI_SurveyResults] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Arbeitserlaubniskategorie]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Arbeitserlaubniskategorie](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Term] [nvarchar](255) NOT NULL,
	[Arbeitserlaubnistyp_ID] [uniqueidentifier] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_ht_Arbeitserlaubniskategorie] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Arbeitserlaubniskategorie_Description]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Arbeitserlaubniskategorie_Description](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Term] [nvarchar](255) NOT NULL,
	[Arbeitserlaubniskategorie_ID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [uniqueidentifier] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_ht_Arbeitserlaubniskategorie_Description] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ArbeitserlaubnisTyp]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ArbeitserlaubnisTyp](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Term] [nvarchar](255) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_ht_ArbeitserlaubnisTyp] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Branche_Supergroup]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Branche_Supergroup](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Term] [varchar](250) NOT NULL,
	[Erstellt_Am] [datetime] NOT NULL,
	[Erstellt_Von] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ht_Branche_Supergroup] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Branche_Supergroup_Description]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Branche_Supergroup_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[SuperGroupId] [uniqueidentifier] NULL,
	[Description] [varchar](250) NULL,
	[LanguageId] [smallint] NULL,
	[CreatedDate] [datetime2](0) NULL,
 CONSTRAINT [PK_ht_Branche_Supergroup_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Branche_Supergroup_Matrix]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Branche_Supergroup_Matrix](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Branche_ID] [smallint] NOT NULL,
	[SuperGroup_ID] [uniqueidentifier] NOT NULL,
	[Erstellt_Am] [datetime] NOT NULL,
	[Erstellt_Von] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ht_Branche_Supergroup_Matrix] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_BusinessUnit]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_BusinessUnit](
	[Id] [tinyint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ht_BusinessUnit_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_BusinessUnit_Description]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_BusinessUnit_Description](
	[Id] [tinyint] NOT NULL,
	[BU_Id] [tinyint] NOT NULL,
	[LanguageId] [tinyint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ht_BusinessUnit_Description_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ChangeProtocol_ActionType]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ChangeProtocol_ActionType](
	[GUID] [uniqueidentifier] NOT NULL,
	[Term] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ht_ChangeProtocol_ActionType] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ChangeProtocol_ObjectType]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ChangeProtocol_ObjectType](
	[GUID] [uniqueidentifier] NOT NULL,
	[Term] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ht_ChangeProtocol_ObjectType] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Company_legal_form]    Script Date: 19.01.2022 12:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Company_legal_form](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Term] [varchar](80) NOT NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_ht_Company_legal_form] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Company_legal_form_Description]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Company_legal_form_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[GuId] [uniqueidentifier] NOT NULL,
	[Term] [varchar](80) NOT NULL,
	[Description] [varchar](250) NULL,
	[LanguageId] [smallint] NOT NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_ht_Company_legal_form_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ConsentCriminalRecord]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ConsentCriminalRecord](
	[GuidId] [uniqueidentifier] NOT NULL,
	[StatusId] [tinyint] NOT NULL,
	[Term] [nvarchar](20) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
 CONSTRAINT [PK_ht_ConsentCriminalRecord_GuiId] PRIMARY KEY NONCLUSTERED 
(
	[GuidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ConsentCriminalRecord_Description]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ConsentCriminalRecord_Description](
	[GuidId] [uniqueidentifier] NOT NULL,
	[StatusId] [tinyint] NOT NULL,
	[LanguageId] [tinyint] NOT NULL,
	[DescriptionText] [nvarchar](20) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
 CONSTRAINT [PK_ht_ConsentCriminalRecord_Description_GuiId] PRIMARY KEY NONCLUSTERED 
(
	[GuidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_ht_ConsentCriminalRecord_Description_StatusId_LanguageId] UNIQUE NONCLUSTERED 
(
	[StatusId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ContractCultureType]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ContractCultureType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[CultureInterface] [varchar](4) NOT NULL,
	[CultureGUI] [varchar](12) NOT NULL,
	[Icon] [image] NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_ContractCultureType] PRIMARY KEY NONCLUSTERED 
(
	[CultureType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ContractCultureTypeDescription]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ContractCultureTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[CultureType_ID_Main] [smallint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_ContractCultureTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_CultureType]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_CultureType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[CultureInterface] [varchar](4) NOT NULL,
	[CultureGUI] [varchar](12) NOT NULL,
	[Icon] [image] NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
	[CultureRole] [int] NULL,
 CONSTRAINT [PK_ht_CultureType] PRIMARY KEY NONCLUSTERED 
(
	[CultureType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_CultureTypeDescription]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_CultureTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[CultureType_ID_Main] [smallint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_CultureTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_DistributionChannelType]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_DistributionChannelType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DistributionChannelType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_DistributionChannelType] PRIMARY KEY NONCLUSTERED 
(
	[DistributionChannelType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_DistributionChannelTypeDescription]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_DistributionChannelTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DistributionChannelType_ID] [smallint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_DistributionChannelTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_DistributionChannelXCultureTypeXHaysCompanyType]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_DistributionChannelXCultureTypeXHaysCompanyType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DistributionChannelType_ID] [smallint] NULL,
	[HaysCompanyType_ID] [uniqueidentifier] NULL,
	[CultureType_ID] [smallint] NULL,
 CONSTRAINT [PK_ht_DistributionChannelXCultureTypeXHaysCompanyType] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_DistributionChannelXLand]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_DistributionChannelXLand](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DistributionChannelType_ID] [smallint] NULL,
	[Land_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ht_DistributionChannelXLand] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_EntityHierarchy]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_EntityHierarchy](
	[Id] [uniqueidentifier] NOT NULL,
	[Hierarchy_Id] [tinyint] NOT NULL,
	[Term] [nvarchar](50) NOT NULL,
	[Sort] [tinyint] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
 CONSTRAINT [PK_ht_EntityHierarchy_Hierarchy_Id] PRIMARY KEY CLUSTERED 
(
	[Hierarchy_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_EntityHierarchyDescription]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_EntityHierarchyDescription](
	[Id] [uniqueidentifier] NOT NULL,
	[Hierarchy_Id] [tinyint] NOT NULL,
	[Term] [nvarchar](50) NOT NULL,
	[LanguageId] [tinyint] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_HaysCompanyType]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_HaysCompanyType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[SAPCode] [varchar](4) NOT NULL,
	[Active] [bit] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
	[DefaultMail_JB] [varchar](100) NULL,
	[DefaultPhone_JB] [varchar](100) NULL,
 CONSTRAINT [PK_ht_HaysCompanyType] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_HaysCompanyTypeDescription]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_HaysCompanyTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[HaysCompanyType_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_HaysCompanyTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Hoppenstedt]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Hoppenstedt](
	[Firmennummer] [int] NOT NULL,
	[Etikettzeile_1_Firma] [nvarchar](255) NOT NULL,
	[Etikettzeile_2_Firma] [nvarchar](255) NULL,
	[Etikettzeile_3_Firma] [nvarchar](255) NULL,
	[Gruendung] [smallint] NULL,
	[Strasse_Hausnummer] [nvarchar](255) NULL,
	[Landkennung] [nvarchar](5) NULL,
	[Etikett_PLZ_Ort_Str] [nvarchar](255) NULL,
	[Personen_ID] [nvarchar](32) NULL,
	[Geschlecht] [nvarchar](32) NULL,
	[Titel] [nvarchar](32) NULL,
	[Vorname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Leitungsebene] [nvarchar](255) NULL,
	[Funktionstext_D] [nvarchar](255) NULL,
	[Position] [nvarchar](255) NULL,
	[Anredetitel] [nvarchar](64) NULL,
	[Briefanrede] [nvarchar](255) NULL,
	[Etikettzeile_1_Person] [nvarchar](255) NULL,
	[Etikettzeile_2_Person] [nvarchar](255) NULL,
	[Hauptbranche_08] [nvarchar](12) NOT NULL,
	[Branchentext_08_D] [nvarchar](255) NOT NULL,
	[Haupt_und_Nebenbranche_08] [nvarchar](255) NULL,
	[Laendervorwahl] [nvarchar](10) NULL,
	[Vorwahl_Telefon] [nvarchar](30) NULL,
	[Telefon] [nvarchar](30) NULL,
	[Telefon_komplett] [nvarchar](70) NULL,
	[Telefax] [nvarchar](30) NULL,
	[Telefax_komplett] [nvarchar](70) NULL,
	[Email] [nvarchar](255) NULL,
	[Internet_Adresse] [nvarchar](255) NULL,
	[Beschaeftigte] [int] NULL,
	[UmsatzInMio] [money] NULL,
	[PraemieneinnahmeInMio] [money] NULL,
	[BilanzsummeInMio] [money] NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangingDate] [datetime] NULL,
	[DeactivateDate] [datetime] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ht_Hoppenstedt] PRIMARY KEY CLUSTERED 
(
	[Firmennummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_JobfeedOperationalAreaType]    Script Date: 19.01.2022 12:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_JobfeedOperationalAreaType](
	[GUID] [uniqueidentifier] NOT NULL,
	[JobfeedProfessionCode] [smallint] NOT NULL,
	[OperationalAreaType_ID] [smallint] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
	[RolleGuid] [uniqueidentifier] NULL,
	[ProfessionDescription] [varchar](300) NULL,
 CONSTRAINT [PK_ht_JobfeedOperationalAreaType] PRIMARY KEY NONCLUSTERED 
(
	[GUID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Kundenmanagementbranche]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Kundenmanagementbranche](
	[GUID] [uniqueidentifier] NOT NULL,
	[ht_Kundenmanagementbranche_GUID] [uniqueidentifier] NULL,
	[Sort] [int] NOT NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [datetime2](0) NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[geaendert_am] [datetime2](0) NULL,
 CONSTRAINT [PK_dbo_ht_Kundenmanagementbranche] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_KundenmanagementbrancheBezeichnung]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_KundenmanagementbrancheBezeichnung](
	[GUID] [uniqueidentifier] NOT NULL,
	[ht_Kundenmanagementbranche_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[TermKuerzel] [nvarchar](128) NOT NULL,
	[TermBezeichnung] [nvarchar](1024) NOT NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [datetime2](0) NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[gaendert_am] [datetime2](0) NULL,
 CONSTRAINT [PK_dbo_ht_KundenmanagementbrancheBezeichnung] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Kundenmanagementprioritaet]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Kundenmanagementprioritaet](
	[GUID] [uniqueidentifier] NOT NULL,
	[Sort] [int] NOT NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [datetime2](0) NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[geaendert_am] [datetime2](0) NULL,
 CONSTRAINT [PK_dbo_ht_Kundenmanagementprioritaet] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_KundenmanagementprioritaetBezeichnung]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_KundenmanagementprioritaetBezeichnung](
	[GUID] [uniqueidentifier] NOT NULL,
	[ht_Kundenmanagementprioritaet_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[TermKuerzel] [nvarchar](128) NOT NULL,
	[TermBezeichnung] [nvarchar](1024) NOT NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [datetime2](0) NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[gaendert_am] [datetime2](0) NULL,
 CONSTRAINT [PK_dbo_ht_KundenmanagementprioritaetBezeichnung] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_MdmStatus]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_MdmStatus](
	[GuId] [uniqueidentifier] NOT NULL,
	[StatusCode] [smallint] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ht_MdmStatus] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_MdmStatus_Description]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_MdmStatus_Description](
	[GuId] [uniqueidentifier] NOT NULL,
	[StatusCode] [uniqueidentifier] NOT NULL,
	[StatusCodeDescription] [varchar](100) NOT NULL,
	[LanguageId] [smallint] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ht_MdmStatus_description] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_NewProsi_Role_Skillgroup_Matrix]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_NewProsi_Role_Skillgroup_Matrix](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleID] [uniqueidentifier] NOT NULL,
	[SkillgroupID] [uniqueidentifier] NOT NULL,
	[DistributionChannelID] [smallint] NULL,
	[OperationalAreaTypeID] [smallint] NULL,
	[Creator] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](7) NULL,
 CONSTRAINT [PK_ht_NewProsi_Role_Skillgroup_Matrix] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_NG_RightsManagement]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_NG_RightsManagement](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UI_Name] [varchar](200) NOT NULL,
 CONSTRAINT [PK_ht_NG_RightsManagement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_NoticePeriod]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_NoticePeriod](
	[Id] [uniqueidentifier] NOT NULL,
	[PeriodId] [tinyint] NOT NULL,
	[Term] [nvarchar](50) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
 CONSTRAINT [PK_ht_NoticePeriod_PeriodId] PRIMARY KEY CLUSTERED 
(
	[PeriodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_NoticePeriod_Description]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_NoticePeriod_Description](
	[Id] [uniqueidentifier] NOT NULL,
	[PeriodId] [tinyint] NOT NULL,
	[LanguageId] [tinyint] NOT NULL,
	[Term] [nvarchar](50) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
 CONSTRAINT [PK_ht_NoticePeriod_Description_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_OperationalAreaType]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_OperationalAreaType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OperationalAreaType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
	[SAPID] [varchar](50) NULL,
	[SAP_Bezeichnung] [varchar](50) NULL,
 CONSTRAINT [PK_ht_OperationalAreaType] PRIMARY KEY NONCLUSTERED 
(
	[OperationalAreaType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_OperationalAreaTypeDescription]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_OperationalAreaTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OperationalAreaType_ID] [smallint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
	[ueberHayTexteVorlage] [nvarchar](max) NULL,
	[UeberHaysTextExecutive] [nvarchar](max) NULL,
 CONSTRAINT [PK_ht_OperationalAreaTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_PersonType]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_PersonType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PersonType_ID] [smallint] NOT NULL,
	[Term] [varchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
	[Icon] [image] NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_PersonType] PRIMARY KEY NONCLUSTERED 
(
	[PersonType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_PersonTypeDescription]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_PersonTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PersonType_ID] [smallint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_PersonTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Placement_Status]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Placement_Status](
	[ID] [char](3) NOT NULL,
	[NAME] [nvarchar](100) NULL,
	[ACTIVE] [bit] NOT NULL,
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Placement_Status_beschreibung]    Script Date: 19.01.2022 12:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Placement_Status_beschreibung](
	[ID] [char](3) NOT NULL,
	[Beschreibung] [nvarchar](100) NULL,
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_PlacementWizard_Pages]    Script Date: 19.01.2022 12:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_PlacementWizard_Pages](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[XAML] [xml] NOT NULL,
	[Term] [varchar](100) NULL,
	[Internal_Number] [varchar](4) NULL,
 CONSTRAINT [PK_helpcode_vertragsmail_masken] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_PlacementXExtPlacement]    Script Date: 19.01.2022 12:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_PlacementXExtPlacement](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firmen_id] [uniqueidentifier] NOT NULL,
	[Standort_id] [uniqueidentifier] NULL,
	[Placement_id] [uniqueidentifier] NOT NULL,
	[DistributionChannel_id] [smallint] NULL,
	[HaysFirmen_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ht_PlacementXExtPlacement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Premium_Company]    Script Date: 19.01.2022 12:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Premium_Company](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Id] [smallint] NOT NULL,
	[Bezeichnung] [varchar](50) NOT NULL,
	[Reihenfolge] [smallint] NOT NULL,
	[Standardwert] [bit] NOT NULL,
	[Erstellt_Von] [uniqueidentifier] NOT NULL,
	[Erstellt_am] [datetime] NOT NULL,
	[geaendert_am] [datetime] NULL,
 CONSTRAINT [PK_ht_Premium_Company] PRIMARY KEY CLUSTERED 
(
	[GUID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ht_Premium_Company] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Premium_Company_Beschreibung]    Script Date: 19.01.2022 12:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Premium_Company_Beschreibung](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Premium_Company_Id] [smallint] NOT NULL,
	[Bezeichnung] [varchar](50) NOT NULL,
	[Sprach_id] [tinyint] NOT NULL,
	[Erstellt_Von] [uniqueidentifier] NOT NULL,
	[Erstellt_am] [datetime] NOT NULL,
	[Geaendert_am] [datetime] NULL,
 CONSTRAINT [PK_ht_Premium_Company_Beschreibung] PRIMARY KEY CLUSTERED 
(
	[GUID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ht_Premium_Company_Beschreibung_sprach_id] UNIQUE NONCLUSTERED 
(
	[Sprach_id] ASC,
	[Premium_Company_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ProspectSource]    Script Date: 19.01.2022 12:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ProspectSource](
	[SourceId] [tinyint] NOT NULL,
	[SourceValue] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ht_ProspectSource_SourceId] PRIMARY KEY NONCLUSTERED 
(
	[SourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ProspectSourceDescription]    Script Date: 19.01.2022 12:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ProspectSourceDescription](
	[Id] [tinyint] NOT NULL,
	[SourceId] [tinyint] NOT NULL,
	[LanguageId] [tinyint] NOT NULL,
	[Term] [varchar](50) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_ht_ProspectSourceDescription_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_ht_ProspectSourceDescription_SourceId_LanguageId] UNIQUE NONCLUSTERED 
(
	[SourceId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_pt_Team]    Script Date: 19.01.2022 12:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_pt_Team](
	[TeamGUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TeamName] [varchar](50) NOT NULL,
	[TeamNameShort] [varchar](5) NOT NULL,
	[Aktiv] [bit] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_pt_Team] PRIMARY KEY CLUSTERED 
(
	[TeamGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_pt_TeamXDistributionChannelType]    Script Date: 19.01.2022 12:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_pt_TeamXDistributionChannelType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TeamGUID] [uniqueidentifier] NOT NULL,
	[DistributionChannelType_ID] [smallint] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
	[KAMStandortGUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ht_pt_TeamXDistributionChannelType] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_pt_TeamXFirma]    Script Date: 19.01.2022 12:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_pt_TeamXFirma](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TeamGUID] [uniqueidentifier] NOT NULL,
	[Firmen_ID] [uniqueidentifier] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_pt_TeamXFirma] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_pt_TeamXNOTVertragsmail]    Script Date: 19.01.2022 12:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_pt_TeamXNOTVertragsmail](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TeamGUID] [uniqueidentifier] NOT NULL,
	[Vertragsmail_ID] [uniqueidentifier] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_pt_TeamXNOTVertragsmail] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_pt_TeamXStandort]    Script Date: 19.01.2022 12:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_pt_TeamXStandort](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TeamGUID] [uniqueidentifier] NOT NULL,
	[Prospect_standort_ID] [tinyint] NULL,
	[KAMStandort_GUID] [uniqueidentifier] NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_pt_TeamXStandort] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleAppliedType]    Script Date: 19.01.2022 12:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleAppliedType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleAppliedType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleAppliedType] PRIMARY KEY NONCLUSTERED 
(
	[RoleAppliedType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleAppliedTypeDescription]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleAppliedTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleAppliedType_ID] [smallint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleAppliedTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleCharacteristicType]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleCharacteristicType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleCharacteristicType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleCharacteristicType] PRIMARY KEY NONCLUSTERED 
(
	[RoleCharacteristicType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleCharacteristicTypeDescription]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleCharacteristicTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleCharacteristicType_ID] [smallint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleCharacteristicTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleDOSLHCKeywordDescription]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleDOSLHCKeywordDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleDOSLHCMap_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [text] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleDOSLHCKeywordDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleDOSLHCMap]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleDOSLHCMap](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleType_GUID] [uniqueidentifier] NOT NULL,
	[DistributionChannelType_ID] [smallint] NOT NULL,
	[OperationalAreaType_ID] [smallint] NOT NULL,
	[ServiceLineType_ID] [smallint] NULL,
	[HaysCompanyType_GUID] [uniqueidentifier] NOT NULL,
	[Twitteraddress] [varchar](50) NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleDOSLHCMap] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleGroupMap]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleGroupMap](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleGroupType_GUID] [uniqueidentifier] NOT NULL,
	[RoleType_GUID] [uniqueidentifier] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleGroupMap] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleGroupType]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleGroupType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleGroupType] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleGroupTypeDescription]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleGroupTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleGroupType_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Description] [varchar](250) NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleGroupTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleParameterValueTypeDescription]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleParameterValueTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleCharacteristicType_ID] [smallint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Value] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleParameterValueTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleSearchParameterGroupType]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleSearchParameterGroupType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Sort_ID] [smallint] NOT NULL,
	[RoleCharacteristicType_ID] [smallint] NOT NULL,
	[Term] [varchar](150) NOT NULL,
	[Operator1] [varchar](2) NOT NULL,
	[Value1] [smallint] NOT NULL,
	[Operator2] [varchar](2) NULL,
	[Value2] [smallint] NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleSearchParameterGroupType] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleSearchParameterGroupTypeDescription]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleSearchParameterGroupTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleSearchParamterGroupType_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](50) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleSearchParameterGroupTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleSkillGroupMap]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleSkillGroupMap](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleType_GUID] [uniqueidentifier] NOT NULL,
	[SkillGroupType_GUID] [uniqueidentifier] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleSkillGroupMap] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleType]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[RoleCharacteristicType_ID] [smallint] NOT NULL,
	[inactive] [bit] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
	[IsHidden] [bit] NULL,
 CONSTRAINT [PK_ht_RoleType] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleTypeDescription]    Script Date: 19.01.2022 12:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleType_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Description] [varchar](250) NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_RoleTypeSynonymDescription]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_RoleTypeSynonymDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RoleType_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Synonym] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_RoleTypeSynonymDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ServiceLineType]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ServiceLineType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ServiceLineType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_ServiceLineType] PRIMARY KEY NONCLUSTERED 
(
	[ServiceLineType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ServiceLineTypeDescription]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ServiceLineTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ServiceLineType_ID] [smallint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_ServiceLineTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillAppliedType]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillAppliedType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillAppliedType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillAppliedType] PRIMARY KEY NONCLUSTERED 
(
	[SkillAppliedType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillAppliedTypeDescription]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillAppliedTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillAppliedType_ID] [smallint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillAppliedTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillCharacteristicType]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillCharacteristicType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillCharacteristicType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillCharacteristicType] PRIMARY KEY NONCLUSTERED 
(
	[SkillCharacteristicType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillCharacteristicTypeDescription]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillCharacteristicTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillCharacteristicType_ID] [smallint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillCharacteristicTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillGroupDOMap]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillGroupDOMap](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillGroupType_GUID] [uniqueidentifier] NOT NULL,
	[DistributionChannelType_ID] [smallint] NOT NULL,
	[OperationalAreaType_ID] [smallint] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillGroupDOMap] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillGroupMap]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillGroupMap](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillGroupType_GUID] [uniqueidentifier] NOT NULL,
	[SkillType_GUID] [uniqueidentifier] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillGroupMap] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillGroupType]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillGroupType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillGroupType] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillGroupTypeDescription]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillGroupTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillGroupType_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Description] [varchar](250) NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillGroupTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillParameterValueTypeDescription]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillParameterValueTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillCharacteristicType_ID] [smallint] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Value] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillParameterValueTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillSearchParameterGroupType]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillSearchParameterGroupType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Sort_ID] [smallint] NOT NULL,
	[SkillCharacteristicType_ID] [smallint] NOT NULL,
	[Term] [varchar](150) NOT NULL,
	[Operator1] [varchar](2) NOT NULL,
	[Value1] [smallint] NOT NULL,
	[Operator2] [varchar](2) NULL,
	[Value2] [smallint] NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillSearchParameterGroupType] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillSearchParameterGroupTypeDescription]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillSearchParameterGroupTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillSearchParamterGroupType_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](50) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillSearchParameterGroupTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillType]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[SkillCharacteristicType_ID] [smallint] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
	[AdministrativeSkill] [bit] NULL,
 CONSTRAINT [PK_ht_SkillType] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillTypeDescription]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillType_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Description] [varchar](250) NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillTypeSynonymDescription]    Script Date: 19.01.2022 12:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillTypeSynonymDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillType_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Synonym] [varchar](100) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillTypeSynonymDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillUpperGroupMap]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillUpperGroupMap](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillUpperGroupType_GUID] [uniqueidentifier] NOT NULL,
	[SkillGroupType_GUID] [uniqueidentifier] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillUpperGroupMap] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillUpperGroupType]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillUpperGroupType](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[SkillTab] [smallint] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillUpperGroupType] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SkillUpperGroupTypeDescription]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SkillUpperGroupTypeDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SkillUpperGroupType_GUID] [uniqueidentifier] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Description] [varchar](250) NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_SkillUpperGroupTypeDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SourceOfOpportunity]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SourceOfOpportunity](
	[SourceId] [uniqueidentifier] NOT NULL,
	[SourceTerm] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ht_SourceOfOpportunity_SourceID] PRIMARY KEY NONCLUSTERED 
(
	[SourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_SourceOfOpportunityDescription]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_SourceOfOpportunityDescription](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[SourceId] [uniqueidentifier] NOT NULL,
	[LanguageId] [tinyint] NOT NULL,
	[Term] [varchar](50) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_ht_SourceOfOpportunityDescription_RowGuid] PRIMARY KEY NONCLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_StatusOfOpportunity]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_StatusOfOpportunity](
	[StatusId] [uniqueidentifier] NOT NULL,
	[StatusTerm] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ht_StatusOfOpportunity_StatusID] PRIMARY KEY NONCLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_StatusOfOpportunityDescription]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_StatusOfOpportunityDescription](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[StatusId] [uniqueidentifier] NOT NULL,
	[LanguageId] [tinyint] NOT NULL,
	[Term] [varchar](50) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_ht_StatusOfOpportunityDescription_RowGuid] PRIMARY KEY NONCLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Translation_Placement]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Translation_Placement](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OrderID] [int] NOT NULL,
	[Term] [varchar](150) NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[TermGroup] [varchar](150) NULL,
	[TermID] [int] NULL,
 CONSTRAINT [PK_ht_Translation_Placement] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Translation_PropertyDokGen]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Translation_PropertyDokGen](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PropertyName] [nvarchar](max) NULL,
	[TranslationPropertyName] [nvarchar](max) NULL,
	[CultureType_ID] [smallint] NULL,
 CONSTRAINT [PK_ht_Translation_PropertyDokGen] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_UI_MessageBoxDescription]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_UI_MessageBoxDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UI_MessageBoxDescription_ID] [int] NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[Prompt] [varchar](max) NOT NULL,
	[Translated] [bit] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_UI_MessageBoxDescription] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_UI_TranslationDescription]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_UI_TranslationDescription](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UI_Name] [varchar](250) NOT NULL,
	[Control] [varchar](250) NOT NULL,
	[CultureType_ID] [smallint] NOT NULL,
	[Term] [varchar](250) NOT NULL,
	[Translated] [bit] NOT NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_ht_UI_TranslationDescription] PRIMARY KEY NONCLUSTERED 
(
	[UI_Name] ASC,
	[Control] ASC,
	[CultureType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_VertragsmailBereich]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_VertragsmailBereich](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Bezeichnung] [varchar](150) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_VertragsmailBereich_Description]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_VertragsmailBereich_Description](
	[GuId] [uniqueidentifier] NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[CultureTypeId] [smallint] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ht_VertragsmailBereich_Description_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_VertragsmailXDokGen_Vorlagen]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_VertragsmailXDokGen_Vorlagen](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[firmen_id] [uniqueidentifier] NULL,
	[Vertragsmail_ID] [uniqueidentifier] NOT NULL,
	[Vorlage] [varchar](max) NOT NULL,
	[DokGen_VorlagenGuid] [uniqueidentifier] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
	[Changer] [uniqueidentifier] NULL,
	[GenerateContract] [bit] NULL,
 CONSTRAINT [PK_ht_VertragsmailXDokGen_Vorlagen] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_Zuordnung_PLZ_Niederlassung]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_Zuordnung_PLZ_Niederlassung](
	[ROWGUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PLZ] [varchar](5) NULL,
	[Niederlassung] [uniqueidentifier] NULL,
	[ErstelltAm] [datetime2](2) NOT NULL,
	[GeaendertAm] [datetime2](2) NULL,
	[ErstelltVon] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ht_Zuordnung_PLZ_Niederlassung_ROWGUID] PRIMARY KEY CLUSTERED 
(
	[ROWGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HTS_Service]    Script Date: 19.01.2022 12:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HTS_Service](
	[HTS_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firma] [uniqueidentifier] NULL,
	[Konzern] [uniqueidentifier] NULL,
	[Service] [varchar](10) NULL,
 CONSTRAINT [PK_Firmen_HTS] PRIMARY KEY CLUSTERED 
(
	[HTS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import_SM2PVS_Fields]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_SM2PVS_Fields](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Host_Guid] [uniqueidentifier] NOT NULL,
	[Term] [varchar](max) NOT NULL,
	[Search_Start_Seq] [varchar](max) NOT NULL,
	[Search_End_Seq] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Import_SM2PVS_Fields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import_SM2PVS_Host]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_SM2PVS_Host](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Term] [nvarchar](50) NOT NULL,
	[URL] [varchar](200) NOT NULL,
	[Order_id] [int] NULL,
	[ErstkontaktartID] [smallint] NOT NULL,
 CONSTRAINT [PK_Import_SM2PVS_Host] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IR_Bewerbung]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IR_Bewerbung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[IR_Position_ID_Aktuell] [uniqueidentifier] NOT NULL,
	[Angelegt_Am] [datetime] NOT NULL,
	[Angelegt_Von] [uniqueidentifier] NOT NULL,
	[IR_Prozess_Aktuell] [uniqueidentifier] NOT NULL,
	[IR_Prozess_GeaendertAm] [datetime] NOT NULL,
	[Gehoert_Zu] [uniqueidentifier] NOT NULL,
	[Gehoert_Ab] [datetime] NOT NULL,
 CONSTRAINT [PK_IR_Bewerbung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IR_Position]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IR_Position](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Beschreibung] [varchar](100) NOT NULL,
	[BereichName] [varchar](100) NOT NULL,
	[Angelegt_Am] [datetime] NOT NULL,
	[Angelegt_Von] [uniqueidentifier] NOT NULL,
	[PB_Standort_ID] [tinyint] NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_IR_Position] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IR_PositionStandort]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IR_PositionStandort](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Position_ID] [uniqueidentifier] NOT NULL,
	[PB_Standort_ID] [tinyint] NOT NULL,
 CONSTRAINT [PK_IR_PositionStandorte] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IR_Prozess]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IR_Prozess](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[IR_BewerbungsID] [uniqueidentifier] NOT NULL,
	[IR_ProzessStatusID] [uniqueidentifier] NOT NULL,
	[Angelegt_Am] [datetime] NOT NULL,
	[Angelegt_Von] [uniqueidentifier] NOT NULL,
	[IR_Position_ID_Aktuell] [uniqueidentifier] NOT NULL,
	[IR_Position_ID_Alt] [uniqueidentifier] NULL,
 CONSTRAINT [PK_IR_Prozess] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IR_ProzessNotizen]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IR_ProzessNotizen](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[IR_ProzessID] [uniqueidentifier] NOT NULL,
	[BPKontaktID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_IR_ProzessNotizen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IR_ProzessStatus]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IR_ProzessStatus](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[UIControl] [varchar](50) NULL,
	[IstEndStatus] [bit] NOT NULL,
 CONSTRAINT [PK_IR_ProzessStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IR_ProzessStatus_Bezeichnung]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IR_ProzessStatus_Bezeichnung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[IR_ProzessStatus_ID] [uniqueidentifier] NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](100) NOT NULL,
 CONSTRAINT [PK_IR_ProzessStatus_Bezeichnung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IR_ProzessTeilnehmer]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IR_ProzessTeilnehmer](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[IR_ProzessID] [uniqueidentifier] NOT NULL,
	[PB_MitarbeiterID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_IR_ProzessTeilnehmer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JB_Jobboersenzuordnung_HaysFirma]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JB_Jobboersenzuordnung_HaysFirma](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Jobboerse_ID] [uniqueidentifier] NOT NULL,
	[HaysFirma_ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_JB_Jobboersenzuordnung_HaysFirma] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JB_Kontingente]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JB_Kontingente](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Jobboerse_ID] [uniqueidentifier] NOT NULL,
	[Vertriebsweg_ID] [int] NULL,
	[Geschaeftsbereich_ID] [int] NULL,
	[Standort_ID] [uniqueidentifier] NULL,
	[Monat] [int] NULL,
	[Jahr] [int] NOT NULL,
	[Kontingent] [int] NOT NULL,
	[Kontingent_aufgebraucht] [bit] NULL,
	[Kontingent_uebertragen] [bit] NULL,
 CONSTRAINT [PK_JB_Kontingente] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JB_Kontingente_Verbrauch]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JB_Kontingente_Verbrauch](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kontingent_ID] [uniqueidentifier] NOT NULL,
	[Prospect_ID] [uniqueidentifier] NOT NULL,
	[Prospect_Nr] [varchar](7) NULL,
	[Prospect_Standort] [varchar](2) NULL,
	[Kuerzel] [varchar](5) NULL,
	[Mitarbeiter_ID] [uniqueidentifier] NOT NULL,
	[Standort_ID] [uniqueidentifier] NOT NULL,
	[Prosi_Bereich_ID] [int] NOT NULL,
	[Prosi_Vertriebsweg_ID] [int] NOT NULL,
	[Slotkontingent] [bit] NULL,
	[Slotk_Entfernt] [bit] NULL,
 CONSTRAINT [PK_JB_Kontingente_Verbrauch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JB_Prioritaetenverwaltung]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JB_Prioritaetenverwaltung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Jobboerse_ID] [uniqueidentifier] NOT NULL,
	[Prioritaet] [int] NOT NULL,
 CONSTRAINT [PK_JB_Prioritaetenverwaltung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobboerse]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobboerse](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ValueDefinition] [ntext] NOT NULL,
	[OutputTemplate] [ntext] NOT NULL,
	[InnerXmlCode] [ntext] NULL,
	[XSLTDefinition] [ntext] NULL,
	[FreigabeBenoetigt] [bit] NULL,
	[EntfernenBenachrichtigen] [bit] NOT NULL,
	[Kostenlos] [bit] NULL,
	[aktiv] [bit] NULL,
	[Kontingentart] [varchar](50) NULL,
	[LI_RecruiterAccount] [bit] NULL,
 CONSTRAINT [PK_Jobboerse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobboerse_Freigabe_Sprache]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobboerse_Freigabe_Sprache](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ProspectNr] [varchar](50) NOT NULL,
	[Sprache] [int] NOT NULL,
	[Jobboerse] [uniqueidentifier] NOT NULL,
	[Prospect] [uniqueidentifier] NOT NULL,
	[ErstelltVon] [uniqueidentifier] NOT NULL,
	[ErstelltAm] [datetime] NOT NULL,
	[VideoLink] [varchar](250) NULL,
	[LI_RecruiterMail] [varchar](100) NULL,
	[LI_JobType] [varchar](10) NULL,
	[LI_Experience] [int] NULL,
	[MS_PLZ] [varchar](250) NULL,
	[JobRoomId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Jobboerse_Freigabe_Sprache] PRIMARY KEY CLUSTERED 
(
	[ProspectNr] ASC,
	[Sprache] ASC,
	[Jobboerse] ASC,
	[Prospect] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobboerseDokumente]    Script Date: 19.01.2022 12:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobboerseDokumente](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Jobboerse] [uniqueidentifier] NOT NULL,
	[Prospect] [uniqueidentifier] NOT NULL,
	[ErstelltAm] [smalldatetime] NOT NULL,
	[InnerXmlCode] [ntext] NULL,
	[Ersteller] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_JobboerseDokumente] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobBoerseDokumentWerte]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobBoerseDokumentWerte](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[JobboerseDokument] [uniqueidentifier] NOT NULL,
	[NodeIdentifier] [uniqueidentifier] NOT NULL,
	[SortOrder] [bigint] NOT NULL,
	[ParentNode] [uniqueidentifier] NULL,
	[Name] [varchar](50) NOT NULL,
	[Wert] [varchar](8000) NULL,
	[InnerXmlCode] [ntext] NULL,
	[NodeType] [int] NOT NULL,
	[GeaendertAm] [smalldatetime] NOT NULL,
	[GeaendertVon] [uniqueidentifier] NOT NULL,
	[geloescht] [bit] NOT NULL,
	[NamespaceURI] [varchar](255) NULL,
 CONSTRAINT [PK_JobBoerseDokumentWerte] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobboerseProspect]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobboerseProspect](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Jobboerse] [uniqueidentifier] NOT NULL,
	[Prospect] [uniqueidentifier] NOT NULL,
	[ErstelltAm] [smalldatetime] NOT NULL,
	[Ersteller] [uniqueidentifier] NOT NULL,
	[BemerkungKostenlose] [varchar](250) NULL,
	[JobCenterPlacement] [bit] NULL,
 CONSTRAINT [PK_JobboerseProspect] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobboerseVersandDokumentTypen]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobboerseVersandDokumentTypen](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_JobboerseVersandDokumentTypen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobboerseVersandHistorie]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobboerseVersandHistorie](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ErstelltAm] [smalldatetime] NOT NULL,
	[JobboerseDokument] [uniqueidentifier] NOT NULL,
	[ErstelltVon] [uniqueidentifier] NOT NULL,
	[GültigBis] [smalldatetime] NULL,
	[DokumentTyp] [int] NULL,
 CONSTRAINT [PK_JobboerseVersandHistorie] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobDetailsMap]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobDetailsMap](
	[Id] [uniqueidentifier] NOT NULL,
	[Sequence_Number] [int] NOT NULL,
	[ProspectId] [uniqueidentifier] NULL,
	[Deleted] [bit] NOT NULL,
	[BusinessRelevant] [bit] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[JobID] [uniqueidentifier] NULL,
	[OpportunityId] [uniqueidentifier] NULL,
	[RespKam] [uniqueidentifier] NULL,
	[PostingId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_JobDetailsMap_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobDetailsMapCC]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobDetailsMapCC](
	[Id] [uniqueidentifier] NOT NULL,
	[JobID] [uniqueidentifier] NULL,
	[Sequence_Number] [int] NOT NULL,
	[CCId] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[companyOfficeId] [uniqueidentifier] NULL,
	[PostingId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_JobDetailsMapCC_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobDetailsMapCompany]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobDetailsMapCompany](
	[Id] [uniqueidentifier] NOT NULL,
	[JobID] [uniqueidentifier] NULL,
	[Sequence_Number] [int] NOT NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsManualMatcht] [bit] NULL,
	[PostingId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_JobDetailsMapCompany_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobDetailsMapKam]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobDetailsMapKam](
	[Id] [uniqueidentifier] NOT NULL,
	[PostingId] [uniqueidentifier] NULL,
	[KamId] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_JobDetailsMapKam_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobDetailsMapNote]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobDetailsMapNote](
	[Id] [uniqueidentifier] NOT NULL,
	[PostingId] [uniqueidentifier] NULL,
	[Note] [nvarchar](1024) NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_JobDetailsMapNote_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KAM_BP_Favoriten]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KAM_BP_Favoriten](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[KAM_ID] [uniqueidentifier] NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[Bemerkung] [varchar](2000) NULL,
 CONSTRAINT [PK_KAM_BP_Favoriten] PRIMARY KEY CLUSTERED 
(
	[KAM_ID] ASC,
	[BP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KennzahlenToolKombination]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KennzahlenToolKombination](
	[Name] [varchar](50) NOT NULL,
	[ErstelltVon] [uniqueidentifier] NOT NULL,
	[ErstelltAm] [smalldatetime] NOT NULL,
	[InnerXML] [ntext] NOT NULL,
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_KennzahlenToolKombination] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KennzahlenToolLightConfig]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KennzahlenToolLightConfig](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[InnerXML] [ntext] NULL,
	[UserID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_KennzahlenToolLightConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Konzern]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Konzern](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Konzernname] [varchar](255) NOT NULL,
	[erstellt_am] [smalldatetime] NOT NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[Kennzeichnung] [varchar](100) NULL,
	[KAM] [varchar](100) NULL,
	[variabler_Name] [varchar](100) NULL,
	[HTS_Kennzeichnung] [varchar](50) NULL,
	[HTS_Bemerkung] [varchar](255) NULL,
 CONSTRAINT [PK_Konzern] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kunde]    Script Date: 19.01.2022 12:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kunde](
	[kunde_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Vorname] [varchar](30) NULL,
	[Name] [varchar](50) NOT NULL,
	[Position] [varchar](80) NULL,
	[Strasse] [varchar](200) NULL,
	[Postfach] [varchar](50) NULL,
	[PLZ] [varchar](50) NULL,
	[Ort] [varchar](200) NULL,
	[Tel_direkt] [varchar](20) NULL,
	[Sekretariat] [varchar](25) NULL,
	[Mobil_Tel] [varchar](20) NULL,
	[E_Mail] [varchar](75) NULL,
	[FAX] [varchar](20) NULL,
	[Tel_privat] [varchar](20) NULL,
	[PLZ_PF] [varchar](50) NULL,
	[Bemerkung] [text] NULL,
	[Zielgruppe] [tinyint] NULL,
	[erstellt_am] [smalldatetime] NULL,
	[Homepage] [varchar](125) NULL,
	[State] [tinyint] NULL,
	[Kundenstatus] [char](1) NULL,
	[Standort] [uniqueidentifier] NOT NULL,
	[geaendert_am] [smalldatetime] NULL,
	[Leadstatus] [tinyint] NOT NULL,
	[loeschen] [bit] NOT NULL,
	[inaktiv] [bit] NOT NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[Geschlecht] [tinyint] NULL,
	[Geburtsdatum] [datetime] NULL,
	[Sprache] [tinyint] NOT NULL,
	[Titel] [smallint] NULL,
	[Familienstand] [tinyint] NULL,
	[Abteilung] [uniqueidentifier] NULL,
	[Zielkunde] [tinyint] NULL,
	[Bundesland] [uniqueidentifier] NULL,
	[land] [uniqueidentifier] NULL,
	[ist_zentrale] [bit] NOT NULL,
	[Lounge_Login] [bit] NOT NULL,
	[ExSAP] [bit] NOT NULL,
	[AktivSAP] [bit] NOT NULL,
	[SAPNummer] [varchar](20) NULL,
	[E_Mail2] [varchar](75) NULL,
	[PlanSAP] [bit] NOT NULL,
	[Wunschrolle_ID] [uniqueidentifier] NULL,
	[Linkedin_ID] [varchar](50) NULL,
	[LI_Linked] [bit] NULL,
	[Webemail] [varchar](200) NULL,
	[XingQuality] [varchar](max) NULL,
	[XingUrl] [varchar](max) NULL,
	[Linkedin_URL] [varchar](max) NULL,
	[BirthName] [varchar](50) NULL,
	[Lat] [decimal](13, 9) NULL,
	[Lng] [decimal](13, 9) NULL,
	[MDMDeleted] [bit] NULL,
 CONSTRAINT [PK_Kunde] PRIMARY KEY NONCLUSTERED 
(
	[kunde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kunde_Mailadressen_Archiv]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kunde_Mailadressen_Archiv](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kunde_ID] [uniqueidentifier] NOT NULL,
	[Mailadresse] [varchar](250) NOT NULL,
	[Erstellt_am] [datetime] NOT NULL,
	[Erstellt_von] [varchar](50) NOT NULL,
	[Geaendert_von] [varchar](50) NULL,
	[Geaendert_am] [datetime] NULL,
 CONSTRAINT [PK_Kunde_Mailadressen_Archiv] PRIMARY KEY CLUSTERED 
(
	[ID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kunde_Wiedervorlage]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kunde_Wiedervorlage](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[User_ID] [uniqueidentifier] NOT NULL,
	[Kunde_ID] [uniqueidentifier] NOT NULL,
	[WVL_Datum] [datetime] NOT NULL,
	[Bemerkung] [varchar](2000) NULL,
	[Erledigt] [bit] NOT NULL,
	[Erstellt_von] [uniqueidentifier] NOT NULL,
	[Erstellt_am] [datetime] NOT NULL,
	[Geaendert_von] [uniqueidentifier] NULL,
	[Geaendert_am] [datetime] NULL,
	[AppointmentId] [varchar](250) NULL,
 CONSTRAINT [PK_Kunde_Wiedervorlage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kunde_zuordnung_wvl]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kunde_zuordnung_wvl](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kunde] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NOT NULL,
	[Bemerkung] [varchar](2000) NULL,
	[Hauptkam] [bit] NOT NULL,
	[zugeordnet_von] [uniqueidentifier] NULL,
	[zugeordnet_am] [smalldatetime] NULL,
	[WVL] [datetime] NULL,
	[geaendert_am] [smalldatetime] NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Kunde_Zuordnung_wvl] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_Kunde_Zuordnung_wvl] UNIQUE CLUSTERED 
(
	[user_id] ASC,
	[Kunde] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kunden_kam_bereich]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kunden_kam_bereich](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kunde_kam_zuordnungs_id] [uniqueidentifier] NOT NULL,
	[Bereichs_id] [smallint] NOT NULL,
	[zugeordnet_von] [uniqueidentifier] NOT NULL,
	[zugeordnet_am] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Kunden_kam_bereich] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kundenbereiche]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kundenbereiche](
	[id] [smallint] NOT NULL,
	[bereichsbezeichnung] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Geschaeftstyp] [smallint] NULL,
	[Bereich] [smallint] NULL,
 CONSTRAINT [PK_Kundenbereiche] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KundenFaehigkeit]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KundenFaehigkeit](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[F_ID] [int] NOT NULL,
	[Auspraegung] [tinyint] NOT NULL,
	[Erstellungsdatum] [smalldatetime] NULL,
	[Aenderungsdatum] [smalldatetime] NULL,
	[Setzart] [tinyint] NULL,
	[Ausgabereihenfolge] [int] NULL,
	[kunde_id] [uniqueidentifier] NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[erstellt_von] [uniqueidentifier] NULL,
 CONSTRAINT [PK_KundenFaehigkeit] PRIMARY KEY NONCLUSTERED 
(
	[F_ID] ASC,
	[kunde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kundenkontakt]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kundenkontakt](
	[kontakt_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[aufgenommen_durch] [varchar](5) NULL,
	[Inhalt] [text] NULL,
	[Leitsatz] [varchar](100) NULL,
	[Telefonat] [bit] NOT NULL,
	[Besuch] [bit] NOT NULL,
	[Bitte_RR] [bit] NOT NULL,
	[Unterlagen_geschickt] [bit] NOT NULL,
	[Unterlagen_nachgefasst] [bit] NOT NULL,
	[kunde_id] [uniqueidentifier] NOT NULL,
	[Sortierungstyp] [tinyint] NOT NULL,
	[mail_to] [varchar](255) NULL,
	[mail_cc] [varchar](255) NULL,
	[mail_bcc] [varchar](255) NULL,
	[mail_subject] [varchar](255) NULL,
	[mail_body] [text] NULL,
	[user_id] [uniqueidentifier] NULL,
	[ARB] [bit] NOT NULL,
	[NE] [bit] NOT NULL,
	[Qualitaetskontakt] [bit] NOT NULL,
	[Datum] [datetime] NULL,
	[XingChatId] [varchar](50) NULL,
	[Werkvertrag] [bit] NULL,
	[EMailId] [uniqueidentifier] NULL,
	[SocialMediaQK] [bit] NULL,
	[ExternalMessageId] [nvarchar](100) NULL,
	[JobFeed] [bit] NULL,
	[XSelling] [bit] NULL,
 CONSTRAINT [PK_kundenkontakte2] PRIMARY KEY NONCLUSTERED 
(
	[kontakt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kundenkontaktdokument]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kundenkontaktdokument](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[kontakt_id] [uniqueidentifier] NOT NULL,
	[Dokument_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_kundenkontaktdokumente] PRIMARY KEY NONCLUSTERED 
(
	[kontakt_id] ASC,
	[Dokument_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kundenmanagement]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kundenmanagement](
	[GUID] [uniqueidentifier] NOT NULL,
	[Firmenstandort_GUID] [uniqueidentifier] NULL,
	[Firmennummer] [int] NULL,
	[ht_Kundenmanagementbranche_GUID] [uniqueidentifier] NULL,
	[BeschaeftigteInsgesamt] [int] NULL,
	[BeschaeftigtePLZNiederlassung] [int] NULL,
	[Information] [nvarchar](1024) NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [datetime2](0) NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[geaendert_am] [datetime2](0) NULL,
 CONSTRAINT [PK_dbo_Kundenmanagement] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kundenmanagementmerkmal]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kundenmanagementmerkmal](
	[GUID] [uniqueidentifier] NOT NULL,
	[Kundenmanagement_GUID] [uniqueidentifier] NOT NULL,
	[ht_OperationalAreaType_ID] [smallint] NOT NULL,
	[ht_DistributionChannelType_ID] [smallint] NOT NULL,
	[PB_Mitarbeiter_GUID_KAM] [uniqueidentifier] NULL,
	[ht_Kundenmanagementprioritaet_GUID] [uniqueidentifier] NULL,
	[AnzahlExterneMitarbeiter] [int] NULL,
	[AnzahlBekannterEntscheider] [int] NULL,
	[KundeZuvergeben] [bit] NOT NULL,
	[ToDo] [nvarchar](1024) NULL,
	[ToDo_geaendert_am] [datetime2](0) NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [datetime2](0) NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[geaendert_am] [datetime2](0) NULL,
 CONSTRAINT [PK_dbo_Kundenmanagementmerkmal] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KundenmanagementPB_HT_Standorte]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KundenmanagementPB_HT_Standorte](
	[GUID] [uniqueidentifier] NOT NULL,
	[Kundenmanagement_GUID] [uniqueidentifier] NOT NULL,
	[PB_HT_Standorte_GUID] [uniqueidentifier] NOT NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [datetime2](0) NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[geaendert_am] [datetime2](0) NULL,
 CONSTRAINT [PK_dbo_KundenmanagementPB_HT_Standorte] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log_Objectaccess]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_Objectaccess](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PVS_ID] [uniqueidentifier] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Log_Objectaccess] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marktzugang_MAAnzahl]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marktzugang_MAAnzahl](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firma] [uniqueidentifier] NOT NULL,
	[AnzahlMA] [int] NOT NULL,
	[AnzahlMADE] [int] NOT NULL,
	[AnzahlMAAT] [int] NOT NULL,
	[AnzahlMACH] [int] NOT NULL,
	[Bemerkung] [text] NULL,
 CONSTRAINT [PK_Marktzugang_MAAnzahl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marktzugang_MAZielsektor]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marktzugang_MAZielsektor](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firma] [uniqueidentifier] NOT NULL,
	[Bereich] [smallint] NOT NULL,
	[Anzahl] [int] NOT NULL,
	[Extern] [bit] NOT NULL,
 CONSTRAINT [PK_Marktzugang_MAZielsektor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marktzugang_Potential]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marktzugang_Potential](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firma] [uniqueidentifier] NOT NULL,
	[Geschaeftstyp] [smallint] NOT NULL,
	[Bereich] [smallint] NOT NULL,
 CONSTRAINT [PK_Marktzugang_Potential] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mitarbeiter]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiter](
	[BP_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Vorname] [varchar](50) NULL,
	[Schwerpunkt] [varchar](200) NULL,
	[Firmenname] [varchar](255) NULL,
	[Geburtsdatum] [datetime] NULL,
	[Nationalitaet] [varchar](3) NULL,
	[max_Preis] [varchar](30) NULL,
	[Spesen] [varchar](50) NULL,
	[Inaktiv] [bit] NOT NULL,
	[Verfuegbarkeitsdatum] [datetime] NULL,
	[ProjektMa] [bit] NOT NULL,
	[ExProjektMa] [bit] NOT NULL,
	[DVseit] [smallint] NULL,
	[PLZ] [varchar](10) NULL,
	[Ort] [varchar](100) NULL,
	[Strasse] [varchar](50) NULL,
	[PLZ_PF] [varchar](10) NULL,
	[Postfach] [varchar](20) NULL,
	[HomeTel] [varchar](30) NULL,
	[HomeTel2] [varchar](30) NULL,
	[HomeFax] [varchar](30) NULL,
	[MobilPhone] [varchar](30) NULL,
	[ProjektTel] [varchar](30) NULL,
	[ProjektTel2] [varchar](30) NULL,
	[ProjektFax] [varchar](30) NULL,
	[Bemerkung] [text] NULL,
	[Erstkontaktart] [smallint] NOT NULL,
	[Tagessatz] [int] NULL,
	[Loeschen] [bit] NOT NULL,
	[Hyperlink_Profil] [varchar](255) NULL,
	[E_Mail] [varchar](75) NULL,
	[KreditorenNr] [int] NULL,
	[Stundensatz] [money] NOT NULL,
	[Stundensatz_Waehrung] [varchar](5) NOT NULL,
	[Erfassungsstatus] [int] NOT NULL,
	[erstellt_am] [smalldatetime] NULL,
	[Homepage] [varchar](125) NULL,
	[Fachschwerpunkt] [varchar](255) NULL,
	[Jahresgehalt] [int] NULL,
	[PCP] [bit] NOT NULL,
	[PSO_AP] [bit] NOT NULL,
	[Verfuegbarkeitszeit_in_Prozent] [tinyint] NULL,
	[PSO_ID] [uniqueidentifier] NULL,
	[geschlecht] [tinyint] NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[Familienstand] [tinyint] NULL,
	[Sprach_id] [tinyint] NOT NULL,
	[titel_id] [smallint] NULL,
	[Zielposition] [tinyint] NULL,
	[verfuegbarkeitsart] [smallint] NULL,
	[import_export_id] [int] NULL,
	[Land] [uniqueidentifier] NULL,
	[Sperrvermerk] [text] NULL,
	[Kuendigungsfrist] [text] NULL,
	[ProjektEmail] [varchar](50) NULL,
	[IdentCheck] [bit] NOT NULL,
	[vorlaufige_Kategorie] [tinyint] NULL,
	[aktuelle_Kategorie] [char](2) NULL,
	[Profil_angefasst] [smalldatetime] NULL,
	[Profil_aktualisiert] [smalldatetime] NULL,
	[letztes_Reminderdatum] [smalldatetime] NULL,
	[Remindermail_Nr] [smallint] NULL,
	[Lounge_Login] [bit] NOT NULL,
	[TempDok] [bit] NOT NULL,
	[PremiumPartner] [bit] NOT NULL,
	[Fuehrungszeugnis] [bit] NOT NULL,
	[Kreditorennummer] [varchar](20) NULL,
	[Arbeitsamt] [bit] NOT NULL,
	[AktivSAP] [bit] NOT NULL,
	[ExSAP] [bit] NOT NULL,
	[Berufsstart] [datetime] NULL,
	[Auszeit] [smallint] NOT NULL,
	[Aktiv14] [bit] NOT NULL,
	[Aktiv14Mail] [bit] NOT NULL,
	[SAPVertragsende] [datetime] NULL,
	[geaendert_am] [smalldatetime] NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[AGCH] [bit] NOT NULL,
	[Abweichende_Anschrift] [text] NULL,
	[Ort_PF] [varchar](100) NULL,
	[PlanSAP] [bit] NOT NULL,
	[LSA_zurueck] [bit] NOT NULL,
	[ZeugnisCheck] [bit] NOT NULL,
	[Studium] [varchar](100) NULL,
	[WunschRolle] [varchar](100) NULL,
	[Wunschrolle_ID] [uniqueidentifier] NULL,
	[Linkedin_ID] [varchar](50) NULL,
	[LI_Linked] [bit] NULL,
	[PVSUebernahmeOhneOK] [datetime] NULL,
	[QualinachweisCH] [bit] NULL,
	[TempATDok] [bit] NOT NULL,
	[IdentCheckAT] [bit] NOT NULL,
	[Webemail] [varchar](200) NULL,
	[XingQuality] [varchar](max) NULL,
	[XingUrl] [varchar](max) NULL,
	[Linkedin_URL] [varchar](max) NULL,
	[BirthName] [varchar](50) NULL,
	[Lat] [decimal](13, 9) NULL,
	[Lng] [decimal](13, 9) NULL,
	[MDMStatus] [smallint] NULL,
	[VATID] [varchar](100) NULL,
	[TAXID] [varchar](100) NULL,
	[DUNS] [varchar](100) NULL,
	[MDMID] [varchar](12) NULL,
	[MDMDeleted] [bit] NULL,
 CONSTRAINT [PK_Mitarbeiter] PRIMARY KEY NONCLUSTERED 
(
	[BP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mitarbeiter_jobboerse]    Script Date: 19.01.2022 12:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiter_jobboerse](
	[id] [uniqueidentifier] ROWGUIDCOL  NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[Jobboerse] [smallint] NOT NULL,
	[Jobboersennr] [varchar](50) NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[erstellt_am] [smalldatetime] NULL,
 CONSTRAINT [PK_Mitarbeiter_jobboerse] PRIMARY KEY NONCLUSTERED 
(
	[BP_ID] ASC,
	[Jobboerse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mitarbeiter_Kategorie_Check]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiter_Kategorie_Check](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[erstellt_am] [smalldatetime] NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[neu_angelegt] [bit] NOT NULL,
	[Bereich_Update] [bit] NOT NULL,
	[Bemerkung] [varchar](1000) NULL,
	[Bearbeitet] [bit] NOT NULL,
	[Bearbeitet_am] [smalldatetime] NULL,
	[Bearbeitet_von] [uniqueidentifier] NULL,
	[Zugriffsrolle] [uniqueidentifier] NULL,
	[Geloescht] [bit] NULL,
 CONSTRAINT [PK_Mitarbeiter_Kategorie_Check] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mitarbeiter_Profilangaben]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiter_Profilangaben](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[Sprache] [tinyint] NOT NULL,
	[Ausbildung] [varchar](255) NULL,
	[Weiterbildung] [varchar](255) NULL,
 CONSTRAINT [PK_Mitarbeiter_Profilangaben] PRIMARY KEY CLUSTERED 
(
	[BP_ID] ASC,
	[Sprache] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mitarbeiter_Region]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiter_Region](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Region_id] [uniqueidentifier] NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NULL,
	[zugeordnet_am] [smalldatetime] NULL,
 CONSTRAINT [PK_Mitarbeiter_Region] PRIMARY KEY NONCLUSTERED 
(
	[Region_id] ASC,
	[BP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MitarbeiterFaehigkeit]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MitarbeiterFaehigkeit](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[F_ID] [int] NOT NULL,
	[Auspraegung] [tinyint] NOT NULL,
	[SkillAnzahl] [smallint] NOT NULL,
	[AusgabeReihenfolge] [int] NULL,
	[Erstellungsdatum] [smalldatetime] NULL,
	[Aenderungsdatum] [smalldatetime] NULL,
	[Setzart] [tinyint] NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[geaendert_von] [uniqueidentifier] NULL,
 CONSTRAINT [PK_MitarbeiterFaehigkeit] PRIMARY KEY NONCLUSTERED 
(
	[F_ID] ASC,
	[BP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MitarbeiterGSV]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MitarbeiterGSV](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[CompanyID] [uniqueidentifier] NOT NULL,
	[GSV_Status] [smallint] NOT NULL,
	[ErstelltVon] [uniqueidentifier] NOT NULL,
	[ErstelltAm] [datetime] NOT NULL,
	[GeaendertVon] [uniqueidentifier] NULL,
	[GeaendertAm] [datetime] NULL,
 CONSTRAINT [PK_MitarbeiterGSV] PRIMARY KEY NONCLUSTERED 
(
	[GUID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mitarbeiterkontakt]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiterkontakt](
	[Kontakt_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[aufgenommen_durch] [varchar](5) NULL,
	[Leitsatz] [varchar](80) NULL,
	[Inhalt] [text] NULL,
	[Telefonat] [bit] NOT NULL,
	[ARB] [bit] NOT NULL,
	[Bitte_um_RR] [bit] NOT NULL,
	[RR_erledigt] [bit] NOT NULL,
	[NE] [bit] NOT NULL,
	[schickt_Profil] [bit] NOT NULL,
	[Sortierungstyp] [tinyint] NOT NULL,
	[mail_to] [varchar](255) NULL,
	[mail_cc] [varchar](255) NULL,
	[mail_bcc] [varchar](255) NULL,
	[mail_subject] [varchar](255) NULL,
	[mail_body] [text] NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NULL,
	[Datum] [datetime] NULL,
	[MFC_Kontakt] [bit] NULL,
	[XingChatId] [varchar](50) NULL,
	[Werkvertrag] [bit] NULL,
	[KundenInfo] [bit] NULL,
	[EMailId] [uniqueidentifier] NULL,
	[ExternalMessageId] [nvarchar](100) NULL,
	[FirstDayCall] [bit] NULL,
	[LastDayCall] [bit] NULL,
	[Recommendation] [bit] NULL,
	[SocialMedia] [bit] NULL,
	[Promote] [bit] NULL,
 CONSTRAINT [PK_Mitarbeiterkontakte] PRIMARY KEY NONCLUSTERED 
(
	[Kontakt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mitarbeiterkontaktdokument]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiterkontaktdokument](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kontakt_id] [uniqueidentifier] NOT NULL,
	[Dokument_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Mitarbeiterkontakdokumente] PRIMARY KEY NONCLUSTERED 
(
	[Kontakt_id] ASC,
	[Dokument_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MitarbeiterTermine]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MitarbeiterTermine](
	[terminID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Datum] [datetime] NULL,
	[Termin_abgesagt_von] [varchar](1) NULL,
	[Status] [tinyint] NULL,
	[kunde_id] [uniqueidentifier] NULL,
	[User_id] [uniqueidentifier] NULL,
	[BP_ID] [uniqueidentifier] NULL,
	[Prospect_ID] [uniqueidentifier] NULL,
	[Abschlussstatus] [smallint] NULL,
	[Bemerkung] [text] NULL,
 CONSTRAINT [PK_MitarbeiterTermine] PRIMARY KEY NONCLUSTERED 
(
	[terminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MitarbeiterTracking]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MitarbeiterTracking](
	[MitarbeiterTrackingID] [uniqueidentifier] NOT NULL,
	[MitarbeiterTrackingBP_ID] [uniqueidentifier] NOT NULL,
	[MitarbeiterTrackingTrackingID] [uniqueidentifier] NULL,
	[MitarbeiterTrackingTracking_domainGruppenID] [uniqueidentifier] NULL,
	[MitarbeiterTrackinggeaendert_am] [datetime] NULL,
	[MitarbeiterTrackinggeaendert_von] [uniqueidentifier] NULL,
	[MitarbeiterTrackinggeaendert_wie] [varchar](50) NULL,
	[MitarbeiterTrackinggeaendert] [bit] NOT NULL,
	[MitarbeiterTrackingErstellt_am] [datetime] NULL,
	[MitarbeiterTrackingRefererDomain] [varchar](150) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_MitarbeiterTracking] PRIMARY KEY CLUSTERED 
(
	[MitarbeiterTrackingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NG_RightsManagement]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NG_RightsManagement](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UI_ID] [uniqueidentifier] NOT NULL,
	[PB_Mitarbeiter] [uniqueidentifier] NOT NULL,
	[canRead] [bit] NOT NULL,
	[canWrite] [bit] NOT NULL,
	[Temp] [bit] NOT NULL,
	[Contracting] [bit] NOT NULL,
	[Perma] [bit] NOT NULL,
	[KamPrioPflege] [bit] NULL,
 CONSTRAINT [PK_NG_RightsManagement_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoticePeriod]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoticePeriod](
	[Id] [uniqueidentifier] NOT NULL,
	[BP] [uniqueidentifier] NOT NULL,
	[NoticePeriod_Id] [tinyint] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
 CONSTRAINT [PK_NoticePeriod_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olAddin_RibbonButtonStyle]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olAddin_RibbonButtonStyle](
	[GUID] [uniqueidentifier] NOT NULL,
	[control_guid] [uniqueidentifier] NOT NULL,
	[enabled] [bit] NULL,
	[imageFilename] [nvarchar](50) NULL,
	[label] [nvarchar](50) NULL,
	[screentip] [nvarchar](500) NULL,
	[size] [nvarchar](15) NULL,
	[supertip] [nvarchar](500) NULL,
	[ADGroup] [nvarchar](100) NULL,
 CONSTRAINT [PK_olAddin_RibbonButtonStyle] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olAddin_RibbonButtonVisibility]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olAddin_RibbonButtonVisibility](
	[control_id] [nvarchar](50) NULL,
	[group_id] [uniqueidentifier] NULL,
	[visibility] [bit] NULL,
	[GUID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_olAddin_RibbonButtonVisibility2] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olAddin_RibbonGroupStyle]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olAddin_RibbonGroupStyle](
	[GUID] [uniqueidentifier] NOT NULL,
	[group_guid] [uniqueidentifier] NOT NULL,
	[imageFilename] [nvarchar](50) NULL,
	[label] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olAddin_RibbonGroupVisibility]    Script Date: 19.01.2022 12:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olAddin_RibbonGroupVisibility](
	[group_id] [nvarchar](50) NULL,
	[visibility] [bit] NULL,
	[GUID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_olAddin_RibbonVisibility] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parameter]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parameter](
	[Beschreibung] [varchar](100) NULL,
	[Inhalt] [varchar](255) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Parameter] PRIMARY KEY CLUSTERED 
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Company]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Company](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Code] [varchar](20) NULL,
	[Name] [varchar](250) NULL,
	[SAPCode] [varchar](4) NULL,
	[Active] [bit] NOT NULL,
	[BasedIn] [varchar](5) NULL,
	[RegisteredOffice] [varchar](50) NULL,
	[Street] [varchar](50) NULL,
	[PostCode] [varchar](10) NULL,
 CONSTRAINT [PK_PB_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Company_Description]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Company_Description](
	[ID] [uniqueidentifier] NOT NULL,
	[Company_ID] [uniqueidentifier] NOT NULL,
	[Culture] [varchar](50) NULL,
	[Description] [varchar](250) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_PB_Company_Description] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Department]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Department](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Code] [varchar](20) NULL,
	[ParentID] [uniqueidentifier] NULL,
	[Active] [bit] NOT NULL,
	[SAPUser] [bit] NOT NULL,
 CONSTRAINT [PK_PB_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Department_Description]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Department_Description](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Department_ID] [uniqueidentifier] NULL,
	[Culture] [varchar](10) NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_PB_Department_Description] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Employee_ContactData]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Employee_ContactData](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Employee_ID] [uniqueidentifier] NULL,
	[ContactType_ID] [uniqueidentifier] NULL,
	[Location_ID] [uniqueidentifier] NULL,
	[ValueText] [varchar](500) NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
	[PrimaryContact] [bit] NOT NULL,
	[Note] [varchar](500) NULL,
 CONSTRAINT [PK_PB_Employee_Communication] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Employee_Position]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Employee_Position](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Employee_ID] [uniqueidentifier] NULL,
	[Position_ID] [uniqueidentifier] NULL,
	[Department_ID] [uniqueidentifier] NULL,
	[Division_ID] [uniqueidentifier] NULL,
	[HierarchyLevel_ID] [uniqueidentifier] NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
	[PrimaryPosition] [bit] NOT NULL,
 CONSTRAINT [PK_PB_Employee_Position] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Employee_SignatoryPower]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Employee_SignatoryPower](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Employee_ID] [uniqueidentifier] NOT NULL,
	[Company_ID] [uniqueidentifier] NOT NULL,
	[SignatoryPower_ID] [uniqueidentifier] NOT NULL,
	[ValidFrom] [smalldatetime] NULL,
	[ValidTo] [smalldatetime] NULL,
	[Comment] [varchar](1000) NULL,
	[SignatureText] [nvarchar](1000) NULL,
 CONSTRAINT [PB_PK_Employee_SignatoryPower] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_BusinessArea]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_BusinessArea](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Code] [varchar](20) NULL,
	[Description] [varchar](250) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PB_HT_BusinessArea] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_BusinessType]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_BusinessType](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Code] [varchar](20) NULL,
	[Description] [varchar](250) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PB_HT_BusinessType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_ContactType]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_ContactType](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Code] [varchar](20) NULL,
 CONSTRAINT [PK_PB_HT_CommunicationType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_ContactType_Description]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_ContactType_Description](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ContactType_ID] [uniqueidentifier] NULL,
	[Culture] [varchar](10) NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_PB_HT_CommunicationType_Description] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_Hierarchie]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_Hierarchie](
	[ID] [uniqueidentifier] NOT NULL,
	[Hierarchie_value] [int] NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_PB_HT_Hierarchie] PRIMARY KEY CLUSTERED 
(
	[Hierarchie_value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_HierarchyLevel]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_HierarchyLevel](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[LevelValue] [int] NULL,
	[Code] [varchar](20) NULL,
 CONSTRAINT [PK_PB_HT_HierarchyLevel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_PB_HT_HierarchyLevel] UNIQUE NONCLUSTERED 
(
	[LevelValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_HierarchyLevel_Description]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_HierarchyLevel_Description](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[HierarchyLevel_ID] [uniqueidentifier] NULL,
	[Culture] [varchar](10) NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_PB_HT_HierarchyLevel_Description] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_Land]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_Land](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Code] [varchar](10) NULL,
	[Name] [varchar](200) NULL,
	[Waehrung_ID] [uniqueidentifier] NULL,
	[ISO3166] [int] NULL,
	[Landesvorwahl] [varchar](10) NULL,
	[VorwahlAusland] [varchar](10) NULL,
 CONSTRAINT [PK_PB_HT_Land] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_Mitarbeiter_Status]    Script Date: 19.01.2022 12:19:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_Mitarbeiter_Status](
	[id] [uniqueidentifier] NOT NULL,
	[Bezeichnung] [varchar](100) NOT NULL,
	[WerT_int] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_PB_HT_Mitarbeiter_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_Position]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_Position](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Code] [varchar](20) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PB_HT_Position] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_Position_Description]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_Position_Description](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Position_ID] [uniqueidentifier] NULL,
	[Culture] [varchar](10) NULL,
	[Gender] [smallint] NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_PB_HT_Position_Description] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_Qualifikations_gruppen]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_Qualifikations_gruppen](
	[id] [uniqueidentifier] NOT NULL,
	[Bezeichnung] [varchar](50) NOT NULL,
	[Gesellschafts_id] [uniqueidentifier] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_PB_HT_Qualifikations_gruppen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_Qualifikationsstufen]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_Qualifikationsstufen](
	[id] [uniqueidentifier] NOT NULL,
	[bEZEICHNUNG] [varchar](50) NOT NULL,
	[Beschreibung] [text] NULL,
	[Gruppen_id] [uniqueidentifier] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_PB_HT_Qualifikationsstufen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_RelationType]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_RelationType](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Code] [varchar](20) NULL,
 CONSTRAINT [PK_PB_HT_RelationType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_RelationType_Description]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_RelationType_Description](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RelationType_ID] [uniqueidentifier] NULL,
	[Culture] [varchar](10) NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_PB_HT_RelationType_Description] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_SignatoryPower]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_SignatoryPower](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Code] [varchar](20) NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_PB_HT_SignatoryPower] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_Standort_Intern]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_Standort_Intern](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Bezeichnung] [varchar](250) NOT NULL,
	[PLZ] [varchar](10) NULL,
	[Vorwahl] [varchar](30) NULL,
	[Telefon_Zentrale] [varchar](20) NULL,
	[Strasse] [varchar](50) NULL,
	[Ort] [varchar](50) NULL,
	[Standort_ID] [uniqueidentifier] NULL,
	[Aktiv] [smallint] NULL,
	[VPN_Nr] [varchar](20) NULL,
 CONSTRAINT [PK_PB_HT_Standort_Intern] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_Standorte]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_Standorte](
	[ID] [uniqueidentifier] NOT NULL,
	[Standort_kurz] [varchar](10) NOT NULL,
	[Standort] [varchar](50) NOT NULL,
	[strasse] [varchar](50) NULL,
	[Ort] [varchar](50) NULL,
	[PLZ] [varchar](10) NULL,
	[Vorwahl] [varchar](30) NULL,
	[Telefon_zentrale] [varchar](25) NULL,
	[Fax_zentrale] [varchar](25) NULL,
	[internetadresse] [varchar](50) NULL,
	[emailadresse] [varchar](50) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Aktiv] [smallint] NULL,
	[LandID] [uniqueidentifier] NULL,
	[VPN_Nr] [varchar](20) NULL,
	[IP_Adressbereich] [varchar](50) NULL,
	[Vorwahl_Amt] [varchar](10) NULL,
	[Bundesland] [varchar](10) NULL,
 CONSTRAINT [PK_PB_HT_Standorte] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_Status_Description]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_Status_Description](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Status_ID] [uniqueidentifier] NULL,
	[Culture] [varchar](10) NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_PB_HT_Status_Description] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_HT_Waehrungen]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_HT_Waehrungen](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Bezeichnung] [varchar](50) NULL,
	[Bezeichnung_Landessprache] [varchar](50) NULL,
	[Kuerzel] [varchar](50) NULL,
 CONSTRAINT [PK_PB_HT_Waehrungen] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Mitarbeiter]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Mitarbeiter](
	[ID] [uniqueidentifier] NOT NULL,
	[Anrede] [varchar](10) NULL,
	[Geschlecht] [varchar](15) NULL,
	[Vorname] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[Position] [varchar](100) NULL,
	[Hierarchie] [int] NULL,
	[Gesellschafts_id] [uniqueidentifier] NULL,
	[Teamleiter_id] [uniqueidentifier] NULL,
	[Stellvertreter_id] [uniqueidentifier] NULL,
	[standort_id] [uniqueidentifier] NULL,
	[Standort_intern_id] [uniqueidentifier] NULL,
	[Mitarbeiter_status_id] [uniqueidentifier] NULL,
	[vorgesetzter_id] [uniqueidentifier] NULL,
	[kuerzel] [varchar](8) NULL,
	[Qualifikationsstufe_id] [uniqueidentifier] NULL,
	[Telefon] [varchar](25) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Geschlecht_Code] [smallint] NULL,
	[Titel] [varchar](20) NULL,
	[Titel2] [varchar](20) NULL,
	[SAP_NR] [varchar](50) NULL,
	[Hierarchie_ID] [uniqueidentifier] NULL,
	[Gesellschaft_ID] [uniqueidentifier] NULL,
	[TelefonVorwahl] [varchar](50) NULL,
	[Bereich_ID] [uniqueidentifier] NULL,
	[ShowStartWizard] [bit] NOT NULL,
	[Kostenstelle] [varchar](10) NULL,
	[Briefsignatur] [text] NULL,
	[EMailsignatur] [text] NULL,
	[Zeichnungsbefugnis] [varchar](50) NULL,
	[Mobiltelefon] [varchar](80) NULL,
	[istvertrieb] [bit] NULL,
	[Vcardposition] [nvarchar](255) NULL,
 CONSTRAINT [PK_PB_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Mitarbeiter_GeschaeftsTyp_SAP]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Mitarbeiter_GeschaeftsTyp_SAP](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PB_Mitarbeiter_ID] [uniqueidentifier] NOT NULL,
	[GeschaeftsTypSAP] [nvarchar](3) NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[ChangeDate] [datetime2](0) NULL,
	[validfrom] [date] NULL,
	[validto] [date] NULL,
	[Specialism] [nvarchar](50) NULL,
	[GeschaeftstypID] [smallint] NULL,
	[SpecialismID] [smallint] NULL,
 CONSTRAINT [PK_PB_Mitarbeiter_GeschaeftsTyp] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Mitarbeiter_Zugriffsrolle]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Mitarbeiter_Zugriffsrolle](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Rollen_id] [uniqueidentifier] NOT NULL,
	[User_id] [uniqueidentifier] NOT NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [datetime] NOT NULL,
	[inaktiv] [bit] NOT NULL,
 CONSTRAINT [PK_Benutzerrollen] PRIMARY KEY CLUSTERED 
(
	[Rollen_id] ASC,
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Mitarbeiterkontakt]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Mitarbeiterkontakt](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[User_id] [uniqueidentifier] NOT NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[datum] [datetime] NOT NULL,
	[Leitsatz] [varchar](100) NOT NULL,
	[Inhalt] [text] NULL,
	[Typ] [tinyint] NULL,
 CONSTRAINT [PK_PB_Mitarbeiterkontakte] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Position_BusinessArea]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Position_BusinessArea](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Position_ID] [uniqueidentifier] NULL,
	[BusinessArea_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PB_Position_BusinessArea] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Position_BusinessType]    Script Date: 19.01.2022 12:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Position_BusinessType](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Position_ID] [uniqueidentifier] NULL,
	[BusinessType_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PB_Position_BusinessType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Position_Company]    Script Date: 19.01.2022 12:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Position_Company](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Position_ID] [uniqueidentifier] NULL,
	[Company_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PB_Position_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Position_Location]    Script Date: 19.01.2022 12:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Position_Location](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Position_ID] [uniqueidentifier] NULL,
	[Location_ID] [uniqueidentifier] NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
	[PrimaryLocation] [bit] NOT NULL,
 CONSTRAINT [PK_PB_Position_Location] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PB_Position_Relation]    Script Date: 19.01.2022 12:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PB_Position_Relation](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RelationType_ID] [uniqueidentifier] NULL,
	[PositionFrom_ID] [uniqueidentifier] NULL,
	[PositionTo_ID] [uniqueidentifier] NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
 CONSTRAINT [PK_PB_Position_Relation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonDocument]    Script Date: 19.01.2022 12:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonDocument](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PersonType_ID] [smallint] NOT NULL,
	[Person_ID] [uniqueidentifier] NOT NULL,
	[Document_ID] [uniqueidentifier] NOT NULL,
	[Validity] [smalldatetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [smalldatetime] NOT NULL,
	[ChangedBy] [uniqueidentifier] NULL,
	[ChangedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_dbo_PersonDocument] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonRoleCompany]    Script Date: 19.01.2022 12:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonRoleCompany](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PersonRoleMap_GUID] [uniqueidentifier] NOT NULL,
	[Companyname] [varchar](255) NOT NULL,
	[PersonGUID] [uniqueidentifier] NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PersonRoleCompany] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonRoleMap]    Script Date: 19.01.2022 12:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonRoleMap](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Person_GUID] [uniqueidentifier] NOT NULL,
	[PersonType_ID] [smallint] NOT NULL,
	[RoleType_GUID] [uniqueidentifier] NOT NULL,
	[Value] [smallint] NOT NULL,
	[Actuality] [date] NULL,
	[RoleAppliedType_ID] [smallint] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Changer] [uniqueidentifier] NULL,
	[ChangingDate] [datetime] NULL,
 CONSTRAINT [PK_PersonRoleMap] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonSkillMap]    Script Date: 19.01.2022 12:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonSkillMap](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Person_GUID] [uniqueidentifier] NOT NULL,
	[PersonType_ID] [smallint] NOT NULL,
	[SkillType_GUID] [uniqueidentifier] NOT NULL,
	[Value] [smallint] NOT NULL,
	[Actuality] [date] NULL,
	[SkillAppliedType_ID] [smallint] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Changer] [uniqueidentifier] NULL,
	[ChangingDate] [datetime] NULL,
	[IsNationWide] [bit] NULL,
 CONSTRAINT [PK_PersonSkillMap] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlacementStatus_Matrix]    Script Date: 19.01.2022 12:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlacementStatus_Matrix](
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Status_ID] [int] NOT NULL,
	[darf_editieren] [bit] NOT NULL,
	[darf_erstellen] [bit] NOT NULL,
 CONSTRAINT [PK_PlacementStatus_Matrix] PRIMARY KEY CLUSTERED 
(
	[Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlacementWizard_Excel_Firma_Zuordnung]    Script Date: 19.01.2022 12:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlacementWizard_Excel_Firma_Zuordnung](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Firma_ID] [uniqueidentifier] NULL,
	[Firmenname] [varchar](150) NULL,
	[Vertragsmail_ID] [uniqueidentifier] NULL,
	[Excel_Firmenname] [varchar](50) NULL,
	[ExcelDokumenten_Kategorie] [int] NULL,
	[Erstellt_Von] [uniqueidentifier] NOT NULL,
	[Erstellt_Am] [datetime] NOT NULL,
 CONSTRAINT [PK_PlacementWizard_Excel_Firma_Zuordnung_1] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlacementWizard_Matrix]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlacementWizard_Matrix](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Vertragsmail_ID] [uniqueidentifier] NOT NULL,
	[WizardPage_GUID] [uniqueidentifier] NOT NULL,
	[WizardPage_Position] [tinyint] NOT NULL,
	[WizardPage_DynRuleset] [varchar](255) NULL,
 CONSTRAINT [PK_PlacementWizard_Matrix] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlacementWizard_PermProvision]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlacementWizard_PermProvision](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[currency] [uniqueidentifier] NOT NULL,
	[provision] [numeric](15, 2) NULL,
 CONSTRAINT [PK_PlacementWizard_PermProvision] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planungskunde]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planungskunde](
	[Planungskunde_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Planungsname] [varchar](255) NULL,
	[PP_NR] [int] NULL,
 CONSTRAINT [PK_Planungskunde] PRIMARY KEY CLUSTERED 
(
	[Planungskunde_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prospect]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prospect](
	[Prospect_Nr] [int] NOT NULL,
	[Datum] [smalldatetime] NULL,
	[Ansprechpartner] [varchar](50) NULL,
	[Projektbeginn] [varchar](50) NULL,
	[Projektdauer] [varchar](50) NULL,
	[Status] [smallint] NOT NULL,
	[LostBeschreibung] [varchar](70) NULL,
	[Dringlichkeit] [tinyint] NULL,
	[in_aus_InternetDB] [bit] NOT NULL,
	[ku_id] [uniqueidentifier] NULL,
	[Preis] [int] NULL,
	[Erstellungsdatum] [smalldatetime] NULL,
	[gesuchte_consultants] [smallint] NOT NULL,
	[Prospect_start] [datetime] NULL,
	[USER_ID] [uniqueidentifier] NULL,
	[Prospect_ID] [uniqueidentifier] NOT NULL,
	[Prospect_standort] [tinyint] NOT NULL,
	[Zugriffsrolle] [uniqueidentifier] NOT NULL,
	[Quali_check] [bit] NOT NULL,
	[besetzungswahrscheinlichkeit] [tinyint] NULL,
	[Kategorisierung] [tinyint] NULL,
	[Direktbesetzungsauftrag] [tinyint] NULL,
	[Feedbackdatum] [smalldatetime] NULL,
	[MCR] [uniqueidentifier] NULL,
	[Fee] [money] NULL,
	[Betreff] [varchar](100) NULL,
	[Inhalt] [text] NULL,
	[Stundensatz_waehrung] [varchar](5) NULL,
	[Preis_Waehrung] [varchar](5) NULL,
	[KAMMAIL] [bit] NULL,
	[Mainskill] [uniqueidentifier] NULL,
	[QS_check] [bit] NOT NULL,
	[Planungskunde_ID] [uniqueidentifier] NULL,
	[mainskillchangedate] [smalldatetime] NULL,
	[BE_von] [smallint] NULL,
	[BE_bis] [smallint] NULL,
	[geaendert_am] [smalldatetime] NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[Sprach_id] [tinyint] NULL,
	[ist_msp] [bit] NOT NULL,
	[QS_Bemerkung] [varchar](100) NULL,
	[Aufgabenbeschreibung] [text] NULL,
	[Bemerkung] [varchar](255) NULL,
	[Skills] [varchar](512) NULL,
	[Branche] [varchar](200) NULL,
	[Aufgabe] [varchar](255) NULL,
	[Einsatzort] [varchar](50) NULL,
	[Video_ID] [uniqueidentifier] NULL,
	[Keywords] [nvarchar](max) NULL,
	[PB_Company] [uniqueidentifier] NULL,
	[Firmenstandort] [uniqueidentifier] NULL,
	[Twitter] [bit] NOT NULL,
	[ist_executive] [bit] NOT NULL,
	[Firmenbranche] [smallint] NULL,
	[Crossselling_KAM] [uniqueidentifier] NULL,
	[AblehnungsStatus] [uniqueidentifier] NULL,
	[GeschaeftsTyp] [smallint] NOT NULL,
	[GeschaeftsBereich] [smallint] NOT NULL,
	[ist_EqualPay] [bit] NOT NULL,
	[Entgeltgruppe] [uniqueidentifier] NULL,
	[CoMerkmal] [uniqueidentifier] NULL,
	[ForeignJobID] [varchar](20) NULL,
	[Absolvent] [bit] NOT NULL,
	[Retainer] [bit] NOT NULL,
	[Perm_BasisPlacementID] [uniqueidentifier] NULL,
	[VertragsmailBereichID] [uniqueidentifier] NULL,
	[Strahlenschutz] [bit] NULL,
	[meldepflichtig] [bit] NULL,
	[gesperrt_bis] [datetime] NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ProspectSource] [tinyint] NULL,
	[LocationCountry] [uniqueidentifier] NULL,
	[Lat] [decimal](13, 9) NULL,
	[Lng] [decimal](13, 9) NULL,
	[PostalCode] [varchar](50) NULL,
	[isHTSS] [bit] NULL,
	[VideoURL] [varchar](1024) NULL,
 CONSTRAINT [PK_Prospects] PRIMARY KEY NONCLUSTERED 
(
	[Prospect_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prospect_Region]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prospect_Region](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Region_id] [uniqueidentifier] NOT NULL,
	[Prospect_id] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NULL,
	[zugeordnet_am] [smalldatetime] NULL,
 CONSTRAINT [PK_Prospect_Region] PRIMARY KEY NONCLUSTERED 
(
	[Region_id] ASC,
	[Prospect_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prospect_Video]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prospect_Video](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Beschreibung] [nchar](50) NULL,
	[Link] [nvarchar](max) NULL,
 CONSTRAINT [PK_Prospect_Video] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectArbeitssicherheit]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectArbeitssicherheit](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Prospect_ID] [uniqueidentifier] NOT NULL,
	[PSA] [varchar](max) NULL,
	[ArbMedVU] [varchar](max) NULL,
	[Sonstiges] [varchar](max) NULL,
	[Erstellt_am] [datetime] NOT NULL,
	[Erstellt_von] [uniqueidentifier] NOT NULL,
	[Geaendert_am] [datetime] NULL,
	[Geaendert_von] [uniqueidentifier] NULL,
	[EDV_Arbeitsplatz] [bit] NOT NULL,
	[Arbeitsplatz] [varchar](max) NULL,
 CONSTRAINT [PK_ProspectArbeitssicherheit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectAUEG]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectAUEG](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Prospect_ID] [uniqueidentifier] NOT NULL,
	[HUED] [smallint] NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
	[QS_state] [tinyint] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Changer] [uniqueidentifier] NULL,
	[ChangingDate] [datetime] NULL,
	[Comment] [varchar](300) NULL,
 CONSTRAINT [PK_ProspectAUEG] PRIMARY KEY NONCLUSTERED 
(
	[ID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectBeschreibung]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectBeschreibung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Prospect_ID] [uniqueidentifier] NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL,
	[Kundenbeschreibung] [text] NULL,
	[Position] [varchar](255) NULL,
	[Anstellungsart] [varchar](255) NULL,
	[Einsatzort] [varchar](255) NULL,
	[Aufgabe] [text] NULL,
	[Qualifikation] [text] NULL,
	[Bemerkung] [varchar](255) NULL,
	[erstellt_am] [smalldatetime] NOT NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[geaendert_am] [smalldatetime] NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[IhreVorteile] [varchar](max) NULL,
	[Gehaltsinformation] [varchar](max) NULL,
	[ProspectAP] [uniqueidentifier] NULL,
	[mitTelefonnummer] [bit] NULL,
	[meinArbeitgeber] [varchar](max) NULL,
	[ueberHayTexte] [nvarchar](max) NULL,
	[ReadytoPublish] [bit] NULL,
	[HouseNumber] [varchar](10) NULL,
	[OccupationCode] [varchar](16) NULL,
 CONSTRAINT [PK_ProspectBeschreibung] PRIMARY KEY CLUSTERED 
(
	[Prospect_ID] ASC,
	[Sprach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectCCMailRecipients]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectCCMailRecipients](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Prospect] [uniqueidentifier] NOT NULL,
	[Mitarbeiter] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ProspectCCMailRecipients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectEqualPay_Info]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectEqualPay_Info](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Prospect_ID] [uniqueidentifier] NOT NULL,
	[EP_KundenInfo] [bit] NOT NULL,
	[EP_Vergleichsgehalt_Stunde] [money] NULL,
	[EP_Vergleichsgehalt_Waehrung] [varchar](5) NULL,
	[Erstellt_von] [uniqueidentifier] NULL,
	[Erstellt_am] [datetime] NOT NULL,
	[Geaendert_von] [uniqueidentifier] NULL,
	[Geaendert_am] [datetime] NULL,
	[EP_Stundenlohn] [money] NULL,
	[EP_WV_Stundenlohn] [datetime] NULL,
	[EP_QS_Status] [tinyint] NULL,
	[Note] [varchar](1024) NULL,
 CONSTRAINT [PK_ProspectEqualPay_Info] PRIMARY KEY CLUSTERED 
(
	[Prospect_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectFaehigkeit]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectFaehigkeit](
	[F_ID] [int] NOT NULL,
	[Auspraegung] [tinyint] NULL,
	[Skillanzahl] [smallint] NULL,
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Erstelldatum] [smalldatetime] NULL,
	[Aenderungsdatum] [smalldatetime] NULL,
	[Prospect_id] [uniqueidentifier] NOT NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[geaendert_von] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Prospect_Skills] PRIMARY KEY NONCLUSTERED 
(
	[F_ID] ASC,
	[Prospect_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prospectkontakt]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prospectkontakt](
	[kontakt_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Leitsatz] [varchar](255) NOT NULL,
	[Inhalt] [text] NULL,
	[Sortierungstyp] [tinyint] NOT NULL,
	[Kunde_id] [uniqueidentifier] NULL,
	[old_ma_status] [smallint] NULL,
	[new_ma_status] [smallint] NULL,
	[vorherige_kunden_id] [uniqueidentifier] NULL,
	[User_id] [uniqueidentifier] NULL,
	[BP_ID] [uniqueidentifier] NULL,
	[Prospect_id] [uniqueidentifier] NOT NULL,
	[alter_prospectstatus] [smallint] NULL,
	[neuer_prospectstaus] [smallint] NULL,
	[Datum] [datetime] NULL,
	[Termindatum] [smalldatetime] NULL,
	[Absagegrund_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Prospectkontakte] PRIMARY KEY NONCLUSTERED 
(
	[kontakt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectKontaktDokument]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectKontaktDokument](
	[Id] [uniqueidentifier] NOT NULL,
	[DokumentId] [uniqueidentifier] NOT NULL,
	[BpId] [uniqueidentifier] NOT NULL,
	[ProspectId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ProspectKontaktDokument_DokumentId_BpId_ProspectId] PRIMARY KEY NONCLUSTERED 
(
	[DokumentId] ASC,
	[BpId] ASC,
	[ProspectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectMitarbeiter]    Script Date: 19.01.2022 12:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectMitarbeiter](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[kontaktiert] [varchar](255) NULL,
	[MA_Status] [tinyint] NOT NULL,
	[Projektstart] [smalldatetime] NULL,
	[Projektende] [smalldatetime] NULL,
	[Faktura_TEilprojekt_id] [uniqueidentifier] NULL,
	[faktura_projektnummer] [varchar](20) NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[Prospect_id] [uniqueidentifier] NOT NULL,
	[Termindatum] [smalldatetime] NULL,
	[Termin_User] [uniqueidentifier] NULL,
	[Besetzungswahrscheinlichkeit] [tinyint] NULL,
	[DS_erstellt_von] [uniqueidentifier] NULL,
	[DS_erstellt_am] [smalldatetime] NULL,
	[Bemerkung] [text] NULL,
	[geaendert_am] [smalldatetime] NOT NULL,
	[geaendert_von] [uniqueidentifier] NULL,
	[Fee_Waehrung] [varchar](5) NULL,
	[MCR] [uniqueidentifier] NULL,
	[Fee] [decimal](18, 2) NULL,
	[TemplateMerkmal] [uniqueidentifier] NULL,
	[Absagegrund_ID] [uniqueidentifier] NULL,
	[Sammelmail_Datum] [smalldatetime] NULL,
	[Sammelmail_User] [uniqueidentifier] NULL,
	[VB_Kunde] [smallint] NULL,
	[AppointmentId] [varchar](250) NULL,
	[CAS] [uniqueidentifier] NULL,
	[Proceed] [tinyint] NULL,
	[ProceedReason] [tinyint] NULL,
	[PSO_OU_ID] [uniqueidentifier] NULL,
	[PSO_AP] [uniqueidentifier] NULL,
	[LegalEntity] [uniqueidentifier] NULL,
	[LegalEntityContactId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ProspectMitarbeiter] PRIMARY KEY CLUSTERED 
(
	[BP_ID] ASC,
	[Prospect_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectMitarbeiterKalkulation]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectMitarbeiterKalkulation](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BRTV_ID] [smallint] NOT NULL,
	[Prospect_ID] [uniqueidentifier] NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[Vergleichsgehalt_Stunde] [money] NULL,
	[Vergleichsgehalt_Jahr] [money] NULL,
	[Währung] [varchar](5) NULL,
	[Wochenarbeitszeit] [varchar](5) NULL,
	[Entgelttabelle_ID] [smallint] NULL,
	[Entgeltgruppe_ID] [uniqueidentifier] NULL,
	[ATZ1] [money] NULL,
	[ATZ2] [money] NULL,
	[Bemerkung] [varchar](512) NULL,
	[Erstellt_von] [uniqueidentifier] NOT NULL,
	[Erstellt_am] [datetime] NOT NULL,
	[Geaendert_von] [uniqueidentifier] NULL,
	[Geaendert_am] [datetime] NULL,
	[Marge] [decimal](5, 2) NULL,
	[VK] [money] NULL,
	[Entgeltgruppe_Wert] [money] NULL,
	[Gesamt_EK] [money] NULL,
	[Gesamtgehalt_MAV] [money] NULL,
	[Abschlagszahlunghoehe] [money] NULL,
	[istBestandsTS] [bit] NOT NULL,
	[StartKundenbetrieb] [datetime] NULL,
	[Uebernahme] [bit] NOT NULL,
	[StartHays] [datetime] NULL,
	[HUeDEnde] [datetime] NULL,
	[EqualPayStart] [datetime] NULL,
	[EndeHays] [datetime] NULL,
	[EP_Stundenlohn] [money] NULL,
	[EP_WV_Stundenlohn] [datetime] NULL,
	[HUeD] [smallint] NULL,
	[EP_Monate] [smallint] NULL,
	[EqualPayStufe6] [datetime] NULL,
	[Kalendermodell] [tinyint] NULL,
	[Vorbeschaeftigung] [bit] NULL,
 CONSTRAINT [PK_Prospect_EqualPay] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectPlacement]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectPlacement](
	[Placement_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Prospect] [uniqueidentifier] NOT NULL,
	[Kunde] [uniqueidentifier] NULL,
	[Firmenstandort] [uniqueidentifier] NULL,
	[BP] [uniqueidentifier] NULL,
	[Vertragsmail] [uniqueidentifier] NOT NULL,
	[PSP] [varchar](8) NULL,
	[VertragsXML] [xml] NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [smalldatetime] NOT NULL,
	[erledigt_von] [uniqueidentifier] NULL,
	[erledigt_am] [smalldatetime] NULL,
	[PSP_Nr] [varchar](11) NULL,
	[in_Bearbeitung] [bit] NOT NULL,
	[erledigt] [bit] NOT NULL,
	[BP_Vertragsnummer] [varchar](30) NULL,
	[KD_Vertragsnummer] [varchar](30) NULL,
	[Bemerkung] [varchar](255) NULL,
	[InitPlacement_ID] [uniqueidentifier] NULL,
	[SAP_uebergeben] [bit] NOT NULL,
	[HighPrio] [bit] NOT NULL,
	[Clarification] [bit] NOT NULL,
	[ExtPlacement_ID] [uniqueidentifier] NULL,
	[isMassExtension] [bit] NOT NULL,
	[AnzahlDokumente] [smallint] NULL,
	[PlacementStatus] [smallint] NULL,
	[letzter_Statuswechsel] [smalldatetime] NULL,
	[Vertragsnummer] [varchar](30) NULL,
	[AgreementID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ProspectPlacement] PRIMARY KEY CLUSTERED 
(
	[Placement_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectPlacementDokument]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectPlacementDokument](
	[ProspectPlacementDokument_ID] [uniqueidentifier] NOT NULL,
	[Placement_ID] [uniqueidentifier] NOT NULL,
	[Dokument_ID] [uniqueidentifier] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ProspectPlacementDokument] PRIMARY KEY CLUSTERED 
(
	[ProspectPlacementDokument_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectRoleMap]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectRoleMap](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Prospect_GUID] [uniqueidentifier] NOT NULL,
	[RoleType_GUID] [uniqueidentifier] NOT NULL,
	[RoleAppliedType_ID] [smallint] NOT NULL,
	[MainRole] [bit] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Changer] [uniqueidentifier] NULL,
	[ChangingDate] [datetime] NULL,
 CONSTRAINT [PK_ProspectRoleMap] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProspectSkillMap]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectSkillMap](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Prospect_GUID] [uniqueidentifier] NOT NULL,
	[SkillType_GUID] [uniqueidentifier] NOT NULL,
	[Value] [smallint] NOT NULL,
	[Actuality] [date] NULL,
	[SkillAppliedType_ID] [smallint] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Changer] [uniqueidentifier] NULL,
	[ChangingDate] [datetime] NULL,
 CONSTRAINT [PK_ProspectSkillMap] PRIMARY KEY NONCLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PSO]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSO](
	[PSO_Name] [varchar](255) NULL,
	[Ansprechpartner] [varchar](25) NULL,
	[Position] [varchar](25) NULL,
	[Strasse] [varchar](50) NULL,
	[PLZ] [varchar](10) NULL,
	[Ort] [varchar](50) NULL,
	[Tel] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Bemerkung] [varchar](4000) NULL,
	[PCP] [smallint] NOT NULL,
	[PSO_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[erstellt_am] [smalldatetime] NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[Land] [uniqueidentifier] NULL,
	[Homepage] [varchar](500) NULL,
	[Kreditorennummer] [varchar](20) NULL,
	[AktivSAP] [bit] NOT NULL,
	[ExSAP] [bit] NOT NULL,
	[FirmenStandort_ID] [uniqueidentifier] NULL,
	[PlanSAP] [bit] NOT NULL,
	[Schwerpunkt] [varchar](250) NULL,
	[LMDatum] [datetime] NULL,
	[LSA_zurueck] [bit] NOT NULL,
	[Festangestellte] [varchar](1000) NULL,
	[Freiberufler] [varchar](1000) NULL,
	[Kunden] [varchar](1000) NULL,
	[IDCheck] [bit] NULL,
	[SupplierRatingDate] [date] NULL,
	[CustomerRestrictions] [nvarchar](255) NULL,
	[RemoteWork] [bit] NULL,
	[Lat] [decimal](13, 9) NULL,
	[Lng] [decimal](13, 9) NULL,
	[MDMStatus] [smallint] NULL,
	[VATID] [varchar](100) NULL,
	[TAXID] [varchar](100) NULL,
	[DUNS] [varchar](100) NULL,
	[MDMID] [varchar](12) NULL,
	[MDMDeleted] [bit] NULL,
 CONSTRAINT [PK_PSO] PRIMARY KEY CLUSTERED 
(
	[PSO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PSO_Kategorie_Check]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSO_Kategorie_Check](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PSO_ID] [uniqueidentifier] NOT NULL,
	[Zugriffsrolle] [uniqueidentifier] NOT NULL,
	[Bemerkung] [varchar](1000) NULL,
	[neu_angelegt] [bit] NOT NULL,
	[erstellt_am] [smalldatetime] NULL,
	[erstellt_von] [uniqueidentifier] NULL,
	[bearbeitet_am] [smalldatetime] NULL,
	[bearbeitet_von] [uniqueidentifier] NULL,
	[bearbeitet] [bit] NULL,
	[geloescht] [bit] NULL,
 CONSTRAINT [PK_dbo_PSO_Kategorie_Check] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PSO_Rechtebereiche]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSO_Rechtebereiche](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PSO_id] [uniqueidentifier] NOT NULL,
	[Zugriffsrolle] [uniqueidentifier] NOT NULL,
	[zugeordnet_von] [uniqueidentifier] NOT NULL,
	[zugeordnet_am] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_PSO_Rechtebereiche] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PSO_Region]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSO_Region](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Region_id] [uniqueidentifier] NOT NULL,
	[PSO_ID] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NULL,
	[zugeordnet_am] [smalldatetime] NULL,
 CONSTRAINT [PK_PSO_Region] PRIMARY KEY NONCLUSTERED 
(
	[Region_id] ASC,
	[PSO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PSOGSV]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSOGSV](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PSO_ID] [uniqueidentifier] NOT NULL,
	[CompanyID] [uniqueidentifier] NOT NULL,
	[GSV_Status] [smallint] NOT NULL,
	[ErstelltVon] [uniqueidentifier] NOT NULL,
	[ErstelltAm] [datetime] NOT NULL,
	[GeaendertVon] [uniqueidentifier] NULL,
	[GeaendertAm] [datetime] NULL,
 CONSTRAINT [PK_PSOGSV] PRIMARY KEY NONCLUSTERED 
(
	[GUID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PSOKontakt]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSOKontakt](
	[Kontakt_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Leitsatz] [varchar](100) NOT NULL,
	[inhalt] [text] NULL,
	[sortierungstyp] [tinyint] NOT NULL,
	[PSO_ID] [uniqueidentifier] NOT NULL,
	[User_id] [uniqueidentifier] NULL,
	[Datum] [datetime] NULL,
	[mail_to] [varchar](255) NULL,
	[mail_cc] [varchar](255) NULL,
	[mail_bcc] [varchar](255) NULL,
	[mail_subject] [varchar](255) NULL,
	[mail_body] [text] NULL,
 CONSTRAINT [PK_PSOkontakte] PRIMARY KEY NONCLUSTERED 
(
	[Kontakt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PSOKontaktdokument]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSOKontaktdokument](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kontakt_id] [uniqueidentifier] NOT NULL,
	[Dokument_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PSOKontakdokumente] PRIMARY KEY NONCLUSTERED 
(
	[Kontakt_id] ASC,
	[Dokument_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PVS_Activity_Log]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PVS_Activity_Log](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[user_id] [uniqueidentifier] NOT NULL,
	[Startzeit] [smalldatetime] NOT NULL,
	[Endzeit] [smalldatetime] NULL,
	[Bemerkung] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PVS_Activity_Log] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_Auth_Action]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_Auth_Action](
	[GuId] [uniqueidentifier] NOT NULL,
	[ActionName] [varchar](100) NOT NULL,
	[Attribute] [uniqueidentifier] NOT NULL,
	[IsDomainArea] [bit] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[DomainArea] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pvs4_Auth_Action_GuId] PRIMARY KEY CLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_Auth_ActionControlMap]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_Auth_ActionControlMap](
	[GuId] [uniqueidentifier] NOT NULL,
	[ActionId] [uniqueidentifier] NOT NULL,
	[ControlId] [uniqueidentifier] NOT NULL,
	[ControlAccessType] [tinyint] NOT NULL,
 CONSTRAINT [PK_Pvs4_Auth_ActionControlMap_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_Auth_AdPvs4RoleMap]    Script Date: 19.01.2022 12:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_Auth_AdPvs4RoleMap](
	[GuId] [uniqueidentifier] NOT NULL,
	[AdRole] [uniqueidentifier] NOT NULL,
	[PvsRole] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Pvs4_Auth_AdPvs4RoleMap_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_Auth_AdRole]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_Auth_AdRole](
	[GuId] [uniqueidentifier] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Pvs4_Auth_AdRole_GuId] PRIMARY KEY CLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_Auth_ControlAccessType]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_Auth_ControlAccessType](
	[AccessTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[AccessType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pvs4_Auth_ControlAccessType_AccessTypeId] PRIMARY KEY CLUSTERED 
(
	[AccessTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_Auth_Controls]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_Auth_Controls](
	[GuId] [uniqueidentifier] NOT NULL,
	[ControlName] [varchar](100) NOT NULL,
	[Site] [varchar](100) NULL,
	[SiteSection] [varchar](100) NULL,
 CONSTRAINT [PK_Pvs4_Auth_Controls_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_Auth_Exception]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_Auth_Exception](
	[GuId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Action] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Pvs4_Auth_Exception_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_Auth_ObjectAttributes]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_Auth_ObjectAttributes](
	[GuId] [uniqueidentifier] NOT NULL,
	[Attribute] [varchar](50) NOT NULL,
	[EntityType] [tinyint] NULL,
 CONSTRAINT [PK_Pvs4_Auth_ObjectAttributes_GuId] PRIMARY KEY CLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_Auth_PvsRole]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_Auth_PvsRole](
	[GuId] [uniqueidentifier] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Pvs4_Auth_PvsRole_GuId] PRIMARY KEY CLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_Auth_RoleActionMap]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_Auth_RoleActionMap](
	[GuId] [uniqueidentifier] NOT NULL,
	[PvsRole] [uniqueidentifier] NOT NULL,
	[Action] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Pvs4_Auth_RoleActionMap_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_ConsentCriminalRecord]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_ConsentCriminalRecord](
	[GuidID] [uniqueidentifier] NOT NULL,
	[EntityId] [uniqueidentifier] NOT NULL,
	[ConsentStatus] [tinyint] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
 CONSTRAINT [PK_Pvs4_ConsentCriminalRecord_GuidId] PRIMARY KEY CLUSTERED 
(
	[GuidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_CrefoArchive]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_CrefoArchive](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[DocumentId] [uniqueidentifier] NULL,
	[CrefoInfo] [int] NULL,
	[CrefoText] [nvarchar](1024) NULL,
	[CreationDate] [datetime2](3) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdateDate] [datetime2](3) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[CrefoCreationDate] [datetime2](0) NULL,
	[Score] [tinyint] NULL,
	[PaymentIndex] [tinyint] NULL,
	[CreditRecommendation] [int] NULL,
 CONSTRAINT [PK_Pvs4_CrefoArchive_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_CriminalRecord]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_CriminalRecord](
	[GuidID] [uniqueidentifier] NOT NULL,
	[BPId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
	[CheckedDate] [datetime2](7) NOT NULL,
	[ContactId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Pvs4_CriminalRecord_GuidId] PRIMARY KEY CLUSTERED 
(
	[GuidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_CSQ_Answer]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_CSQ_Answer](
	[GuId] [uniqueidentifier] NOT NULL,
	[QuestionGuId] [uniqueidentifier] NOT NULL,
	[Answer] [bit] NOT NULL,
	[ProspectId] [uniqueidentifier] NOT NULL,
	[BpId] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Questionnaire] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Pvs4_CSQ_Answer_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_CSQ_AnswerAdditional]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_CSQ_AnswerAdditional](
	[GuidId] [uniqueidentifier] NOT NULL,
	[CSQ_Answer_GuId] [uniqueidentifier] NOT NULL,
	[Answer] [nvarchar](2000) NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pvs4_CSQ_AnswerAdditional_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_CSQ_Exceptions]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_CSQ_Exceptions](
	[GuidId] [uniqueidentifier] NOT NULL,
	[Q1] [smallint] NULL,
	[Q1_Value] [bit] NULL,
	[Q2] [smallint] NULL,
	[Q2_Value] [bit] NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_exceptions_GuiID] PRIMARY KEY CLUSTERED 
(
	[GuidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_CSQ_MappingAdditionalQuestion]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_CSQ_MappingAdditionalQuestion](
	[GuidId] [uniqueidentifier] NOT NULL,
	[PB_Company] [varchar](150) NULL,
	[Freelancer] [tinyint] NULL,
	[PSO_BP] [tinyint] NULL,
	[HTSG] [tinyint] NULL,
	[HPS] [tinyint] NULL,
	[ContractType] [varchar](5) NULL,
	[SpecificQuestion] [smallint] NULL,
	[AdditionalQuestion] [smallint] NULL,
	[MSP] [bit] NULL,
	[PB_CompanyId] [uniqueidentifier] NULL,
	[PsoSupplier] [bit] NULL,
 CONSTRAINT [PK_Pvs4_CSQ_MappingAdditionalQuestion_GuidId] PRIMARY KEY NONCLUSTERED 
(
	[GuidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_CSQ_MappingBasicQuestion]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_CSQ_MappingBasicQuestion](
	[GuidId] [uniqueidentifier] NOT NULL,
	[PB_Company] [varchar](150) NULL,
	[PB_CompanyId] [uniqueidentifier] NULL,
	[Freelancer] [bit] NULL,
	[PSO_BP_CC] [bit] NULL,
	[HTSG] [bit] NULL,
	[HPS] [bit] NULL,
	[ContractType] [tinyint] NULL,
	[MSP] [bit] NULL,
	[PsoSupplier] [bit] NULL,
	[QuestionNo] [smallint] NULL,
	[ProjectType] [varchar](50) NULL,
	[CreationDate] [datetime2](3) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](3) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[InGermany] [bit] NULL,
 CONSTRAINT [PK_Pvs4_CSQ_MappingBasicQuestion_GuidId] PRIMARY KEY NONCLUSTERED 
(
	[GuidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_CSQ_Question]    Script Date: 19.01.2022 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_CSQ_Question](
	[GuId] [uniqueidentifier] NOT NULL,
	[QuestionNo] [smallint] NOT NULL,
	[QuestionInfo] [tinyint] NULL,
	[QuestionType] [tinyint] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pvs4_CSQ_Question_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_CSQ_Questionnaire]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_CSQ_Questionnaire](
	[GuId] [uniqueidentifier] NOT NULL,
	[QA_Option] [xml] NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pvs4_CSQ_Questionnaire_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_CSQ_ServiceDescription]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_CSQ_ServiceDescription](
	[GuId] [uniqueidentifier] NOT NULL,
	[ProspectId] [uniqueidentifier] NOT NULL,
	[DescriptionText] [nvarchar](max) NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pvs4_CSQ_ServiceDescription_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_EntityWorkHistory]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_EntityWorkHistory](
	[GuId] [uniqueidentifier] NOT NULL,
	[EntityId] [uniqueidentifier] NOT NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[CompanyName] [nvarchar](500) NULL,
	[Position] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[JobLocation] [nvarchar](500) NULL,
	[UsedSkills] [nvarchar](max) NULL,
 CONSTRAINT [PK_Pvs4_EntityWorkHistory_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_FeatureToggle]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_FeatureToggle](
	[Id] [uniqueidentifier] NOT NULL,
	[JsonContent] [nvarchar](max) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](3) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateTime] [datetime2](3) NULL,
 CONSTRAINT [PKPvs4_Pvs4_FeatureToggle] PRIMARY KEY CLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_HistoryLocation]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_HistoryLocation](
	[Id] [uniqueidentifier] NOT NULL,
	[EntityIdGuid] [uniqueidentifier] NULL,
	[ColumnName] [varchar](50) NULL,
	[ColumnValue] [varchar](1024) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](3) NULL,
 CONSTRAINT [PK_HistoryLocation] PRIMARY KEY CLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_HistoryProspectEqualPay_Info]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_HistoryProspectEqualPay_Info](
	[Id] [uniqueidentifier] NOT NULL,
	[EntityIdGuid] [uniqueidentifier] NULL,
	[ColumnName] [varchar](50) NULL,
	[ColumnValue] [varchar](1024) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](3) NULL,
 CONSTRAINT [PK_ProspectEqualPay_InfoHistory] PRIMARY KEY CLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_InternalNotification_Messages]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_InternalNotification_Messages](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[MessageText] [nvarchar](1024) NULL,
	[EntityId] [uniqueidentifier] NOT NULL,
	[EntityType] [tinyint] NOT NULL,
	[IsRead] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](3) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](3) NULL,
 CONSTRAINT [PK_Pvs4_InternalNotification_Messages_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_JobPosting_DK]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_JobPosting_DK](
	[Id] [uniqueidentifier] NOT NULL,
	[ProspectId] [uniqueidentifier] NOT NULL,
	[JobText] [nvarchar](max) NOT NULL,
	[StatusId] [smallint] NOT NULL,
	[DescriptionText] [nvarchar](max) NULL,
	[LanguageId] [smallint] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](3) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateTime] [datetime2](3) NULL,
	[Locale] [varchar](5) NULL,
 CONSTRAINT [PKP_Pvs4_JobPosting_DK] PRIMARY KEY CLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_LogSourceType]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_LogSourceType](
	[Id] [uniqueidentifier] NOT NULL,
	[EntityId] [uniqueidentifier] NOT NULL,
	[EntityType] [tinyint] NOT NULL,
	[ProspectSourceId] [tinyint] NULL,
	[OpportunitySourceId] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pvs4_LogSourceType_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_MailTemplates]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_MailTemplates](
	[Id] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[EntityType] [tinyint] NULL,
	[TemplateName] [nvarchar](255) NOT NULL,
	[TemplateMailSubject] [nvarchar](200) NULL,
	[TemplateMailBody] [nvarchar](max) NULL,
	[IsNew] [bit] NOT NULL,
	[LanguageId] [tinyint] NOT NULL,
	[UserTemplate] [bit] NOT NULL,
 CONSTRAINT [PK_Pvs4_MailTemplates_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_MapBusinessUnit]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_MapBusinessUnit](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[EnterpriseId] [uniqueidentifier] NULL,
	[BusinessUnitId] [tinyint] NOT NULL,
	[IsFocus] [bit] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pvs4_MapBusinessUnit_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_MapEntityBusinessUnit]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_MapEntityBusinessUnit](
	[GuId] [uniqueidentifier] NOT NULL,
	[EntityId] [uniqueidentifier] NOT NULL,
	[BusinessUnitId] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pvs4_MapEntityBusinessUnit_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_MapEntityToSc]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_MapEntityToSc](
	[Id] [uniqueidentifier] NOT NULL,
	[ScId] [varchar](18) NOT NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[CcId] [uniqueidentifier] NULL,
	[CreatedAt] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pvs4_MapEntityToSc_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_MappingEntityHierarchy]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_MappingEntityHierarchy](
	[Id] [uniqueidentifier] NOT NULL,
	[EntityId] [uniqueidentifier] NOT NULL,
	[Hierarchy_Id] [tinyint] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime2](0) NULL,
 CONSTRAINT [PK_Pvs4_MappingEntityHierarchy_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_MasterData]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_MasterData](
	[GuidId] [uniqueidentifier] NOT NULL,
	[Term] [varchar](100) NOT NULL,
	[Section] [varchar](50) NOT NULL,
	[CreationDate] [datetime2](0) NULL,
	[LookUpKey] [varchar](100) NULL,
 CONSTRAINT [PK_Pvs4_MasterData] PRIMARY KEY NONCLUSTERED 
(
	[GuidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_MasterDataDescription]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_MasterDataDescription](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[GuidId] [uniqueidentifier] NOT NULL,
	[LanguageId] [smallint] NOT NULL,
	[GenderId] [int] NULL,
	[Description] [varchar](1600) NULL,
	[CreationDate] [datetime2](0) NULL,
	[Description_02] [varchar](1500) NULL,
 CONSTRAINT [PK_Pvs4_MasterDataDescription] PRIMARY KEY NONCLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_NotificationWatcherList]    Script Date: 19.01.2022 12:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_NotificationWatcherList](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[EntityId] [uniqueidentifier] NOT NULL,
	[EntityType] [smallint] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](3) NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateTime] [datetime2](3) NULL,
	[Note] [varchar](1024) NULL,
 CONSTRAINT [PKPvs4_NotificationWatcherList] PRIMARY KEY CLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_Opportunity]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_Opportunity](
	[GuId_Id] [uniqueidentifier] NOT NULL,
	[StatusOfOpportunity] [uniqueidentifier] NOT NULL,
	[NoOfOpportunity] [int] NULL,
	[HTS] [bit] NOT NULL,
	[DescriptionOpportunity] [nvarchar](max) NULL,
	[ProjectStartDate] [varchar](50) NULL,
	[ProjectDuration] [nvarchar](50) NULL,
	[DigitalAttribute] [uniqueidentifier] NULL,
	[CoAttribute] [uniqueidentifier] NULL,
	[PB_Company] [uniqueidentifier] NULL,
	[PostalCode] [nvarchar](10) NULL,
	[PlaceOfWork] [nvarchar](50) NULL,
	[OperationalArea] [tinyint] NULL,
	[DistributionChannel] [tinyint] NULL,
	[CandidateCount] [smallint] NULL,
	[RespUserId] [uniqueidentifier] NULL,
	[Task] [nvarchar](255) NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[ProspectId] [uniqueidentifier] NULL,
	[SourceOfOppportunity] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[LocationId] [uniqueidentifier] NULL,
	[Notes] [nvarchar](1024) NULL,
	[ClientContactId] [uniqueidentifier] NULL,
	[Company] [nvarchar](255) NULL,
	[TrackingInformation] [nvarchar](1024) NULL,
 CONSTRAINT [PK_Pvs4_Opportunity_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_OpportunityJournalEntry]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_OpportunityJournalEntry](
	[GuId_Id] [uniqueidentifier] NOT NULL,
	[JESubject] [nvarchar](255) NOT NULL,
	[JEContent] [nvarchar](max) NULL,
	[JournalType] [tinyint] NOT NULL,
	[OpportunityId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
 CONSTRAINT [PK_Pvs4_OpportunityJournalEntry_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_OpportunityJournalEntryDocument]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_OpportunityJournalEntryDocument](
	[Id] [uniqueidentifier] NOT NULL,
	[JournalId] [uniqueidentifier] NOT NULL,
	[DocumentId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Pvs4_OpportunityJournalDocument_JournalId_DocumentId] PRIMARY KEY NONCLUSTERED 
(
	[JournalId] ASC,
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_OpportunityRoleMap]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_OpportunityRoleMap](
	[GuId_Id] [uniqueidentifier] NOT NULL,
	[OpportunityId] [uniqueidentifier] NOT NULL,
	[RoleType_ID] [uniqueidentifier] NOT NULL,
	[Value] [smallint] NOT NULL,
	[Actuality] [date] NULL,
	[RoleAppliedType_ID] [smallint] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedDate] [datetime2](0) NULL,
	[MainRole] [bit] NULL,
 CONSTRAINT [PK_OpportunityRoleMap_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_OpportunitySkillMap]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_OpportunitySkillMap](
	[GuId_Id] [uniqueidentifier] NOT NULL,
	[OpportunityId] [uniqueidentifier] NOT NULL,
	[Skilltype_ID] [uniqueidentifier] NOT NULL,
	[Value] [smallint] NOT NULL,
	[Actuality] [date] NULL,
	[SkillAppliedType_ID] [smallint] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdatedDate] [datetime2](0) NULL,
 CONSTRAINT [PK_OpportunitySkillMap_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_PayGroupChangeReason]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_PayGroupChangeReason](
	[Id] [uniqueidentifier] NOT NULL,
	[ProspectId] [uniqueidentifier] NOT NULL,
	[Reason] [nvarchar](1024) NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PayGroupChangeReason_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_Person_OU_Assignment_PSO]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_Person_OU_Assignment_PSO](
	[GuId_Id] [uniqueidentifier] NOT NULL,
	[PersonId] [uniqueidentifier] NOT NULL,
	[PSO_OuId] [uniqueidentifier] NOT NULL,
	[Valid_From] [date] NOT NULL,
	[Valid_Until] [date] NOT NULL,
	[EntityType] [smallint] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pvs4_Person_OU_Assignment_PSO] PRIMARY KEY NONCLUSTERED 
(
	[GuId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_SentAppointments]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_SentAppointments](
	[Id] [uniqueidentifier] NOT NULL,
	[ProspectId] [uniqueidentifier] NOT NULL,
	[BPId] [uniqueidentifier] NOT NULL,
	[PlacementId] [uniqueidentifier] NOT NULL,
	[AppontmentId] [varchar](250) NOT NULL,
	[CreationDate] [datetime2](3) NOT NULL,
 CONSTRAINT [PK_Pvs4_SentAppointments] PRIMARY KEY CLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_SkillNote]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_SkillNote](
	[Id] [uniqueidentifier] NOT NULL,
	[BPId] [uniqueidentifier] NOT NULL,
	[SkillTypeId] [uniqueidentifier] NULL,
	[Note] [nvarchar](1024) NULL,
	[CreatedAt] [datetime2](0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime2](0) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pvs4_SkillNote_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_UserPersonalSettings]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_UserPersonalSettings](
	[GuId] [uniqueidentifier] NOT NULL,
	[PB_UserId] [uniqueidentifier] NOT NULL,
	[SettingKey] [varchar](128) NOT NULL,
	[SettingValue] [nvarchar](max) NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime2](0) NULL,
 CONSTRAINT [PK_Pvs4_UserPersonalSettings_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_UserProfileSettings]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_UserProfileSettings](
	[GuId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserProfile] [xml] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[ChangeDate] [datetime2](0) NULL,
 CONSTRAINT [PK_Pvs4_UserProfileSettings_GuId] PRIMARY KEY NONCLUSTERED 
(
	[GuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pvs4_UserSignatures]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pvs4_UserSignatures](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[Title] [varchar](100) NULL,
	[SignatureContent] [nvarchar](max) NULL,
	[StandardCompanySignature] [bit] NOT NULL,
	[StandardUserSignature] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_Pvs4_Signatures_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QualiCheckProspect]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QualiCheckProspect](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Creation_Date] [datetime] NULL,
	[ProspectMitarbeiter_GUID] [uniqueidentifier] NULL,
	[Prospect_Number] [int] NULL,
	[Prospect_GUID] [uniqueidentifier] NULL,
	[Task] [varchar](250) NULL,
	[BP_GUID] [uniqueidentifier] NOT NULL,
	[Creator_Token] [varchar](8) NOT NULL,
	[Document_GUID] [uniqueidentifier] NULL,
	[Kontakt_GUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_QualiCheckProspect] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rahmenvertraege]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rahmenvertraege](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RV_erstellt_am] [smalldatetime] NULL,
	[RV_erstellt_von] [uniqueidentifier] NULL,
	[RV_zurueck_am] [smalldatetime] NULL,
	[RV_zurueck_von] [uniqueidentifier] NULL,
	[Zahlungsziel] [uniqueidentifier] NULL,
	[Vertragsart] [uniqueidentifier] NULL,
	[Bemerkung] [ntext] NULL,
	[Doku_id] [uniqueidentifier] NULL,
	[BP_id] [uniqueidentifier] NULL,
	[PSO_id] [uniqueidentifier] NULL,
	[Nichtig] [bit] NULL,
	[RV_bearbeitet_von] [uniqueidentifier] NULL,
	[RV_bearbeitet_am] [smalldatetime] NULL,
	[Firmen_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Rahmenvertraege] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rechercheergebnis]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rechercheergebnis](
	[Ergebnis_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[R_ID] [uniqueidentifier] NOT NULL,
	[Kunde_id] [uniqueidentifier] NULL,
	[anzeigen] [bit] NOT NULL,
	[neu_gefunden] [bit] NOT NULL,
	[Bemerkung] [varchar](1000) NULL,
	[BP_ID] [uniqueidentifier] NULL,
	[Bearbeitungsdatum] [smalldatetime] NULL,
	[bearbeitet_von] [uniqueidentifier] NULL,
	[hinzugefuegt_am] [smalldatetime] NULL,
	[hinzugefuegt_von] [uniqueidentifier] NULL,
 CONSTRAINT [PK_rechercheergebnis] PRIMARY KEY NONCLUSTERED 
(
	[Ergebnis_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rechercheergebnisbeschreibung]    Script Date: 19.01.2022 12:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rechercheergebnisbeschreibung](
	[R_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Beschreibung] [varchar](255) NOT NULL,
	[Erstellungsdatum] [smalldatetime] NOT NULL,
	[sql_text] [text] NULL,
	[check_auf_neue_BPs] [bit] NOT NULL,
	[Kategorie] [tinyint] NULL,
	[privat] [bit] NOT NULL,
	[user_id] [uniqueidentifier] NOT NULL,
	[Recherchedauer] [int] NULL,
	[Bereich] [int] NULL,
 CONSTRAINT [PK_Rechercheergebnisbeschreibung] PRIMARY KEY NONCLUSTERED 
(
	[R_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recherchequeue]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recherchequeue](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[r_id] [uniqueidentifier] NULL,
	[erstelltam] [smalldatetime] NULL,
	[gestartetam] [smalldatetime] NULL,
	[beendetam] [smalldatetime] NULL,
	[wichtig] [bit] NULL,
	[ZielServer] [varchar](20) NULL,
 CONSTRAINT [PK_Recherchequeue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Land_id] [uniqueidentifier] NOT NULL,
	[PLZ_id] [uniqueidentifier] NOT NULL,
	[Kurzbezeichnung] [varchar](50) NULL,
 CONSTRAINT [PK_land_plz] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAP_Beleg_Import]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_Beleg_Import](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BelegNr] [varchar](20) NULL,
	[Belegdatum] [smalldatetime] NULL,
	[Debitor] [varchar](20) NULL,
	[VKorg] [varchar](20) NULL,
	[Importdatum] [smalldatetime] NULL,
	[DokumentID] [uniqueidentifier] NULL,
	[Exportdatum] [smalldatetime] NULL,
	[Exportuser] [uniqueidentifier] NULL,
 CONSTRAINT [PK_SAP_Beleg_Import] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAP_BPSachbearbeiter]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_BPSachbearbeiter](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[SB_ID] [uniqueidentifier] NOT NULL,
	[PSPNR] [nvarchar](8) NULL,
	[POSID] [nvarchar](24) NULL,
	[PM_ID] [uniqueidentifier] NULL,
	[PROSPECT_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_SAP_BPSachbearbeiter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAP_KundeSachbearbeiter]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_KundeSachbearbeiter](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[KUNDE_ID] [uniqueidentifier] NOT NULL,
	[SB_ID] [uniqueidentifier] NOT NULL,
	[VTWEG] [char](1) NULL,
 CONSTRAINT [PK_SAP_KundeSachbearbeiter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAP_ProjectData]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ProjectData](
	[ID] [uniqueidentifier] NOT NULL,
	[ProjectStart] [date] NOT NULL,
	[ProjectEnd] [date] NULL,
	[Duration]  AS (datediff(day,[ProjectStart],[ProjectEnd])),
	[BP_ID] [uniqueidentifier] NULL,
	[AP_ID] [uniqueidentifier] NOT NULL,
	[PM_ID] [uniqueidentifier] NOT NULL,
	[Firma_ID] [uniqueidentifier] NOT NULL,
	[Standort_ID] [uniqueidentifier] NOT NULL,
	[PSO_ID] [uniqueidentifier] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_SAM_Favorite] PRIMARY KEY CLUSTERED 
(
	[ID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAP_Skill]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_Skill](
	[VMSkill_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SAPID] [varchar](50) NOT NULL,
	[inaktiv] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAP_Skill_Bezeichnung]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_Skill_Bezeichnung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Vertragsskill] [uniqueidentifier] NOT NULL,
	[Sprache] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAP_Skill_Keyword]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_Skill_Keyword](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Vertragsskill] [uniqueidentifier] NOT NULL,
	[Vertriebsweg] [int] NOT NULL,
	[Sprache] [tinyint] NOT NULL,
	[Keywords] [text] NULL,
 CONSTRAINT [PK_SAP_Skill_Keyword] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAP_Skill_Zuordnung]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_Skill_Zuordnung](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Vertragsskill] [uniqueidentifier] NOT NULL,
	[Vertriebsweg] [int] NOT NULL,
	[Einsatzbereich] [int] NOT NULL,
	[Twitteradresse] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAP_WiedervermittlungTemp]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_WiedervermittlungTemp](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PERNR] [nvarchar](8) NOT NULL,
	[BP_GUID] [uniqueidentifier] NOT NULL,
	[MASSN] [nvarchar](2) NULL,
	[MASSG] [nvarchar](2) NULL,
	[MNTXT] [nvarchar](30) NULL,
	[MGTXT] [nvarchar](30) NULL,
	[AUSTRITT] [date] NULL,
 CONSTRAINT [PK_SAP_Wiedervermittlung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill_MainMatrix]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill_MainMatrix](
	[Mainskill_Matrix_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Mainskill_ID] [uniqueidentifier] NOT NULL,
	[Skill_ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Mainskill_Matrix] PRIMARY KEY CLUSTERED 
(
	[Mainskill_ID] ASC,
	[Skill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skillgruppe_Geschaeftsfeld_Matrix]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skillgruppe_Geschaeftsfeld_Matrix](
	[Skillgruppe_Geschaeftsfeld_Matrix_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Skillgruppe] [uniqueidentifier] NOT NULL,
	[Vertriebsweg] [smallint] NOT NULL,
	[Einsatzbereich] [smallint] NOT NULL,
 CONSTRAINT [PK_Skillgruppe_Geschaeftsfeld_Matrix] PRIMARY KEY CLUSTERED 
(
	[Skillgruppe_Geschaeftsfeld_Matrix_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skillgruppen_Matrix]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skillgruppen_Matrix](
	[Skillgruppen_Matrix_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Skillgruppe_ID] [smallint] NOT NULL,
	[Skill_ID] [int] NOT NULL,
 CONSTRAINT [PK_Skillgruppen_Matrix] PRIMARY KEY CLUSTERED 
(
	[Skillgruppen_Matrix_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skillobergruppe]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skillobergruppe](
	[Skillobergruppe_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [varchar](100) NULL,
	[SkillTab] [int] NOT NULL,
 CONSTRAINT [PK_Skillobergruppe] PRIMARY KEY CLUSTERED 
(
	[Skillobergruppe_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skillobergruppe_Beschreibung]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skillobergruppe_Beschreibung](
	[Skillobergruppe_Beschreibung_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Skillobergruppe_ID] [uniqueidentifier] NOT NULL,
	[Sprach_ID] [tinyint] NOT NULL,
	[Bezeichnung] [varchar](100) NULL,
	[Beschreibung] [varchar](255) NULL,
 CONSTRAINT [PK_Skillobergruppe_Beschreibung] PRIMARY KEY CLUSTERED 
(
	[Skillobergruppe_ID] ASC,
	[Sprach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skillobergruppen_Matrix]    Script Date: 19.01.2022 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skillobergruppen_Matrix](
	[Skillobergruppen_Matrix_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Skillobergruppe_ID] [uniqueidentifier] NOT NULL,
	[Fgruppe_ID] [smallint] NOT NULL,
 CONSTRAINT [PK_Skillobergruppen_Matrix_1] PRIMARY KEY CLUSTERED 
(
	[Skillobergruppen_Matrix_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staging_DenmarkContactsExport]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staging_DenmarkContactsExport](
	[CONTACT_REFERENCE] [float] NULL,
	[IS_CONT_NOTES] [nvarchar](255) NULL,
	[IS_ORG_DTLS] [nvarchar](255) NULL,
	[ORGANISATION_LATITUDE] [nvarchar](255) NULL,
	[ORGANISATION_LONGITUDE] [nvarchar](255) NULL,
	[ORG_ESHOT] [nvarchar](255) NULL,
	[LUI_ID] [nvarchar](255) NULL,
	[CREATED_BY_NAME] [nvarchar](255) NULL,
	[PREVIOUS_ORGANISATION] [nvarchar](255) NULL,
	[CREATED_DATE] [nvarchar](255) NULL,
	[LINKEDIN_TRACKED] [nvarchar](255) NULL,
	[BUSINESS_DEV] [nvarchar](255) NULL,
	[LOCATION] [nvarchar](255) NULL,
	[LOCATION_XN] [nvarchar](255) NULL,
	[AGENCY_USED] [nvarchar](255) NULL,
	[CREATED_BY_ID] [float] NULL,
	[ORG_MAILSHOT] [nvarchar](255) NULL,
	[OTHER_AGENCY_USER] [nvarchar](255) NULL,
	[E_SHOT] [nvarchar](255) NULL,
	[CONTACT_STATUS] [nvarchar](255) NULL,
	[CONTACT_STATUS_XN] [nvarchar](255) NULL,
	[BD_RESULT] [nvarchar](255) NULL,
	[BD_RESULT_XN] [nvarchar](255) NULL,
	[LINKEDIN_CONSENT] [nvarchar](255) NULL,
	[LINKEDIN_CONSENT_XN] [nvarchar](255) NULL,
	[M_SHOT] [nvarchar](255) NULL,
	[CAN_SURVEY] [nvarchar](255) NULL,
	[CONTACT_JOB_TITLE] [nvarchar](255) NULL,
	[LAST_MRKT_CV_DATE] [nvarchar](255) NULL,
	[STRATEGIC_DESC] [nvarchar](255) NULL,
	[STRATEGIC_CLIENT] [nvarchar](255) NULL,
	[SPEC_CV] [nvarchar](255) NULL,
	[CONSULTANT_NAME] [nvarchar](255) NULL,
	[CONSULTANT_NAME_XN] [nvarchar](255) NULL,
	[LAST_TMP_JOB] [nvarchar](255) NULL,
	[LAST_MAILSHOT_DATE] [nvarchar](255) NULL,
	[LAST_CONT_DT] [nvarchar](255) NULL,
	[LAST_MEETING_ATTENDED_DATE] [nvarchar](255) NULL,
	[LAST_ESHOT_DATE] [nvarchar](255) NULL,
	[LAST_PRM_JOB] [nvarchar](255) NULL,
	[LAST_CONTACTED_BY] [nvarchar](255) NULL,
	[LAST_CT_JOB] [nvarchar](255) NULL,
	[CONTACT_STREET_2] [nvarchar](255) NULL,
	[CONTACT_STREET_1] [nvarchar](255) NULL,
	[CONTACT_COUNTY] [nvarchar](255) NULL,
	[CONTACT_COUNTRY] [nvarchar](255) NULL,
	[CONTACT_COUNTRY_XN] [nvarchar](255) NULL,
	[CONTACT_LOCALITY] [nvarchar](255) NULL,
	[CONTACT_TOWN] [nvarchar](255) NULL,
	[CONTACT_POST_CODE] [nvarchar](255) NULL,
	[CLIENT_LOCATION] [nvarchar](255) NULL,
	[CLIENT_LOCATION_XN] [nvarchar](255) NULL,
	[CLIENT_LOCATION_HIER] [nvarchar](255) NULL,
	[CLIENT_NAME] [nvarchar](255) NULL,
	[CLIENT_NAME_XN] [nvarchar](255) NULL,
	[TURNOVER] [nvarchar](255) NULL,
	[TURNOVER_XN] [nvarchar](255) NULL,
	[CLIENT_SECTOR] [nvarchar](255) NULL,
	[CLIENT_SECTOR_XN] [nvarchar](255) NULL,
	[SALES_RGN] [nvarchar](255) NULL,
	[SALES_RGN_XN] [nvarchar](255) NULL,
	[CLIENT_ID] [float] NULL,
	[INDUSTRY_CODE] [nvarchar](255) NULL,
	[INDUSTRY_CODE_XN] [nvarchar](255) NULL,
	[ORG_SPEC_CV] [nvarchar](255) NULL,
	[CONTACT_PERSON_ID] [nvarchar](255) NULL,
	[SALUTATION] [nvarchar](255) NULL,
	[FIRST_NAME] [nvarchar](255) NULL,
	[CONTACT_FULLNAME] [nvarchar](255) NULL,
	[CORE_LANGUAGE] [nvarchar](255) NULL,
	[CORE_LANGUAGE_XN] [nvarchar](255) NULL,
	[TITLE] [nvarchar](255) NULL,
	[TITLE_XN] [nvarchar](255) NULL,
	[LINE_MANAGER] [nvarchar](255) NULL,
	[COMPANY] [float] NULL,
	[LAST_NAME] [nvarchar](255) NULL,
	[EMAIL_ADDRESS] [nvarchar](255) NULL,
	[SALES_AREA] [nvarchar](255) NULL,
	[DEPARTMENT_SIZE] [nvarchar](255) NULL,
	[DEPARTMENT_SIZE_XN] [nvarchar](255) NULL,
	[DIRECT_TELNO] [nvarchar](255) NULL,
	[CAN_SMS] [nvarchar](255) NULL,
	[MOBILE_NO] [nvarchar](255) NULL,
	[OFFICE] [nvarchar](255) NULL,
	[OFFICE_XN] [nvarchar](255) NULL,
	[CURRENT_ORGANISATION_ID] [float] NULL,
	[CURRENT_ORGANISATION_NAME] [nvarchar](255) NULL,
	[RECRUITS_FOR_JOB_CATEGORIES] [nvarchar](255) NULL,
	[RECRUITS_FOR_JOB_CATEGORIES_XN] [nvarchar](255) NULL,
	[RECRUITS_FOR_JOB_CATEGORIES_HI] [nvarchar](255) NULL,
	[ORGANISATION_TELNO] [nvarchar](255) NULL,
	[HAYS_COUNTRY] [nvarchar](255) NULL,
	[HAYS_COUNTRY_XN] [nvarchar](255) NULL,
	[SPECIALISM] [nvarchar](255) NULL,
	[SPECIALISM_XN] [nvarchar](255) NULL,
	[SITE_NAME] [nvarchar](255) NULL,
	[SITE_NAME_XN] [nvarchar](255) NULL,
	[JOB_CATEGORIES] [nvarchar](255) NULL,
	[JOB_CATEGORIES_XN] [nvarchar](255) NULL,
	[JOB_CATEGORIES_HIER] [nvarchar](255) NULL,
	[CLIENT_TYPE] [nvarchar](255) NULL,
	[CLIENT_TYPE_XN] [nvarchar](255) NULL,
	[CLIENT_TYPE_HIER] [nvarchar](255) NULL,
	[SUB_SPECIALISM] [nvarchar](255) NULL,
	[SUB_SPECIALISM_XN] [nvarchar](255) NULL,
	[SUB_SPECIALISM_HIER] [nvarchar](255) NULL,
	[ORGANISATION_POSTCODE] [nvarchar](255) NULL,
	[ORGANISATION_TOWN] [nvarchar](255) NULL,
	[ORGANISATION_STATE] [nvarchar](255) NULL,
	[LAST_MEETING_DATE] [nvarchar](255) NULL,
	[HAYSTRY_OWNCONS] [nvarchar](255) NULL,
	[HAYSTRY_OWNCONS_XN] [nvarchar](255) NULL,
	[LAST_SPEC_CV_SENT] [nvarchar](255) NULL,
	[DFI_TAB_CHANGE_STATE] [nvarchar](255) NULL,
	[DFI_CONTACT_TAB] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Standardrolle_User_Zuord]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Standardrolle_User_Zuord](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[StandardrolleID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Standardrolle_User_Zuord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Standardrolle_Zugriffsrolle]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Standardrolle_Zugriffsrolle](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Standardrollenid] [uniqueidentifier] NOT NULL,
	[zugriffsrollen_id] [uniqueidentifier] NOT NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [smalldatetime] NOT NULL,
	[inaktiv] [bit] NOT NULL,
 CONSTRAINT [PK_Zuordnung_standardrollen_rollen] PRIMARY KEY CLUSTERED 
(
	[Standardrollenid] ASC,
	[zugriffsrollen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Standardrollen]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Standardrollen](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Beschreibung] [varchar](8000) NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [smalldatetime] NOT NULL,
	[inaktiv] [bit] NOT NULL,
 CONSTRAINT [PK_Standardrollen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StartWizard_Department_UOO]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StartWizard_Department_UOO](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DepartmentID] [uniqueidentifier] NOT NULL,
	[UserOptionsObjectsID] [uniqueidentifier] NOT NULL,
	[OrdinalPosition] [int] NOT NULL,
	[Visible] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_StartWizard_Department_UOO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StartWizard_InfoText]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StartWizard_InfoText](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Dep_UOOID] [uniqueidentifier] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[InfoText] [text] NULL,
 CONSTRAINT [PK_StartWizard_InfoText] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StartWizard_UserOptionsObjects]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StartWizard_UserOptionsObjects](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Titel] [nvarchar](100) NOT NULL,
	[ObjectName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_StartWizard_UserOptionsObjects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempDaxtraScandDennmark]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempDaxtraScandDennmark](
	[BP_ID] [uniqueidentifier] NOT NULL,
	[DocumentId] [uniqueidentifier] NOT NULL,
	[Data] [varbinary](max) NULL,
	[Status] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CSQ_FragenAlle]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CSQ_FragenAlle](
	[PB_Company] [varchar](50) NULL,
	[Freelancer] [varchar](50) NULL,
	[PSO_BP] [varchar](50) NULL,
	[HTSG] [varchar](50) NULL,
	[HPS] [varchar](50) NULL,
	[ContractType] [varchar](50) NULL,
	[SpecificQuestion] [varchar](50) NULL,
	[QuestionNo] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translation]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translation](
	[ID] [uniqueidentifier] NOT NULL,
	[Formular] [varchar](250) NOT NULL,
	[Feld] [varchar](250) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[rowguid5] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Translation_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranslationSprache]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranslationSprache](
	[ID] [uniqueidentifier] NOT NULL,
	[TranslationGuid] [uniqueidentifier] NOT NULL,
	[Uebersetzung] [varchar](250) NOT NULL,
	[Sprach_ID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[Translated] [bit] NULL,
	[rowguid6] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_TranslationSprache_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umrechnung_waehrungen]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umrechnung_waehrungen](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Waehrungsname] [varchar](50) NOT NULL,
	[Waehrung_kurz] [varchar](5) NOT NULL,
	[zum_euro] [float] NULL,
	[Sprache] [tinyint] NOT NULL,
	[SAP_Waehrung] [char](3) NOT NULL,
	[Sortierreihenfolge] [int] NOT NULL,
	[Default_sichtbarkeit] [bit] NOT NULL,
 CONSTRAINT [PK_umrechnung_waehrungen] PRIMARY KEY NONCLUSTERED 
(
	[Waehrung_kurz] ASC,
	[Sprache] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Untersuchungsart]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Untersuchungsart](
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Sprache] [varchar](3) NULL,
	[Infotyp] [int] NULL,
	[Subtyp] [varchar](10) NULL,
	[Bezeichnung] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Untersuchungsergebnisse]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Untersuchungsergebnisse](
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Sprache] [varchar](3) NULL,
	[Subtyp] [varchar](4) NULL,
	[Subjekt] [varchar](2) NULL,
	[Wertefeld] [varchar](10) NULL,
	[Bezeichnung] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Untersuchungsgebiet]    Script Date: 19.01.2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Untersuchungsgebiet](
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Sprache] [varchar](3) NULL,
	[Subtyp] [varchar](4) NULL,
	[Subjekt] [varchar](2) NULL,
	[Bezeichnung] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_einstellungen]    Script Date: 19.01.2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_einstellungen](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[parameter_id] [int] NOT NULL,
	[user_id] [uniqueidentifier] NOT NULL,
	[wert] [varchar](4000) NOT NULL,
	[typ] [smallint] NOT NULL,
 CONSTRAINT [PK_User_einstellungen] PRIMARY KEY NONCLUSTERED 
(
	[parameter_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vertragsmail]    Script Date: 19.01.2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vertragsmail](
	[Vertragsmail_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Geschaeftstyp] [smallint] NOT NULL,
	[OrdinalPosition] [smallint] NOT NULL,
	[Bezeichnung] [varchar](100) NULL,
	[Mail_to] [varchar](255) NULL,
	[Mail_cc] [varchar](255) NULL,
	[Initialbeleg] [bit] NOT NULL,
	[XMLNAme] [varchar](100) NULL,
	[Partnerside] [smallint] NOT NULL,
	[Mail_erledigt_to] [varchar](255) NULL,
	[Mail_erledigt_cc] [varchar](255) NULL,
	[inaktiv] [bit] NOT NULL,
	[InternalNumber] [varchar](15) NULL,
	[Mail_From] [varchar](255) NULL,
	[Sonderregelungsflag] [bit] NOT NULL,
	[SAP_ValidationFields] [xml] NULL,
	[GruppierungsID] [smallint] NULL,
 CONSTRAINT [PK_Vertragsmail] PRIMARY KEY CLUSTERED 
(
	[Vertragsmail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vertragsmail_Bereich_Mapping]    Script Date: 19.01.2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vertragsmail_Bereich_Mapping](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[VertragsmailBereich_ID] [uniqueidentifier] NOT NULL,
	[MappedVertragsmail_ID] [uniqueidentifier] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vertragsmail_Description]    Script Date: 19.01.2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vertragsmail_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[Vertragsmail_ID] [uniqueidentifier] NOT NULL,
	[LanguageId] [smallint] NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_Vertragsmail_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vertragsmail_Menu]    Script Date: 19.01.2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vertragsmail_Menu](
	[Vertragsmail_Menu_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Vertragsmail_ID] [uniqueidentifier] NOT NULL,
	[Formular] [varchar](100) NULL,
	[Bezeichnung] [varchar](100) NULL,
	[OrdinalPosition] [smallint] NOT NULL,
	[sichtbar] [bit] NOT NULL,
	[enable] [bit] NOT NULL,
	[vollstaendig] [bit] NOT NULL,
 CONSTRAINT [PK_Vertragsmail_Menu] PRIMARY KEY CLUSTERED 
(
	[Vertragsmail_Menu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VertragsmailBereichsMatrix]    Script Date: 19.01.2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VertragsmailBereichsMatrix](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[VertragsmailBereich_ID] [uniqueidentifier] NOT NULL,
	[DistributionChannelType_ID] [smallint] NOT NULL,
	[HaysCompanyType_ID] [uniqueidentifier] NULL,
	[Aktiv] [bit] NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vertragsmailmatrix]    Script Date: 19.01.2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vertragsmailmatrix](
	[Vertragsmailmatrix_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Parentbeleg] [uniqueidentifier] NOT NULL,
	[Childbeleg] [uniqueidentifier] NOT NULL,
	[ChildPosition] [int] NOT NULL,
 CONSTRAINT [PK_Vertragsmailmatrix] PRIMARY KEY CLUSTERED 
(
	[Vertragsmailmatrix_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vertragsskill]    Script Date: 19.01.2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vertragsskill](
	[VMSkill_ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Bezeichnung] [varchar](50) NULL,
	[Sprach_id] [tinyint] NULL,
	[Geschaeftstyp] [smallint] NULL,
	[Bereich] [smallint] NULL,
 CONSTRAINT [PK_Vertragsskill] PRIMARY KEY CLUSTERED 
(
	[VMSkill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zugriff_ActivityReport]    Script Date: 19.01.2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zugriff_ActivityReport](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[report_von] [uniqueidentifier] NOT NULL,
	[einsehen_durch] [uniqueidentifier] NOT NULL,
	[ab] [smalldatetime] NULL,
	[bis] [smalldatetime] NULL,
	[inaktiv] [bit] NOT NULL,
	[bemerkung] [varchar](250) NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [smalldatetime] NOT NULL,
	[aus_pb_knz] [char](1) NULL,
	[aus_pb_von] [uniqueidentifier] NULL,
	[aus_pb_am] [smalldatetime] NULL,
	[report_typ] [char](1) NULL,
 CONSTRAINT [PK_Zugriff_ActivityReport] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zugriffsrollen]    Script Date: 19.01.2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zugriffsrollen](
	[Rollen_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Rollenname] [varchar](255) NOT NULL,
	[Beschreibung] [varchar](8000) NULL,
	[erstellt_von] [uniqueidentifier] NOT NULL,
	[erstellt_am] [smalldatetime] NOT NULL,
	[inaktiv] [bit] NOT NULL,
	[Zugriffstyp] [smallint] NULL,
	[Geschaeftstyp] [smallint] NULL,
	[Bereich] [smallint] NULL,
	[Vertragsbeschreibung] [varchar](100) NULL,
	[sichtbar] [bit] NOT NULL,
	[IstMSP] [bit] NOT NULL,
	[FilterUI] [tinyint] NULL,
	[BpRole] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Zugriffsrollen] PRIMARY KEY NONCLUSTERED 
(
	[Rollen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zugriffsrollen_Description]    Script Date: 19.01.2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zugriffsrollen_Description](
	[RowGuid] [uniqueidentifier] NOT NULL,
	[RollenId] [uniqueidentifier] NOT NULL,
	[Rollenname] [varchar](255) NOT NULL,
	[Description] [varchar](8000) NULL,
	[LanguageId] [smallint] NOT NULL,
	[CreationDate] [datetime2](0) NULL,
 CONSTRAINT [PK_Zugriffsrollen_Description_RowGuid] PRIMARY KEY CLUSTERED 
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zuordnung_AScena_BP_resumes]    Script Date: 19.01.2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zuordnung_AScena_BP_resumes](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Kunde_id] [uniqueidentifier] NULL,
	[Dokument_id] [uniqueidentifier] NOT NULL,
	[logo] [bit] NOT NULL,
	[Ascena_Standort] [tinyint] NOT NULL,
	[zugeordnet_am] [smalldatetime] NOT NULL,
	[user_id] [uniqueidentifier] NOT NULL,
	[BP_ID] [uniqueidentifier] NOT NULL,
	[PSO_ID] [uniqueidentifier] NULL,
	[Prospect_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Zuordnung_AScena_BP_resumes] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Abteilung] ADD  CONSTRAINT [MSmerge_default_constraint_for_rowguidcol_of_1183707665]  DEFAULT (newsequentialid()) FOR [Abteilungs_id]
GO
ALTER TABLE [dbo].[App_Services] ADD  CONSTRAINT [DF_App_Services_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ApproachabilityIndex] ADD  CONSTRAINT [DF_ApproachabilityIndex_ApproachabilityIndexId]  DEFAULT (newsequentialid()) FOR [ApproachabilityIndexId]
GO
ALTER TABLE [dbo].[ApproachabilityIndex] ADD  CONSTRAINT [DF_ApproachabilityIndexCreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Arbeitserlaubnisgueltigkeit] ADD  CONSTRAINT [DF_Arbeitserlaubnisgueltigkeit_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[Arbeitserlaubnisgueltigkeit] ADD  CONSTRAINT [DF_Arbeitserlaubnisgueltigkeit_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Arbeitserlaubnisgueltigkeit] ADD  CONSTRAINT [DF_ArbeitserlaubnisgueltigkeitIsUnlimited]  DEFAULT ((0)) FOR [IsUnlimited]
GO
ALTER TABLE [dbo].[Arbeitserlaubnisgueltigkeit] ADD  CONSTRAINT [DF_ArbeitserlaubnisgueltigkeitIsRestricted]  DEFAULT ((0)) FOR [IsRestricted]
GO
ALTER TABLE [dbo].[Auditprotokoll] ADD  CONSTRAINT [DF_dbo_Auditprotokoll_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[Auditprotokoll] ADD  CONSTRAINT [DF_dbo_Auditprotokoll_erstellt_am]  DEFAULT (sysdatetime()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[Bewertungsgruppen_Auspraegung] ADD  CONSTRAINT [MSmerge_default_constraint_for_rowguidcol_of_2087678485]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[BP_Ascena_bereich] ADD  CONSTRAINT [DF_BP_Ascena_bereich_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[BP_Ascena_bereich] ADD  CONSTRAINT [DF_BP_Ascena_bereich_Datum]  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[BP_Mailadressen_Archiv] ADD  CONSTRAINT [DF_BP_Mailadressen_Archiv_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[BP_Zuordnung_WVL] ADD  CONSTRAINT [DF_BP_Zuordnung_WVL_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[BP_Zuordnung_WVL] ADD  CONSTRAINT [DF_BP_Zuordnung_WVL_erledigt]  DEFAULT ((0)) FOR [erledigt]
GO
ALTER TABLE [dbo].[BusinessPartnerCheck] ADD  CONSTRAINT [DF_BusinessPartnerCheck_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[CandidateQS] ADD  CONSTRAINT [DF_CandidateQS_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[CandidateQS] ADD  CONSTRAINT [DF_CandidateQS_qs]  DEFAULT ((0)) FOR [Qs]
GO
ALTER TABLE [dbo].[CandidateQS] ADD  CONSTRAINT [DF_CandidateQS_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ChangeProtocol] ADD  CONSTRAINT [DF_ChangeProtocol_ID]  DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ChangeProtocol] ADD  CONSTRAINT [DF_ChangeProtocol_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[CoMa_ht_Kuendigungsfristen] ADD  CONSTRAINT [DF_ht_Kuendigungsfristen_Guid]  DEFAULT (newsequentialid()) FOR [Guid]
GO
ALTER TABLE [dbo].[CoMa_ht_Kuendigungsfristen] ADD  CONSTRAINT [DF_ht_Kuendigungsfristen_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[CoMa_ht_Kuendigungsfristen_Beschreibung] ADD  CONSTRAINT [DF_ht_Kuendigungsfristen_Beschreibung_Guid]  DEFAULT (newsequentialid()) FOR [Guid]
GO
ALTER TABLE [dbo].[CoMa_ht_Kuendigungsfristen_Beschreibung] ADD  CONSTRAINT [DF_ht_Kuendigungsfristen_Beschreibung_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[ComLog] ADD  CONSTRAINT [DF_ComLog_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ComLog] ADD  CONSTRAINT [DF_ComLog_Date]  DEFAULT (getdate()) FOR [LogDate]
GO
ALTER TABLE [dbo].[ComObjects] ADD  CONSTRAINT [DF_ComObjects_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ComObjects] ADD  CONSTRAINT [DF_ComObjects_Ordinal_Position]  DEFAULT ((0)) FOR [Ordinal_Position]
GO
ALTER TABLE [dbo].[ComObjectTypes] ADD  CONSTRAINT [DF_ComObjectTypes_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[CP_statuswechsel] ADD  CONSTRAINT [DF_CP_statuswechsel_Wechsel_id]  DEFAULT (newsequentialid()) FOR [Wechsel_id]
GO
ALTER TABLE [dbo].[CP_statuswechsel] ADD  CONSTRAINT [DF_CP_statuswechsel_AL_Berechtigung]  DEFAULT ((0)) FOR [AL_Berechtigung]
GO
ALTER TABLE [dbo].[CT_Beratung_Kontakt] ADD  CONSTRAINT [DF_CT_Beratung_Kontakt_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[CT_BP_Info] ADD  CONSTRAINT [DF_CT_BP_Info_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[CT_BP_Info] ADD  CONSTRAINT [DF_CT_BP_Info_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[CT_Vermittlung_Kontakt] ADD  CONSTRAINT [DF_CT_Vermittlung_Kontakt_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[CTI_Telefonliste] ADD  CONSTRAINT [DF__CTI_Telefonl__ID__7B281099]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[DashboardPlugin] ADD  CONSTRAINT [DF_DashboardPlugin_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[DashboardPlugin] ADD  CONSTRAINT [DF_DashboardPlugin_Aktiv]  DEFAULT ((1)) FOR [Aktiv]
GO
ALTER TABLE [dbo].[DashboardPlugin] ADD  CONSTRAINT [DF_ErstelltAm]  DEFAULT (getdate()) FOR [ErstelltAm]
GO
ALTER TABLE [dbo].[DashboardPluginParameter] ADD  CONSTRAINT [DF_DashboardPluginParameter_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[DashboardPluginParameter] ADD  CONSTRAINT [DF_DashboardPluginParameter_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[DEUEV_T5D4ATS] ADD  CONSTRAINT [DF_DEUEV_T5D4ATS_Guid]  DEFAULT (newsequentialid()) FOR [Guid]
GO
ALTER TABLE [dbo].[DEUEV_T5D4ATS_BRF] ADD  CONSTRAINT [DF_DEUEV_T5D4ATS_BRF_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[DokGen_Dokgruppen_Zugriffsrollen] ADD  CONSTRAINT [DF_DokGen_Dokgruppen_Zugriffsrollen_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[DokGen_FirmenTemplateMatrix] ADD  CONSTRAINT [DF_DokGen_FirmenTemplateMatrix_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[DokGen_FirmenTemplateMatrix] ADD  CONSTRAINT [DF_DokGen_FirmenTemplateMatrix_aktiv]  DEFAULT ((1)) FOR [aktiv]
GO
ALTER TABLE [dbo].[DokGen_Grafikpool] ADD  CONSTRAINT [DF_DokGen_Grafikpool_intID]  DEFAULT (newsequentialid()) FOR [intID]
GO
ALTER TABLE [dbo].[DokGen_hc_Feldtypen] ADD  CONSTRAINT [DF_DokGen_hc_Feldtypen_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[DokGen_Mandanten] ADD  CONSTRAINT [DF_DokGen_Mandanten_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[DokGen_Regelfelder] ADD  CONSTRAINT [DF_DokGen_Regelfelder_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[DokGen_Schnittstellen] ADD  CONSTRAINT [DF_DokGen_Schnittstellen_intID]  DEFAULT (newsequentialid()) FOR [intID]
GO
ALTER TABLE [dbo].[DokGen_Systemfelder] ADD  CONSTRAINT [DF_DokGen_Systemfelder_intID]  DEFAULT (newsequentialid()) FOR [intID]
GO
ALTER TABLE [dbo].[DokGen_TemplateFolge] ADD  CONSTRAINT [DF_DokGen_TemplateFolge_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[DokGen_User] ADD  CONSTRAINT [DF_DokGen_User_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[DokGen_Vorlagen] ADD  CONSTRAINT [DF_DokGen_Vorlagen_intID]  DEFAULT (newsequentialid()) FOR [intID]
GO
ALTER TABLE [dbo].[DokGen_Vorlagen_Filler] ADD  CONSTRAINT [DF_DokGen_Vorlagen_Filler_intID]  DEFAULT (newsequentialid()) FOR [intID]
GO
ALTER TABLE [dbo].[DokGen_Vorlagen_Fusszeilen_Global] ADD  CONSTRAINT [DF_DokGen_Vorlagen_Fusszeilen_Global_intID]  DEFAULT (newsequentialid()) FOR [intID]
GO
ALTER TABLE [dbo].[DokGen_Vorlagen_Fusszeilen_Global] ADD  CONSTRAINT [MSmerge_df_rowguid_86340178EFE54958A0A4530EFF541DBB]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[DokGen_Vorlagen_Fusszeilen_Standort] ADD  CONSTRAINT [DF_DokGen_Vorlagen_Fusszeilen_Standort_intID]  DEFAULT (newsequentialid()) FOR [intID]
GO
ALTER TABLE [dbo].[DokGen_Vorlagen_Kopfzeile] ADD  CONSTRAINT [DF_DokGen_Vorlagen_Kopfzeile_intID]  DEFAULT (newsequentialid()) FOR [intID]
GO
ALTER TABLE [dbo].[DokGen_Vorlagen_UserFields] ADD  CONSTRAINT [DF_DokGen_Vorlagen_UserFields_intID]  DEFAULT (newsequentialid()) FOR [intID]
GO
ALTER TABLE [dbo].[DokGen_Zugriffsrolle_Dokgruppe_Mitarbeiter] ADD  CONSTRAINT [DF_DokGen_Zugriffsrolle_Dokgruppe_Mitarbeiter_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[DokGen_Zugriffsrollen] ADD  CONSTRAINT [DF_DokGen_Zugriffsrollen_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Einheiten] ADD  CONSTRAINT [DF_Einheiten_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Einheiten] ADD  CONSTRAINT [DF_Einheiten_Sprache]  DEFAULT ((1)) FOR [Sprache]
GO
ALTER TABLE [dbo].[ErrorQueue] ADD  CONSTRAINT [DF__ErrorQueue__ID__73852659]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ErrorQueue] ADD  CONSTRAINT [DF_ErrorQueue_ErrorQueuedAt]  DEFAULT (getdate()) FOR [ErrorQueuedAt]
GO
ALTER TABLE [dbo].[ErrorQueue] ADD  CONSTRAINT [DF_ErrorQueue_ErrorQueue]  DEFAULT ((0)) FOR [Count]
GO
ALTER TABLE [dbo].[ErrorQueue] ADD  CONSTRAINT [DF_ErrorQueue_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[FactSheetTool_FreigabeUebersicht] ADD  CONSTRAINT [DF__FactSheetToo__ID__3B43CC98]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[FactSheetTool_Skilluebersicht] ADD  CONSTRAINT [DF__FactSheetToo__ID__3E203943]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[FactSheetTool_UserDokumente] ADD  CONSTRAINT [DF_FactSheetTool_UserDokumente_intID]  DEFAULT (newsequentialid()) FOR [intID]
GO
ALTER TABLE [dbo].[Faehigkeit_Beschreibung] ADD  CONSTRAINT [DF_Faehigkeit_Beschreibung_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[Faehigkeit_Beschreibung] ADD  CONSTRAINT [DF_Faehigkeit_Beschreibung_Beschreibung]  DEFAULT ('') FOR [Beschreibung]
GO
ALTER TABLE [dbo].[Faehigkeit_Bewertungsgruppe] ADD  CONSTRAINT [DF_Faehigkeit_Bewertungsgruppe_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Faehigkeit_falsch] ADD  CONSTRAINT [DF_Faehigkeit_falsch_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Faehigkeit_falsch] ADD  CONSTRAINT [DF_Faehigkeit_falsch_SAP_mode]  DEFAULT ((0)) FOR [SAP_mode]
GO
ALTER TABLE [dbo].[Faehigkeiten] ADD  CONSTRAINT [DF_Faehigkeiten_Gruppen_ID]  DEFAULT ((0)) FOR [Gruppen_ID]
GO
ALTER TABLE [dbo].[Faehigkeiten] ADD  CONSTRAINT [DF_Faehigkeiten_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Faehigkeiten] ADD  CONSTRAINT [DF_Faehigkeiten_Prioritaet]  DEFAULT ('.....') FOR [Prioritaet]
GO
ALTER TABLE [dbo].[Faehigkeiten] ADD  CONSTRAINT [DF_Faehigkeiten_Erstellungsdatum]  DEFAULT (getdate()) FOR [Erstellungsdatum]
GO
ALTER TABLE [dbo].[Faehigkeiten] ADD  CONSTRAINT [DF_Faehigkeiten_Bewertungsgruppe]  DEFAULT ((1)) FOR [Bewertungsgruppe]
GO
ALTER TABLE [dbo].[Faehigkeiten] ADD  CONSTRAINT [DF_Faehigkeiten_gelöscht]  DEFAULT ((0)) FOR [gelöscht]
GO
ALTER TABLE [dbo].[Fehlerprotokoll] ADD  CONSTRAINT [DF_Fehlerprotokoll_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[Fehlerprotokoll] ADD  CONSTRAINT [DF_Fehlerprotokoll_datum]  DEFAULT (getdate()) FOR [datum]
GO
ALTER TABLE [dbo].[Fgruppe] ADD  CONSTRAINT [DF__Fgruppe__rowguid__0BE6BFCF]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Fgruppe] ADD  CONSTRAINT [DF__Fgruppe__Skillsc__4E4A4731]  DEFAULT ((1)) FOR [Skillscan]
GO
ALTER TABLE [dbo].[Fgruppe] ADD  CONSTRAINT [DF__Fgruppe__Webskil__36C400A1]  DEFAULT ((0)) FOR [Webskill]
GO
ALTER TABLE [dbo].[Fgruppe] ADD  CONSTRAINT [DF_Fgruppe_Mainskill]  DEFAULT ((0)) FOR [Mainskill]
GO
ALTER TABLE [dbo].[Fgruppe_Beschreibung] ADD  CONSTRAINT [DF_Fgruppe_Beschreibung_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[Firma] ADD  CONSTRAINT [DF_Firmen2_firmen_id]  DEFAULT (newsequentialid()) FOR [firmen_id]
GO
ALTER TABLE [dbo].[Firma] ADD  CONSTRAINT [DF__Firma__Kreditref__3AC9CD79]  DEFAULT ((0)) FOR [Kreditreform]
GO
ALTER TABLE [dbo].[Firma] ADD  CONSTRAINT [DF_Firma_Public Sector]  DEFAULT ((0)) FOR [Public_Sector]
GO
ALTER TABLE [dbo].[Firma] ADD  CONSTRAINT [DF_Firma_Freigabe_MassenVV]  DEFAULT ((0)) FOR [Freigabe_MassenVV]
GO
ALTER TABLE [dbo].[Firma] ADD  CONSTRAINT [DF__Firma__Startup__10833883]  DEFAULT ((0)) FOR [Startup]
GO
ALTER TABLE [dbo].[Firma] ADD  CONSTRAINT [DF_Firma_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Firma] ADD  CONSTRAINT [DF_Firma_MDMDeleted]  DEFAULT ((0)) FOR [MDMDeleted]
GO
ALTER TABLE [dbo].[Firmen_Emergency_Info] ADD  CONSTRAINT [DF_Firmen_Emergency_Info_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Firmen_HPScan] ADD  CONSTRAINT [DF_Firmen_HPScan_Firmen_HPScan_ID]  DEFAULT (newsequentialid()) FOR [Firmen_HPScan_ID]
GO
ALTER TABLE [dbo].[Firmen_HPScan] ADD  CONSTRAINT [DF_Firmen_HPScan_Scan]  DEFAULT ((0)) FOR [Scan]
GO
ALTER TABLE [dbo].[Firmen_MSP] ADD  CONSTRAINT [DF_Firmen_MSP_Firmen_MSP_ID]  DEFAULT (newsequentialid()) FOR [Firmen_MSP_ID]
GO
ALTER TABLE [dbo].[Firmen_MSP] ADD  CONSTRAINT [DF_Firmen_MSP_Tagessatzdeckelung]  DEFAULT ((0)) FOR [Tagessatzdeckelung]
GO
ALTER TABLE [dbo].[Firmen_MSP] ADD  CONSTRAINT [DF_Firmen_MSP_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[Firmen_MSP] ADD  CONSTRAINT [DF_Firmen_MSP_geaendert_am]  DEFAULT (getdate()) FOR [geaendert_am]
GO
ALTER TABLE [dbo].[Firmen_MSP] ADD  CONSTRAINT [DF_Firmen_MSP_Charge]  DEFAULT ((0)) FOR [Charge]
GO
ALTER TABLE [dbo].[Firmen_MSP] ADD  CONSTRAINT [DF_Firmen_MSP_Charge_Einheit]  DEFAULT ((0)) FOR [Charge_Einheit]
GO
ALTER TABLE [dbo].[Firmen_MSP] ADD  CONSTRAINT [DF_Firmen_MSP_Fee_Bezug]  DEFAULT ((0)) FOR [Fee_Bezug]
GO
ALTER TABLE [dbo].[Firmen_MSP_Zahlungsziele] ADD  CONSTRAINT [DF_Firmen_MSP_Zahlungsziele_Firmen_MSP_Zahlungsziele_ID]  DEFAULT (newsequentialid()) FOR [Firmen_MSP_Zahlungsziele_ID]
GO
ALTER TABLE [dbo].[Firmen_MSP_Zahlungsziele] ADD  CONSTRAINT [DF_Firmen_MSP_Zahlungsziele_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[Firmen_MSP_Zahlungsziele] ADD  CONSTRAINT [DF_Firmen_MSP_Zahlungsziele_geaendert_am]  DEFAULT (getdate()) FOR [geaendert_am]
GO
ALTER TABLE [dbo].[firmen_rechtebereiche] ADD  CONSTRAINT [DF_Zuordnung_firmen_Teams_ID]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[firmen_rechtebereiche] ADD  CONSTRAINT [DF_Zuordnung_firmen_Teams_zugeordnet_am]  DEFAULT (getdate()) FOR [zugeordnet_am]
GO
ALTER TABLE [dbo].[Firmenkontakt] ADD  CONSTRAINT [DF_Firmenkontakt_Kontakt_ID]  DEFAULT (newsequentialid()) FOR [Kontakt_ID]
GO
ALTER TABLE [dbo].[Firmenkontakt] ADD  CONSTRAINT [DF_firmenkontakt_Datum]  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF_Firma_Adress_id]  DEFAULT (newsequentialid()) FOR [standort_id]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF_Firma_Erstellungsdatum]  DEFAULT (getdate()) FOR [Erstellungsdatum]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF__Firmensta__Expro__4FFB8B37]  DEFAULT ((0)) FOR [Exprojektkunde]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF__Firmensta__ExSAP__015EA7F8]  DEFAULT ((0)) FOR [ExSAP]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF__Firmensta__Aktiv__0AB30808]  DEFAULT ((0)) FOR [AktivSAP]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF_Firmenstandort_PlanSAP]  DEFAULT ((0)) FOR [PlanSAP]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF_Firmenstandort_BRTV_ID]  DEFAULT ((6)) FOR [BRTV_ID]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF_Firmenstandort_BRTV_QS]  DEFAULT ((0)) FOR [BRTV_QS]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF_Firmenstandort_HUeD]  DEFAULT ((-1)) FOR [HUeD]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF_Firmenstandort_UseEqualPay]  DEFAULT ((3)) FOR [UseEqualPay]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF_Firmenstandort_EqualPay]  DEFAULT ((-1)) FOR [EqualPay]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF_Firmenstandort_AUeG_QS]  DEFAULT ((0)) FOR [AUeG_QS]
GO
ALTER TABLE [dbo].[Firmenstandort] ADD  CONSTRAINT [DF_Firmenstandort_MDMDeleted]  DEFAULT ((0)) FOR [MDMDeleted]
GO
ALTER TABLE [dbo].[FirmenStandortXProspectXhelpcode_Digitale_Merkmale] ADD  CONSTRAINT [DF_FirmenStandortXProspectXhelpcode_Digitale_Merkmale_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[FirmenStandortXProspectXhelpcode_Digitale_Merkmale] ADD  CONSTRAINT [DF_FirmenStandortXProspectXhelpcode_Digitale_Merkmale_ErstelltAm]  DEFAULT (getdate()) FOR [ErstelltAm]
GO
ALTER TABLE [dbo].[Grosskunden] ADD  CONSTRAINT [DF_Grosskunden_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_auspraegung] ADD  CONSTRAINT [DF_helpcode_auspraegung_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Helpcode_Branche] ADD  CONSTRAINT [DF_Helpcode_Branche_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_Branche_Bezeichnung] ADD  CONSTRAINT [DF_helpcode_Branche_Bezeichnung_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[helpcode_Branche_Gruppe] ADD  CONSTRAINT [DF_helpcode_Branche_Gruppe_Branche_Gruppe_ID]  DEFAULT (newsequentialid()) FOR [Branche_Gruppe_ID]
GO
ALTER TABLE [dbo].[helpcode_Branche_Gruppe_Bezeichnung] ADD  CONSTRAINT [DF_helpcode_Branche_Gruppe_Bezeichnung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_Branche_Obergruppe] ADD  CONSTRAINT [DF_helpcode_Branche_Obergruppe_Branche_Obergruppe_ID]  DEFAULT (newsequentialid()) FOR [Branche_Obergruppe_ID]
GO
ALTER TABLE [dbo].[helpcode_Branche_Obergruppe_Bezeichnung] ADD  CONSTRAINT [DF_helpcode_Branche_Obergruppe_Bezeichnung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_Branche_Oberobergruppe] ADD  CONSTRAINT [DF_helpcode_Branche_Oberobergruppe_Branche_Oberobergruppe_ID]  DEFAULT (newsequentialid()) FOR [Branche_Oberobergruppe_ID]
GO
ALTER TABLE [dbo].[helpcode_Branche_Oberobergruppe_Bezeichnung] ADD  CONSTRAINT [DF_helpcode_Branche_Oberobergruppe_Bezeichnung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_BranchenTarifvertrag] ADD  CONSTRAINT [DF_helpcode_BranchenTarifvertrag_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[helpcode_BranchenTarifvertrag_Description] ADD  CONSTRAINT [DF_helpcode_BranchenTarifvertrag_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[helpcode_BranchenTarifvertrag_Description] ADD  CONSTRAINT [DF_helpcode_BranchenTarifvertrag_Description_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[helpcode_BranchenTarifvertrag_keine_Anwendung] ADD  CONSTRAINT [DF_helpcode_BranchenTarifvertrag_keine_Anwendung_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[helpcode_BranchenTarifvertrag_keine_Anwendung_Description] ADD  CONSTRAINT [DF_helpcode_BranchenTarifvertrag_keine_Anwendung_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[helpcode_BranchenTarifvertrag_keine_Anwendung_Description] ADD  CONSTRAINT [DF_helpcode_BranchenTarifvertrag_keine_Anwendung_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_Bundesland] ADD  CONSTRAINT [DF_helpcode_bundeslaender_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[helpcode_Bundesland_Bezeichnung] ADD  CONSTRAINT [DF_helpcode_Bundesland_Bezeichnung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_Bundesland_Bezeichnung] ADD  CONSTRAINT [MSmerge_df_rowguid_CA2D37BB444B41C4ACE578E02272FE37]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_CoMerkmal] ADD  CONSTRAINT [DF_helpcode_CoMerkmal_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[helpcode_CoMerkmal] ADD  CONSTRAINT [DF_helpcode_CoMerkmal_Erstellt_am]  DEFAULT (getdate()) FOR [Erstellt_am]
GO
ALTER TABLE [dbo].[helpcode_CoMerkmal_Bezeichnung] ADD  CONSTRAINT [DF_helpcode_CoMerkmal_Bezeichnung_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[helpcode_CoMerkmal_Bezeichnung] ADD  CONSTRAINT [DF_helpcode_CoMerkmal_Bezeichnung_Erstellt_am]  DEFAULT (getdate()) FOR [Erstellt_am]
GO
ALTER TABLE [dbo].[helpcode_Crefo] ADD  CONSTRAINT [DF_helpcode_Crefo_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_Crefo_Description] ADD  CONSTRAINT [DF_helpcode_Crefo_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[helpcode_Crefo_Description] ADD  CONSTRAINT [DF_helpcode_Crefo_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_CT_BeratungsKontaktart] ADD  CONSTRAINT [DF_helpcode_CT_Kontaktarten_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_CT_Beratungsmodul] ADD  CONSTRAINT [DF_helpcode_CT_Beratung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_CT_Beratungsmodul] ADD  CONSTRAINT [DF_helpcode_CT_Beratungsmodul_Sort_ID]  DEFAULT ((0)) FOR [Sort_ID]
GO
ALTER TABLE [dbo].[helpcode_CT_Programm] ADD  CONSTRAINT [DF_helpcode_CT_Programm_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_CT_Vermittlungsart] ADD  CONSTRAINT [DF_helpcode_CT_Vermittlung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_CT_Vermittlungsart] ADD  CONSTRAINT [DF_helpcode_CT_Vermittlungsarten_Sort_ID]  DEFAULT ((0)) FOR [Sort_ID]
GO
ALTER TABLE [dbo].[helpcode_CT_Vermittlungskanal] ADD  CONSTRAINT [DF_helpcode_CT_Vermittlungskanal_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_CT_Vermittlungskanal] ADD  CONSTRAINT [DF_helpcode_CT_Vermittlungskanal_Sort_ID]  DEFAULT ((0)) FOR [Sort_ID]
GO
ALTER TABLE [dbo].[helpcode_CT_VermittlungsKontaktart] ADD  CONSTRAINT [DF_helpcode_CT_VermittlungsKontaktart_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_Digitale_Merkmale] ADD  CONSTRAINT [DF_helpcode_Digitale_Merkmale_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[helpcode_Digitale_Merkmale_Description] ADD  CONSTRAINT [DF_helpcode_Digitale_Merkmale_Description_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[helpcode_entgeltgruppe] ADD  CONSTRAINT [DF_helpcode_entgeltgruppe_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_entgeltgruppe] ADD  CONSTRAINT [DF_helpcode_entgeltgruppe_Entgelttabelle_ID]  DEFAULT ((1)) FOR [Entgelttabelle_ID]
GO
ALTER TABLE [dbo].[helpcode_entgeltgruppe_Description] ADD  CONSTRAINT [DF_helpcode_entgeltgruppe_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[helpcode_entgeltgruppe_Description] ADD  CONSTRAINT [DF_helpcode_entgeltgruppe_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_Entgelttabelle] ADD  CONSTRAINT [DF_helpcode_Entgelttabelle_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[helpcode_Erstkontakt_Bezeichnung] ADD  CONSTRAINT [DF_helpcode_Erstkontakt_Bezeichnung_id]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_Erstkontakt_Gruppen] ADD  CONSTRAINT [DF_helpcode_Erstkontakt_Gruppen_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Helpcode_erstkontaktart] ADD  CONSTRAINT [DF_Helpcode_erstkontaktart_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Helpcode_erstkontaktart] ADD  CONSTRAINT [DF_helpcode_Erstkontaktart_im_web]  DEFAULT ((0)) FOR [im_web]
GO
ALTER TABLE [dbo].[Helpcode_erstkontaktart] ADD  CONSTRAINT [DF__Helpcode___inakt__5F415B88]  DEFAULT ((0)) FOR [inaktiv]
GO
ALTER TABLE [dbo].[Helpcode_erstkontaktart] ADD  CONSTRAINT [DF_Helpcode_erstkontaktart_ErstelltAm]  DEFAULT (getdate()) FOR [ErstelltAm]
GO
ALTER TABLE [dbo].[helpcode_Fachschwerpunkt] ADD  CONSTRAINT [DF_helpcode_Fachschwerpunkt_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_familienstand] ADD  CONSTRAINT [DF_helpcode_familienstand_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_Familienstand_Bezeichnung] ADD  CONSTRAINT [DF_helpcode_Familienstand_Bezeichnung_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_geschlecht] ADD  CONSTRAINT [DF_helpcode_geschlecht_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_geschlecht_bezeichnung] ADD  CONSTRAINT [DF_helpcode_geschlecht_bezeichnung_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[helpcode_geschlecht_bezeichnung] ADD  CONSTRAINT [DF_helpcode_geschlecht_bezeichnung_sprach_id]  DEFAULT ((1)) FOR [sprach_id]
GO
ALTER TABLE [dbo].[Helpcode_jobboerse] ADD  CONSTRAINT [DF_Helpcode_jobboerse_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_kundenstatus] ADD  CONSTRAINT [DF_helpcode_kundenstatus_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_land] ADD  CONSTRAINT [DF_helpcodelaender_bfd]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[helpcode_land] ADD  CONSTRAINT [DF_helpcode_land_EU17]  DEFAULT ((0)) FOR [EU17]
GO
ALTER TABLE [dbo].[helpcode_land] ADD  CONSTRAINT [DF_helpcode_land_EU8]  DEFAULT ((0)) FOR [EU8]
GO
ALTER TABLE [dbo].[helpcode_land_beschreibung] ADD  CONSTRAINT [DF_helpcode_land_beschreibung_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[helpcode_leadstatus_kunde] ADD  CONSTRAINT [DF_helpcode_leadstatus_kunde_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_leadstatus_kunde_description] ADD  CONSTRAINT [DF_helpcode_leadstatus_kunde_description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[helpcode_leadstatus_kunde_description] ADD  CONSTRAINT [DF_helpcode_leadstatus_kunde_description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_leitsatz] ADD  CONSTRAINT [DF_helpcode_leitsatz_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_leitsatz] ADD  CONSTRAINT [DF_helpcode_leitsatz_geaendert_am]  DEFAULT (getdate()) FOR [geaendert_am]
GO
ALTER TABLE [dbo].[helpcode_LI_Recruiter] ADD  CONSTRAINT [DF_helpcode_LI_Recruiter_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_LI_Recruiter] ADD  CONSTRAINT [MSmerge_df_rowguid_DB305164BFD844C5BF29C4CC8AE6E96F]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_Mitarbeiter_Kategorie] ADD  CONSTRAINT [DF_helpcode_Mitarbeiter_Kategorie_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Helpcode_mitarbeiterstatus] ADD  CONSTRAINT [DF_Helpcode_mitarbeiterstatus_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Helpcode_mitarbeiterstatus_Description] ADD  CONSTRAINT [DF_Helpcode_mitarbeiterstatus_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[Helpcode_mitarbeiterstatus_Description] ADD  CONSTRAINT [DF_Helpcode_mitarbeiterstatus_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_mitarbeiterterminstatus] ADD  CONSTRAINT [DF_helpcode_mitarbeiterterminstatus_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_monate] ADD  CONSTRAINT [DF_helpcode_monate_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[helpcode_monate] ADD  CONSTRAINT [DF_helpcode_monate_sprach_id]  DEFAULT ((1)) FOR [sprach_id]
GO
ALTER TABLE [dbo].[helpcode_pb_mitarbeiterkontakttyp] ADD  CONSTRAINT [DF_helpcode_pb_mitarbeiterkontakttyp_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_pcpstatus] ADD  CONSTRAINT [DF__helpcode___rowgu__1AA08A28]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_pcpstatus_Description] ADD  CONSTRAINT [DF_helpcode_pcpstatus_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[helpcode_pcpstatus_Description] ADD  CONSTRAINT [DF_helpcode_pcpstatus_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_plz_ort] ADD  CONSTRAINT [DF_helpcode_plz_ort_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_postleitzahl] ADD  CONSTRAINT [DF_helpcode_postleitzahl_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[helpcode_postleitzahl_bezeichnung] ADD  CONSTRAINT [DF_helpocde_postleitzahl_bezeichnung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_prospect_absagestatus] ADD  CONSTRAINT [DF_helpcode_prospect_absagestatus_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_prospect_absagestatus_Description] ADD  CONSTRAINT [DF_helpcode_prospect_absagestatus_Description_RowGuId]  DEFAULT (newsequentialid()) FOR [RowGuId]
GO
ALTER TABLE [dbo].[helpcode_prospect_absagestatus_Description] ADD  CONSTRAINT [DF_helpcode_prospect_absagestatus_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_Prospect_Anstellungsart] ADD  CONSTRAINT [DF_helpcode_Prospect_Anstellungsart_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_Prospect_Anstellungsart_Beschreibung] ADD  CONSTRAINT [DF_helpcode_Prospect_Anstellungsart_Bezeichnung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_Prospect_Anstellungsart_Matrix] ADD  CONSTRAINT [DF_helpcode_Prospect_Anstellungsart_Matrix_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Helpcode_Prospect_Direktbesetzungsauftrag] ADD  CONSTRAINT [DF_Helpcode_Direktbesetzungsauftrag_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Helpcode_Prospect_Direktbesetzungsauftrag_Description] ADD  CONSTRAINT [DF_Helpcode_Prospect_Direktbesetzungsauftrag_Description_RowGuId]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[Helpcode_Prospect_Direktbesetzungsauftrag_Description] ADD  CONSTRAINT [DF_Helpcode_Prospect_Direktbesetzungsauftrag_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_Prospect_Kategorisierung] ADD  CONSTRAINT [DF_helpcode_Prospect_Kategorisierung_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_prospectmitarbeiterstatus] ADD  CONSTRAINT [DF_helpcode_prospectmitarbeiterstatus_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_prospectmitarbeiterstatus_Description] ADD  CONSTRAINT [DF_helpcode_prospectmitarbeiterstatus_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[helpcode_prospectmitarbeiterstatus_Description] ADD  CONSTRAINT [DF_helpcode_prospectmitarbeiterstatus_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_prospectpriority] ADD  CONSTRAINT [DF_helpcode_prospectpriority_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_prospectpriority_Description] ADD  CONSTRAINT [DF_helpcode_prospectpriority_Description_RowGuId]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[helpcode_prospectpriority_Description] ADD  CONSTRAINT [DF_helpcode_prospectpriority_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_prospectstatus] ADD  CONSTRAINT [DF_helpcode_prospectstatus_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_ProspectStatus_Description] ADD  CONSTRAINT [DF_helpcode_ProspectStatus_Description_RowGuId]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[helpcode_ProspectStatus_Description] ADD  CONSTRAINT [DF_helpcode_ProspectStatus_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_Rahmenvertraege] ADD  CONSTRAINT [DF_helpcode_Rahmenvertraege_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_region] ADD  CONSTRAINT [DF_help_code_region_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_SAP_Mitarbeiterkreis] ADD  CONSTRAINT [DF_helpcode_SAP_Mitarbeiterkreis_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_SAP_PersonalBereiche] ADD  CONSTRAINT [DF_helpcode_SAP_Personalbereiche_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_SAP_PersonalBereiche] ADD  CONSTRAINT [DF_helpcode_SAP_PersonalBereiche_Aktiv]  DEFAULT ((1)) FOR [Aktiv]
GO
ALTER TABLE [dbo].[helpcode_SAP_PersonalBereichMatrix] ADD  CONSTRAINT [DF_helpcode_SAP_PersBereichMatrix_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_SAP_PersonalTeilBereich] ADD  CONSTRAINT [DF_helpcode_SAP_Personaltteilbereich_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_SAP_Sprachschluessel] ADD  CONSTRAINT [MSmerge_df_rowguid_4545D484AD734C5AB389BB9B8BC460B6]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_SAP_Zivilstand_CH] ADD  CONSTRAINT [DF_helpcode_SAP_Zivilstand_CH_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_SAPRegion] ADD  CONSTRAINT [DF_helpcode_SAPRegion_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_skillsetzart] ADD  CONSTRAINT [DF_helpcode_skillsetzart_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_Sonderregelung] ADD  CONSTRAINT [DF_helpcode_Sonderregelung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_Sonderregelung] ADD  CONSTRAINT [DF_helpcode_Sonderregelung_inaktiv]  DEFAULT ((0)) FOR [inaktiv]
GO
ALTER TABLE [dbo].[helpcode_sortierungstyp] ADD  CONSTRAINT [DF_helpcode_sortierungstyp_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_Sortierungstyp_Description] ADD  CONSTRAINT [DF_dbo_helpcode_Sortierungstyp_Description_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[helpcode_Sortierungstyp_Description] ADD  CONSTRAINT [DF_dbo_helpcode_Sortierungstyp_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_sprachen] ADD  CONSTRAINT [DF_helpcode_sprachen_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[helpcode_sprachen_Description] ADD  CONSTRAINT [DF_helpcode_sprachen_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[helpcode_sprachen_Description] ADD  CONSTRAINT [DF_helpcode_sprachen_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Helpcode_Standort] ADD  CONSTRAINT [DF_Helpcode_Standort_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Helpcode_textbaustein] ADD  CONSTRAINT [DF_HelpCodeText_Bausteine_VorlagenNr]  DEFAULT ((0)) FOR [VorlagenNr]
GO
ALTER TABLE [dbo].[Helpcode_textbaustein] ADD  CONSTRAINT [DF_Helpcode_textbaustein_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Helpcode_textbaustein] ADD  CONSTRAINT [DF_Helpcode_textbaustein_geaendert_am]  DEFAULT (getdate()) FOR [geaendert_am]
GO
ALTER TABLE [dbo].[helpcode_titel] ADD  CONSTRAINT [DF_helpcode_titel_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_titel_beschreibung] ADD  CONSTRAINT [DF_helpcode_titel_beschreibung_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[helpcode_tracking_domainGruppen] ADD  CONSTRAINT [DF_tracking_domainGruppen_tracking_domainGruppenID]  DEFAULT (newsequentialid()) FOR [tracking_domainGruppenID]
GO
ALTER TABLE [dbo].[helpcode_tracking_domainGruppen] ADD  CONSTRAINT [DF_helpcode_tracking_domainGruppen_tracking_domainGruppenIgnorieren]  DEFAULT ((0)) FOR [tracking_domainGruppenIgnorieren]
GO
ALTER TABLE [dbo].[helpcode_tracking_domainGruppen] ADD  CONSTRAINT [MSmerge_df_rowguid_E7A8A249544544DBBDA57FD520E63B61]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_tracking_domainTypen] ADD  CONSTRAINT [DF_helpcode_tracking_domainTypen_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_uebergabekunde] ADD  CONSTRAINT [DF_helpcode_uebergabekunde_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_user_parameter] ADD  CONSTRAINT [DF_helpcode_user_parameter_id]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_user_parameter_typ] ADD  CONSTRAINT [DF_helpcode_user_parameter_typ_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Helpcode_verfuegbarkeitsarten] ADD  CONSTRAINT [DF_Helpcode_verfuegbarkeitsarten_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Helpcode_verfuegbarkeitsarten_Description] ADD  CONSTRAINT [DF_Helpcode_verfuegbarkeitsarten_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[Helpcode_verfuegbarkeitsarten_Description] ADD  CONSTRAINT [DF_Helpcode_verfuegbarkeitsarten_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[helpcode_vorlaeufige_Mitarbeiter_Kategorie] ADD  CONSTRAINT [DF_helpcode_vorlaeufige_Mitarbeiter_Kategorie_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_zahlungsziel_zuordnung] ADD  CONSTRAINT [DF_helpcode_zahlungsziel_zuordnung_ID_1]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_zahlungsziel_zuordnung_Beschreibung] ADD  CONSTRAINT [DF_helpcode_zahlungsziel_zuordnung_Beschreibung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_Zahlungsziele] ADD  CONSTRAINT [DF_helpcode_Zahlungsziele_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[helpcode_Zahlungsziele] ADD  CONSTRAINT [DF__helpcode___Defau__392CE935]  DEFAULT ((0)) FOR [Default]
GO
ALTER TABLE [dbo].[helpcode_zahlungsziele_beschreibung] ADD  CONSTRAINT [DF_helpcode_zahlungsziele_beschreibung_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[helpcode_zielposition] ADD  CONSTRAINT [DF_helpcode_zielposition_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[helpcode_zugriffsrollen_Bereich] ADD  CONSTRAINT [DF__helpcode___rowgu__2D6B0E51]  DEFAULT (newsequentialid()) FOR [rowguid4]
GO
ALTER TABLE [dbo].[helpcode_zugriffsrollen_Bereich] ADD  CONSTRAINT [DF__helpcode___SAPID__37E33AFE]  DEFAULT ('*') FOR [SAPID]
GO
ALTER TABLE [dbo].[helpcode_zugriffsrollen_Bereich] ADD  CONSTRAINT [DF__helpcode___SAP_B__5FBC222E]  DEFAULT ('*') FOR [SAP_Bezeichnung]
GO
ALTER TABLE [dbo].[helpcode_zugriffsrollen_Geschaeftstyp] ADD  CONSTRAINT [DF__helpcode___rowgu__2C76EA18]  DEFAULT (newsequentialid()) FOR [rowguid4]
GO
ALTER TABLE [dbo].[helpcode_zugriffsrollen_zugriffstyp] ADD  CONSTRAINT [DF_helpcode_zugriffsrollen_zugriffstyp_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[HPI_SurveyResults] ADD  CONSTRAINT [DF_tmp_HPI_SurveyResults]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[HPI_SurveyResults] ADD  CONSTRAINT [DF__tmp_ms_HPI_SurveyResults]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ht_Arbeitserlaubniskategorie] ADD  CONSTRAINT [DF_ht_Arbeitserlaubniskategorie_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_Arbeitserlaubniskategorie] ADD  CONSTRAINT [DF_ht_Arbeitserlaubniskategorie_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_Arbeitserlaubniskategorie_Description] ADD  CONSTRAINT [DF_ht_Arbeitserlaubniskategorie_Description_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_Arbeitserlaubniskategorie_Description] ADD  CONSTRAINT [DF_ht_Arbeitserlaubniskategorie_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_ArbeitserlaubnisTyp] ADD  CONSTRAINT [DF_ht_ArbeitserlaubnisTyp_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_ArbeitserlaubnisTyp] ADD  CONSTRAINT [DF_ht_ArbeitserlaubnisTyp_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_Branche_Supergroup] ADD  CONSTRAINT [DF_ht_Branche_Supergroup_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_Branche_Supergroup] ADD  CONSTRAINT [DF_ht_Branche_Supergroup_Erstellt_Am]  DEFAULT (getdate()) FOR [Erstellt_Am]
GO
ALTER TABLE [dbo].[ht_Branche_Supergroup_Description] ADD  CONSTRAINT [DF_ht_Branche_Supergroup_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[ht_Branche_Supergroup_Description] ADD  CONSTRAINT [DF_ht_Branche_Supergroup_Description_CreateDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ht_Branche_Supergroup_Matrix] ADD  CONSTRAINT [DF_ht_Branche_Supergroup_Matrix_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_Branche_Supergroup_Matrix] ADD  CONSTRAINT [DF_ht_Branche_Supergroup_Matrix_Erstellt_Am]  DEFAULT (getdate()) FOR [Erstellt_Am]
GO
ALTER TABLE [dbo].[ht_BusinessUnit] ADD  CONSTRAINT [DF_ht_BusinessUnit_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_BusinessUnit_Description] ADD  CONSTRAINT [DF_ht_BusinessUnit_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_ChangeProtocol_ActionType] ADD  CONSTRAINT [DF_ht_ChangeProtocol_ActionType_ID]  DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_ChangeProtocol_ObjectType] ADD  CONSTRAINT [DF_ht_ChangeProtocol_ObjectType_ID]  DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_Company_legal_form] ADD  CONSTRAINT [DF_ht_Company_legal_form_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_Company_legal_form_Description] ADD  CONSTRAINT [DF_ht_Company_legal_form_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[ht_Company_legal_form_Description] ADD  CONSTRAINT [DF_ht_Company_legal_form_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_ConsentCriminalRecord] ADD  CONSTRAINT [DF_ht_ConsentCriminalRecord_GuidId]  DEFAULT (newsequentialid()) FOR [GuidId]
GO
ALTER TABLE [dbo].[ht_ConsentCriminalRecord] ADD  CONSTRAINT [DF_ht_ConsentCriminalRecord_Description]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_ConsentCriminalRecord_Description] ADD  CONSTRAINT [DF_ht_ConsentCriminalRecord_Description_GuidId]  DEFAULT (newsequentialid()) FOR [GuidId]
GO
ALTER TABLE [dbo].[ht_ConsentCriminalRecord_Description] ADD  CONSTRAINT [DF_ht_ConsentCriminalRecord_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_ContractCultureType] ADD  CONSTRAINT [DF_ht_ContractCultureType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_ContractCultureType] ADD  CONSTRAINT [DF_ht_ContractCultureType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_ContractCultureTypeDescription] ADD  CONSTRAINT [DF_ht_ContractCultureTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_ContractCultureTypeDescription] ADD  CONSTRAINT [DF_ht_ContractCultureTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_CultureType] ADD  CONSTRAINT [DF_ht_CultureType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_CultureType] ADD  CONSTRAINT [DF_ht_CultureType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_CultureTypeDescription] ADD  CONSTRAINT [DF_ht_CultureTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_CultureTypeDescription] ADD  CONSTRAINT [DF_ht_CultureTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_DistributionChannelType] ADD  CONSTRAINT [DF_ht_DistributionChannelType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_DistributionChannelType] ADD  CONSTRAINT [DF_ht_DistributionChannelType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_DistributionChannelTypeDescription] ADD  CONSTRAINT [DF_ht_DistributionChannelTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_DistributionChannelTypeDescription] ADD  CONSTRAINT [DF_ht_DistributionChannelTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_DistributionChannelXCultureTypeXHaysCompanyType] ADD  CONSTRAINT [DF__ht_Distrib__GUID__070425E3]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_DistributionChannelXLand] ADD  CONSTRAINT [DF__ht_Distrib__GUID__023F70C6]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_EntityHierarchy] ADD  CONSTRAINT [DF_ht_EntityHierarchy_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[ht_EntityHierarchy] ADD  CONSTRAINT [DF_ht_EntityHierarchy_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_EntityHierarchyDescription] ADD  CONSTRAINT [DF_ht_ht_EntityHierarchyDescription_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[ht_EntityHierarchyDescription] ADD  CONSTRAINT [DF_ht_ht_EntityHierarchyDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_HaysCompanyType] ADD  CONSTRAINT [DF_ht_HaysCompanyType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_HaysCompanyType] ADD  CONSTRAINT [DF_ht_HaysCompanyType_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ht_HaysCompanyType] ADD  CONSTRAINT [DF_ht_HaysCompanyType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_HaysCompanyTypeDescription] ADD  CONSTRAINT [DF_ht_HaysCompanyTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_HaysCompanyTypeDescription] ADD  CONSTRAINT [DF_ht_HaysCompanyTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_Hoppenstedt] ADD  CONSTRAINT [DF_ht_Hoppenstedt_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_Hoppenstedt] ADD  CONSTRAINT [DF_ht_Hoppenstedt_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[ht_JobfeedOperationalAreaType] ADD  CONSTRAINT [DF_ht_JobfeedOperationalAreaType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_JobfeedOperationalAreaType] ADD  CONSTRAINT [DF_ht_JobfeedOperationalAreaType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_Kundenmanagementbranche] ADD  CONSTRAINT [DF_dbo_ht_Kundenmanagementbranche_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_Kundenmanagementbranche] ADD  CONSTRAINT [DF_dbo_ht_Kundenmanagementbranche_erstellt_am]  DEFAULT (sysdatetime()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[ht_KundenmanagementbrancheBezeichnung] ADD  CONSTRAINT [DF_dbo_ht_KundenmanagementbrancheBezeichnung_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_KundenmanagementbrancheBezeichnung] ADD  CONSTRAINT [DF_dbo_ht_KundenmanagementbrancheBezeichnung_CreationDate]  DEFAULT (sysdatetime()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[ht_Kundenmanagementprioritaet] ADD  CONSTRAINT [DF_dbo_ht_Kundenmanagementprioritaet_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_Kundenmanagementprioritaet] ADD  CONSTRAINT [DF_dbo_ht_Kundenmanagementprioritaet_erstellt_am]  DEFAULT (sysdatetime()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[ht_KundenmanagementprioritaetBezeichnung] ADD  CONSTRAINT [DF_dbo_ht_KundenmanagementprioritaetBezeichnung_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_KundenmanagementprioritaetBezeichnung] ADD  CONSTRAINT [DF_dbo_ht_KundenmanagementprioritaetBezeichnung_CreationDate]  DEFAULT (sysdatetime()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[ht_MdmStatus] ADD  CONSTRAINT [DF_ht_MdmStatus_GUID]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[ht_MdmStatus] ADD  CONSTRAINT [DF_ht_MdmStatus_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_MdmStatus_Description] ADD  CONSTRAINT [DF_ht_MdmStatus_description_GUID]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[ht_MdmStatus_Description] ADD  CONSTRAINT [DF_ht_MdmStatus_description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_NewProsi_Role_Skillgroup_Matrix] ADD  CONSTRAINT [DF_ht_NewProsi_Role_Skillgroup_Matrix_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ht_NewProsi_Role_Skillgroup_Matrix] ADD  CONSTRAINT [DF_ht_NewProsi_Role_Skillgroup_Matrix_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_NG_RightsManagement] ADD  CONSTRAINT [DF_ht_NG_RightsManagement_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ht_NoticePeriod] ADD  CONSTRAINT [DF_ht_NoticePeriod_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[ht_NoticePeriod] ADD  CONSTRAINT [DF_ht_NoticePeriod_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_NoticePeriod_Description] ADD  CONSTRAINT [DF_ht_NoticePeriod_Description_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[ht_NoticePeriod_Description] ADD  CONSTRAINT [DF_ht_NoticePeriod_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_OperationalAreaType] ADD  CONSTRAINT [DF_ht_OperationalAreaType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_OperationalAreaType] ADD  CONSTRAINT [DF_ht_OperationalAreaType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_OperationalAreaTypeDescription] ADD  CONSTRAINT [DF_ht_OperationalAreaTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_OperationalAreaTypeDescription] ADD  CONSTRAINT [DF_ht_OperationalAreaTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_PersonType] ADD  CONSTRAINT [DF_ht_PersonType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_PersonType] ADD  CONSTRAINT [DF_ht_PersonType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_PersonTypeDescription] ADD  CONSTRAINT [DF_ht_PersonTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_PersonTypeDescription] ADD  CONSTRAINT [DF_ht_PersonTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_Placement_Status] ADD  CONSTRAINT [DF_ht_Placement_Status_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_Placement_Status_beschreibung] ADD  CONSTRAINT [DF_ht_Placement_Status_beschreibung_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_PlacementWizard_Pages] ADD  CONSTRAINT [DF__helpcode_ver__ID__39F16786]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_PlacementWizard_Pages] ADD  CONSTRAINT [DF_ht_PlacementWizard_Pages_Internal_Number]  DEFAULT ((1)) FOR [Internal_Number]
GO
ALTER TABLE [dbo].[ht_PlacementXExtPlacement] ADD  CONSTRAINT [DF_ht_PlacementXExtPlacement_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ht_Premium_Company] ADD  CONSTRAINT [DF_ht_Premium_Company_guid]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_Premium_Company] ADD  CONSTRAINT [DF_ht_Premium_Company_Standardwert]  DEFAULT ((0)) FOR [Standardwert]
GO
ALTER TABLE [dbo].[ht_Premium_Company] ADD  CONSTRAINT [DF_ht_Premium_Company_Erstellt_am]  DEFAULT (getdate()) FOR [Erstellt_am]
GO
ALTER TABLE [dbo].[ht_Premium_Company_Beschreibung] ADD  CONSTRAINT [DF_ht_Premium_Company_Beschreibung_guid]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_Premium_Company_Beschreibung] ADD  CONSTRAINT [DF_ht_Premium_Company_Beschreibung_Erstellt_am]  DEFAULT (getdate()) FOR [Erstellt_am]
GO
ALTER TABLE [dbo].[ht_ProspectSourceDescription] ADD  CONSTRAINT [DF_ht_ProspectSourceDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_pt_Team] ADD  CONSTRAINT [DF_ht_pt_TeamGUID]  DEFAULT (newsequentialid()) FOR [TeamGUID]
GO
ALTER TABLE [dbo].[ht_pt_Team] ADD  CONSTRAINT [DF_ht_pt_Team_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_pt_TeamXDistributionChannelType] ADD  CONSTRAINT [DF_ht_pt_TeamXDistributionChannelType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_pt_TeamXDistributionChannelType] ADD  CONSTRAINT [DF_ht_pt_TeamXDistributionChannelType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_pt_TeamXFirma] ADD  CONSTRAINT [DF_ht_pt_TeamXFirma_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_pt_TeamXFirma] ADD  CONSTRAINT [DF_ht_pt_TeamXFirma_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_pt_TeamXNOTVertragsmail] ADD  CONSTRAINT [DF_ht_pt_TeamXNOTVertragsmail_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_pt_TeamXNOTVertragsmail] ADD  CONSTRAINT [DF_ht_pt_TeamXNOTVertragsmail_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_pt_TeamXStandort] ADD  CONSTRAINT [DF_ht_pt_TeamXStandort_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_pt_TeamXStandort] ADD  CONSTRAINT [DF_ht_pt_TeamXStandort_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleAppliedType] ADD  CONSTRAINT [DF_ht_RoleAppliedType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleAppliedType] ADD  CONSTRAINT [DF_ht_RoleAppliedType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleAppliedTypeDescription] ADD  CONSTRAINT [DF_ht_RoleAppliedTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleAppliedTypeDescription] ADD  CONSTRAINT [DF_ht_RoleAppliedTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleCharacteristicType] ADD  CONSTRAINT [DF_ht_RoleCharacteristicType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleCharacteristicType] ADD  CONSTRAINT [DF_ht_RoleCharacteristicType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleCharacteristicTypeDescription] ADD  CONSTRAINT [DF_ht_RoleCharacteristicTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleCharacteristicTypeDescription] ADD  CONSTRAINT [DF_ht_RoleCharacteristicTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleDOSLHCKeywordDescription] ADD  CONSTRAINT [DF_ht_RoleDOHCKeywordDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleDOSLHCKeywordDescription] ADD  CONSTRAINT [DF_ht_RoleDOHCKeywordDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleDOSLHCMap] ADD  CONSTRAINT [DF_ht_RoleDOHCMap_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleDOSLHCMap] ADD  CONSTRAINT [DF_ht_RoleDOHCMap_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleGroupMap] ADD  CONSTRAINT [DF_ht_RoleGroupMap_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleGroupMap] ADD  CONSTRAINT [DF_ht_RoleGroupMap_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleGroupType] ADD  CONSTRAINT [DF_ht_RoleGroupType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleGroupType] ADD  CONSTRAINT [DF_ht_RoleGroupType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleGroupTypeDescription] ADD  CONSTRAINT [DF_ht_RoleGroupTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleGroupTypeDescription] ADD  CONSTRAINT [DF_ht_RoleGroupTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleParameterValueTypeDescription] ADD  CONSTRAINT [DF_ht_RoleParameterValueTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleParameterValueTypeDescription] ADD  CONSTRAINT [DF_ht_RoleParameterValueTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleSearchParameterGroupType] ADD  CONSTRAINT [DF_ht_RoleSearchParameterGroupType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleSearchParameterGroupType] ADD  CONSTRAINT [DF_ht_RoleSearchParameterGroupType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleSearchParameterGroupTypeDescription] ADD  CONSTRAINT [DF_ht_RoleSearchParameterGroupTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleSearchParameterGroupTypeDescription] ADD  CONSTRAINT [DF_ht_RoleSearchParameterGroupTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleSkillGroupMap] ADD  CONSTRAINT [DF_ht_RoleSkillGroupMap_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleSkillGroupMap] ADD  CONSTRAINT [DF_ht_RoleSkillGroupMap_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleType] ADD  CONSTRAINT [DF_ht_RoleType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleType] ADD  CONSTRAINT [DF_ht_RoleType_inactive]  DEFAULT ((0)) FOR [inactive]
GO
ALTER TABLE [dbo].[ht_RoleType] ADD  CONSTRAINT [DF_ht_RoleType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleType] ADD  CONSTRAINT [DF_ht_RoleType_IsHidden]  DEFAULT ((0)) FOR [IsHidden]
GO
ALTER TABLE [dbo].[ht_RoleTypeDescription] ADD  CONSTRAINT [DF_ht_RoleTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleTypeDescription] ADD  CONSTRAINT [DF_ht_RoleTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_RoleTypeSynonymDescription] ADD  CONSTRAINT [DF_ht_RoleTypeSynonymDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_RoleTypeSynonymDescription] ADD  CONSTRAINT [DF_ht_RoleTypeSynonymDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_ServiceLineType] ADD  CONSTRAINT [DF_ht_ServiceLineType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_ServiceLineType] ADD  CONSTRAINT [DF_ht_ServiceLineType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_ServiceLineTypeDescription] ADD  CONSTRAINT [DF_ht_ServiceLineTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_ServiceLineTypeDescription] ADD  CONSTRAINT [DF_ht_ServiceLineTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillAppliedType] ADD  CONSTRAINT [DF_ht_SkillAppliedType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillAppliedType] ADD  CONSTRAINT [DF_ht_SkillAppliedType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillAppliedTypeDescription] ADD  CONSTRAINT [DF_ht_SkillAppliedTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillAppliedTypeDescription] ADD  CONSTRAINT [DF_ht_SkillAppliedTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillCharacteristicType] ADD  CONSTRAINT [DF_ht_SkillCharacteristicType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillCharacteristicType] ADD  CONSTRAINT [DF_ht_SkillCharacteristicType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillCharacteristicTypeDescription] ADD  CONSTRAINT [DF_ht_SkillCharacteristicTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillCharacteristicTypeDescription] ADD  CONSTRAINT [DF_ht_SkillCharacteristicTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillGroupDOMap] ADD  CONSTRAINT [DF_ht_SkillGroupDOMap_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillGroupDOMap] ADD  CONSTRAINT [DF_ht_SkillGroupDOMap_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillGroupMap] ADD  CONSTRAINT [DF_ht_SkillGroupMap_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillGroupMap] ADD  CONSTRAINT [DF_ht_SkillGroupMap_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillGroupType] ADD  CONSTRAINT [DF_ht_SkillGroupType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillGroupType] ADD  CONSTRAINT [DF_ht_SkillGroupType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillGroupTypeDescription] ADD  CONSTRAINT [DF_ht_SkillGroupTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillGroupTypeDescription] ADD  CONSTRAINT [DF_ht_SkillGroupTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillParameterValueTypeDescription] ADD  CONSTRAINT [DF_ht_SkillParameterValueTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillParameterValueTypeDescription] ADD  CONSTRAINT [DF_ht_SkillParameterValueTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillSearchParameterGroupType] ADD  CONSTRAINT [DF_ht_SkillSearchParameterGroupType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillSearchParameterGroupType] ADD  CONSTRAINT [DF_ht_SkillSearchParameterGroupType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillSearchParameterGroupTypeDescription] ADD  CONSTRAINT [DF_ht_SkillSearchParameterGroupTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillSearchParameterGroupTypeDescription] ADD  CONSTRAINT [DF_ht_SkillSearchParameterGroupTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillType] ADD  CONSTRAINT [DF_ht_SkillType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillType] ADD  CONSTRAINT [DF_ht_SkillType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillType] ADD  CONSTRAINT [DF_ht_SkillType_AdministrativeSkill]  DEFAULT ((0)) FOR [AdministrativeSkill]
GO
ALTER TABLE [dbo].[ht_SkillTypeDescription] ADD  CONSTRAINT [DF_ht_SkillTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillTypeDescription] ADD  CONSTRAINT [DF_ht_SkillTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillTypeSynonymDescription] ADD  CONSTRAINT [DF_ht_SkillTypeSynonymDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillTypeSynonymDescription] ADD  CONSTRAINT [DF_ht_SkillTypeSynonymDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillUpperGroupMap] ADD  CONSTRAINT [DF_ht_SkillUpperGroupMap_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillUpperGroupMap] ADD  CONSTRAINT [DF_ht_Sht_SkillUpperGroupMap_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillUpperGroupType] ADD  CONSTRAINT [DF_ht_SkillUpperGroupType_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillUpperGroupType] ADD  CONSTRAINT [DF_ht_SkillUpperGroupType_SkillTab]  DEFAULT ((0)) FOR [SkillTab]
GO
ALTER TABLE [dbo].[ht_SkillUpperGroupType] ADD  CONSTRAINT [DF_ht_SkillUpperGroupType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SkillUpperGroupTypeDescription] ADD  CONSTRAINT [DF_ht_SkillUpperGroupTypeDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_SkillUpperGroupTypeDescription] ADD  CONSTRAINT [DF_ht_SkillUpperGroupTypeDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_SourceOfOpportunity] ADD  CONSTRAINT [DF_ht_SourceOfOpportunity_SourceId]  DEFAULT (newsequentialid()) FOR [SourceId]
GO
ALTER TABLE [dbo].[ht_SourceOfOpportunityDescription] ADD  CONSTRAINT [DF_ht_SourceOfOpportunityDescription_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[ht_SourceOfOpportunityDescription] ADD  CONSTRAINT [DF_ht_SourceOfOpportunityDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_StatusOfOpportunity] ADD  CONSTRAINT [DF_ht_OpportunityStatus_StatusId]  DEFAULT (newsequentialid()) FOR [StatusId]
GO
ALTER TABLE [dbo].[ht_StatusOfOpportunityDescription] ADD  CONSTRAINT [DF_ht_StatusOfOpportunityDescription_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[ht_StatusOfOpportunityDescription] ADD  CONSTRAINT [DF_ht_StatusOfOpportunityDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_Translation_Placement] ADD  CONSTRAINT [DF_ht_Translation_Placement_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_Translation_Placement] ADD  CONSTRAINT [DF_ht_Translation_Placement_CultureID]  DEFAULT ((1)) FOR [CultureType_ID]
GO
ALTER TABLE [dbo].[ht_Translation_PropertyDokGen] ADD  CONSTRAINT [DF_ht_Translation_PropertyDokGen_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_UI_MessageBoxDescription] ADD  CONSTRAINT [DF_ht_UI_MessageBoxDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_UI_MessageBoxDescription] ADD  CONSTRAINT [DF_ht_UI_MessageBoxDescription_Translated]  DEFAULT ((0)) FOR [Translated]
GO
ALTER TABLE [dbo].[ht_UI_TranslationDescription] ADD  CONSTRAINT [DF_ht_UI_TranslationDescription_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_UI_TranslationDescription] ADD  CONSTRAINT [DF_ht_UI_TranslationDescription_Translated]  DEFAULT ((0)) FOR [Translated]
GO
ALTER TABLE [dbo].[ht_VertragsmailBereich] ADD  CONSTRAINT [DF_ht_VertragsmailBereich_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_VertragsmailBereich] ADD  CONSTRAINT [DF_ht_VertragsmailBereich_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_VertragsmailBereich_Description] ADD  CONSTRAINT [DF_ht_VertragsmailBereich_Description_GuId]  DEFAULT (newid()) FOR [GuId]
GO
ALTER TABLE [dbo].[ht_VertragsmailBereich_Description] ADD  CONSTRAINT [DF_ht_VertragsmailBereich_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_VertragsmailXDokGen_Vorlagen] ADD  CONSTRAINT [DF_ht_VertragsmailXDokGen_Vorlagen_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ht_VertragsmailXDokGen_Vorlagen] ADD  CONSTRAINT [DF_ht_VertragsmailXDokGen_Vorlagen_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ht_VertragsmailXDokGen_Vorlagen] ADD  CONSTRAINT [DF_ht_VertragsmailXDokGen_Vorlagen_GenerateContract]  DEFAULT ((0)) FOR [GenerateContract]
GO
ALTER TABLE [dbo].[ht_Zuordnung_PLZ_Niederlassung] ADD  CONSTRAINT [DF__ht_Zuordn__ROWGU__722EC5B9]  DEFAULT (newsequentialid()) FOR [ROWGUID]
GO
ALTER TABLE [dbo].[ht_Zuordnung_PLZ_Niederlassung] ADD  CONSTRAINT [DF__ht_Zuordn__Erste__7322E9F2]  DEFAULT (getdate()) FOR [ErstelltAm]
GO
ALTER TABLE [dbo].[HTS_Service] ADD  CONSTRAINT [DF_HTS_Service_HTS_ID]  DEFAULT (newsequentialid()) FOR [HTS_ID]
GO
ALTER TABLE [dbo].[Import_SM2PVS_Fields] ADD  CONSTRAINT [DF_Import_SM2PVS_Fields_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Import_SM2PVS_Host] ADD  CONSTRAINT [DF_Import_SM2PVS_Host_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[IR_Bewerbung] ADD  CONSTRAINT [DF_IR_Bewerbung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[IR_Position] ADD  CONSTRAINT [DF_IR_Position_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[IR_Position] ADD  CONSTRAINT [DF_IR_Position_PB_Standort_ID]  DEFAULT (NULL) FOR [PB_Standort_ID]
GO
ALTER TABLE [dbo].[IR_PositionStandort] ADD  CONSTRAINT [DF_IR_PositionStandorte_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[IR_Prozess] ADD  CONSTRAINT [DF_IR_Prozess_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[IR_ProzessNotizen] ADD  CONSTRAINT [DF_IR_ProzessNotizen_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[IR_ProzessStatus] ADD  CONSTRAINT [DF_IR_ProzessStatus_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[IR_ProzessStatus] ADD  CONSTRAINT [DF_IR_ProzessStatus_IstEndStatus]  DEFAULT ((0)) FOR [IstEndStatus]
GO
ALTER TABLE [dbo].[IR_ProzessStatus_Bezeichnung] ADD  CONSTRAINT [DF_IR_ProzessStatus_Bezeichnung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[IR_ProzessTeilnehmer] ADD  CONSTRAINT [DF_IR_ProzessTeilnehmer_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[JB_Jobboersenzuordnung_HaysFirma] ADD  CONSTRAINT [DF_JB_Jobboersenzuordnung_HaysFirma_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[JB_Kontingente] ADD  CONSTRAINT [DF_JB_Kontingente_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[JB_Kontingente_Verbrauch] ADD  CONSTRAINT [DF_JB_Kontingente_Verbrauch_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[JB_Prioritaetenverwaltung] ADD  CONSTRAINT [DF_JB_Prioritaetenverwaltung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Jobboerse] ADD  CONSTRAINT [DF_Jobboerse_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Jobboerse] ADD  CONSTRAINT [DF__Jobboerse__Freig__126A03C0]  DEFAULT ((0)) FOR [FreigabeBenoetigt]
GO
ALTER TABLE [dbo].[Jobboerse] ADD  CONSTRAINT [DF__Jobboerse__Entfe__37C807A6]  DEFAULT ((0)) FOR [EntfernenBenachrichtigen]
GO
ALTER TABLE [dbo].[Jobboerse_Freigabe_Sprache] ADD  CONSTRAINT [DF_Jobboerse_Freigabe_Sprache_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[JobboerseDokumente] ADD  CONSTRAINT [DF_JobboerseDokumente_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[JobBoerseDokumentWerte] ADD  CONSTRAINT [DF_JobBoerseDokumentWerte_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[JobBoerseDokumentWerte] ADD  CONSTRAINT [DF_JobBoerseDokumentWerte_geloescht]  DEFAULT ((0)) FOR [geloescht]
GO
ALTER TABLE [dbo].[JobboerseProspect] ADD  CONSTRAINT [DF_JobboerseProspect_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[JobboerseProspect] ADD  CONSTRAINT [DF_JobboerseProspect_ErstelltAm]  DEFAULT (getdate()) FOR [ErstelltAm]
GO
ALTER TABLE [dbo].[JobboerseProspect] ADD  CONSTRAINT [DF_JobboerseProspect_JobCenterPlacement]  DEFAULT ((0)) FOR [JobCenterPlacement]
GO
ALTER TABLE [dbo].[JobboerseVersandDokumentTypen] ADD  CONSTRAINT [DF__Jobboerse__rowgu__3248CABA]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[JobboerseVersandHistorie] ADD  CONSTRAINT [DF_JobboerseVersandHistorie_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[JobDetailsMap] ADD  CONSTRAINT [DF_JobDetailsMap_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[JobDetailsMap] ADD  CONSTRAINT [DF_JobDetailsMap_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[JobDetailsMap] ADD  CONSTRAINT [DF_JobDetailsMap_BusinessRelevant]  DEFAULT ((1)) FOR [BusinessRelevant]
GO
ALTER TABLE [dbo].[JobDetailsMapCC] ADD  CONSTRAINT [DF_JobDetailsMapCC_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[JobDetailsMapCC] ADD  CONSTRAINT [DF_JobDetailsMapCC_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[JobDetailsMapCompany] ADD  CONSTRAINT [DF_JobDetailsMapCompany_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[JobDetailsMapCompany] ADD  CONSTRAINT [DF_JobDetailsMapCompany_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[JobDetailsMapCompany] ADD  CONSTRAINT [DF_JobDetailsMapCompany_IsManualMatch]  DEFAULT ((0)) FOR [IsManualMatcht]
GO
ALTER TABLE [dbo].[JobDetailsMapKam] ADD  CONSTRAINT [DF_JobDetailsMapKam_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[JobDetailsMapKam] ADD  CONSTRAINT [DF_JobDetailsMapKam_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[JobDetailsMapNote] ADD  CONSTRAINT [DF_JobDetailsMapNote_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[JobDetailsMapNote] ADD  CONSTRAINT [DF_JobDetailsMapNote_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[KAM_BP_Favoriten] ADD  CONSTRAINT [DF_KAM_BP_Favoriten_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[KennzahlenToolKombination] ADD  CONSTRAINT [DF__KennzahlenTo__ID__2D6C6F06]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[KennzahlenToolLightConfig] ADD  CONSTRAINT [DF_KennzahlenToolLightConfig_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Konzern] ADD  CONSTRAINT [DF_Konzern_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Konzern] ADD  CONSTRAINT [DF_Konzern_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_temp_new_id]  DEFAULT (newsequentialid()) FOR [kunde_id]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_leadstatus]  DEFAULT ((0)) FOR [Leadstatus]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_loeschen]  DEFAULT ((0)) FOR [loeschen]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_inaktiv]  DEFAULT ((0)) FOR [inaktiv]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_Sparch_id]  DEFAULT ((1)) FOR [Sprache]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_ist_zentrale]  DEFAULT ((0)) FOR [ist_zentrale]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_Lounge_Login]  DEFAULT ((0)) FOR [Lounge_Login]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF__Kunde__ExSAP__5C0D27B8]  DEFAULT ((0)) FOR [ExSAP]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF__Kunde__AktivSAP__656187C8]  DEFAULT ((0)) FOR [AktivSAP]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_PlanSAP]  DEFAULT ((0)) FOR [PlanSAP]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_MDMDeleted]  DEFAULT ((0)) FOR [MDMDeleted]
GO
ALTER TABLE [dbo].[Kunde_Mailadressen_Archiv] ADD  CONSTRAINT [DF_Kunde_Mailadressen_Archiv_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Kunde_Mailadressen_Archiv] ADD  CONSTRAINT [DF_Kunde_Mailadressen_Archiv_Erstellt_am]  DEFAULT (getdate()) FOR [Erstellt_am]
GO
ALTER TABLE [dbo].[Kunde_Wiedervorlage] ADD  CONSTRAINT [DF_Kunde_Wiedervorlage_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Kunde_Wiedervorlage] ADD  CONSTRAINT [DF_Kunde_Wiedervorlage_Erledigt]  DEFAULT ((0)) FOR [Erledigt]
GO
ALTER TABLE [dbo].[Kunde_Wiedervorlage] ADD  CONSTRAINT [DF_Kunde_Wiedervorlage_Erstellt_am]  DEFAULT (getdate()) FOR [Erstellt_am]
GO
ALTER TABLE [dbo].[kunde_zuordnung_wvl] ADD  CONSTRAINT [DF_kunde_zuordnung_wvl_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[Kunden_kam_bereich] ADD  CONSTRAINT [DF_Kunden_kam_bereich_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[Kundenbereiche] ADD  CONSTRAINT [DF_Kundenbereiche_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[KundenFaehigkeit] ADD  CONSTRAINT [DF_KundenFaehigkeit_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[KundenFaehigkeit] ADD  CONSTRAINT [DF_KundenFaehigkeit_Erstellungsdatum]  DEFAULT (getdate()) FOR [Erstellungsdatum]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_kundenkontakte2_kontakt_id]  DEFAULT (newsequentialid()) FOR [kontakt_id]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_kundenkontakte2_Telefonat]  DEFAULT ((0)) FOR [Telefonat]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_kundenkontakte2_Besuch]  DEFAULT ((0)) FOR [Besuch]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_kundenkontakte2_Bitte_RR]  DEFAULT ((0)) FOR [Bitte_RR]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_kundenkontakte2_Unterlagen_geschickt]  DEFAULT ((0)) FOR [Unterlagen_geschickt]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_kundenkontakte2_Unterlagen_nachgefasst]  DEFAULT ((0)) FOR [Unterlagen_nachgefasst]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_kundenkontakte2_Sortierungstyp]  DEFAULT ((0)) FOR [Sortierungstyp]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF__kundenkon__mail___3C8F868B]  DEFAULT (NULL) FOR [mail_to]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF__kundenkon__mail___0BB74506]  DEFAULT (NULL) FOR [mail_cc]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF__kundenkon__mail___5ADF0381]  DEFAULT (NULL) FOR [mail_bcc]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_Kundenkontakt_ARB]  DEFAULT ((0)) FOR [ARB]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_Kundenkontakt_NE]  DEFAULT ((0)) FOR [NE]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF__Kundenkon__Quali__7C5505E5]  DEFAULT ((0)) FOR [Qualitaetskontakt]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_Kundenkontakt_Datum]  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_Kundenkontakt_Werksvertrag]  DEFAULT ((0)) FOR [Werkvertrag]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_Kunde_SocialMediaQK]  DEFAULT ((0)) FOR [SocialMediaQK]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_Kundenkontakt_JobFeed]  DEFAULT ((0)) FOR [JobFeed]
GO
ALTER TABLE [dbo].[Kundenkontakt] ADD  CONSTRAINT [DF_Kundenkontakt_XSelling]  DEFAULT ((0)) FOR [XSelling]
GO
ALTER TABLE [dbo].[Kundenkontaktdokument] ADD  CONSTRAINT [DF_kundenkontaktdokumente_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Kundenmanagement] ADD  CONSTRAINT [DF_dbo_Kundenmanagement_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[Kundenmanagement] ADD  CONSTRAINT [DF_dbo_Kundenmanagement_erstellt_am]  DEFAULT (sysdatetime()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[Kundenmanagementmerkmal] ADD  CONSTRAINT [DF_dbo_Kundenmanagementmerkmal_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[Kundenmanagementmerkmal] ADD  CONSTRAINT [DF_dbo_Kundenmanagementmerkmal_KundeZuvergeben]  DEFAULT ((0)) FOR [KundeZuvergeben]
GO
ALTER TABLE [dbo].[Kundenmanagementmerkmal] ADD  CONSTRAINT [DF_dbo_Kundenmanagementmerkmal_erstellt_am]  DEFAULT (sysdatetime()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[KundenmanagementPB_HT_Standorte] ADD  CONSTRAINT [DF_dbo_KundenmanagementPB_HT_Standorte_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[KundenmanagementPB_HT_Standorte] ADD  CONSTRAINT [DF_dbo_KundenmanagementPB_HT_Standorte_erstellt_am]  DEFAULT (sysdatetime()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[Log_Objectaccess] ADD  CONSTRAINT [DF_Log_Objectaccess_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[Log_Objectaccess] ADD  CONSTRAINT [DF_Log_Objectaccess_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Marktzugang_MAAnzahl] ADD  CONSTRAINT [DF_Marktzugang_MAAnzahl_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Marktzugang_MAAnzahl] ADD  CONSTRAINT [DF_Table_1_AnzalMA]  DEFAULT ((0)) FOR [AnzahlMA]
GO
ALTER TABLE [dbo].[Marktzugang_MAAnzahl] ADD  CONSTRAINT [DF_Marktzugang_MAAnzahl_AnzahlMADE]  DEFAULT ((0)) FOR [AnzahlMADE]
GO
ALTER TABLE [dbo].[Marktzugang_MAAnzahl] ADD  CONSTRAINT [DF_Marktzugang_MAAnzahl_AnzahlMAAT]  DEFAULT ((0)) FOR [AnzahlMAAT]
GO
ALTER TABLE [dbo].[Marktzugang_MAAnzahl] ADD  CONSTRAINT [DF_Marktzugang_MAAnzahl_AnzahlMACH]  DEFAULT ((0)) FOR [AnzahlMACH]
GO
ALTER TABLE [dbo].[Marktzugang_MAZielsektor] ADD  CONSTRAINT [DF_Marktzugang_MAZielsektor_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Marktzugang_MAZielsektor] ADD  CONSTRAINT [DF_Marktzugang_MAZielsektor_Anzahl]  DEFAULT ((0)) FOR [Anzahl]
GO
ALTER TABLE [dbo].[Marktzugang_MAZielsektor] ADD  CONSTRAINT [DF_Marktzugang_MAZielsektor_Extern]  DEFAULT ((0)) FOR [Extern]
GO
ALTER TABLE [dbo].[Marktzugang_Potential] ADD  CONSTRAINT [DF_Marktzugang_Potential_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_BP_ID]  DEFAULT (newsequentialid()) FOR [BP_ID]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_Inaktiv]  DEFAULT ((0)) FOR [Inaktiv]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_ProjektMa]  DEFAULT ((0)) FOR [ProjektMa]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_ExProjektMa]  DEFAULT ((0)) FOR [ExProjektMa]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_Erstkontaktart]  DEFAULT ((0)) FOR [Erstkontaktart]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_Tagessatz]  DEFAULT ((0)) FOR [Tagessatz]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_Loeschen]  DEFAULT ((0)) FOR [Loeschen]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_Stundensatz]  DEFAULT ((0)) FOR [Stundensatz]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_Stundensatz_Waehrung]  DEFAULT ('€') FOR [Stundensatz_Waehrung]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_Erfassungsstatus]  DEFAULT ((0)) FOR [Erfassungsstatus]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_PCP]  DEFAULT ((0)) FOR [PCP]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_PSO_AP]  DEFAULT ((0)) FOR [PSO_AP]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_Verfuegbarkeitszeit_in_Prozent]  DEFAULT ((100)) FOR [Verfuegbarkeitszeit_in_Prozent]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_Sprach_id]  DEFAULT ((1)) FOR [Sprach_id]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_IdentCheck]  DEFAULT ((0)) FOR [IdentCheck]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_Lounge_Login]  DEFAULT ((0)) FOR [Lounge_Login]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF__Mitarbeit__TempD__2DD129F2]  DEFAULT ((0)) FOR [TempDok]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF__Mitarbeit__Premi__7053E5BD]  DEFAULT ((0)) FOR [PremiumPartner]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF__Mitarbeit__Fuehr__7A34B7B7]  DEFAULT ((0)) FOR [Fuehrungszeugnis]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF__Mitarbeit__Arbei__479B4F60]  DEFAULT ((0)) FOR [Arbeitsamt]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF__Mitarbeit__Aktiv__49646798]  DEFAULT ((0)) FOR [AktivSAP]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF__Mitarbeit__ExSAP__52B8C7A8]  DEFAULT ((0)) FOR [ExSAP]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF__Mitarbeit__Ausze__63394405]  DEFAULT ((0)) FOR [Auszeit]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF__Mitarbeit__Aktiv__201AFAAC]  DEFAULT ((0)) FOR [Aktiv14]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF__Mitarbeit__Aktiv__36FE6004]  DEFAULT ((0)) FOR [Aktiv14Mail]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_geandert_am]  DEFAULT (getdate()) FOR [geaendert_am]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_AGCH]  DEFAULT ((0)) FOR [AGCH]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_PlanSAP]  DEFAULT ((0)) FOR [PlanSAP]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_LSA_zurueck]  DEFAULT ((0)) FOR [LSA_zurueck]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_ZeugnisCheck]  DEFAULT ((0)) FOR [ZeugnisCheck]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_QualinachweisCH]  DEFAULT ((0)) FOR [QualinachweisCH]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_TempATDok]  DEFAULT ((0)) FOR [TempATDok]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_IdentCheckAT]  DEFAULT ((0)) FOR [IdentCheckAT]
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_MDMDeleted]  DEFAULT ((0)) FOR [MDMDeleted]
GO
ALTER TABLE [dbo].[Mitarbeiter_jobboerse] ADD  CONSTRAINT [DF_Mitarbeiter_jobboerse_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[Mitarbeiter_jobboerse] ADD  CONSTRAINT [DF_Mitarbeiter_jobboerse_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[Mitarbeiter_Kategorie_Check] ADD  CONSTRAINT [DF_Mitarbeiter_Kategorie_Check_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Mitarbeiter_Kategorie_Check] ADD  CONSTRAINT [DF_Mitarbeiter_Kategorie_Check_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[Mitarbeiter_Kategorie_Check] ADD  CONSTRAINT [DF_Mitarbeiter_Kategorie_Check_neu_angelegt]  DEFAULT ((0)) FOR [neu_angelegt]
GO
ALTER TABLE [dbo].[Mitarbeiter_Kategorie_Check] ADD  CONSTRAINT [DF_Mitarbeiter_Kategorie_Check_Bereich_Update]  DEFAULT ((0)) FOR [Bereich_Update]
GO
ALTER TABLE [dbo].[Mitarbeiter_Kategorie_Check] ADD  CONSTRAINT [DF_Mitarbeiter_Kategorie_Check_Bearbeitet]  DEFAULT ((0)) FOR [Bearbeitet]
GO
ALTER TABLE [dbo].[Mitarbeiter_Profilangaben] ADD  CONSTRAINT [DF_Mitarbeiter_Profilangaben_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Mitarbeiter_Region] ADD  CONSTRAINT [DF_Mitarbeiter_Region_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Mitarbeiter_Region] ADD  CONSTRAINT [DF_Mitarbeiter_Region_zugeordnet_am]  DEFAULT (getdate()) FOR [zugeordnet_am]
GO
ALTER TABLE [dbo].[MitarbeiterFaehigkeit] ADD  CONSTRAINT [DF_MitarbeiterFaehigkeit_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[MitarbeiterFaehigkeit] ADD  CONSTRAINT [DF_MitarbeiterFaehigkeit_SkillAnzahl]  DEFAULT ((0)) FOR [SkillAnzahl]
GO
ALTER TABLE [dbo].[MitarbeiterFaehigkeit] ADD  CONSTRAINT [DF_MitarbeiterFaehigkeit_AusgabeReihenfolge]  DEFAULT ((0)) FOR [AusgabeReihenfolge]
GO
ALTER TABLE [dbo].[MitarbeiterFaehigkeit] ADD  CONSTRAINT [DF_MitarbeiterFaehigkeit_Erstellungsdatum]  DEFAULT (getdate()) FOR [Erstellungsdatum]
GO
ALTER TABLE [dbo].[MitarbeiterGSV] ADD  CONSTRAINT [DF_MitarbeiterGSV_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[MitarbeiterGSV] ADD  CONSTRAINT [DF_MitarbeiterGSV_ErstelltAm]  DEFAULT (getdate()) FOR [ErstelltAm]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakte_temp_Kontakt_id]  DEFAULT (newsequentialid()) FOR [Kontakt_id]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakte_Telefonat_temp]  DEFAULT ((0)) FOR [Telefonat]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakte_ARB_temp]  DEFAULT ((0)) FOR [ARB]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakte_Bitte_um_RR_temp]  DEFAULT ((0)) FOR [Bitte_um_RR]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakte_RR_erledigt_temp]  DEFAULT ((0)) FOR [RR_erledigt]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakte_NE_temp]  DEFAULT ((0)) FOR [NE]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakte_schickt_Profil_temp]  DEFAULT ((0)) FOR [schickt_Profil]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_mitarbeiterkontakte_Sortierungstyp]  DEFAULT ((0)) FOR [Sortierungstyp]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF__mitarbeit__mail___4F184B1A]  DEFAULT (NULL) FOR [mail_to]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF__mitarbeit__mail___1E400995]  DEFAULT (NULL) FOR [mail_cc]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF__mitarbeit__mail___6D67C810]  DEFAULT (NULL) FOR [mail_bcc]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakt_Datum]  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakt_MVC_Kontakt]  DEFAULT ((0)) FOR [MFC_Kontakt]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakt_Werksvertrag]  DEFAULT ((0)) FOR [Werkvertrag]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakt_kundenInfo]  DEFAULT ((0)) FOR [KundenInfo]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakt_FirstDayCall]  DEFAULT ((0)) FOR [FirstDayCall]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakt_LastDayCall]  DEFAULT ((0)) FOR [LastDayCall]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakt_Recommendation]  DEFAULT ((0)) FOR [Recommendation]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakt_SocialMedia]  DEFAULT ((0)) FOR [SocialMedia]
GO
ALTER TABLE [dbo].[Mitarbeiterkontakt] ADD  CONSTRAINT [DF_Mitarbeiterkontakt_promote]  DEFAULT ((0)) FOR [Promote]
GO
ALTER TABLE [dbo].[Mitarbeiterkontaktdokument] ADD  CONSTRAINT [DF_Mitarbeiterkontakdokumente_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[MitarbeiterTermine] ADD  CONSTRAINT [DF_MitarbeiterTermine_terminID]  DEFAULT (newsequentialid()) FOR [terminID]
GO
ALTER TABLE [dbo].[MitarbeiterTracking] ADD  CONSTRAINT [DF_MitarbeiterTracking_MitarbeiterTrackingID]  DEFAULT (newsequentialid()) FOR [MitarbeiterTrackingID]
GO
ALTER TABLE [dbo].[MitarbeiterTracking] ADD  CONSTRAINT [DF_MitarbeiterTracking_MitarbeiterTrackinggeaendert]  DEFAULT ((1)) FOR [MitarbeiterTrackinggeaendert]
GO
ALTER TABLE [dbo].[MitarbeiterTracking] ADD  CONSTRAINT [DF_MitarbeiterTracking_MitarbeiterTrackingErstellt_am]  DEFAULT (getdate()) FOR [MitarbeiterTrackingErstellt_am]
GO
ALTER TABLE [dbo].[MitarbeiterTracking] ADD  CONSTRAINT [MSmerge_df_rowguid_F6CD8574BF144AF68DD0E26F82810D03]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[NG_RightsManagement] ADD  CONSTRAINT [DF_NG_RightsManagement_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[NG_RightsManagement] ADD  CONSTRAINT [DF_NG_RightsManagement_canRead]  DEFAULT ((0)) FOR [canRead]
GO
ALTER TABLE [dbo].[NG_RightsManagement] ADD  CONSTRAINT [DF_NG_RightsManagement_canWrite]  DEFAULT ((0)) FOR [canWrite]
GO
ALTER TABLE [dbo].[NG_RightsManagement] ADD  CONSTRAINT [DF_NG_RightsManagement_Temp]  DEFAULT ((0)) FOR [Temp]
GO
ALTER TABLE [dbo].[NG_RightsManagement] ADD  CONSTRAINT [DF_NG_RightsManagement_Contracting]  DEFAULT ((0)) FOR [Contracting]
GO
ALTER TABLE [dbo].[NG_RightsManagement] ADD  CONSTRAINT [DF_NG_RightsManagement_Perma]  DEFAULT ((0)) FOR [Perma]
GO
ALTER TABLE [dbo].[NG_RightsManagement] ADD  CONSTRAINT [DF_NG_KamPrioPflege]  DEFAULT ((0)) FOR [KamPrioPflege]
GO
ALTER TABLE [dbo].[NoticePeriod] ADD  CONSTRAINT [DF_NoticePeriod_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[NoticePeriod] ADD  CONSTRAINT [DF_NoticePeriod_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[olAddin_RibbonButtonStyle] ADD  CONSTRAINT [DF_olAddin_RibbonButtonStyle_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[olAddin_RibbonButtonVisibility] ADD  CONSTRAINT [DF_olAddin_RibbonButtonVisibility_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[olAddin_RibbonGroupStyle] ADD  CONSTRAINT [DF_olAddinRibbonGroupStyle_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[olAddin_RibbonGroupVisibility] ADD  CONSTRAINT [DF_olAddin_RibbonVisibility_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[Parameter] ADD  CONSTRAINT [DF__Parameter__rowgu__2E66C05C]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[PB_Company] ADD  CONSTRAINT [DF_PB_Company_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_Company] ADD  CONSTRAINT [DF_PB_Company_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PB_Company_Description] ADD  CONSTRAINT [DF_PB_Company_Description_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_Company_Description] ADD  CONSTRAINT [MSmerge_df_rowguid_1366D59542F445C8AF83CCEB1FA95C44]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[PB_Department] ADD  CONSTRAINT [DF_PB_Department_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_Department] ADD  CONSTRAINT [DF_PB_Department_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PB_Department] ADD  CONSTRAINT [DF_PB_Department_SAPUser]  DEFAULT ((0)) FOR [SAPUser]
GO
ALTER TABLE [dbo].[PB_Department_Description] ADD  CONSTRAINT [DF_PB_Department_Description_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_Employee_ContactData] ADD  CONSTRAINT [DF_PB_Employee_Communication_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_Employee_ContactData] ADD  CONSTRAINT [DF_PB_Employee_Communication_PrimaryConnection]  DEFAULT ((1)) FOR [PrimaryContact]
GO
ALTER TABLE [dbo].[PB_Employee_Position] ADD  CONSTRAINT [DF_PB_Employee_Position_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_Employee_Position] ADD  CONSTRAINT [DF_PB_Employee_Position_PrimaryPosition]  DEFAULT ((1)) FOR [PrimaryPosition]
GO
ALTER TABLE [dbo].[PB_Employee_SignatoryPower] ADD  CONSTRAINT [PB_DF_Employee_SignatoryPower_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_BusinessArea] ADD  CONSTRAINT [DF_PB_HT_BusinessArea_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_BusinessArea] ADD  CONSTRAINT [DF_PB_HT_BusinessArea_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PB_HT_BusinessType] ADD  CONSTRAINT [DF_PB_HT_BusinessType_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_BusinessType] ADD  CONSTRAINT [DF_PB_HT_BusinessType_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PB_HT_ContactType] ADD  CONSTRAINT [DF_PB_HT_CommunicationType_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_ContactType_Description] ADD  CONSTRAINT [DF_PB_HT_CommunicationType_Description_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_Hierarchie] ADD  CONSTRAINT [DF__PB_HT_Hie__rowgu__7E0778D6]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[PB_HT_HierarchyLevel] ADD  CONSTRAINT [DF_PB_HT_HierarchyLevel_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_HierarchyLevel_Description] ADD  CONSTRAINT [DF_PB_HT_HierarchyLevel_Description_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_Land] ADD  CONSTRAINT [DF_PB_HT_Land_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_Mitarbeiter_Status] ADD  CONSTRAINT [DF__PB_HT_Mit__rowgu__784E9F80]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[PB_HT_Position] ADD  CONSTRAINT [DF_PB_HT_Position_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_Position] ADD  CONSTRAINT [DF_PB_HT_Position_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PB_HT_Position_Description] ADD  CONSTRAINT [DF_PB_HT_Position_Description_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_Qualifikations_gruppen] ADD  CONSTRAINT [DF__PB_HT_Qua__rowgu__7295C62A]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[PB_HT_Qualifikationsstufen] ADD  CONSTRAINT [DF__PB_HT_Qua__rowgu__5F18DD62]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[PB_HT_RelationType] ADD  CONSTRAINT [DF_PB_HT_RelationType_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_RelationType_Description] ADD  CONSTRAINT [DF_PB_HT_RelationType_Description_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_SignatoryPower] ADD  CONSTRAINT [DF_PB_HT_SignatoryPower_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_Standort_Intern] ADD  CONSTRAINT [DF_PB_HT_Standort_Intern_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_Standorte] ADD  CONSTRAINT [DF__PB_HT_Sta__rowgu__6CDCECD4]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[PB_HT_Status_Description] ADD  CONSTRAINT [DF_PB_HT_Status_Description_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_HT_Waehrungen] ADD  CONSTRAINT [DF_PB_HT_Waehrungen_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_Mitarbeiter] ADD  CONSTRAINT [DF_PB_Mitarbeiter_Telefon]  DEFAULT ('-?-') FOR [Telefon]
GO
ALTER TABLE [dbo].[PB_Mitarbeiter] ADD  CONSTRAINT [DF__PB_Mitarb__rowgu__35E1BDA5]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[PB_Mitarbeiter] ADD  CONSTRAINT [DF__PB_Mitarb__ShowS__58346B46]  DEFAULT ((0)) FOR [ShowStartWizard]
GO
ALTER TABLE [dbo].[PB_Mitarbeiter] ADD  CONSTRAINT [DF_PB_Mitarbeiter_istvertrieb]  DEFAULT ((0)) FOR [istvertrieb]
GO
ALTER TABLE [dbo].[PB_Mitarbeiter_GeschaeftsTyp_SAP] ADD  CONSTRAINT [DF_PB_Mitarbeiter_GeschaeftsTyp_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[PB_Mitarbeiter_GeschaeftsTyp_SAP] ADD  CONSTRAINT [DF_PB_Mitarbeiter_Geschaeftstyp_CreationDate]  DEFAULT (sysdatetime()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[PB_Mitarbeiter_Zugriffsrolle] ADD  CONSTRAINT [DF_Benutzerrollen_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_Mitarbeiter_Zugriffsrolle] ADD  CONSTRAINT [DF_Benutzerrollen_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[PB_Mitarbeiter_Zugriffsrolle] ADD  CONSTRAINT [DF_Benutzerrollen_inaktiv]  DEFAULT ((0)) FOR [inaktiv]
GO
ALTER TABLE [dbo].[PB_Mitarbeiterkontakt] ADD  CONSTRAINT [DF_PB_Mitarbeiterkontakte_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[PB_Mitarbeiterkontakt] ADD  CONSTRAINT [DF_PB_Mitarbeiterkontakte_datum]  DEFAULT (getdate()) FOR [datum]
GO
ALTER TABLE [dbo].[PB_Position_BusinessArea] ADD  CONSTRAINT [DF_PB_Position_BusinessArea_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_Position_BusinessType] ADD  CONSTRAINT [DF_PB_Position_BusinessType_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_Position_Company] ADD  CONSTRAINT [DF_PB_Position_Company_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_Position_Location] ADD  CONSTRAINT [DF_PB_Position_Location_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PB_Position_Location] ADD  CONSTRAINT [DF_PB_Position_Location_PrimaryLocation]  DEFAULT ((1)) FOR [PrimaryLocation]
GO
ALTER TABLE [dbo].[PB_Position_Relation] ADD  CONSTRAINT [DF_PB_Position_Relation_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PersonDocument] ADD  CONSTRAINT [DF_dbo_PersonDocument_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[PersonDocument] ADD  CONSTRAINT [DF_dbo_PersonDocument_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[PersonRoleCompany] ADD  CONSTRAINT [DF_PersonRoleCompany_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[PersonRoleCompany] ADD  CONSTRAINT [DF_PersonRoleCompany_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[PersonRoleMap] ADD  CONSTRAINT [DF_PersonRoleMap_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[PersonRoleMap] ADD  CONSTRAINT [DF_PersonRoleMap_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[PersonSkillMap] ADD  CONSTRAINT [DF_PersonSkillMap_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[PersonSkillMap] ADD  CONSTRAINT [DF_PersonSkillMap_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[PersonSkillMap] ADD  CONSTRAINT [DF_PersonSkillMap_IsNationWide]  DEFAULT ((0)) FOR [IsNationWide]
GO
ALTER TABLE [dbo].[PlacementStatus_Matrix] ADD  CONSTRAINT [DF_PlacementStatus_Matrix_Guid]  DEFAULT (newsequentialid()) FOR [Guid]
GO
ALTER TABLE [dbo].[PlacementStatus_Matrix] ADD  CONSTRAINT [DF_PlacementStatus_Matrix_darf_Editieren]  DEFAULT ((0)) FOR [darf_editieren]
GO
ALTER TABLE [dbo].[PlacementStatus_Matrix] ADD  CONSTRAINT [DF_PlacementStatus_Matrix_darf_erstellen]  DEFAULT ((0)) FOR [darf_erstellen]
GO
ALTER TABLE [dbo].[PlacementWizard_Excel_Firma_Zuordnung] ADD  CONSTRAINT [DF_PlacementWizard_Excel_Firma_Zuordnung_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[PlacementWizard_Excel_Firma_Zuordnung] ADD  CONSTRAINT [DF_PlacementWizard_Excel_Firma_Zuordnung_Erstellt_Am]  DEFAULT (getdate()) FOR [Erstellt_Am]
GO
ALTER TABLE [dbo].[PlacementWizard_Matrix] ADD  CONSTRAINT [DF_PlacementWizard_Matrix_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[PlacementWizard_Matrix] ADD  CONSTRAINT [DF_PlacementWizard_Matrix_WizardPage_Position]  DEFAULT ((1)) FOR [WizardPage_Position]
GO
ALTER TABLE [dbo].[PlacementWizard_PermProvision] ADD  CONSTRAINT [DF_PlacementWizard_PermProvision_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[Planungskunde] ADD  CONSTRAINT [DF_Planungskunde_Planungskunde_ID]  DEFAULT (newsequentialid()) FOR [Planungskunde_ID]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospects_Datum]  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospects_in_aus_InternetDB]  DEFAULT ((0)) FOR [in_aus_InternetDB]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospect_gesuchte_consultants]  DEFAULT ((1)) FOR [gesuchte_consultants]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospects_Prospect_ID]  DEFAULT (newid()) FOR [Prospect_ID]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospects_Prospect_standort]  DEFAULT ((1)) FOR [Prospect_standort]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospect_Quali_check]  DEFAULT ((0)) FOR [Quali_check]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF__Prospect__KAMMAI__24923C0F]  DEFAULT ('1') FOR [KAMMAIL]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF__Prospect__QS_che__0D9305A3]  DEFAULT ((0)) FOR [QS_check]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospect_geaendert_am]  DEFAULT (getdate()) FOR [geaendert_am]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospect_ist_msp]  DEFAULT ((0)) FOR [ist_msp]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospect_PB_Company]  DEFAULT (NULL) FOR [PB_Company]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospect_Twitter]  DEFAULT ((0)) FOR [Twitter]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospect_ist_executive]  DEFAULT ((0)) FOR [ist_executive]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospect_ist_EqualPay]  DEFAULT ((0)) FOR [ist_EqualPay]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF__Prospect__Absolv__37EB7EDD]  DEFAULT ((0)) FOR [Absolvent]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF__Prospect__Retain__750B3264]  DEFAULT ((0)) FOR [Retainer]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_dbo_Prospect_Strahlenschutz]  DEFAULT ((0)) FOR [Strahlenschutz]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospect_meldepflichtig]  DEFAULT ((0)) FOR [meldepflichtig]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospect_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Prospect_ProspectSource]  DEFAULT ((1)) FOR [ProspectSource]
GO
ALTER TABLE [dbo].[Prospect] ADD  CONSTRAINT [DF_Porspect_isHTSS]  DEFAULT ((0)) FOR [isHTSS]
GO
ALTER TABLE [dbo].[Prospect_Region] ADD  CONSTRAINT [DF_Prospect_Region_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Prospect_Region] ADD  CONSTRAINT [DF_Prospect_Region_zugeordnet_amn]  DEFAULT (getdate()) FOR [zugeordnet_am]
GO
ALTER TABLE [dbo].[Prospect_Video] ADD  CONSTRAINT [DF_Prospect_Video_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ProspectArbeitssicherheit] ADD  CONSTRAINT [DF_ProspectArbeitssicherheit_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ProspectArbeitssicherheit] ADD  CONSTRAINT [DF_ProspectArbeitssicherheit_Erstellt_am]  DEFAULT (getdate()) FOR [Erstellt_am]
GO
ALTER TABLE [dbo].[ProspectArbeitssicherheit] ADD  CONSTRAINT [DF_EDV_Arbeitsplatz]  DEFAULT ((0)) FOR [EDV_Arbeitsplatz]
GO
ALTER TABLE [dbo].[ProspectAUEG] ADD  CONSTRAINT [DF_dbo_dbo_ProspectAUEG_QS_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ProspectAUEG] ADD  CONSTRAINT [DF_dbo_ProspectAUEG_QS_state]  DEFAULT ((0)) FOR [QS_state]
GO
ALTER TABLE [dbo].[ProspectAUEG] ADD  CONSTRAINT [DF_dbo_ProspectAUEG_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ProspectBeschreibung] ADD  CONSTRAINT [DF_ProspectBeschreibung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ProspectBeschreibung] ADD  CONSTRAINT [DF_ProspectBeschreibung_Sprach_ID]  DEFAULT ((1)) FOR [Sprach_ID]
GO
ALTER TABLE [dbo].[ProspectBeschreibung] ADD  CONSTRAINT [DF_ProspectBeschreibung_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[ProspectBeschreibung] ADD  CONSTRAINT [DF_ProspectBeschreibung_mitTelefonnummer]  DEFAULT ((0)) FOR [mitTelefonnummer]
GO
ALTER TABLE [dbo].[ProspectBeschreibung] ADD  CONSTRAINT [DF_Prospectbeschreibung_ReadytoPublish]  DEFAULT ((0)) FOR [ReadytoPublish]
GO
ALTER TABLE [dbo].[ProspectCCMailRecipients] ADD  CONSTRAINT [DF_ProspectCCMailRecipients_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ProspectEqualPay_Info] ADD  CONSTRAINT [DF_ProspectEqualPay_Info_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ProspectEqualPay_Info] ADD  CONSTRAINT [DF_ProspectEqualPay_Info_EP_KundenInfo]  DEFAULT ((0)) FOR [EP_KundenInfo]
GO
ALTER TABLE [dbo].[ProspectEqualPay_Info] ADD  CONSTRAINT [DF_ProspectEqualPay_Info_Erstellt_am]  DEFAULT (getdate()) FOR [Erstellt_am]
GO
ALTER TABLE [dbo].[ProspectFaehigkeit] ADD  CONSTRAINT [DF_Prospect_Skills_Auspraegung]  DEFAULT ((1)) FOR [Auspraegung]
GO
ALTER TABLE [dbo].[ProspectFaehigkeit] ADD  CONSTRAINT [DF_Prospect_Skills_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Prospectkontakt] ADD  CONSTRAINT [DF_Prospectkontakte_kontakt_id]  DEFAULT (newsequentialid()) FOR [kontakt_id]
GO
ALTER TABLE [dbo].[Prospectkontakt] ADD  CONSTRAINT [DF_prospectkontakt_Datum]  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[ProspectKontaktDokument] ADD  CONSTRAINT [DF_ProspectKontaktDokument_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[ProspectMitarbeiter] ADD  CONSTRAINT [DF__ProspectM__rowgu__7849DB76]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[ProspectMitarbeiter] ADD  CONSTRAINT [DF_ProspectMitarbeiter_MA_Status]  DEFAULT ((0)) FOR [MA_Status]
GO
ALTER TABLE [dbo].[ProspectMitarbeiter] ADD  CONSTRAINT [DF_ProspectMitarbeiter_DS_erstellt_am]  DEFAULT (getdate()) FOR [DS_erstellt_am]
GO
ALTER TABLE [dbo].[ProspectMitarbeiter] ADD  CONSTRAINT [DF_ProspectMitarbeiter_geaendert_am]  DEFAULT (getdate()) FOR [geaendert_am]
GO
ALTER TABLE [dbo].[ProspectMitarbeiterKalkulation] ADD  CONSTRAINT [DF_Prospect_EqualPay_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ProspectMitarbeiterKalkulation] ADD  CONSTRAINT [DF_ProspectEqualPay_erstellt_am]  DEFAULT (getdate()) FOR [Erstellt_am]
GO
ALTER TABLE [dbo].[ProspectMitarbeiterKalkulation] ADD  CONSTRAINT [DF_ProspectMitarbeiterKalkulation_istBestandsTS]  DEFAULT ((0)) FOR [istBestandsTS]
GO
ALTER TABLE [dbo].[ProspectMitarbeiterKalkulation] ADD  CONSTRAINT [DF_ProspectMitarbeiterKalkulation_Uebernahme]  DEFAULT ((0)) FOR [Uebernahme]
GO
ALTER TABLE [dbo].[ProspectMitarbeiterKalkulation] ADD  CONSTRAINT [DF_dbo_ProspectMitarbeiterKalkulation_Kalendermodell]  DEFAULT ((0)) FOR [Kalendermodell]
GO
ALTER TABLE [dbo].[ProspectMitarbeiterKalkulation] ADD  CONSTRAINT [DF_dbo_ProspectMitarbeiterKalkulation_Vorbeschaeftigung]  DEFAULT ((0)) FOR [Vorbeschaeftigung]
GO
ALTER TABLE [dbo].[ProspectPlacement] ADD  CONSTRAINT [DF_ProspectPlacement_Placement_ID]  DEFAULT (newsequentialid()) FOR [Placement_ID]
GO
ALTER TABLE [dbo].[ProspectPlacement] ADD  CONSTRAINT [DF_ProspectPlacement_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[ProspectPlacement] ADD  CONSTRAINT [DF_ProspectPlacement_in_Bearbeitung]  DEFAULT ((0)) FOR [in_Bearbeitung]
GO
ALTER TABLE [dbo].[ProspectPlacement] ADD  CONSTRAINT [DF_ProspectPlacement_erledigt]  DEFAULT ((0)) FOR [erledigt]
GO
ALTER TABLE [dbo].[ProspectPlacement] ADD  CONSTRAINT [DF_ProspectPlacement_SAP_uebergeben]  DEFAULT ((0)) FOR [SAP_uebergeben]
GO
ALTER TABLE [dbo].[ProspectPlacement] ADD  CONSTRAINT [DF_ProspectPlacement_HighPrio]  DEFAULT ((0)) FOR [HighPrio]
GO
ALTER TABLE [dbo].[ProspectPlacement] ADD  CONSTRAINT [DF_ProspectPlacement_Clarification]  DEFAULT ((0)) FOR [Clarification]
GO
ALTER TABLE [dbo].[ProspectPlacement] ADD  CONSTRAINT [DF_ProspectPlacement_isMassExtension]  DEFAULT ((0)) FOR [isMassExtension]
GO
ALTER TABLE [dbo].[ProspectPlacementDokument] ADD  CONSTRAINT [DF_Table_1_ID]  DEFAULT (newsequentialid()) FOR [ProspectPlacementDokument_ID]
GO
ALTER TABLE [dbo].[ProspectPlacementDokument] ADD  CONSTRAINT [DF_ProspectPlacementDokument_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[ProspectRoleMap] ADD  CONSTRAINT [DF_ProspectRoleMap_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ProspectRoleMap] ADD  CONSTRAINT [DF_ProspectRoleMap_MainRole]  DEFAULT ((0)) FOR [MainRole]
GO
ALTER TABLE [dbo].[ProspectRoleMap] ADD  CONSTRAINT [DF_ProspectRoleMap_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ProspectSkillMap] ADD  CONSTRAINT [DF_ProspectSkillMap_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[ProspectSkillMap] ADD  CONSTRAINT [DF_ProspectSkillMap_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[PSO] ADD  CONSTRAINT [DF_PSO_PCP]  DEFAULT ((0)) FOR [PCP]
GO
ALTER TABLE [dbo].[PSO] ADD  CONSTRAINT [DF_PSO_PSOID]  DEFAULT (newsequentialid()) FOR [PSO_ID]
GO
ALTER TABLE [dbo].[PSO] ADD  CONSTRAINT [DF_PSO_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[PSO] ADD  CONSTRAINT [DF__PSO__AktivSAP__6EB5E7D8]  DEFAULT ((0)) FOR [AktivSAP]
GO
ALTER TABLE [dbo].[PSO] ADD  CONSTRAINT [DF__PSO__ExSAP__780A47E8]  DEFAULT ((0)) FOR [ExSAP]
GO
ALTER TABLE [dbo].[PSO] ADD  CONSTRAINT [DF_PSO_PlanSAP]  DEFAULT ((0)) FOR [PlanSAP]
GO
ALTER TABLE [dbo].[PSO] ADD  CONSTRAINT [DF_PSO_LSA_zurueck]  DEFAULT ((0)) FOR [LSA_zurueck]
GO
ALTER TABLE [dbo].[PSO] ADD  CONSTRAINT [DF__PSO__IDCheck__1C24FF85]  DEFAULT ((0)) FOR [IDCheck]
GO
ALTER TABLE [dbo].[PSO] ADD  CONSTRAINT [DF_PSO_RemoteWork]  DEFAULT ((0)) FOR [RemoteWork]
GO
ALTER TABLE [dbo].[PSO] ADD  CONSTRAINT [DF_PSO_MDMDeleted]  DEFAULT ((0)) FOR [MDMDeleted]
GO
ALTER TABLE [dbo].[PSO_Kategorie_Check] ADD  CONSTRAINT [DF_dbo_PSO_Kategorie_Check_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PSO_Kategorie_Check] ADD  CONSTRAINT [DF_dbo_PSO_Kategorie_Check_neu_angelegt]  DEFAULT ((0)) FOR [neu_angelegt]
GO
ALTER TABLE [dbo].[PSO_Kategorie_Check] ADD  CONSTRAINT [DF_dbo_PSO_Kategorie_Check_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[PSO_Rechtebereiche] ADD  CONSTRAINT [DF_PSO_Rechtebereiche_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PSO_Rechtebereiche] ADD  CONSTRAINT [DF_PSO_Rechtebereiche_zugeordnet_am]  DEFAULT (getdate()) FOR [zugeordnet_am]
GO
ALTER TABLE [dbo].[PSO_Region] ADD  CONSTRAINT [DF_PSO_Region_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[PSO_Region] ADD  CONSTRAINT [DF_PSO_Region_zugeordnet_am]  DEFAULT (getdate()) FOR [zugeordnet_am]
GO
ALTER TABLE [dbo].[PSOGSV] ADD  CONSTRAINT [DF_PSOGSV_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[PSOGSV] ADD  CONSTRAINT [DF_GSV_Status]  DEFAULT ((0)) FOR [GSV_Status]
GO
ALTER TABLE [dbo].[PSOGSV] ADD  CONSTRAINT [DF_PSOGSV_ErstelltAm]  DEFAULT (getdate()) FOR [ErstelltAm]
GO
ALTER TABLE [dbo].[PSOKontakt] ADD  CONSTRAINT [DF_PSOkontakte_Kontakt_id]  DEFAULT (newsequentialid()) FOR [Kontakt_id]
GO
ALTER TABLE [dbo].[PSOKontakt] ADD  CONSTRAINT [DF_psokontakt_Datum]  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[PSOKontaktdokument] ADD  CONSTRAINT [DF_PSOKontakdokumente_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[PVS_Activity_Log] ADD  CONSTRAINT [DF_PVS_Activity_Log_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Pvs4_Auth_Action] ADD  CONSTRAINT [DF_Pvs4_Auth_Action_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_Auth_Action] ADD  CONSTRAINT [DF_Pvs4_Auth_Action_IsDomainArea]  DEFAULT ((0)) FOR [IsDomainArea]
GO
ALTER TABLE [dbo].[Pvs4_Auth_Action] ADD  CONSTRAINT [DF_Pvs4_Auth_Action_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_Auth_ActionControlMap] ADD  CONSTRAINT [DF_Pvs4_Auth_ActionControlMap_GuId]  DEFAULT (newid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_Auth_AdPvs4RoleMap] ADD  CONSTRAINT [DF_Pvs4_Auth_AdPvs4RoleMap_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_Auth_AdRole] ADD  CONSTRAINT [DF_Pvs4_Auth_AdRole_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_Auth_AdRole] ADD  CONSTRAINT [DF_Pvs4_Auth_AdRole_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_Auth_Controls] ADD  CONSTRAINT [DF_Pvs4_Auth_Controls_GuId]  DEFAULT (newid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_Auth_Exception] ADD  CONSTRAINT [DF_Pvs4_Auth_Exception_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_Auth_Exception] ADD  CONSTRAINT [DF_Pvs4_Auth_Exception_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_Auth_ObjectAttributes] ADD  CONSTRAINT [DF_Pvs4_Auth_ObjectAttributes_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_Auth_PvsRole] ADD  CONSTRAINT [DF_Pvs4_Auth_PvsRole_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_Auth_PvsRole] ADD  CONSTRAINT [DF_Pvs4_Auth_PvsRole_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_Auth_RoleActionMap] ADD  CONSTRAINT [DF_Pvs4_Auth_RoleActionMap_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_ConsentCriminalRecord] ADD  CONSTRAINT [DF_Pvs4_ConsentCriminalRecord_GuidId]  DEFAULT (newsequentialid()) FOR [GuidID]
GO
ALTER TABLE [dbo].[Pvs4_ConsentCriminalRecord] ADD  CONSTRAINT [DF_Pvs4_ConsentCriminalRecord_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_CrefoArchive] ADD  CONSTRAINT [DF_Pvs4_CrefoArchive_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_CrefoArchive] ADD  CONSTRAINT [DF_Pvs4_CrefoArchive_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_CriminalRecord] ADD  CONSTRAINT [DF_Pvs4_CriminalRecord_GuidId]  DEFAULT (newsequentialid()) FOR [GuidID]
GO
ALTER TABLE [dbo].[Pvs4_CriminalRecord] ADD  CONSTRAINT [DF_Pvs4_CriminalRecord_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_Answer] ADD  CONSTRAINT [DF_Pvs4_CSQ_Answer_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_Answer] ADD  CONSTRAINT [DF_Pvs4_CSQ_Answer]  DEFAULT ((0)) FOR [Answer]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_Answer] ADD  CONSTRAINT [DF_Pvs4_CSQ_Answer_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_AnswerAdditional] ADD  CONSTRAINT [DF_Pvs4_CSQ_AnswerAdditional_GuidId]  DEFAULT (newsequentialid()) FOR [GuidId]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_AnswerAdditional] ADD  CONSTRAINT [DF_Pvs4_CSQ_AnswerAdditional_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_Exceptions] ADD  CONSTRAINT [DF_exceptions_GuidID]  DEFAULT (newsequentialid()) FOR [GuidId]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_Exceptions] ADD  CONSTRAINT [DF_Pvs4_CSQ_Exceptions_Q1_Value]  DEFAULT ((0)) FOR [Q1_Value]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_Exceptions] ADD  CONSTRAINT [DF_Pvs4_CSQ_Exceptions_Q2_Value]  DEFAULT ((0)) FOR [Q2_Value]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_Exceptions] ADD  CONSTRAINT [DF_Pvs4_CSQ_Exceptions_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_MappingAdditionalQuestion] ADD  CONSTRAINT [DF_Pvs4_CSQ_MappingAdditionalQuestion_GuidId]  DEFAULT (newsequentialid()) FOR [GuidId]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_MappingAdditionalQuestion] ADD  CONSTRAINT [DF_Pvs4_CSQ_MappingAdditionalQuestion_MSP]  DEFAULT ((0)) FOR [MSP]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_MappingBasicQuestion] ADD  CONSTRAINT [DF_Pvs4_CSQ_MappingBasicQuestion_GuidId]  DEFAULT (newsequentialid()) FOR [GuidId]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_MappingBasicQuestion] ADD  CONSTRAINT [DF_Pvs4_CSQ_MappingBasicQuestion_Freelancer]  DEFAULT ((0)) FOR [Freelancer]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_MappingBasicQuestion] ADD  CONSTRAINT [DF_Pvs4_CSQ_MappingBasicQuestion_PSO_BP]  DEFAULT ((0)) FOR [PSO_BP_CC]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_MappingBasicQuestion] ADD  CONSTRAINT [DF_Pvs4_CSQ_MappingBasicQuestion_HTSG]  DEFAULT ((0)) FOR [HTSG]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_MappingBasicQuestion] ADD  CONSTRAINT [DF_Pvs4_CSQ_MappingBasicQuestion_HPS]  DEFAULT ((0)) FOR [HPS]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_MappingBasicQuestion] ADD  CONSTRAINT [DF_Pvs4_CSQ_MappingBasicQuestion_MSP]  DEFAULT ((0)) FOR [MSP]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_MappingBasicQuestion] ADD  CONSTRAINT [DF_Pvs4_CSQ_MappingBasicQuestion_PsoSupplier]  DEFAULT ((0)) FOR [PsoSupplier]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_Question] ADD  CONSTRAINT [DF_Pvs4_CSQ_Question_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_Question] ADD  CONSTRAINT [DF_Pvs4_CSQ_Question_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_Questionnaire] ADD  CONSTRAINT [DF_Pvs4_CSQ_Questionnaire_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_Questionnaire] ADD  CONSTRAINT [DF_Pvs4_CSQ_Questionnaire_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_ServiceDescription] ADD  CONSTRAINT [DF_Pvs4_CSQ_ServiceDescription_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_CSQ_ServiceDescription] ADD  CONSTRAINT [DF_Pvs4_CSQ_ServiceDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_EntityWorkHistory] ADD  CONSTRAINT [DF_Pvs4_EntityWorkHistory_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_FeatureToggle] ADD  CONSTRAINT [DF_Pvs4_Pvs4_FeatureToggle_ID]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_FeatureToggle] ADD  CONSTRAINT [DF_Pvs4_Pvs4_FeatureToggle_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_HistoryLocation] ADD  CONSTRAINT [DF_HistoryLocation_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_HistoryLocation] ADD  CONSTRAINT [DF_HistoryLocation_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_HistoryProspectEqualPay_Info] ADD  CONSTRAINT [DF_HistoryProspectEqualPay_Info_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_HistoryProspectEqualPay_Info] ADD  CONSTRAINT [DF_ProspectEqualPay_Info_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_InternalNotification_Messages] ADD  CONSTRAINT [DF_Pvs4_InternalNotification_Messages_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_InternalNotification_Messages] ADD  CONSTRAINT [DF_Pvs4_InternalNotification_Messages_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Pvs4_JobPosting_DK] ADD  CONSTRAINT [DF_Pvs4_JobPosting_DK_ID]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_JobPosting_DK] ADD  CONSTRAINT [DF_Pvs4_JobPosting_DK_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_LogSourceType] ADD  CONSTRAINT [DF_Pvs4_LogSourceType_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_LogSourceType] ADD  CONSTRAINT [DF_Pvs4_LogSourceType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_MailTemplates] ADD  CONSTRAINT [DF_Pvs4_MailTemplates_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_MailTemplates] ADD  CONSTRAINT [DF_Pvs4_MailTemplates_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_MailTemplates] ADD  CONSTRAINT [DF_Pvs4_MailTemplates_IsNew]  DEFAULT ((0)) FOR [IsNew]
GO
ALTER TABLE [dbo].[Pvs4_MailTemplates] ADD  CONSTRAINT [DF_Pvs4_MailTemplates_UserTemplate]  DEFAULT ((1)) FOR [UserTemplate]
GO
ALTER TABLE [dbo].[Pvs4_MapBusinessUnit] ADD  CONSTRAINT [DF_Pvs4_MapBusinessUnit_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_MapBusinessUnit] ADD  CONSTRAINT [DF_Pvs4_MapBusinessUnit_IsFocus]  DEFAULT ((0)) FOR [IsFocus]
GO
ALTER TABLE [dbo].[Pvs4_MapBusinessUnit] ADD  CONSTRAINT [DF_Pvs4_MapBusinessUnit_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_MapEntityBusinessUnit] ADD  CONSTRAINT [DF_Pvs4_MapEntityBusinessUnit_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_MapEntityBusinessUnit] ADD  CONSTRAINT [DF_Pvs4_MapEntityBusinessUnit_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_MapEntityToSc] ADD  CONSTRAINT [DF_Pvs4_MapEntityToSc_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_MapEntityToSc] ADD  CONSTRAINT [DF_Pvs4_MapEntityToSc_CreatedBy]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Pvs4_MappingEntityHierarchy] ADD  CONSTRAINT [DF_Pvs4_MappingEntityHierarchy_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_MappingEntityHierarchy] ADD  CONSTRAINT [DF_Pvs4_MappingEntityHierarchy_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_MasterData] ADD  CONSTRAINT [DF_Pvs4_MasterData_GuidId]  DEFAULT (newsequentialid()) FOR [GuidId]
GO
ALTER TABLE [dbo].[Pvs4_MasterData] ADD  CONSTRAINT [DF_Pvs4_MasterData_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_MasterDataDescription] ADD  CONSTRAINT [DF_Pvs4_MasterDataDescription_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[Pvs4_MasterDataDescription] ADD  CONSTRAINT [DF_Pvs4_MasterDataDescription_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_NotificationWatcherList] ADD  CONSTRAINT [DF_Pvs4_NotificationWatcherList_ID]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_NotificationWatcherList] ADD  CONSTRAINT [DF_Pvs4_NotificationWatcherList_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_Opportunity] ADD  CONSTRAINT [DF_Pvs4_Opportunity_GuId]  DEFAULT (newsequentialid()) FOR [GuId_Id]
GO
ALTER TABLE [dbo].[Pvs4_Opportunity] ADD  CONSTRAINT [DF_Pvs4_Opportunity_HTS]  DEFAULT ((0)) FOR [HTS]
GO
ALTER TABLE [dbo].[Pvs4_Opportunity] ADD  CONSTRAINT [DF_Pvs4_Opportunity_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_OpportunityJournalEntry] ADD  CONSTRAINT [DF_Pvs4_OpportunityJournalEntry_GuId]  DEFAULT (newsequentialid()) FOR [GuId_Id]
GO
ALTER TABLE [dbo].[Pvs4_OpportunityJournalEntryDocument] ADD  CONSTRAINT [DF_Pvs4_OpportunityJournalDocument_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_OpportunityRoleMap] ADD  CONSTRAINT [DF_OpportunityRoleMap_GuId]  DEFAULT (newsequentialid()) FOR [GuId_Id]
GO
ALTER TABLE [dbo].[Pvs4_OpportunityRoleMap] ADD  CONSTRAINT [DF_Pvs4_OpportunityRoleMap_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_OpportunityRoleMap] ADD  CONSTRAINT [DF_Pvs4_OpportunityRoleMap_MainRole]  DEFAULT ((0)) FOR [MainRole]
GO
ALTER TABLE [dbo].[Pvs4_OpportunitySkillMap] ADD  CONSTRAINT [DF_OpportunitySkillMap_GuId]  DEFAULT (newsequentialid()) FOR [GuId_Id]
GO
ALTER TABLE [dbo].[Pvs4_PayGroupChangeReason] ADD  CONSTRAINT [DF_Pvs4_PayGroupChangeReason_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_PayGroupChangeReason] ADD  CONSTRAINT [DF_Pvs4_PayGroupChangeReason_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_Person_OU_Assignment_PSO] ADD  CONSTRAINT [DF_Pvs4_Person_OU_Assignment_PSO_GuId]  DEFAULT (newsequentialid()) FOR [GuId_Id]
GO
ALTER TABLE [dbo].[Pvs4_Person_OU_Assignment_PSO] ADD  CONSTRAINT [DF_Pvs4_Pvs4_Person_OU_Assignment_PSO_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_SentAppointments] ADD  CONSTRAINT [DF_Pvs4_SentAppointments_ID]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_SentAppointments] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_SkillNote] ADD  CONSTRAINT [DF_Pvs4_SkillNote_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_SkillNote] ADD  CONSTRAINT [DF_Pvs4_SkillNote_CreatedBy]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Pvs4_UserPersonalSettings] ADD  CONSTRAINT [DF_Pvs4_UserPersonalSettings_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_UserPersonalSettings] ADD  CONSTRAINT [DF_Pvs4_UserPersonalSettings_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_UserProfileSettings] ADD  CONSTRAINT [DF_Pvs4_UserProfileSettings_GuId]  DEFAULT (newsequentialid()) FOR [GuId]
GO
ALTER TABLE [dbo].[Pvs4_UserProfileSettings] ADD  CONSTRAINT [DF_Pvs4_UserProfileSettings_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Pvs4_UserSignatures] ADD  CONSTRAINT [DF_Pvs4_Signatures_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Pvs4_UserSignatures] ADD  CONSTRAINT [DF_Pvs4_Signatures_StandardSignature]  DEFAULT ((0)) FOR [StandardCompanySignature]
GO
ALTER TABLE [dbo].[Pvs4_UserSignatures] ADD  CONSTRAINT [Pvs4_Signatures_StandardUserSignature]  DEFAULT ((0)) FOR [StandardUserSignature]
GO
ALTER TABLE [dbo].[Pvs4_UserSignatures] ADD  CONSTRAINT [DF_Pvs4_Signatures_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[QualiCheckProspect] ADD  CONSTRAINT [DF_QualiCheckProspect_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[Rahmenvertraege] ADD  CONSTRAINT [DF_Rahmenvertraege_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[rechercheergebnis] ADD  CONSTRAINT [DF_rechercheergebnis_Ergebnis_id]  DEFAULT (newsequentialid()) FOR [Ergebnis_id]
GO
ALTER TABLE [dbo].[rechercheergebnis] ADD  CONSTRAINT [DF_rechercheergebnis_anzeigen]  DEFAULT ((0)) FOR [anzeigen]
GO
ALTER TABLE [dbo].[rechercheergebnis] ADD  CONSTRAINT [DF_rechercheergebnis_neu_gefunden]  DEFAULT ((0)) FOR [neu_gefunden]
GO
ALTER TABLE [dbo].[rechercheergebnis] ADD  CONSTRAINT [DF_rechercheergebnis_hinzugefuegt_am]  DEFAULT (getdate()) FOR [hinzugefuegt_am]
GO
ALTER TABLE [dbo].[Rechercheergebnisbeschreibung] ADD  CONSTRAINT [DF_Rechercheergebnisbeschreibung_R_ID]  DEFAULT (newsequentialid()) FOR [R_ID]
GO
ALTER TABLE [dbo].[Rechercheergebnisbeschreibung] ADD  CONSTRAINT [DF_Rechercheergebnisbeschreibung_Erstellungsdatum]  DEFAULT (getdate()) FOR [Erstellungsdatum]
GO
ALTER TABLE [dbo].[Rechercheergebnisbeschreibung] ADD  CONSTRAINT [DF_Rechercheergebnisbeschreibung_privat]  DEFAULT ((0)) FOR [privat]
GO
ALTER TABLE [dbo].[Recherchequeue] ADD  CONSTRAINT [DF_Recherchequeue_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[Recherchequeue] ADD  CONSTRAINT [DF_Recherchequeue_erstelltam]  DEFAULT (getdate()) FOR [erstelltam]
GO
ALTER TABLE [dbo].[Region] ADD  CONSTRAINT [DF_land_plz_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[SAP_Beleg_Import] ADD  CONSTRAINT [DF_SAP_Beleg_Import_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[SAP_BPSachbearbeiter] ADD  CONSTRAINT [DF_SAP_BPSachbearbeiter_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[SAP_KundeSachbearbeiter] ADD  CONSTRAINT [DF_KundeSachbearbeiter]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[SAP_ProjectData] ADD  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[SAP_ProjectData] ADD  CONSTRAINT [DF_SAP_ProjectData_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[SAP_Skill] ADD  CONSTRAINT [DF_SAP_Skill_VMSkill_ID]  DEFAULT (newsequentialid()) FOR [VMSkill_ID]
GO
ALTER TABLE [dbo].[SAP_Skill] ADD  CONSTRAINT [DF__SAP_Skill__inakt__631059ED]  DEFAULT ((0)) FOR [inaktiv]
GO
ALTER TABLE [dbo].[SAP_Skill_Bezeichnung] ADD  CONSTRAINT [DF_SAP_Skill_Bezeichnung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[SAP_Skill_Keyword] ADD  CONSTRAINT [DF_SAP_Skill_Keyword_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[SAP_Skill_Zuordnung] ADD  CONSTRAINT [DF_SAP_Skill_Zuordnung_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[SAP_WiedervermittlungTemp] ADD  CONSTRAINT [DF_SAP_WiedervermittlungTempNew_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Skill_MainMatrix] ADD  CONSTRAINT [DF_Table_1_Skill_Matrix_ID]  DEFAULT (newsequentialid()) FOR [Mainskill_Matrix_ID]
GO
ALTER TABLE [dbo].[Skillgruppe_Geschaeftsfeld_Matrix] ADD  CONSTRAINT [DF_Skillgruppe_Geschaeftsfeld_Matrix_Skillgruppe_Geschaeftsfeld_Matrix_ID]  DEFAULT (newsequentialid()) FOR [Skillgruppe_Geschaeftsfeld_Matrix_ID]
GO
ALTER TABLE [dbo].[Skillgruppen_Matrix] ADD  CONSTRAINT [DF_Skillgruppen_Matrix_Skillgruppen_Matrix_ID]  DEFAULT (newsequentialid()) FOR [Skillgruppen_Matrix_ID]
GO
ALTER TABLE [dbo].[Skillobergruppe] ADD  CONSTRAINT [DF_Skillobergruppe_Skillobergruppen_ID]  DEFAULT (newsequentialid()) FOR [Skillobergruppe_ID]
GO
ALTER TABLE [dbo].[Skillobergruppe] ADD  CONSTRAINT [DF_Skillobergruppe_SkillTab]  DEFAULT ((0)) FOR [SkillTab]
GO
ALTER TABLE [dbo].[Skillobergruppe_Beschreibung] ADD  CONSTRAINT [DF_Skillobergruppe_Beschreibung_Skillobergruppe_Beschreibung_ID]  DEFAULT (newsequentialid()) FOR [Skillobergruppe_Beschreibung_ID]
GO
ALTER TABLE [dbo].[Skillobergruppe_Beschreibung] ADD  CONSTRAINT [DF_Skillobergruppe_Beschreibung_Sprach_ID]  DEFAULT ((1)) FOR [Sprach_ID]
GO
ALTER TABLE [dbo].[Skillobergruppen_Matrix] ADD  CONSTRAINT [DF_Skillobergruppen_Matrix_ID]  DEFAULT (newsequentialid()) FOR [Skillobergruppen_Matrix_ID]
GO
ALTER TABLE [dbo].[Standardrolle_User_Zuord] ADD  CONSTRAINT [DF_Standardrolle_User_Zuord_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Standardrolle_Zugriffsrolle] ADD  CONSTRAINT [DF_Zuordnung_standardrollen_rollen_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Standardrolle_Zugriffsrolle] ADD  CONSTRAINT [DF_Zuordnung_standardrollen_zugriffsrollen_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[Standardrolle_Zugriffsrolle] ADD  CONSTRAINT [DF_Zuordnung_standardrollen_zugriffsrollen_inaktiv]  DEFAULT ((0)) FOR [inaktiv]
GO
ALTER TABLE [dbo].[Standardrollen] ADD  CONSTRAINT [DF_Standardrollen_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Standardrollen] ADD  CONSTRAINT [DF_Standardrollen_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[Standardrollen] ADD  CONSTRAINT [DF_Standardrollen_inaktiv]  DEFAULT ((0)) FOR [inaktiv]
GO
ALTER TABLE [dbo].[StartWizard_Department_UOO] ADD  CONSTRAINT [DF_StartWizard_Department_UOO_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[StartWizard_InfoText] ADD  CONSTRAINT [DF_StartWizard_InfoText_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[StartWizard_UserOptionsObjects] ADD  CONSTRAINT [DF_StartWizard_UserOptionsObjects_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Translation] ADD  CONSTRAINT [DF_Translation_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Translation] ADD  CONSTRAINT [DF_Translation_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Translation] ADD  CONSTRAINT [MSmerge_df_rowguid_2B48E3E73CF8447D998E1EFF5880D4F8]  DEFAULT (newsequentialid()) FOR [rowguid5]
GO
ALTER TABLE [dbo].[TranslationSprache] ADD  CONSTRAINT [DF_TranslationSprache_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[TranslationSprache] ADD  CONSTRAINT [DF_TranslationSprache_rowguid]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[TranslationSprache] ADD  CONSTRAINT [MSmerge_df_rowguid_4C100990AB1F4D75B35284104322E1C6]  DEFAULT (newsequentialid()) FOR [rowguid6]
GO
ALTER TABLE [dbo].[umrechnung_waehrungen] ADD  CONSTRAINT [DF_umrechnung_waehrungen_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[umrechnung_waehrungen] ADD  CONSTRAINT [DF__umrechnun__SAP_W__7D858C21]  DEFAULT ('EUR') FOR [SAP_Waehrung]
GO
ALTER TABLE [dbo].[umrechnung_waehrungen] ADD  CONSTRAINT [DF__umrechnun__Sorti__4D33E1E2]  DEFAULT ((9999)) FOR [Sortierreihenfolge]
GO
ALTER TABLE [dbo].[umrechnung_waehrungen] ADD  CONSTRAINT [DF__umrechnun__Defau__4E28061B]  DEFAULT ((0)) FOR [Default_sichtbarkeit]
GO
ALTER TABLE [dbo].[Untersuchungsart] ADD  CONSTRAINT [DF__Untersuchu__Guid__3FED7BED]  DEFAULT (newsequentialid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Untersuchungsergebnisse] ADD  CONSTRAINT [DF_Untersuchungsergebnisse_Guid]  DEFAULT (newsequentialid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Untersuchungsgebiet] ADD  CONSTRAINT [DF_Untersuchungsgebiet_Guid]  DEFAULT (newsequentialid()) FOR [Guid]
GO
ALTER TABLE [dbo].[User_einstellungen] ADD  CONSTRAINT [DF_User_einstellungen_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[User_einstellungen] ADD  CONSTRAINT [DF_User_einstellungen_wert]  DEFAULT ('') FOR [wert]
GO
ALTER TABLE [dbo].[Vertragsmail] ADD  CONSTRAINT [DF_Vertragsmail_Vertragsmail_ID]  DEFAULT (newsequentialid()) FOR [Vertragsmail_ID]
GO
ALTER TABLE [dbo].[Vertragsmail] ADD  CONSTRAINT [DF_Vertragsmail_Initialbeleg]  DEFAULT ((0)) FOR [Initialbeleg]
GO
ALTER TABLE [dbo].[Vertragsmail] ADD  CONSTRAINT [DF_Vertragsmail_Partnerside]  DEFAULT ((0)) FOR [Partnerside]
GO
ALTER TABLE [dbo].[Vertragsmail] ADD  CONSTRAINT [DF_Vertragsmail_inaktiv]  DEFAULT ((0)) FOR [inaktiv]
GO
ALTER TABLE [dbo].[Vertragsmail] ADD  CONSTRAINT [DF_Vertragsmail_]  DEFAULT ((0)) FOR [Sonderregelungsflag]
GO
ALTER TABLE [dbo].[Vertragsmail_Bereich_Mapping] ADD  CONSTRAINT [DF_Vertragsmail_Bereich_Mapping_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[Vertragsmail_Bereich_Mapping] ADD  CONSTRAINT [DF_Vertragsmail_Bereich_Mapping_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Vertragsmail_Description] ADD  CONSTRAINT [DF_Vertragsmail_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[Vertragsmail_Description] ADD  CONSTRAINT [DF_Vertragsmail_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Vertragsmail_Menu] ADD  CONSTRAINT [DF_Vertragsmail_Menu_Vertragsmail_Menu_ID]  DEFAULT (newsequentialid()) FOR [Vertragsmail_Menu_ID]
GO
ALTER TABLE [dbo].[VertragsmailBereichsMatrix] ADD  CONSTRAINT [DF_VertragsmailBereichsMatrix_GUID]  DEFAULT (newsequentialid()) FOR [GUID]
GO
ALTER TABLE [dbo].[VertragsmailBereichsMatrix] ADD  CONSTRAINT [DF_VertragsmailBereichsMatrix_Aktiv]  DEFAULT ((1)) FOR [Aktiv]
GO
ALTER TABLE [dbo].[VertragsmailBereichsMatrix] ADD  CONSTRAINT [DF_VertragsmailBereichsMatrix_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Vertragsmailmatrix] ADD  CONSTRAINT [DF_Vertragsmailmatrix_Vertragsmailmatrix_ID]  DEFAULT (newsequentialid()) FOR [Vertragsmailmatrix_ID]
GO
ALTER TABLE [dbo].[Vertragsskill] ADD  CONSTRAINT [DF_Vertragsskill_VMSkill_ID]  DEFAULT (newsequentialid()) FOR [VMSkill_ID]
GO
ALTER TABLE [dbo].[Zugriff_ActivityReport] ADD  CONSTRAINT [DF_Zugriff_ActivityReport_id]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[Zugriff_ActivityReport] ADD  CONSTRAINT [DF_Zugriff_ActivityReport_inaktiv]  DEFAULT ((0)) FOR [inaktiv]
GO
ALTER TABLE [dbo].[Zugriff_ActivityReport] ADD  CONSTRAINT [DF_Zugriff_ActivityReport_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[Zugriff_ActivityReport] ADD  CONSTRAINT [DF__Zugriff_A__repor__0B122B35]  DEFAULT ('A') FOR [report_typ]
GO
ALTER TABLE [dbo].[Zugriffsrollen] ADD  CONSTRAINT [DF_Zugriffsrollen_Rollen_id]  DEFAULT (newsequentialid()) FOR [Rollen_id]
GO
ALTER TABLE [dbo].[Zugriffsrollen] ADD  CONSTRAINT [DF_Zugriffsrollen_erstellt_am]  DEFAULT (getdate()) FOR [erstellt_am]
GO
ALTER TABLE [dbo].[Zugriffsrollen] ADD  CONSTRAINT [DF_Zugriffsrollen_inaktiv]  DEFAULT ((0)) FOR [inaktiv]
GO
ALTER TABLE [dbo].[Zugriffsrollen] ADD  CONSTRAINT [DF__Zugriffsr__sicht__4748ABAA]  DEFAULT ((1)) FOR [sichtbar]
GO
ALTER TABLE [dbo].[Zugriffsrollen] ADD  CONSTRAINT [DF__Zugriffsr__IstMS__51912FF3]  DEFAULT ((0)) FOR [IstMSP]
GO
ALTER TABLE [dbo].[Zugriffsrollen] ADD  CONSTRAINT [DF_Zugriffsrollen_FilterUI]  DEFAULT ((1)) FOR [FilterUI]
GO
ALTER TABLE [dbo].[Zugriffsrollen_Description] ADD  CONSTRAINT [DF_Zugriffsrollen_Description_RowGuid]  DEFAULT (newsequentialid()) FOR [RowGuid]
GO
ALTER TABLE [dbo].[Zugriffsrollen_Description] ADD  CONSTRAINT [DF_Zugriffsrollen_Description_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Zuordnung_AScena_BP_resumes] ADD  CONSTRAINT [DF_Zuordnung_AScena_BP_resumes_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[Zuordnung_AScena_BP_resumes] ADD  CONSTRAINT [DF_Zuordnung_AScena_BP_resumes_logo]  DEFAULT ((0)) FOR [logo]
GO
ALTER TABLE [dbo].[Zuordnung_AScena_BP_resumes] ADD  CONSTRAINT [DF_Zuordnung_AScena_BP_resumes_Standort]  DEFAULT ((1)) FOR [Ascena_Standort]
GO
ALTER TABLE [dbo].[Zuordnung_AScena_BP_resumes] ADD  CONSTRAINT [DF_Zuordnung_AScena_BP_resumes_zugeordnet_am]  DEFAULT (getdate()) FOR [zugeordnet_am]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kundenmanagement One: Allgemein definierte Branchenstruktur im Kundenmanagement. FOREIGN KEY''s sind nicht für eine Replikation vorbereitet.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ht_Kundenmanagementbranche'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kundenmanagement One: Allgemein definierte Prioritäten im Kundenmanagement. FOREIGN KEY''s sind nicht für eine Replikation vorbereitet.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ht_Kundenmanagementprioritaet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Firmenstandort Kunde' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagement', @level2type=N'COLUMN',@level2name=N'Firmenstandort_GUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Referenz auf Eintrag aus Hoppenstedt-Liste' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagement', @level2type=N'COLUMN',@level2name=N'Firmennummer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Referenz auf eine (Sub-)Branche des Kundenmanagement.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagement', @level2type=N'COLUMN',@level2name=N'ht_Kundenmanagementbranche_GUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Beschäftigte Insgesamt Firmenstandort' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagement', @level2type=N'COLUMN',@level2name=N'BeschaeftigteInsgesamt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Beschäftigte im PLZ-Gebiet der Niederlassung Firmenstandort' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagement', @level2type=N'COLUMN',@level2name=N'BeschaeftigtePLZNiederlassung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Allgemeine Information' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagement', @level2type=N'COLUMN',@level2name=N'Information'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kundenmanagement One: Definition eines Datensatzes im Kundenmanagement. Die Definition besteht aus einem Firmenstandort (Kunde) oder einem Hoppenstedt-Firmenstandort oder beiden. Die Definition wird vervollständigt um die Aussage welcher Hays-Standort betreut diesen Firmenstandort. Zusätzlich kann auf dieser Ebene noch eine Subbranch referenziert und Merkmale abgelegt werden. FOREIGN KEY''s sind nicht für eine Replikation vorbereitet.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Übergeordnete Definition aus Tabelle Kundenmanagement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagementmerkmal', @level2type=N'COLUMN',@level2name=N'Kundenmanagement_GUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Geschätsbereiche (Specialism): C&P, engineering, Finance, Healthcare, Individualsoftware, Internal, Legal, Life Sciences, Retail, S&M, Sonstige, Standardsoftware' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagementmerkmal', @level2type=N'COLUMN',@level2name=N'ht_OperationalAreaType_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vertiebsweg permanent, contracting, temporary, internal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagementmerkmal', @level2type=N'COLUMN',@level2name=N'ht_DistributionChannelType_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zuständiger KAM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagementmerkmal', @level2type=N'COLUMN',@level2name=N'PB_Mitarbeiter_GUID_KAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Priorität' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagementmerkmal', @level2type=N'COLUMN',@level2name=N'ht_Kundenmanagementprioritaet_GUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Anzahl der externen Mitarbeiter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagementmerkmal', @level2type=N'COLUMN',@level2name=N'AnzahlExterneMitarbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Anzahl der bekannten Entscheider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagementmerkmal', @level2type=N'COLUMN',@level2name=N'AnzahlBekannterEntscheider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kunde zu vergeben' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagementmerkmal', @level2type=N'COLUMN',@level2name=N'KundeZuvergeben'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ToDo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagementmerkmal', @level2type=N'COLUMN',@level2name=N'ToDo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Änderungszeitpunkt für Feld ToDo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagementmerkmal', @level2type=N'COLUMN',@level2name=N'ToDo_geaendert_am'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kundenmanagement One: Definiert weitere Kundenmanagementmerkmale abhängig vom Geschäftsbereich (Specialism) und Vertriebsweg. Es müssen keine Kundenmanagementmerkmale für eine Definition in der Tabelle „Kundenmanagement“ vorhanden sein. FOREIGN KEY''s sind nicht für eine Replikation vorbereitet.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kundenmanagementmerkmal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Referenz zu Firmanstandort im Kundenmanagement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KundenmanagementPB_HT_Standorte', @level2type=N'COLUMN',@level2name=N'Kundenmanagement_GUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Referenz zu Standort Hays' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KundenmanagementPB_HT_Standorte', @level2type=N'COLUMN',@level2name=N'PB_HT_Standorte_GUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kundenmanagement One: Welche Firmenstandorte werden durch welchen Hays-Standort betreut.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KundenmanagementPB_HT_Standorte'
GO
