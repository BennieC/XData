program XDataDatabase;

uses
  Vcl.Forms,
  uServerContainer in 'uServerContainer.pas' {ServerContainer: TDataModule},
  uMainForm in 'uMainForm.pas' {MainForm},
  uDbController in 'uDbController.pas' {DbController: TDataModule},
  uSchoolService in 'uSchoolService.pas',
  uSchoolServiceImpl in 'uSchoolServiceImpl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDbController, DbController);
  Application.Run;
end.
