unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    edLogin: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edSenha: TEdit;
    BitBtn1: TBitBtn;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Image1Click(Sender: TObject);
begin
  MessageDlg('Propriedade Oak Systems | Cópia licenciada para Natália Oliveira',mtInformation,[mbOK],0);
end;

end.
