unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, DBCtrls;

type
  TForm10 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboBoxEx1: TComboBoxEx;
    ComboBoxEx2: TComboBoxEx;
    ComboBoxEx3: TComboBoxEx;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Edit6: TEdit;
    Button5: TButton;
    procedure bersih;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  a: String;

implementation

uses Unit4;

{$R *.dfm}

procedure TForm10.bersih;
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  ComboBoxEx1.Clear;
  ComboBoxEx2.Clear;
  ComboBoxEx3.Clear;
end;

procedure TForm10.posisiawal;
begin
  Edit1.Enabled := False;
  Edit2.Enabled := False;
  Edit3.Enabled := False;
  Edit4.Enabled := False;
  Edit5.Enabled := False;
  Edit6.Enabled := True;
  Button1.Enabled := False;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Button4.Enabled := True;
  Button5.Enabled := True;
  end;

procedure TForm10.FormShow(Sender: TObject);
begin
  posisiawal;
end;

procedure TForm10.Button1Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('barcode Tidak Boleh Kosong!');
  end
  else if Edit2.Text = '' then
  begin
    ShowMessage('name Tidak Boleh Kosong!');
  end
  else if Edit3.Text = '' then
  begin
    ShowMessage('harga_jual Tidak Boleh Kosong!');
  end
  else if Edit4.Text = '' then
  begin
    ShowMessage('harga_beli Tidak Boleh Kosong!');
  end
  else if Edit5.Text = '' then
  begin
    ShowMessage('stok Tidak Boleh Kosong!');
  end
  else if DataModule4.Dsbarang.DataSet.Locate('barcode', Edit1.Text, []) then
  begin
    ShowMessage('barcode ' + Edit1.Text + ' Sudah Ada Didalam Sistem');
  end
  else
  begin
    with DataModule4.Dsbarang.DataSet do
    begin
      Append;
      FieldByName('barcode').AsString := Edit1.Text;
      FieldByName('name').AsString := Edit2.Text;
      FieldByName('harga_jual').AsString := Edit3.Text;
      FieldByName('harga_beli').AsString := Edit4.Text;
      FieldByName('stok').AsString := Edit5.Text;
      FieldByName('kategori_id').AsString := ComboBoxEx1.Text;
      FieldByName('satuan_id').AsString := ComboBoxEx2.Text;
      FieldByName('suplier_id').AsString := ComboBoxEx3.Text;
      Post;
    end;
    ShowMessage('Data Berhasil Disimpan.');
    posisiawal;
  end;
end;

procedure TForm10.Button2Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('barcode Tidak Boleh Kosong!');
  end
  else if Edit2.Text = '' then
  begin
    ShowMessage('Nama Tidak Boleh Kosong!');
  end
  else if DataModule4.Dsbarang.DataSet.Locate('barcode', Edit1.Text, []) then
  begin
    with DataModule4.Dsbarang.DataSet do
    begin
      Edit;
      FieldByName('barcode').AsString := Edit1.Text;
      FieldByName('name').AsString := Edit2.Text;
      FieldByName('harga_jual').AsString := Edit3.Text;
      FieldByName('harga_beli').AsString := Edit4.Text;
      FieldByName('stok').AsString := Edit5.Text;
      FieldByName('kategori_id').AsString := ComboBoxEx1.Text;
      FieldByName('satuan_id').AsString := ComboBoxEx2.Text;
      FieldByName('suplier_id').AsString := ComboBoxEx3.Text;
      Post;
    end;
    ShowMessage('Data Berhasil Diupdate.');
    posisiawal;
  end
  else
  begin
    ShowMessage('barcode ' + Edit1.Text + ' Tidak Ditemukan.');
  end;
end;

procedure TForm10.Button5Click(Sender: TObject);
begin
  if Application.MessageBox('Anda yakin akan keluar?', 'Informasi', MB_YESNO) = IDYES then
    Close;
end;

procedure TForm10.Button4Click(Sender: TObject);
begin
  with DataModule4.Dsbarang.DataSet do
  begin
    if Locate('name', Edit6.Text, []) then
    begin
      ShowMessage('Data Ditemukan.');
    end
    else
    begin
      ShowMessage('Data Tidak Ditemukan.');
    end;
  end;
end;

procedure TForm10.Button3Click(Sender: TObject);
begin
  if DataModule4.Dsbarang.DataSet.RecordCount = 0 then
  begin
    ShowMessage('Tidak ada data untuk dihapus.');
  end
  else if Application.MessageBox('Apakah Anda yakin ingin menghapus data ini?', 'Konfirmasi', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DataModule4.Dsbarang.DataSet.Delete;
    ShowMessage('Data Berhasil Didelete.');
    posisiawal;
  end;
end;

procedure TForm10.Button6Click(Sender: TObject);
begin
  Edit1.Enabled := True;
  Edit2.Enabled := True;
  Edit3.Enabled := True;
  Edit4.Enabled := True;
  Edit5.Enabled := True;
  ComboBoxEx1.Enabled:= True;
  ComboBoxEx2.Enabled:= True;
  ComboBoxEx3.Enabled:= True;
  Button1.Enabled := True;
  Button2.Enabled := False;
  Button3.Enabled := False;
end;

procedure TForm10.Button7Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm10.DBGrid1CellClick(Column: TColumn);
begin
with DataModule4.Dsbarang.DataSet do
  begin
    Edit1.Text := FieldByName('barcode').AsString;
    Edit2.Text := FieldByName('name').AsString;
    Edit3.Text := FieldByName('harga_jual').AsString;
    Edit4.Text := FieldByName('harga_beli').AsString;
    Edit5.Text := FieldByName('stok').AsString;
    ComboBoxEx1.Text := FieldByName('kategori_id').AsString;
    ComboBoxEx2.Text := FieldByName('satuan_id').AsString;
    ComboBoxEx3.Text := FieldByName('suplier_id').AsString;
  end;

  Edit1.Enabled := True;
  Edit2.Enabled := True;
  Edit3.Enabled := True;
  Edit4.Enabled := True;
  Edit5.Enabled := True;
  ComboBoxEx1.Enabled := True;
  ComboBoxEx2.Enabled := True;
  ComboBoxEx3.Enabled := True;
  Button2.Enabled := True;
  Button3.Enabled := True;
  Button1.Enabled := False;
end;


procedure TForm10.FormCreate(Sender: TObject);
begin
ComboBoxEx1.Items.Add('1');
ComboBoxEx2.Items.Add('2');
ComboBoxEx3.Items.Add('3');
end;

end.

