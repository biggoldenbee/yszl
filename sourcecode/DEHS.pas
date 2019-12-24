unit DEHS;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, DBTables, DB, Grids, DBGrids, Mask, DBCtrls,
  SysUtils, DECZ, ComCtrls ;

type
  TDEHSDlg = class(TForm)
    QueryTEMP: TQuery;
    QuitBitBtn: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    CheckBox1: TCheckBox;
    HSDETEMP: TTable;
    HSDETEMPID: TSmallintField;
    HSDETEMPBH: TStringField;
    HSDETEMPMC: TStringField;
    HSDETEMPDW: TStringField;
    HSDETEMPDJ: TFloatField;
    HSDETEMPRGF: TFloatField;
    HSDETEMPCLF: TFloatField;
    HSDETEMPJXF: TFloatField;
    HSDETEMPRGS: TFloatField;
    HSDETEMPGZDJ: TStringField;
    HSDETEMPBS: TStringField;
    HSDETEMPDEMC: TStringField;
    HSDETEMPCODEID: TSmallintField;
    HSDETEMPBH1: TStringField;
    HSDETEMPMC1: TStringField;
    HSDETEMPP1: TFloatField;
    HSDETEMPP2: TFloatField;
    HSDETEMPP3: TFloatField;
    HSDETEMPP4: TFloatField;
    HSDETEMPP5: TFloatField;
    DataSourceHSDE: TDataSource;
    DBGridHSDE: TDBGrid;
    HSDETEMPHL: TFloatField;
    DBGridDEZC: TDBGrid;
    DEZCTEMP: TTable;
    DEZCTEMPID: TSmallintField;
    DEZCTEMPBH: TStringField;
    DEZCTEMPCODE: TStringField;
    DEZCTEMPHL: TFloatField;
    DEZCTEMPLB: TStringField;
    DEZCTEMPMC: TStringField;
    DEZCTEMPDW: TStringField;
    DEZCTEMPDJ: TFloatField;
    DataSourceDEZC: TDataSource;
    DBGridDEFX: TDBGrid;
    DEFXTEMP: TTable;
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
    DataSourceDEFX: TDataSource;
    Bevel2: TBevel;
    BitBtnDEZC: TBitBtn;
    BitBtnDEFX: TBitBtn;
    BitBtn6: TBitBtn;
    TableTEMP: TTable;
    SmallintField1: TSmallintField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    SmallintField2: TSmallintField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    procedure WriteHSDETEMP(ID: smallint; HL: double) ;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuitBitBtnClick(Sender: TObject);
    procedure DEZCTEMPCalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DEFXTEMPCalcFields(DataSet: TDataSet);
    procedure HSDETEMPAfterScroll(DataSet: TDataSet);
    procedure BitBtnDEZCClick(Sender: TObject);
    procedure BitBtnDEFXClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGridHSDEDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    GZDJ : string[5] ;
    RGZ : double ;
    CODEID : smallint ;
    SQLCommand : string ;
    HS : string[20] ;
  end;

var
  DEHSDlg : TDEHSDlg;

implementation
uses MAIN, YSZLDBS, SCL, SDE, Wait, TDJ ;
{$R *.DFM}

procedure TDEHSDlg.WriteHSDETEMP(ID: smallint; HL: double) ;
begin
     if (ID=-1) then
     begin
          with Dbs do
          begin
               HSDETEMP.Edit ;
               HSDETEMP.FieldByName('MC').AsString      := TableUSER.FieldByName('NAME').AsString ;
               HSDETEMP.FieldByName('DW').AsString      := TableUSER.FieldByName('UNIT').AsString ;
               HSDETEMP.FieldByName('DJ').AsFloat       := TableUSER.FieldByName('PRICE').AsFloat ;
               HSDETEMP.FieldByName('RGF').AsFloat      := TableUSER.FieldByName('LABFEE').AsFloat ;
               HSDETEMP.FieldByName('CLF').AsFloat      := TableUSER.FieldByName('MTRLFEE').AsFloat ;
               HSDETEMP.FieldByName('JXF').AsFloat      := TableUSER.FieldByName('MCHNFEE').AsFloat ;
               HSDETEMP.FieldByName('RGS').AsFloat      := TableUSER.FieldByName('LPD').AsFloat ;
               HSDETEMP.FieldByName('BS').AsString      := TableUSER.FieldByName('BS').AsString ;
               HSDETEMP.FieldByName('ID').AsInteger     := -1 ;
               HSDETEMP.FieldByName('DEMC').AsString    := TableUSER.FieldByName('DEMC').AsString ;
               HSDETEMP.FieldByName('CODEID').AsInteger := TableUSER.FieldByName('CODEID').AsInteger ;
               HSDETEMP.Post ;
          end ;
          exit ;
     end ;
     if (ID=0) then
     begin
          if (SearchClRec.flag) then
          begin
               HSDETEMP.Edit ;
               HSDETEMP.FieldByName('BH').AsString      := SearchClRec.CODE ;
               HSDETEMP.FieldByName('MC').AsString      := SearchClRec.MC ;
               HSDETEMP.FieldByName('DW').AsString      := SearchClRec.DW ;
               HSDETEMP.FieldByName('DJ').AsFloat       := SearchClRec.DEJ ;
               case SearchClRec.BS of
               1 :
                   begin
                        HSDETEMP.FieldByName('RGF').AsFloat      := SearchClRec.DEJ ;
                        HSDETEMP.FieldByName('RGS').AsFloat      := 1.0 ;
                   end ;
               2 :
                   begin
                        HSDETEMP.FieldByName('CLF').AsFloat      := SearchClRec.DEJ ;
                   end ;
               3 :
                   begin
                        HSDETEMP.FieldByName('JXF').AsFloat      := SearchClRec.DEJ ;
                   end ;
               end ;
               HSDETEMP.FieldByName('GZDJ').AsString    := '' ;
               HSDETEMP.FieldByName('BS').AsString      := IntToStr(SearchClRec.BS) ;
               HSDETEMP.FieldByName('DEMC').AsString    := SearchClRec.LB1 ;
               HSDETEMP.FieldByName('CODEID').AsInteger := SearchClRec.ID ;
               HSDETEMP.FieldByName('HL').AsFloat       := HL ;
               HSDETEMP.Post ;
          end ;
          exit ;
     end ;
     if (ID>0) then
     begin
          if (SearchDeRec.flag) then
          begin
               HSDETEMP.Edit ;
               HSDETEMP.FieldByName('BH').AsString      := SearchDeRec.BH ;
               HSDETEMP.FieldByName('MC').AsString      := SearchDeRec.MC ;
               HSDETEMP.FieldByName('DW').AsString      := SearchDeRec.DW ;
               HSDETEMP.FieldByName('DJ').AsFloat       := SearchDeRec.DJ ;
               HSDETEMP.FieldByName('RGF').AsFloat      := SearchDeRec.RGF ;
               HSDETEMP.FieldByName('CLF').AsFloat      := SearchDeRec.CLF ;
               HSDETEMP.FieldByName('JXF').AsFloat      := SearchDeRec.JXF ;
               HSDETEMP.FieldByName('RGS').AsFloat      := SearchDeRec.RGS ;
               HSDETEMP.FieldByName('GZDJ').AsString    := SearchDeRec.GZDJ ;
               HSDETEMP.FieldByName('BS').AsString      := SearchDeRec.BS ;
               HSDETEMP.FieldByName('ID').AsInteger     := SearchDeRec.DEID ;
               HSDETEMP.FieldByName('DEMC').AsString    := SearchDeRec.DEMC ;
               HSDETEMP.FieldByName('CODEID').AsInteger := SearchDeRec.CODEID ;
               HSDETEMP.FieldByName('BH1').AsString     := SearchDeRec.BH1 ;
               HSDETEMP.FieldByName('MC1').AsString     := SearchDeRec.MC1 ;
               HSDETEMP.FieldByName('P1').AsFloat       := SearchDeRec.P1 ;
               HSDETEMP.FieldByName('P2').AsFloat       := SearchDeRec.P2 ;
               HSDETEMP.FieldByName('P3').AsFloat       := SearchDeRec.P3 ;
               HSDETEMP.FieldByName('P4').AsFloat       := SearchDeRec.P4 ;
               HSDETEMP.FieldByName('P5').AsFloat       := SearchDeRec.P5 ;
               HSDETEMP.FieldByName('HL').AsFloat       := HL ;
               HSDETEMP.Post ;
          end ;
     end ;
end ;

procedure TDEHSDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryTEMP.Close ;
     HSDETEMP.Close ;
     DEZCTEMP.Close ;
     DEFXTEMP.Close ;
     TableTEMP.Close ;
     try
        HSDETEMP.DeleteTable ;
     except
     end ;
     try
        DEZCTEMP.DeleteTable ;
     except
     end ;
     try
        DEFXTEMP.DeleteTable ;
     except
     end ;
     try
        TableTEMP.DeleteTable ;
     except
     end ;
end;

procedure TDEHSDlg.FormShow(Sender: TObject);
var
   i : integer ;
   BH : string[16] ;
   DEID : smallint ;
begin
     with Dbs do
     begin
          HS := TableUSER.FieldByName('BZ').AsString ;
          HSDETEMP.Close ;
          HSDETEMP.TableName := 'HSDETEMP.DB' ;
          HSDETEMP.CreateTable ;
          HSDETEMP.Open ;

          if (HS='') then
          begin
               Dbs.QueryHS.Close ;
               Dbs.QueryHS.RequestLive := TRUE ;
               Dbs.QueryHS.SQL.clear ;
               SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where ID="DEZM" AND WLP="FDE" AND ATTRIB="1"' ;
               Dbs.QueryHS.SQL.Add (SQLCommand) ;
               Dbs.QueryHS.open ;
               for i:=Dbs.QueryHS.RecordCount to 32767 do
               begin
                    HS := IntToStr (i) ;
                    QueryHS.Close ;
                    QueryHS.RequestLive := TRUE ;
                    QueryHS.SQL.clear ;
                    SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where BZ='+'"'+HS+'"' ;
                    QueryHS.SQL.Add (SQLCommand) ;
                    QueryHS.open ;
                    if (QueryHS.RecordCount=0) then
                       break ;
               end ;
               QueryHS.Close ;
          end ;

          QueryHS.Close ;
          QueryHS.RequestLive := TRUE ;
          QueryHS.SQL.clear ;
          SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where ID="DEZM" AND ATTRIB="0" AND BZ='+'"'+HS+'"' ;
          QueryHS.SQL.Add (SQLCommand) ;
          QueryHS.open ;
          if (QueryHS.RecordCount=0) then
          begin
               BH := TableUSER.FieldByName('CODE').AsString ;
               DEID := TableUSER.FieldByName('DEID').AsInteger ;
               //first record
               HSDETEMP.AppendRecord([-1, BH+'换']) ;
               WriteHSDETEMP(-1, 0.0) ;
               //other
               if (GetSearchDeRec(Dbs.TableDE, DEID, BH)) then
               begin
                    HSDETEMP.AppendRecord([DEID, BH]) ;
                    WriteHSDETEMP(DEID, 1.0) ;
               end ;
          end else
          begin
               BH := TableUSER.FieldByName('CODE').AsString ;
               DEID := TableUSER.FieldByName('DEID').AsInteger ;
               //first
               HSDETEMP.AppendRecord([-1, BH]) ;
               WriteHSDETEMP(-1, 0.0) ;
               //other
               QueryHS.First ;
               while (TRUE) do
               begin
                    if (QueryHS.EOF) then
                       break ;
                    BH := QueryHS.FieldByName('CODE').AsString ;
                    DEID := QueryHS.FieldByName('DEID').AsInteger ;
                    if (GetSearchDeRec(Dbs.TableDE, DEID, BH)) then
                    begin
                         HSDETEMP.AppendRecord([DEID, BH]) ;
                         WriteHSDETEMP(DEID, QueryHS.FieldByName('QUANTITY').AsFloat) ;
                    end else if (GetSearchClRec(Dbs.TableCODE, QueryHS.FieldByName('CODEID').AsInteger, BH)) then
                    begin
                         HSDETEMP.AppendRecord([0, BH]) ;
                         WriteHSDETEMP(0, QueryHS.FieldByName('QUANTITY').AsFloat) ;
                    end ;
                    QueryHS.Next ;
               end ;
          end ;
          QueryHS.Close ;
     end ;
     HSDETEMP.First ;
     Edit1.Text := HSDETEMP.FieldByName('BH').AsString ;
     Edit2.Text := HSDETEMP.FieldByName('MC').AsString ;
     Edit3.Text := HSDETEMP.FieldByName('DW').AsString ;
     Edit4.Text := format(formatstr, [HSDETEMP.FieldByName('DJ').AsFloat]) ;
     Edit5.Text := format(formatstr, [HSDETEMP.FieldByName('RGF').AsFloat]) ;
     Edit6.Text := format(formatstr, [HSDETEMP.FieldByName('CLF').AsFloat]) ;
     Edit7.Text := format(formatstr, [HSDETEMP.FieldByName('JXF').AsFloat]) ;
     Edit8.Text := format(formatstr, [HSDETEMP.FieldByName('RGS').AsFloat]) ;
     CheckBox1.Checked := TRUE ;
end;

procedure TDEHSDlg.HSDETEMPAfterScroll(DataSet: TDataSet);
var
   BH : string[16] ;
   DEID : smallint ;
begin
     DEZCTEMP.Close ;
     DEFXTEMP.Close ;
     BH := HSDETEMP.FieldByName('BH').AsString ;
     DEID := HSDETEMP.FieldByName('ID').AsInteger ;

     CODEID := HSDETEMP.FieldByName('CODEID').AsInteger ;
     GZDJ := HSDETEMP.FieldByName('GZDJ').AsString ;
     RGZ := 0.0 ;
     if (DBS.TableGZ.FindKey([GZDJ])) then
        RGZ := DBS.TableGZ.FieldByName('GZ').AsFloat ;

     if (DEID>0) then
     begin
          if (GetSearchDeRec(Dbs.TableDE, DEID, BH)) then
          begin
               QueryTEMP.Close ;
               QueryTEMP.SQL.Clear ;
               QueryTEMP.SQL.Add ( 'SELECT * FROM DEZC WHERE ID='+IntToStr(DEID)+' AND BH="'+BH+'"' ) ;
               DEZCTEMP.Close ;
               DEZCTEMP.TableName := 'DEZCTEMP.DB' ;
               DEZCTEMP.BatchMove ( QueryTEMP, batCopy ) ;
               DEZCTEMP.Open ;

               QueryTEMP.Close ;
               QueryTEMP.SQL.Clear ;
               QueryTEMP.SQL.Add ( 'SELECT * FROM DEFX WHERE ID='+IntToStr(DEID)+' AND BH="'+BH+'"' ) ;
               DEFXTEMP.Close ;
               DEFXTEMP.TableName := 'DEFXTEMP.DB' ;
               DEFXTEMP.BatchMove ( QueryTEMP, batCopy ) ;
               DEFXTEMP.Open ;
          end ;
     end ;
     DBGridDEZC.Visible := DEZCTEMP.Active ;
     DBGridDEFX.Visible := DEFXTEMP.Active ;
     BitBtnDEZC.Visible := DEZCTEMP.Active ;
     BitBtnDEFX.Visible := DEFXTEMP.Active ;
end;

procedure TDEHSDlg.QuitBitBtnClick(Sender: TObject);
begin
     Self.Close ;
end;

procedure TDEHSDlg.DEZCTEMPCalcFields(DataSet: TDataSet);
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

procedure TDEHSDlg.DEFXTEMPCalcFields(DataSet: TDataSet);
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

procedure TDEHSDlg.BitBtnDEZCClick(Sender: TObject);
var
   DEID : smallint ;
   CODE : string[16] ;
   LB : string[10] ;
   HL : double ;

   BookMark : TBookMark ;
   BookMark1: TBookMark ;
begin
     if (Application.MessageBox( '将要扣除您选择的分项,继续吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;

     BookMark := HSDETEMP.GetBookmark ;
     BookMark1:= DEZCTEMP.GetBookmark ;

     CODE := DEZCTEMP.FieldByName('CODE').AsString ;
     HL := -HSDETEMP.FieldByName('HL').AsFloat*DEZCTEMP.FieldByName('HL').AsFloat ;
     LB := DEZCTEMP.FieldByName('LB').AsString ;
     DEID := ReturnDEID (LB) ;

     if (GetSearchClRec(Dbs.TableCODE, CODEID, CODE)) then
     begin
          HSDETEMP.AppendRecord([0, CODE]) ;
          WriteHSDETEMP(0, HL) ;
          if (HSDETEMP.FieldByName('DEMC').AsString='人工') then
          begin
               HSDETEMP.Edit ;
               HSDETEMP.FieldByName('DJ').AsFloat := RGZ ;
               HSDETEMP.FieldByName('GZDJ').AsString := GZDJ ;
               HSDETEMP.Post ;
          end ;
     end else if (GetSearchDeRec(Dbs.TableDE, DEID, CODE)) then
     begin
          HSDETEMP.AppendRecord([DEID, CODE]) ;
          WriteHSDETEMP(DEID, HL) ;
     end ;

     HSDETEMP.GotoBookmark (BookMark) ;
     HSDETEMP.FreeBookmark (BookMark) ;

     DEZCTEMP.GotoBookmark (BookMark1) ;
     DEZCTEMP.FreeBookmark (BookMark1) ;

     DbGridDEZC.SetFocus ;
end;

procedure TDEHSDlg.BitBtnDEFXClick(Sender: TObject);
var
   CODE : string[16] ;
   HL : double ;

   BookMark : TBookMark ;
   BookMark1: TBookMark ;
begin
     if (Application.MessageBox( '将要扣除您选择的材料,继续吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;

     BookMark := HSDETEMP.GetBookmark ;
     BookMark1:= DEFXTEMP.GetBookmark ;

     CODE := DEFXTEMP.FieldByName('CODE').AsString ;
     HL := -HSDETEMP.FieldByName('HL').AsFloat*DEFXTEMP.FieldByName('HL').AsFloat ;

     GZDJ := HSDETEMP.FieldByName('GZDJ').AsString ;

     if (GetSearchClRec(Dbs.TableCODE, CODEID, CODE)) then
     begin
          HSDETEMP.AppendRecord([0, CODE]) ;
          WriteHSDETEMP(0, HL) ;
          if (HSDETEMP.FieldByName('DEMC').AsString='人工') then
          begin
               HSDETEMP.Edit ;
               HSDETEMP.FieldByName('DJ').AsFloat := RGZ ;
               HSDETEMP.FieldByName('GZDJ').AsString := GZDJ ;
               HSDETEMP.Post ;
          end ;
     end ;

     HSDETEMP.GotoBookmark (BookMark) ;
     HSDETEMP.FreeBookmark (BookMark) ;

     DEFXTEMP.GotoBookmark (BookMark1) ;
     DEFXTEMP.FreeBookmark (BookMark1) ;

     DbGridDEFX.SetFocus ;
end;

procedure TDEHSDlg.BitBtn1Click(Sender: TObject);
var
   BookMark : TBookMark ;
begin
     BookMark := HSDETEMP.GetBookmark ;
     SCLDlg.Tag := 0 ;
     SCLDlg.ShowModal ;
     HSDETEMP.GotoBookmark (BookMark) ;
     HSDETEMP.FreeBookmark (BookMark) ;
end;

procedure TDEHSDlg.BitBtn2Click(Sender: TObject);
var
   BookMark : TBookMark ;
begin
     BookMark := HSDETEMP.GetBookmark ;
     SDEDlg.Tag := 0 ;
     SDEDlg.ShowModal ;
     HSDETEMP.GotoBookmark (BookMark) ;
     HSDETEMP.FreeBookmark (BookMark) ;
end;

procedure TDEHSDlg.BitBtn3Click(Sender: TObject);
begin
     if (Application.MessageBox( '您真的删除当前子目吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;

     if (HSDETEMP.FieldByName('ID').AsInteger<>-1) then
        HSDETEMP.Delete ;
end;

procedure TDEHSDlg.BitBtn4Click(Sender: TObject);
var
   dj, rgf, clf, jxf, rgs : double ;
   BookMark : TBookMark ;
begin
     dj := 0.0 ;
     rgf := 0.0 ;
     clf := 0.0 ;
     jxf := 0.0 ;
     rgs := 0.0 ;

     BookMark := HSDETEMP.GetBookmark ;
     HSDETEMP.DisableControls ;
     HSDETEMP.AfterScroll := Nil ;
     HSDETEMP.First ;
     while (TRUE) do
     begin
          if (HSDETEMP.EOF) then
             break ;
          rgf := rgf+HSDETEMP.FieldByName('RGF').AsFloat*HSDETEMP.FieldByName('HL').AsFloat ;
          rgs := rgs+HSDETEMP.FieldByName('RGS').AsFloat*HSDETEMP.FieldByName('HL').AsFloat ;
          clf := clf+HSDETEMP.FieldByName('CLF').AsFloat*HSDETEMP.FieldByName('HL').AsFloat ;
          jxf := jxf+HSDETEMP.FieldByName('JXF').AsFloat*HSDETEMP.FieldByName('HL').AsFloat ;
          HSDETEMP.Next ;
     end ;
     dj := rgf+clf+jxf ;
     if (CheckBox1.Checked) then
     begin
          rgf := Round(rgf*100)/100 ;
          rgs := Round(rgs*10000)/10000 ;
          clf := Round(clf*100)/100 ;
          jxf := Round(jxf*100)/100 ;
          dj  := Round(dj*100)/100 ;
     end ;
     Edit4.Text := format(formatstr,[dj]) ;
     Edit5.Text := format(formatstr,[rgf]) ;
     Edit6.Text := format(formatstr,[clf]) ;
     Edit7.Text := format(formatstr,[jxf]) ;
     Edit8.Text := format(formatstr,[rgs]) ;

     HSDETEMP.First ;
     HSDETEMP.Edit ;
     HSDETEMP.FieldByName('DJ').AsFloat := dj ;
     HSDETEMP.FieldByName('RGF').AsFloat := rgf ;
     HSDETEMP.FieldByName('RGS').AsFloat := rgs ;
     HSDETEMP.FieldByName('CLF').AsFloat := clf ;
     HSDETEMP.FieldByName('JXF').AsFloat := jxf ;
     HSDETEMP.Post ;

     HSDETEMP.EnableControls ;
     HSDETEMP.GotoBookmark (BookMark) ;
     HSDETEMP.FreeBookmark (BookMark) ;
     HSDETEMP.AfterScroll := HSDETEMPAfterScroll ;
end;

procedure TDEHSDlg.BitBtn5Click(Sender: TObject);
var
   ID : string[10] ;
   NUM: shortint ;

   BookMark : TBookMark ;
   OldFilter : string ;
begin
     if (Application.MessageBox( '将要把换算结果保存到预算书,继续吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     if (HSDETEMP.RecordCount=0) then
        exit ;

     HSDETEMP.First ;
     HSDETEMP.Edit ;
     HSDETEMP.FieldByName('BH').AsString := Edit1.Text ;
     HSDETEMP.FieldByName('MC').AsString := Edit2.Text ;
     HSDETEMP.FieldByName('DW').AsString := Edit3.Text ;
     HSDETEMP.FieldByName('DJ').AsString := Edit4.Text ;
     HSDETEMP.FieldByName('RGF').AsString:= Edit5.Text ;
     HSDETEMP.FieldByName('CLF').AsString:= Edit6.Text ;
     HSDETEMP.FieldByName('JXF').AsString:= Edit7.Text ;
     HSDETEMP.FieldByName('RGS').AsString:= Edit8.Text ;
     HSDETEMP.Post ;
     HSDETEMP.AfterScroll := Nil ;

     if (hs<>'') then
     begin
          with Dbs do
          begin
               //update dehs result ;
               ID  := TableUSER.FieldByName('ID').AsString ;
               NUM := TableUSER.FieldByName('NUM').AsInteger ;
               BookMark := TableUSER.GetBookmark ;
               OldFilter := TableUSER.Filter ;
               TableUSER.DisableControls ;
               TableUSER.Filter :=  'ID='+''''+'DEZM'+'''' ;
               //erase old record
               QueryHS.Close ;
               QueryHS.RequestLive := TRUE ;
               QueryHS.SQL.clear ;
               SQLCommand := 'DELETE From "'+PrjHead.FileName+'" Where ATTRIB="0" AND BZ='+'"'+HS+'"' ;
               QueryHS.SQL.Add (SQLCommand) ;
               QueryHS.ExecSQL ;

               TableUSER.GotoBookmark(BookMark) ;
               HSDETEMP.First ;
               while (TRUE) do
               begin
                    if (HSDETEMP.EOF) then
                       break ;
                    if (HSDETEMP.FieldByName('ID').AsInteger>=0) then
                    begin
                         TableUSER.Next ;
                         TableUSER.InsertRecord ([FALSE, ID, NUM, '', 0, '', '1']) ;
                         TableUSER.Edit ;
                         if (HSDETEMP.FieldByName('ID').AsInteger=0) then
                            TableUSER.FieldByName('WLP').AsString    := 'FCL'
                         else
                             TableUSER.FieldByName('WLP').AsString    := 'FDE' ;
                         TableUSER.FieldByName('CODE').AsString   := HSDETEMP.FieldByName('BH').AsString ;
                         TableUSER.FieldByName('ATTRIB').AsString := '0' ;
                         TableUSER.FieldByName('NAME').AsString   := HSDETEMP.FieldByName('MC').AsString ;
                         TableUSER.FieldByName('UNIT').AsString   := HSDETEMP.FieldByName('DW').AsString ;
                         TableUSER.FieldByName('LABFEE').AsFloat  := HSDETEMP.FieldByName('RGF').AsFloat ;
                         TableUSER.FieldByName('MTRLFEE').AsFloat := HSDETEMP.FieldByName('CLF').AsFloat ;
                         TableUSER.FieldByName('MCHNFEE').AsFloat := HSDETEMP.FieldByName('JXF').AsFloat ;
                         TableUSER.FieldByName('PRICE').AsFloat   := HSDETEMP.FieldByName('DJ').AsFloat ;
                         TableUSER.FieldByName('LPD').AsFloat     := HSDETEMP.FieldByName('RGS').AsFloat ;
                         TableUSER.FieldByName('QUANTITY').AsFloat:= HSDETEMP.FieldByName('HL').AsFloat ;
                         TableUSER.FieldByName('BS').AsString     := HSDETEMP.FieldByName('BS').AsString ;
                         TableUSER.FieldByName('DEID').AsInteger  := HSDETEMP.FieldByName('ID').AsInteger ;
                         TableUSER.FieldByName('DEMC').AsString   := HSDETEMP.FieldByName('DEMC').AsString ;
                         TableUSER.FieldByName('CODEID').AsInteger:= HSDETEMP.FieldByName('CODEID').AsInteger ;
                         TableUSER.FieldByName('BZ').AsString     := HS ;
                         TableUSER.Post ;
                    end ;
                    HSDETEMP.Next ;
               end ;

               //restore circle
               TableUSER.Filter := OldFilter ;
               TableUSER.GotoBookmark ( BookMark ) ;
               TableUSER.FreeBookmark ( BookMark ) ;
               //update first record
               HSDETEMP.First ;
               TableUSER.Edit ;
               TableUSER.FieldByName('CODE').AsString   := HSDETEMP.FieldByName('BH').AsString ;
               TableUSER.FieldByName('NAME').AsString   := HSDETEMP.FieldByName('MC').AsString ;
               TableUSER.FieldByName('UNIT').AsString   := HSDETEMP.FieldByName('DW').AsString ;
               TableUSER.FieldByName('LABFEE').AsFloat  := HSDETEMP.FieldByName('RGF').AsFloat ;
               TableUSER.FieldByName('MTRLFEE').AsFloat := HSDETEMP.FieldByName('CLF').AsFloat ;
               TableUSER.FieldByName('MCHNFEE').AsFloat := HSDETEMP.FieldByName('JXF').AsFloat ;
               TableUSER.FieldByName('PRICE').AsFloat   := HSDETEMP.FieldByName('DJ').AsFloat ;
               TableUSER.FieldByName('LPD').AsFloat     := HSDETEMP.FieldByName('RGS').AsFloat ;
               TableUSER.FieldByName('BZ').AsString     := HS ;
               TableUSER.FieldByName('BS').AsString     := '换' ;
               TableUSER.Post ;

               TableUSER.EnableControls ;
          end ;
     end ;
     HSDETEMP.First ;
     HSDETEMP.AfterScroll := HSDETEMPAfterScroll ;
end;

procedure TDEHSDlg.BitBtn6Click(Sender: TObject);
var
   BookMark : TBookMark ;
   i : integer ;
begin
     WaitDlg.Show ;
     WaitDlg.Repaint ;

     BookMark := HSDETEMP.GetBookmark ;
     HSDETEMP.DisableControls ;
     HSDETEMP.AfterScroll := NIL ;

     TableTEMP.Close ;
     TableTEMP.TableName := 'TDJTEMP.DB' ;
     TableTEMP.CreateTable ;
     TableTEMP.Open ;

     HSDETEMP.First ;
     while (TRUE) do
     begin
          if (HSDETEMP.EOF) then
             break ;
          if (HSDETEMP.FieldByName('ID').AsInteger=0) then
          begin
               if (GetSearchClRec(Dbs.TableCODE, HSDETEMP.FieldByName('CODEID').AsInteger, HSDETEMP.FieldByName('BH').AsString)) then
               begin
                    if (Pos('*',SearchClRec.FL)<>0) then
                    begin
                         TableTEMP.Append ;
                         TableTEMP.Edit ;
                         for i:=0 to HSDETEMP.FieldCount-1 do TableTEMP.Fields[i].Value := HSDETEMP.Fields[i].Value ;
                         TableTEMP.Post ;
                    end ;
               end ;
          end else if (HSDETEMP.FieldByName('ID').AsInteger>0) then
          begin
               SQLCommand := 'SELECT * FROM DEFX ' ;
               SQLCommand := SQLCommand+'WHERE BH="'+HSDETEMP.FieldByName('BH').AsString+'" ' ;
               SQLCommand := SQLCommand+'AND ID='+IntToStr(HSDETEMP.FieldByName('ID').AsInteger)+' ' ;
               SQLCommand := SQLCommand+'AND FL LIKE "*%"' ;
               QueryTEMP.Close ;
               QueryTEMP.SQL.Clear ;
               QueryTEMP.SQL.Add (SQLCommand) ;
               QueryTEMP.Open ;
               QueryTEMP.First ;
               while (TRUE) do
               begin
                    if (QueryTEMP.EOF) then
                       break ;
                    if (GetSearchClRec(Dbs.TableCODE, HSDETEMP.FieldByName('CODEID').AsInteger, QueryTEMP.FieldByName('CODE').AsString)) then
                    begin
                         TableTEMP.Append ;
                         TableTEMP.Edit ;
                         TableTEMP.FieldByName('ID').AsInteger     := 0 ;
                         TableTEMP.FieldByName('BH').AsString      := SearchClRec.CODE ;
                         TableTEMP.FieldByName('MC').AsString      := SearchClRec.MC ;
                         TableTEMP.FieldByName('DW').AsString      := SearchClRec.DW ;
                         TableTEMP.FieldByName('DJ').AsFloat       := SearchClRec.DEJ ;
                         TableTEMP.FieldByName('BS').AsString      := IntToStr(SearchClRec.BS) ;
                         TableTEMP.FieldByName('DEMC').AsString    := SearchClRec.LB1 ;
                         TableTEMP.FieldByName('CODEID').AsInteger := SearchClRec.ID ;
                         TableTEMP.FieldByName('HL').AsFloat       := HSDETEMP.FieldByName('HL').AsFloat*QueryTEMP.FieldByName('HL').AsFloat ;
                         TableTEMP.Post ;
                    end ;
                    QueryTEMP.Next ;
               end ;
          end ;
          HSDETEMP.Next ;
     end ;

     QueryTEMP.Close ;
     HSDETEMP.GotoBookmark (BookMark) ;
     HSDETEMP.FreeBookMark (BookMark) ;
     HSDETEMP.AfterScroll := HSDETEMPAfterScroll ;
     HSDETEMP.EnableControls ;

     WaitDlg.Hide ;
     if (TableTEMP.RecordCount=0) then
     begin
          TableTEMP.Close ;
          Application.MessageBox( '该子目没有级配材料!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     TableTEMP.Close ;
     QueryTEMP.Close ;
     QueryTEMP.SQL.Clear ;
     SQLCommand := 'SELECT DISTINCT BH, CODEID, SUM(HL) HL FROM TDJTEMP GROUP BY BH, CODEID' ;
     QueryTEMP.SQL.Add (SQLCommand) ;
     QueryTEMP.Open ;
     QueryTEMP.First ;
     TableTEMP.CreateTable ;
     TableTEMP.Open ;
     while (TRUE) do
     begin
          if (QueryTEMP.EOF) then
             break ;
          if (GetSearchClRec(Dbs.TableCODE, CODEID, QueryTEMP.FieldByName('BH').AsString)) then
          begin
               if (QueryTEMP.FieldByName('HL').AsFloat<>0.0) then
               begin
                    TableTEMP.Append ;
                    TableTEMP.Edit ;
                    TableTEMP.FieldByName('ID').AsInteger     := 0 ;
                    TableTEMP.FieldByName('BH').AsString      := SearchClRec.CODE ;
                    TableTEMP.FieldByName('MC').AsString      := SearchClRec.MC ;
                    TableTEMP.FieldByName('DW').AsString      := SearchClRec.DW ;
                    TableTEMP.FieldByName('DJ').AsFloat       := SearchClRec.DEJ ;
                    TableTEMP.FieldByName('CLF').AsFloat      := SearchClRec.DEJ ;
                    TableTEMP.FieldByName('BS').AsString      := IntToStr(SearchClRec.BS) ;
                    TableTEMP.FieldByName('DEMC').AsString    := SearchClRec.LB1 ;
                    TableTEMP.FieldByName('CODEID').AsInteger := SearchClRec.ID ;
                    TableTEMP.FieldByName('HL').AsFloat       := QueryTEMP.FieldByName('HL').AsFloat ;
                    TableTEMP.Post ;
               end ;
          end ;
          QueryTEMP.Next ;
     end ;
     QueryTEMP.Close ;
     TableTEMP.Close ;
     TDJDlg.ShowModal ;
end;

procedure TDEHSDlg.DBGridHSDEDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     TDbGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State) ;
     if (Column.FieldName='BH') then
     begin
          if (HSDETEMP.FieldByName('HL').AsFloat<0.0) then
          begin
               DBGridHSDE.Canvas.Pen.Color := clRed ;
               DBGridHSDE.Canvas.MoveTo(Rect.Left, (Rect.Top+Rect.Bottom) DIV 2) ;
               DBGridHSDE.Canvas.LineTo(Rect.Right, (Rect.Top+Rect.Bottom) DIV 2) ;
          end ;
     end ;
end;


end.


