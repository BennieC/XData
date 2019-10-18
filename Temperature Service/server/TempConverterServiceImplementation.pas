unit TempConverterServiceImplementation;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  TempConverterService;

type
  [ServiceImplementation]
  TTempConverterService = class(TInterfacedObject, ITempConverterService)
    function GetCelsius( F: double ): double;
    function GetFahrenheit( C: double ): double;

  end;

implementation

{ TTempConverterService }

function TTempConverterService.GetCelsius(F: double): double;
begin
  Result :=  (F - 32) * (5/9);
end;

function TTempConverterService.GetFahrenheit(C: double): double;
begin
  Result :=  C * (9/5) + 32;
end;

initialization
  RegisterServiceType(TTempConverterService);

end.
