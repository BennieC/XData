object DbController: TDbController
  OldCreateOrder = False
  Height = 372
  Width = 438
  object Connection: TFDConnection
    Params.Strings = (
      'Database=leecounty'
      'Server=HOLSTINDESK'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    ResourceOptions.AssignedValues = [rvStoreItems]
    ResourceOptions.StoreItems = [siMeta, siData]
    LoginPrompt = False
    Left = 64
    Top = 40
  end
  object Query: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT * FROM schools')
    Left = 64
    Top = 112
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 208
    Top = 32
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 208
    Top = 120
  end
  object Batch: TFDBatchMove
    Reader = BatchReader
    Writer = BatchWriter
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 64
    Top = 184
  end
  object BatchWriter: TFDBatchMoveJSONWriter
    DataDef.Fields = <>
    Left = 184
    Top = 248
  end
  object BatchReader: TFDBatchMoveDataSetReader
    DataSet = Query
    Left = 184
    Top = 184
  end
end
