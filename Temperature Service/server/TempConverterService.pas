unit TempConverterService;

interface

uses
  XData.Service.Common;
type
  [ServiceContract]
  ITempConverterService = interface(IInvokable)
    ['{DF524F14-88A5-4B36-9B81-516776DC436B}']
    [HttpGet]
    function GetCelsius( F: double ): double;

    [HttpGet]
    function GetFahrenheit( C: double ): double;

  end;

implementation

initialization
  RegisterServiceType(TypeInfo(ITempConverterService));

end.
