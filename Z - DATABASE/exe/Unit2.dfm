object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'POPULADOR'
  ClientHeight = 144
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'PROCESSAR'
    TabOrder = 0
    OnClick = Button1Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'ApplicationName=TDC2018'
      'Password=postgres'
      'Server=localhost'
      'User_Name=postgres'
      'Database=TDC2018')
    LoginPrompt = False
    Left = 176
    Top = 32
  end
end
