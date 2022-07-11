unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdMessage, IdSSLOpenSSL, XMLDoc, XMLIntf, IdAttachmentFile;

type
  TfrmPrincipal = class(TForm)
    edtNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtCPF: TMaskEdit;
    edtEmail: TEdit;
    edtTelefone: TMaskEdit;
    edtRG: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtLogradouro: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtComplemento: TEdit;
    Label10: TLabel;
    edtBairro: TEdit;
    Label11: TLabel;
    edtCidade: TEdit;
    Label12: TLabel;
    edtEstado: TEdit;
    Label13: TLabel;
    edtPais: TEdit;
    btnSalvar: TBitBtn;
    edtCEP: TMaskEdit;
    edtNumero: TMaskEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    SMTP: TIdSMTP;
    procedure edtCEPExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure limparCampos;
    procedure gerarXLM;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
var
  LSMTP: TIdSMTP;
  LMENSSAGE: TIdMessage;
  LSocketSSL: TIdSSLIOHandlerSocketOpenSSL;
  LArquivoAnexo: string;
begin
  if edtNome.Text = EmptyStr then
  begin
    Showmessage('Deve informar o Nome da pessoa');
    Exit;
  end;

  if edtEmail.Text = EmptyStr then
  begin
    Showmessage('Deve informar o E-mail da pessoa');
    Exit;
  end;
  
  LSMTP      := TIdSMTP.Create(nil);
  LMENSSAGE  := TIdMessage.Create(nil);
  LSocketSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  gerarXLM;

  with LSocketSSL do
  begin
    with SSLOptions do
    begin
      Mode   := sslmClient;
      Method := sslvSSLv23;
    end;

    Host := 'smtp.gmail.com';
    Port := 587;
  end;
  
  with LSMTP do
  begin
    IOHandler := LSocketSSL;
    Host      := 'smtp.gmail.com';
    Port      := 587;
    AuthType  := satDefault;
    Username  := 'testeemalgabriel@gmail.com';
    Password  := 'dkhjockerbgqvnnc';
    UseTLS    := utUseExplicitTLS;
  end;

  with LMENSSAGE do
  begin
    from.Address := edtEmail.Text;
    from.Name    := edtNome.Text;
    Recipients.Add;
    Recipients.Items[0].Address := edtEmail.Text;
    Subject := 'Cadastro de pessoa';
    Body.Add('Dados do cadastro:' + #13#10 +
             'Nome: ' + edtNome.Text + #13#10 +
             'RG: ' + edtRG.Text + #13#10 +
             'CPF: ' + edtCPF.Text + #13#10 +
             'Telefone: ' + edtTelefone.Text + #13#10 +
             'Email.: ' + edtEmail.Text + #13#10 +
             'CEP: ' + edtCEP.Text + #13#10 +
             'Logradouro: ' + edtLogradouro.Text + #13#10 +
             'Numero: ' + edtNumero.Text + #13#10 +   
             'Complemento: ' + edtComplemento.Text  + #13#10 +    
             'Bairro: ' + edtBairro.Text + #13#10 +
             'Cidade: ' + edtCidade.Text + #13#10 +
             'Estado: ' + edtEstado.Text + #13#10 +
             'Pais: ' + edtPais.Text);
  end;         

  TIdAttachmentFile.Create(LMENSSAGE.MessageParts, GetCurrentDir + '\teste.xml');
       
  Try
    LSMTP.Connect;
    LSMTP.Send(LMENSSAGE);
    ShowMessage('Mensagem enviada com sucesso');        
    limparCampos;
  Except
    On e: Exception do
      ShowMessage('Ocorreu um erro ao eviar o e-mail. ' + e.Message);
  End;
end;

procedure TfrmPrincipal.edtCEPExit(Sender: TObject);
begin
  RESTRequest1.Resource := edtCEP.Text + '/json';
  RESTRequest1.Execute;

  if RESTRequest1.Response.StatusCode = 200 then
  begin
    if RESTRequest1.Response.Content.IndexOf('erro') > 0 then
      ShowMessage('CEP não encontrado')
    else
    begin
      with FDMemTable1 do
      begin
        edtLogradouro.Text  := FieldByName('logradouro').AsString;
        edtComplemento.Text := FieldByName('complemento').AsString;
        edtBairro.Text      := FieldByName('bairro').AsString;
        edtCidade.Text      := FieldByName('localidade').AsString;
        edtEstado.Text      := FieldByName('uf').AsString;
        edtPais.Text        := 'Brasil';
      end;
    end;
  end
  else
    ShowMessage('Erro ao consultar CEP');
end;

procedure TfrmPrincipal.gerarXLM;
var
  LXML: TXMLDocument;
  NodeTabela, 
  NodeRegistro, 
  NodeEndereco: IXMLNode;
begin
  LXML := TXMLDocument.Create(Self);
  try
    LXML.Active := True;
    NodeTabela := LXML.AddChild('Pessoa');
    
    NodeRegistro := NodeTabela.AddChild('Registro');
    NodeRegistro.ChildValues['Nome'] := edtNome.Text;
    NodeRegistro.ChildValues['RG'] := edtRG.Text;
    NodeRegistro.ChildValues['CPF'] := edtCPF.Text;
    NodeRegistro.ChildValues['Telefone'] := edtTelefone.Text;
    NodeRegistro.ChildValues['E-mail'] := edtEmail.Text;

    NodeEndereco := NodeRegistro.AddChild('Endereco');
    NodeEndereco.ChildValues['CEP'] := edtCEP.Text;
    NodeEndereco.ChildValues['Logradouro'] := edtLogradouro.Text;
    NodeEndereco.ChildValues['Numero'] := edtNumero.Text;         
    NodeEndereco.ChildValues['Bairro'] :=  edtBairro.Text;
    NodeEndereco.ChildValues['Cidade'] := edtCidade.Text;
    NodeEndereco.ChildValues['Estado'] := edtEstado.Text;
    NodeEndereco.ChildValues['Pais'] := edtPais.Text;

    LXML.SaveToFile(GetCurrentDir + '\teste.xml');
  finally
    FreeAndNil(LXML);
  end;
end;

procedure TfrmPrincipal.limparCampos;
begin
  edtNome.Clear;
  edtRG.Clear;
  edtCPF.Clear;
  edtTelefone.Clear;
  edtEmail.Clear;
  edtCEP.Clear;
  edtLogradouro.Clear;
  edtNumero.Clear;
  edtComplemento.Clear;         
  edtBairro.Clear;
  edtCidade.Clear;
  edtEstado.Clear;
  edtPais.Clear;
end;

end.
