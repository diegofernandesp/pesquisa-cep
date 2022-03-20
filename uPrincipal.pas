unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  PesquisaCep.IPesquisaCep, PesquisaCep.uViaCep, Vcl.Mask, RzEdit;

type
  TfPrincipal = class(TForm)
    bPesquisa: TBitBtn;
    Memo1: TMemo;
    edCep: TRzMaskEdit;
    procedure bPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

procedure TfPrincipal.bPesquisaClick(Sender: TObject);
var
  ViaCep: IPesquisarCep;
begin
  ViaCep := TViaCep.Create;
  Memo1.Lines.Text := ViaCep
    .PesquisarCep(edCep.Text)
    .ToString;
end;

end.
