unit MainForm_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Cep_Controller, Endereco_Model;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    edtCep: TEdit;
    btnConsultar: TButton;
    Label2: TLabel;
    edtLogradouro: TEdit;
    Label3: TLabel;
    edtBairro: TEdit;
    Label4: TLabel;
    edtCidade: TEdit;
    Label5: TLabel;
    edtUF: TEdit;
    procedure btnConsultarClick(Sender: TObject);
  private
    FCepController: TCepController;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btnConsultarClick(Sender: TObject);
var
  Endereco: TEndereco;
begin
  try
    Endereco := FCepController.ConsultarCep(edtCep.Text);
    try
      edtLogradouro.Text := Endereco.Logradouro;
      edtBairro.Text := Endereco.Bairro;
      edtCidade.Text := Endereco.Cidade;
      edtUF.Text := Endereco.UF;
    finally
      Endereco.Free;
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited;
  FCepController := TCepController.Create;
end;

destructor TMainForm.Destroy;
begin
  FCepController.Free;
  inherited;
end;

end.
