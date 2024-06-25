unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Edit3: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit4;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('Nama Satuan Tidak Boleh Kosong!');
  end
  else if Edit2.Text = '' then
  begin
    ShowMessage('Deskripsi Satuan Tidak Boleh Kosong!');
  end
  else if DataModule4.Dssatuan.DataSet.Locate('name', Edit1.Text, []) then
  begin
    ShowMessage('Nama Satuan ' + Edit1.Text + ' Sudah Ada Didalam Sistem');
  end
  else
  begin
    with DataModule4.Dssatuan.DataSet do
    begin
      Append;
      FieldByName('name').AsString := Edit1.Text;
      FieldByName('diskripsi').AsString := Edit2.Text;
      Post;
    end;

    ShowMessage('Data Berhasil Disimpan.');
    posisiawal; // Reset to initial state after saving
  end;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('Nama Satuan Tidak Boleh Kosong!');
  end
  else if Edit2.Text = '' then
  begin
    ShowMessage('Deskripsi Satuan Tidak Boleh Kosong!');
  end
  else if Edit1.Text = DataModule4.Dssatuan.DataSet.FieldByName('name').AsString then
  begin
    ShowMessage('Nama Satuan ' + Edit1.Text + ' tidak ada perubahan');
  end
  else
  begin
    with DataModule4.Dssatuan.DataSet do
    begin
      Edit;
      FieldByName('name').AsString := Edit1.Text;
      FieldByName('diskripsi').AsString := Edit2.Text;
      Post;
    end;

    ShowMessage('Data berhasil Diupdate.');
    posisiawal; // Reset to initial state after updating
  end;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  if DataModule4.Dssatuan.DataSet.RecordCount = 0 then
  begin
    ShowMessage('Tidak ada data untuk dihapus.');
  end
  else if Application.MessageBox('Apakah Anda yakin ingin menghapus data ini?', 'Konfirmasi', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DataModule4.Dssatuan.DataSet.Delete;
    ShowMessage('Data Berhasil Didelete.');
    posisiawal; // Reset to initial state after deleting
  end;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
  with DataModule4.Dssatuan.DataSet do
  begin
    if Locate('name', Edit3.Text, []) then
    begin
      ShowMessage('Data ditemukan.');
    end
    else
    begin
      ShowMessage('Data tidak ditemukan.');

    end;
  end;
end;
procedure TForm5.DBGrid1CellClick(Column: TColumn);
begin
  with DataModule4.Dssatuan.DataSet do
  begin
    Edit1.Text := FieldByName('name').AsString;
    Edit2.Text := FieldByName('diskripsi').AsString;
  end;

  Edit1.Enabled := True;
  Edit2.Enabled := True;
  Button2.Enabled := True;
  Button3.Enabled := True;
  Button1.Enabled := False;
end;

procedure TForm5.Button5Click(Sender: TObject);
begin
  if Application.MessageBox('Anda yakin akan keluar?', 'Informasi', MB_YESNO) = IDYES then
    Close;
end;

procedure TForm5.Button6Click(Sender: TObject);
begin
  Edit1.Enabled := True;
  Edit2.Enabled := True;
  Button1.Enabled := True;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Button5.Enabled := True;
  Button6.Enabled := False;
end;

procedure TForm5.bersih;
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
end;

procedure TForm5.posisiawal;
begin
  bersih;
  Edit1.Enabled := False;
  Edit2.Enabled := False;
  Button1.Enabled := False;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Button5.Enabled := True;
  Button6.Enabled := True;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  posisiawal;
end;

procedure TForm5.Button7Click(Sender: TObject);
begin
posisiawal;
end;

end.

