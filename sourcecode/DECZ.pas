unit DECZ;

interface

uses  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
      DB, DBTables, DBGrids, Menus;

const MaxArgNum = 50 ;

type TSearchClRec = record
    flag : boolean ;
    ID : smallint ;
    CODE : string[16] ;
    MC : string[100] ;
    DW : string[16] ;
    DEJ : double ;
    BS : smallint ;
    LB1 : string[10] ;
    LB2 : string[10] ;
    LB3 : string[10] ;
    FL : string[10] ;
    FLCODE : string[10] ;
    ISMAIN : boolean ;
end ;

type
    TSearchDeRec = record
    flag : boolean ;
    BH : string[16] ;
    MC : string[150] ;
    DW : string[16] ;
    DJ : double ;
    RGF : double ;
    CLF : double ;
    JXF : double ;
    RGS  : double ;
    GZDJ : string[5] ;
    BS : string[10] ;
    DEID : smallint ;
    DEMC : string[10] ;
    CODEID : smallint ;
    BH1 : string[16] ;
    MC1 : string[150] ;
    P1 : double ;
    P2 : double ;
    P3 : double ;
    P4 : double ;
    P5 : double ;
end ;

type
    TDesrRec = record
    OpenFlag : boolean ;
    ID : smallint ;
    ITEMNAME : string[40] ;
    InputS : string ;
    OutputS : string ;
end ;

type TPrjHead = record
     OpenFlag : boolean ;
     FileName : string ;
     GclbId : smallint ;
     Gclb : string ;
     FieldShowFlag : array[0..8, 0..55] of boolean ;

     GCMC : string ;
     JSDW : string ;
     BZDW : string ;
     GCZJ : double ;
     GCMJ : double ;
     //there is other
end ;

type TPrjZJ = record
     flag : boolean ;
     PN : array[1..MaxArgNum] of double ;
     LN : array[1..MaxArgNum] of double ;
     PNAME : array[1..MaxArgNum] of string[100] ;
     DEZJF, DERGF, DERGS, DECLF, DEJXF, DEWJJ, RGFBC, JXFBC, CLFBC, XXZJF, XXRGF, XXCLF, XXJXF : double ;
end ;

function ReturnDEID(DEMC:string) : smallint ;
function ReturnDEMC(DEID:smallint) : string ;

procedure ClearSearchClRec ;
function GetSearchClRec(TableCODE:TTable; CODEID:smallint; CODE:string) : boolean ;
procedure ClearSearchDeRec ;
function GetSearchDeRec(TableDE:TTable; DEID:smallint; BH:string) : boolean ;
procedure ClearPrjHead ;
procedure GetPrjHead(TableUSER : TTable) ;
procedure ClearDesr ;
procedure GetDesr(SdesrItem : TMenuItem) ;

procedure ShowTable(FName:string;FFilter:string;TableSelect:TTable;DbGridSelect:TDbGrid);
procedure NotShowTable(TableSelect:TTable;DbGridSelect:TDbGrid) ;
procedure ShowTableUser(FName:string;FFilter:string;TableSelect:TTable;DbGridSelect:TDbGrid) ;
procedure NotShowTableUser(TableSelect:TTable;DbGridSelect:TDbGrid) ;

procedure InsertOneDEItem(TableUSER:TTable) ;
procedure InsertOneCLItem(TableUSER:TTable) ;
procedure InsertWJJCL(TableUSER:TTable) ;
procedure InsertMMCL(TableUSER:TTable) ;
procedure InsertJGCL ;

procedure AutoHDTZ ;

procedure RefreshRCJ ;
procedure ZRJXTB ;


procedure ReFreshTabSheet1 ;
procedure ReFreshTabSheet2 ;
procedure ReFreshTabSheet3 ;
procedure ReFreshTabSheet4 ;
procedure ReFreshTabSheet5 ;
procedure ReFreshTabSheet6 ;
procedure ReFreshTabSheet7 ;
procedure ReFreshTabSheet8 ;
procedure ReFreshTabSheet9 ;

procedure ClearPrjZJ ;
procedure GetPrjZJ ;
procedure WritePrjZJ ;

procedure CalcTJZJ ;
procedure CalcZSZJ ;
procedure CalcFXZJ ;
procedure CalcAZZJ ;
procedure CalcSZZJ ;
procedure CalcYLZJ ;

procedure StartCalc ;
procedure CalcPrjZJ ;

var
   SearchClRec : TSearchClRec ;
   SearchDeRec : TSearchDeRec ;
   DesrRec : TDesrRec ;
   PrjHead : TPrjHead ;
   PrjZJ : TPrjZJ ;
const
     formatstr='%0.4f' ;
implementation

uses main, manprj, YSZLDBS, HDTZ, ingcl, wjj, smmxx, mmcl, SWJJCL, FORTRAN;

function ReturnDEID(DEMC:string) : smallint ;
begin
     result := 0 ;
     with Dbs do
     begin
          TableINSTALL.First ;
          while (TRUE) do
          begin
               if (TableINSTALL.EOF) then
                  break ;
               if (DEMC=TableINSTALL.FieldByName('DEMC').AsString) then
               begin
                    result := TableINSTALL.FieldByName('ID').AsInteger ;
                    exit ;
               end ;
               TableINSTALL.Next ;
          end ;
     end ;
end ;

function ReturnDEMC(DEID:smallint) : string ;
begin
     result := '' ;
     if (Dbs.TableINSTALL.FindKey([DEID])) then
     begin
          result := Dbs.TableINSTALL.FieldByName('DEMC').AsString ;
     end ;
end ;

procedure ClearSearchClRec ;
begin
     with SearchClRec do
     begin
          flag   := FALSE ;
          ID     := 0 ;
          CODE   := '' ;
          MC     := '' ;
          DW     := '' ;
          DEJ    := 0.0 ;
          BS     := 0 ;
          LB1    := '' ;
          LB2    := '' ;
          LB3    := '' ;
          FL     := '' ;
          FLCODE := '' ;
          ISMAIN := FALSE ;
     end ;
end ;

function GetSearchClRec(TableCODE:TTable; CODEID:smallint; CODE:string) : boolean ;
begin
     result := FALSE ;
     ClearSearchClRec ;
     if ( not TableCODE.FindKey([CODEID,CODE]) ) then  exit ;
     TableCODE.GotoKey ;
     with SearchClRec do
     begin
          flag   := TRUE ;
          ID     := TableCODE.FieldByName('ID').AsInteger ;
          CODE   := TableCODE.FieldByName('CODE').AsString ;
          MC     := TableCODE.FieldByName('MC').AsString ;
          DW     := TableCODE.FieldByName('DW').AsString ;
          DEJ    := TableCODE.FieldByName('DEJ').AsFloat ;
          BS     := TableCODE.FieldByName('BS').AsInteger ;
          LB1    := TableCODE.FieldByName('LB1').AsString ;
          LB2    := TableCODE.FieldByName('LB2').AsString ;
          LB3    := TableCODE.FieldByName('LB3').AsString ;
          FL     := TableCODE.FieldByName('FL').AsString ;
          FLCODE := TableCODE.FieldByName('FLCODE').AsString ;
          ISMAIN := TableCODE.FieldByName('ISMAIN').AsBoolean ;
     end ;
     result := TRUE ;
end ;

procedure ClearSearchDeRec ;
begin
     with SearchDeRec do
     begin
          flag   := FALSE ;
          BH     := '' ;
          MC     := '' ;
          DW     := '' ;
          DJ     := 0.0 ;
          RGF    := 0.0 ;
          CLF    := 0.0 ;
          JXF    := 0.0 ;
          RGS    := 0.0 ;
          GZDJ   := '' ;
          BS     := '' ;
          DEID   := 0 ;
          DEMC   := '' ;
          CODEID := 0 ;
          BH1    := '' ;
          MC1    := '' ;
          P1     := 0.0 ;
          P2     := 0.0 ;
          P3     := 0.0 ;
          P4     := 0.0 ;
          P5     := 0.0 ;
     end ;
end ;

function GetSearchDeRec(TableDE:TTable; DEID:smallint; BH:string) : boolean ;
begin
     result := FALSE ;
     ClearSearchDeRec ;
     if ( not TableDE.FindKey([DEID,BH]) ) then  exit ;
     TableDE.GotoKey ;
     with SearchDeRec do
     begin
          flag   := TRUE ;
          BH     := TableDE.FieldByName('BH').AsString ;
          MC     := TableDE.FieldByName('MC').AsString ;
          DW     := TableDE.FieldByName('DW').AsString ;
          DJ     := TableDE.FieldByName('DJ').AsFloat ;
          RGF    := TableDE.FieldByName('RGF').AsFloat ;
          CLF    := TableDE.FieldByName('CLF').AsFloat ;
          JXF    := TableDE.FieldByName('JXF').AsFloat ;
          RGS    := TableDE.FieldByName('RGS').AsFloat ;
          GZDJ   := TableDE.FieldByName('GZDJ').AsString ;
          BS     := TableDE.FieldByName('BS').AsString ;
          DEID   := TableDE.FieldByName('ID').AsInteger ;
          DEMC   := TableDE.FieldByName('DEMC').AsString ;
          CODEID := TableDE.FieldByName('CODEID').AsInteger ;
          BH1    := TableDE.FieldByName('BH1').AsString ;
          MC1    := TableDE.FieldByName('MC1').AsString ;
          P1     := TableDE.FieldByName('P1').AsFloat ;
          P2     := TableDE.FieldByName('P2').AsFloat ;
          P3     := TableDE.FieldByName('P3').AsFloat ;
          P4     := TableDE.FieldByName('P4').AsFloat ;
          P5     := TableDE.FieldByName('P5').AsFloat ;
     end ;
     result := TRUE ;
end ;

procedure ClearPrjHead ;
var
   i,j : integer ;
begin
     PrjHead.OpenFlag := FALSE ;
     PrjHead.FileName := '' ;
     PrjHead.GclbId := 0 ;
     PrjHead.Gclb := '' ;
     for i:=0 to 8 do
         for j:=0 to 55 do
             PrjHead.FieldShowFlag[i,j] := FALSE ;
     PrjHead.GCMC := '' ;
     PrjHead.JSDW := '' ;
     PrjHead.BZDW := '' ;
     PrjHead.GCZJ := 0.0 ;
     PrjHead.GCMJ := 0.0 ;
end ;

procedure GetPrjHead(TableUSER : TTable) ;
var
   i : integer ;
   oldFOpenFlag : boolean ;
   oldFName : string ;
   oldFFiltered : boolean ;
   oldFFilter : string ;
begin
     ClearPrjHead ;
     PrjHead.FileName := ManPrjDlg.DWGCFNAME ;
     //backup old value
     oldFOpenFlag := TableUSER.Active ;
     oldFName     := TableUSER.TableName ;
     oldFFiltered := TableUSER.Filtered ;
     oldFFilter   := TableUSER.Filter ;
     //Get project head information
     TableUSER.Close ;
     TableUSER.TableName := PrjHead.FileName ;
     TableUSER.Filter := 'ID='+''''+'HEAD'+'''' ;
     TableUSER.Filtered := TRUE ;
     TableUSER.Open ;
     if (TableUSER.RecordCount<>0) then
     begin
          TableUSER.First ;
          PrjHead.GclbId := TableUSER.FieldByName('CODE').AsInteger ;
          PrjHead.GcLb := TableUSER.FieldByName('NAME').AsString ;
          PrjHead.OpenFlag := TRUE ;
     end ;
     //Get FieldShowFlag
     for i:=0 to 55 do PrjHead.FieldShowFlag[0,i] := FALSE ;
     PrjHead.FieldShowFlag[0,0] := TRUE ;
     PrjHead.FieldShowFlag[0,4] := TRUE ;
     PrjHead.FieldShowFlag[0,5] := TRUE ;
     PrjHead.FieldShowFlag[0,7] := TRUE ;
     PrjHead.FieldShowFlag[0,8] := TRUE ;
     PrjHead.FieldShowFlag[0,9] := TRUE ;
     for i:=10 to 50 do
     begin
          if (TableUSER.Fields[i].AsFloat<>0.0) then
             PrjHead.FieldShowFlag[0,i] := TRUE ;
     end ;
     PrjHead.FieldShowFlag[0,51]:= TRUE ;
     PrjHead.FieldShowFlag[0,52]:= TRUE ;
     PrjHead.FieldShowFlag[0,53]:= TRUE ;
     PrjHead.FieldShowFlag[0,54]:= TRUE ;
     PrjHead.FieldShowFlag[0,55]:= TRUE ;

     PrjHead.FieldShowFlag[1,4] := TRUE ;
     PrjHead.FieldShowFlag[1,7] := TRUE ;
     PrjHead.FieldShowFlag[1,11]:= TRUE ;

     PrjHead.FieldShowFlag[2,4] := TRUE ;
     PrjHead.FieldShowFlag[2,5] := TRUE ;
     PrjHead.FieldShowFlag[2,7] := TRUE ;
     PrjHead.FieldShowFlag[2,8] := TRUE ;
     PrjHead.FieldShowFlag[2,10]:= TRUE ;
     PrjHead.FieldShowFlag[2,11]:= TRUE ;
     PrjHead.FieldShowFlag[2,12]:= TRUE ;
     PrjHead.FieldShowFlag[2,16]:= TRUE ;
     PrjHead.FieldShowFlag[2,17]:= TRUE ;
     PrjHead.FieldShowFlag[2,31]:= TRUE ;
     PrjHead.FieldShowFlag[2,36]:= TRUE ;

     PrjHead.FieldShowFlag[3,4] := TRUE ;
     PrjHead.FieldShowFlag[3,5] := TRUE ;
     PrjHead.FieldShowFlag[3,7] := TRUE ;
     PrjHead.FieldShowFlag[3,8] := TRUE ;
     PrjHead.FieldShowFlag[3,10]:= TRUE ;
     PrjHead.FieldShowFlag[3,11]:= TRUE ;
     PrjHead.FieldShowFlag[3,16]:= TRUE ;

     PrjHead.FieldShowFlag[4,4] := TRUE ;
     PrjHead.FieldShowFlag[4,5] := TRUE ;
     PrjHead.FieldShowFlag[4,7] := TRUE ;
     PrjHead.FieldShowFlag[4,8] := TRUE ;
     PrjHead.FieldShowFlag[4,10]:= TRUE ;
     PrjHead.FieldShowFlag[4,11]:= TRUE ;
     PrjHead.FieldShowFlag[4,16]:= TRUE ;

     PrjHead.FieldShowFlag[5,4] := TRUE ;
     PrjHead.FieldShowFlag[5,5] := TRUE ;
     PrjHead.FieldShowFlag[5,7] := TRUE ;
     PrjHead.FieldShowFlag[5,8] := TRUE ;
     PrjHead.FieldShowFlag[5,10]:= TRUE ;
     PrjHead.FieldShowFlag[5,11]:= TRUE ;
     PrjHead.FieldShowFlag[5,16]:= TRUE ;

     PrjHead.FieldShowFlag[6,4] := TRUE ;
     PrjHead.FieldShowFlag[6,5] := TRUE ;
     PrjHead.FieldShowFlag[6,7] := TRUE ;
     PrjHead.FieldShowFlag[6,8] := TRUE ;
     PrjHead.FieldShowFlag[6,10]:= TRUE ;
     PrjHead.FieldShowFlag[6,11]:= TRUE ;
     PrjHead.FieldShowFlag[6,16]:= TRUE ;

     PrjHead.FieldShowFlag[7,4] := TRUE ;
     PrjHead.FieldShowFlag[7,5] := TRUE ;
     PrjHead.FieldShowFlag[7,7] := TRUE ;
     PrjHead.FieldShowFlag[7,9] := TRUE ;
     PrjHead.FieldShowFlag[7,11]:= TRUE ;

     PrjHead.FieldShowFlag[8,4] := TRUE ;
     PrjHead.FieldShowFlag[8,5] := TRUE ;
     PrjHead.FieldShowFlag[8,7] := TRUE ;

     TableUSER.Filtered := FALSE ;
     TableUSER.Filter := 'ID='+''''+'GMC'+''''+' AND ATTRIB=1' ;
     TableUSER.Filtered := TRUE ;
     TableUSER.First ;
     while (TRUE) do
     begin
          if (TableUSER.EOF) then
             break ;
             
          if (TableUSER.FieldByName('CODE').AsString='工程名称') then
             PrjHead.GCMC := TableUSER.FieldByName('NAME').AsString ;
          if (TableUSER.FieldByName('CODE').AsString='建设单位') then
             PrjHead.JSDW := TableUSER.FieldByName('NAME').AsString ;
          if (TableUSER.FieldByName('CODE').AsString='编制单位') then
             PrjHead.BZDW := TableUSER.FieldByName('NAME').AsString ;
          if (TableUSER.FieldByName('CODE').AsString='建筑面积') then
          begin
               try
                  PrjHead.GCMJ := TableUSER.FieldByName('NAME').AsFloat ;
               except
               end ;
          end ;
          if (TableUSER.FieldByName('CODE').AsString='工程造价') then
          begin
               try
                  PrjHead.GCZJ := TableUSER.FieldByName('NAME').AsFloat ;
               except
               end ;
          end ;

          TableUSER.Next ;
     end ;

     TableUSER.Close ;
     //restore old value
     TableUSER.TableName := oldFName ;
     TableUSER.Filter    := oldFFilter;
     TableUSER.Filtered  := oldFFiltered;
     TableUSER.Active    := oldFOpenFlag ;

end ;

procedure ClearDesr ;
begin
     DesrRec.OpenFlag := FALSE ;
     DesrRec.ID := 0 ;
     DesrRec.ITEMNAME := '' ;
     DesrRec.InputS   := '' ;
     DesrRec.OutputS  := '' ;
end ;

procedure GetDesr(SdesrItem : TMenuItem) ;
begin
     ClearDesr ;
     if (not SdesrItem.Checked) then exit ;
     if (SdesrItem.Tag=0) then exit ;
     DesrRec.ID := SdesrItem.Tag ;
     DesrRec.ITEMNAME := SdesrItem.Caption ;
     DesrRec.InputS   := '' ;
     DesrRec.OutputS  := '' ;
     DesrRec.OpenFlag := TRUE ;
end ;

procedure ShowTable(FName:string;FFilter:string;TableSelect:TTable;DbGridSelect:TDbGrid);
var
   FileName : string ;
   FieldName : string ;
   i : integer ;
begin
     if (FName='') then
     begin
          NotShowTable(TableSelect,DbGridSelect) ;
          exit ;
     end ;
     DbGridSElect.Visible := FALSE ;
     if (TableSelect.Active) then TableSelect.Close ;
     if (Dbs.TableSysDICT.Active) then Dbs.TableSysDICT.Close ;
     TableSelect.DisableControls ;
     Dbs.TableSysDICT.Open ;
     DBGridSelect.Columns.Clear ;
     TableSelect.TableName := FName ;
     TableSelect.Filtered := FALSE ;
     TableSelect.Filter := '' ;
     if (FFilter<>'') then
     begin
          TableSelect.Filter := FFilter ;
          TableSelect.Filtered := TRUE ;
     end ;
     TableSelect.Open ;
     for i:=0 to TableSelect.Fieldcount-1 do
     begin
          DBGridSelect.Columns.Add ;
          FileName := UpperCase(TableSelect.TableName) ;
          FieldName := TableSelect.Fields[i].FieldName ;
          DBGridSelect.Columns[i].FieldName := FieldName ;
          if (Dbs.TableSysDICT.FindKey([FileName,FieldName])) then
          begin
               DBGridSelect.Columns[i].Title.Alignment := taCenter ;
               DBGridSelect.Columns[i].Title.Caption := Dbs.TableSysDICTFIELDLABEL.Value ;
               DBGridSelect.Columns[i].Width := Dbs.TableSysDICTDISPLENGTH.Value ;
               if (Dbs.TableSysDICTINDEXFLAG.Value=TRUE) then
                  DBGridSelect.Columns[i].Color := clTeal
               else
                   DBGridSelect.Columns[i].Color := clWindow ;
               if (TFieldType(ord(Dbs.TableSysDICTFIELDTYPE.Value))=ftFloat) then
                  TFloatField(TableSelect.Fields[i]).DisplayFormat := Dbs.TableSysDICTDISPFORMAT.AsString ;
               if (TFieldType(ord(Dbs.TableSysDICTFIELDTYPE.Value))=ftSmallInt) then
                  TSmallIntField(TableSelect.Fields[i]).DisplayFormat := Dbs.TableSysDICTDISPFORMAT.AsString ;
               if (TFieldType(ord(Dbs.TableSysDICTFIELDTYPE.Value))=ftInteger) then
                  TIntegerField(TableSelect.Fields[i]).DisplayFormat := Dbs.TableSysDICTDISPFORMAT.AsString ;
          end ;
     end ;
     Dbs.TableSysDICT.Close ;
     TableSelect.EnableControls ;
     ShowTableOpenFlag := TableSelect.Active ;
     DbGridSelect.Visible := ShowTableOpenFlag ;
end ;

procedure NotShowTable(TableSelect:TTable;DbGridSelect:TDbGrid) ;
begin
     if (Dbs=Nil) then exit ;
     ShowTableName := '' ;
     ShowTableFilter := '' ;
     if (TableSelect.Active) then TableSelect.Close ;
     if (Dbs.TableSysDICT.Active) then Dbs.TableSysDICT.Close ;
     TableSelect.TableName := '' ;
     TableSelect.Filtered := FALSE ;
     TableSelect.Filter := '' ;
     ShowTableOpenFlag := TableSelect.Active ;
     DbGridSelect.Columns.Clear ;
     DbGridSelect.Visible := ShowTableOpenFlag ;
end ;

procedure ShowTableUser(FName:string;FFilter:string;TableSelect:TTable;DbGridSelect:TDbGrid);
var
   FileName : string ;
   FieldName : string ;
   i,j : integer ;
begin
     if (FName='') then
     begin
          NotShowTableUser(TableSelect,DbGridSelect) ;
          exit ;
     end ;
     DbGridSElect.Visible := FALSE ;
     if (TableSelect.Active) then TableSelect.Close ;
     if (Dbs.TableSysDICT.Active) then Dbs.TableSysDICT.Close ;
     TableSelect.DisableControls ;
     Dbs.TableSysDICT.Open ;
     DBGridSelect.Columns.Clear ;
     TableSelect.TableName := FName ;
     TableSelect.Filtered := FALSE ;
     TableSelect.Filter := '' ;
     if (FFilter<>'') then
     begin
          TableSelect.Filter := FFilter ;
          TableSelect.Filtered := TRUE ;
     end ;
     TableSelect.Open ;
     j := -1 ;
     for i:=0 to TableSelect.Fieldcount-1 do
     begin
          if (PrjHead.FieldShowFlag[DbGridSelect.Tag,i]=FALSE) then continue ;
          inc(j) ;
          DBGridSelect.Columns.Add ;
          FileName := 'USER.DB' ;
          FieldName := TableSelect.Fields[i].FieldName ;
          DBGridSelect.Columns[j].FieldName := FieldName ;
          if (Dbs.TableSysDICT.FindKey([FileName,FieldName])) then
          begin
               DBGridSelect.Columns[j].Title.Alignment := taCenter ;
               DBGridSelect.Columns[j].Title.Caption := Dbs.TableSysDICTFIELDLABEL.Value ;
               DBGridSelect.Columns[j].Width := Dbs.TableSysDICTDISPLENGTH.Value ;
               if ((j=2)or(j=5)or(j=6)) then
                  DBGridSelect.Columns[j].Color := clWhite
               else
                   DBGridSelect.Columns[j].Color := clInfoBk ;
               if (TFieldType(ord(Dbs.TableSysDICTFIELDTYPE.Value))=ftFloat) then
                  TFloatField(TableSelect.Fields[i]).DisplayFormat := Dbs.TableSysDICTDISPFORMAT.AsString ;
               if (TFieldType(ord(Dbs.TableSysDICTFIELDTYPE.Value))=ftSmallInt) then
                  TSmallIntField(TableSelect.Fields[i]).DisplayFormat := Dbs.TableSysDICTDISPFORMAT.AsString ;
               if (TFieldType(ord(Dbs.TableSysDICTFIELDTYPE.Value))=ftInteger) then
                  TIntegerField(TableSelect.Fields[i]).DisplayFormat := Dbs.TableSysDICTDISPFORMAT.AsString ;
          end ;
     end ;
     Dbs.TableSysDICT.Close ;
     TableSelect.EnableControls ;
     ShowTableOpenFlag := TableSelect.Active ;
     DbGridSelect.Visible := ShowTableOpenFlag ;
//     DbGridSelect.SelectedField := TableSelect.FieldByName('CODE') ;
//     DbGridSelect.SetFocus ;
end ;

procedure NotShowTableUser(TableSelect:TTable;DbGridSelect:TDbGrid) ;
begin
     if (Dbs=Nil) then exit ;
     ShowTableName := '' ;
     ShowTableFilter := '' ;
     if (TableSelect.Active) then TableSelect.Close ;
     if (Dbs.TableSysDICT.Active) then Dbs.TableSysDICT.Close ;
     TableSelect.TableName := '' ;
     TableSelect.Filtered := FALSE ;
     TableSelect.Filter := '' ;
     ShowTableOpenFlag := TableSelect.Active ;
     DbGridSelect.Columns.Clear ;
     DbGridSelect.Visible := ShowTableOpenFlag ;
end ;

procedure InsertOneDEItem(TableUSER:TTable) ;
var
   ID : string[10] ;
   NUM: shortint ;
begin
     //if current postion at end of file then exit
     if (TableUSER.EOF) then exit ;
     //Disablecontrols
     TableUSER.DisableControls ;
     //GetCurrent DE information
     if (TableUSER.FieldByName('WLP').AsString='B') then
     begin
          //now current postion at part end
          //If is begin of file then exit
          if (TableUSER.BOF) then
          begin
               TableUSER.EnableControls ;
               exit ;
          end ;
          //judge current postion if can insert record
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          TableUSER.Prior ;
          if (TableUSER.FieldByName('NUM').AsInteger<>NUM) then
          begin
               //at this postion you can not insert recor and exit
               Application.MessageBox ( '对不起，您当前录入定额时所选择的位置不正确，请将光标放在分部之间完成定额录入！',
                                        pChar(AppName),
                                        MB_OK or MB_ICONINFORMATION ) ;
               TableUSER.Next ;
               TableUSER.EnableControls ;
               exit ;
          end else
          begin
               //you can insert record and return current postion
               TableUSER.Next ;
          end ;
     end else if (TableUSER.FieldByName('WLP').AsString='T') then
     begin
          //current postion at begin of file
          TableUSER.Next ;
          if (TableUSER.EOF) then
          begin
               //if current postion at end of file then exit
               TableUSER.EnableControls ;
               exit ;
          end ;
     end ;

     if (SearchDeRec.flag) then
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
          TableUSER.Post ;
     end ;
     //EnableControls
     TableUSER.EnableControls ;
     INGCLDlg.ShowModal ;
     case SearchDerec.DEID of
     1 :
         begin
              if (SearchDeRec.BH1<>'') then
                 AutoHDTZ ;
         end ;
     2 :
         begin
              if (SearchDeRec.BH1<>'') then
                 AutoHDTZ ;
         end ;
     3 :
         begin
              if (SearchDeRec.BH1<>'') then
                 AutoHDTZ ;
         end ;
     4 :
         begin
              if (SearchDeRec.BH1<>'') then
                 AutoHDTZ ;
         end ;
     5 :
         begin
              InsertWJJCL(TableUSER) ;
         end ;
     6 :
         begin
              if (SearchDeRec.BH1<>'') then
                 AutoHDTZ ;
         end ;
     7 :
         begin
              if (SearchDeRec.BH1<>'') then
                 AutoHDTZ ;
         end ;
     8 :
         begin
              if (SearchDeRec.BH1<>'') then
                 AutoHDTZ ;
              if (SearchDeRec.BS='苗木') then
                 InsertMMCL(TableUSER) ;
         end ;

     end ;
end ;

procedure InsertOneClItem(TableUSER:TTable) ;
var
   ID : string[10] ;
   NUM: shortint ;
begin
     //if current postion at end of file then exit
     if (TableUSER.EOF) then exit ;
     //Disablecontrols
     TableUSER.DisableControls ;
     //GetCurrent DE information
     if (TableUSER.FieldByName('WLP').AsString='B') then
     begin
          //now current postion at part end
          //If is begin of file then exit
          if (TableUSER.BOF) then
          begin
               TableUSER.EnableControls ;
               exit ;
          end ;
          //judge current postion if can insert record
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          TableUSER.Prior ;
          if (TableUSER.FieldByName('NUM').AsInteger<>NUM) then
          begin
               //at this postion you can not insert recor and exit
               Application.MessageBox ( '对不起，您当前录入材料时所选择的位置不正确，请将光标放在分部之间完成定额录入！',
                                        pChar(AppName),
                                        MB_OK or MB_ICONINFORMATION ) ;
               TableUSER.Next ;
               TableUSER.EnableControls ;
               exit ;
          end else
          begin
               //you can insert record and return current postion
               TableUSER.Next ;
          end ;
     end else if (TableUSER.FieldByName('WLP').AsString='T') then
     begin
          //current postion at begin of file
          TableUSER.Next ;
          if (TableUSER.EOF) then
          begin
               //if current postion at end of file then exit
               TableUSER.EnableControls ;
               exit ;
          end ;
     end ;

     if (SearchClRec.flag) then
     begin
          //have a right deitem and insert a record in tableuser
          ID  := TableUSER.FieldByName('ID').AsString ;
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          TableUSER.InsertRecord ([FALSE, ID, NUM, 'FDE', 0, '', '1']) ;
          TableUSER.Edit ;
          TableUSER.FieldByName('WLP').AsString    := 'FDE' ;
          TableUSER.FieldByName('CODE').AsString   := SearchClRec.CODE ;
          TableUSER.FieldByName('ATTRIB').AsString := '1' ;
          TableUSER.FieldByName('NAME').AsString   := SearchClRec.MC ;
          TableUSER.FieldByName('UNIT').AsString   := SearchClRec.DW ;
          case SearchClRec.BS of
          1 :
              begin
                   TableUSER.FieldByName('LABFEE').AsFloat  := SearchClRec.DEJ ;
                   TableUSER.FieldByName('LPD').AsFloat  := 1.0 ;
              end ;
          2 :
              begin
                   TableUSER.FieldByName('MTRLFEE').AsFloat := SearchClRec.DEJ ;
              end ;
          3 :
              begin
                   TableUSER.FieldByName('MCHNFEE').AsFloat := SearchClRec.DEJ ;
              end ;
          end ;
          TableUSER.FieldByName('PRICE').AsFloat   := SearchClRec.DEJ ;
          TableUSER.FieldByName('BS').AsString     := IntToStr(SearchClRec.BS) ;
          TableUSER.FieldByName('DEID').AsInteger  := SearchClRec.ID ;
          TableUSER.FieldByName('DEMC').AsString   := SearchClRec.LB1 ;
          TableUSER.FieldByName('CODEID').AsInteger:= SearchClRec.ID ;
          TableUSER.Post ;
     end ;
     //EnableControls
     TableUSER.EnableControls ;
     INGCLDlg.ShowModal ;
end ;

procedure InsertWJJCL(TableUSER:TTable) ;
var
   ID : string[10] ;
   NUM: shortint ;
   code : string[16] ;
   desl : double ;
   hl   : double ;
   QueryDE : TQuery ;

   i : integer ;
   HS : string[20] ;
   SQLCommand : string ;
begin
     //Get ID and NUM
     ID  := TableUSER.FieldByName('ID').AsString ;
     NUM := TableUSER.FieldByName('NUM').AsInteger ;
     //get a unique hs code
     HS := TableUSER.FieldByName('BZ').AsString ;
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
               Dbs.QueryHS.Close ;
               Dbs.QueryHS.RequestLive := TRUE ;
               Dbs.QueryHS.SQL.clear ;
               SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where BZ='+'"'+HS+'"' ;
               Dbs.QueryHS.SQL.Add (SQLCommand) ;
               Dbs.QueryHS.open ;
               if (Dbs.QueryHS.RecordCount=0) then
                  break ;
          end ;
          Dbs.QueryHS.Close ;
          //set ccxs and jcxs
          TableUSER.Edit ;
          TableUSER.FieldByName('P4').AsFloat := SearchDeRec.P1 ;
          TableUSER.FieldByName('P5').AsFloat := SearchDeRec.P2 ;
          TableUSER.FieldbyName('BZ').AsString:= HS ;
          TableUSER.Post ;

          desl := TableUSER.FieldByName('QUANTITY').AsFloat ;
          QueryDE := TQuery.Create (MainForm) ;
          QueryDE.DatabaseName := 'DBF' ;
          QueryDE.SQL.Clear ;
          QueryDE.SQL.Add ( 'SELECT * FROM DEFX WHERE ID='+IntToStr(SearchDeRec.DEID )+
                            ' AND BH="'+SearchDeRec.BH+'"'+
                            ' AND LB="主材"' ) ;
          QueryDE.Open ;

          if (QueryDE.RecordCount<>0) then
          begin
               TableUSER.Edit ;
               TableUSER.FieldbyName('BZ').AsString:= HS ;
               TableUSER.Post ;
               QueryDE.First ;
               while (TRUE) do
               begin
                    if (QueryDE.EOF) then
                       break ;
                    TableUSER.Next ;
                    code := QueryDE.FieldByName('CODE').AsString ;
                    hl := QueryDE.FieldByName('HL').AsFloat ;
                    if (hl=0.0) then hl := 1.0 ;
                    if (Dbs.TableCODE.FindKey([SearchDeRec.CODEID,code])) then
                    begin
                         TableUSER.InsertRecord ([FALSE, ID, NUM, '', 0, '', '1']) ;
                         TableUSER.Edit ;
                         TableUSER.FieldByName('WLP').AsString    := 'FCL' ;
                         TableUSER.FieldByName('CODE').AsString   := SearchDeRec.BH+'*主材' ;
                         TableUSER.FieldByName('NAME').AsString   := Dbs.TableCODE.FieldByName('MC').AsString ;
                         TableUSER.FieldByName('UNIT').AsString   := Dbs.TableCODE.FieldByName('DW').AsString ;
                         TableUSER.FieldByName('P1').AsFloat      := hl ;
                         TableUSER.FieldByName('P2').AsFloat      := desl ;
                         TableUSER.FieldByName('QUANTITY').AsFloat:= hl*desl ;
                         TableUSER.FieldByName('PRICE').AsFloat   := Dbs.TableCODE.FieldByName('DEJ').AsFloat ;
                         TableUSER.FieldByName('BZ').AsString     := HS ;
                         TableUSER.FieldByName('BS').AsString     := Dbs.TableCODE.FieldByName('BS').AsString ;
                         TableUSER.FieldByName('DEID').AsInteger  := SearchDeRec.DEID ;
                         TableUSER.FieldByName('DEMC').AsString   := SearchDeRec.DEMC ;
                         TableUSER.FieldByName('CODEID').AsInteger:= SearchDeRec.CODEID ;
                         TableUSER.Post ;
                         WJJDlg.ShowModal ;
                    end ;
                    QueryDE.Next ;
               end ;
          end ;
          QueryDE.Close ;
          QueryDE.Free ;
     end else
     begin
          if (SWJJCLDlg.ShowModal=IDCANCEL) then
             exit ;

          TableUSER.Edit ;
          TableUSER.FieldByName('P4').AsFloat := SearchDeRec.P1 ;
          TableUSER.FieldByName('P5').AsFloat := SearchDeRec.P2 ;
          TableUSER.FieldbyName('BZ').AsString:= HS ;
          TableUSER.Post ;
          desl := TableUSER.FieldByName('QUANTITY').AsFloat ;
          hl   := 1.0 ;

          TableUSER.Next ;
          code := SWJJCLDlg.CODE ;
          if (Dbs.TableCODE.FindKey([SearchDeRec.CODEID,code])) then
          begin
               TableUSER.InsertRecord ([FALSE, ID, NUM, '', 0, '', '1']) ;
               TableUSER.Edit ;
               TableUSER.FieldByName('WLP').AsString    := 'FCL' ;
               TableUSER.FieldByName('CODE').AsString   := SearchDeRec.BH+'*主材' ;
               TableUSER.FieldByName('NAME').AsString   := Dbs.TableCODE.FieldByName('MC').AsString ;
               TableUSER.FieldByName('UNIT').AsString   := Dbs.TableCODE.FieldByName('DW').AsString ;
               TableUSER.FieldByName('P1').AsFloat      := hl ;
               TableUSER.FieldByName('P2').AsFloat      := desl ;
               TableUSER.FieldByName('QUANTITY').AsFloat:= hl*desl ;
               TableUSER.FieldByName('PRICE').AsFloat   := Dbs.TableCODE.FieldByName('DEJ').AsFloat ;
               TableUSER.FieldByName('BZ').AsString     := HS ;
               TableUSER.FieldByName('BS').AsString     := Dbs.TableCODE.FieldByName('BS').AsString ;
               TableUSER.FieldByName('DEID').AsInteger  := SearchDeRec.DEID ;
               TableUSER.FieldByName('DEMC').AsString   := SearchDeRec.DEMC ;
               TableUSER.FieldByName('CODEID').AsInteger:= SearchDeRec.CODEID ;
               TableUSER.Post ;
               WJJDlg.ShowModal ;
          end ;
     end ;
end ;

procedure InsertMMCL(TableUSER:TTable) ;
var
   ID : string[10] ;
   NUM: shortint ;
   desl : double ;
   hl   : double ;

   i : integer ;
   HS : string[20] ;
   SQLCommand : string ;
begin
     //select a mmcl
     if (SMMXXDlg.ShowModal=IDCANCEL) then
        exit ;
     //Get ID and NUM
     ID  := TableUSER.FieldByName('ID').AsString ;
     NUM := TableUSER.FieldByName('NUM').AsInteger ;
     //get a unique hs code
     HS := TableUSER.FieldByName('BZ').AsString ;
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
               Dbs.QueryHS.Close ;
               Dbs.QueryHS.RequestLive := TRUE ;
               Dbs.QueryHS.SQL.clear ;
               SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where BZ='+'"'+HS+'"' ;
               Dbs.QueryHS.SQL.Add (SQLCommand) ;
               Dbs.QueryHS.open ;
               if (Dbs.QueryHS.RecordCount=0) then
                  break ;
          end ;
     end ;
     Dbs.QueryHS.Close ;

     desl := TableUSER.FieldByName('QUANTITY').AsFloat ;
     hl   := SearchDeRec.P1 ;
     TableUSER.Edit ;
     TableUSER.FieldbyName('NAME').AsString:= TableUSER.FieldbyName('NAME').AsString+SMMXXDlg.MC ;
     TableUSER.FieldbyName('BZ').AsString:= HS ;
     TableUSER.Post ;

     TableUSER.Next ;
     TableUSER.InsertRecord ([FALSE, ID, NUM, '', 0, '', '1']) ;

     TableUSER.Edit ;
     TableUSER.FieldByName('WLP').AsString    := 'FCL' ;
     TableUSER.FieldByName('CODE').AsString   := SMMXXDlg.BH ;
     TableUSER.FieldByName('NAME').AsString   := SMMXXDlg.MC ;
     TableUSER.FieldByName('UNIT').AsString   := SMMXXDlg.DW ;
     TableUSER.FieldByName('P1').AsFloat      := hl ;
     TableUSER.FieldByName('P2').AsFloat      := desl ;
     TableUSER.FieldByName('QUANTITY').AsFloat:= hl*desl ;
     TableUSER.FieldByName('PRICE').AsFloat   := SMMXXDlg.DEJ ;
     TableUSER.FieldByName('BZ').AsString     := HS ;
     TableUSER.FieldByName('BS').AsString     := IntToStr(SMMXXDlg.BS) ;
     TableUSER.FieldByName('DEID').AsInteger  := SearchDeRec.DEID ;
     TableUSER.FieldByName('DEMC').AsString   := SearchDeRec.DEMC ;
     TableUSER.FieldByName('CODEID').AsInteger:= SearchDeRec.CODEID ;
     TableUSER.Post ;
     MMCLDlg.ShowModal ;
end ;

procedure InsertJGCL ;
var
   i : integer ;
   SQLCommand : string ;
begin
     if (Application.MessageBox( '该材料是甲方供应吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     with Dbs do
     begin
          SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where ID="JGCL" AND ATTRIB="1"' ;
          QueryUSER.Close ;
          QueryUSER.RequestLive := TRUE ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add (SQLCommand) ;
          QueryUSER.Open ;
          QueryUSER.Last ;
          if (QueryUSER.FieldByName('WLP').AsString='B') then
          begin
               QueryUSER.InsertRecord( [FALSE,'JGCL',1,'FCL',Nil,Nil,'1'] ) ;
               QueryUSER.Edit ;
               for i:=5 to QueryUSER.FieldCount-1 do
                   QueryUSER.Fields[i].Value := TableUSER.Fields[i].Value ;
               QueryUSER.Post ;
          end ;
          QueryUSER.Close ;
     end ;
end ;

procedure AutoHDTZ ;
var
   BZ : string ;
   DEID : smallint ;
   BH : string ;
   FT : string ;
   HSBH : string ;
   BASE : double ;
   STEP : double ;
   RGF , RGS, CLF, JXF, DJ : double ;

   i : integer ;
   HS : string[20] ;
   SQLCommand : string ;

   ID : string[10] ;
   NUM: shortint ;

   MyBookMark : TBookMark ;
   OldFilter : string ;
begin
     //check Prj OpenFlag
     if (PrjHead.OpenFlag=FALSE) then
     begin
          MessageBeep (0) ;
          exit ;
     end ;
     with Dbs do
     begin
          //check bz
          BZ := TableUSER.FieldByName('BZ').AsString ;
          if (BZ<>'') then
          begin
               Application.MessageBox ( '对不起,您当前选定的子目已经换算过,不可以再进行厚度调整!',
                                        pChar(AppName),
                                        MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
          //show hdtz dialog
          DEID := SearchDeRec.DEID ;
          BH   := SearchDeRec.BH ;
          HSBH := SearchDeRec.BH1 ;
          FT   := SearchDeRec.MC1 ;
          BASE := SearchDeRec.P1 ;
          STEP := SearchDeRec.P2 ;
          HdtzDlg.bh   := BH ;
          HdtzDlg.hsbh := HSBH ;
          HdtzDlg.ft   := FT ;
          HdtzDlg.base := BASE ;
          HdtzDlg.step := STEP ;
          if (HdtzDlg.ShowModal=IDCANCEL) then
             exit ;
          //get a unique hs code
          Dbs.QueryHS.Close ;
          Dbs.QueryHS.RequestLive := TRUE ;
          Dbs.QueryHS.SQL.clear ;
          SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where ID="DEZM" AND WLP="FDE" AND ATTRIB="1"' ;
          Dbs.QueryHS.SQL.Add (SQLCommand) ;
          Dbs.QueryHS.open ;
          for i:=Dbs.QueryHS.RecordCount to 32767 do
          begin
               HS := IntToStr (i) ;
               QueryHS.close ;
               QueryHS.RequestLive := TRUE ;
               QueryHS.SQL.clear ;
               SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where BZ='+'"'+HS+'"' ;
               QueryHS.SQL.Add (SQLCommand) ;
               QueryHS.open ;
               if (QueryHS.RecordCount=0) then
                  break ;
          end ;
          QueryHS.Close ;
          //clear rgf...
          RGF := 0.0 ;
          RGS := 0.0 ;
          CLF := 0.0 ;
          JXF := 0.0 ;
          DJ := 0.0 ;
          //get id ..
          ID  := TableUSER.FieldByName('ID').AsString ;
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          //set bookmark
          MyBookMark := TableUSER.GetBookmark ;
          OldFilter := TableUSER.Filter ;
          //filter ID="DEZM"
          TableUSER.DisableControls ;
          TableUSER.Filter :=  'ID='+''''+'DEZM'+'''' ;
          //goto bookmark
          TableUSER.GotoBookMark ( MyBookMark ) ;

          TableUSER.Next ;
          //insert first de
          TableUSER.InsertRecord ([FALSE, ID, NUM, '', 0, '', '1']) ;
          TableUSER.Edit ;
          TableUSER.FieldByName('WLP').AsString    := 'FDE' ;
          TableUSER.FieldByName('CODE').AsString   := SearchDeRec.BH ;
          TableUSER.FieldByName('ATTRIB').AsString := '0' ;
          TableUSER.FieldByName('NAME').AsString   := SearchDeRec.MC ;
          TableUSER.FieldByName('UNIT').AsString   := SearchDeRec.DW ;
          TableUSER.FieldByName('LABFEE').AsFloat  := SearchDeRec.RGF ;
          TableUSER.FieldByName('MTRLFEE').AsFloat := SearchDeRec.CLF ;
          TableUSER.FieldByName('MCHNFEE').AsFloat := SearchDeRec.JXF ;
          TableUSER.FieldByName('PRICE').AsFloat   := SearchDeRec.DJ ;
          TableUSER.FieldByName('LPD').AsFloat     := SearchDeRec.RGS ;
          TableUSER.FieldByName('QUANTITY').AsFloat:= 1.0 ;
          TableUSER.FieldByName('BS').AsString     := SearchDeRec.BS ;
          TableUSER.FieldByName('DEID').AsInteger  := SearchDeRec.DEID ;
          TableUSER.FieldByName('DEMC').AsString   := SearchDeRec.DEMC ;
          TableUSER.FieldByName('CODEID').AsInteger:= SearchDeRec.CODEID ;
          TableUSER.FieldByName('BZ').AsString     := HS ;
          TableUSER.Post ;
          RGF := SearchDeRec.RGF ;
          RGS := SearchDeRec.RGS ;
          CLF := SearchDeRec.CLF ;
          JXF := SearchDeRec.JXF ;
          DJ  := SearchDeRec.DJ ;
          //search second de and insert de
          GetSearchDeRec(Dbs.TableDE, DEID, UpperCase(HSBH)) ;
          if (SearchDERec.flag) then
          begin
               TableUSER.Next ;
               TableUSER.InsertRecord ([FALSE, ID, NUM, HS, 0, '', '1']) ;
               TableUSER.Edit ;
               TableUSER.FieldByName('WLP').AsString    := 'FDE' ;
               TableUSER.FieldByName('CODE').AsString   := SearchDeRec.BH ;
               TableUSER.FieldByName('ATTRIB').AsString := '0' ;
               TableUSER.FieldByName('NAME').AsString   := SearchDeRec.MC ;
               TableUSER.FieldByName('UNIT').AsString   := SearchDeRec.DW ;
               TableUSER.FieldByName('LABFEE').AsFloat  := SearchDeRec.RGF ;
               TableUSER.FieldByName('MTRLFEE').AsFloat := SearchDeRec.CLF ;
               TableUSER.FieldByName('MCHNFEE').AsFloat := SearchDeRec.JXF ;
               TableUSER.FieldByName('PRICE').AsFloat   := SearchDeRec.DJ ;
               TableUSER.FieldByName('LPD').AsFloat     := SearchDeRec.RGS ;
               TableUSER.FieldByName('QUANTITY').AsFloat:= HDTZDlg.addsl ;
               TableUSER.FieldByName('BS').AsString     := SearchDeRec.BS ;
               TableUSER.FieldByName('DEID').AsInteger  := SearchDeRec.DEID ;
               TableUSER.FieldByName('DEMC').AsString   := SearchDeRec.DEMC ;
               TableUSER.FieldByName('CODEID').AsInteger:= SearchDeRec.CODEID ;
               TableUSER.FieldByName('BZ').AsString     := HS ;
               TableUSER.Post ;
               RGF := RGF+SearchDeRec.RGF*HDTZDlg.addsl ;
               RGS := RGS+SearchDeRec.RGS*HDTZDlg.addsl ;
               CLF := CLF+SearchDeRec.CLF*HDTZDlg.addsl ;
               JXF := JXF+SearchDeRec.JXF*HDTZDlg.addsl ;
               DJ  := DJ+SearchDeRec.DJ*HDTZDlg.addsl ;
          end ;
          //goto bookmark
          TableUSER.Filter := OldFilter ;
          TableUSER.GotoBookmark ( MyBookMark ) ;
          TableUSER.FreeBookmark ( MyBookMark ) ;
          //modify result
          TableUSER.Edit ;
          TableUSER.FieldByName('WLP').AsString    := 'FDE' ;
          TableUSER.FieldByName('CODE').AsString   := HDTZDlg.bh + '换' ;
          TableUSER.FieldByName('NAME').AsString   := HDTZDlg.mc ;
          TableUSER.FieldByName('LABFEE').AsFloat  := RGF ;
          TableUSER.FieldByName('LPD').AsFloat     := RGS ;
          TableUSER.FieldByName('MTRLFEE').AsFloat := CLF ;
          TableUSER.FieldByName('MCHNFEE').AsFloat := JXF ;
          TableUSER.FieldByName('PRICE').AsFloat   := DJ ;
          TableUSER.FieldByName('BZ').AsString     := HS ;
          TableUSER.FieldByName('BS').AsString     := '换' ;
          TableUSER.Post ;

          TableUSER.EnableControls ;
     end ;
end ;

procedure RefreshRCJ ;
var
   SQLCommand : string ;
   USERTEMP : TTable ;
   RCJTEMP : TTable ;
   i : integer ;
begin
     with Dbs do
     begin
          USERTEMP := TTable.Create( MainForm ) ;
          USERTEMP.DatabaseName := 'DBF' ;
          USERTEMP.TableName := 'USERTEMP.DB' ;

          SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where ID="DEZM"' ;
          QueryUSER.Close ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add( SQLCommand ) ;

          USERTEMP.BatchMove( QueryUSER, batCopy ) ;

          QueryUSER.Close ;
          QueryUSER.DatabaseName := 'DBF' ;
          QueryHS.Close ;
          QueryHS.DatabaseName := 'DBF' ;

          if (not USERTEMP.Active) then
             USERTEMP.Open ;

          USERTEMP.First ;
          while (TRUE) do
          begin
               if (USERTEMP.EOF) then
                  break ;

               if (USERTEMP.FieldByName('BS').AsString = '换') then
               begin
                    SQLCommand := 'SELECT * FROM USERTEMP WHERE ID="DEZM" AND ATTRIB="0" AND ' ;
                    SQLCommand := SQLcommand+' BZ="'+USERTEMP.FieldByName('BZ').AsString+'"' ;

                    QueryHS.Close ;
                    QueryHS.RequestLive := TRUE ;
                    QueryHS.SQL.Clear ;
                    QueryHS.SQL.Add( SQLCommand ) ;
                    QueryHS.Open ;
                    QueryHS.First ;
                    while (TRUE) do
                    begin
                         if (QueryHS.EOF) then
                            break ;

                         QueryHS.Edit ;
                         QueryHS.FieldByName('QUANTITY').AsFloat := USERTEMP.FieldByName('QUANTITY').AsFloat*
                                                                    QueryHS.FieldByName('QUANTITY').AsFloat ;
                         QueryHS.Post ;

                         QueryHS.Next ;
                    end ;
                    QueryHS.Close ;
               end ;

               USERTEMP.Next ;
          end ;
          //select some cl
          SQLCommand := 'SELECT * From USERTEMP Where ID="DEZM" AND WLP="FCL" AND ATTRIB="0"' ;
          QueryUSER.Close ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add( SQLCommand ) ;
          QueryUSER.Open ;
          QueryUSER.First ;
          while (TRUE) do
          begin
               if (QueryUSER.EOF) then
                  break ;

               USERTEMP.AppendRecord ([FALSE,'RCJ']) ;
               USERTEMP.Edit ;
               USERTEMP.FieldByName('CODE').AsString     := QueryUSER.FieldByName('CODE').AsString ;
               USERTEMP.FieldByName('QUANTITY').AsFloat  := QueryUSER.FieldByName('QUANTITY').AsFloat ;
               USERTEMP.FieldByName('CODEID').AsInteger  := QueryUSER.FieldByName('CODEID').AsInteger ;
               USERTEMP.Post ;

               QueryUSER.Next ;
          end ;
          //erase some de
          SQLCommand := 'Delete From USERTEMP Where ID="DEZM" AND ' ;
          SQLCommand := SQLCommand+'(WLP="T" Or WLP="B" Or WLP="FCL" Or BS="换")' ;
          QueryUSER.Close ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add( SQLCommand ) ;
          QueryUSER.ExecSQL ;
          QueryUSER.Close ;
          //select all cl
          SQLCommand := 'SELECT DEFX.CODE,DEFX.HL*USERTEMP.QUANTITY QUANTITY,USERTEMP.CODEID FROM USERTEMP,DEFX ' ;
          SQLCommand := SQLcommand+'WHERE (USERTEMP.ID="DEZM")AND(USERTEMP.DEID=DEFX.ID)AND(USERTEMP.CODE=DEFX.BH)' ;
          QueryUSER.Close ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add(SQLCommand) ;
          QueryUSER.Open ;
          QueryUSER.First ;
          while (TRUE) do
          begin
               if (QueryUSER.EOF) then
                  break ;

               USERTEMP.AppendRecord ([FALSE,'RCJ']) ;
               USERTEMP.Edit ;
               USERTEMP.FieldByName('CODE').AsString     := QueryUSER.FieldByName('CODE').AsString ;
               USERTEMP.FieldByName('QUANTITY').AsFloat  := QueryUSER.FieldByName('QUANTITY').AsFloat ;
               USERTEMP.FieldByName('CODEID').AsInteger  := QueryUSER.FieldByName('CODEID').AsInteger ;
               USERTEMP.Post ;

               QueryUSER.Next ;
          end ;
          //select jpfxcl and jxfxcl
          SQLCommand := 'SELECT CODEFX.CODE,CODEFX.HL*USERTEMP.QUANTITY QUANTITY,USERTEMP.CODEID FROM USERTEMP,CODEFX ' ;
          SQLCommand := SQLcommand+'WHERE (USERTEMP.ID="RCJ")AND(USERTEMP.CODEID=CODEFX.ID)AND(USERTEMP.CODE=CODEFX.BH)' ;
          QueryUSER.Close ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add(SQLCommand) ;
          QueryUSER.Open ;
          QueryUSER.First ;
          while (TRUE) do
          begin
               if (QueryUSER.EOF) then
                  break ;

               USERTEMP.AppendRecord ([FALSE,'RCJ']) ;
               USERTEMP.Edit ;
               USERTEMP.FieldByName('CODE').AsString     := QueryUSER.FieldByName('CODE').AsString ;
               USERTEMP.FieldByName('QUANTITY').AsFloat  := QueryUSER.FieldByName('QUANTITY').AsFloat ;
               USERTEMP.FieldByName('CODEID').AsInteger  := QueryUSER.FieldByName('CODEID').AsInteger ;
               USERTEMP.FieldByName('BZ').AsString       := 'CODEFX' ;
               USERTEMP.Post ;

               QueryUSER.Next ;
          end ;
          USERTEMP.Close ;
          QueryUSER.Close ;

          //calc summary
          SQLCommand := 'SELECT DISTINCT CODEID, CODE, SUM(QUANTITY) QUANTITY, BZ FROM USERTEMP ' ;
          SQLCommand := SQLCommand+'WHERE ID="RCJ" ' ;
          SQLCommand := SQLCommand+'GROUP BY CODEID, CODE, BZ ORDER BY CODEID, CODE, BZ' ;
          QueryUSER.Close ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add( SQLCommand ) ;
          QueryUSER.Open ;
          QueryUSER.First ;
          USERTEMP.EmptyTable ;
          USERTEMP.Open ;
          while (TRUE) do
          begin
               if (QueryUSER.EOF) then
                  break ;
               if (QueryUSER.FieldByName('QUANTITY').AsFloat<>0.0) then
               begin
                    if (TableCODE.FindKey([ QueryUSER.FieldByName('CODEID').AsInteger,
                                            QueryUSER.FieldByName('CODE').AsString ])) then
                    begin
                         USERTEMP.AppendRecord ([FALSE,'RCJ']) ;
                         USERTEMP.Edit ;
                         USERTEMP.FieldByName('WLP').AsString      := 'FCL' ;
                         USERTEMP.FieldByName('ATTRIB').AsString   := '1' ;
                         USERTEMP.FieldByName('QUANTITY').AsFloat  := QueryUSER.FieldByName('QUANTITY').AsFloat ;
                         USERTEMP.FieldByName('CODE').AsString     := TableCODE.FieldByName('CODE').AsString ;
                         USERTEMP.FieldByName('NAME').AsString     := TableCODE.FieldByName('MC').AsString ;
                         USERTEMP.FieldByName('UNIT').AsString     := TableCODE.FieldByName('DW').AsString ;
                         USERTEMP.FieldByName('PRICE').AsFloat     := TableCODE.FieldByName('DEJ').AsFloat ;
                         USERTEMP.FieldByName('DEID').AsInteger    := TableCODE.FieldByName('ID').AsInteger ;
                         USERTEMP.FieldByName('BS').AsString       := TableCODE.FieldByName('FL').AsString ;
                         USERTEMP.FieldByName('BZ').AsString       := TableCODE.FieldByName('FLCODE').AsString ;
                         USERTEMP.FieldByName('DEMC').AsString     := TableCODE.FieldByName('LB1').AsString ;
                         USERTEMP.FieldByName('CODEID').AsString   := TableCODE.FieldByName('BS').AsString ;
                         if (QueryUSER.FieldByName('BZ').AsString='CODEFX') then
                            USERTEMP.FieldByName('BZ').AsString    := 'CODEFX' ;
                         USERTEMP.Post ;
                    end ;
               end ;
               QueryUSER.Next ;
          end ;
          QueryUSER.Close ;
          QueryUSER.DatabaseName := 'USER' ;
          //modify rcj and zpb
          TableUSER.DisableControls ;
          //insert zpb
          SQLCommand := 'DELETE From "'+PrjHead.FileName+'" Where ID="ZPB" AND WLP="FCL"' ;
          QueryUSER.Close ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add( SQLCommand ) ;
          QueryUSER.ExecSQL ;
          QueryUSER.Close ;
          TableUSER.Filter := 'ID='+''''+'ZPB'+''''+' AND ATTRIB=1';
          TableUSER.First ;
          TableUSER.Next ;
          SQLCommand := 'SELECT * FROM USERTEMP WHERE BS LIKE "*%"' ;
          QueryHS.Close ;
          QueryHS.SQL.Clear ;
          QueryHS.SQL.Add (SQLCommand) ;
          QueryHS.Open ;
          QueryHS.First ;
          while (TRUE) do
          begin
               if (QueryHS.EOF) then
                  break ;
               TableUSER.InsertRecord([FALSE,'ZPB',1,'FCL',Nil,Nil,'1']) ;
               TableUSER.Edit ;
               for i:=5 to TableUSER.FieldCount-1 do
                   TableUSER.Fields[i].Value := QueryHS.Fields[i].Value ;
               TableUSER.Post ;
               TableUSER.Next ;
               QueryHS.Next ;
          end ;
          SQLCommand := 'DELETE FROM USERTEMP WHERE BS LIKE "*%"' ;
          QueryHS.Close ;
          QueryHS.SQL.Clear ;
          QueryHS.SQL.Add (SQLCommand) ;
          QueryHS.ExecSQL ;
          QueryHS.Close ;
          //insert rcj
          TableUSER.Filter := 'ID='+''''+'RCJ'+''''+' AND ATTRIB=1';
          //select old rcj and write to RCJTEMP
          SQLCommand := 'SELECT * From "'+PrjHead.FileName+'" Where ID="RCJ" AND WLP="FCL"' ;
          QueryUSER.Close ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add( SQLCommand ) ;
          RCJTEMP := TTable.Create( MainForm ) ;
          RCJTEMP.DatabaseName := 'DBF' ;
          RCJTEMP.TableName := 'RCJTEMP.DB' ;
          RCJTEMP.BatchMove(QueryUSER, batCopy) ;
          //delete old rcj
          SQLCommand := 'DELETE From "'+PrjHead.FileName+'" Where ID="RCJ" AND WLP="FCL"' ;
          QueryUSER.Close ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add( SQLCommand ) ;
          QueryUSER.ExecSQL ;
          QueryUSER.Close ;
          //get old rcj value
          USERTEMP.First ;
          while (TRUE) do
          begin
               if (USERTEMP.EOF) then
                  break ;
               SQLCommand := 'SELECT * FROM RCJTEMP WHERE CODE="'+USERTEMP.FieldByName('CODE').AsString+'" ' ;
               SQLCommand := SQLCommand+' AND DEID='+USERTEMP.FieldByName('DEID').AsString ;
               QueryHS.Close ;
               QueryHS.SQL.Clear ;
               QueryHS.SQL.Add( SQLCommand ) ;
               QueryHS.Open ;
               if (QueryHS.RecordCount=1) then
               begin
                    USERTEMP.Edit ;
                    USERTEMP.FieldByName('NAME').AsString   := QueryHS.FieldByName('NAME').AsString ;
                    USERTEMP.FieldByName('LABFEE').AsFloat  := QueryHS.FieldByName('LABFEE').AsFloat ;
                    USERTEMP.FieldByName('LPD').AsFloat     := QueryHS.FieldByName('LPD').AsFloat ;
                    USERTEMP.FieldByName('MTRLFEE').AsFloat := QueryHS.FieldByName('MTRLFEE').AsFloat ;
                    USERTEMP.FieldByName('MCHNFEE').AsFloat := QueryHS.FieldByName('MCHNFEE').AsFloat ;
                    USERTEMP.Post ;
               end ;
               QueryHS.Close ;
               USERTEMP.Next ;
          end ;
          RCJTEMP.DeleteTable ;
          //insert rg
          TableUSER.First ;
          TableUSER.Next ;
          USERTEMP.Filter := 'CODEID=1' ;
          USERTEMP.Filtered := TRUE ;
          USERTEMP.First ;
          while (TRUE) do
          begin
               if (USERTEMP.EOF) then
                  break ;
               TableUSER.InsertRecord([FALSE,'RCJ',1,'FCL',Nil,Nil,'1']) ;
               TableUSER.Edit ;
               for i:=4 to TableUSER.FieldCount-1 do
                   TableUSER.Fields[i].Value := USERTEMP.Fields[i].Value ;
               TableUSER.Post ;
               TableUSER.Next ;
               USERTEMP.Next ;
          end ;
          //insert cl
          TableUSER.Next ;
          TableUSER.Next ;
          USERTEMP.Filter := 'CODEID=2 AND BZ<>'+''''+'CODEFX'+'''' ;
          USERTEMP.Filtered := TRUE ;
          USERTEMP.First ;
          while (TRUE) do
          begin
               if (USERTEMP.EOF) then
                  break ;
               TableUSER.InsertRecord([FALSE,'RCJ',2,'FCL',Nil,Nil,'1']) ;
               TableUSER.Edit ;
               for i:=4 to TableUSER.FieldCount-1 do
                   TableUSER.Fields[i].Value := USERTEMP.Fields[i].Value ;
               TableUSER.Post ;
               TableUSER.Next ;
               USERTEMP.Next ;
          end ;
          USERTEMP.Filter := 'CODEID=2 AND BZ='+''''+'CODEFX'+'''' ;
          USERTEMP.Filtered := TRUE ;
          USERTEMP.First ;
          while (TRUE) do
          begin
               if (USERTEMP.EOF) then
                  break ;
               TableUSER.InsertRecord([FALSE,'RCJ',2,'FCL',Nil,Nil,'1']) ;
               TableUSER.Edit ;
               for i:=4 to TableUSER.FieldCount-1 do
                   TableUSER.Fields[i].Value := USERTEMP.Fields[i].Value ;
               TableUSER.FieldByName('BZ').AsString := '制品级配机械拆分材料' ;
               TableUSER.Post ;
               TableUSER.Next ;
               USERTEMP.Next ;
          end ;
          //insert jx
          TableUSER.Next ;
          TableUSER.Next ;
          USERTEMP.Filter := 'CODEID=3' ;
          USERTEMP.Filtered := TRUE ;
          USERTEMP.First ;
          while (TRUE) do
          begin
               if (USERTEMP.EOF) then
                  break ;
               TableUSER.InsertRecord([FALSE,'RCJ',3,'FCL',Nil,Nil,'1']) ;
               TableUSER.Edit ;
               for i:=4 to TableUSER.FieldCount-1 do
                   TableUSER.Fields[i].Value := USERTEMP.Fields[i].Value ;
               TableUSER.Post ;
               TableUSER.Next ;
               USERTEMP.Next ;
          end ;
          TableUSER.First ;

          TableUSER.EnableControls ;

          QueryUSER.Close ;
          QueryUSER.DatabaseName := 'USER' ;
          QueryHS.Close ;
          QueryHS.DatabaseName := 'USER' ;

          USERTEMP.Close ;
          USERTEMP.DeleteTable ;
          USERTEMP.Free ;
     end ;
end ;

procedure ZRJXTB ;
var
   BookMark : TBookMark ;
begin
     with Dbs do
     begin
          BookMark := TableUSER.GetBookmark ;
          TableUSER.DisableControls ;

          TableUSER.First ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;
               if (TableUSER.FieldByName('CODEID').AsInteger=3) then
               begin
                    if (TableJX.FindKey([TableUSER.FieldByName('DEID').AsInteger,TableUSER.FieldByName('CODE').AsString])) then
                    begin
                         TableUSER.Edit ;
                         TableUSER.FieldByName('LABFEE').AsFloat := TableJX.FieldByName('DJ').AsFloat ;
                         TableUSER.Post ;
                    end else
                    begin
                         TableUSER.Edit ;
                         TableUSER.FieldByName('LABFEE').AsString := '' ;
                         TableUSER.Post ;
                    end ;
               end ;
               TableUSER.Next ;
          end ;

          TableUSER.GotoBookMark( BookMark ) ;
          TableUSER.FreeBookMark( BookMark ) ;
          TableUSER.EnableControls ;
     end ;

end ;


procedure ReFreshTabSheet1 ;
var
   BookMark : TBookMark ;
   i : integer ;
   hj,rgf,rgs,clf,jxf,zcc,labbc,lpdbc,mtrbc,mchbc,wjj,xxj : double ;
begin
     with Dbs do
     begin
          if (not TableUSER.Active) then exit ;
          if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet1) then exit ;

          BookMark := TableUSER.GetBookmark ;
          TableUSER.DisableControls ;

          i := 0 ;
          TableUSER.First ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;

               TableUSER.Edit ;
               TableUSER.FieldByName('XH').AsString := '' ;
               TableUSER.Post ;
               if (TableUSER.FieldByName('ID').AsString='DEZM') then
               begin
                    if (TableUSER.FieldByName('WLP').AsString='FDE') then
                    begin
                         inc (i) ;
                         TableUSER.Edit ;
                         TableUSER.FieldByName('XH').AsInteger := i ;
                         TableUSER.Post ;
                    end ;
               end ;

               if (TableUSER.FieldByName('WLP').AsString='T') then
               begin
                    hj    := 0.0 ;
                    rgf   := 0.0 ;
                    rgs   := 0.0 ;
                    clf   := 0.0 ;
                    jxf   := 0.0 ;
                    zcc   := 0.0 ;
                    labbc := 0.0 ;
                    lpdbc := 0.0 ;
                    mtrbc := 0.0 ;
                    mchbc := 0.0 ;
                    wjj   := 0.0 ;
                    xxj   := 0.0 ;
               end else if (TableUSER.FieldByName('WLP').AsString='B') then
               begin
                    TableUSER.Edit ;
                    TableUSER.FieldByName('COUNT').AsFloat    := hj ;
                    TableUSER.FieldByName('LABCOUNT').AsFloat := rgf ;
                    TableUSER.FieldByName('LPDCOUNT').AsFloat := rgs ;
                    TableUSER.FieldByName('MTRCOUNT').AsFloat := clf ;
                    TableUSER.FieldByName('MCHCOUNT').AsFloat := jxf ;
                    TableUSER.FieldByName('ZCC').AsFloat      := zcc ;
                    TableUSER.FieldByName('LABBC').AsFloat    := labbc ;
                    TableUSER.FieldByName('LPDBC').AsFloat    := lpdbc ;
                    TableUSER.FieldByName('MTRBC').AsFloat    := mtrbc ;
                    TableUSER.FieldByName('MCHBC').AsFloat    := mchbc ;
                    TableUSER.FieldByName('SCOUNT').AsFloat   := xxj ;
                    TableUSER.Post ;
                    if (PrjZJ.flag) then
                    begin
                         PrjZJ.DEZJF := PrjZJ.DEZJF+hj ;
                         PrjZJ.DERGF := PrjZJ.DERGF+rgf ;
                         PrjZJ.DERGS := PrjZJ.DERGS+rgs ;
                         PrjZJ.DECLF := PrjZJ.DECLF+clf ;
                         PrjZJ.DEJXF := PrjZJ.DEJXF+jxf ;
                         PrjZJ.DEWJJ := PrjZJ.DEWJJ+wjj ;
                         PrjZJ.RGFBC := PrjZJ.RGFBC+labbc ;
                         PrjZJ.CLFBC := PrjZJ.CLFBC+mtrbc ;
                         PrjZJ.JXFBC := PrjZJ.JXFBC+mchbc ;
                         PrjZJ.XXZJF := PrjZJ.XXZJF+xxj ;
                    end ;
                    hj    := 0.0 ;
                    rgf   := 0.0 ;
                    rgs   := 0.0 ;
                    clf   := 0.0 ;
                    jxf   := 0.0 ;
                    zcc   := 0.0 ;
                    labbc := 0.0 ;
                    lpdbc := 0.0 ;
                    mtrbc := 0.0 ;
                    mchbc := 0.0 ;
                    wjj   := 0.0 ;
                    xxj   := 0.0 ;
               end else if (TableUSER.FieldByName('WLP').AsString='FDE') then
               begin
                    TableUSER.Edit ;
                    TableUSER.FieldByName('COUNT').AsFloat    := TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('PRICE').AsFloat ;
                    TableUSER.FieldByName('LABCOUNT').AsFloat := TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('LABFEE').AsFloat ;
                    TableUSER.FieldByName('LPDCOUNT').AsFloat := TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('LPD').AsFloat ;
                    TableUSER.FieldByName('MTRCOUNT').AsFloat := TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('MTRLFEE').AsFloat ;
                    TableUSER.FieldByName('MCHCOUNT').AsFloat := TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('MCHNFEE').AsFloat ;
                    TableUSER.FieldByName('ZCC').AsFloat      := 0.01*TableUSER.FieldByName('P1').AsFloat*TableUSER.FieldByName('COUNT').AsFloat ;
                    TableUSER.FieldByName('LABBC').AsFloat    := 0.01*TableUSER.FieldByName('P2').AsFloat*TableUSER.FieldByName('LABCOUNT').AsFloat ;
                    TableUSER.FieldByName('LPDBC').AsFloat    := 0.01*TableUSER.FieldByName('P3').AsFloat*TableUSER.FieldByName('LPDCOUNT').AsFloat ;
                    TableUSER.FieldByName('MTRBC').AsFloat    := 0.01*TableUSER.FieldByName('P4').AsFloat*TableUSER.FieldByName('MTRCOUNT').AsFloat ;
                    TableUSER.FieldByName('MCHBC').AsFloat    := 0.01*TableUSER.FieldByName('P5').AsFloat*TableUSER.FieldByName('MCHCOUNT').AsFloat ;
                    TableUSER.FieldByName('SCOUNT').AsFloat   := TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('SPRICE').AsFloat ;
                    TableUSER.Post ;
                    hj    := hj +TableUSER.FieldByName('COUNT').AsFloat ;
                    rgf   := rgf+TableUSER.FieldByName('LABCOUNT').AsFloat ;
                    rgs   := rgs+TableUSER.FieldByName('LPDCOUNT').AsFloat ;
                    clf   := clf+TableUSER.FieldByName('MTRCOUNT').AsFloat ;
                    jxf   := jxf+TableUSER.FieldByName('MCHCOUNT').AsFloat ;
                    zcc   := zcc+TableUSER.FieldByName('ZCC').AsFloat ;
                    labbc := labbc+TableUSER.FieldByName('LABBC').AsFloat ;
                    lpdbc := lpdbc+TableUSER.FieldByName('LPDBC').AsFloat ;
                    mtrbc := mtrbc+TableUSER.FieldByName('MTRBC').AsFloat ;
                    mchbc := mchbc+TableUSER.FieldByName('MCHBC').AsFloat ;
                    xxj   := xxj+TableUSER.FieldByName('SCOUNT').AsFloat ;
               end else if (TableUSER.FieldByName('WLP').AsString='FCL') then
               begin
                    TableUSER.Edit ;
                    TableUSER.FieldByName('COUNT').AsFloat    := TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('PRICE').AsFloat ;
                    TableUSER.Post ;
                    hj  := hj +TableUSER.FieldByName('COUNT').AsFloat ;
                    wjj := wjj +TableUSER.FieldByName('COUNT').AsFloat ;
               end ;

               TableUSER.Next ;
          end ;

          if (PrjZJ.flag) then
          begin
               PrjZJ.PN[1] := PrjZJ.DEZJF ;
               PrjZJ.PN[2] := PrjZJ.DERGF ;
               PrjZJ.PN[3] := PrjZJ.DECLF ;
               PrjZJ.PN[4] := PrjZJ.DEJXF ;
               PrjZJ.PN[17]:= PrjZJ.DERGS ;
          end ;

          TableUSER.GotoBookmark (BookMark) ;
          TableUSER.FreeBookmark (BookMark) ;
          TableUSER.EnableControls ;
     end ;
end ;

procedure ReFreshTabSheet2 ;
var
   BookMark : TBookMark ;
   i : integer ;
   hj: double ;
begin
     with Dbs do
     begin
          if (not TableUSER.Active) then exit ;
          if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet2) then exit ;

          BookMark := TableUSER.GetBookmark ;
          TableUSER.DisableControls ;

          i := 0 ;
          hj := 0.0 ;
          TableUSER.First ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;
               if (TableUSER.FieldByName('WLP').AsString='T') then
               begin
                    i := 0 ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsString := '' ;
                    TableUSER.FieldByName('PRICE').AsString := '' ;
                    TableUSER.Post ;
               end else if (TableUSER.FieldByName('WLP').AsString='B') then
               begin
                    i := 0 ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsString := '' ;
                    TableUSER.FieldByName('PRICE').AsFloat := hj ;
                    TableUSER.Post ;
                    if (PrjZJ.flag) then
                       PrjZJ.PN[21] := hj ;
               end else
               begin
                    inc(i) ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsInteger := i ;
                    TableUSER.Post ;
                    hj := hj+TableUSER.FieldByName('PRICE').AsFloat ;
               end ;
               TableUSER.Next ;
          end ;

          TableUSER.GotoBookmark (BookMark) ;
          TableUSER.FreeBookmark (BookMark) ;
          TableUSER.EnableControls ;
     end ;
end ;

procedure ReFreshTabSheet3 ;
var
   BookMark : TBookMark ;
   i : integer ;
   mc : string[100] ;
   xxrgf,xxclf,xxjxf : double ;
begin
     with Dbs do
     begin
          if (not TableUSER.Active) then exit ;
          if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet3) then exit ;

          BookMark := TableUSER.GetBookmark ;
          TableUSER.DisableControls ;

          i := 0 ;
          xxrgf := 0.0 ;
          xxclf := 0.0 ;
          xxjxf := 0.0 ;
          TableUSER.First ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;
               if (TableUSER.FieldByName('WLP').AsString='T') then
               begin
                    i := 0 ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsString       := '' ;
                    TableUSER.FieldByName('QUANTITY').AsString := '' ;
                    TableUSER.FieldByName('PRICE').AsString    := '' ;
                    TableUSER.FieldByName('COUNT').AsString    := '' ;
                    TableUSER.Post ;
               end else if (TableUSER.FieldByName('WLP').AsString='B') then
               begin
                    i := 0 ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsString       := '' ;
                    TableUSER.FieldByName('QUANTITY').AsString := '' ;
                    TableUSER.FieldByName('PRICE').AsString    := '' ;
                    if (PrjZJ.flag) then
                    begin
                         case TableUSER.FieldByName('NUM').AsInteger of
                         1 :
                             begin
                                  TableUSER.FieldByName('COUNT').AsFloat := PrjZJ.DERGF ;
                                  TableUSER.FieldByName('SCOUNT').AsFloat:= xxrgf ;
                                  TableUSER.FieldByName('QUANTITY').AsFloat := PrjZJ.DERGS ;
                             end ;
                         2 :
                             begin
                                  TableUSER.FieldByName('SCOUNT').AsFloat:= xxclf ;
                                  TableUSER.FieldByName('COUNT').AsFloat := PrjZJ.DECLF ;
                             end ;
                         3 :
                             begin
                                  TableUSER.FieldByName('SCOUNT').AsFloat:= xxjxf ;
                                  TableUSER.FieldByName('COUNT').AsFloat := PrjZJ.DEJXF ;
                             end ;
                        end ;
                    end ;
                    TableUSER.Post ;
               end else
               begin
                    inc(i) ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsInteger := i ;
                    TableUSER.FieldByName('COUNT').AsFloat    := TableUSER.FieldByName('QUANTITY').AsFloat*
                                                                 TableUSER.FieldByName('PRICE').AsFloat ;
                    TableUSER.FieldByName('SCOUNT').AsFloat   := TableUSER.FieldByName('QUANTITY').AsFloat*
                                                                 TableUSER.FieldByName('SPRICE').AsFloat ;
                    TableUSER.FieldByName('LABCOUNT').AsFloat := TableUSER.FieldByName('QUANTITY').AsFloat*
                                                                 TableUSER.FieldByName('LABFEE').AsFloat ;
                    TableUSER.Post ;
                    if (PrjZJ.flag) then
                    begin
                         mc := TableUSER.FieldByName('NAME').AsString ;
                         case TableUSER.FieldByName('NUM').AsInteger of
                         1 :
                             begin
                                  if (pos('其他工',mc)<>0) then
                                     PrjZJ.PN[19] := PrjZJ.PN[19]+TableUSER.FieldByName('QUANTITY').AsFloat ;
                                  if (pos('普通工',mc)<>0) then
                                     PrjZJ.PN[19] := PrjZJ.PN[19]+TableUSER.FieldByName('QUANTITY').AsFloat ;
                                  xxrgf := xxrgf+TableUSER.FieldByName('SCOUNT').AsFloat ;
                             end ;
                         2 :
                             begin
                                  if (pos('机械人工',mc)<>0) then
                                     PrjZJ.PN[20] := PrjZJ.PN[20]+TableUSER.FieldByName('QUANTITY').AsFloat ;
                                  if (pos('其他材料费',mc)<>0) then
                                     PrjZJ.PN[16] := PrjZJ.PN[16]+TableUSER.FieldByName('COUNT').AsFloat ;
                                  if (pos('零件费',mc)<>0) then
                                     PrjZJ.PN[16] := PrjZJ.PN[16]+TableUSER.FieldByName('COUNT').AsFloat ;
                                  if (TableUSER.FieldByName('LABFEE').AsFloat<>0.0) then
                                  begin
                                       PrjZJ.PN[22] := PrjZJ.PN[22]+TableUSER.FieldByName('COUNT').AsFloat ;
                                       PrjZJ.PN[23] := PrjZJ.PN[23]+TableUSER.FieldByName('LABCOUNT').AsFloat ;
                                  end ;
                                  xxclf := xxclf+TableUSER.FieldByName('SCOUNT').AsFloat ;
                             end ;
                         3 :
                             begin
                                  if (TableUSER.FieldByName('LABFEE').AsFloat<>0.0) then
                                  begin
                                       PrjZJ.PN[24] := PrjZJ.PN[24]+TableUSER.FieldByName('COUNT').AsFloat ;
                                       PrjZJ.PN[25] := PrjZJ.PN[25]+TableUSER.FieldByName('LABCOUNT').AsFloat ;
                                  end ;
                                  xxjxf := xxjxf+TableUSER.FieldByName('SCOUNT').AsFloat ;
                             end ;
                         end ;
                    end ;
               end ;
               TableUSER.Next ;
          end ;

          if (PrjZJ.flag) then
          begin
               PrjZJ.PN[18] := PrjZJ.PN[17]-PrjZJ.PN[19] ;
               PrjZJ.XXRGF  := xxrgf ;
               PrjZJ.XXCLF  := xxclf ;
               PrjZJ.XXJXF  := xxjxf ;
          end ;

          TableUSER.EnableControls ;
          TableUSER.GotoBookmark(BookMark) ;
          TableUSER.FreeBookmark(BookMark) ;
     end ;
end ;

procedure ReFreshTabSheet4 ;
var
   BookMark : TBookMark ;
   i : integer ;
   hj: double ;
begin
     with Dbs do
     begin
          if (not TableUSER.Active) then exit ;
          if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet4) then exit ;

          BookMark := TableUSER.GetBookmark ;
          TableUSER.DisableControls ;

          i := 0 ;
          TableUSER.First ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;
               if (TableUSER.FieldByName('WLP').AsString='T') then
               begin
                    i := 0 ;
                    hj := 0.0 ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsString       := '' ;
                    TableUSER.FieldByName('QUANTITY').AsString := '' ;
                    TableUSER.FieldByName('PRICE').AsString    := '' ;
                    TableUSER.FieldByName('COUNT').AsString    := '' ;
                    TableUSER.Post ;
               end else if (TableUSER.FieldByName('WLP').AsString='B') then
               begin
                    i := 0 ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsString       := '' ;
                    TableUSER.FieldByName('QUANTITY').AsString := '' ;
                    TableUSER.FieldByName('PRICE').AsString    := '' ;
                    TableUSER.FieldByName('COUNT').AsFloat     := hj ;
                    TableUSER.Post ;
                    if (PrjZJ.flag) then
                       PrjZJ.PN[26] := hj ;
               end else
               begin
                    inc(i) ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsInteger := i ;
                    TableUSER.FieldByName('COUNT').AsFloat := TableUSER.FieldByName('QUANTITY').AsFloat*
                                                              TableUSER.FieldByName('PRICE').AsFloat ;
                    TableUSER.Post ;
                    hj := hj+TableUSER.FieldByName('COUNT').AsFloat ;
               end ;
               TableUSER.Next ;
          end ;

          TableUSER.EnableControls ;
          TableUSER.GotoBookmark(BookMark) ;
          TableUSER.FreeBookmark(BookMark) ;
     end ;
end ;

procedure ReFreshTabSheet5 ;
var
   BookMark : TBookMark ;
   i : integer ;
   hj: double ;
begin
     with Dbs do
     begin
          if (not TableUSER.Active) then exit ;
          if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet5) then exit ;

          BookMark := TableUSER.GetBookmark ;
          TableUSER.DisableControls ;

          i := 0 ;
          TableUSER.First ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;
               if (TableUSER.FieldByName('WLP').AsString='T') then
               begin
                    i := 0 ;
                    hj := 0.0 ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsString       := '' ;
                    TableUSER.FieldByName('QUANTITY').AsString := '' ;
                    TableUSER.FieldByName('PRICE').AsString    := '' ;
                    TableUSER.FieldByName('COUNT').AsString    := '' ;
                    TableUSER.Post ;
               end else if (TableUSER.FieldByName('WLP').AsString='B') then
               begin
                    i := 0 ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsString       := '' ;
                    TableUSER.FieldByName('QUANTITY').AsString := '' ;
                    TableUSER.FieldByName('PRICE').AsString    := '' ;
                    TableUSER.FieldByName('COUNT').AsFloat     := hj ;
                    TableUSER.Post ;
                    if (PrjZJ.flag) then
                       PrjZJ.PN[27] := hj ;
               end else
               begin
                    inc(i) ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsInteger := i ;
                    TableUSER.FieldByName('COUNT').AsFloat := TableUSER.FieldByName('QUANTITY').AsFloat*
                                                              TableUSER.FieldByName('PRICE').AsFloat ;
                    TableUSER.Post ;
                    hj := hj+TableUSER.FieldByName('COUNT').AsFloat ;
               end ;
               TableUSER.Next ;
          end ;

          TableUSER.EnableControls ;
          TableUSER.GotoBookmark(BookMark) ;
          TableUSER.FreeBookmark(BookMark) ;
     end ;
end ;

procedure ReFreshTabSheet6 ;
var
   BookMark : TBookMark ;
   i : integer ;
   hj: double ;
begin
     with Dbs do
     begin
          if (not TableUSER.Active) then exit ;
          if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet6) then exit ;

          BookMark := TableUSER.GetBookmark ;
          TableUSER.DisableControls ;

          i := 0 ;
          TableUSER.First ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;
               if (TableUSER.FieldByName('WLP').AsString='T') then
               begin
                    i := 0 ;
                    hj := 0.0 ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsString       := '' ;
                    TableUSER.FieldByName('QUANTITY').AsString := '' ;
                    TableUSER.FieldByName('PRICE').AsString    := '' ;
                    TableUSER.FieldByName('COUNT').AsString    := '' ;
                    TableUSER.Post ;
               end else if (TableUSER.FieldByName('WLP').AsString='B') then
               begin
                    i := 0 ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsString       := '' ;
                    TableUSER.FieldByName('QUANTITY').AsString := '' ;
                    TableUSER.FieldByName('PRICE').AsString    := '' ;
                    TableUSER.FieldByName('COUNT').AsFloat     := hj ;
                    TableUSER.Post ;

                    if (PrjZJ.flag) then
                       PrjZJ.PN[28] := hj ;
               end else
               begin
                    inc(i) ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsInteger := i ;
                    TableUSER.FieldByName('COUNT').AsFloat := TableUSER.FieldByName('QUANTITY').AsFloat*
                                                              TableUSER.FieldByName('PRICE').AsFloat ;
                    TableUSER.Post ;
                    hj := hj+TableUSER.FieldByName('COUNT').AsFloat ;
               end ;
               TableUSER.Next ;
          end ;

          TableUSER.EnableControls ;
          TableUSER.GotoBookmark(BookMark) ;
          TableUSER.FreeBookmark(BookMark) ;
     end ;
end ;

procedure ReFreshTabSheet7 ;
var
   BookMark : TBookMark ;
   i : integer ;
   hj: double ;
begin
     with Dbs do
     begin
          if (not TableUSER.Active) then exit ;
          if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet7) then exit ;

          BookMark := TableUSER.GetBookmark ;
          TableUSER.DisableControls ;

          i := 0 ;
          TableUSER.First ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;
               if (TableUSER.FieldByName('WLP').AsString='T') then
               begin
                    i := 0 ;
                    hj := 0.0 ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsString       := '' ;
                    TableUSER.FieldByName('QUANTITY').AsString := '' ;
                    TableUSER.FieldByName('PRICE').AsString    := '' ;
                    TableUSER.FieldByName('COUNT').AsString    := '' ;
                    TableUSER.Post ;
               end else if (TableUSER.FieldByName('WLP').AsString='B') then
               begin
                    i := 0 ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsString       := '' ;
                    TableUSER.FieldByName('QUANTITY').AsString := '' ;
                    TableUSER.FieldByName('PRICE').AsString    := '' ;
                    TableUSER.FieldByName('COUNT').AsFloat     := hj ;
                    TableUSER.Post ;
                    if (PrjZJ.flag) then
                    begin
                         case TableUSER.FieldByName('NUM').AsInteger of
                         1 :
                             begin
                                  PrjZJ.PN[29] := hj ;
                             end ;
                         2 :
                             begin
                                  PrjZJ.PN[30] := hj ;
                             end ;
                         end ;
                    end ;
               end else
               begin
                    inc(i) ;
                    TableUSER.Edit ;
                    TableUSER.FieldByName('XH').AsInteger := i ;
                    TableUSER.FieldByName('COUNT').AsFloat := TableUSER.FieldByName('QUANTITY').AsFloat*
                                                              TableUSER.FieldByName('PRICE').AsFloat ;
                    TableUSER.Post ;
                    hj := hj+TableUSER.FieldByName('COUNT').AsFloat ;
               end ;
               TableUSER.Next ;
          end ;

          TableUSER.EnableControls ;
          TableUSER.GotoBookmark(BookMark) ;
          TableUSER.FreeBookmark(BookMark) ;
     end ;
end ;

procedure ReFreshTabSheet8 ;
var
   BookMark : TBookMark ;
   i : integer ;
begin
     with Dbs do
     begin
          if (not TableUSER.Active) then exit ;
          if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet8) then exit ;

          BookMark := TableUSER.GetBookmark ;
          TableUSER.DisableControls ;

          TableUSER.First ;
          if (TableUSER.FieldByName('WLP').AsString='FL') then
          begin
               TableUSER.Edit ;
               TableUSER.FieldByName('XH').AsString := '' ;
               TableUSER.Post ;
               TableUSER.Next ;
          end ;

          i := 0 ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;
               if (TableUSER.FieldByName('WLP').AsString<>'FL') then
                  break ;
               inc(i) ;
               TableUSER.Edit ;
               TableUSER.FieldByName('XH').AsInteger := i ;
               TableUSER.Post ;
               TableUSER.Next ;
          end ;
          i := 0 ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;
               if (TableUSER.FieldByName('WLP').AsString<>'P') then
                  break ;
               inc(i) ;
               TableUSER.Edit ;
               TableUSER.FieldByName('XH').AsInteger := i ;
               TableUSER.Post ;
               TableUSER.Next ;
          end ;

          TableUSER.EnableControls ;
          TableUSER.GotoBookmark(BookMark) ;
          TableUSER.FreeBookmark(BookMark) ;
     end ;
end ;

procedure ReFreshTabSheet9 ;
var
   BookMark : TBookMark ;
   i : integer ;
begin
     with Dbs do
     begin
          if (not TableUSER.Active) then exit ;
          if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet9) then exit ;

          BookMark := TableUSER.GetBookmark ;
          TableUSER.DisableControls ;

          i := 0 ;
          TableUSER.First ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;
               inc(i) ;
               TableUSER.Edit ;
               TableUSER.FieldByName('XH').AsInteger := i ;
               TableUSER.Post ;
               TableUSER.Next ;
          end ;

          TableUSER.EnableControls ;
          TableUSER.GotoBookmark(BookMark) ;
          TableUSER.FreeBookmark(BookMark) ;
     end ;
end ;

procedure ClearPrjZJ ;
var
   i : integer ;
begin
     PrjZJ.flag  := FALSE ;
     for i:=1 to MaxArgNum do
     begin
          PrjZJ.PN [i] := 0.0 ;
          PrjZJ.LN [i] := 0.0 ;
     end ;
     PrjZJ.DEZJF := 0.0 ;
     PrjZJ.DERGF := 0.0 ;
     PrjZJ.DERGS := 0.0 ;
     PrjZJ.DECLF := 0.0 ;
     PrjZJ.DEJXF := 0.0 ;
     PrjZJ.DEWJJ := 0.0 ;
     PrjZJ.RGFBC := 0.0 ;
     PrjZJ.CLFBC := 0.0 ;
     PrjZJ.JXFBC := 0.0 ;
     PrjZJ.XXZJF := 0.0 ;
     PrjZJ.XXRGF := 0.0 ;
     PrjZJ.XXCLF := 0.0 ;
     PrjZJ.XXJXF := 0.0 ;


end ;

procedure GetPrjZJ ;
var
   SQLCommand : string ;
   i : integer ;
begin
     ClearPrjZJ ;
     with Dbs do
     begin
          SQLCommand := 'SELECT * FROM "'+PrjHead.FileName+'" WHERE ID="P$$" AND WLP="P"' ;
          QueryUSER.Close ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add (SQLCommand) ;
          QueryUSER.Open ;
          QueryUSER.First ;
          for i:=1 to QueryUSER.RecordCount do
          begin
               if (QueryUSER.EOF) then
                  break ;
               PrjZJ.PN[i] := QueryUSER.FieldByName('PRICE').AsFloat ;
               PrjZJ.PName[i] := QueryUSER.FieldByName('NAME').AsString ;
               QueryUSER.Next ;
          end ;
          QueryUSER.Close ;
     end ;
end ;

procedure WritePrjZJ ;
var
   SQLCommand : string ;
   i : integer ;
begin
     if (PrjZJ.flag=FALSE) then exit ;
     with Dbs do
     begin
          SQLCommand := 'SELECT * FROM "'+PrjHead.FileName+'" WHERE ID="P$$" AND WLP="P"' ;
          QueryUSER.Close ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add (SQLCommand) ;
          QueryUSER.RequestLive := TRUE ;
          QueryUSER.Open ;
          QueryUSER.First ;
          for i:=1 to QueryUSER.RecordCount do
          begin
               if (QueryUSER.EOF) then
                  break ;

               QueryUSER.Edit ;
               QueryUSER.FieldByName('PRICE').AsFloat := PrjZJ.PN[i] ;
               QueryUSER.Post ;

               QueryUSER.Next ;
          end ;
          QueryUSER.Close ;
     end ;
     PrjZJ.Flag := FALSE ;
end ;

procedure CalcTJZJ ;
     procedure CalcDZFY ;
     var
        USERTEMP : TTable ;
        SQLCommand : string ;
        hl : double ;
     begin
          with Dbs do
          begin
               USERTEMP := TTable.Create(MainForm) ;
               USERTEMP.Close ;
               USERTEMP.DatabaseName := 'DBF' ;
               USERTEMP.TableName := 'USERTEMP.DB' ;
               SQLCommand := 'SELECT * FROM"'+PrjHead.FileName+'" WHERE ID="DEZM" AND WLP="FDE"' ;
               QueryUSER.Close ;
               QueryUSER.SQL.Clear ;
               QueryUSER.SQL.Add(SQLCommand) ;
               USERTEMP.BatchMove(QueryUSER, batCopy) ;
               QueryUSER.Close ;
               USERTEMP.Open ;
               USERTEMP.First ;
               while (TRUE) do
               begin
                    if (USERTEMP.EOF) then
                       break ;
                    if (USERTEMP.FieldByName('BS').AsString='换') then
                    begin
                         hl := USERTEMP.FieldByName('QUANTITY').AsFloat ;
                         USERTEMP.Delete ;
                         while (TRUE) do
                         begin
                              if (USERTEMP.EOF) then
                                 break ;
                              if (USERTEMP.FieldByName('ATTRIB').AsString='1') then
                                 break ;
                              USERTEMP.Edit ;
                              USERTEMP.FieldByName('QUANTITY').AsFloat := hl*USERTEMP.FieldByName('QUANTITY').AsFloat ;
                              USERTEMP.Post ;
                              USERTEMP.Next ;
                         end ;
                         continue ;
                    end ;
                    USERTEMP.Next ;
               end ;
               USERTEMP.Close ;
               SQLCommand := 'SELECT DEZC.CODE,DEZC.HL*USERTEMP.QUANTITY HL FROM USERTEMP,DEZC ' ;
               SQLCommand := SQLcommand+'WHERE (USERTEMP.CODE=DEZC.BH)AND(USERTEMP.DEID=DEZC.ID)AND(DEZC.LB="预算")' ;
               QueryUSER.Close ;
               QueryUSER.DatabaseName := 'DBF' ;
               QueryUSER.SQL.Clear ;
               QueryUSER.SQL.Add(SQLCommand) ;
               QueryUSER.Open ;
               QueryUSER.First ;
               USERTEMP.EmptyTable ;
               USERTEMP.Open ;
               while (TRUE) do
               begin
                    if (QueryUSER.EOF) then
                       break ;
                    if (TableDE.FindKey([1,QueryUSER.FieldByName('CODE').AsString])) then
                    begin
                         TableDE.GotoKey ;
                         if (TableDE.FieldByName('BS').AsString='打桩') then
                         begin
                              PrjZJ.PN[6] := PrjZJ.PN[6]+TableDE.FieldByName('DJ').AsFloat*QueryUSER.FieldByName('HL').AsFloat ;
                              PrjZJ.PN[9] := PrjZJ.PN[9]+TableDE.FieldByName('CLF').AsFloat*QueryUSER.FieldByName('HL').AsFloat ;
                              PrjZJ.PN[12]:= PrjZJ.PN[12]+TableDE.FieldByName('JXF').AsFloat*QueryUSER.FieldByName('HL').AsFloat ;
                         end else if (TableDE.FieldByName('BS').AsString='吊装') then
                         begin
                              PrjZJ.PN[7] := PrjZJ.PN[7]+TableDE.FieldByName('DJ').AsFloat*QueryUSER.FieldByName('HL').AsFloat ;
                              PrjZJ.PN[10]:= PrjZJ.PN[10]+TableDE.FieldByName('CLF').AsFloat*QueryUSER.FieldByName('HL').AsFloat ;
                              PrjZJ.PN[13]:= PrjZJ.PN[13]+TableDE.FieldByName('JXF').AsFloat*QueryUSER.FieldByName('HL').AsFloat ;
                         end else
                         begin
                              USERTEMP.Append ;
                              USERTEMP.Edit ;
                              USERTEMP.FieldByName('CODE').AsString := QueryUSER.FieldByName('CODE').AsString ;
                              USERTEMP.FieldByName('QUANTITY').AsFloat := QueryUSER.FieldByName('HL').AsFloat ;
                              USERTEMP.Post ;
                         end ;
                    end ;
                    QueryUSER.Next ;
               end ;
               USERTEMP.Close ;
               SQLCommand := 'SELECT DEZC.CODE,DEZC.HL*USERTEMP.QUANTITY HL FROM USERTEMP,DEZC ' ;
               SQLCommand := SQLcommand+'WHERE (USERTEMP.CODE=DEZC.BH)AND(DEZC.ID=1)AND(DEZC.LB="预算")' ;
               QueryUSER.Close ;
               QueryUSER.DatabaseName := 'DBF' ;
               QueryUSER.SQL.Clear ;
               QueryUSER.SQL.Add(SQLCommand) ;
               QueryUSER.Open ;
               QueryUSER.First ;
               while (TRUE) do
               begin
                    if (QueryUSER.EOF) then
                       break ;
                    if (TableDE.FindKey([1,QueryUSER.FieldByName('CODE').AsString])) then
                    begin
                         TableDE.GotoKey ;
                         if (TableDE.FieldByName('BS').AsString='打桩') then
                         begin
                              PrjZJ.PN[6] := PrjZJ.PN[6]+TableDE.FieldByName('DJ').AsFloat*QueryUSER.FieldByName('HL').AsFloat ;
                              PrjZJ.PN[9] := PrjZJ.PN[9]+TableDE.FieldByName('CLF').AsFloat*QueryUSER.FieldByName('HL').AsFloat ;
                              PrjZJ.PN[12]:= PrjZJ.PN[12]+TableDE.FieldByName('JXF').AsFloat*QueryUSER.FieldByName('HL').AsFloat ;
                         end ;
                         if (TableDE.FieldByName('BS').AsString='吊装') then
                         begin
                              PrjZJ.PN[7] := PrjZJ.PN[7]+TableDE.FieldByName('DJ').AsFloat*QueryUSER.FieldByName('HL').AsFloat ;
                              PrjZJ.PN[10]:= PrjZJ.PN[10]+TableDE.FieldByName('CLF').AsFloat*QueryUSER.FieldByName('HL').AsFloat ;
                              PrjZJ.PN[13]:= PrjZJ.PN[13]+TableDE.FieldByName('JXF').AsFloat*QueryUSER.FieldByName('HL').AsFloat ;
                         end ;
                    end ;
                    QueryUSER.Next ;
               end ;
               QueryUSER.Close ;
               QueryUSER.DatabaseName := 'USER' ;
               USERTEMP.Close ;
               USERTEMP.DeleteTable ;
               USERTEMP.Free ;
          end ;
          PrjZJ.PN[5] := PrjZJ.PN[1]-PrjZJ.PN[6]-PrjZJ.PN[7] ;
          PrjZJ.PN[8] := PrjZJ.PN[3]-PrjZJ.PN[9]-PrjZJ.PN[10] ;
          PrjZJ.PN[11]:= PrjZJ.PN[4]-PrjZJ.PN[12]-PrjZJ.PN[13] ;
     end ;
begin
     MainForm.YSZLPageControl.Visible := FALSE ;
     ClearPrjZJ ;
     PrjZJ.flag := TRUE ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet1 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet1 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet2 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet2 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet3 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet3 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet4 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet4 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet5 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet5 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet6 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet6 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet7 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet7 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet8 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     CalcDZFY ;
     WritePrjZJ ;
     MainForm.YSZLPageControl.Visible := TRUE ;
end ;

procedure CalcZSZJ ;
begin
     MainForm.YSZLPageControl.Visible := FALSE ;
     ClearPrjZJ ;
     PrjZJ.flag := TRUE ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet1 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet1 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet2 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet2 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet3 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet3 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet4 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet4 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet5 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet5 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet6 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet6 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet7 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet7 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet8 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     WritePrjZJ ;
     MainForm.YSZLPageControl.Visible := TRUE ;
end ;

procedure CalcFXZJ ;
begin
     MainForm.YSZLPageControl.Visible := FALSE ;
     ClearPrjZJ ;
     PrjZJ.flag := TRUE ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet1 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet1 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet2 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet2 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet3 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet3 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet4 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet4 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet5 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet5 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet6 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet6 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet7 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet7 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet8 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     WritePrjZJ ;
     MainForm.YSZLPageControl.Visible := TRUE ;
end ;

procedure CalcAZZJ ;
begin
     MainForm.YSZLPageControl.Visible := FALSE ;
     ClearPrjZJ ;
     PrjZJ.flag := TRUE ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet1 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet1 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet2 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet2 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet3 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet3 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet4 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet4 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet5 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet5 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet6 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet6 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet7 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet7 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet8 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     PrjZJ.PN[5] := PrjZJ.DEWJJ ;
     PrjZJ.PN[6] := PrjZJ.CLFBC ;
     PrjZJ.PN[7] := PrjZJ.JXFBC ;
     WritePrjZJ ;
     MainForm.YSZLPageControl.Visible := TRUE ;
end ;

procedure CalcSZZJ ;
begin
     MainForm.YSZLPageControl.Visible := FALSE ;
     ClearPrjZJ ;
     PrjZJ.flag := TRUE ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet1 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet1 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet2 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet2 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet3 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet3 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet4 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet4 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet5 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet5 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet6 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet6 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet7 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet7 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet8 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     PrjZJ.PN[5] := PrjZJ.XXZJF ; 
     PrjZJ.PN[6] := PrjZJ.XXRGF ;
     PrjZJ.PN[7] := PrjZJ.XXCLF ;
     PrjZJ.PN[8] := PrjZJ.XXJXF ;
     WritePrjZJ ;
     MainForm.YSZLPageControl.Visible := TRUE ;
end ;

procedure CalcYLZJ ;
begin
     MainForm.YSZLPageControl.Visible := FALSE ;
     ClearPrjZJ ;
     PrjZJ.flag := TRUE ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet1 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet1 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet2 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet2 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet3 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet3 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet4 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet4 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet5 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet5 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet6 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet6 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet7 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     RefreshTabSheet7 ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet8 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
     PrjZJ.PN[5] := PrjZJ.DEWJJ ;
     WritePrjZJ ;
     MainForm.YSZLPageControl.Visible := TRUE ;
end ;

procedure StartCalc ;
var
   i,n : integer ;
   s0,s1,s2 : string ;
begin
     with ForTranDlg,Dbs do
     begin
          TableUSER.First ;
          if (TableUSER.FieldByName('WLP').AsString<>'FL') then
          begin
               Application.MessageBox( '对不起,您没有选择费率表,请选择!',
                                       pChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
          //initialize FORTRSAN argument
          SInit ;
          //set P1$..P50$
          for i:=1 to MaxArgNum do
          begin
               s0 := 'P'+IntToStr(i) ;
               n := SCheckVarX(s0) ;
               if (n<>$FFFF) then
               begin
                    if (ErrorFlag<>0) then
                       exit ;
                    S_VarXName[n] := s0 ;
                    S_VarXCName[n] := PrjZJ.PName[i] ;
                    S_VarX[n] := PrjZJ.PN[i] ;
               end ;
          end ;
          //calculator
          TableUSER.Next ;
          i := 0 ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;
               if (TableUSER.FieldByName('WLP').AsString<>'FL') then
                  break ;
               inc(i) ;
               S_Calc := TableUSER.FieldByName('GS').AsString ;
               STRans(S_Calc, S_Sobj) ;
               if (ErrorFlag<>0) then
               begin
                    Application.MessageBox( '对不起,计算公式有错误,请检查!',
                                            pChar(AppName),
                                            MB_OK or MB_ICONSTOP ) ;
                    exit ;
               end ;
               SCount (S_SObj, LRESULT) ;
               if (ErrorFlag<>0) then
               begin
                    Application.MessageBox( '对不起,计算过程错误,请检查!',
                                            pChar(AppName),
                                            MB_OK or MB_ICONSTOP ) ;
                    exit ;
               end ;
               TableUSER.Edit ;
               TableUSER.FieldByName('PRICE').AsFloat := LRESULT ;
               TableUSER.Post ;
               //set L1$..L50$
               PrjZJ.LN[i] := LRESULT ;
               s0 := 'L'+IntToStr(i) ;
               n := SCheckVarX(s0) ;
               if (n<>$FFFF) then
               begin
                    if (ErrorFlag<>0) then
                       exit ;
                    S_VarXName[n] := s0 ;
                    S_VarX[n] := PrjZJ.LN[i] ;
               end ;
               s0 := TableUSER.FieldByName('BZ').AsString ;
               if (s0='') then
               begin
                    SObjS (S_SObj, s0) ;
               end ;
               TableUSER.Edit ;
               TableUSER.FieldByName('NAME').AsString := s0 ;
               TableUSER.Post ;
               TableUSER.Next ;
          end ;

     end ;
end ;

procedure CalcPrjZJ ;
begin
     GetPrjZJ ;
     if (PrjZJ.PN[1]>0.0) then
     begin
          if (Application.MessageBox( '费用已经存在,是否重新计算?',
                                      pChar(AppName),
                                      MB_OKCANCEL or MB_ICONQUESTION )=IDOK) then
          begin
               case PrjHead.GclbId of
               1 : CalcTJZJ ;
               2 : CalcZSZJ ;
               3 : CalcFXZJ ;
               4 : CalcAZZJ ;
               5 : CalcSZZJ ;
               6 : CalcYLZJ ;
               end ;
          end ;
     end else
     begin
          case PrjHead.GclbId of
          1 : CalcTJZJ ;
          2 : CalcZSZJ ;
          3 : CalcFXZJ ;
          4 : CalcAZZJ ;
          5 : CalcSZZJ ;
          6 : CalcYLZJ ;
          end ;
     end ;
     StartCalc ;
     PrjHead.GCZJ := ForTranDlg.LRESULT ;
end ;

end.

