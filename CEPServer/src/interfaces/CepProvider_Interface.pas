unit CepProvider_Interface;

interface

type
  ICepProvider = interface
    ['{74AEA652-B4C1-4235-97A5-84CFFEC57D8F}']
    function Consultar(const ACaep: string): string;
  end;

implementation

end.
