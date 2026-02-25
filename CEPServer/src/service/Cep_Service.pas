unit Cep_Service;

interface

uses
  System.SysUtils, System.Generics.Collections,
  CepService_Interface, CepProvider_Interface;

type
  TCepService = class(TInterfacedObject, ICepService)
  private
    FProviders: TList<ICepProvider>;
  public
    constructor Create;
    destructor Destroy; override;
    function ConsultarCep(const ACep: string): string;
  end;

implementation

uses
  ViaCep_Provider, ApiCep_Provider, AwesomeCep_Provider;

constructor TCepService.Create;
begin
  FProviders := TList<ICepProvider>.Create;
  FProviders.Add(TViaCepProvider.Create);
  FProviders.Add(TApiCepProvider.Create);
  FProviders.Add(TAwesomeCepProvider.Create);
end;

destructor TCepService.Destroy;
begin
  FProviders.Free;
  inherited;
end;

function TCepService.ConsultarCep(const ACep: string): string;
var
  Provider: ICepProvider;
begin
  for Provider in FProviders do
  begin
    try
      Result := Provider.Consultar(ACep);
      if Result <> '' then
        Exit;
    except
      // silencioso, ignora e tenta o próximo ...
    end;
  end;

  raise Exception.Create('Todos os serviços estão indisponíveis.');
end;

end.
