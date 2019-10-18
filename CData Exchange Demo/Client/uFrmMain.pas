unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.StorageXML;

type
  TFrmMain = class(TForm)
    Grid: TDBGrid;
    DataSource1: TDataSource;
    Table: TFDMemTable;
    Client: TRESTClient;
    Request: TRESTRequest;
    Response: TRESTResponse;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
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

{$R *.dfm}

procedure TFrmMain.FormShow(Sender: TObject);
begin
  Request.ExecuteAsync( LoadData );
end;

procedure TFrmMain.LoadData;
var
  LStream: TBytesStream;

begin

  if Response.StatusCode = 200 then
  begin
    LStream := TBytesStream.Create(Response.RawBytes);
    LStream.Position := 0;
    Table.LoadFromStream(LStream, sfXML);
    LStream.Free;
  end;
end;

end.
