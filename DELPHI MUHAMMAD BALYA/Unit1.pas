unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    FILE1: TMenuItem;
    DATAMASTER1: TMenuItem;
    RANSAKSI1: TMenuItem;
    LAPORAN1: TMenuItem;
    KATEGORI1: TMenuItem;
    SATUAN1: TMenuItem;
    SUPPLIER1: TMenuItem;
    KUSTOMER1: TMenuItem;
    PENJUALAN1: TMenuItem;
    PEMBELIAN1: TMenuItem;
    LAPORANPENJUALAN1: TMenuItem;
    LAPORANSTOKBARANG1: TMenuItem;
    LAPORANBARANG1: TMenuItem;
    LOGIN1: TMenuItem;
    LOGOUT1: TMenuItem;
    USER1: TMenuItem;
    BARANG1: TMenuItem;
    procedure LOGIN1Click(Sender: TObject);
    procedure KATEGORI1Click(Sender: TObject);
    procedure LOGOUT1Click(Sender: TObject);
    procedure SUPPLIER1Click(Sender: TObject);
    procedure KUSTOMER1Click(Sender: TObject);
    procedure SATUAN1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure USER1Click(Sender: TObject);
    procedure BARANG1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit6, Unit7, Unit5, Unit8, Unit9, Unit10;

{$R *.dfm}

procedure TForm1.LOGIN1Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.KATEGORI1Click(Sender: TObject);
begin
Form3.Show;
end;


procedure TForm1.LOGOUT1Click(Sender: TObject);
begin
 if (application.MessageBox('Anda Yakin akan keluar', 'Informasi', MB_YESNO) =
    IDYES) then
    close
end;

procedure TForm1.SUPPLIER1Click(Sender: TObject);
begin
Form6.Show;
end;

procedure TForm1.KUSTOMER1Click(Sender: TObject);
begin
Form7.Show;
end;

procedure TForm1.SATUAN1Click(Sender: TObject);
begin
Form5.Show;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
mm1.Items[1].Visible:=False;
mm1.Items[2].Visible:=False;
mm1.Items[3].Visible:=False;
end;

procedure TForm1.USER1Click(Sender: TObject);
begin
Form9.Show;
end;

procedure TForm1.BARANG1Click(Sender: TObject);
begin
Form10.Show;
end;

end.
