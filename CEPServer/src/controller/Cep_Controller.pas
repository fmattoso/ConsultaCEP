unit Cep_Controller;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  CepService_Interface, Cep_Model, Cep_Service;

type
  TCepController = class
  private
    FService: ICepService;
    FModel: TCepModel;
  public
    constructor Create;
    destructor Destroy; override;

    function ConsultarCep(const ACep: string): string;
  end;
implementation

constructor TCepController.Create;
begin
  FService := TCepService.Create;
  FModel := TCepModel.Create(FService);
end;

destructor TCepController.Destroy;
begin
  FModel.Free;
  inherited;
end;

function TCepController.ConsultarCep(const ACep: string): string;
begin
  Result := FModel.Consultar(ACep);
end;

end.
