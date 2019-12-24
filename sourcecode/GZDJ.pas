unit GZDJ;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids;

type
  TGZDJDlg = class(TForm)
    DBGridGZDJ: TDBGrid;
    DataSourceGZDJ: TDataSource;
    TableGZDJ: TTable;
    TableGZDJDJ: TStringField;
    TableGZDJGZ: TFloatField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GZDJDlg: TGZDJDlg;

implementation

uses main, INGZDJ;

{$R *.DFM}

procedure TGZDJDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TableGZDJ.Close ;
end;

procedure TGZDJDlg.FormShow(Sender: TObject);
begin
     TableGZDJ.Open ;
end;

procedure TGZDJDlg.BitBtn1Click(Sender: TObject);
begin
     INGZDJDlg.Tag := 1 ;
     INGZDJDlg.ShowModal ;
end;

procedure TGZDJDlg.BitBtn2Click(Sender: TObject);
begin
     INGZDJDlg.Tag := 0 ;
     INGZDJDlg.ShowModal ;
end;

procedure TGZDJDlg.BitBtn3Click(Sender: TObject);
begin
     if (Application.MessageBox( '对不起,您真的删除当前子目吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     TableGZDJ.Delete ;
end;

procedure TGZDJDlg.BitBtn4Click(Sender: TObject);
begin
     Self.Close ;
end;

end.
