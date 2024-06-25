object DataModule4: TDataModule4
  OldCreateOrder = False
  Left = 919
  Top = 143
  Height = 328
  Width = 492
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    ReadOnly = True
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\asus\Downloads\libmysql (1).dll'
    Left = 24
    Top = 16
  end
  object Zkategori: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from kategori')
    Params = <>
    Left = 88
    Top = 16
  end
  object Dskategori: TDataSource
    DataSet = Zkategori
    Left = 88
    Top = 80
  end
  object Zsatuan: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from satuan')
    Params = <>
    Left = 144
    Top = 16
  end
  object Dssatuan: TDataSource
    DataSet = Zsatuan
    Left = 144
    Top = 80
  end
  object Zsuplier: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from suplier')
    Params = <>
    Left = 192
    Top = 16
  end
  object Dssuplier: TDataSource
    DataSet = Zsuplier
    Left = 200
    Top = 80
  end
  object Zkustomer: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from kustomer')
    Params = <>
    Left = 240
    Top = 16
  end
  object Dskustomer: TDataSource
    DataSet = Zkustomer
    Left = 248
    Top = 80
  end
  object Zuser: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from user')
    Params = <>
    Left = 296
    Top = 16
  end
  object Zbarang: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from barang')
    Params = <>
    Left = 408
    Top = 16
  end
  object Dsuser: TDataSource
    DataSet = Zuser
    Left = 312
    Top = 80
  end
  object Dsbarang: TDataSource
    DataSet = Zbarang
    Left = 416
    Top = 80
  end
end
