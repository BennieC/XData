unit uSchoolServiceImpl;

interface
uses
  XData.Server.Module,
  XData.Service.Common,
  System.Classes,
  uSchoolService;

type
  [ServiceImplementation]
  TSchoolService = class(TInterfacedObject, ISchoolService)
    function GetSchools : TStream;
  end;

implementation
uses uDbController;

function TSchoolService.GetSchools: TStream;
var
  LResult: TMemoryStream;

begin
  LResult := TMemoryStream.Create;
  DbController.GetSchools( LResult );

  Result := LResult;
end;

initialization
  RegisterServiceType(TypeInfo(ISchoolService));
  RegisterServiceType(TSchoolService);

end.
