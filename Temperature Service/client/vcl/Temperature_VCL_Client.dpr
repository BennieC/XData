program Temperature_VCL_Client;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  TempConverterService in '..\..\server\TempConverterService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
