object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Cadastro de pessoa'
  ClientHeight = 232
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 41
    Height = 17
    Caption = 'Nome:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 42
    Top = 35
    Width = 23
    Height = 17
    Caption = 'RG:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 150
    Top = 35
    Width = 29
    Height = 17
    Caption = 'CPF:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 288
    Top = 35
    Width = 56
    Height = 17
    Caption = 'Telefone:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 62
    Width = 41
    Height = 17
    Caption = 'E-mail:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 35
    Top = 89
    Width = 30
    Height = 17
    Caption = 'CEP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 35
    Top = 116
    Width = 77
    Height = 17
    Caption = 'Logradouro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 11
    Top = 143
    Width = 54
    Height = 17
    Caption = 'N'#250'mero:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 128
    Top = 143
    Width = 91
    Height = 17
    Caption = 'Complemento:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 25
    Top = 170
    Width = 40
    Height = 17
    Caption = 'Bairro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 225
    Top = 170
    Width = 46
    Height = 17
    Caption = 'Cidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 18
    Top = 197
    Width = 47
    Height = 17
    Caption = 'Estado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 132
    Top = 197
    Width = 28
    Height = 17
    Caption = 'Pais:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtNome: TEdit
    Left = 71
    Top = 8
    Width = 366
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtCPF: TMaskEdit
    Left = 185
    Top = 35
    Width = 88
    Height = 21
    EditMask = '000.000.000-00;0;_'
    MaxLength = 14
    TabOrder = 2
    Text = ''
  end
  object edtEmail: TEdit
    Left = 71
    Top = 62
    Width = 366
    Height = 21
    TabOrder = 4
  end
  object edtTelefone: TMaskEdit
    Left = 350
    Top = 35
    Width = 87
    Height = 21
    EditMask = '!\(999\)9000-0000;0;_'
    MaxLength = 14
    TabOrder = 3
    Text = ''
  end
  object edtRG: TMaskEdit
    Left = 71
    Top = 35
    Width = 66
    Height = 21
    EditMask = '000000000;1;_'
    MaxLength = 9
    TabOrder = 1
    Text = '         '
  end
  object edtLogradouro: TEdit
    Left = 118
    Top = 116
    Width = 319
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object edtComplemento: TEdit
    Left = 225
    Top = 143
    Width = 212
    Height = 21
    TabOrder = 8
  end
  object edtBairro: TEdit
    Left = 71
    Top = 170
    Width = 148
    Height = 21
    Enabled = False
    TabOrder = 9
  end
  object edtCidade: TEdit
    Left = 277
    Top = 170
    Width = 160
    Height = 21
    Enabled = False
    TabOrder = 10
  end
  object edtEstado: TEdit
    Left = 71
    Top = 197
    Width = 43
    Height = 21
    Enabled = False
    TabOrder = 11
  end
  object edtPais: TEdit
    Left = 166
    Top = 197
    Width = 160
    Height = 21
    TabOrder = 12
  end
  object btnSalvar: TBitBtn
    Left = 332
    Top = 195
    Width = 105
    Height = 25
    Caption = 'Salvar'
    TabOrder = 13
    OnClick = btnSalvarClick
  end
  object edtCEP: TMaskEdit
    Left = 71
    Top = 89
    Width = 67
    Height = 21
    EditMask = '00000-000;0;_'
    MaxLength = 9
    TabOrder = 5
    Text = ''
    OnExit = edtCEPExit
  end
  object edtNumero: TMaskEdit
    Left = 71
    Top = 143
    Width = 39
    Height = 21
    EditMask = '99999;1;_'
    MaxLength = 5
    TabOrder = 7
    Text = '     '
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://viacep.com.br/ws'
    Params = <>
    Left = 168
    Top = 88
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Resource = '88040-600/json'
    Response = RESTResponse1
    Left = 216
    Top = 88
  end
  object RESTResponse1: TRESTResponse
    Left = 264
    Top = 88
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    TypesMode = Rich
    Left = 312
    Top = 88
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    Left = 360
    Top = 88
  end
  object SMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 416
    Top = 88
  end
end
