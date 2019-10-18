object DbController: TDbController
  OldCreateOrder = False
  Height = 340
  Width = 363
  object Connection: TFDConnection
    Params.Strings = (
      'Password='
      'User='
      'ConnectionDef=Flixments')
    LoginPrompt = False
    Left = 96
    Top = 33
  end
  object AllContacts: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from contacts')
    Left = 96
    Top = 96
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 96
    Top = 152
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 96
    Top = 208
  end
end
