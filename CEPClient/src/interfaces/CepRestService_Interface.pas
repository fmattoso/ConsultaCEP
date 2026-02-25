unit CepRestService_Interface;

interface

type
  ICepRestService = interface
    ['{D64F45B9-5A92-4E9B-A686-C3F6EF069A99}']
    function Consultar(const ACep: string): string;
  end;

implementation

end.
