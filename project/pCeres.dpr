program pCeres;

uses
  Vcl.Forms,
  uLogin in '..\unit\uLogin.pas' {frmLogin},
  uPrincipal in '..\unit\uPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
