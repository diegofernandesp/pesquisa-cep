program PesquisaCep;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  PesquisaCep.uViaCep in 'PesquisaCep.uViaCep.pas',
  PesquisaCep.iPesquisaCep in 'PesquisaCep.iPesquisaCep.pas',
  PesquisaCep.uCep in 'PesquisaCep.uCep.pas';

{$R *.res}

begin
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
