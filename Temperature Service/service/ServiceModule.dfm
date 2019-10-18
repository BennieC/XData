object XDataTempServer: TXDataTempServer
  OldCreateOrder = False
  AllowPause = False
  DisplayName = 'XData Temperature Service'
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
end
