unit uTempItem;

interface

type
  TTempItem = class
  private
    FCelsius: double;
    FFahrenheit: double;

  public
    constructor Create( C, F : double );

  published
    property Celsius: double read FCelsius write FCelsius;
    property Fahrenheit: double read FFahrenheit write FFahrenheit;

  end;

implementation

{ TTempItem }

constructor TTempItem.Create(C, F: double);
begin
  inherited Create;

  self.Celsius := C;
  self.Fahrenheit := F;
end;

end.
