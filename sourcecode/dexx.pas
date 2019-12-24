unit dexx;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, DBTables, DB, Grids, DBGrids, Mask, DBCtrls,
  SysUtils, DECZ ;

type
  TDEXXDlg = class(TForm)
    DataSourceDEZC: TDataSource;
    DBGridDEZC: TDBGrid;
    QueryTEMP: TQuery;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit7: TDBEdit;
    Label3: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label7: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    DEZCTEMP: TTable;
    DEZCTEMPID: TSmallintField;
    DEZCTEMPBH: TStringField;
    DEZCTEMPCODE: TStringField;
    DEZCTEMPHL: TFloatField;
    DEZCTEMPLB: TStringField;
    DEZCTEMPMC: TStringField;
    DEZCTEMPDW: TStringField;
    DEZCTEMPDJ: TFloatField;
    DBGridDEFX: TDBGrid;
    DEFXTEMP: TTable;
    DataSourceDEFX: TDataSource;
    DEFXTEMPID: TSmallintField;
    DEFXTEMPBH: TStringField;
    DEFXTEMPCODE: TStringField;
    DEFXTEMPHL: TFloatField;
    DEFXTEMPLB: TStringField;
    DEFXTEMPFL: TStringField;
    DEFXTEMPFLCODE: TStringField;
    DEFXTEMPMC: TStringField;
    DEFXTEMPDW: TStringField;
    DEFXTEMPDJ: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure DEZCTEMPCalcFields(DataSet: TDataSet);
    procedure DEFXTEMPCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    ID : smallint ;
    BH : string[16] ;
    CODEID : smallint ;
    GZDJ : string[5] ;
    RGZ : double ;
  end;

var
  DEXXDlg : TDEXXDlg;

implementation
uses MAIN, YSZLDBS, DEQUERY ;
{$R *.DFM}

procedure TDEXXDlg.FormShow(Sender: TObject);
begin
     ID := DEQueryDlg.TableDE.FieldByName('ID').AsInteger ;
     BH := DEQueryDlg.TableDE.FieldByName('BH').AsString ;
     CODEID := DEQueryDlg.TableDE.FieldByName('CODEID').AsInteger ;
     GZDJ := DEQueryDlg.TableDE.FieldByName('GZDJ').AsString ;
     RGZ := 0.0 ;
     if (DBS.TableGZ.FindKey([GZDJ])) then
        RGZ := DBS.TableGZ.FieldByName('GZ').AsFloat ;

     QueryTEMP.Close ;
     QueryTEMP.SQL.Clear ;
     QueryTEMP.SQL.Add ( 'SELECT * FROM DEZC WHERE ID='+IntToStr(ID)+' AND BH="'+BH+'"' ) ;

     DEZCTEMP.Close ;
     DEZCTEMP.TableName := 'DEZCTEMP.DB' ;
     DEZCTEMP.BatchMove ( QueryTEMP, batCopy ) ;
     DEZCTEMP.Open ;

     QueryTEMP.Close ;
     QueryTEMP.SQL.Clear ;
     QueryTEMP.SQL.Add ( 'SELECT * FROM DEFX WHERE ID='+IntToStr(ID)+' AND BH="'+BH+'"' ) ;

     DEFXTEMP.Close ;
     DEFXTEMP.TableName := 'DEFXTEMP.DB' ;
     DEFXTEMP.BatchMove ( QueryTEMP, batCopy ) ;
     DEFXTEMP.Open ;
end;

procedure TDEXXDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryTEMP.Close ;
     DEZCTEMP.Close ;
     DEZCTEMP.DeleteTable ;
     DEFXTEMP.Close ;
     DEFXTEMP.DeleteTable ;
end;

procedure TDEXXDlg.BitBtn1Click(Sender: TObject);
begin
     Self.Close ;
end;

procedure TDEXXDlg.DEZCTEMPCalcFields(DataSet: TDataSet);
var
   DEID : smallint ;
   CODE : string[16] ;
   LB : string[10] ;
begin
     with Dbs do
     begin
          CODE := DEZCTEMP.FieldByName('CODE').AsString ;
          if (TableCODE.FindKey([CODEID, CODE])) then
          begin
               DEZCTEMP.FieldByName('MC').AsString := TableCODE.FieldByName('MC').AsString ;
               DEZCTEMP.FieldByName('DW').AsString := TableCODE.FieldByName('DW').AsString ;
               DEZCTEMP.FieldByName('DJ').AsFloat  := TableCODE.FieldByName('DEJ').AsFloat ;
               if (DEZCTEMP.FieldByName('LB').AsString='人工') then
               begin
                    if (DEZCTEMP.FieldByName('DJ').AsFloat=0.0) then
                       DEZCTEMP.FieldByName('DJ').AsFloat := RGZ ;
               end ;
          end else
          begin
               LB := DEZCTEMP.FieldByName('LB').AsString ;
               DEID := ReturnDEID (LB) ;
               if (DEID>0) then
               begin
                    if (TableDE.FindKey([DEID,CODE])) then
                    begin
                         DEZCTEMP.FieldByName('MC').AsString := TableDE.FieldByName('MC').AsString ;
                         DEZCTEMP.FieldByName('DW').AsString := TableDE.FieldByName('DW').AsString ;
                         DEZCTEMP.FieldByName('DJ').AsFloat  := TableDE.FieldByName('DJ').AsFloat ;
                    end ;
               end ;
          end ;
     end ;
end;

procedure TDEXXDlg.DEFXTEMPCalcFields(DataSet: TDataSet);
var
   CODE : string[16] ;
begin
     with Dbs do
     begin
          CODE := DEFXTEMP.FieldByName('CODE').AsString ;
          if (TableCODE.FindKey([CODEID, CODE])) then
          begin
               DEFXTEMP.FieldByName('MC').AsString := TableCODE.FieldByName('MC').AsString ;
               DEFXTEMP.FieldByName('DW').AsString := TableCODE.FieldByName('DW').AsString ;
               DEFXTEMP.FieldByName('DJ').AsFloat  := TableCODE.FieldByName('DEJ').AsFloat ;
               if (DEFXTEMP.FieldByName('LB').AsString='人工') then
               begin
                    if (DEFXTEMP.FieldByName('DJ').AsFloat=0.0) then
                       DEFXTEMP.FieldByName('DJ').AsFloat := RGZ ;
               end ;
          end ;
     end ;
end;

end.
