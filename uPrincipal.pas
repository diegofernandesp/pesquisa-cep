unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  PesquisaCep.IPesquisaCep, PesquisaCep.uViaCep;

type
  TfPrincipal = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

procedure TfPrincipal.BitBtn1Click(Sender: TObject);
var
  ViaCep: IPesquisarCep;
begin
  ViaCep := TViaCep.Create;
  Memo1.Lines.Text := ViaCep
    .PesquisarCep(Edit1.Text)
    .ToString;
end;

end.
