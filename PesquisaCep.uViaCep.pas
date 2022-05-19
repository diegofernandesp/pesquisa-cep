unit PesquisaCep.uViaCep;

interface

uses
  IdHttp, IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, PesquisaCep.uCep, PesquisaCep.iPesquisaCep;

type
  TViaCep = class(TInterfacedObject, IPesquisarCep)
  const
    URL_VIACEP = 'https://viacep.com.br/ws/%s/xml/';
  private
    FCep: TCep;
    FCepStr: String;
    function GetXml: String;
    procedure ProcessarXML(AXml: String);
    function IsCepValido: Boolean;
  public
    function PesquisarCep(AValue: string): TCep;
  end;

implementation

uses
  System.Classes, System.SysUtils, XMLIntf, XMLDoc, System.Variants, RegularExpressions;

{ TViaCep }

function TViaCep.IsCepValido: Boolean;
begin
  { Verifica se são 8 dígitos entre 0 e 9 consecutivos}
  Result := TRegEx.Match(FCepStr, '^[0-9]{8}$').Success;
end;

function TViaCep.PesquisarCep(AValue: string): TCep;
begin
  FCepStr := AValue;
  if not IsCepValido then
    raise Exception.Create('Formato inválido');

  ProcessarXML(GetXml);
  Result := FCep;
end;

procedure TViaCep.ProcessarXML(AXml: String);
var
  Xml: IXMLDocument;
  XmlRoot: IXMLNode;

  function GetValueFromNode(ANodeName: String): Variant;
  begin
    try
      Result := VarToStr(XmlRoot.ChildValues[ANodeName]);
    except
      on E:Exception do
        raise Exception.Create(Format('Erro ao obter valor do campo %s',
          [ANodeName]));
    end;
  end;

begin
  Xml := TXMLDocument.Create(Nil);
  Xml.LoadFromXML(AXml);
  XmlRoot := Xml.ChildNodes.First;
  while XmlRoot <> Nil do
  begin
    if XmlRoot.NodeName = 'xmlcep' then
    begin
      if String(GetValueFromNode('cep')).IsEmpty then
        raise Exception.Create('CEP inválido');

      FCep.Cep :=         GetValueFromNode('cep');
      FCep.Logradouro :=  GetValueFromNode('logradouro');
      FCep.Complemento := GetValueFromNode('complemento');
      FCep.Bairro :=      GetValueFromNode('bairro');
      FCep.Localidade :=  GetValueFromNode('localidade');
      FCep.UF :=          GetValueFromNode('uf');
      FCep.Ibge :=        StrToIntDef(GetValueFromNode('ibge'), 0);
      FCep.Gia :=         StrToIntDef(GetValueFromNode('gia'), 0);
      FCep.Ddd :=         StrToIntDef(GetValueFromNode('ddd'), 0);
      FCep.Siafi :=       StrToIntDef(GetValueFromNode('siafi'), 0);
    end;
    XmlRoot := XmlRoot.NextSibling;
  end;
end;

function TViaCep.GetXml: String;
var
  idHttp: TIdHTTP;
  idSsl: TIdSSLIOHandlerSocketOpenSSL;
  Stream: TStringStream;
begin
  idHttp := TIdHTTP.Create(Nil);
  idSsl := TIdSSLIOHandlerSocketOpenSSL.Create(Nil);
  Stream := TStringStream.Create('',TEncoding.UTF8);
  try
    idSsl.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    idHttp.IOHandler := idSsl;
    idHttp.Get(Format(URL_VIACEP, [FCepStr]), Stream);
    Result := Stream.DataString;
  finally
    idHttp.Free;
    idSsl.Free;
    Stream.Free;
  end;
end;

end.
