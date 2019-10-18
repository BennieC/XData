unit ExchangeService;

interface

uses
  Classes,
  XData.Server.Module,
  XData.Service.Common,
  XData.Sys.Exceptions;

type
  [ServiceContract]
  IExchangeService = interface(IInvokable)
    ['{F1DD2E9E-A907-467E-8F91-E49BF872C6EA}']

    [HttpGet]
    function GetContactsAsXMLDataset: TStream;
  end;

  [ServiceImplementation]
  TExchangeService = class(TInterfacedObject, IExchangeService)

    function GetContactsAsXMLDataset: TStream;
  end;

implementation
uses uDbController, SysUtils,FireDAC.Stan.Intf, FireDAC.Comp.Client;


{ TExchangeService }

function TExchangeService.GetContactsAsXMLDataset: TStream;
var
  LUser,
  LPassword: String;
  LConnection: TFDCustomConnection;
  LMem: TStringStream;
begin
  // get username and password from header
  if TXDataOperationContext.Current.Request.Headers.Exists('Username')
    and
     TXDataOperationContext.Current.Request.Headers.Exists('Password') then
  begin
    LUser := TXDataOperationContext.Current.Request.Headers.Get('Username');
    LPassword := TXDataOperationContext.Current.Request.Headers.Get('Password');

    LMem := TStringStream.Create;
    Result := nil;

    // create db controller -- demo -- this
    LConnection := DbController.Connection;
    LConnection.Close;

    LConnection.Params.UserName := LUser;
    LConnection.Params.Password := LPassword;

    DbController.AllContacts.Open;
    DbController.AllContacts.SaveToStream(LMem, sfXML );

    Result := LMem;
  end
  else
  begin
    raise EXDataHttpException.Create(404, 'Not found');

  end;

end;

initialization
  RegisterServiceType(TypeInfo(IExchangeService));
  RegisterServiceType(TExchangeService);

end.
