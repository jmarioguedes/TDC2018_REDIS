object Form2: TForm2
  Left = 48
  Top = 50
  Caption = 'SERVIDOR DATASNAP'
  ClientHeight = 342
  ClientWidth = 897
  Color = clRed
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 622
    Height = 39
    Caption = 'SERVIDOR DATASNAP NA PORTA 8080'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label2: TLabel
    Left = 184
    Top = 65
    Width = 60
    Height = 25
    Caption = 'Label2'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Memo1: TMemo
    Left = 24
    Top = 96
    Width = 857
    Height = 238
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 24
    Top = 65
    Width = 145
    Height = 25
    Caption = 'LISTAR SESS'#213'ES'
    TabOrder = 1
    OnClick = Button1Click
  end
end
