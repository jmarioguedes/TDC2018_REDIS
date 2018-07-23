object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'TESTE DE STRESS'
  ClientHeight = 360
  ClientWidth = 836
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -22
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 27
  object Label1: TLabel
    Left = 11
    Top = 302
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
  object LabeledEdit1: TLabeledEdit
    Left = 11
    Top = 48
    Width = 801
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
    TabOrder = 0
    Text = 'TDC2018:STRESS'
  end
  object Button2: TButton
    Left = 6
    Top = 95
    Width = 402
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'CRIAR CEM MIL CHAVES'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 11
    Top = 240
    Width = 402
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'LER UMA CHAVE'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 410
    Top = 95
    Width = 402
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'DELETAR TODAS AS CHAVES'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 11
    Top = 196
    Width = 801
    Height = 35
    TabOrder = 4
    Text = 'TDC2018:STRESS:5000#'
  end
end
