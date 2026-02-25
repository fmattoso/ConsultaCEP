unit Endereco;

interface

type
  TEndereco = class
  private
    FCep: string;
    FLogradouro: string;
    FBairro: string;
    FCidade: string;
    FUF: string;
  public
    property Cep: string read FCep write FCep;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Bairro: string read FBairro write FBairro;
    property Cidade: string read FCidade write FCidade;
    property UF: string read FUF write FUF;
  end;
implementation

end.
