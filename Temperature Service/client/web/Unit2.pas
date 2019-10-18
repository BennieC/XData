unit Unit2;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.StdCtrls, WEBLib.StdCtrls, Vcl.Controls,
  XData.Web.Client, XData.Web.Connection;

type
  TForm2 = class(TWebForm)
    txtCelsius: TWebEdit;
    txtFahrenheit: TWebEdit;
    btnGetFahrenheit: TWebButton;
    btnGetCelsius: TWebButton;
    WebConnection: TXDataWebConnection;
    WebClient: TXDataWebClient;
    procedure btnGetFahrenheitClick(Sender: TObject);
    procedure btnGetCelsiusClick(Sender: TObject);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}



procedure TForm2.btnGetCelsiusClick(Sender: TObject);
procedure OnResponse( Response: TXDataClientResponse );
  begin
    txtCelsius.Text := string( TJSObject( Response.Result )['value'] );
  end;

var
 LFahrenheit: double;

begin
  LFahrenheit := StrToFloat( txtFahrenheit.Text );

  WebClient.RawInvoke( 'ITempConverterService.GetCelsius',
    [ LFahrenheit ], @OnResponse );
end;

procedure TForm2.btnGetFahrenheitClick(Sender: TObject);
  procedure OnResponse( Response: TXDataClientResponse );
  begin
    txtFahrenheit.Text := string( TJSObject( Response.Result )['value'] );
  end;

var
 LCelsius: double;

begin
  LCelsius := StrToFloat( txtCelsius.Text );

  WebClient.RawInvoke( 'ITempConverterService.GetFahrenheit',
    [ LCelsius ], @OnResponse );
end;

end.
