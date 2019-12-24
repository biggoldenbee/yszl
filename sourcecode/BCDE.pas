unit BCDE;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, DBTables, DB, Grids, DBGrids, Mask, DBCtrls,
  SysUtils, DECZ ;

type
  TBCDEDlg = class(TForm)
    DataSourceDEZC: TDataSource;
    DBGridDEZC: TDBGrid;
    QueryTEMP: TQuery;
    QuitBitBtn: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Bevel2: TBevel;
    DEZCTEMP: TTable;
    DEZCTEMPID: TSmallintField;
    DEZCTEMPBH: TStringField;
    DEZCTEMPCODE: TStringField;
    DEZCTEMPHL: TFloatField;
    DEZCTEMPLB: TStringField;
    DEZCTEMPMC: TStringField;
    DEZCTEMPDW: TStringField;
    DEZCTEMPDJ: TFloatField;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    DEFXTEMP: TTable;
    DEFXTEMPID: TSmallintField;
    DEFXTEMPBH: TStringField;
    DEFXTEMPCODE: TStringField;
    DEFXTEMPHL: TFloatField;
    DEFXTEMPLB: TStringField;
    DEFXTEMPFL: TStringField;
    DEFXTEMPFLCODE: TStringField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuitBitBtnClick(Sender: TObject);
    procedure DEZCTEMPCalcFields(DataSet: TDataSet);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DEZCTEMPAfterOpen(DataSet: TDataSet);
    procedure DEZCTEMPAfterClose(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit9KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  BCDEDlg : TBCDEDlg;

implementation
uses MAIN, YSZLDBS, DEQUERY, SCL, SDE, Wait ;
{$R *.DFM}

procedure TBCDEDlg.FormShow(Sender: TObject);
begin
     ID := DEQueryDlg.TableDE.FieldByName('ID').AsInteger ;
     BH := '' ;
     CODEID := DEQueryDlg.TableDE.FieldByName('CODEID').AsInteger ;

     Edit1.Text := '' ;
     Edit2.Text := '' ;
     Edit3.Text := '' ;
     Edit4.Text := '' ;
     Edit5.Text := '' ;
     Edit6.Text := '' ;
     Edit7.Text := '' ;
     Edit8.Text := '' ;
     Edit9.Text := '' ;
     Edit10.Text:= '' ;
     Edit11.Text:= '' ;
     Edit12.Text:= '' ;
     Edit13.Text:= '' ;
     CheckBox1.Checked := TRUE ;

     QueryTEMP.Close ;
     DEZCTEMP.Close ;
     DEFXTEMP.Close ;
     DBGridDEZC.Visible := DEZCTEMP.Active ;
end;

procedure TBCDEDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryTEMP.Close ;
     if (DEZCTEMP.Active) then
     begin
          DEZCTEMP.Close ;
          DEZCTEMP.DeleteTable ;
     end ;
     if (DEFXTEMP.Active) then
     begin
          DEFXTEMP.Close ;
          DEFXTEMP.DeleteTable ;
     end ;
end;

procedure TBCDEDlg.QuitBitBtnClick(Sender: TObject);
begin
     Self.Close ;
end;

procedure TBCDEDlg.DEZCTEMPCalcFields(DataSet: TDataSet);
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

procedure TBCDEDlg.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_ESCAPE) then
     begin
          FormShow(Self) ;
     end ;
     if (Edit1.Text='') then
     begin
          FormShow(Self) ;
          exit ;
     end ;
     BH := Edit1.Text ;
     if (Key=VK_RETURN) then
     begin
          if (DEQUERYDlg.TableDE.FindKey([ID, BH])) then
          begin
               Edit1.Text  := DEQUERYDlg.TableDE.FieldByName('BH').AsString ;
               Edit2.Text  := DEQUERYDlg.TableDE.FieldByName('MC').AsString ;
               Edit3.Text  := DEQUERYDlg.TableDE.FieldByName('DW').AsString ;
               Edit4.Text  := DEQUERYDlg.TableDE.FieldByName('DJ').AsString ;
               Edit5.Text  := DEQUERYDlg.TableDE.FieldByName('RGF').AsString ;
               Edit6.Text  := DEQUERYDlg.TableDE.FieldByName('CLF').AsString ;
               Edit7.Text  := DEQUERYDlg.TableDE.FieldByName('JXF').AsString ;
               Edit8.Text  := DEQUERYDlg.TableDE.FieldByName('RGS').AsString ;
               Edit9.Text  := DEQUERYDlg.TableDE.FieldByName('GZDJ').AsString ;
               Edit10.Text := DEQUERYDlg.TableDE.FieldByName('BH1').AsString ;
               Edit11.Text := DEQUERYDlg.TableDE.FieldByName('MC1').AsString ;
               Edit12.Text := DEQUERYDlg.TableDE.FieldByName('P1').AsString ;
               Edit13.Text := DEQUERYDlg.TableDE.FieldByName('P2').AsString ;

               GZDJ := Edit9.Text ;
               RGZ := 0.0 ;
               if (DBS.TableGZ.FindKey([GZDJ])) then
               begin
                    RGZ := DBS.TableGZ.FieldByName('GZ').AsFloat ;
               end else
               begin
                    Edit9.Text := '' ;
                    GZDJ := '' ;
                    RGZ := 0.0 ;
               end ;
          end ;
          QueryTEMP.Close ;
          QueryTEMP.SQL.Clear ;
          QueryTEMP.SQL.Add ( 'SELECT * FROM DEZC WHERE ID='+IntToStr(ID)+' AND BH="'+BH+'"' ) ;

          DEZCTEMP.Close ;
          DEZCTEMP.TableName := 'DEZCTEMP.DB' ;
          DEZCTEMP.BatchMove ( QueryTEMP, batCopy ) ;
          DEZCTEMP.Open ;
     end ;
end;

procedure TBCDEDlg.DEZCTEMPAfterOpen(DataSet: TDataSet);
begin
     DBGridDEZC.Visible := TRUE ;
end;

procedure TBCDEDlg.DEZCTEMPAfterClose(DataSet: TDataSet);
begin
     DBGridDEZC.Visible := FALSE ;
end;

procedure TBCDEDlg.BitBtn1Click(Sender: TObject);
begin
     if (not DEZCTEMP.Active) then
     begin
          Application.MessageBox( '对不起,请在编号栏内输入正确的定额编号!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          Edit1.SetFocus ;
          exit ;
     end ;
     SCLDlg.Tag := 1 ;
     SCLDlg.ShowModal ;
end;

procedure TBCDEDlg.BitBtn2Click(Sender: TObject);
begin
     if (not DEZCTEMP.Active) then
     begin
          Application.MessageBox( '对不起,请在编号栏内输入正确的定额编号!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          Edit1.SetFocus ;
          exit ;
     end ;
     SDEDlg.Tag := 1 ;
     SDEDlg.ShowModal ;
end;

procedure TBCDEDlg.BitBtn3Click(Sender: TObject);
begin
     if (not DEZCTEMP.Active) then
     begin
          Application.MessageBox( '对不起,请在编号栏内输入正确的定额编号!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          Edit1.SetFocus ;
          exit ;
     end ;
     if (Application.MessageBox( '您真的删除当前子目吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     DEZCTEMP.Delete ;
end;

procedure TBCDEDlg.BitBtn4Click(Sender: TObject);
var
   dj, rgf, clf, jxf, rgs : double ;
   CODE : string[16] ;
   LB : string[10] ;
   DEID : smallint ;
begin
     if (not DEZCTEMP.Active) then
     begin
          Application.MessageBox( '对不起,请在编号栏内输入正确的定额编号!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          Edit1.SetFocus ;
          exit ;
     end ;
     BH := Edit1.Text ;
     GZDJ := Edit9.Text ;
     RGZ := 0.0 ;
     if (DBS.TableGZ.FindKey([GZDJ])) then
     begin
          RGZ := DBS.TableGZ.FieldByName('GZ').AsFloat ;
     end else
     begin
          Edit9.Text := '' ;
          GZDJ := '' ;
          RGZ := 0.0 ;
     end ;
     DEZCTEMP.Refresh ;

     dj := 0.0 ;
     rgf := 0.0 ;
     clf := 0.0 ;
     jxf := 0.0 ;
     rgs := 0.0 ;

     DEZCTEMP.First ;
     while (TRUE) do
     begin
          if (DEZCTEMP.EOF) then
             break ;

          CODE := DEZCTEMP.FieldByName('CODE').AsString ;
          LB := DEZCTEMP.FieldByName('LB').AsString ;
          if (LB='人工') then
          begin
               rgf := rgf+DEZCTEMP.FieldByName('HL').AsFloat*DEZCTEMP.FieldByName('DJ').AsFloat ;
               rgs := rgs+DEZCTEMP.FieldByName('HL').AsFloat ;
          end else if (LB='福利') then
          begin
               rgf := rgf+DEZCTEMP.FieldByName('HL').AsFloat*DEZCTEMP.FieldByName('DJ').AsFloat ;
          end else if (LB='材料') then
          begin
               clf := clf+DEZCTEMP.FieldByName('HL').AsFloat*DEZCTEMP.FieldByName('DJ').AsFloat ;
          end else if (LB='机械') then
          begin
               jxf := jxf+DEZCTEMP.FieldByName('HL').AsFloat*DEZCTEMP.FieldByName('DJ').AsFloat ;
          end else
          begin
               DEID := ReturnDEID(LB) ;
               with Dbs do
               begin
                    if (TableDE.FindKey([DEID,CODE])) then
                    begin
                         rgf := rgf+TableDE.FieldByName('RGF').AsFloat*DEZCTEMP.FieldByName('HL').AsFloat ;
                         rgs := rgs+TableDE.FieldByName('RGS').AsFloat*DEZCTEMP.FieldByName('HL').AsFloat ;
                         clf := clf+TableDE.FieldByName('CLF').AsFloat*DEZCTEMP.FieldByName('HL').AsFloat ;
                         jxf := jxf+TableDE.FieldByName('JXF').AsFloat*DEZCTEMP.FieldByName('HL').AsFloat ;
                    end ;
               end ;
          end ;

          DEZCTEMP.Edit ;
          DEZCTEMP.FieldByName('BH').AsString := BH ;
          DEZCTEMP.Post ;

          DEZCTEMP.Next ;
     end ;
     DEZCTEMP.First ;
     dj := rgf+clf+jxf ;
     if (CheckBox1.Checked) then
     begin
          rgf := Round(rgf*100)/100 ;
          rgs := Round(rgs*10000)/10000 ;
          clf := Round(clf*100)/100 ;
          jxf := Round(jxf*100)/100 ;
          dj  := rgf+clf+jxf ;
     end ;
     Edit4.Text := format(formatstr,[dj]) ;
     Edit5.Text := format(formatstr,[rgf]) ;
     Edit6.Text := format(formatstr,[clf]) ;
     Edit7.Text := format(formatstr,[jxf]) ;
     Edit8.Text := format(formatstr,[rgs]) ;
end;

procedure TBCDEDlg.BitBtn5Click(Sender: TObject);
var
   CODE : string[16] ;
   LB : string[10] ;
   DEID : smallint ;
   HL : double ;
begin
     if (not DEZCTEMP.Active) then
     begin
          Application.MessageBox( '对不起,请在编号栏内输入正确的定额编号!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          Edit1.SetFocus ;
          exit ;
     end ;
     if (Application.MessageBox( '将要刷新定额库,继续吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     BitBtn4.Click ;
     //judge if is a empty record
//     if (DEZCTEMP.RecordCount=0) then
//        exit ;

     WaitDlg.Show ;
     WaitDlg.Update ;
     //update dek
     BH := Edit1.Text ;
     with Dbs do
     begin
          if (TableDE.FindKey([ID, BH])) then
             TableDE.GotoKey
          else
              TableDE.AppendRecord([ID,BH]) ;
          TableDE.Edit ;
          TableDE.FieldByName('MC').AsString   := Edit2.Text ;
          TableDE.FieldByName('DW').AsString   := Edit3.Text ;
          TableDE.FieldByName('DJ').AsString   := Edit4.Text ;
          TableDE.FieldByName('RGF').AsString  := Edit5.Text ;
          TableDE.FieldByName('CLF').AsString  := Edit6.Text ;
          TableDE.FieldByName('JXF').AsString  := Edit7.Text ;
          TableDE.FieldByName('RGS').AsString  := Edit8.Text ;
          TableDE.FieldByName('GZDJ').AsString := Edit9.Text ;
          TableDE.FieldByName('BH1').AsString  := Edit10.Text ;
          TableDE.FieldByName('MC1').AsString  := Edit11.Text ;
          TableDE.FieldByName('P1').AsString   := Edit12.Text ;
          TableDE.FieldByName('P2').AsString   := Edit13.Text ;
          TableDE.FieldByName('DEMC').AsString := ReturnDEMC(ID) ;
          TableDE.FieldByName('CODEID').AsInteger := CODEID ;
          TableDE.FieldByName('P5').AsString   := '1.0' ;
          TableDE.Post ;
     end ;
     //delete record
     QueryTEMP.Close ;
     QueryTEMP.SQL.Clear ;
     QueryTEMP.SQL.Add ( 'DELETE FROM DEZC WHERE ID='+IntToStr(ID)+' AND BH="'+BH+'"' ) ;
     QueryTEMP.ExecSQL ;
     QueryTEMP.Close ;
     QueryTEMP.SQL.Clear ;
     QueryTEMP.SQL.Add ( 'DELETE FROM DEFX WHERE ID='+IntToStr(ID)+' AND BH="'+BH+'"' ) ;
     QueryTEMP.ExecSQL ;
     QueryTEMP.Close ;
     //update dezc
     Dbs.TableDEZC.BatchMove(DEZCTEMP, batAppendUpdate) ;
     //create new defxtemp and update defxtemp
     DEFXTEMP.Close ;
     DEFXTEMP.TableName := 'DEFXTEMP.DB' ;
     DEFXTEMP.CreateTable ;
     DEFXTEMP.Open ;
     DEZCTEMP.First ;
     while (TRUE) do
     begin
          if (DEZCTEMP.EOF) then
             break ;
          CODE := DEZCTEMP.FieldByName('CODE').AsString ;
          LB := DEZCTEMP.FieldByName('LB').AsString ;
          DEID := ReturnDEID(LB) ;
          HL := DEZCTEMP.FieldByName('HL').AsFloat ;
          if (DEID>0) then
          begin
               QueryTEMP.Close ;
               QueryTEMP.SQL.Clear ;
               QueryTEMP.SQL.Add ('SELECT ID,BH,CODE,'+FloatToStr(HL)+'*HL HL,LB,FL,FLCODE FROM DEFX WHERE ID='+IntToStr(DEID)+' AND BH="'+CODE+'"' ) ;
               DEFXTEMP.BatchMove (QueryTEMP, batAppend) ;
          end else
          begin
               if (Dbs.TableCODE.FindKey([CODEID,CODE])) then
               begin
                    DEFXTEMP.AppendRecord([ID,BH,CODE]) ;
                    DEFXTEMP.Edit ;
                    DEFXTEMP.FieldByName('HL').AsFloat  := HL ;
                    DEFXTEMP.FieldByName('LB').AsString := Dbs.TableCODE.FieldByName('LB1').AsString ;
                    DEFXTEMP.FieldByName('FL').AsString := Dbs.TableCODE.FieldByName('FL').AsString ;
                    DEFXTEMP.FieldByName('FLCODE').AsString := Dbs.TableCODE.FieldByName('FLCODE').AsString ;
                    DEFXTEMP.Post ;
               end ;
          end ;
          DEZCTEMP.Next ;
     end ;
     //update defxtemp id and bh
     DEFXTEMP.First ;
     while (TRUE) do
     begin
          if (DEFXTEMP.EOF) then
             break ;
          DEFXTEMP.Edit ;
          DEFXTEMP.FieldByName('ID').AsInteger := ID ;
          DEFXTEMP.FieldByName('BH').AsString := BH ;
          DEFXTEMP.Post ;
          DEFXTEMP.Next ;
     end ;
     DEFXTEMP.Close ;
     //calculate count of hl
     QueryTEMP.Close ;
     QueryTEMP.SQL.Clear ;
     QueryTEMP.SQL.Add( 'SELECT DISTINCT ID,BH,CODE,SUM(HL) HL,LB,FL,FLCODE FROM DEFXTEMP GROUP BY ID,BH,CODE,LB,FL,FLCODE' ) ;
     QueryTEMP.Open ;
     DEFXTEMP.BatchMove (QueryTEMP, batCopy) ;
     //update Tabledefx
     Dbs.TableDEFX.BatchMove(DEFXTEMP, batAppendUpdate) ;
     //restore circle
     QueryTEMP.Close ;
     DEFXTEMP.Close ;
     DEFXTEMP.DeleteTable ;

     WaitDlg.Hide ;
end;

procedure TBCDEDlg.Edit9KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_RETURN) then
     begin
          GZDJ := Edit9.Text ;
          RGZ := 0.0 ;
          if (DBS.TableGZ.FindKey([GZDJ])) then
          begin
               RGZ := DBS.TableGZ.FieldByName('GZ').AsFloat ;
          end else
          begin
               Edit9.Text := '' ;
               GZDJ := '' ;
               RGZ := 0.0 ;
          end ;
          DEZCTEMP.Refresh ;
     end ;
end;

end.

