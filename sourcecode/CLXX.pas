unit CLXX;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, DBTables, DB, Grids, DBGrids, Mask, DBCtrls,
  SysUtils, DECZ ;

type
  TCLXXDlg = class(TForm)
    QuitBitBtn: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit7: TDBEdit;
    Label3: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    Label7: TLabel;
    Bevel3: TBevel;
    DBGridCLFX: TDBGrid;
    CLFXTEMP: TTable;
    DataSourceCLFX: TDataSource;
    CLFXTEMPID: TSmallintField;
    CLFXTEMPBH: TStringField;
    CLFXTEMPCODE: TStringField;
    CLFXTEMPHL: TFloatField;
    CLFXTEMPLB: TStringField;
    CLFXTEMPFL: TStringField;
    CLFXTEMPFLCODE: TStringField;
    CLFXTEMPMC: TStringField;
    CLFXTEMPDW: TStringField;
    CLFXTEMPDJ: TFloatField;
    QueryTEMP: TQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuitBitBtnClick(Sender: TObject);
    procedure CLFXTEMPCalcFields(DataSet: TDataSet);
    procedure DBEdit10DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID : smallint ;
    BH : string[16] ;
    BS : smallint ;
  end;

var
  CLXXDlg : TCLXXDlg;

implementation
uses MAIN, YSZLDBS, CLQUERY, SCL ;
{$R *.DFM}

procedure TCLXXDlg.FormShow(Sender: TObject);
begin
     CheckBox1.Checked := TRUE ;

     ID := CLQueryDlg.TableCL.FieldByName('ID').AsInteger ;
     BH := CLQueryDlg.TableCL.FieldByName('CODE').AsString ;
     BS := CLQueryDlg.TableCL.FieldByName('BS').AsInteger ;

     QueryTEMP.Close ;
     QueryTEMP.SQL.Clear ;
     QueryTEMP.SQL.Add ( 'SELECT * FROM CODEFX WHERE ID='+IntToStr(ID)+' AND BH="'+BH+'"' ) ;

     CLFXTEMP.Close ;
     CLFXTEMP.TableName := 'CLFXTEMP.DB' ;
     CLFXTEMP.BatchMove ( QueryTEMP, batCopy ) ;
     CLFXTEMP.Open ;
end;

procedure TCLXXDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryTEMP.Close ;
     CLFXTEMP.Close ;
     CLFXTEMP.DeleteTable ;
end;

procedure TCLXXDlg.QuitBitBtnClick(Sender: TObject);
begin
     if (CLQueryDlg.TableCL.State=dsEdit) then
        CLQueryDlg.TableCL.Post ;
     Self.Close ;
end;

procedure TCLXXDlg.CLFXTEMPCalcFields(DataSet: TDataSet);
var
   CODE : string[16] ;
begin
     with Dbs do
     begin
          CODE := CLFXTEMP.FieldByName('CODE').AsString ;
          if (TableCODE.FindKey([ID, CODE])) then
          begin
               CLFXTEMP.FieldByName('MC').AsString := TableCODE.FieldByName('MC').AsString ;
               CLFXTEMP.FieldByName('DW').AsString := TableCODE.FieldByName('DW').AsString ;
               CLFXTEMP.FieldByName('DJ').AsFloat  := TableCODE.FieldByName('DEJ').AsFloat ;
          end ;
     end ;
end;

procedure TCLXXDlg.DBEdit10DblClick(Sender: TObject);
begin
     if (CLQUERYDlg.TableCL.FieldByName('ISMAIN').AsBoolean=TRUE) then
     begin
          CLQUERYDlg.TableCL.Edit ;
          CLQUERYDlg.TableCL.FieldByName('ISMAIN').AsBoolean := FALSE ;
          CLQUERYDlg.TableCL.Post ;
     end else
     begin
          CLQUERYDlg.TableCL.Edit ;
          CLQUERYDlg.TableCL.FieldByName('ISMAIN').AsBoolean := TRUE ;
          CLQUERYDlg.TableCL.Post ;
     end ;
end;

procedure TCLXXDlg.BitBtn1Click(Sender: TObject);
begin
     SCLDlg.Tag := 2 ;
     SCLDlg.ShowModal ;
end;

procedure TCLXXDlg.BitBtn2Click(Sender: TObject);
begin
     if (Application.MessageBox( '您真的删除当前子目吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     CLFXTEMP.Delete ;
end;

procedure TCLXXDlg.BitBtn4Click(Sender: TObject);
begin
     if (Application.MessageBox( '将要刷新材料库,继续吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;

     QueryTEMP.Close ;
     QueryTEMP.SQL.Clear ;
     QueryTEMP.SQL.Add ( 'DELETE FROM CODEFX WHERE ID='+IntToStr(ID)+' AND BH="'+BH+'"' ) ;
     QueryTEMP.ExecSQL ;
     QueryTEMP.Close ;

     if (CLFXTEMP.RecordCount<>0) then
        Dbs.TableCODEFX.BatchMove (CLFXTEMP, batAppendUpdate) ; 
end;

procedure TCLXXDlg.BitBtn3Click(Sender: TObject);
var
   dj : double ;
begin
     if (CLFXTEMP.RecordCount<>0) then
     begin
          dj := 0.0 ;
          CLFXTEMP.DisableControls ;
          CLFXTEMP.First ;
          while (TRUE) do
          begin
               if (CLFXTEMP.EOF) then
                  break ;
               dj := dj+CLFXTEMP.FieldByName('HL').AsFloat*CLFXTEMP.FieldByName('DJ').AsFloat ;
               CLFXTEMP.Next ;
          end ;
          CLFXTEMP.EnableControls ;
          CLFXTEMP.First ;

          if (not CheckBox1.Checked) then
          begin
               case BS of
               1 : ;
               2 : ;
               3 : dj := dj/2 ;
               end ;
          end else
          begin
               case BS of
               1 : dj := Round(dj*100)/100 ;
               2 : dj := Round(dj*100)/100 ;
               3 : dj := Round(dj*100/2)/100 ;
               end ;
          end ;
          CLQUERYDlg.TableCL.Edit ;
          CLQUERYDlg.TableCL.FieldByName('DEJ').AsFloat := dj ;
          CLQUERYDlg.TableCL.Post ;
     end ;
end;

end.
