unit PesquisaCep.iPesquisaCep;

interface

uses PesquisaCep.uCep;

type
  IPesquisarCep = Interface
    function PesquisarCep(AValue: String): TCep;
  End;

implementation

end.
