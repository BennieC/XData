object ServerContainer: TServerContainer
  OldCreateOrder = False
  Height = 210
  Width = 431
  object SparkleHttpSysDispatcher: TSparkleHttpSysDispatcher
    Active = True
    Left = 72
    Top = 16
  end
  object XDataServer: TXDataServer
    BaseUrl = 'http://+:80/flix'
    Dispatcher = SparkleHttpSysDispatcher
    EntitySetPermissions = <>
    Left = 216
    Top = 16
  end
end
