object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Comandos Simples de Tudo'
  ClientHeight = 620
  ClientWidth = 814
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
    Left = 224
    Top = 555
    Width = 64
    Height = 27
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 360
    Top = 493
    Width = 64
    Height = 27
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 304
    Top = 360
    Width = 64
    Height = 27
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 304
    Top = 298
    Width = 64
    Height = 27
    Caption = 'Label4'
  end
  object Button1: TButton
    Left = 634
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
  object Button2: TButton
    Left = 112
    Top = 226
    Width = 150
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'GET'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 112
    Top = 164
    Width = 150
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'SET'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 112
    Top = 288
    Width = 150
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'DELETE'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 32
    Top = 483
    Width = 150
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'EXPIRE'
    TabOrder = 4
    OnClick = Button5Click
  end
  object edtGET: TEdit
    Left = 304
    Top = 233
    Width = 480
    Height = 35
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    TabOrder = 5
  end
  object edtSET: TEdit
    Left = 304
    Top = 171
    Width = 480
    Height = 35
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    TabOrder = 6
    Text = 'OLA MUNDO'
  end
  object Button6: TButton
    Left = 112
    Top = 350
    Width = 150
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'EXISTS'
    TabOrder = 7
    OnClick = Button6Click
  end
  object ledtKeyName: TLabeledEdit
    Left = 16
    Top = 96
    Width = 768
    Height = 35
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    EditLabel.Width = 152
    EditLabel.Height = 27
    EditLabel.Margins.Left = 6
    EditLabel.Margins.Top = 6
    EditLabel.Margins.Right = 6
    EditLabel.Margins.Bottom = 6
    EditLabel.Caption = 'Nome da chave'
    TabOrder = 8
    Text = 'EVENTO:TDC:2018'
  end
  object Button7: TButton
    Left = 32
    Top = 545
    Width = 150
    Height = 50
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'TTL'
    TabOrder = 9
    OnClick = Button7Click
  end
  object SpinEdit1: TSpinEdit
    Left = 224
    Top = 490
    Width = 121
    Height = 37
    MaxValue = 0
    MinValue = 0
    TabOrder = 10
    Value = 10
  end
end
