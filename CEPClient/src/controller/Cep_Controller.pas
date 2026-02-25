unit Cep_Controller;

interface

uses
  System.SysUtils, CepRestService_Interface, CepRest_Service, Endereco_Model;

type
  TCepController = class
  private
    FService: ICepRestService;
  public
    constructor Create;
    function ConsultarCep(const ACep: string): TEndereco;
  end;

implementation

constructor TCepController.Create;
begin
  FService := TCepRestService.Create;
end;

function TCepController.ConsultarCep(const ACep: string): TEndereco;
var
  Json: string;
begin
  Json := FService.Consultar(ACep);

  Result := TEndereco.Create;
  try
    Result.FromJson(Json);
  except
    Result.Free;
    raise
  end;
end;

end.
