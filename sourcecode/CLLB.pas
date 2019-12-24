unit CLLB;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids;

type
  TCLLBDlg = class(TForm)
    DBGridCLLB: TDBGrid;
    TableCLLB: TTable;
    DataSourceCLLB: TDataSource;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    TableCLLBID: TStringField;
    TableCLLBCODE: TStringField;
    TableCLLBMC: TStringField;
    TableCLLBPX: TStringField;
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
  CLLBDlg: TCLLBDlg;

implementation

uses main, INCLLB;

{$R *.DFM}



procedure TCLLBDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TableCLLB.Close ;
end;

procedure TCLLBDlg.FormShow(Sender: TObject);
begin
     TableCLLB.Open ;
end;

procedure TCLLBDlg.BitBtn1Click(Sender: TObject);
begin
     INCLLBDlg.Tag := 1 ;
     INCLLBDlg.ShowModal ;
end;

procedure TCLLBDlg.BitBtn2Click(Sender: TObject);
begin
     INCLLBDlg.Tag := 0 ;
     INCLLBDlg.ShowModal ;
end;

procedure TCLLBDlg.BitBtn3Click(Sender: TObject);
begin
     if (Application.MessageBox( '对不起,您真的删除当前子目吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     TableCLLB.Delete ;
end;

procedure TCLLBDlg.BitBtn4Click(Sender: TObject);
begin
     Self.Close ;
end;

end.
