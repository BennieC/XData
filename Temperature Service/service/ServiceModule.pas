unit ServiceModule;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs;

type
  TXDataTempServer = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceShutdown(Sender: TService);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  XDataTempServer: TXDataTempServer;

implementation

uses
  Server;

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  XDataTempServer.Controller(CtrlCode);
end;

function TXDataTempServer.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TXDataTempServer.ServiceShutdown(Sender: TService);
begin
  StopServer;
end;

procedure TXDataTempServer.ServiceStart(Sender: TService; var Started: Boolean);
begin
  StartServer;
end;

procedure TXDataTempServer.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  StopServer;
end;

end.
