object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'FrmMain'
  ClientHeight = 411
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TDBGrid
    Left = 0
    Top = 0
    Width = 852
    Height = 411
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = Table
    Left = 360
    Top = 224
  end
  object Table: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 272
  end
  object Client: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost/flix'
    Params = <>
    Left = 576
    Top = 80
  end
  object Request: TRESTRequest
    Client = Client
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'Username'
        Options = [poDoNotEncode]
        Value = 'holger@flixments.com'
        ContentType = ctTEXT_PLAIN
      end
      item
        Kind = pkHTTPHEADER
        Name = 'Password'
        Options = [poDoNotEncode]
        Value = '13609Lesina.'
      end>
    Resource = 'ExchangeService/GetContactsAsXMLDataset'
    Response = Response
    SynchronizedEvents = False
    Left = 576
    Top = 144
  end
  object Response: TRESTResponse
    Left = 576
    Top = 208
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 168
    Top = 272
  end
end
