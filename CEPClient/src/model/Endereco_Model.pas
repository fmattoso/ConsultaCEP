unit Endereco_Model;

interface

uses
  System.SysUtils, System.JSON;

type
  TEndereco = class
  private
    FCep: string;
    FLogradouro: string;
    FBairro: string;
    FCidade: string;
    FUF: string;
  public
    procedure FromJson(const AJson: string);

    property Cep: string read FCep;
    property Logradouro: string read FLogradouro;
    property Bairro: string read FBairro;
    property Cidade: string read FCidade;
    property UF: string read FUF;
  end;
implementation

procedure TEndereco.FromJson(const AJson: string);
var
  JsonObj: TJSONObject;
begin
  JsonObj := TJSONObject.ParseJSONValue(AJson) as TJSONObject;
  try
    if JsonObj = nil then
      raise Exception.Create('JSON inválido.');

    FCep := JsonObj.GetValue<string>('cep', '');
    FLogradouro := jsonObj.GetValue<string>('logradouro', '');
    FBairro := JsonObj.GetValue<string>('bairro', '');
    FCidade := JSonObj.GetValue<string>('localidade', '');
    FUF := JSonObj.GetValue<string>('uf', '');
  finally
    JsonObj.Free;
  end;
end;

end.
