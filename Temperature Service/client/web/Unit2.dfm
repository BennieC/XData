object Form2: TForm2
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TabOrder = 1
  object txtCelsius: TWebEdit
    Left = 32
    Top = 32
    Width = 121
    Height = 19
    Text = '20'
  end
  object txtFahrenheit: TWebEdit
    Left = 32
    Top = 64
    Width = 121
    Height = 19
    Text = 'txtFahrenheit'
  end
  object btnGetFahrenheit: TWebButton
    Left = 168
    Top = 30
    Width = 96
    Height = 25
    Caption = 'Get Fahrenheit'
    OnClick = btnGetFahrenheitClick
  end
  object btnGetCelsius: TWebButton
    Left = 168
    Top = 61
    Width = 96
    Height = 25
    Caption = 'Get Celsius'
    OnClick = btnGetCelsiusClick
  end
  object WebConnection: TXDataWebConnection
    URL = 'http://localhost:80/flix'
    Connected = True
    Left = 328
    Top = 40
  end
  object WebClient: TXDataWebClient
    Connection = WebConnection
    Left = 456
    Top = 40
  end
end
