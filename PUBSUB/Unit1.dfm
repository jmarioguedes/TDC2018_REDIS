object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Exemplo de Publica'#231#227'o e Assinatura'
  ClientHeight = 355
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 392
    Height = 273
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 304
    Width = 75
    Height = 25
    Caption = 'CONECTAR'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 89
    Top = 304
    Width = 75
    Height = 25
    Caption = 'ENVIAR'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 170
    Top = 306
    Width = 230
    Height = 21
    TabOrder = 3
    Text = 'Ol'#225' Mundo!'
  end
end
