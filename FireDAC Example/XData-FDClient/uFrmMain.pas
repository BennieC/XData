unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageJSON, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmMain = class(TForm)
    Grid: TDBGrid;
    Table: TFDMemTable;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure LoadData;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
uses
  XData.Client,
  uSchoolService;

{$R *.dfm}

procedure TFrmMain.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrmMain.LoadData;
var
  LClient: TXDataClient;
  LService: ISchoolService;

  LStream: TMemoryStream;

begin
  LClient := TXDataClient.Create;

  LClient.Uri := 'http://localhost:80/flix';
  LService := LClient.Service<ISchoolService>;

  LStream := TMemoryStream.Create;
  try
    LStream := LService.GetSchools as TMemoryStream;

    LStream.Position := 0;
    Table.LoadFromStream(LStream, sfJSON );
  finally
    LStream.Free;
  end;

end;

end.
