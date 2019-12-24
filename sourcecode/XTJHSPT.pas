unit XTJHSPT;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, DBTables, Db, Grids, DBGrids, DECZ;

type
  TXJTHSPTDlg = class(TForm)
    DBGridSPT: TDBGrid;
    SPTTEMP: TTable;
    SPTTEMPID: TSmallintField;
    SPTTEMPBH: TStringField;
    SPTTEMPMC: TStringField;
    SPTTEMPDW: TStringField;
    SPTTEMPDJ: TFloatField;
    SPTTEMPRGF: TFloatField;
    SPTTEMPCLF: TFloatField;
    SPTTEMPJXF: TFloatField;
    SPTTEMPRGS: TFloatField;
    SPTTEMPGZDJ: TStringField;
    SPTTEMPBS: TStringField;
    SPTTEMPDEMC: TStringField;
    SPTTEMPCODEID: TSmallintField;
    SPTTEMPBH1: TStringField;
    SPTTEMPMC1: TStringField;
    SPTTEMPP1: TFloatField;
    SPTTEMPP2: TFloatField;
    SPTTEMPP3: TFloatField;
    SPTTEMPP4: TFloatField;
    SPTTEMPP5: TFloatField;
    SPTTEMPHL: TFloatField;
    DataSourceSPT: TDataSource;
    QueryTEMP: TQuery;
    Bevel2: TBevel;
    BitBtn2: TBitBtn;
    USERTEMP: TTable;
    USERTEMPFLAG: TBooleanField;
    USERTEMPID: TStringField;
    USERTEMPNUM: TSmallintField;
    USERTEMPWLP: TStringField;
    USERTEMPXH: TSmallintField;
    USERTEMPCODE: TStringField;
    USERTEMPATTRIB: TStringField;
    USERTEMPNAME: TStringField;
    USERTEMPUNIT: TStringField;
    USERTEMPGS: TStringField;
    USERTEMPQUANTITY: TFloatField;
    USERTEMPPRICE: TFloatField;
    USERTEMPLABFEE: TFloatField;
    USERTEMPLPD: TFloatField;
    USERTEMPMTRLFEE: TFloatField;
    USERTEMPMCHNFEE: TFloatField;
    USERTEMPCOUNT: TFloatField;
    USERTEMPLABCOUNT: TFloatField;
    USERTEMPLPDCOUNT: TFloatField;
    USERTEMPMTRCOUNT: TFloatField;
    USERTEMPMCHCOUNT: TFloatField;
    USERTEMPZCC: TFloatField;
    USERTEMPLABBC: TFloatField;
    USERTEMPLPDBC: TFloatField;
    USERTEMPMTRBC: TFloatField;
    USERTEMPMCHBC: TFloatField;
    USERTEMPP1: TFloatField;
    USERTEMPP2: TFloatField;
    USERTEMPP3: TFloatField;
    USERTEMPP4: TFloatField;
    USERTEMPP5: TFloatField;
    USERTEMPSPRICE: TFloatField;
    USERTEMPSLABFEE: TFloatField;
    USERTEMPSLPD: TFloatField;
    USERTEMPSMTRLFEE: TFloatField;
    USERTEMPSMCHNFEE: TFloatField;
    USERTEMPSCOUNT: TFloatField;
    USERTEMPSLABCOUNT: TFloatField;
    USERTEMPSLPDCOUNT: TFloatField;
    USERTEMPSMTRCOUNT: TFloatField;
    USERTEMPSMCHCOUNT: TFloatField;
    USERTEMPSZCC: TFloatField;
    USERTEMPSLABBC: TFloatField;
    USERTEMPSLPDBC: TFloatField;
    USERTEMPSMTRBC: TFloatField;
    USERTEMPSMCHBC: TFloatField;
    USERTEMPSP1: TFloatField;
    USERTEMPSP2: TFloatField;
    USERTEMPSP3: TFloatField;
    USERTEMPSP4: TFloatField;
    USERTEMPSP5: TFloatField;
    USERTEMPBZ: TStringField;
    USERTEMPBS: TStringField;
    USERTEMPDEID: TSmallintField;
    USERTEMPDEMC: TStringField;
    USERTEMPCODEID: TSmallintField;
    BitBtn1: TBitBtn;
    procedure GetOneDe ;
    procedure GetOnePartDe ;
    procedure GetAllDe ;
    procedure ScanDe ;

    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGridSPTDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SQLcommand : string ;
  end;

var
  XJTHSPTDlg: TXJTHSPTDlg;

implementation

uses MAIN, DEHS, YSZLDBS, Wait;

{$R *.DFM}

procedure TXJTHSPTDlg.GetOneDe ;
var
   HS : string[20] ;
   i : integer ;
   HL : double ;
begin
     USERTEMP.Close ;
     USERTEMP.TableName := 'USERTEMP.DB' ;
     USERTEMP.CreateTable ;

     with Dbs do
     begin
          if (TableUSER.FieldByName('WLP').AsString<>'FDE') then
             exit ;
          HS := TableUSER.FieldByName('BZ').AsString ;
          if (HS<>'') then
          begin
               SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where ID="DEZM" AND BZ='+'"'+HS+'"' ;
               QueryHS.Close ;
               QueryHS.SQL.Clear ;
               QueryHS.SQL.Add (SQLCommand) ;
               USERTEMP.BatchMove (QueryHS, batAppend) ;
               QueryHS.Close ;
          end else
          begin
               USERTEMP.Open ;
               USERTEMP.Append ;
               USERTEMP.Edit ;
               for i:=0 to TableUSER.FieldCount-1 do
                   USERTEMP.Fields[i].Value := TableUSER.Fields[i].Value ;
               USERTEMP.FieldByName('QUANTITY').AsFloat := 1.0 ;
               USERTEMP.Post ;
               USERTEMP.Close ;
          end ;

          HL := TableUSER.FieldByName('QUANTITY').AsFloat ;
          if (USERTEMP.Active=FALSE) then
             USERTEMP.Open ;
          while (TRUE) do
          begin
               if (USERTEMP.EOF) then
                  break ;

               if (USERTEMP.FieldByName('WLP').AsString='FCL') then
               begin
                    if (GetSearchClRec(Dbs.TableCODE, USERTEMP.FieldByName('CODEID').AsInteger, USERTEMP.FieldByName('CODE').AsString)) then
                    begin
                         if (Pos('*',SearchClRec.FL)<>0) then
                         begin
                              SPTTEMP.Append ;
                              SPTTEMP.Edit ;
                              SPTTEMP.FieldByName('BH').AsString      := SearchClRec.CODE ;
                              SPTTEMP.FieldByName('MC').AsString      := SearchClRec.MC ;
                              SPTTEMP.FieldByName('DW').AsString      := SearchClRec.DW ;
                              SPTTEMP.FieldByName('DJ').AsFloat       := SearchClRec.DEJ ;
                              SPTTEMP.FieldByName('CLF').AsFloat      := SearchClRec.DEJ ;
                              SPTTEMP.FieldByName('BS').AsString      := IntToStr(SearchClRec.BS) ;
                              SPTTEMP.FieldByName('DEMC').AsString    := SearchClRec.LB1 ;
                              SPTTEMP.FieldByName('CODEID').AsInteger := SearchClRec.ID ;
                              SPTTEMP.FieldByName('HL').AsFloat       := HL*USERTEMP.FieldByName('QUANTITY').AsFloat ;
                              SPTTEMP.Post ;
                         end ;
                    end ;
               end else if (USERTEMP.FieldByName('BS').AsString<>'ªª') then
               begin
                    SQLCommand := 'SELECT * FROM DEFX ' ;
                    SQLCommand := SQLCommand+'WHERE BH="'+USERTEMP.FieldByName('CODE').AsString+'" ' ;
                    SQLCommand := SQLCommand+'AND ID='+IntToStr(USERTEMP.FieldByName('DEID').AsInteger)+' ' ;
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
                         if (GetSearchClRec(Dbs.TableCODE, USERTEMP.FieldByName('CODEID').AsInteger, QueryTEMP.FieldByName('CODE').AsString)) then
                         begin
                              SPTTEMP.Append ;
                              SPTTEMP.Edit ;
                              SPTTEMP.FieldByName('BH').AsString      := SearchClRec.CODE ;
                              SPTTEMP.FieldByName('MC').AsString      := SearchClRec.MC ;
                              SPTTEMP.FieldByName('DW').AsString      := SearchClRec.DW ;
                              SPTTEMP.FieldByName('DJ').AsFloat       := SearchClRec.DEJ ;
                              SPTTEMP.FieldByName('CLF').AsFloat      := SearchClRec.DEJ ;
                              SPTTEMP.FieldByName('BS').AsString      := IntToStr(SearchClRec.BS) ;
                              SPTTEMP.FieldByName('DEMC').AsString    := SearchClRec.LB1 ;
                              SPTTEMP.FieldByName('CODEID').AsInteger := SearchClRec.ID ;
                              SPTTEMP.FieldByName('HL').AsFloat       := HL*QueryTEMP.FieldByName('HL').AsFloat*USERTEMP.FieldByName('QUANTITY').AsFloat ;
                              SPTTEMP.Post ;
                         end ;
                         QueryTEMP.Next ;
                    end ;
               end ;
               USERTEMP.Next ;
          end ;
     end ;
     USERTEMP.Close ;
     USERTEMP.DeleteTable ;
end ;

procedure TXJTHSPTDlg.GetOnePartDe ;
begin
     while (TRUE) do
     begin
          if (Dbs.TableUSER.BOF) then
             break ;
          if (Dbs.TableUSER.FieldByName('WLP').AsString='T') then
             break ;
          Dbs.TableUSER.Prior ;
     end ;
     while (TRUE) do
     begin
          if (Dbs.TableUSER.EOF) then
             break ;
          if (Dbs.TableUSER.FieldByName('WLP').AsString='B') then
             break ;
          GetOneDe ;
          Dbs.TableUSER.Next ;
     end ;
end ;

procedure TXJTHSPTDlg.GetAllDe ;
begin
     Dbs.TableUSER.First ;
     while (TRUE) do
     begin
          if (Dbs.TableUSER.EOF) then
             break ;
          GetOneDe ;
          Dbs.TableUSER.Next ;
     end ;
end ;

procedure TXJTHSPTDlg.ScanDe ;
begin
     SPTTEMP.Close ;
     QueryTEMP.Close ;
     QueryTEMP.SQL.Clear ;
     SQLCommand := 'SELECT DISTINCT BH, CODEID, SUM(HL) HL FROM SPTTEMP GROUP BY BH, CODEID' ;
     QueryTEMP.SQL.Add (SQLCommand) ;
     QueryTEMP.Open ;
     QueryTEMP.First ;
     SPTTEMP.CreateTable ;
     SPTTEMP.Open ;
     while (TRUE) do
     begin
          if (QueryTEMP.EOF) then
             break ;
          if (GetSearchClRec(Dbs.TableCODE, QueryTEMP.FieldByName('CODEID').AsInteger, QueryTEMP.FieldByName('BH').AsString)) then
          begin
               if (QueryTEMP.FieldByName('HL').AsFloat<>0.0) then
               begin
                    SPTTEMP.Append ;
                    SPTTEMP.Edit ;
                    SPTTEMP.FieldByName('ID').AsInteger     := SearchClRec.ID ;
                    SPTTEMP.FieldByName('BH').AsString      := SearchClRec.CODE ;
                    SPTTEMP.FieldByName('MC').AsString      := SearchClRec.MC ;
                    SPTTEMP.FieldByName('DW').AsString      := SearchClRec.DW ;
                    SPTTEMP.FieldByName('DJ').AsFloat       := SearchClRec.DEJ ;
                    SPTTEMP.FieldByName('CLF').AsFloat      := SearchClRec.DEJ ;
                    SPTTEMP.FieldByName('BS').AsString      := IntToStr(SearchClRec.BS) ;
                    SPTTEMP.FieldByName('DEMC').AsString    := SearchClRec.LB1 ;
                    SPTTEMP.FieldByName('CODEID').AsInteger := SearchClRec.ID ;
                    SPTTEMP.FieldByName('HL').AsFloat       := QueryTEMP.FieldByName('HL').AsFloat ;
                    SPTTEMP.Post ;
               end ;
          end ;
          QueryTEMP.Next ;
     end ;
     QueryTEMP.Close ;
end ;

procedure TXJTHSPTDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     SPTTEMP.Close ;
     USERTEMP.Close ;
     SPTTEMP.DeleteTable ;
end;

procedure TXJTHSPTDlg.FormShow(Sender: TObject);
begin

     WaitDlg.Show ;
     WaitDlg.RePaint ;

     SPTTEMP.Close ;
     SPTTEMP.TableName := 'SPTTEMP.DB' ;
     SPTTEMP.CreateTable ;
     SPTTEMP.Open ;

     case Self.Tag of
     0 : GetOneDe ;
     1 : GetOnePartDe ;
     2 : GetAllDe ;
     end ;

     ScanDe ;

     WaitDlg.Hide ;

end;

procedure TXJTHSPTDlg.BitBtn1Click(Sender: TObject);
var
   ID : string[10] ;
   NUM: shortint ;
begin
     SPTTEMP.First ;
     with Dbs do
     begin
          case Self.Tag of
          0 : TableUSER.Next ;
          1 : ;
          2 : TableUSER.Last ;
          end ;
          while (TRUE) do
          begin
               if (SPTTEMP.EOF) then
                  break ;
               if (TableSPT.FindKey([ SPTTEMP.FieldByName('BH1').AsString,
                                      SPTTEMP.FieldByName('ID').AsInteger,
                                      SPTTEMP.FieldByName('BH').AsString ])) then
               begin
                    if (GetSearchDeRec(TableDE,TableSPT.FieldByName('DEID').AsInteger,TableSPT.FieldByName('BH').AsString)) then
                    begin
                         //have a right deitem and insert a record in tableuser
                         ID  := TableUSER.FieldByName('ID').AsString ;
                         NUM := TableUSER.FieldByName('NUM').AsInteger ;
                         TableUSER.InsertRecord ([FALSE, ID, NUM, '', 0, '', '1']) ;
                         TableUSER.Edit ;
                         TableUSER.FieldByName('WLP').AsString    := 'FDE' ;
                         TableUSER.FieldByName('CODE').AsString   := SearchDeRec.BH ;
                         TableUSER.FieldByName('ATTRIB').AsString := '1' ;
                         TableUSER.FieldByName('NAME').AsString   := SearchDeRec.MC ;
                         TableUSER.FieldByName('UNIT').AsString   := SearchDeRec.DW ;
                         TableUSER.FieldByName('LABFEE').AsFloat  := SearchDeRec.RGF ;
                         TableUSER.FieldByName('MTRLFEE').AsFloat := SearchDeRec.CLF ;
                         TableUSER.FieldByName('MCHNFEE').AsFloat := SearchDeRec.JXF ;
                         TableUSER.FieldByName('PRICE').AsFloat   := SearchDeRec.DJ ;
                         TableUSER.FieldByName('LPD').AsFloat     := SearchDeRec.RGS ;
                         TableUSER.FieldByName('BS').AsString     := SearchDeRec.BS ;
                         TableUSER.FieldByName('DEID').AsInteger  := SearchDeRec.DEID ;
                         TableUSER.FieldByName('DEMC').AsString   := SearchDeRec.DEMC ;
                         TableUSER.FieldByName('CODEID').AsInteger:= SearchDeRec.CODEID ;
                         TableUSER.FieldByName('QUANTITY').AsFloat:= SPTTEMP.FieldByName('HL').AsFloat ;
                         TableUSER.Post ;
                         TableUSER.Next ;
                    end ;
               end ;
               SPTTEMP.Next ;
          end ;
     end ;
end;

procedure TXJTHSPTDlg.BitBtn2Click(Sender: TObject);
begin
     Self.Close ;
end;


procedure TXJTHSPTDlg.DBGridSPTDblClick(Sender: TObject);
begin
     SPTTEMP.Edit ;
     if(SPTTEMP.FieldByName('BH1').AsString='') then
     begin
          SPTTEMP.FieldByName('BH1').AsString := '±√ÀÕ';
     end else if(SPTTEMP.FieldByName('BH1').AsString='±√ÀÕ') then
     begin
          SPTTEMP.FieldByName('BH1').AsString := '∑«±√ÀÕ';
     end else if(SPTTEMP.FieldByName('BH1').AsString='∑«±√ÀÕ') then
     begin
          SPTTEMP.FieldByName('BH1').AsString := '';
     end ;
     SPTTEMP.Post ;
end;

end.
