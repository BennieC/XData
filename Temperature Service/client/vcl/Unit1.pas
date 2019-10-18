unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    txtCelsius: TEdit;
    txtFahrenheit: TEdit;
    btnGetFahrenheit: TButton;
    btnGetCelsius: TButton;
    procedure btnGetFahrenheitClick(Sender: TObject);
    procedure btnGetCelsiusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses TempConverterService, XData.Client;

procedure TForm1.btnGetCelsiusClick(Sender: TObject);
var
  LClient: TXDataClient;
  LService: ITempConverterService;
  LCelsius : double;
  LFahrenheit: double;

begin
  LClient := TXDataClient.Create;
  try
    LClient.Uri := 'http://localhost:80/flix';
    // (1)
    LFahrenheit := StrToFloat( txtFahrenheit.Text );

    LService := LClient.Service<ITempConverterService>;

    // (2)
    LCelsius := LService.GetCelsius( LFahrenheit );

    txtCelsius.Text := FloatToStr( LCelsius );
  finally
    LClient.Free;
  end;
end;

procedure TForm1.btnGetFahrenheitClick(Sender: TObject);
var
  LClient: TXDataClient;
  LService: ITempConverterService;
  LCelsius : double;
  LFahrenheit: double;

begin
  LClient := TXDataClient.Create;
  try
    LClient.Uri := 'http://localhost:80/flix';
    LCelsius := StrToFloat( txtCelsius.Text );

    LService := LClient.Service<ITempConverterService>;
    LFahrenheit := LService.GetFahrenheit(LCelsius);

    txtFahrenheit.Text := FloatToStr( LFahrenheit );
  finally
    LClient.Free;
  end;
end;

end.
