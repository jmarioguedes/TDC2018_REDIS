object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'TESTE DE STRESS'
  ClientHeight = 600
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -22
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 27
  object Label1: TLabel
    Left = 16
    Top = 398
    Width = 74
    Height = 27
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -22
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 556
    Top = 11
    Width = 150
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'CONECTAR'
    TabOrder = 0
    OnClick = Button1Click
  end
  object LabeledEdit1: TLabeledEdit
    Left = 16
    Top = 144
    Width = 690
    Height = 35
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    EditLabel.Width = 187
    EditLabel.Height = 27
    EditLabel.Margins.Left = 6
    EditLabel.Margins.Top = 6
    EditLabel.Margins.Right = 6
    EditLabel.Margins.Bottom = 6
    EditLabel.Caption = 'RAIZ DAS CHAVES:'
    TabOrder = 1
    Text = 'TDC2018:STRESS:'
  end
  object Button2: TButton
    Left = 16
    Top = 256
    Width = 402
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'CRIAR CEM MIL CHAVES'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 16
    Top = 336
    Width = 402
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'LER UMA CHAVE'
    TabOrder = 3
    OnClick = Button3Click
  end
  object SpinEdit1: TSpinEdit
    Left = 448
    Top = 340
    Width = 258
    Height = 37
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 50000
  end
  object Button4: TButton
    Left = 16
    Top = 480
    Width = 402
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'DELETAR TODAS AS CHAVES'
    TabOrder = 5
    OnClick = Button4Click
  end
end
