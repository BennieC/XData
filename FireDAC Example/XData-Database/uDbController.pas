unit uDbController;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL,
  FireDAC.Stan.StorageJSON, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.JSON;

type
  TDbController = class(TDataModule)
    Connection: TFDConnection;
    Query: TFDQuery;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    Batch: TFDBatchMove;
    BatchWriter: TFDBatchMoveJSONWriter;
    BatchReader: TFDBatchMoveDataSetReader;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetSchools( AStream: TStream );

    procedure GetSchoolsBatch( AStream: TStream );
  end;

var
  DbController: TDbController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDbController }

procedure TDbController.GetSchools(AStream: TStream);
begin
  if Assigned( AStream ) then
  begin
    Query.Open;
    Query.SaveToStream(AStream, sfJSON);
  end;
end;

procedure TDbController.GetSchoolsBatch(AStream: TStream);
begin
  if Assigned( AStream ) then
  begin
    BatchWriter.Stream := AStream;
    Batch.Execute;
  end;
end;

end.
