unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Threading,

  Redis.Commons, Redis.Client, Redis.NetLib.INDY, Redis.Values

  ;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
      FTask: ITask;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Self.Button1.Enabled := False;

  Self.FTask := TTask.Run(

    procedure
    var
    oRedis: IRedisClient;
    iQtd: Integer;
    begin

      oRedis := NewRedisClient();

      while TTask.CurrentTask.Status <> TTaskStatus.Canceled do
        begin
        Sleep(100);
        iQtd := oRedis.RPUSH('ID2017:EXEMPLO:FILA', ['ITEM #1', 'ITEM #2']);

        TThread.Synchronize(
          nil,

          procedure
          begin
            Self.Label1.Caption := IntToStr(iQtd);
          end
        );


        end;

    end

  );

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Self.FTask) then
  begin
    Self.FTask.Cancel();
  end;
end;

end.
