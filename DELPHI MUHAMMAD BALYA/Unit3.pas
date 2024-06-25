unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button5Click(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a: string;

implementation

uses Unit4;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('Nama Kategori Tidak Boleh Kosong!');
  end else
  if DataModule4.Zkategori.Locate('nama', Edit1.Text, []) then
  begin
    ShowMessage('Nama Kategori ' + Edit1.Text + ' Sudah Ada Didalam Sistem');
  end
  else
  begin
   with DataModule4.Zkategori do
begin
SQL.Clear;
SQL.Add('insert into kategori values(null,"'+Edit1.Text+'")');
ExecSQL ;
SQL.Clear;
SQL.Add('select * from kategori');
Open;
end;
ShowMessage('Data Berhasil Disimpan!');
posisiawal;
end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('Nama Kategori Tidak Boleh Kosong!');
  end
  else if Edit1.Text = DataModule4.Zkategori.Fields[1].AsString then
  begin
    ShowMessage('Nama Kategori ' + Edit1.Text + ' Tidak Ada Perubahan');
  end
  else
  begin
    DataModule4.Zkategori.SQL.Clear;
    DataModule4.Zkategori.SQL.Add('update kategori set nama="' + Edit1.Text + '" where id="' + a + '"');
    DataModule4.Zkategori.ExecSQL;

    DataModule4.Zkategori.SQL.Clear;
    DataModule4.Zkategori.SQL.Add('select * from kategori');
    DataModule4.Zkategori.Open;
    ShowMessage('Data Berhasil Diupdate!');
    posisiawal;
  end;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  if MessageDlg('Apakah Anda Yakin Menghapus Data ini', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    DataModule4.Zkategori.SQL.Clear;
    DataModule4.Zkategori.SQL.Add('delete from kategori where id="' + a + '"');
    DataModule4.Zkategori.ExecSQL;

    DataModule4.Zkategori.SQL.Clear;
    DataModule4.Zkategori.SQL.Add('select * from kategori');
    DataModule4.Zkategori.Open;
    ShowMessage('Data Berhasil Didelete!');
    posisiawal;
  end;
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
  Edit1.Text := DataModule4.Zkategori.Fields[1].AsString;
  a := DataModule4.Zkategori.Fields[0].AsString;

  Edit1.Enabled := True;
  Button2.Enabled := True;
  Button3.Enabled := True;
  Button5.Enabled := True;
  Button6.Enabled := False;
  Button1.Enabled := False;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  if Application.MessageBox('Anda Yakin akan keluar', 'Informasi', MB_YESNO) = IDYES then
    Close;
end;

procedure TForm3.bersih;
begin
  Edit1.Clear;
end;

procedure TForm3.posisiawal;
begin
  bersih;
  Button6.Enabled := True;
  Button1.Enabled := False;
  Button2.Enabled := False;
  Button5.Enabled := False;
  Button3.Enabled := False;
  Edit1.Enabled := False;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  posisiawal;
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
  Edit1.Enabled := True;
  Button1.Enabled := True;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Button5.Enabled := True;
  Button6.Enabled := False;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  with DataModule4.Dskategori.DataSet do
  begin
    if Locate('nama', Edit2.Text, []) then
    begin
      ShowMessage('Data ditemukan.');
    end
    else
    begin
      ShowMessage('Data tidak ditemukan.');
    end;
  end;
end;


procedure TForm3.Button7Click(Sender: TObject);
begin
posisiawal;
end;

end.

