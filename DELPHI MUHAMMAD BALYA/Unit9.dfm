object Form9: TForm9
  Left = 355
  Top = 251
  Width = 640
  Height = 633
  Caption = 'user'
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 29
    Height = 19
    Caption = 'NIK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 56
    Width = 85
    Height = 19
    Caption = 'USERNAME'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 96
    Width = 92
    Height = 19
    Caption = 'FULL_NAME'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 128
    Width = 85
    Height = 19
    Caption = 'PASSWORD'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 32
    Top = 160
    Width = 40
    Height = 19
    Caption = 'ROLE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 32
    Top = 200
    Width = 48
    Height = 19
    Caption = 'EMAIL'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 32
    Top = 232
    Width = 36
    Height = 19
    Caption = 'TELP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 32
    Top = 264
    Width = 63
    Height = 19
    Caption = 'ALAMAT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 24
    Top = 488
    Width = 79
    Height = 13
    Caption = 'MASUKAN NAME'
  end
  object Edit1: TEdit
    Left = 176
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 176
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 176
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 176
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 176
    Top = 168
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object Edit5: TEdit
    Left = 176
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Edit6: TEdit
    Left = 176
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Edit7: TEdit
    Left = 176
    Top = 264
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object Button1: TButton
    Left = 96
    Top = 312
    Width = 75
    Height = 25
    Caption = 'INSERT'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 312
    Width = 75
    Height = 25
    Caption = 'UPDATE'
    TabOrder = 9
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 288
    Top = 312
    Width = 75
    Height = 25
    Caption = 'DELETE'
    TabOrder = 10
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 320
    Top = 480
    Width = 75
    Height = 25
    Caption = 'CARI'
    TabOrder = 11
    OnClick = Button4Click
  end
  object DBGrid1: TDBGrid
    Left = 56
    Top = 344
    Width = 320
    Height = 120
    DataSource = DataModule4.Dsuser
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object Edit8: TEdit
    Left = 112
    Top = 480
    Width = 121
    Height = 21
    TabOrder = 13
  end
  object Button5: TButton
    Left = 192
    Top = 528
    Width = 75
    Height = 25
    Caption = 'LOGOUT'
    TabOrder = 14
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 312
    Width = 75
    Height = 25
    Caption = 'NEW'
    TabOrder = 15
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 392
    Top = 312
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 16
    OnClick = Button7Click
  end
end
