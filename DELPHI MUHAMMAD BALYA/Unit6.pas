unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm6 = class(TForm)
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
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label10: TLabel;
    Edit10: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure bersih;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit4;

{$R *.dfm}

procedure TForm6.Button5Click(Sender: TObject);
begin
  if Application.MessageBox('Anda yakin akan keluar?', 'Informasi', MB_YESNO) = IDYES then
    Close;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('NIK Tidak Boleh Kosong!');
  end
  else if Edit2.Text = '' then
  begin
    ShowMessage('Nama Tidak Boleh Kosong!');
  end
  else if Edit3.Text = '' then
  begin
    ShowMessage('Telepon Tidak Boleh Kosong!');
  end
  else if Edit4.Text = '' then
  begin
    ShowMessage('Email Tidak Boleh Kosong!');
  end
  else if Edit5.Text = '' then
  begin
    ShowMessage('Alamat Tidak Boleh Kosong!');
  end
  else if Edit6.Text = '' then
  begin
    ShowMessage('Perusahaan Tidak Boleh Kosong!');
  end
  else if Edit7.Text = '' then
  begin
    ShowMessage('Nama Bank Tidak Boleh Kosong!');
  end
  else if Edit8.Text = '' then
  begin
    ShowMessage('Nama Akun Bank Tidak Boleh Kosong!');
  end
  else if Edit9.Text = '' then
  begin
    ShowMessage('No Akun Bank Tidak Boleh Kosong!');
  end
  else if DataModule4.Dssuplier.DataSet.Locate('nik', Edit1.Text, []) then
  begin
    ShowMessage('NIK ' + Edit1.Text + ' Sudah Ada Didalam Sistem');
  end
  else
  begin
    with DataModule4.Dssuplier.DataSet do
    begin
      Append;
      FieldByName('nik').AsString := Edit1.Text;
      FieldByName('name').AsString := Edit2.Text;
      FieldByName('telp').AsString := Edit3.Text;
      FieldByName('email').AsString := Edit4.Text;
      FieldByName('alamat').AsString := Edit5.Text;
      FieldByName('perusahaan').AsString := Edit6.Text;
      FieldByName('nama_bank').AsString := Edit7.Text;
      FieldByName('nama_akun_bank').AsString := Edit8.Text;
      FieldByName('no_akun_bank').AsString := Edit9.Text;
      Post;
    end;
    ShowMessage('Data Berhasil Disimpan.');
    posisiawal;
  end;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('NIK Tidak Boleh Kosong!');
  end
  else if Edit2.Text = '' then
  begin
    ShowMessage('Nama Tidak Boleh Kosong!');
  end
  else if DataModule4.Dssuplier.DataSet.Locate('nik', Edit1.Text, []) then
  begin
    with DataModule4.Dssuplier.DataSet do
    begin
      Edit;
      FieldByName('nik').AsString := Edit1.Text;
      FieldByName('name').AsString := Edit2.Text;
      FieldByName('telp').AsString := Edit3.Text;
      FieldByName('email').AsString := Edit4.Text;
      FieldByName('alamat').AsString := Edit5.Text;
      FieldByName('perusahaan').AsString := Edit6.Text;
      FieldByName('nama_bank').AsString := Edit7.Text;
      FieldByName('nama_akun_bank').AsString := Edit8.Text;
      FieldByName('no_akun_bank').AsString := Edit9.Text;
      Post;
    end;
    ShowMessage('Data Berhasil Diupdate.');
    posisiawal;
  end
  else
  begin
    ShowMessage('NIK ' + Edit1.Text + ' Tidak Ditemukan.');
  end;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
  if DataModule4.Dssuplier.DataSet.RecordCount = 0 then
  begin
    ShowMessage('Tidak ada data untuk dihapus.');
  end
  else if Application.MessageBox('Apakah Anda yakin ingin menghapus data ini?', 'Konfirmasi', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DataModule4.Dssuplier.DataSet.Delete;
    ShowMessage('Data Berhasil Didelete.');
    posisiawal;
  end;
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
  with DataModule4.Dssuplier.DataSet do
  begin
    if Locate('name', Edit10.Text, []) then
    begin
      ShowMessage('Data Ditemukan.');
    end
    else
    begin
      ShowMessage('Data Tidak Ditemukan.');
    end;
  end;
end;

procedure TForm6.DBGrid1CellClick(Column: TColumn);
begin
  with DataModule4.Dssuplier.DataSet do
  begin
    Edit1.Text := FieldByName('nik').AsString;
    Edit2.Text := FieldByName('name').AsString;
    Edit3.Text := FieldByName('telp').AsString;
    Edit4.Text := FieldByName('email').AsString;
    Edit5.Text := FieldByName('alamat').AsString;
    Edit6.Text := FieldByName('perusahaan').AsString;
    Edit7.Text := FieldByName('nama_bank').AsString;
    Edit8.Text := FieldByName('nama_akun_bank').AsString;
    Edit9.Text := FieldByName('no_akun_bank').AsString;
  end;

  Edit1.Enabled := True;
  Edit2.Enabled := True;
  Edit3.Enabled := True;
  Edit4.Enabled := True;
  Edit5.Enabled := True;
  Edit6.Enabled := True;
  Edit7.Enabled := True;
  Edit8.Enabled := True;
  Edit9.Enabled := True;
  Button2.Enabled := True;
  Button3.Enabled := True;
  Button1.Enabled := False;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  posisiawal;
end;

procedure TForm6.bersih;
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
  Edit8.Clear;
  Edit9.Clear;
  Edit10.Clear;
end;

procedure TForm6.posisiawal;
begin
  bersih;
  Edit1.Enabled := False;
  Edit2.Enabled := False;
  Edit3.Enabled := False;
  Edit4.Enabled := False;
  Edit5.Enabled := False;
  Edit6.Enabled := False;
  Edit7.Enabled := False;
  Edit8.Enabled := False;
  Edit9.Enabled := False;
  Button1.Enabled := False;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Button5.Enabled := True;
  Button6.Enabled := True;
end;

procedure TForm6.Button7Click(Sender: TObject);
begin
  posisiawal;
end;

procedure TForm6.Button6Click(Sender: TObject);
begin
  Edit1.Enabled := True;
  Edit2.Enabled := True;
  Edit3.Enabled := True;
  Edit4.Enabled := True;
  Edit5.Enabled := True;
  Edit6.Enabled := True;
  Edit7.Enabled := True;
  Edit8.Enabled := True;
  Edit9.Enabled := True;
  Button1.Enabled := True;
  Button2.Enabled := False;
  Button3.Enabled := False;
end;

end.

