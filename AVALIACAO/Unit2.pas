unit Unit2;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,

  Redis.Commons,
  Redis.Client,
  Redis.NetLib.INDY,
  Redis.Values,
  Vcl.Samples.Spin

    ;

type
  TForm2 = class(TForm)
    Button1: TButton;
    LabeledEdit1: TLabeledEdit;
    Button2: TButton;
    Button3: TButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    FCon: IRedisClient;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Self.FCon := TRedisClient.Create();
  Self.FCon.Connect;
  Self.Button1.Enabled := False;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  iCount: Integer;
  sKey  : string;
  sValue: string;
  cTime : Cardinal;
begin
  cTime := GetTickCount();

  Self.Cursor := crHourGlass;
  Application.ProcessMessages;
  for iCount := 1 to 100000 do
  begin
    sKey   := Self.LabeledEdit1.Text + IntToStr(iCount);
    sValue := Format('O valor desta chave é: [%d]', [iCount]);
    Self.FCon.&SET(sKey, sValue);
  end;
  Self.Cursor := crDefault;
  Application.ProcessMessages;

  cTime := GetTickCount() - cTime;
  ShowMessageFmt('Tempo de execução: [%f] segundos', [cTime / 1000]);
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  sKey  : string;
  oValue: TRedisString;
  cTime : Cardinal;
begin
  cTime := GetTickCount();

  sKey   := Self.LabeledEdit1.Text + IntToStr(Self.SpinEdit1.Value);
  oValue := Self.FCon.GET(sKey);
  if oValue.IsNull then
    Self.Label1.Caption := '# A CHAVE NÃO EXISTE#'
  else
    Self.Label1.Caption := oValue.Value;

  cTime := GetTickCount() - cTime;
  ShowMessageFmt('Tempo de execução: [%d] milisegundos', [cTime]);
end;

procedure TForm2.Button4Click(Sender: TObject);
var
  iCount: Integer;
  sKey  : string;
  cTime : Cardinal;
begin
  cTime := GetTickCount();

  Self.Cursor := crHourGlass;
  Application.ProcessMessages;
  for iCount := 1 to 100000 do
  begin
    sKey := Self.LabeledEdit1.Text + IntToStr(iCount);
    Self.FCon.DEL([sKey]);
  end;
  Self.Cursor := crDefault;
  Application.ProcessMessages;

  cTime := GetTickCount() - cTime;
  ShowMessageFmt('Tempo de execução: [%f] segundos', [cTime / 1000]);
end;

end.
