unit Unit1;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Samples.Spin,

  Redis.Commons,
  Redis.Client,
  Redis.NetLib.INDY,
  Redis.Values

    ;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    edtGET: TEdit;
    edtSET: TEdit;
    Button6: TButton;
    ledtKeyName: TLabeledEdit;
    Button7: TButton;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    FCon: IRedisClient;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Self.FCon := TRedisClient.Create();
  Self.FCon.Connect;
  Self.Button1.Enabled := False;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  oValue: TRedisString;
begin
  oValue := Self.FCon.GET(Self.ledtKeyName.Text);
  if oValue.IsNull then
  begin
    Self.edtGET.Color := clRed;
    Self.edtGET.Text  := '# A CHAVE NÃO EXISTE #';
  end else begin
    Self.edtGET.Color := clMoneyGreen;
    Self.edtGET.Text  := oValue.Value;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Self.FCon.&SET(Self.ledtKeyName.Text, Self.edtSET.Text);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
iCount : Integer;
begin
  iCount := Self.FCon.DEL([Self.ledtKeyName.Text]);
  Self.Label4.Caption := Format('Foram excluídas %d chaves', [iCount]);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  bRet: Boolean;
begin
  bRet := Self.FCon.EXPIRE(Self.ledtKeyName.Text, Self.SpinEdit1.Value);
  if bRet then
    Self.Label2.Caption := Format('O TTL foi de %d segundos', [Self.SpinEdit1.Value])
  else
    Self.Label2.Caption := 'A chave NÃO existe';
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  bRet: Boolean;
begin
  bRet := Self.FCon.EXISTS(Self.ledtKeyName.Text);
  if bRet then
    Self.Label3.Caption := 'A chave existe!'
  else
    Self.Label3.Caption := 'A chave NÃO existe!';
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  iTTL: Integer;
begin
  iTTL := Self.FCon.TTL(Self.ledtKeyName.Text);
  case iTTL of
    - 1:
      Self.Label1.Caption := 'Não foi definido um tempo de expiração';
    -2:
      Self.Label1.Caption := 'A chave NÃO existe';
  else
    Self.Label1.Caption := Format('Faltam %d segundos', [iTTL]);
  end;
end;

end.
