unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Label9: TLabel;
    Edit8: TEdit;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure bersih;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  a: String;

implementation

uses Unit4;

{$R *.dfm}

procedure TForm9.bersih;
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
  Edit8.Clear;
  ComboBox1.ItemIndex := -1;
end;

procedure TForm9.posisiawal;
begin
  bersih;
  Edit1.Enabled := False;
  Edit2.Enabled := False;
  Edit3.Enabled := False;
  Edit4.Enabled := False;
  Edit5.Enabled := False;
  Edit6.Enabled := False;
  Edit7.Enabled := False;
  Edit8.Enabled := True;
  Button1.Enabled := False;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Button5.Enabled := True;
  Button6.Enabled := True;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
  posisiawal;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  ComboBox1.Items.Add('Kasir');
  ComboBox1.Items.Add('Admin');
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('NIK Tidak Boleh Kosong!');
  end
  else if Edit2.Text = '' then
  begin
    ShowMessage('username Tidak Boleh Kosong!');
  end
  else if Edit3.Text = '' then
  begin
    ShowMessage('full_name Tidak Boleh Kosong!');
  end
  else if Edit4.Text = '' then
  begin
    ShowMessage('password Tidak Boleh Kosong!');
  end
  else if Edit5.Text = '' then
  begin
    ShowMessage('email Tidak Boleh Kosong!');
  end
  else if Edit6.Text = '' then
  begin
    ShowMessage('telp Tidak Boleh Kosong!');
  end
  else if Edit7.Text = '' then
  begin
    ShowMessage('alamat Tidak Boleh Kosong!');
  end
  else if DataModule4.Dsuser.DataSet.Locate('nik', Edit1.Text, []) then
  begin
    ShowMessage('NIK ' + Edit1.Text + ' Sudah Ada Didalam Sistem');
  end
  else
  begin
    with DataModule4.Dsuser.DataSet do
    begin
      Append;
      FieldByName('nik').AsString := Edit1.Text;
      FieldByName('username').AsString := Edit2.Text;
      FieldByName('full_name').AsString := Edit3.Text;
      FieldByName('password').AsString := Edit4.Text;
      FieldByName('role').AsString := ComboBox1.Text;
      FieldByName('email').AsString := Edit5.Text;
      FieldByName('telp').AsString := Edit6.Text;
      FieldByName('alamat').AsString := Edit7.Text;
      Post;
    end;
    ShowMessage('Data Berhasil Disimpan.');
    posisiawal;
  end;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('NIK Tidak Boleh Kosong!');
  end
  else if Edit2.Text = '' then
  begin
    ShowMessage('Nama Tidak Boleh Kosong!');
  end
  else if DataModule4.Dsuser.DataSet.Locate('nik', Edit1.Text, []) then
  begin
    with DataModule4.Dsuser.DataSet do
    begin
      Edit;
      FieldByName('nik').AsString := Edit1.Text;
      FieldByName('username').AsString := Edit2.Text;
      FieldByName('full_name').AsString := Edit3.Text;
      FieldByName('password').AsString := Edit4.Text;
      FieldByName('role').AsString := ComboBox1.Text;
      FieldByName('email').AsString := Edit5.Text;
      FieldByName('telp').AsString := Edit6.Text;
      FieldByName('alamat').AsString := Edit7.Text;
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

procedure TForm9.Button5Click(Sender: TObject);
begin
  if Application.MessageBox('Anda yakin akan keluar?', 'Informasi', MB_YESNO) = IDYES then
    Close;
end;

procedure TForm9.Button4Click(Sender: TObject);
begin
  with DataModule4.Dsuser.DataSet do
  begin
    if Locate('username', Edit8.Text, []) then
    begin
      ShowMessage('Data Ditemukan.');
    end
    else
    begin
      ShowMessage('Data Tidak Ditemukan.');
    end;
  end;
end;

procedure TForm9.Button3Click(Sender: TObject);
begin
  if DataModule4.Dsuser.DataSet.RecordCount = 0 then
  begin
    ShowMessage('Tidak ada data untuk dihapus.');
  end
  else if Application.MessageBox('Apakah Anda yakin ingin menghapus data ini?', 'Konfirmasi', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DataModule4.Dsuser.DataSet.Delete;
    ShowMessage('Data Berhasil Didelete.');
    posisiawal;
  end;
end;

procedure TForm9.Button7Click(Sender: TObject);
begin
  posisiawal;
  end;

procedure TForm9.Button6Click(Sender: TObject);
begin
  Edit1.Enabled := True;
  Edit2.Enabled := True;
  Edit3.Enabled := True;
  Edit4.Enabled := True;
  ComboBox1.Enabled:= True;
  Edit5.Enabled := True;
  Edit6.Enabled := True;
  Edit7.Enabled := True;
  Button1.Enabled := True;
  Button2.Enabled := False;
  Button3.Enabled := False;
end;

procedure TForm9.DBGrid1CellClick(Column: TColumn);
begin
with DataModule4.Dsuser.DataSet do
  begin
    Edit1.Text := FieldByName('nik').AsString;
    Edit2.Text := FieldByName('username').AsString;
    Edit3.Text := FieldByName('full_name').AsString;
    Edit4.Text := FieldByName('password').AsString;
    ComboBox1.Text := FieldByName('role').AsString;
    Edit5.Text := FieldByName('email').AsString;
    Edit6.Text := FieldByName('telp').AsString;
    Edit7.Text := FieldByName('alamat').AsString;
  end;

  Edit1.Enabled := True;
  Edit2.Enabled := True;
  Edit3.Enabled := True;
  Edit4.Enabled := True;
  ComboBox1.Enabled := True;
  Edit5.Enabled := True;
  Edit6.Enabled := True;
  Edit7.Enabled := True;
  Button2.Enabled := True;
  Button3.Enabled := True;
  Button1.Enabled := False;
end;
end.

