program FlixTemperatureServer;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Server in 'Server.pas',
  TempConverterService in 'TempConverterService.pas',
  TempConverterServiceImplementation in 'TempConverterServiceImplementation.pas';

var
  InputText : string;

begin
  try
    Write('Starting server... ');
    StartServer;
    WriteLn('done.');
    WriteLn('');

    Write('Press ENTER to stop the server and quit.');
    ReadLn(InputText);

    WriteLn('');
    Write('Stopping server... ');
    StopServer;
    WriteLn('done.');
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
