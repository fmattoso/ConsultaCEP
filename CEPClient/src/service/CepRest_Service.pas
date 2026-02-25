unit CepRest_Service;

interface

uses
  System.SysUtils, System.JSON, System.Net.HttpClient, CepRestService_Interface;

type
  TCepRestService = class(TInterfacedObject, ICepRestService)
  private
    FBaseURL: string;
    function ExtrairResult(const AResponse: string): string;
  public
    constructor Create;
    function Consultar(const ACep: string): string;
  end;

implementation

constructor TCepRestService.Create;
begin
  FBaseURL := 'http://localhost:8080/datasnap/rest/TServerMethods1/ConsultarCep/';
end;

function TCepRestService.Consultar(const ACep: string): string;
var
  Http: THTTPClient;
  Resp: IHTTPResponse;
begin
  Http := THTTPClient.Create;
  try
    Http.ConnectionTimeout := 3000;
    Http.ResponseTimeout := 3000;

    Resp := Http.Get(FBaseURL + ACep);

    if Resp.StatusCode <> 200 then
      raise Exception.Create('Erro ao consultar servidor');

    // Questão do Snap encapsular o retorno com "result": []
    Result := ExtrairResult(Resp.ContentAsString());
//    Result := Resp.ContentAsString();
  finally
    Http.Free;
  end;
end;

function TCepRestService.ExtrairResult(const AResponse: string): string;
var
  Root: TJSONObject;
  Arr: TJSONArray;
begin
  Root := TJSONObject.ParseJSONValue(AResponse) as TJSONObject;
  try
    if not Root.TryGetValue<TJSONArray>('result', Arr) then
      raise Exception.Create('Formato inesperado do DataSnap');

    if Arr.Count = 0 then
      raise Exception.Create('Resposta vazia');

    Result := Arr.Items[0].Value;
  finally
    Root.Free;
  end;
end;

end.
