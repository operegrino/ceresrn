unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager,
  uADGUIxFormsWait, uADPhysODBCBase, uADPhysMSSQL, uADCompGUIx, Data.DB,
  uADCompDataSet, uADCompClient;

type
  TfrmLogin = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    edLogin: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edSenha: TEdit;
    BitBtn1: TBitBtn;
    ADConnection1: TADConnection;
    Qr_Login: TADQuery;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink;
    procedure Image1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmLogin.BitBtn1Click(Sender: TObject);
var
  login, senha : String;
begin

  login:= TRIM(edLogin.Text);
  senha:= TRIM(edSenha.Text);

  if login ='' then
  begin
    MessageDlg('Favor informe o login!', mtInformation,[mbOK],0);
    edLogin.Clear;
    edLogin.SetFocus;
    EXIT;
  end;

  if senha='' then
  begin
    MessageDlg('Favor informe a senha!', mtInformation,[mbOK],0);
    edSenha.Clear;
    edSenha.SetFocus;
    EXIT;
  end;

  Qr_Login.Close;
  Qr_Login.SQL.Clear;
  Qr_Login.SQL.Add('SELECT * FROM usuario');
  Qr_Login.SQL.Add('WHERE login = :P_param1');
  Qr_Login.SQL.Add('AND senha = :P_param2');

  Qr_Login.ParamByName('p_param1').AsString:=login;
  Qr_Login.ParamByName('p_param2').AsString:=senha;
  Qr_Login.Open();

  if Qr_Login.IsEmpty then
  begin
    MessageDlg('Combinação Login/Senha inválida! Tente novamente!',mtError,[mbOk],0);
    edLogin.Clear;
    edSenha.Clear;
    login:='';
    senha:='';
    edLogin.SetFocus;
    EXIT;
  end;

  frmLogin.Visible      :=FALSE;
  frmPrincipal.Visible  :=TRUE;



end;

procedure TfrmLogin.Image1Click(Sender: TObject);
begin
  MessageDlg('Propriedade Oak Systems | Cópia licenciada para Natália Oliveira',mtInformation,[mbOK],0);
end;

end.
