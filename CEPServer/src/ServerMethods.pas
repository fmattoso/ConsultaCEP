unit ServerMethods;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function ConsultarCep(const ACep: string): string;
  end;
{$METHODINFO OFF}

implementation


uses System.StrUtils, Cep_Controller;

function TServerMethods1.ConsultarCep(const ACep: string): string;
var
  CepController: TCepController;
begin
  CepController := TCepController.Create;
  try
    Result := CepController.ConsultarCep(ACep);
  finally
    CepController.Free;
  end;
end;

end.

