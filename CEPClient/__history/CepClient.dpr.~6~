program CepClient;

uses
  Vcl.Forms,
  MainForm_view in 'src\view\MainForm_view.pas' {MainForm},
  CepRestService_Interface in 'src\interfaces\CepRestService_Interface.pas',
  CepRest_Service in 'src\service\CepRest_Service.pas',
  Endereco_Model in 'src\model\Endereco_Model.pas',
  Cep_Controller in 'src\controller\Cep_Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
