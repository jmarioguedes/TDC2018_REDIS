unit ServerMethodsUnit1;

interface

uses
  System.SysUtils,
  System.Classes,
  Datasnap.DSServer,
  Datasnap.DSAuth,
  System.JSON;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;
{$METHODINFO OFF}
{$METHODINFO ON}

  TTabelaVenda = class(TComponent)
  public
    function TotalVendaPorUF(AUF: string): TJSONValue;
    function UpdateVenda(AVenda: TJSONValue): Boolean;
  end;
{$METHODINFO OFF}

implementation

uses System.StrUtils,
  ServerContainerUnit1,
  Redis.Values;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

{ TTabelaVenda }

function TTabelaVenda.UpdateVenda(AVenda: TJSONValue): Boolean;
const
  C_COMANDO = 'INSERT INTO public."TB_VENDAS" ("ID_PRODUTO", "UF", "VALOR") VALUES (%d, %s, %s);';
var
  oDadosVenda: TJSONObject;
  sKey       : string;
  sComando   : string;
  iProduto   : Integer;
  sUF        : string;
  fValor     : Double;
begin
  oDadosVenda := TJSONObject(AVenda);

  iProduto := TJSONNumber(oDadosVenda.Values['ID_PRODUTO']).AsInt;
  sUF      := oDadosVenda.Values['UF'].Value;
  fValor   := TJSONNumber(oDadosVenda.Values['VALOR']).AsDouble;

  sComando := Format(C_COMANDO, [iProduto, QuotedStr(sUF), StringReplace(FloatToStr(fValor), ',', '.', [])]);

  ServerContainer1.FDConnection1.ExecSQL(sComando);

  sKey := Format('TDC2018:CACHE:TOTALVENDA:%s#', [sUF]);

  ServerContainer1.Redis.DEL([sKey]);

  Result := True;
end;

function TTabelaVenda.TotalVendaPorUF(AUF: string): TJSONValue;
var
  sKey      : string;
  oCache    : TRedisString;
  fSomaTotal: Extended;
begin
  sKey   := Format('TDC2018:CACHE:TOTALVENDA:%s#', [AUF]);
  oCache := ServerContainer1.Redis.GET(sKey);

  if oCache.HasValue then
  begin
    Result := TJSONObject.ParseJSONValue(oCache.Value);
  end else begin
    ServerContainer1.FDQuery1.Close;
    ServerContainer1.FDQuery1.ParamByName('PUF').Value := AUF;
    ServerContainer1.FDQuery1.Open();

    fSomaTotal := ServerContainer1.FDQuery1.Fields[0].Value;

    Result := TJSONObject.Create;
    TJSONObject(Result).AddPair('UF', AUF);
    TJSONObject(Result).AddPair('SOMA', TJSONNumber.Create(fSomaTotal));

    ServerContainer1.Redis.&SET(sKey, Result.ToJSON);
  end;

end;

end.
