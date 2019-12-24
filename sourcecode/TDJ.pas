unit TDJ;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, DBTables, Db, Grids, DBGrids, DECZ;

type
  TTDJDlg = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    DBGridTDJ: TDBGrid;
    TDJTEMP: TTable;
    TDJTEMPID: TSmallintField;
    TDJTEMPBH: TStringField;
    TDJTEMPMC: TStringField;
    TDJTEMPDW: TStringField;
    TDJTEMPDJ: TFloatField;
    TDJTEMPRGF: TFloatField;
    TDJTEMPCLF: TFloatField;
    TDJTEMPJXF: TFloatField;
    TDJTEMPRGS: TFloatField;
    TDJTEMPGZDJ: TStringField;
    TDJTEMPBS: TStringField;
    TDJTEMPDEMC: TStringField;
    TDJTEMPCODEID: TSmallintField;
    TDJTEMPBH1: TStringField;
    TDJTEMPMC1: TStringField;
    TDJTEMPP1: TFloatField;
    TDJTEMPP2: TFloatField;
    TDJTEMPP3: TFloatField;
    TDJTEMPP4: TFloatField;
    TDJTEMPP5: TFloatField;
    TDJTEMPHL: TFloatField;
    DataSourceTDJ: TDataSource;
    QueryTEMP: TQuery;
    Bevel2: TBevel;
    DBGridJP: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QueryJP: TQuery;
    DataSourceJP: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SQLcommand : string ;
    ID : integer ;
    HS : string[20] ;
  end;

var
  TDJDlg: TTDJDlg;

implementation

uses MAIN, DEHS, YSZLDBS;

{$R *.DFM}

procedure TTDJDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryJP.Close ;
     TDJTEMP.Close ;
end;

procedure TTDJDlg.FormShow(Sender: TObject);
begin
     Edit1.Text := DEHSDlg.Edit1.Text ;
     Edit2.Text := DEHSDlg.Edit2.Text ;
     ID := DEHSDlg.CODEID ;
     SQLCommand := 'SELECT * FROM CODE WHERE ID='+IntToStr(ID)+' AND FL LIKE "*%"' ;
     QueryJP.Close ;
     QueryJP.SQL.Clear ;
     QueryJP.SQL.Add( SQLcommand ) ;
     QueryJP.Open ;
     TDJTEMP.TableName := 'TDJTEMP.DB' ;
     TDJTEMP.Open ;
     TDJTEMP.First ;
end;

procedure TTDJDlg.BitBtn1Click(Sender: TObject);
var
   i : integer ;
begin
     if (Application.MessageBox( '将要对当前选择的级配材料进行换算,继续吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     if (GetSearchClRec(Dbs.TableCODE, TDJTEMP.FieldByName('CODEID').AsInteger, TDJTEMP.FieldByName('BH').AsString)) then
     begin
          DEHSDlg.HSDETEMP.AppendRecord([0,TDJTEMP.FieldByName('BH').AsString]) ;
          DEHSDlg.WriteHSDETEMP(0, -TDJTEMP.FieldByName('HL').AsFloat) ;
     end ;
     TDJTEMP.Edit ;
     TDJTEMP.FieldByName('BH').AsString := QueryJP.FieldByName('CODE').AsString ;
     TDJTEMP.FieldByName('MC').AsString := QueryJP.FieldByName('MC').AsString ;
     TDJTEMP.FieldByName('DW').AsString := QueryJP.FieldByName('DW').AsString ;
     TDJTEMP.FieldByName('DJ').AsFloat  := QueryJP.FieldByName('DEJ').AsFloat ;
     TDJTEMP.FieldByName('CLF').AsFloat := QueryJP.FieldByName('DEJ').AsFloat ;
     TDJTEMP.Post ;
     if (GetSearchClRec(Dbs.TableCODE, TDJTEMP.FieldByName('CODEID').AsInteger, TDJTEMP.FieldByName('BH').AsString)) then
     begin
          DEHSDlg.HSDETEMP.AppendRecord([0,TDJTEMP.FieldByName('BH').AsString]) ;
          DEHSDlg.WriteHSDETEMP(0, TDJTEMP.FieldByName('HL').AsFloat) ;
     end ;
end;

procedure TTDJDlg.BitBtn2Click(Sender: TObject);
begin
     Self.Close ;
end;

end.
