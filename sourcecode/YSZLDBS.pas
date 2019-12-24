unit YSZLDBS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, DECZ, IBCtrls;

type
  TDbs = class(TDataModule)
    SysDatabase: TDatabase;
    TableINSTALL: TTable;
    TableXMT: TTable;
    TableFXGC: TTable;
    TableDWGC: TTable;
    TableDEZY: TTable;
    TableGSMC: TTable;
    TableXM: TTable;
    TableJGLX: TTable;
    TableJCXS: TTable;
    TableJZTZ: TTable;
    TableGCLB: TTable;
    TableGSMCMC: TStringField;
    TableXMMC: TStringField;
    TableJGLXMC: TStringField;
    TableJCXSMC: TStringField;
    TableJZTZMC: TStringField;
    TableGCLBMC: TStringField;
    TableDWGCXMTID: TSmallintField;
    TableDWGCFXGCID: TSmallintField;
    TableDWGCDWGCID: TSmallintField;
    TableDWGCGCMC: TStringField;
    TableDWGCZYLBID: TSmallintField;
    TableDWGCZYLB: TStringField;
    TableDWGCBZR: TStringField;
    TableDWGCBZRQ: TDateField;
    TableFXGCXMTID: TSmallintField;
    TableFXGCFXGCID: TSmallintField;
    TableFXGCGCMC: TStringField;
    TableFXGCDWA: TStringField;
    TableFXGCDWB: TStringField;
    TableFXGCDWC: TStringField;
    TableFXGCJGLX: TStringField;
    TableFXGCJCXS: TStringField;
    TableFXGCJZTZ: TStringField;
    TableFXGCGCLB: TStringField;
    TableFXGCJZMJ: TFloatField;
    TableFXGCGCZJ: TFloatField;
    TableFXGCSCG: TFloatField;
    TableFXGCBZCG: TFloatField;
    TableFXGCPMZJ: TFloatField;
    TableFXGCYG: TFloatField;
    TableFXGCBZR: TStringField;
    TableFXGCJHR: TStringField;
    TableFXGCSHR: TStringField;
    TableFXGCBZRQ: TDateField;
    TableDWGCFNAME: TStringField;
    TableUSER: TTable;
    UserDatabase: TDatabase;
    DeDatabase: TDatabase;
    TableSysDICT: TTable;
    TableSysDICTFILENAME: TStringField;
    TableSysDICTFIELDNAME: TStringField;
    TableSysDICTFIELDTYPE: TIntegerField;
    TableSysDICTFIELDSIZE: TSmallintField;
    TableSysDICTINDEXFLAG: TBooleanField;
    TableSysDICTFIELDLABEL: TStringField;
    TableSysDICTDISPFORMAT: TStringField;
    TableSysDICTDISPLENGTH: TSmallintField;
    DataSourceTEMP: TDataSource;
    DataSourceUSER: TDataSource;
    TableTEMP: TTable;
    QueryUSER: TQuery;
    TableINSTALLID: TSmallintField;
    TableINSTALLITEMNAME: TStringField;
    TableXMTXMTID: TSmallintField;
    TableXMTXMTMC: TStringField;
    TableXMTJSDW: TStringField;
    TableXMTGCDD: TStringField;
    TableXMTXMJL: TStringField;
    TableXMTLXRQ: TDateField;
    TableDEZYZYLBID: TSmallintField;
    TableDEZYZYLB: TStringField;
    TableDEZYPRJMODL: TStringField;
    RuleDatabase: TDatabase;
    ZZJDatabase: TDatabase;
    XXJDatabase: TDatabase;
    TableCODE: TTable;
    TableCODEFX: TTable;
    TableDE: TTable;
    TableDEZC: TTable;
    TableDEFX: TTable;
    TableCODEID: TSmallintField;
    TableCODECODE: TStringField;
    TableCODEMC: TStringField;
    TableCODEDW: TStringField;
    TableCODEDEJ: TFloatField;
    TableCODEBS: TSmallintField;
    TableCODELB1: TStringField;
    TableCODELB2: TStringField;
    TableCODELB3: TStringField;
    TableCODEFL: TStringField;
    TableCODEFLCODE: TStringField;
    TableCODEISMAIN: TBooleanField;
    TableCODEFXID: TSmallintField;
    TableCODEFXBH: TStringField;
    TableCODEFXCODE: TStringField;
    TableCODEFXHL: TFloatField;
    TableCODEFXLB: TStringField;
    TableCODEFXFL: TStringField;
    TableCODEFXFLCODE: TStringField;
    TableDEID: TSmallintField;
    TableDEBH: TStringField;
    TableDEMC: TStringField;
    TableDEDW: TStringField;
    TableDEDJ: TFloatField;
    TableDERGF: TFloatField;
    TableDECLF: TFloatField;
    TableDEJXF: TFloatField;
    TableDERGS: TFloatField;
    TableDEGZDJ: TStringField;
    TableDEBS: TStringField;
    TableDEDEMC: TStringField;
    TableDECODEID: TSmallintField;
    TableDEBH1: TStringField;
    TableDEMC1: TStringField;
    TableDEP1: TFloatField;
    TableDEP2: TFloatField;
    TableDEP3: TFloatField;
    TableDEP4: TFloatField;
    TableDEP5: TFloatField;
    TableDEZCID: TSmallintField;
    TableDEZCBH: TStringField;
    TableDEZCCODE: TStringField;
    TableDEZCHL: TFloatField;
    TableDEZCLB: TStringField;
    TableDEFXID: TSmallintField;
    TableDEFXBH: TStringField;
    TableDEFXCODE: TStringField;
    TableDEFXHL: TFloatField;
    TableDEFXLB: TStringField;
    TableDEFXFL: TStringField;
    TableDEFXFLCODE: TStringField;
    TableCLLB: TTable;
    TableGZ: TTable;
    TableCLLBID: TStringField;
    TableCLLBCODE: TStringField;
    TableCLLBMC: TStringField;
    TableCLLBPX: TStringField;
    TableGZDJ: TStringField;
    TableGZGZ: TFloatField;
    TableJX: TTable;
    TableJXCODE: TStringField;
    TableJXDJ: TFloatField;
    TableDOT: TTable;
    DOTDatabase: TDatabase;
    TableDOTFLAG: TBooleanField;
    TableDOTID: TStringField;
    TableDOTNUM: TSmallintField;
    TableDOTWLP: TStringField;
    TableDOTXH: TSmallintField;
    TableDOTCODE: TStringField;
    TableDOTATTRIB: TStringField;
    TableDOTNAME: TStringField;
    TableDOTUNIT: TStringField;
    TableDOTGS: TStringField;
    TableDOTQUANTITY: TFloatField;
    TableDOTPRICE: TFloatField;
    TableDOTLABFEE: TFloatField;
    TableDOTLPD: TFloatField;
    TableDOTMTRLFEE: TFloatField;
    TableDOTMCHNFEE: TFloatField;
    TableDOTCOUNT: TFloatField;
    TableDOTLABCOUNT: TFloatField;
    TableDOTLPDCOUNT: TFloatField;
    TableDOTMTRCOUNT: TFloatField;
    TableDOTMCHCOUNT: TFloatField;
    TableDOTZCC: TFloatField;
    TableDOTLABBC: TFloatField;
    TableDOTLPDBC: TFloatField;
    TableDOTMTRBC: TFloatField;
    TableDOTMCHBC: TFloatField;
    TableDOTP1: TFloatField;
    TableDOTP2: TFloatField;
    TableDOTP3: TFloatField;
    TableDOTP4: TFloatField;
    TableDOTP5: TFloatField;
    TableDOTSPRICE: TFloatField;
    TableDOTSLABFEE: TFloatField;
    TableDOTSLPD: TFloatField;
    TableDOTSMTRLFEE: TFloatField;
    TableDOTSMCHNFEE: TFloatField;
    TableDOTSCOUNT: TFloatField;
    TableDOTSLABCOUNT: TFloatField;
    TableDOTSLPDCOUNT: TFloatField;
    TableDOTSMTRCOUNT: TFloatField;
    TableDOTSMCHCOUNT: TFloatField;
    TableDOTSZCC: TFloatField;
    TableDOTSLABBC: TFloatField;
    TableDOTSLPDBC: TFloatField;
    TableDOTSMTRBC: TFloatField;
    TableDOTSMCHBC: TFloatField;
    TableDOTSP1: TFloatField;
    TableDOTSP2: TFloatField;
    TableDOTSP3: TFloatField;
    TableDOTSP4: TFloatField;
    TableDOTSP5: TFloatField;
    TableDOTBZ: TStringField;
    TableDOTBS: TStringField;
    TableDOTDEID: TSmallintField;
    TableDOTDEMC: TStringField;
    TableDOTCODEID: TSmallintField;
    TableUSERFLAG: TBooleanField;
    TableUSERID: TStringField;
    TableUSERNUM: TSmallintField;
    TableUSERWLP: TStringField;
    TableUSERXH: TSmallintField;
    TableUSERCODE: TStringField;
    TableUSERATTRIB: TStringField;
    TableUSERNAME: TStringField;
    TableUSERUNIT: TStringField;
    TableUSERGS: TStringField;
    TableUSERQUANTITY: TFloatField;
    TableUSERPRICE: TFloatField;
    TableUSERLABFEE: TFloatField;
    TableUSERLPD: TFloatField;
    TableUSERMTRLFEE: TFloatField;
    TableUSERMCHNFEE: TFloatField;
    TableUSERCOUNT: TFloatField;
    TableUSERLABCOUNT: TFloatField;
    TableUSERLPDCOUNT: TFloatField;
    TableUSERMTRCOUNT: TFloatField;
    TableUSERMCHCOUNT: TFloatField;
    TableUSERZCC: TFloatField;
    TableUSERLABBC: TFloatField;
    TableUSERLPDBC: TFloatField;
    TableUSERMTRBC: TFloatField;
    TableUSERMCHBC: TFloatField;
    TableUSERP1: TFloatField;
    TableUSERP2: TFloatField;
    TableUSERP3: TFloatField;
    TableUSERP4: TFloatField;
    TableUSERP5: TFloatField;
    TableUSERSPRICE: TFloatField;
    TableUSERSLABFEE: TFloatField;
    TableUSERSLPD: TFloatField;
    TableUSERSMTRLFEE: TFloatField;
    TableUSERSMCHNFEE: TFloatField;
    TableUSERSCOUNT: TFloatField;
    TableUSERSLABCOUNT: TFloatField;
    TableUSERSLPDCOUNT: TFloatField;
    TableUSERSMTRCOUNT: TFloatField;
    TableUSERSMCHCOUNT: TFloatField;
    TableUSERSZCC: TFloatField;
    TableUSERSLABBC: TFloatField;
    TableUSERSLPDBC: TFloatField;
    TableUSERSMTRBC: TFloatField;
    TableUSERSMCHBC: TFloatField;
    TableUSERSP1: TFloatField;
    TableUSERSP2: TFloatField;
    TableUSERSP3: TFloatField;
    TableUSERSP4: TFloatField;
    TableUSERSP5: TFloatField;
    TableUSERBZ: TStringField;
    TableUSERBS: TStringField;
    TableUSERDEID: TSmallintField;
    TableUSERDEMC: TStringField;
    TableUSERCODEID: TSmallintField;
    QueryHS: TQuery;
    QueryBlock: TQuery;
    TableINSTALLDEMC: TStringField;
    TableCLID: TTable;
    TableCLIDID: TSmallintField;
    TableCLIDCODEMC: TStringField;
    TableSPT: TTable;
    TableSPTFS: TStringField;
    TableSPTID: TSmallintField;
    TableSPTCODE: TStringField;
    TableSPTSPTCODE: TStringField;
    TableSPTDEID: TSmallintField;
    TableSPTBH: TStringField;
    TableJXID: TSmallintField;

    function  FieldTypeName(i:integer):string ;
    procedure CleaningTableUSER ;
    procedure CreateSysDict ;
    procedure ClearAllXmtSj ;
    procedure CreateNewDwgc(FName:string;ZYLBID:ShortInt);
    procedure DbsCreate(Sender: TObject);
    procedure DbsDestroy(Sender: TObject);
    procedure TableUSERCODESetText(Sender: TField; const Text: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dbs: TDbs;

implementation
uses main, Wait, FORTRAN ;
{$R *.DFM}

function TDbs.FieldTypeName(i:integer):string ;
begin
     case TFieldType(ord(i)) of
     ftUnknown:     result:='未知型' ;
     ftString:      result:='字符串型' ;
     ftSmallint:    result:='16位整型' ;
     ftInteger:     result:='32位整型' ;
     ftWord:        result:='无符号16位整型' ;
     ftBoolean:     result:='逻辑型' ;
     ftFloat:       result:='浮点类型' ;
     ftCurrency:    result:='货币类型' ;
     ftBCD:         result:='BCD类型' ;
     ftDate:        result:='日期类型' ;
     ftTime:        result:='时间类型' ;
     ftDateTime:    result:='日期时间类型' ;
     ftBytes:       result:='字节类型' ;
     ftVarBytes:    result:='可变字节类型' ;
     ftAutoInc:     result:='自动增加类型' ;
     ftBlob:        result:='未知类型' ;
     ftMemo:        result:='备注类型' ;
     ftGraphic:     result:='图形类型' ;
     ftFmtMemo:     result:='格式化备注类型' ;
     ftParadoxOle:  result:='Paradox-OLE类型' ;
     ftDBaseOle:    result:='DBase-OLE类型' ;
     ftTypedBinary: result:='二进制类型' ;
     ftCursor:      result:='游标类型' ;
     end ;
end ;

procedure TDbs.CleaningTableUSER ;
var
   SQLCommand : string ;
begin
     //cleaning all empty record
     if (PrjHead.FileName='') then exit ;
     QueryUSER.Close ;
     SQLCommand := 'DELETE FROM "'+PrjHead.FileName+'" WHERE ID=""' ;
     QueryUSER.SQL.Clear ;
     QueryUSER.SQL.Add (SQLCommand) ;
     QueryUSER.ExecSQL ;
     QueryUSER.Close ;
end ;

procedure TDbs.CreateSysDict ;
var
   i,j: integer ;
   TableList : TStringList ;
begin
     //Justify if Sysdatabase is active
     if (SysDatabase.Connected=FALSE) then
     begin
          Application.MessageBox ( '对不起，没有打开的数据库！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP) ;
          exit ;
     end ;

     WaitDlg.Show ;
     WaitDlg.Update ;
     TableTEMP.Filtered := FALSE ;
     TableTEMP.Filter := '' ;
     //Create new dictionary dbf
     try
        TableSysDICT.RenameTable ('DICTTEMP.DB') ;
     except
           TableTEMP.TableName := 'DICTTEMP.DB' ;
           TableTEMP.DeleteTable ;
           TableSysDICT.RenameTable ('DICTTEMP.DB') ;
     end ;
     if (TableSysDICT.Active) then TableSysDICT.Close ;
     TableSysDICT.TableName := 'DICT.DB' ;
     TableSysDICT.CreateTable ;
     TableSysDICT.AddIndex('', 'FILENAME;FIELDNAME', [ixPrimary]) ;
     TableSysDICT.Open ;
     //Get all tablefile of SysDatabase
     TableList := TStringList.Create ;
     Session.GetTableNames(SysDatabase.DatabaseName, '', True, False, TableList);
     for i:=0 to TableList.Count-1 do
     begin
          TableTEMP.Close ;
          TableTEMP.TableName := TableList.Strings[i] ;

          if (TableTEMP.TableName='') then
             continue ;
          if (UpperCase(TableTEMP.TableName)='DICTTEMP.DB') then
             continue ;

          TableTEMP.Open ;
          for j:=0 to TableTEMP.FieldCount-1 do
          begin
               TableSysDICT.AppendRecord ([ UpperCase(TableTEMP.TableName),
                                         TableTEMP.Fields[j].FieldName,
                                         ord(TableTEMP.Fields[j].DataType),
                                         TableTEMP.Fields[j].DataSize,
                                         TableTEMP.Fields[j].IsIndexField
                                       ]);
          end ;

          TableTEMP.Close ;
     end ;
     TableList.Free ;
     TableSysDICT.Close ;
     TableTEMP.TableName := 'DICTTEMP.DB' ;
     TableTEMP.Open ;
     TableSysDICT.Open ;
     while (TRUE) do
     begin
          if (TableSysDICT.Eof) then
             break ;
          if (TableTEMP.FindKey([TableSysDICTFILENAME.Value,TableSysDICTFIELDNAME.Value])) then
          begin
               TableSysDICT.Edit ;
               TableSysDICTFIELDLABEL.AsString := TableTEMP.FieldByName('FIELDLABEL').AsString ;
               if (TFieldType(ord(TableSysDICTFIELDTYPE.Value))=ftFloat) then
               begin
                    TableSysDICTDISPFORMAT.Value := '0.00' ;
                    TableSysDICTDISPLENGTH.Value := 64 ;
               end else if ((TFieldType(ord(TableSysDICTFIELDTYPE.Value))=ftInteger) or
                            (TFieldType(ord(TableSysDICTFIELDTYPE.Value))=ftSmallInt)) then
               begin
                    TableSysDICTDISPFORMAT.Value := '0' ;
                    TableSysDICTDISPLENGTH.Value := 64 ;
               end else if (TFieldType(ord(TableSysDICTFIELDTYPE.Value))=ftString) then
               begin
                    TableSysDICTDISPFORMAT.Value := '' ;
                    TableSysDICTDISPLENGTH.Value := 8*TableSysDICTFIELDSIZE.Value ;
                    if (TableSysDICTFIELDSIZE.AsInteger>20) then
                       TableSysDICTDISPLENGTH.Value := 8*20 ;
               end else
               begin
                    TableSysDICTDISPFORMAT.Value := '' ;
                    TableSysDICTDISPLENGTH.Value := 64 ;
               end ;
               TableSysDICT.Post ;
          end ;
          TableSysDICT.Next ;
     end ;
     TableSysDICT.Close ;
     TableTEMP.Close ;
     TableTEMP.DeleteTable ;
     WaitDlg.Hide ;
end ;

procedure TDbs.ClearAllXmtSj ;
var
   i : integer ;
   TableList : TStringList ;
   OldOpenFlag : boolean ;
   OldFname : string ;
   OldFiltered : boolean ;
   OldFilter : string ;
begin
     //get tableuser property
     if (TableUSER.Active) then
     begin
          OldOpenFlag := TableUSER.Active ;
          OldFname    := TableUSER.TableName ;
          OldFiltered := TableUSER.Filtered ;
          OldFilter   := TableUSER.Filter ;
          if (pos('.',OldFname)<>0) then OldFname := copy(OldFname,1,pos('.',OldFname)-1) ;
     end else
     begin
          OldOpenFlag := FALSE ;
          OldFname    := '' ;
          OldFiltered := FALSE ;
          OldFilter   := '' ;
     end ;

     //Clear all data
     TableUSER.Close ;
     TableXMT.Close ;
     TableFXGC.Close ;
     TableDWGC.Close ;
     TableXMT.EmptyTable ;
     TableFXGC.EmptyTable ;
     TableDWGC.EmptyTable ;
     TableList := TstringList.Create ;
     Session.GetTableNames(UserDatabase.DatabaseName,'',FALSE,FALSE,TableList) ;
     for i:=0 to TableList.Count-1 do
     begin
          if (OldFname=TableList.Strings[i]) then continue ;
          TableUSER.TableName := TableList.Strings[i] ;
          TableUSER.DeleteTable ;
     end ;
     TableXMT.Open ;
     TableFXGC.Open ;
     TableDWGC.Open ;
     TableList.Free ;

     //restoer tableuser property
     if (OldOpenFlag) then
     begin
          if (OldFname<>'') then
          begin
               TableUSER.TableName := OldFname ;
               TableUSER.Filtered  := OldFiltered ;
               TableUSER.Filter    := OldFilter ;
               TableUSER.Active    := OldOpenFlag ;
          end ;
     end ;
end ;

procedure TDbs.CreateNewDwgc(FName:string;ZYLBID:ShortInt) ;
var
   i,j : integer ;
   TableList : TstringList ;
   DOTFile : string ;
begin
     //check FNAME
     if (pos('.',FName)<>0) then copy(FName,1,pos('.',FName)-1) ;
     //get all table file and find if this table file is exist
     TableList := TstringList.Create ;
     Session.GetTableNames(UserDatabase.DatabaseName,'',FALSE,FALSE,TableList) ;
     //auto-create a befit table
     if (TableList.IndexOf(FName)<>-1) then
     begin
          i := -1 ;
          while (TRUE) do
          begin
               i := i+1 ;
               if (TableList.IndexOf(FName+IntToStr(i))=-1) then
               begin
                    FName := FName+IntToStr(i) ;
                    break ;
               end ;
          end ;
     end ;
     TableList.Free ;
     //create new file
     if (TableUSER.Active) then TableUSER.Close ;
     TableUSER.DatabaseName := 'USER' ;
     TableUSER.TableName := FName ;
     TableUSER.CreateTable ;
     //Copy default DWGC order by DEZYLBID
     if (TableDEZY.Active=FALSE) then TableDEZY.Open ;
     if (TableDEZY.FindKey([ZYLBID])) then
     begin
          DOTFile := TableDEZYPRJMODL.Value ;
          if (DOTFile<>'') then
          begin
               DotFile := TableDEZYPRJMODL.Value ;
               TableDOT.Close ;
               TableDOT.TableName := DOTFile ;
               TableUSER.BatchMove (TableDOT,batAppend) ;
          end ;
     end ;
     //a few statement
     TableUSER.Open ;
     TableUSER.Last ;
     TableUSER.Edit ;
     TableUSER.FieldByName('NAME').AsString := DateToStr(Date) ;
     TableUSER.Post ;
     TableUSER.Close ;
end ;

procedure TDbs.DbsCreate(Sender: TObject);
var
   path : string ;
begin
     //Get current directory
     GetDir(0,path) ;
     //initialize SysDatabase
     SysDatabase.Close ;
     SysDatabase.Params.Clear ;
     SysDatabase.Params.Add('PATH='+path+'\SYSTEM') ;
     SysDatabase.Open ;
     TableINSTALL.Open ;
     TableXMT.Open ;
     TableFXGC.Open ;
     TableDWGC.Open ;
     TableDEZY.Open ;
     TableGSMC.Open ;
     TableXM.Open ;
     TableJGLX.Open ;
     TableJCXS.Open ;
     TableJZTZ.Open ;
     TableGCLB.Open ;
     //initialize UserDatabase
     UserDatabase.Close ;
     UserDatabase.Params.Clear ;
     UserDatabase.Params.Add('PATH='+path+'\USER') ;
     UserDatabase.Open ;
     TableUSER.Close ;
     //initialize DEDatabase
     DEDatabase.Close ;
     DEDatabase.Params.Clear ;
     DEDatabase.Params.Add('PATH='+path+'\DBF') ;
     DEDatabase.Open ;
     TableCODE.Open ;
     TableCODEFX.Open ;
     TableDE.Open ;
     TableDEZC.Open ;
     TableDEFX.Open ;
     TableCLLB.Open ;
     TableCLID.Open ;
     TableGZ.Open ;
     TableJX.Open ;
     TableSPT.Open ;     
     //initialize RULEDatabase
     RuleDatabase.Close ;
     RuleDatabase.Params.Clear ;
     RuleDatabase.Params.Add('PATH='+path+'\RULE') ;
     RuleDatabase.Open ;
     //initialize ZZJDatabase
     ZZJDatabase.Close ;
     ZZJDatabase.Params.Clear ;
     ZZJDatabase.Params.Add('PATH='+path+'\ZZJ') ;
     ZZJDatabase.Open ;
     //initialize XXJDatabase
     XXJDatabase.Close ;
     XXJDatabase.Params.Clear ;
     XXJDatabase.Params.Add('PATH='+path+'\XXJ') ;
     XXJDatabase.Open ;
     //initialize DOTDatabase
     DOTDatabase.Close ;
     DOTDatabase.Params.Clear ;
     DOTDatabase.Params.Add('PATH='+path+'\DOT') ;
     DOTDatabase.Open ;
end;

procedure TDbs.DbsDestroy(Sender: TObject);
begin
     SysDatabase.Close ;
     UserDatabase.Close ;
     DeDatabase.Close ;
     RuleDatabase.Close ;
     ZZJDatabase.Close ;
     XXJDatabase.Close ;
     DOTDatabase.Close ;
end;

procedure TDbs.TableUSERCODESetText(Sender: TField; const Text: String);
begin
     EditBuffer := Text ;
     TableUSER.Cancel ;
     if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet1) then
     begin
          try
             TableUSER.Edit ;
             TableUSER.FieldByName('CODE').AsString := EditBuffer ;
             TableUSER.Post ;
          except
          end ;
     end ;
end;

end.

