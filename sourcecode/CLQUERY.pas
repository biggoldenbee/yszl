unit CLQUERY;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Db, Grids, DBGrids, DBTables, Mask, DBCtrls, DECZ,
  ComCtrls, Tabs;

type
  TCLQueryDlg = class(TForm)
    DataSourceCL: TDataSource;
    TableCL: TTable;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    QuitBitBtn: TBitBtn;
    BitBtn4: TBitBtn;
    TabControlCL: TTabControl;
    Bevel1: TBevel;
    Label14: TLabel;
    EditBH: TEdit;
    Label15: TLabel;
    EditMC: TEdit;
    TableCLID: TSmallintField;
    TableCLCODE: TStringField;
    TableCLMC: TStringField;
    TableCLDW: TStringField;
    TableCLDEJ: TFloatField;
    TableCLBS: TSmallintField;
    TableCLLB1: TStringField;
    TableCLLB2: TStringField;
    TableCLLB3: TStringField;
    TableCLFL: TStringField;
    TableCLFLCODE: TStringField;
    TableCLISMAIN: TBooleanField;
    DBGridCL: TDBGrid;
    CheckBoxWrite: TCheckBox;
    TabSetCL: TTabSet;

    procedure RewriteCLDW ;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditBHKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuitBitBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure TabControlCLChange(Sender: TObject);
    procedure EditMCKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBoxWriteClick(Sender: TObject);
    procedure TabSetCLClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    CLID : smallint ;
    BS : smallint ;
    SCOM : string ;
  end;

var
  CLQueryDlg: TCLQueryDlg;

implementation
{$R *.DFM}
uses MAIN, YSZLDBS, ADDCL, CLXX;

procedure TCLQueryDlg.FormShow(Sender: TObject);
begin
     EditBH.Text := '' ;
     EditMC.Text := '' ;
     CheckBoxWrite.Checked := TRUE ;
     DBGridCL.ReadOnly := CheckBoxWrite.Checked ;

     TableCL.Close ;
     TableCL.Filter := '' ;
     TableCL.Filtered := FALSE ;

     TabControlCL.Tabs.Clear ;
     with Dbs do
     begin
          TableCLID.First ;
          while (TRUE) do
          begin
               if (TableCLID.EOF) then
                  break ;
               TabControlCL.Tabs.Add (TableCLID.FieldByName('CODEMC').AsString) ;
               TableCLID.Next ;
          end ;
     end ;
     CLID := -1 ;
     BS := -1 ;
     TabSetCL.TabIndex := 0 ;
     TabControlCL.TabIndex := 0 ;
     TabControlCLChange(TabControlCL);
end;

procedure TCLQueryDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TableCL.Close ;
     TableCL.Filter := '' ;
     TableCL.Filtered := FALSE ;
     TabControlCL.Tabs.Clear ;
end;

procedure TCLQueryDlg.EditBHKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (not TableCL.Active) then
        exit ;
     case Key of
     VK_RETURN :
                 begin
                      if (TableCL.FindKey([CLID,EditBH.Text])) then
                         TableCL.GotoKey
                      else
                          TableCL.FindNearest([CLID,EditBH.Text]) ;
                 end ;
     end ;
end;

procedure TCLQueryDlg.EditMCKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   BookMark : TBookMark ;
begin
     if (not TableCL.Active) then
        exit ;
     case Key of
     VK_RETURN :
                 begin
                      if (EditMC.Text='') then exit ;
                      BookMark := TableCL.GetBookmark ;
                      TableCL.DisableControls ;
                      if (Pos(EditMC.Text, TableCL.FieldByName('MC').AsString)=0) then
                         TableCL.First
                      else
                          TableCL.Next ;
                      while (TRUE) do
                      begin
                           if (TableCL.EOF) then
                              break ;
                           if (Pos(EditMC.Text, TableCL.FieldByName('MC').AsString)>0) then
                           begin
                                TableCL.FreeBookmark (BookMark) ;
                                TableCL.EnableControls ;
                                exit ;
                           end ;
                           TableCL.Next ;
                      end ;
                      TableCL.GotoBookmark (BookMark) ;
                      TableCL.FreeBookmark (BookMark) ;
                      TableCL.EnableControls ;
                      Application.MessageBox ( '对不起,没有找到该材料!',
                                               pChar(AppName),
                                               MB_OK or MB_ICONSTOP ) ;
                 end ;
     end ;
end;

procedure TCLQueryDlg.QuitBitBtnClick(Sender: TObject);
begin
     Self.Close ;
end;

procedure TCLQueryDlg.BitBtn1Click(Sender: TObject);
begin
     ADDCLDlg.BS := BS ;
     ADDCLDlg.CLID := CLID ;
     ADDCLDlg.ShowModal ;
     TableCL.Refresh ;
end;

procedure TCLQueryDlg.BitBtn2Click(Sender: TObject);
begin
     CLXXDlg.ShowModal ;
end;

procedure TCLQueryDlg.BitBtn3Click(Sender: TObject);
begin
     if (Application.MessageBox( '您真得删除当前定额吗？',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     TableCL.Delete ;
end;

procedure TCLQueryDlg.BitBtn4Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet1) then
     begin
          MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet1 ;
          MainForm.YSZLPageControlChange(MainForm.YSZLPageControl);
     end ;
     if (MainForm.DBGrid1.SelectedField.FieldName<>'CODE') then
     begin
          MainForm.DBGrid1.SelectedField := Dbs.TableUSER.FieldByName('CODE') ;
     end ;
     EditBuffer := TableCL.FieldByName('CODE').AsString ;
     if (not GetSearchClRec(Dbs.TableCODE, CLID, UpperCase(EditBuffer))) then
     begin
          EditBuffer := '' ;
          exit ;
     end ;
     InsertOneClItem(Dbs.TableUSER) ;
     EditBuffer := '' ;
     Dbs.TableUSER.Next ;
     RefreshTabSheet1 ;
end;

procedure TCLQueryDlg.TabControlCLChange(Sender: TObject);
var
   i : integer ;
begin
     Dbs.TableCLID.First ;
     Dbs.TableCLID.MoveBy (TabControlCL.TabIndex) ;
     CLID := Dbs.TableCLID.FieldByName('ID').AsInteger ;
     BS := TabSetCL.TabIndex+1 ;
     TableCL.Close ;
     TableCL.Filter := 'ID='+IntToStr(CLID)+' AND BS='+IntToStr(BS) ;
     TableCL.Filtered := TRUE ;
     TableCL.Open ;
end;


procedure TCLQueryDlg.CheckBoxWriteClick(Sender: TObject);
begin
     DBGridCL.ReadOnly := CheckBoxWrite.Checked ;
end;

procedure TCLQueryDlg.TabSetCLClick(Sender: TObject);
begin
     TabControlCLChange(TabControlCL);
end;

procedure TCLQueryDlg.RewriteCLDW ;
var
   TableDW : TTable ;
begin
     TableDW := TTable.Create(Self) ;
     TableDW.DatabaseName := 'DBF' ;
     TableDW.TableName := 'CLDW.DB' ;
     TableDW.Open ;
     TableCL.DisableControls ;
     TableCL.Filtered := FALSE ;
     TableCL.First ;
     while (TRUE) do
     begin
          if (TableCL.EOF) then
             break ;
          if (TableDW.FindKey([TableCL.FieldByName('DW').AsString])) then
          begin
               TableCL.Edit ;
               TableCL.FieldByName('DW').AsString := TableDW.FieldByName('NDW').AsString ; 
               TableCL.Post ;
          end ;
          TableCL.Next ;
     end ;
     TableDW.Close ;
     TableDW.Destroy ;
     TableCL.Filtered := TRUE ;
     TableCL.EnableControls ;
end ;

procedure TCLQueryDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if (key<>#13) then
        SCOM := SCOM+key ;
end;

procedure TCLQueryDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_RETURN) then
     begin
          if (UpperCase(SCOM)='CLDW') then
             RewriteCLDW ;
          SCOM := '' ;
     end ;
end;

end.

