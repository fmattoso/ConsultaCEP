object ServerContainer: TServerContainer
  Left = 0
  Top = 0
  Caption = 'ServerContainer'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 31
    Height = 15
    Caption = 'Porta:'
  end
  object edtPorta: TEdit
    Left = 80
    Top = 21
    Width = 121
    Height = 23
    TabOrder = 0
    Text = '8080'
  end
  object btnIniciaServidor: TButton
    Left = 80
    Top = 72
    Width = 121
    Height = 33
    Caption = 'Iniciar Servidor'
    TabOrder = 1
    OnClick = btnIniciaServidorClick
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 336
    Top = 152
  end
  object DSServer1: TDSServer
    Left = 136
    Top = 152
  end
end
