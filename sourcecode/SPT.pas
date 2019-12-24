unit SPT;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Grids, DBGrids, Db, DBTables;

type
  TSPTDlg = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    TableSPT: TTable;
    DataSourceSPT: TDataSource;
    DBGridSPT: TDBGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SPTDlg: TSPTDlg;

implementation

uses main, INSPT;

{$R *.DFM}


procedure TSPTDlg.BitBtn1Click(Sender: TObject);
begin
     INSPTDlg.Tag := 1 ;
     INSPTDlg.ShowModal ;
end;

procedure TSPTDlg.BitBtn2Click(Sender: TObject);
begin
     INSPTDlg.Tag := 0 ;
     INSPTDlg.ShowModal ;
end;

procedure TSPTDlg.BitBtn3Click(Sender: TObject);
begin
     if (Application.MessageBox( '真的删除当前子目吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     TableSPT.Delete ;
end;

procedure TSPTDlg.BitBtn4Click(Sender: TObject);
begin
     Self.Close ;
end;

procedure TSPTDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TableSPT.Close ;
end;

procedure TSPTDlg.FormShow(Sender: TObject);
begin
     TableSPT.Open ;
end;

end.
