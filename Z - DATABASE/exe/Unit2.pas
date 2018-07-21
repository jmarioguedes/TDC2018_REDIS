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
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait,
  Vcl.StdCtrls,
  Data.DB,
  FireDAC.Comp.Client;

type
  TForm2 = class(TForm)
    FDConnection1: TFDConnection;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure AlimentarDB;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
{ TForm2 }

procedure TForm2.AlimentarDB;
var
  i     : Integer;
  SQL   : TextFile;
  sLinha: string;
begin
  Self.FDConnection1.ExecSQL('TRUNCATE TABLE public."TB_VENDAS";');

  try
    AssignFile(SQL, 'C:\fontes_TDC2018\Z - DATABASE\script_sql.txt');
    Reset(SQL);
    while not Eof(SQL) do
    begin
      Readln(SQL, sLinha);
      Self.FDConnection1.ExecSQL(sLinha);
    end;
  finally
    CloseFile(SQL);
  end;

  ShowMessage('Fim do processamento!');
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Self.AlimentarDB;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Self.FDConnection1.Open();
end;

end.
