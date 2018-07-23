unit Unit2;

interface

uses Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  IPPeerServer,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,

  Redis.Commons,
  Redis.Client;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses ServerContainerUnit1,
  System.JSON;

procedure TForm2.Button1Click(Sender: TObject);
var
  slLuaVai    : TStringList;
  oJSONArray  : TJSONArray;
  oItemArray  : TJSONArray;
  oItem       : TJSONValue;
  oCMD        : IRedisCommand;
  sRedisResult: string;
begin
  Self.Memo1.Clear;
  slLuaVai := TStringList.Create;

  try
    with slLuaVai do
    begin
      Add('local ret = {}');
      Add('local keys = redis.call("KEYS", "TDC2018:SESSION:*#")');
      Add('if (keys) then');
      Add('  for i, item  in ipairs(keys) do');
      Add('    local session = redis.call("HMGET", item, "NOME")');
      Add('    table.insert(session, item)');
      Add('    table.insert(session, tostring(redis.call("TTL", item)))');
      Add('    table.insert(ret, session)');
      Add('  end');
      Add('end');
      Add('return cjson.encode(ret)');
    end;

    oCMD := NewRedisCommand('EVAL');
    oCMD.Add(slLuaVai.Text).Add(0);

    sRedisResult := ServerContainer1.Redis.ExecuteWithStringResult(oCMD);

    oJSONArray := TJSONArray(TJSONObject.ParseJSONValue(sRedisResult));

    for oItem in oJSONArray do
    begin
      oItemArray := TJSONArray(oItem);
      Self.Memo1.Lines.Add(oItemArray.ToJSON);
    end;

  finally
    slLuaVai.Free;
  end;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Self.Label1.Caption := Format('SERVIDOR DATASNAP NA PORTA %d', [ServerContainer1.DSHTTPService1.HttpPort]);
end;

end.
