object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 104
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object txtCelsius: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '28'
  end
  object txtFahrenheit: TEdit
    Left = 8
    Top = 51
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnGetFahrenheit: TButton
    Left = 152
    Top = 22
    Width = 105
    Height = 25
    Caption = 'Get Fahrenheit'
    TabOrder = 2
    OnClick = btnGetFahrenheitClick
  end
  object btnGetCelsius: TButton
    Left = 152
    Top = 49
    Width = 105
    Height = 25
    Caption = 'Get Celsius'
    TabOrder = 3
    OnClick = btnGetCelsiusClick
  end
end
