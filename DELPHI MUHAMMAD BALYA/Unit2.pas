unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  if (Edit1.Text = 'admin') and (Edit2.Text = '123') then
  begin
    Form1.mm1.Items[1].Visible := True;
    Form1.mm1.Items[2].Visible := False;
    Form1.mm1.Items[3].Visible := False;
  end
  else if (Edit1.Text = 'kasir') and (Edit2.Text = '123') then
  begin
    Form1.mm1.Items[1].Visible := False;
    Form1.mm1.Items[2].Visible := True;
    Form1.mm1.Items[3].Visible := False;
  end
  else if (Edit1.Text = 'pemilik') and (Edit2.Text = '123') then
  begin
    Form1.mm1.Items[1].Visible := False;
    Form1.mm1.Items[2].Visible := False;
    Form1.mm1.Items[3].Visible := True;
  end
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if Application.MessageBox('Anda Yakin akan keluar', 'Informasi', MB_YESNO) = IDYES then
    Close;
end;

end.

