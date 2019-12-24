unit DEQUERY;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Db, Grids, DBGrids, DBTables, Mask, DBCtrls, DECZ,
  ComCtrls;

type
  TDEQueryDlg = class(TForm)
    DataSourceDE: TDataSource;
    TableDE: TTable;
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
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    QuitBitBtn: TBitBtn;
    BitBtn4: TBitBtn;
    TabControlDE: TTabControl;
    DBGridDE: TDBGrid;
    Bevel1: TBevel;
    Label14: TLabel;
    EditBH: TEdit;
    Label15: TLabel;
    EditMC: TEdit;
    CheckBoxWrite: TCheckBox;
    QueryTEMP: TQuery;
    procedure CalcRgs;
    procedure RewriteDEFX ;
    procedure RewriteDEZC ;
    procedure RewriteDEDW ;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditBHKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuitBitBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure TabControlDEChange(Sender: TObject);
    procedure EditMCKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBoxWriteClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    DEID : smallint ;
    SCOM : string ;
  end;

var
  DEQueryDlg: TDEQueryDlg;

implementation
{$R *.DFM}
uses MAIN, YSZLDBS, Dexx, BCDE, Wait ;

procedure TDEQueryDlg.FormShow(Sender: TObject);
begin
     SCOM := '' ;
     EditBH.Text := '' ;
     EditMC.Text := '' ;
     CheckBoxWrite.Checked := TRUE ;
     DBGridDE.ReadOnly := CheckBoxWrite.Checked ;

     TableDE.Close ;
     TableDE.Filter := '' ;
     TableDE.Filtered := FALSE ;

     TabControlDE.Tabs.Clear ;
     with Dbs do
     begin
          TableINSTALL.First ;
          while (TRUE) do
          begin
               if (TableINSTALL.EOF) then
                  break ;
               TabControlDE.Tabs.Add (TableINSTALL.FieldByName('DEMC').AsString) ;
               TableINSTALL.Next ;
          end ;
     end ;
     DEID := -1 ;
     TabControlDE.TabIndex := 0 ;
     TabControlDEChange(TabControlDE);
end;

procedure TDEQueryDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TableDE.Close ;
     TableDE.Filter := '' ;
     TableDE.Filtered := FALSE ;
     TabControlDE.Tabs.Clear ;
end;

procedure TDEQueryDlg.EditBHKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (not TableDE.Active) then
        exit ;
     case Key of
     VK_RETURN :
                 begin
                      if (TableDE.FindKey([DEID,EditBH.Text])) then
                         TableDE.GotoKey
                      else
                          TableDE.FindNearest([DEID,EditBH.Text]) ;
                 end ;
     end ;
end;

procedure TDEQueryDlg.EditMCKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   BookMark : TBookMark ;
begin
     if (not TableDE.Active) then
        exit ;
     case Key of
     VK_RETURN :
                 begin
                      if (EditMC.Text='') then exit ;
                      BookMark := TableDE.GetBookmark ;
                      TableDE.DisableControls ;
                      if (Pos(EditMC.Text, TableDE.FieldByName('MC').AsString)=0) then
                         TableDE.First
                      else
                          TableDE.Next ;
                      while (TRUE) do
                      begin
                           if (TableDE.EOF) then
                              break ;
                           if (Pos(EditMC.Text, TableDE.FieldByName('MC').AsString)>0) then
                           begin
                                TableDE.FreeBookmark (BookMark) ;
                                TableDE.EnableControls ;
                                exit ;
                           end ;
                           TableDE.Next ;
                      end ;
                      TableDE.GotoBookmark (BookMark) ;
                      TableDE.FreeBookmark (BookMark) ;
                      TableDE.EnableControls ;
                      Application.MessageBox ( '对不起,没有找该定额!',
                                               pChar(AppName),
                                               MB_OK or MB_ICONSTOP ) ;
                 end ;
     end ;
end;

procedure TDEQueryDlg.QuitBitBtnClick(Sender: TObject);
begin
     Self.Close ;
end;

procedure TDEQueryDlg.BitBtn1Click(Sender: TObject);
begin
     DEXXDlg.ShowModal ;
end;

procedure TDEQueryDlg.BitBtn2Click(Sender: TObject);
begin
     BCDEDlg.ShowModal ;
end;

procedure TDEQueryDlg.BitBtn3Click(Sender: TObject);
begin
     if (Application.MessageBox( '您真得删除当前定额吗？',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     TableDE.Delete ;
end;

procedure TDEQueryDlg.BitBtn4Click(Sender: TObject);
var
   Key: Word;
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
     EditBuffer := TableDE.FieldByName ('BH').AsString ;
     Key := VK_RETURN ;
     MainForm.DBGrid1.OnKeyDown(MainForm.DBGrid1, Key, []) ;
end;

procedure TDEQueryDlg.TabControlDEChange(Sender: TObject);
var
   i : integer ;
begin
     Dbs.TableINSTALL.First ;
     Dbs.TableINSTALL.MoveBy (TabControlDE.TabIndex) ;
     DEID := Dbs.TableINSTALL.FieldByName('ID').AsInteger ;
     TableDE.Close ;
     TableDE.Filter := 'ID='+IntToStr(DEID) ;
     TableDE.Filtered := TRUE ;
     TableDE.Open ;
     for i:=0 to MainForm.PopupMenuDESR.Items.Count-1 do
     begin
          if (MainForm.PopupMenuDESR.Items[i].Tag=DEID) then
          begin
               MainForm.NDESR0Click(MainForm.PopupMenuDESR.Items[i]);
               break ;
          end ;
     end ;
end;

procedure TDEQueryDlg.CheckBoxWriteClick(Sender: TObject);
begin
     DBGridDE.ReadOnly := CheckBoxWrite.Checked ;
end;

procedure TDEQueryDlg.CalcRgs ;
var
   BH : string[16] ;
   RGS : double ;
begin
     WaitDlg.Show ;
     WaitDlg.Repaint ;
     TableDE.First ;
     while (TRUE) do
     begin
          if (TableDE.EOF) then
             break ;
          BH := TableDE.FieldByName('BH').AsString ;
          RGS := 0.0 ;
          QueryTEMP.Close ;
          QueryTEMP.SQL.Clear ;
          QueryTEMP.SQL.Add ( 'SELECT * FROM DEFX WHERE ID='+IntToStr(DEID)+' AND BH="'+BH+'"' ) ;
          QueryTEMP.Open ;
          if (QueryTEMP.RecordCount<>0) then
          begin
               QueryTEMP.First ;
               while (TRUE) do
               begin
                    if (QueryTEMP.EOF) then
                       break ;
                    if (QueryTEMP.FieldByName('LB').AsString='人工') then
                       RGS := RGS+QueryTEMP.FieldByName('HL').AsFloat ;
                    QueryTEMP.Next ;
               end ;
               if (RGS<>0.0) then
               begin
                    TableDE.Edit ;
                    TableDE.FieldByName('RGS').AsFloat := RGS ;
                    TableDE.Post ;
               end ;
          end ;
          TableDE.Next ;
     end ;
     QueryTEMP.Close ;
     WaitDlg.Hide ;
end;

procedure TDEQueryDlg.RewriteDEFX ;
var
   ID : smallint ;
   CODEID : smallint ;
   BH : string[16] ;
   CODE : string[16] ;
begin
     WaitDlg.Show ;
     WaitDlg.Repaint ;
     with Dbs do
     begin
          TableDEFX.First ;
          while (TRUE) do
          begin
               if (TableDEFX.EOF) then
                  break ;
               ID := TableDEFX.FieldByName('ID').AsInteger ;
               BH := TableDEFX.FieldByName('BH').AsString ;
               CODE := TableDEFX.FieldByName('CODE').AsString ;
               if (TableDE.FindKey([ID,BH])) then
               begin
                    CODEID := TableDE.FieldByName('CODEID').AsInteger ;
                    if (TableCODE.FindKey([CODEID,CODE])) then
                    begin
                         TableDEFX.Edit ;
                         TableDEFX.FieldByName('LB').AsString := TableCODE.FieldByName('LB1').AsString ;
                         TableDEFX.FieldByName('FL').AsString := TableCODE.FieldByName('FL').AsString ;
                         TableDEFX.FieldByName('FLCODE').AsString := TableCODE.FieldByName('FLCODE').AsString ;
                         TableDEFX.Post ;
                    end ;
               end ;
               TableDEFX.Next ;
          end ;
     end ;
     WaitDlg.Hide ;
end ;

procedure TDEQueryDlg.RewriteDEZC ;
var
   ID : smallint ;
   CODEID : smallint ;
   BH : string[16] ;
   CODE : string[16] ;
begin
     WaitDlg.Show ;
     WaitDlg.Repaint ;
     with Dbs do
     begin
          TableDEZC.First ;
          while (TRUE) do
          begin
               if (TableDEZC.EOF) then
                  break ;
               ID := TableDEZC.FieldByName('ID').AsInteger ;
               BH := TableDEZC.FieldByName('BH').AsString ;
               CODE := TableDEZC.FieldByName('CODE').AsString ;
               if (TableDE.FindKey([ID,BH])) then
               begin
                    CODEID := TableDE.FieldByName('CODEID').AsInteger ;
                    if (TableCODE.FindKey([CODEID,CODE])) then
                    begin
                         TableDEZC.Edit ;
                         TableDEZC.FieldByName('LB').AsString := TableCODE.FieldByName('LB1').AsString ;
                         TableDEZC.Post ;
                    end ;
               end ;
               TableDEZC.Next ;
          end ;
     end ;
     WaitDlg.Hide ;
end ;

procedure TDEQueryDlg.RewriteDEDW ;
var
   TableDW : TTable ;
begin
     TableDW := TTable.Create(Self) ;
     TableDW.DatabaseName := 'DBF' ;
     TableDW.TableName := 'DEDW.DB' ;
     TableDW.Open ;
     TableDE.DisableControls ;
     TableDE.Filtered := FALSE ;
     TableDE.First ;
     while (TRUE) do
     begin
          if (TableDE.EOF) then
             break ;
          if (TableDW.FindKey([TableDE.FieldByName('DW').AsString])) then
          begin
               TableDE.Edit ;
               TableDE.FieldByName('DW').AsString := TableDW.FieldByName('NDW').AsString ;
               TableDE.Post ;
          end ;
          TableDE.Next ;
     end ;
     TableDW.Close ;
     TableDW.Destroy ;
     TableDE.Filtered := TRUE ;
     TableDE.EnableControls ;
end ;

procedure TDEQueryDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if (key<>#13) then
        SCOM := SCOM+key ;
end;

procedure TDEQueryDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_RETURN) then
     begin
          if (UpperCase(SCOM)='RGS') then
             CalcRgs ;
          if (UpperCase(SCOM)='DEFX') then
             RewriteDEFX ;
          if (UpperCase(SCOM)='DEZC') then
             RewriteDEZC ;
          if (UpperCase(SCOM)='DEDW') then
             RewriteDEDW ;
          SCOM := '' ;
     end ;
end;

end.

