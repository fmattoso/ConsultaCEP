unit ServerContainer_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerServer, Datasnap.DSCommonServer,
  Datasnap.DSServer, Datasnap.DSHTTP, IdHTTPWebBrokerBridge, Vcl.StdCtrls;

type
  TServerContainer = class(TForm)
    DSServerClass1: TDSServerClass;
    DSServer1: TDSServer;
    Label1: TLabel;
    edtPorta: TEdit;
    btnIniciaServidor: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure btnIniciaServidorClick(Sender: TObject);
  private
    { Private declarations }
    FBridge: TIdHTTPWebBrokerBridge;
  public
    { Public declarations }
  end;

var
  ServerContainer: TServerContainer;

implementation

{$R *.dfm}

uses
  ServerMethods_dm;

procedure TServerContainer.btnIniciaServidorClick(Sender: TObject);
begin
  DSServer1.Start;
//  DSHTTPService1.HttpPort := StrToInt(edtPorta.Text);
//  DSHTTPService1.Active := True;
end;

procedure TServerContainer.DSServerClass1GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TServerMethods;
end;

procedure TServerContainer.FormCreate(Sender: TObject);
begin
  DSServer1.Start;

  FBridge := TIdHTTPWebBrokerBridge.Create(self);
  FBridge.DefaultPort := 8080;
  FBridge.Active := True;
end;

procedure TServerContainer.FormDestroy(Sender: TObject);
begin
  if Assigned(FBridge) then
  begin
    FBridge.Active := False;
    FBridge.Free;
  end;
  DSserver1.Stop;
end;

end.
