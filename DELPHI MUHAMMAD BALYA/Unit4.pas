unit Unit4;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TDataModule4 = class(TDataModule)
    ZConnection1: TZConnection;
    Zkategori: TZQuery;
    Dskategori: TDataSource;
    Zsatuan: TZQuery;
    Dssatuan: TDataSource;
    Zsuplier: TZQuery;
    Dssuplier: TDataSource;
    Zkustomer: TZQuery;
    Dskustomer: TDataSource;
    Zuser: TZQuery;
    Zbarang: TZQuery;
    Dsuser: TDataSource;
    Dsbarang: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule4: TDataModule4;

implementation

{$R *.dfm}

end.
