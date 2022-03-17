unit PesquisaCep.uCep;

interface

type
  TCep = record
    Cep: String;
    Logradouro: String;
    Complemento: String;
    Bairro: String;
    Localidade: String;
    UF: String;
    Ibge: Integer;
    Gia: Integer;
    Ddd: Integer;
    Siafi: Integer;
    function ToString: String;
  end;

implementation

uses
  SysUtils;

{ TCep }

function TCep.ToString: String;
begin
  Result :=
    'Cep:         ' + Self.Cep + sLineBreak +
    'Logradouro:  ' + Self.Logradouro + sLineBreak +
    'Complemento: ' + Self.Complemento + sLineBreak +
    'Bairro:      ' + Self.Bairro + sLineBreak +
    'Localidade:  ' + Self.Localidade + sLineBreak +
    'UF:          ' + Self.UF + sLineBreak +
    'Ibge:        ' + IntToStr(Self.Ibge) + sLineBreak +
    'Gia:         ' + IntToStr(Self.Gia) + sLineBreak +
    'Ddd:         ' + IntToStr(Self.Ddd) + sLineBreak +
    'Siafi:       ' + IntToStr(Self.Siafi);
end;

end.
