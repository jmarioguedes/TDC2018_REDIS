unit ServerContainerUnit1;

interface

uses
  System.SysUtils,
  System.DateUtils,
  System.Classes,
  Data.DBXPlatform,
  Datasnap.DSHTTPCommon,
  Datasnap.DSHTTP,
  Datasnap.DSServer,
  Datasnap.DSCommonServer,
  Datasnap.DSSession,
  Datasnap.DSNames,
  IPPeerServer,
  IPPeerAPI,
  Datasnap.DSAuth,
  Redis.Commons,
  Redis.Client,
  Redis.NetLib.INDY,
  Redis.Values,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client;

type
  TServerContainer1 = class(TDataModule)
    DSServer1: TDSServer;
    DSHTTPService1: TDSHTTPService;
    DSAuthenticationManager1: TDSAuthenticationManager;
    DSServerClass1: TDSServerClass;
    FDConnection1: TFDConnection;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManager1UserAuthorize(Sender: TObject; EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject; const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure DataModuleCreate(Sender: TObject);
    procedure DSHTTPService1HTTPTrace(Sender: TObject; AContext: TDSHTTPContext; ARequest: TDSHTTPRequest; AResponse: TDSHTTPResponse);
  private
    FCon: IRedisClient;
    function AutenticarUsuario(const AUsuario: string; const ASenha: string; var ASession: string; out AMotivo: string): Boolean;
  public

  end;

var
  ServerContainer1: TServerContainer1;

implementation

{$R *.dfm}

uses
  ServerMethodsUnit1,
  Winapi.ActiveX,
  Vcl.Dialogs;

threadvar _USUARIO: string;
threadvar _SENHA: string;
threadvar _CSID: string;
threadvar _DATA_INICIO: TDateTime;

procedure TServerContainer1.DSServerClass1GetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit1.TServerMethods1;
end;

function TServerContainer1.AutenticarUsuario(const AUsuario, ASenha: string; var ASession: string; out AMotivo: string): Boolean;
const
  SESSION_KEY = 'TDC2018:SESSION:%s#';
var
  sKeyName      : string;
  oGUID         : TGUID;
  aKeys         : TArray<string>;
  aValues       : TArray<string>;
  i             : Integer;
  oSession      : TDSSession;
  bValidarSessao: Boolean;
  aDataSession  : TRedisArray;
begin
{$REGION 'Inicializando as variáveis'}
  oSession := TDSSessionManager.GetThreadSession;
  SetLength(aKeys, 4);

  aKeys[0] := 'NOME';
  aKeys[1] := 'EVENTO';
  aKeys[2] := 'TRILHA';
  aKeys[3] := 'PALESTRA';

  bValidarSessao := (ASession <> EmptyStr);
{$ENDREGION}
  case bValidarSessao of

    True:
      begin
{$REGION 'Buscando a sessão no REDIS, aumentando o TTL'}
        sKeyName := Format(SESSION_KEY, [ASession]);
        Result   := Self.FCon.EXISTS(sKeyName);
        if Result then
        begin
          aDataSession := Self.FCon.HMGET(sKeyName, aKeys);
          Self.FCon.EXPIRE(sKeyName, 3600);

          for i := 0 to 3 do
          begin
            oSession.PutData(aKeys[i], aDataSession.Value[i].Value);
          end;
        end;
{$ENDREGION}
      end;

    False:
      begin
{$REGION 'Validando o usuário'}
        // Obviamente que seria feita uma consulta ao banco de dados
        Result := (LowerCase(AUsuario) = 'mario.guedes') and (ASenha = '123456');
        if not Result then
        begin
          Exit(False);
        end;
{$ENDREGION}
{$REGION 'Criando uma nova sessão'}
        if CoCreateGuid(oGUID) = S_OK then
        begin
          ASession := GUIDToString(oGUID);
        end;
        sKeyName := Format(SESSION_KEY, [ASession]);
        ASession := GUIDToString(oGUID);
{$ENDREGION}
{$REGION 'Dados do usuário que viriam do banco de dados'}
        SetLength(aValues, 4);
        aValues[0] := 'MARIO GUEDES';
        aValues[1] := 'TDC-SP 2018';
        aValues[2] := 'Trilha Rad Delphi / C++';
        aValues[3] := 'Possibilidades com o REDIS no Delphi';
{$ENDREGION}
{$REGION 'Registrando as informações da sessão'}
        for i := 0 to 3 do
        begin
          oSession.PutData(aKeys[i], aValues[i]);
        end;
{$ENDREGION}
{$REGION 'Registrando no REDIS''}
        with Self.FCon do
        begin
          HMSET(sKeyName, aKeys, aValues);
          EXPIRE(sKeyName, 3600);
        end;
{$ENDREGION}
      end;

  end;

end;

procedure TServerContainer1.DataModuleCreate(Sender: TObject);
begin
  Self.FCon := TRedisClient.Create();
  Self.FCon.Connect;

  Self.FDConnection1.Open();
end;

procedure TServerContainer1.DSAuthenticationManager1UserAuthenticate(Sender: TObject; const Protocol, Context, User, Password: string; var valid: Boolean;
  UserRoles: TStrings);
begin
  _USUARIO     := User;
  _SENHA       := Password;
  _DATA_INICIO := Now;
  valid        := True;
end;

procedure TServerContainer1.DSAuthenticationManager1UserAuthorize(Sender: TObject; EventObject: TDSAuthorizeEventObject; var valid: Boolean);
var
  oSession    : TDSSession;
  sMotivo     : string;
  bAutenticado: Boolean;
  oInvocation : TDSInvocationMetadata;
  sBrainID    : string;
begin
  sBrainID    := EmptyStr;
  oInvocation := GetInvocationMetadata(False);

  if (Assigned(oInvocation)) then
  begin
    if (_USUARIO = EmptyStr) then
    begin
      sBrainID := oInvocation.QueryParams.Values['TDCSESSION'];
    end;
  end;

  bAutenticado := Self.AutenticarUsuario(_USUARIO, _SENHA, sBrainID, sMotivo);
  _CSID        := Format('TDCSESSION=%s', [sBrainID]);

  oSession := TDSSessionManager.GetThreadSession;

  valid := (bAutenticado) and (Assigned(oSession));
end;

procedure TServerContainer1.DSHTTPService1HTTPTrace(Sender: TObject; AContext: TDSHTTPContext; ARequest: TDSHTTPRequest; AResponse: TDSHTTPResponse);
var
  iTempoDuracao: Integer;
  _injection   : TDSHTTPResponseIndy;
begin
  iTempoDuracao := MilliSecondsBetween(Now, _DATA_INICIO);
  _injection    := TDSHTTPResponseIndy(AResponse);

  _injection.ResponseInfo.Pragma := _CSID;
  _injection.ResponseInfo.CustomHeaders.Values['Cache-Control'] := 'no-cache';
  _injection.ResponseInfo.CustomHeaders.Values['Server'] := 'Servidor TDC2018';
  _injection.ResponseInfo.CustomHeaders.Values['X-tempo-processamento'] := Format('%d milisegundos', [iTempoDuracao]);
end;

end.
