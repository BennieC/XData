unit uSchoolService;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  System.Classes;

type
  [ServiceContract]
  ISchoolService = interface(IInvokable)
    ['{70F42313-1FD6-4BFF-B870-5E272199CF76}']

    [HttpGet]
    function GetSchools : TStream;
  end;



implementation



{ TSchoolService }




end.
