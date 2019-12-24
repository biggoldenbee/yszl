unit main ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Menus, StdCtrls, checklst, vcspell3, OleCtrls,
  chartfx3, ExtCtrls, vcf1, Grids, DBGrids, Db, DBTables, DBCtrls, Buttons, Printers,
  Spin, Quickrpt, QRCtrls,qrprntr, DECZ, dogutil, ImgList ;

type
  TMainForm = class(TForm)
    ToolBar: TToolBar;
    ImageList: TImageList;
    PopupMenuDESR: TPopupMenu;
    NDESR0: TMenuItem;
    StatusBar: TStatusBar;
    YSZLPageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N2: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N290: TMenuItem;
    N291: TMenuItem;
    N292: TMenuItem;
    N293: TMenuItem;
    N294: TMenuItem;
    N295: TMenuItem;
    N296: TMenuItem;
    N297: TMenuItem;
    N298: TMenuItem;
    N299: TMenuItem;
    N29A: TMenuItem;
    N3: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N4: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    DBGrid1: TDBGrid;
    Panel11: TPanel;
    DBGrid11: TDBGrid;
    BitBtn111: TBitBtn;
    BitBtn112: TBitBtn;
    ListBox11: TListBox;
    BitBtn113: TBitBtn;
    BitBtn114: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid6: TDBGrid;
    DBGrid7: TDBGrid;
    DBGrid8: TDBGrid;
    DBGrid9: TDBGrid;
    PrinterSetupDialog: TPrinterSetupDialog;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    MainPopupMenu: TPopupMenu;
    PN1: TMenuItem;
    PN2: TMenuItem;
    PN3: TMenuItem;
    PN4: TMenuItem;
    PN5: TMenuItem;
    PN6: TMenuItem;
    PN7: TMenuItem;
    PN8: TMenuItem;
    PN9: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    TabSheet5: TTabSheet;
    DBGrid5: TDBGrid;
    Panel5: TPanel;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn51: TBitBtn;
    BitBtn52: TBitBtn;
    BitBtn53: TBitBtn;
    BitBtn61: TBitBtn;
    BitBtn62: TBitBtn;
    BitBtn63: TBitBtn;
    BitBtn71: TBitBtn;
    BitBtn72: TBitBtn;
    BitBtn73: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn81: TBitBtn;
    BitBtn82: TBitBtn;
    Panel101: TPanel;
    Panel102: TPanel;
    Panel10: TPanel;
    PreSpeedButton1: TSpeedButton;
    PreSpeedButton2: TSpeedButton;
    PreSpeedButton3: TSpeedButton;
    PreSpeedButton4: TSpeedButton;
    PreSpeedButton5: TSpeedButton;
    PreFormLabel: TLabel;
    PreSpeedButton6: TSpeedButton;
    PreSpeedButton7: TSpeedButton;
    PreSpeedButton8: TSpeedButton;
    PreSpeedButton9: TSpeedButton;
    PreSpeedButton0: TSpeedButton;
    BitBtn101: TBitBtn;
    RPTRadioGroup: TRadioGroup;
    RPTCheckListBox: TCheckListBox;
    BitBtn102: TBitBtn;
    BitBtn91: TBitBtn;
    BitBtn92: TBitBtn;
    BitBtn93: TBitBtn;
    N29B: TMenuItem;
    BitBtn83: TBitBtn;
    BitBtn84: TBitBtn;
    N29C: TMenuItem;
    N29D: TMenuItem;
    N29E: TMenuItem;
    PN10: TMenuItem;
    PN11: TMenuItem;
    PN12: TMenuItem;
    BitBtn36: TBitBtn;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;

    procedure ModifyTableSysDICT ;
    procedure OpenTableUser ;
    procedure CloseTableUser ;
    procedure DealingException(Sender:TObject;EInstance:Exception) ;
    procedure InputDE ;
    procedure InputLSGS ;
    procedure InputGS ;
    procedure SetSelectFlag ;
    procedure InitializeSystem ;
    procedure ShowHint(Sender: TObject);
    procedure ShowStatus ;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NDESR0Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn111Click(Sender: TObject);
    procedure BitBtn112Click(Sender: TObject);
    procedure YSZLPageControlChange(Sender: TObject);
    procedure ListBox11Click(Sender: TObject);
    procedure BitBtn113Click(Sender: TObject);
    procedure DBGrid11DblClick(Sender: TObject);
    procedure BitBtn114Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N290Click(Sender: TObject);
    procedure N291Click(Sender: TObject);
    procedure N292Click(Sender: TObject);
    procedure N293Click(Sender: TObject);
    procedure N294Click(Sender: TObject);
    procedure N296Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N295Click(Sender: TObject);
    procedure N298Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N29AClick(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure N29BClick(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure BitBtn51Click(Sender: TObject);
    procedure BitBtn52Click(Sender: TObject);
    procedure BitBtn53Click(Sender: TObject);
    procedure N297Click(Sender: TObject);
    procedure BitBtn61Click(Sender: TObject);
    procedure BitBtn62Click(Sender: TObject);
    procedure BitBtn63Click(Sender: TObject);
    procedure BitBtn71Click(Sender: TObject);
    procedure BitBtn72Click(Sender: TObject);
    procedure BitBtn73Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn81Click(Sender: TObject);
    procedure BitBtn82Click(Sender: TObject);
    procedure BitBtn101Click(Sender: TObject);

    procedure ShowPreViewPageInfo ;
    procedure QuickRptPreview(Sender: TObject);
    procedure PreSpeedButton0Click(Sender: TObject);
    procedure PreSpeedButton1Click(Sender: TObject);
    procedure RPTRadioGroupClick(Sender: TObject);
    procedure YSZLPageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure BitBtn102Click(Sender: TObject);
    procedure BitBtn91Click(Sender: TObject);
    procedure BitBtn92Click(Sender: TObject);
    procedure BitBtn93Click(Sender: TObject);
    procedure DBGrid9DblClick(Sender: TObject);
    procedure BitBtn83Click(Sender: TObject);
    procedure BitBtn84Click(Sender: TObject);
    procedure N29DClick(Sender: TObject);
    procedure N29EClick(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N37Click(Sender: TObject);

  private
    FReport : TQuickRep;
    procedure SetReport(Value : TQuickRep);
  public
    CAP : short ;
    NUM : short ;
    QRPreForm : TQRPreView ;
    property Report : TQuickRep read FReport write SetReport;
  end;

var
  MainForm: TMainForm;
  AppName : string ;
  EditBuffer : string ;
  Clipbuffer : string ;
  ShowTableName : string ;
  ShowTableFilter : string ;
  ShowTableOpenFlag : boolean ;
  MainPWD : string ;
  RegisterDate : TDateTime ;
  PeriodDay : Integer ;
const
     ConWelcomeWord='欢迎使用潮涌软件' ;
     ConSoftName='《预算助理》软件' ;
     ConSoftVersion='标准版本 V3.00 For Windows' ;
     ConTel='Tel: 021-62115575 62405980' ;
     ConEmail='E-mail: yanjm@guomai.sh.cn' ;
     ConPostCode='邮政编码: 200050' ;
     ConCompanyName='上海潮涌电子技术有限公司' ;
     ConAddress='上海市武夷路150号建工干校教学楼104室' ;
implementation

uses MANPRJ, YSZLDBS, MODIZD, FORTRAN, Rpt1, About, DEQUERY, CLQUERY, GZDJ,
  CLLB, Lsgs, Ingcl, XZZD, DEHS, TSELECT, XTJHSPT, SPT, Wait, ZZJ, XXJ, Jsj,
  SFL, RFORM1, RFORM2, MODIMB, MANDWGC, MANGCWJ;

{$R *.DFM}

procedure TMainForm.ShowPreViewPageInfo ;
begin
     if (QRPreForm<>Nil) then
        PreFormLabel.Caption := format('共%d页第%d页',[QRPreForm.QRPrinter.PageCount,QRPreForm.PageNumber])
     else
        PreFormLabel.Caption := '' ;
end ;

procedure TMainForm.QuickRptPreview(Sender: TObject);
begin
     if (QrPreForm=Nil) then
     begin
          QrPreForm := TQRPreView.Create( Self ) ;
          QrPreForm.Parent := Panel102 ;
          QrPreForm.Align := alClient ;
          QrPreForm.Name := 'QrPreForm' ;
     end ;
     QrPreForm.QRPrinter := TQRPrinter(Sender);
     QrPreForm.Show;
end;

procedure TMainForm.SetReport(Value : TQuickRep);
begin
     FReport:=Value;
     if (Value<>Nil) then
     begin
          FReport.OnPreview := QuickRptPreview ;
     end ;
end;

procedure TMainForm.ModifyTableSysDICT ;
var
   i : integer ;
begin
     if (not PrjHead.OpenFlag) then exit ;
     with Dbs do
     begin
          if (not TableSysDICT.Active) then TableSysDICT.Open ;
          for i:=0 to Dbgrid1.Columns.Count-1 do
          begin
               if (TableSysDICT.FindKey(['USER.DB', DBGrid1.Columns[i].FieldName])) then
               begin
                    TableSysDICT.Edit ;
                    TableSysDICT.FieldbyName('DISPLENGTH').AsInteger := DBGrid1.Columns[i].Width ;
                    TableSysDICT.Post ;
               end ;
          end ;
          TableSysDICT.Close ;
     end ;
end ;

procedure TMainForm.OpenTableUser ;
begin
     ClipBuffer := '' ;
     YSZLPageControl.Visible := PrjHead.OpenFlag ;
     if (PrjHead.OpenFlag=FALSE) then exit ;
     Dbs.CleaningTableUSER ;
     RefreshTabSheet1 ;
     Dbs.QueryUSER.Close ;
     YSZLPageControl.ActivePage := TabSheet1 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
     ClearPrjZJ ;
     BitBtn101.Click ;
end ;

procedure TMainForm.CloseTableUser ;
begin
     ModifyTableSysDICT ;
     Dbs.CleaningTableUSER ;
     RefreshTabSheet1 ;
     Dbs.QueryUSER.Close ;
     NotShowTableUser (Dbs.TableUSER, Dbgrid1) ;
     Dbgrid2.Visible := ShowTableOpenFlag ;
     Dbgrid3.Visible := ShowTableOpenFlag ;
     Dbgrid4.Visible := ShowTableOpenFlag ;
     Dbgrid5.Visible := ShowTableOpenFlag ;
     Dbgrid6.Visible := ShowTableOpenFlag ;
     Dbgrid7.Visible := ShowTableOpenFlag ;
     Dbgrid8.Visible := ShowTableOpenFlag ;
     Dbgrid9.Visible := ShowTableOpenFlag ;
     Dbs.TableUSER.Close ;
     Dbs.TableTEMP.Close ;
     ClearPrjHead ;
     YSZLPageControl.Visible := PrjHead.OpenFlag ;
     ClearPrjZJ ;
     BitBtn101.Click ;
end ;

procedure TMainForm.DealingException(Sender:TObject;EInstance:Exception) ;
begin
{     Application.MessageBox( '操作错误！请按正常程序进行操作！',
                              pChar(AppName),
                              MB_OK or MB_ICONSTOP ) ;}
end ;

procedure TMainForm.InputDE ;
begin
     if (DesrRec.OpenFlag=FALSE) then
     begin
          Application.MessageBox ( '请选择定额输入法『使用功能键F12打开菜单进行选择操作』!',
                                   pChar(AppName),
                                   MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     //check if a project is opened
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     //check if choice a desr
     if (not DesrRec.OpenFlag) then
     begin
          ClearSearchDeRec ;
          exit ;
     end ;
     //check if at ysb TabSheet
     if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet1) then
     begin
          YSZLPageControl.ActivePage := TabSheet1 ;
     end ;
     //move cursor to DBGrid1
     DBGrid1.SetFocus ;
     //judge if have a de record
     if (not GetSearchDeRec(Dbs.TableDE, DesrRec.ID, UpperCase(EditBuffer))) then
     begin
          EditBuffer := '' ;
          exit ;
     end ;
     InsertOneDEItem(Dbs.TableUSER) ;
     EditBuffer := '' ;
     RefreshTabSheet1 ;
end ;

procedure TMainForm.InputLSGS ;
begin
     //check if a project is opened
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     //check if at ysb TabSheet
     if (MainForm.YSZLPageControl.ActivePage<>MainForm.TabSheet1) then
     begin
          YSZLPageControl.ActivePage := TabSheet1 ;
     end ;
     //move cursor to DBGrid1
     DBGrid1.SetFocus ;
     //judge if have a de record
     if (LSGSDlg.ShowModal=IDOK) then
        INGCLDlg.ShowModal ;
     //restor circle
     EditBuffer := '' ;
     RefreshTabSheet1 ;
end ;

procedure TMainForm.InputGS ;
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          Application.MessageBox ( '请打开工程文件！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if ((TableUSER.FieldByName('WLP').AsString='T')or(TableUSER.FieldByName('WLP').AsString='B')) then exit ;
          ForTranDlg.S_Gs := TableUSER.FieldByName('GS').AsString ;
          if (ForTranDlg.ShowModal=IDOK) then
          begin
               TableUSER.Edit ;
               TableUSER.FieldByName('GS').AsString      := ForTranDlg.S_Gs ;
               TableUSER.FieldByName('QUANTITY').AsFloat := ForTranDlg.LRESULT ;
               TableUSER.Post ;
          end ;
     end ;
end ;

procedure TMainForm.SetSelectFlag ;
var
   SQLcommand : string ;
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          Application.MessageBox ( '请打开工程文件！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if ((TableUSER.FieldByName('WLP').AsString='T')or(TableUSER.FieldByName('WLP').AsString='B')) then
          begin
               TableUSER.Edit ;
               TableUSER.FieldByName('FLAG').AsBoolean := FALSE ;
               TableUSER.Post ;
               exit ;
          end ;
          TableUSER.Edit ;
          if (TableUSER.FieldByName('FLAG').AsBoolean=TRUE) then
             TableUSER.FieldByName('FLAG').AsBoolean := FALSE
          else
              TableUSER.FieldByName('FLAG').AsBoolean := TRUE ;
          TableUSER.Post ;

          if (TableUSER.FieldByName('BZ').AsString<>'') then
          begin
               QueryHS.Close ;
               SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where BZ='+'"'+TableUSER.FieldByName('BZ').AsString+'"' ;
               QueryHS.SQL.Clear ;
               QueryHS.SQL.Add ( SQLCommand ) ;
               QueryHS.RequestLive := TRUE ;
               QueryHS.Open ;
               QueryHS.First ;
               while (TRUE) do
               begin
                    if (QueryHS.Eof) then
                       break ;
                    QueryHS.Edit ;
                    QueryHS.FieldByName('FLAG').AsBoolean := TableUSER.FieldByName('FLAG').AsBoolean ;
                    QueryHS.Post ;
                    QueryHS.Next ;
               end ;
               QueryHS.Close ;
               TableUSER.Refresh ;
          end ;
     end ;
end ;

procedure TMainForm.InitializeSystem ;
          procedure InitDESR ;
          var
             SomeoneItem : TMenuItem ;
          begin
               with Dbs do
               begin
                    TableInstall.First ;
                    while (TRUE) do
                    begin
                         if (TableInstall.EOF) then break ;
                         SomeoneItem := TMenuItem.Create(Self) ;
                         SomeoneItem.Caption := TableInstall.FieldByName('ITEMNAME').AsString ;
                         SomeoneItem.Tag := TableInstall.FieldByName('ID').AsInteger ;
                         SomeoneItem.OnClick := NDESR0Click ;
                         SomeoneItem.Name := 'NDESR'+IntToStr(TableInstall.FieldByName('ID').Value) ;
                         SomeoneItem.Checked := FALSE ;
                         SomeoneItem.RadioItem := TRUE ;
                         PopupMenuDESR.Items.Add(SomeoneItem) ;
                         TableInstall.Next ;
                    end ;
               end ;
               PopupMenuDESR.Items[0].Checked := TRUE ;
          end ;
begin
     AppName := '潮涌软件之《预算助理》' ;
     Application.Title := AppName ;
     Application.OnException := DealingException ;
     Self.Caption := AppName ;
     Self.WindowState := wsMaximized ;
     ShortDateFormat := 'yyyy-MM-dd' ;
     Application.OnHint := ShowHint ;
     DbGrid1.DefaultDrawing := FALSE ;
     DbGrid2.DefaultDrawing := TRUE ;
     DbGrid3.DefaultDrawing := TRUE ;
     DbGrid4.DefaultDrawing := TRUE ;
     DbGrid5.DefaultDrawing := TRUE ;
     DbGrid6.DefaultDrawing := TRUE ;
     DbGrid7.DefaultDrawing := TRUE ;
     DbGrid8.DefaultDrawing := TRUE ;
     DbGrid9.DefaultDrawing := TRUE ;
     DbGrid1.Tag := 0 ;
     DbGrid2.Tag := 1 ;
     DbGrid3.Tag := 2 ;
     DbGrid4.Tag := 3 ;
     DbGrid5.Tag := 4 ;
     DbGrid6.Tag := 5 ;
     DbGrid7.Tag := 6 ;
     DbGrid8.Tag := 7 ;
     DbGrid9.Tag := 8 ;
     InitDESR ;
     CAP := GetKeyState (VK_CAPITAL) ;
     NUM := GetKeyState (VK_NUMLOCK) ;
     YSZLPageControl.ActivePage := TabSheet1 ;
     CloseTableUser ;
     ShowStatus ;
     TabSheet1.Tag := 1 ;
     TabSheet2.Tag := 2 ;
     TabSheet3.Tag := 3 ;
     TabSheet4.Tag := 4 ;
     TabSheet5.Tag := 5 ;
     TabSheet6.Tag := 6 ;
     TabSheet7.Tag := 7 ;
     TabSheet8.Tag := 8 ;
     TabSheet9.Tag := 9 ;
     TabSheet10.Tag:= 10 ;
     TabSheet11.Tag:= 11 ;
     WatchDog ;
     if (PeriodDay>0) then
     begin
          if (Date<RegisterDate) then
          begin
               ClearDog ;
               exit ;
          end ;
          if ((Date-RegisterDate)>PeriodDay) then
          begin
               ClearDog ;
               exit ;
          end ;
     end ;
end ;

procedure TMainForm.ShowHint(Sender: TObject);
begin
     if Length(Application.Hint) > 0 then
     begin
          StatusBar.SimplePanel := True ;
          StatusBar.SimpleText := Application.Hint ;
     end else
     begin
          StatusBar.SimplePanel := False ;
          StatusBar.SimpleText := '' ;
     end ;
end ;

procedure TMainForm.StatusBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
     if (Dbs.QueryBlock.Active) then
        ImageList.Draw (StatusBar.Canvas, Rect.Left+1, Rect.Top+1, 3)
     else
        ImageList.Draw (StatusBar.Canvas, Rect.Left+1, Rect.Top+1, 2)
end;

procedure TMainForm.ShowStatus ;
begin
     if (CAP=1) then
        StatusBar.Panels[0].Text := '大写'
     else
         StatusBar.Panels[0].Text := '小写' ;
     if (NUM=1) then
        StatusBar.Panels[1].Text := '数字'
     else
         StatusBar.Panels[1].Text := '' ;
     if (DesrRec.ITEMNAME<>'') then
        StatusBar.Panels[2].Text := DesrRec.ITEMNAME
     else
        StatusBar.Panels[2].Text := '请选择定额输入法' ;
     StatusBar.Panels[4].Text := '' ;
     if (PrjHead.OpenFlag=TRUE) then
        StatusBar.Panels[4].Text := PrjHead.GcLb ;
     StatusBar.Panels[5].Text := '' ;
     if (PrjHead.OpenFlag=TRUE) then
        StatusBar.Panels[5].Text := '『'+PrjHead.FileName+'』' ;
end ;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if (Application.MessageBox( '真的退出吗？',
                                 PChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
     begin
          Action := caNone ;
          exit ;
     end ;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     InitializeSystem ;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
     Self.WindowState := wsMaximized ;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
     Self.WindowState := wsMaximized ;
end;

procedure TMainForm.NDESR0Click(Sender: TObject);
begin
     TMenuItem(Sender).Checked := TRUE ;
     //Get desrrec
     GetDesr(TMenuItem(Sender)) ;
     //Display status
     ShowStatus ;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   i : integer ;
begin
     if (Shift=[]) then
     begin
          if (Key=VK_F12) then
          begin
               ToolButton2.Down := TRUE ;
               ToolButton2.Repaint ;
               Sleep(100) ;
               ToolButton2.Down := FALSE ;
               ToolButton2.Click ;
               exit ;
          end ;
     end ;

     if (ssCtrl in Shift) then
     begin
          //key='+'
          if (Key=187) then //key='+'
          begin
               for i:=0 to PopupMenuDESR.Items.Count-1 do
               begin
                    if (PopupMenuDESR.Items[i].Checked) then
                       break ;
               end ;
               inc(i) ;
               if (i>=PopupMenuDESR.Items.Count) then
                  i := 0 ;
               NDESR0Click(PopupMenuDESR.Items[i]);
               exit ;
          end ;
          //key='-'
          if (Key=189) then
          begin
               for i:=0 to PopupMenuDESR.Items.Count-1 do
               begin
                    if (PopupMenuDESR.Items[i].Checked) then
                       break ;
               end ;
               dec(i) ;
               if (i<=-1) then
                  i := PopupMenuDESR.Items.Count-1 ;
               NDESR0Click(PopupMenuDESR.Items[i]);
               exit ;
          end ;
          //key= '0'..'9'
          i := Key-Ord('0') ;
          if ( (i>=0) and (i<=PopupMenuDESR.Items.Count-1) ) then
             NDESR0Click(PopupMenuDESR.Items[i]);
     end  ;
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     CAP := GetKeyState (VK_CAPITAL) ;
     NUM := GetKeyState (VK_NUMLOCK) ;
     ShowStatus ;
end;

procedure TMainForm.YSZLPageControlChange(Sender: TObject);
var
   i : integer ;
   procedure SetRpt ;
   var
      RptTable : TTable ;
   begin
        GetPrjHead(Dbs.TableUSER) ;
        BitBtn101.Click ;
        RptCheckListBox.Items.Clear ;
        RptTable := TTable.Create(Self) ;
        RptTable.DatabaseName := 'DBF' ;
        RptTable.TableName := 'RPT.DB' ;
        RptTable.Open ;
        RptTable.First ;
        while (TRUE) do
        begin
             if (RptTable.EOF) then
                exit ;
             RptCheckListBox.Items.Add(RptTable.FieldByName('MC').AsString) ;
             RptTable.Next ;
        end ;
        RptTable.Close ;
        RptTable.Free ;
        RptRadioGroup.SetFocus ;
        RptRadioGroup.ItemIndex := 0 ;
        RptRadioGroupClick( RPTRadioGroup ) ;
   end ;
begin
     case YSZLPageControl.ActivePage.Tag of
     1 :
          begin
               NotShowTable (Dbs.TableUSER, Dbgrid1) ;
               ShowTableName := PrjHead.FileName ;
               if (N29A.Checked=FALSE) then
                  ShowTableFilter := 'ID='+''''+'DEZM'+''''+' AND ATTRIB=1'
               else
                   ShowTableFilter := 'ID='+''''+'DEZM'+'''' ;
               ShowTableUser(ShowTableName, ShowTableFilter, Dbs.TableUSER, DbGrid1) ;
          end ;
     2 :
          begin
               NotShowTable (Dbs.TableUSER, Dbgrid2) ;
               ShowTableName := PrjHead.FileName ;
               ShowTableFilter := 'ID='+''''+'KBF'+''''+' AND ATTRIB=1';
               ShowTableUser(ShowTableName, ShowTableFilter, Dbs.TableUSER, DbGrid2) ;
               DbGrid2.Columns[1].Title.Caption := '项目' ;
               DbGrid2.Columns[2].Title.Caption := '费用' ;
          end ;
     3 :
          begin
               NotShowTable (Dbs.TableUSER, Dbgrid3) ;
               ShowTableName := PrjHead.FileName ;
               ShowTableFilter := 'ID='+''''+'RCJ'+''''+' AND ATTRIB=1';
               ShowTableUser(ShowTableName, ShowTableFilter, Dbs.TableUSER, DbGrid3) ;
               DbGrid3.Columns[1].Title.Caption := '编号' ;
               DbGrid3.Columns[2].Title.Caption := '名称' ;
               DbGrid3.Columns[6].Title.Caption := '市场价' ;
               DbGrid3.Columns[8].Title.Caption := '市场合计' ;
          end ;
     4 :
          begin
               NotShowTable (Dbs.TableUSER, Dbgrid4) ;
               ShowTableName := PrjHead.FileName ;
               ShowTableFilter := 'ID='+''''+'ZPB'+''''+' AND ATTRIB=1';
               ShowTableUser(ShowTableName, ShowTableFilter, Dbs.TableUSER, DbGrid4) ;
               DbGrid4.Columns[1].Title.Caption := '编号' ;
               DbGrid4.Columns[2].Title.Caption := '名称' ;
          end ;
     5 :
          begin
               NotShowTable (Dbs.TableUSER, Dbgrid5) ;
               ShowTableName := PrjHead.FileName ;
               ShowTableFilter := 'ID='+''''+'JGCL'+''''+' AND ATTRIB=1';
               ShowTableUser(ShowTableName, ShowTableFilter, Dbs.TableUSER, DbGrid5) ;
               DbGrid5.Columns[1].Title.Caption := '编号' ;
               DbGrid5.Columns[2].Title.Caption := '名称' ;
          end ;
     6 :
          begin
               NotShowTable (Dbs.TableUSER, Dbgrid6) ;
               ShowTableName := PrjHead.FileName ;
               ShowTableFilter := 'ID='+''''+'SBQD'+''''+' AND ATTRIB=1';
               ShowTableUser(ShowTableName, ShowTableFilter, Dbs.TableUSER, DbGrid6) ;
               DbGrid6.Columns[1].Title.Caption := '编号' ;
               DbGrid6.Columns[2].Title.Caption := '名称' ;
          end ;
     7 :
          begin
               NotShowTable (Dbs.TableUSER, Dbgrid7) ;
               ShowTableName := PrjHead.FileName ;
               ShowTableFilter := 'ID='+''''+'SBF'+''''+' AND ATTRIB=1';
               ShowTableUser(ShowTableName, ShowTableFilter, Dbs.TableUSER, DbGrid7) ;
               DbGrid7.Columns[1].Title.Caption := '编号' ;
               DbGrid7.Columns[2].Title.Caption := '名称' ;
          end ;
     8 :
          begin
               NotShowTable (Dbs.TableUSER, Dbgrid8) ;
               ShowTableName := PrjHead.FileName ;
               ShowTableFilter := 'ID='+''''+'P$$'+''''+' AND ATTRIB=1';
               ShowTableUser(ShowTableName, ShowTableFilter, Dbs.TableUSER, DbGrid8) ;
               DbGrid8.Columns[1].Title.Caption := '项目' ;
               DbGrid8.Columns[2].Title.Caption := '名称' ;
          end ;
     9 :
          begin
               NotShowTable (Dbs.TableUSER, Dbgrid9) ;
               ShowTableName := PrjHead.FileName ;
               ShowTableFilter := 'ID='+''''+'GMC'+''''+' AND ATTRIB=1';
               ShowTableUser(ShowTableName, ShowTableFilter, Dbs.TableUSER, DbGrid9) ;
               DbGrid9.Columns[1].Title.Caption := '项目' ;
               DbGrid9.Columns[2].Title.Caption := '名称' ;
               BitBtn91.Click ;
          end ;
     10 :
          begin
               SetRpt ;
          end ;
     11 :
          begin
               ListBox11.Items.Clear ;
               Session.GetTableNames(Dbs.SysDatabase.DatabaseName, '', True, False, ListBox11.Items) ;
               for i:=0 to ListBox11.Items.Count-1 do
                   ListBox11.Items[i] := UpperCase(ListBox11.Items[i]) ;
               ListBox11.ItemIndex := 0 ;
               ListBox11.OnClick (ListBox11) ;
          end ;
     end ;
end;

procedure TMainForm.YSZLPageControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
     if (YSZLPageControl.ActivePage.Tag=10) then
        BitBtn101.Click ;
end;

//About TabSheet11
procedure TMainForm.ListBox11Click(Sender: TObject);
begin
     ShowTableName := 'DICT.DB' ;
     ShowTableFilter := UpperCase('FILENAME='+''''+ListBox11.Items[ListBox11.ItemIndex]+'''') ;
     ShowTable(ShowTableName, ShowTableFilter, Dbs.TableTEMP, DbGrid11) ;
end;

procedure TMainForm.PreSpeedButton0Click(Sender: TObject);
var
   RptForm : TForm ;
begin
     BitBtn101.Click ;

     MainPWD := '' ;
     WatchDog ;
     if (MainPWD='NODOG') then
     begin
          Application.MessageBox( '没有检测到软件狗!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (copy(MainPWD,1,10)<>'QASSYSDEMO') then
     begin
          Application.MessageBox( '软件狗没有授权,请与潮涌公司联系!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (MainPWD[10+PrjHead.GclbId]='*') then
     begin
          Application.MessageBox( pChar('软件狗没有授权'+PrjHead.Gclb+',请与潮涌公司联系!'),
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;

     RptForm := TForm(Application.FindComponent('RptForm'+IntToStr(RPTCheckListBox.ItemIndex))) ;
     if (RptForm<>Nil) then
     begin
          Report := TQuickRep(RptForm.FindComponent('QuickRep')) ;
          Report.Prepare ;
          Report.Preview ;
     end ;
end;

procedure TMainForm.PreSpeedButton1Click(Sender: TObject);
var
   pNum : integer ;
begin
     if (QRPreForm=Nil) then exit ;
     if (QRPreForm.QRPrinter=Nil) then exit ;

     pNum := QRPreForm.PageNumber ;

     Case TSpeedButton(Sender).Tag of
     1 : QRPreForm.ZoomToFit ;
     2 : QRPreForm.Zoom := 100 ;
     3 : QRPreForm.ZoomToWidth ;
     4 : QRPreForm.QRPrinter.Print ;
     5 : QRPreForm.QRPrinter.PrintSetup ;
     6 : pNum := 1 ;
     7 : dec(pNum) ;
     8 : inc(pNum) ;
     9 : pNum := QRPreForm.QRPrinter.PageCount ;
     end ;
     if (pNum<=0) then pNum := 1 ;
     if (pNum>=QRPreForm.QRPrinter.PageCount) then pNum := QRPreForm.QRPrinter.PageCount ;
     QRPreForm.PageNumber := pNum ;
     QRPreForm.UpdateZoom ;
     QRPreForm.Repaint ;
     ShowPreViewPageInfo ;
end;

procedure TMainForm.BitBtn101Click(Sender: TObject);
begin
     if (QrPreForm<>Nil) then
     begin
          QRPreForm.QRPrinter := Nil ;
          QRPreForm.Free  ;
          QRPreForm := Nil ;
          Report := Nil ;
     end ;
     ShowPreViewPageInfo ;
end;

procedure TMainForm.BitBtn102Click(Sender: TObject);
var
   i : integer ;
   RptForm : TForm ;
begin
     BitBtn101.Click ;

     MainPWD := '' ;
     WatchDog ;
     if (MainPWD='NODOG') then
     begin
          Application.MessageBox( '没有检测到软件狗!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (copy(MainPWD,1,10)<>'QASSYSDEMO') then
     begin
          Application.MessageBox( '软件狗没有授权,请与潮涌公司联系!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (MainPWD[10+PrjHead.GclbId]='*') then
     begin
          Application.MessageBox( pChar('软件狗没有授权'+PrjHead.Gclb+',请与潮涌公司联系!'),
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;

     for i:=0 to RPTCheckListBox.Items.Count-1 do
     begin
          if (RPTCheckListBox.Checked[i]) then
          begin
               RptForm := TForm(Application.FindComponent('RptForm'+IntToStr(i))) ;
               if (RptForm<>Nil) then
               begin
                    TQuickRep(RptForm.FindComponent('QuickRep')).Print ;
               end ;
          end ;
     end ;
end;

procedure TMainForm.BitBtn111Click(Sender: TObject);
begin
     Dbs.TableTEMP.Close ;
     Dbs.CreateSysDict ;
     ListBox11.OnClick (ListBox11) ;
end;

procedure TMainForm.BitBtn112Click(Sender: TObject);
begin
     ListBox11.OnClick (ListBox11) ;
end;

procedure TMainForm.BitBtn113Click(Sender: TObject);
begin
     NotShowTable (Dbs.TableTEMP, DbGrid11) ;
end;

procedure TMainForm.BitBtn114Click(Sender: TObject);
begin
     if (DbGRid11.Visible=FALSE) then
     begin
          MessageBeep(0) ;
          exit ;
     end ;
     MODIZDDlg.ShowModal ;
     BitBtn112.Click ;
end;

procedure TMainForm.DBGrid11DblClick(Sender: TObject);
begin
     BitBtn114.Click ;
end;

procedure TMainForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   WLP : string[10] ;
begin
     TDbGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State) ;
     with Dbs do
     begin
          WLP := TableUSER.FieldByName('WLP').AsString ;
          if ((WLP='T')or(WLP='B'))then
          begin
               if (not(gdSelected in State)) then
               begin
                    if (DataCol<3) then
                    begin
                         TDbGrid(Sender).Canvas.Brush.Color := clTeal ;
                         TDbGrid(Sender).Canvas.FillRect (Rect) ;
                    end ;
               end ;
          end ;
     end ;
end;

procedure TMainForm.DBGrid1DblClick(Sender: TObject);
begin
     //set jiafanggongying
     if (DBGrid1.SelectedField.FieldName='CODE') then
     begin
          if (Dbs.TableUSER.FieldByName('WLP').AsString='FCL') then
             InsertJGCL ;
          exit ;
     end ;
     //Input gs
     if (DBGrid1.SelectedField.FieldName='GS') then
     begin
          InputGS ;
          exit ;
     end ;
     //set select flag
     if (DBGrid1.SelectedField.FieldName='FLAG') then
     begin
          SetSelectFlag ;
          exit ;
     end ;
end;

procedure TMainForm.DBGrid3DblClick(Sender: TObject);
begin
     //set jiafanggongying
     if (DBGrid3.SelectedField.FieldName='CODE') then
     begin
          if (Dbs.TableUSER.FieldByName('WLP').AsString='FCL') then
             InsertJGCL ;
          exit ;
     end ;
end;

procedure TMainForm.DBGrid4DblClick(Sender: TObject);
begin
     //set jiafanggongying
     if (DBGrid4.SelectedField.FieldName='CODE') then
     begin
          if (Dbs.TableUSER.FieldByName('WLP').AsString='FCL') then
             InsertJGCL ;
          exit ;
     end ;
end;

procedure TMainForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
     VK_UP :          //deal with VK_UP
            begin
                 if (Dbs.TableUSER.State=dsEdit) then
                 begin
                      Dbs.TableUSER.Cancel ;
                      Key := VK_ESCAPE ;
                 end ;
            end ;
     VK_DOWN :       //deal with VK_DOWN
            begin
                 if (Dbs.TableUSER.State=dsEdit) then
                 begin
                      Dbs.TableUSER.Cancel ;
                      Key := VK_ESCAPE ;
                 end ;
            end ;
     VK_LEFT :       //deal with VK_LEFT
            begin
                 if (Dbs.TableUSER.State=dsEdit) then
                 begin
                      Dbs.TableUSER.Cancel ;
                      Key := VK_ESCAPE ;
                 end ;
            end ;
     VK_RIGHT :      //deal with VK_RIGHT
            begin
                 if (Dbs.TableUSER.State=dsEdit) then
                 begin
                      Dbs.TableUSER.Cancel ;
                      Key := VK_ESCAPE ;
                 end ;
            end ;
     VK_TAB :        //deal with VK_TAB
            begin
                 if (Dbs.TableUSER.State=dsEdit) then
                 begin
                      Dbs.TableUSER.Cancel ;
                      Key := VK_ESCAPE ;
                 end ;
            end ;
     VK_ESCAPE :     //deal with VK_ESCAPE
            begin
                 if (Dbs.TableUSER.State=dsEdit) then
                 begin
                      Dbs.TableUSER.Cancel ;
                 end ;
            end ;
     VK_RETURN : //input Key is VK_RETURN
            begin
                 //Clear all edit state and post value
                 if (Dbs.TableUSER.State=dsEdit) then
                    Dbs.TableUSER.Post ;
                 //Now interface at TabSheet1
                 if (YSZLPageControl.ActivePage=TabSheet1) then
                 begin
                      if (DBGrid1.SelectedField.FieldName='CODE') then
                      begin
                           if (EditBuffer='') then
                           begin
                                InputLSGS ;
                           end ;
                           if (EditBuffer<>'') then
                           begin
                                InputDE ;
                           end ;
                      end ;
                      if (DBGrid1.SelectedField.FieldName='GS') then
                         InputGS ;
                 end ;
                 if (not Dbs.TableUSER.EOF) then
                    Dbs.TableUSER.Next ;
            end ;
     end ;
end;

procedure TMainForm.N10Click(Sender: TObject);
begin
     MainPWD := '' ;
     WatchDog ;
     if (MainPWD='NODOG') then
     begin
          Application.MessageBox( '没有检测到软件狗!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (copy(MainPWD,1,10)<>'QASSYSDEMO') then
     begin
          Application.MessageBox( '软件狗没有授权,请与潮涌公司联系!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     //project is opened
     if (PrjHead.OpenFlag=TRUE) then
     begin
          Application.MessageBox ( '对不起，您已经打开某项目体的工程文件，请关闭该工程文件后再进行该项操作！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     //Open the ManPrjDlg
     if (ManPrjDlg.ShowModal=IDOK) then
     begin
          if (PrjHead.OpenFlag) then exit ;
          GetPrjHead(Dbs.TableUSER) ;
          if (PrjHead.OpenFlag=FALSE) then exit ;
          OpenTableUser ;
          N29A.Checked := FALSE ;
          ShowStatus ;
     end ;
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
     ClipBuffer := '' ;
     CloseTableUser ;
     N29A.Checked := FALSE ;
     ShowStatus ;
end;

procedure TMainForm.N13Click(Sender: TObject);
begin
     MainPWD := '' ;
     WatchDog ;
     if (MainPWD='NODOG') then
     begin
          Application.MessageBox( '没有检测到软件狗!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (copy(MainPWD,1,10)<>'QASSYSDEMO') then
     begin
          Application.MessageBox( '软件狗没有授权,请与潮涌公司联系!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     //project is opened
     if (PrjHead.OpenFlag=TRUE) then
     begin
          Application.MessageBox ( '对不起，您已经打开某项目体的工程文件，请关闭该工程文件后再进行该项操作！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     //Open the ManPrjDlg
     if (ManGCWJDlg.ShowModal=IDOK) then
     begin
          if (PrjHead.OpenFlag) then exit ;
          GetPrjHead(Dbs.TableUSER) ;
          if (PrjHead.OpenFlag=FALSE) then exit ;
          OpenTableUser ;
          N29A.Checked := FALSE ;
          ShowStatus ;
     end ;
end;

procedure TMainForm.N15Click(Sender: TObject);
begin
     Self.Close ;
end;

procedure TMainForm.N20Click(Sender: TObject);
begin
     //This procedure deal with Ctrl_X
     if (PrjHead.OpenFlag=FALSE) then
     begin
          Application.MessageBox ( '请打开工程文件！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     //at page TabSheet1
     if (YSZLPageControl.ActivePage<>TabSheet1) then exit ;
     //Clear edit state
     if (Dbs.TableUSER.State=dsEdit) then
     begin
          Dbs.TableUSER.Cancel ;
     end ;
     //judge if can do it
     if (DBGrid1.SelectedField.FieldName='FLAG') then exit ;
     if (DBGrid1.SelectedField.FieldName='XH') then exit ;
     if (DBGrid1.SelectedField.FieldName='CODE') then exit ;
     //deal with cell Ctrl_X
     ClipBuffer := DBGrid1.SelectedField.AsString ;
     Dbs.TableUSER.Edit ;
     DBGrid1.SelectedField.AsString := '' ;
     Dbs.TableUSER.Post ;
     RefreshTabSheet1 ;
end;

procedure TMainForm.N21Click(Sender: TObject);
begin
     //This procedure deal with Ctrl_C
     if (PrjHead.OpenFlag=FALSE) then
     begin
          Application.MessageBox ( '请打开工程文件！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     //at page TabSheet1
     if (YSZLPageControl.ActivePage<>TabSheet1) then exit ;
     //Clear edit state
     if (Dbs.TableUSER.State=dsEdit) then
     begin
          Dbs.TableUSER.Cancel ;
     end ;
     //judge if can do it
     if (DBGrid1.SelectedField.FieldName='FLAG') then exit ;
     if (DBGrid1.SelectedField.FieldName='XH') then exit ;
     if (DBGrid1.SelectedField.FieldName='CODE') then exit ;
     //deal with cell Ctrl_C
     ClipBuffer := DBGrid1.SelectedField.AsString ;
     RefreshTabSheet1 ;
end;

procedure TMainForm.N22Click(Sender: TObject);
begin
     //This procedure deal with Ctrl_V
     if (PrjHead.OpenFlag=FALSE) then
     begin
          Application.MessageBox ( '请打开工程文件！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     //at page TabSheet1
     if (YSZLPageControl.ActivePage<>TabSheet1) then exit ;
     //clear Edit State
     if (Dbs.TableUSER.State=dsEdit) then
     begin
          Dbs.TableUSER.Cancel ;
     end ;
     //judge if can do it
     if (DBGrid1.SelectedField.FieldName='FLAG') then exit ;
     if (DBGrid1.SelectedField.FieldName='XH') then exit ;
     if (DBGrid1.SelectedField.FieldName='CODE') then exit ;
     //deal with Cell Ctrl_C
     if (ClipBuffer<>'') then
     begin
          Dbs.TableUSER.Edit ;
          DBGrid1.SelectedField.AsString := ClipBuffer ;
          Dbs.TableUSER.Post ;
     end ;
     RefreshTabSheet1 ;
end;

procedure TMainForm.N23Click(Sender: TObject);
var
   SQLcommand : string ;
begin
     //This procedure deal with Ctrl_X
     if (PrjHead.OpenFlag=FALSE) then
     begin
          Application.MessageBox ( '请打开工程文件！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
          ShowStatus ;
          exit ;
     end ;
     //at page TabSheet1
     if (YSZLPageControl.ActivePage<>TabSheet1) then exit ;
     //clear Edit State
     if (Dbs.TableUSER.State=dsEdit) then
     begin
          Dbs.TableUSER.Cancel ;
     end ;
     //deal with Block Ctrl_X
     if (Application.MessageBox( '您真的要删除当前选择的定额吗？',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION)=IDCANCEL) then
        exit ;
     //deal with delete one record
     with Dbs do
     begin
          QueryUSER.Close ;
          if ((TableUSER.FieldByName('WLP').AsString='T')or(TableUSER.FieldByName('WLP').AsString='B')) then exit ;
          if (TableUSER.FieldByName('BZ').AsString='') then
          begin
               TableUSER.Delete ;
               RefreshTabSheet1 ;
               exit ;
          end ;
          if (TableUSER.FieldByName('WLP').AsString='FCL') then
          begin
               TableUSER.Delete ;
               RefreshTabSheet1 ;
               exit ;
          end ;
          QueryUSER.close ;
          QueryUSER.RequestLive := TRUE ;
          QueryUSER.SQL.clear ;
          SQLCommand := 'Delete From "'+PrjHead.FileName+'" Where BZ='+'"'+TableUSER.FieldByName('BZ').AsString+'"' ;
          QueryUSER.SQL.Add (SQLCommand) ;
          QueryUSER.ExecSQL ;
          TableUSER.Refresh ;
          RefreshTabSheet1 ;
     end ;
end;

procedure TMainForm.N24Click(Sender: TObject);
var
   SQLCommand : string ;
begin
     //This procedure deal with Ctrl_C
     if (PrjHead.OpenFlag=FALSE) then
     begin
          Dbs.QueryBlock.Close ;
          Dbs.QueryBlock.Active := FALSE ;
          Application.MessageBox ( '请打开工程文件！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
          ShowStatus ;
          exit ;
     end ;
     //at page TabSheet1
     if (YSZLPageControl.ActivePage<>TabSheet1) then exit ;
     //Clear edit state
     if (Dbs.TableUSER.State=dsEdit) then
     begin
          Dbs.TableUSER.Cancel ;
     end ;
     //deal with block Ctrl_C
     with Dbs do
     begin
          QueryBlock.Close ;
          SQLCommand := 'SELECT * FROM "'+PrjHead.FileName+'" WHERE ID="DEZM"' ;
          SQLCommand := SQLCommand+' AND FLAG=TRUE' ;
          QueryBlock.SQL.Clear ;
          QueryBlock.SQL.Add (SQLcommand) ;
          QueryBlock.Open ;
          if (QueryBlock.RecordCount=0) then
          begin
               Application.MessageBox ( '对不起,您没有设置要复制的定额块!',
                                        pChar(AppName),
                                        MB_OK or MB_ICONSTOP ) ;
               QueryBlock.Close ;
          end ;
          RefreshTabSheet1 ;
     end ;
     ShowStatus ;
end;

procedure TMainForm.N25Click(Sender: TObject);
var
   BookMark : TBookMark ;
          procedure CopyDEItem ;
          var
             i : integer ;
             HS : string[20] ;
             SQLCommand : string ;
             ID : string[10] ;
             NUM: shortint ;

             MyBookMark : TBookMark ;
             OldFilter : string ;
             BZ : string ;

          begin
               with Dbs do
               begin
                    //if current postion at end of file then exit
                    if (TableUSER.EOF) then
                    begin
                         Application.MessageBox ( '对不起，您要粘贴定额所选择的位置不正确，'+
                                                  '请将光标放在分部之间完成粘贴！',
                                                  pChar(AppName),
                                                  MB_OK or MB_ICONINFORMATION ) ;
                         exit ;
                    end ;
                    //Disablecontrols
                    TableUSER.DisableControls ;
                    //GetCurrent DE information
                    if (TableUSER.FieldByName('WLP').AsString='B') then
                    begin
                         //now current postion at part end
                         //If is begin of file then exit
                         if (TableUSER.BOF) then
                         begin
                              Application.MessageBox ( '对不起，您要粘贴定额所选择的位置不正确，'+
                                                       '请将光标放在分部之间完成粘贴！',
                                                       pChar(AppName),
                                                       MB_OK or MB_ICONINFORMATION ) ;
                              TableUSER.EnableControls ;
                              exit ;
                         end ;
                         //judge current postion if can insert record
                         NUM := TableUSER.FieldByName('NUM').AsInteger ;
                         TableUSER.Prior ;
                         if (TableUSER.FieldByName('NUM').AsInteger<>NUM) then
                         begin
                              //at this postion you can not insert recor and exit
                              Application.MessageBox ( '对不起，您要粘贴定额所选择的位置不正确，'+
                                                       '请将光标放在分部之间完成粘贴！',
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
                              Application.MessageBox ( '对不起，您要粘贴定额所选择的位置不正确，'+
                                                       '请将光标放在分部之间完成粘贴！',
                                                       pChar(AppName),
                                                       MB_OK or MB_ICONINFORMATION ) ;
                              TableUSER.EnableControls ;
                              exit ;
                         end ;
                    end ;
                    //start copy block de


                    ID  := TableUSER.FieldByName('ID').AsString ;
                    NUM := TableUSER.FieldByName('NUM').AsInteger ;

                    MyBookMark := TableUSER.GetBookmark ;
                    OldFilter := TableUSER.Filter ;

                    TableUSER.Filter :=  'ID='+''''+'DEZM'+'''' ;

                    TableUSER.GotoBookMark ( MyBookMark ) ;

                    QueryBlock.First ;
                    BZ := '' ;

                    while (TRUE) do
                    begin
                         if (QueryBlock.Eof) then
                            break ;
                         if (QueryBlock.FieldByName('BZ').AsString='') then
                         begin
                              BZ := '' ;
                              TableUSER.InsertRecord ([FALSE, ID, NUM, '', 0, '', '1']) ;
                              TableUSER.Edit ;
                              for i:=3 to TableUSER.FieldCount-1 do
                                  TableUSER.Fields[i].AsString := QueryBlock.Fields[i].AsString ;
                              TableUSER.Post ;
                              TableUSER.Next ;
                         end else
                         begin
                              if (QueryBlock.FieldByName('BZ').AsString<>BZ) then
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
                                        QueryHS.close ;
                                        QueryHS.RequestLive := TRUE ;
                                        QueryHS.SQL.clear ;
                                        SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where BZ='+'"'+HS+'"' ;
                                        QueryHS.SQL.Add (SQLCommand) ;
                                        QueryHS.open ;
                                        if (QueryHS.RecordCount=0) then
                                           break ;
                                   end ;
                                   BZ := QueryBlock.FieldByName('BZ').AsString ;
                              end ;

                              TableUSER.InsertRecord ([FALSE, ID, NUM, HS, 0, '', '1']) ;
                              TableUSER.Edit ;
                              for i:=3 to TableUSER.FieldCount-1 do
                                  TableUSER.Fields[i].AsString := QueryBlock.Fields[i].AsString ;
                              TableUSER.FieldByName ('BZ').AsString := HS ;
                              TableUSER.Post ;
                              TableUSER.Next ;
                         end ;

                         QueryBlock.Next ;
                    end ;
                    //EnableControls
                    TableUSER.GotoBookmark ( MyBookMark ) ;
                    TableUSER.FreeBookmark ( MyBookMark ) ;
                    TableUSER.Filter := OldFilter ;
                    TableUSER.EnableControls ;
               end ;
          end ;
begin
     //This procedure deal with Ctrl_V
     if (PrjHead.OpenFlag=FALSE) then
     begin
          Dbs.QueryBlock.Close ;
          Dbs.QueryBlock.Active := FALSE ;
          Application.MessageBox ( '请打开工程文件！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
          ShowStatus ;
          exit ;
     end ;
     //at page TabSheet1
     if (YSZLPageControl.ActivePage<>TabSheet1) then exit ;
     //clear Edit State
     if (Dbs.TableUSER.State=dsEdit) then
     begin
          Dbs.TableUSER.Cancel ;
     end ;
     //deal with block Ctrl_C
     if (Dbs.QueryBlock.Active) then
     begin
          BookMark := Dbs.TableUSER.GetBookmark ;
          CopyDEItem ;
          RefreshTabSheet1 ;
          ShowStatus ;
          Dbs.TableUSER.GotoBookmark( BookMark ) ;
          Dbs.TableUSER.FreeBookmark( BookMark ) ;
          exit ;
     end else
     begin
          Application.MessageBox ( '您没有定义数据块,请先进行块复制操作!',
                                   pChar(AppName),
                                   MB_OK or MB_ICONQUESTION ) ;

          RefreshTabSheet1 ;
          ShowStatus ;
          exit ;
     end ;
end;

procedure TMainForm.N26Click(Sender: TObject);
var
   SQLCommand : string ;
begin
     //This procedure deal with Ctrl_X
     if (PrjHead.OpenFlag=FALSE) then
     begin
          Dbs.QueryBlock.Close ;
          Dbs.QueryBlock.Active := FALSE ;
          Application.MessageBox ( '请打开工程文件！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
          ShowStatus ;
          exit ;
     end ;
     //at page TabSheet1
     if (YSZLPageControl.ActivePage<>TabSheet1) then exit ;
     //clear Edit State
     if (Dbs.TableUSER.State=dsEdit) then
     begin
          Dbs.TableUSER.Cancel ;
     end ;
     //deal with Block Ctrl_X
     if (Application.MessageBox( '您真的要删除当前选择的定额吗？',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION)=IDCANCEL) then
        exit ;
     with Dbs do
     begin
          QueryBlock.Close ;
          SQLCommand := 'DELETE FROM "'+PrjHead.FileName+'" WHERE ID="DEZM"' ;
          SQLCommand := SQLCommand+' AND FLAG=TRUE' ;
          QueryBlock.SQL.Clear ;
          QueryBlock.SQL.Add (SQLcommand) ;
          QueryBlock.ExecSQL ;
          TableUSER.Refresh ;
          TableUSER.First ;
          DbGrid1.SelectedField := TableUSER.FieldByName('CODE') ;
          RefreshTabSheet1 ;
          ShowStatus ;
     end ;
end;

procedure TMainForm.N27Click(Sender: TObject);
begin
     YSZLPageControl.ActivePage := TabSheet2 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
end;

procedure TMainForm.N28Click(Sender: TObject);
begin
     YSZLPageControl.ActivePage := TabSheet1 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
end;

procedure TMainForm.N29Click(Sender: TObject);
begin
     YSZLPageControl.ActivePage := TabSheet2 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
end;

procedure TMainForm.N290Click(Sender: TObject);
begin
     YSZLPageControl.ActivePage := TabSheet3 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
end;

procedure TMainForm.N291Click(Sender: TObject);
begin
     YSZLPageControl.ActivePage := TabSheet4 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
end;

procedure TMainForm.N292Click(Sender: TObject);
begin
     YSZLPageControl.ActivePage := TabSheet5 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
end;

procedure TMainForm.N293Click(Sender: TObject);
begin
     YSZLPageControl.ActivePage := TabSheet6 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
end;

procedure TMainForm.N294Click(Sender: TObject);
begin
     YSZLPageControl.ActivePage := TabSheet7 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
end;

procedure TMainForm.N295Click(Sender: TObject);
begin
     YSZLPageControl.ActivePage := TabSheet8 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
end;

procedure TMainForm.N296Click(Sender: TObject);
begin
     YSZLPageControl.ActivePage := TabSheet9 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
end;

procedure TMainForm.N297Click(Sender: TObject);
begin
     YSZLPageControl.ActivePage := TabSheet10 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
end;

procedure TMainForm.N298Click(Sender: TObject);
begin
     YSZLPageControl.ActivePage := TabSheet11 ;
     YSZLPageControl.OnChange (YSZLPageControl) ;
end;

procedure TMainForm.N29AClick(Sender: TObject);
var
   SQLCommand : string ;
begin
     if (PrjHead.OpenFlag=FALSE) then exit ;
     if ( Application.MessageBox ( '对不起,您真的要清除所有数据吗?',
                                   pChar(AppName),
                                   MB_OKCANCEL or MB_ICONQUESTION ) = IDCANCEL ) then
        exit ;
     with Dbs do
     begin
          if (YSZLPageControl.ActivePage=TabSheet1) then
          begin
               QueryUSER.Close ;
               QueryUSER.SQL.Clear ;
               SQLCommand := 'DELETE FROM "'+PrjHead.FileName+'" WHERE ID="DEZM"' ;
               SQLCommand := SQLCommand+' AND ( WLP<>"T" AND WLP<>"B" OR WLP="" )';
               QueryUSER.SQL.Add (SQLcommand) ;
               QueryUSER.ExecSQL ;
               TableUSER.Refresh ;
               TableUSER.First ;
          end ;
          if (YSZLPageControl.ActivePage=TabSheet2) then
          begin
               QueryUSER.Close ;
               QueryUSER.SQL.Clear ;
               SQLCommand := 'DELETE FROM "'+PrjHead.FileName+'" WHERE ID="KBF"' ;
               SQLCommand := SQLCommand+' AND ( WLP<>"T" AND WLP<>"B" OR WLP="" )';
               QueryUSER.SQL.Add (SQLcommand) ;
               QueryUSER.ExecSQL ;
               TableUSER.Refresh ;
               TableUSER.First ;
          end ;
          if (YSZLPageControl.ActivePage=TabSheet3) then
          begin
               QueryUSER.Close ;
               QueryUSER.SQL.Clear ;
               SQLCommand := 'DELETE FROM "'+PrjHead.FileName+'" WHERE ID="RCJ"' ;
               SQLCommand := SQLCommand+' AND ( WLP<>"T" AND WLP<>"B" OR WLP="" )';
               QueryUSER.SQL.Add (SQLcommand) ;
               QueryUSER.ExecSQL ;
               TableUSER.Refresh ;
               TableUSER.First ;
          end ;
          if (YSZLPageControl.ActivePage=TabSheet4) then
          begin
               QueryUSER.Close ;
               QueryUSER.SQL.Clear ;
               SQLCommand := 'DELETE FROM "'+PrjHead.FileName+'" WHERE ID="ZPB"' ;
               SQLCommand := SQLCommand+' AND ( WLP<>"T" AND WLP<>"B" OR WLP="" )';
               QueryUSER.SQL.Add (SQLcommand) ;
               QueryUSER.ExecSQL ;
               TableUSER.Refresh ;
               TableUSER.First ;
          end ;
          if (YSZLPageControl.ActivePage=TabSheet5) then
          begin
               QueryUSER.Close ;
               QueryUSER.SQL.Clear ;
               SQLCommand := 'DELETE FROM "'+PrjHead.FileName+'" WHERE ID="JGCL"' ;
               SQLCommand := SQLCommand+' AND ( WLP<>"T" AND WLP<>"B" OR WLP="" )';
               QueryUSER.SQL.Add (SQLcommand) ;
               QueryUSER.ExecSQL ;
               TableUSER.Refresh ;
               TableUSER.First ;
          end ;
          if (YSZLPageControl.ActivePage=TabSheet6) then
          begin
               QueryUSER.Close ;
               QueryUSER.SQL.Clear ;
               SQLCommand := 'DELETE FROM "'+PrjHead.FileName+'" WHERE ID="SBQD"' ;
               SQLCommand := SQLCommand+' AND ( WLP<>"T" AND WLP<>"B" OR WLP="" )';
               QueryUSER.SQL.Add (SQLcommand) ;
               QueryUSER.ExecSQL ;
               TableUSER.Refresh ;
               TableUSER.First ;
          end ;
          if (YSZLPageControl.ActivePage=TabSheet7) then
          begin
               QueryUSER.Close ;
               QueryUSER.SQL.Clear ;
               SQLCommand := 'DELETE FROM "'+PrjHead.FileName+'" WHERE ID="SBF"' ;
               SQLCommand := SQLCommand+' AND ( WLP<>"T" AND WLP<>"B" OR WLP="" )';
               QueryUSER.SQL.Add (SQLcommand) ;
               QueryUSER.ExecSQL ;
               TableUSER.Refresh ;
               TableUSER.First ;
          end ;
          if (YSZLPageControl.ActivePage=TabSheet8) then
          begin
               QueryUSER.Close ;
               QueryUSER.SQL.Clear ;
               SQLCommand := 'DELETE FROM "'+PrjHead.FileName+'" WHERE ID="P$$" AND WLP="FL"' ;
               QueryUSER.SQL.Add (SQLcommand) ;
               QueryUSER.ExecSQL ;
               TableUSER.Refresh ;
               TableUSER.First ;
          end ;
     end ;
end;

procedure TMainForm.N29BClick(Sender: TObject);
begin
     ModiMBDlg.ShowModal ;
end;

procedure TMainForm.N29DClick(Sender: TObject);
var
   SQLcommand : string ;
   BookMark : TBookMark ;
begin
     //judge if TableUser is open
     if (PrjHead.OpenFlag=FALSE) then
     begin
          Application.MessageBox ( '请打开工程文件！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     //at page TabSheet1
     if (YSZLPageControl.ActivePage<>TabSheet1) then exit ;
     //select all
     with Dbs do
     begin

          BookMark := TableUSER.GetBookmark ;
          TableUSER.DisableControls ;

          TableUSER.First ;

          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;

               if ((TableUSER.FieldByName('WLP').AsString='T')or(TableUSER.FieldByName('WLP').AsString='B')) then
               begin
                    TableUSER.Edit ;
                    TableUSER.FieldByName('FLAG').AsBoolean := FALSE ;
                    TableUSER.Post ;
               end else
               begin
                    TableUSER.Edit ;
                    TableUSER.FieldByName('FLAG').AsBoolean := TRUE ;
                    TableUSER.Post ;

                    if (TableUSER.FieldByName('BZ').AsString<>'') then
                    begin
                         QueryHS.Close ;
                         SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where BZ='+'"'+TableUSER.FieldByName('BZ').AsString+'"' ;
                         QueryHS.SQL.Clear ;
                         QueryHS.SQL.Add ( SQLCommand ) ;
                         QueryHS.RequestLive := TRUE ;
                         QueryHS.Open ;
                         QueryHS.First ;
                         while (TRUE) do
                         begin
                              if (QueryHS.Eof) then
                                 break ;
                              QueryHS.Edit ;
                              QueryHS.FieldByName('FLAG').AsBoolean := TRUE ;
                              QueryHS.Post ;
                              QueryHS.Next ;
                         end ;
                         QueryHS.Close ;
                    end ;
               end ;
               TableUSER.Next ;
          end ;

          TableUSER.EnableControls ;

          TableUSER.GotoBookmark( BookMark ) ;
          TableUSER.FreeBookmark( BookMark ) ;
     end ;
end;

procedure TMainForm.N29EClick(Sender: TObject);
var
   SQLcommand : string ;
   BookMark : TBookMark ;
begin
     //judge if TableUser is open
     if (PrjHead.OpenFlag=FALSE) then
     begin
          Application.MessageBox ( '请打开工程文件！',
                                   pChar(AppName),
                                   MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     //at page TabSheet1
     if (YSZLPageControl.ActivePage<>TabSheet1) then exit ;
     //select all
     with Dbs do
     begin

          BookMark := TableUSER.GetBookmark ;
          TableUSER.DisableControls ;

          TableUSER.First ;

          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;

               if ((TableUSER.FieldByName('WLP').AsString='T')or(TableUSER.FieldByName('WLP').AsString='B')) then
               begin
                    TableUSER.Edit ;
                    TableUSER.FieldByName('FLAG').AsBoolean := FALSE ;
                    TableUSER.Post ;
               end else
               begin
                    TableUSER.Edit ;
                    TableUSER.FieldByName('FLAG').AsBoolean := FALSE ;
                    TableUSER.Post ;

                    if (TableUSER.FieldByName('BZ').AsString<>'') then
                    begin
                         QueryHS.Close ;
                         SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where BZ='+'"'+TableUSER.FieldByName('BZ').AsString+'"' ;
                         QueryHS.SQL.Clear ;
                         QueryHS.SQL.Add ( SQLCommand ) ;
                         QueryHS.RequestLive := TRUE ;
                         QueryHS.Open ;
                         QueryHS.First ;
                         while (TRUE) do
                         begin
                              if (QueryHS.Eof) then
                                 break ;
                              QueryHS.Edit ;
                              QueryHS.FieldByName('FLAG').AsBoolean := FALSE ;
                              QueryHS.Post ;
                              QueryHS.Next ;
                         end ;
                         QueryHS.Close ;
                    end ;
               end ;
               TableUSER.Next ;
          end ;

          TableUSER.EnableControls ;

          TableUSER.GotoBookmark( BookMark ) ;
          TableUSER.FreeBookmark( BookMark ) ;
     end ;
end;

procedure TMainForm.N30Click(Sender: TObject);
begin
     DEQueryDlg.ShowModal ;
end;

procedure TMainForm.N31Click(Sender: TObject);
begin
     CLQueryDlg.ShowModal ;
end;

procedure TMainForm.N32Click(Sender: TObject);
begin
     CLLBDlg.ShowModal ;
end;

procedure TMainForm.N33Click(Sender: TObject);
begin
     GZDJDlg.ShowModal ;
end;

procedure TMainForm.N34Click(Sender: TObject);
begin
     SPTDlg.ShowModal ;
end;

procedure TMainForm.N36Click(Sender: TObject);
var
   QBCDE : TQuery ;
   TBCDE : TTable ;
   SQLCommand : string ;
   path : string ;
begin

     WaitDlg.Show ;
     WaitDlg.RePaint ;

     try
        MKDir ('BCDE') ;
     except
     end ;

     GetDir(0,path) ;

     path := path+'\BCDE\' ;

     QBCDE := TQuery.Create(Self) ;
     TBCDE := TTable.Create(Self) ;

     QBCDE.DatabaseName := 'DBF' ;

     //backup code
     SQLCommand := 'SELECT * FROM CODE WHERE LB3="1.0"' ;
     QBCDE.Close ;
     QBCDE.SQL.Clear ;
     QBCDE.SQL.Add (SQLCommand) ;
     TBCDE.Close ;
     TBCDE.TableName := path+'CODE.DB' ;
     TBCDE.BatchMove (QBCDE, batCopy) ;
     //backup newde
     SQLCommand := 'SELECT * FROM NEWDE WHERE P5="1.0"' ;
     QBCDE.Close ;
     QBCDE.SQL.Clear ;
     QBCDE.SQL.Add (SQLCommand) ;
     TBCDE.Close ;
     TBCDE.TableName := path+'NEWDE.DB' ;
     TBCDE.BatchMove (QBCDE, batCopy) ;
     //backup dezc
     SQLCommand := 'SELECT DEZC.ID,DEZC.BH,DEZC.CODE,DEZC.HL,DEZC.LB FROM DEZC,NEWDE' ;
     SQLCommand := SQLcommand+' WHERE NEWDE.P5="1.0" AND DEZC.ID=NEWDE.ID AND DEZC.BH=NEWDE.BH' ;
     QBCDE.Close ;
     QBCDE.SQL.Clear ;
     QBCDE.SQL.Add (SQLCommand) ;
     TBCDE.Close ;
     TBCDE.TableName := path+'DEZC.DB' ;
     TBCDE.BatchMove (QBCDE, batCopy) ;
     //backup defx
     SQLCommand := 'SELECT DEFX.ID,DEFX.BH,DEFX.CODE,DEFX.HL,DEFX.LB,DEFX.FL,DEFX.FLCODE FROM DEFX,NEWDE' ;
     SQLCommand := SQLcommand+' WHERE NEWDE.P5="1.0" AND DEFX.ID=NEWDE.ID AND DEFX.BH=NEWDE.BH' ;
     QBCDE.Close ;
     QBCDE.SQL.Clear ;
     QBCDE.SQL.Add (SQLCommand) ;
     TBCDE.Close ;
     TBCDE.TableName := path+'DEFX.DB' ;
     TBCDE.BatchMove (QBCDE, batCopy) ;

     QBCDE.Close ;
     TBCDE.Close ;
     QBCDE.Free ;
     TBCDE.Free ;

     WaitDlg.Hide ;
end;

procedure TMainForm.N37Click(Sender: TObject);
var
   TBCDE : TTable ;
   path : string ;
begin

     WaitDlg.Show ;
     WaitDlg.RePaint ;

     GetDir(0,path) ;
     path := path+'\BCDE\' ;

     TBCDE := TTable.Create(Self) ;
     //restore code
     TBCDE.TableName := path+'CODE.DB' ;
     Dbs.TableCODE.Close ;
     try
        Dbs.TableCODE.BatchMove ( TBCDE, batAppendUpdate ) ;
     except
     end ;
     Dbs.TableCODE.Open ;
     //restore newde
     TBCDE.TableName := path+'NEWDE.DB' ;
     Dbs.TableDE.Close ;
     try
        Dbs.TableDE.BatchMove ( TBCDE, batAppendUpdate ) ;
     except
     end ;
     Dbs.TableDE.Open ;
     //restore dezc
     TBCDE.TableName := path+'DEZC.DB' ;
     Dbs.TableDEZC.Close ;
     try
        Dbs.TableDEZC.BatchMove ( TBCDE, batAppendUpdate ) ;
     except
     end ;
     Dbs.TableDEZC.Open ;
     //restore defx
     TBCDE.TableName := path+'DEFX.DB' ;
     Dbs.TableDEFX.Close ;
     try
        Dbs.TableDEFX.BatchMove ( TBCDE, batAppendUpdate ) ;
     except
     end ;
     Dbs.TableDEFX.Open ;

     TBCDE.Close ;
     TBCDE.Free ;

     WaitDlg.Hide ;
end;

procedure TMainForm.N40Click(Sender: TObject);
begin
     Application.HelpFile := 'NEWYSZL.HLP';
     Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TMainForm.N42Click(Sender: TObject);
begin
     AboutBox.ShowModal ;
end;

procedure TMainForm.ToolButton2Click(Sender: TObject);
var
   p : TPoint ;
begin
     p.x := ToolButton2.Left+2 ;
     p.y := ToolButton2.Top+ToolButton2.Height+2 ;
     p := ClientToScreen(p) ;
     PopupMenuDESR.Popup (p.x, p.y) ;
end;

procedure TMainForm.BitBtn11Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     RefreshTabSheet1 ;
end;

procedure TMainForm.BitBtn12Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     XZZDDlg.ShowModal ;
end;

procedure TMainForm.BitBtn13Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     if (Dbs.TableUSER.FieldByName('WLP').AsString<>'FDE') then
     begin
          Application.MessageBox ( '对不起,您选择的子目不是定额,请重新选择!',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (not GetSearchDeRec(Dbs.TableDE, Dbs.TableUSER.FieldByName('DEID').AsInteger, UpperCase(Dbs.TableUSER.FieldByName('CODE').AsString))) then
     begin
          Application.MessageBox ( '对不起,在定额库中没有找到选择的定额子目,或者该定额已经换算过,请检查!',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
          EditBuffer := '' ;
          exit ;
     end ;
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
              InsertWJJCL(Dbs.TableUSER) ;
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
                 InsertMMCL(Dbs.TableUSER) ;
         end ;
     end ;
     RefreshTabSheet1 ;
end;

procedure TMainForm.BitBtn14Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     if (Dbs.TableUSER.FieldByName('WLP').AsString<>'FDE') then
     begin
          Application.MessageBox ( '对不起,您选择的子目不是定额,请重新选择!',
                                   pChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     DEHSDlg.ShowModal ;
     RefreshTabSheet1 ;
end;

procedure TMainForm.BitBtn15Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;

     TSelectDlg.ShowModal ;
     XJTHSPTDlg.Tag := TSelectDlg.Tag ;
     XJTHSPTDlg.ShowModal ;
     RefreshTabSheet1 ;
end;

procedure TMainForm.BitBtn16Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     XXJDlg.Tag := 0 ;
     XXJDlg.ShowModal ;
     RefreshTabSheet1 ;
end;

procedure TMainForm.BitBtn17Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     TSelectDlg.ShowModal ;
     JSJDlg.Tag := TSelectDlg.Tag ;
     JSJDlg.ShowModal ;
     RefreshTabSheet1 ;
end;

procedure TMainForm.BitBtn21Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     RefreshTabSheet2 ;
end;

procedure TMainForm.BitBtn22Click(Sender: TObject);
var
   ID : string[10] ;
   NUM: shortint ;
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if (TableUSER.FieldByName('WLP').AsString='T') then
             TableUSER.Next ;
          ID  := TableUSER.FieldByName('ID').AsString ;
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          TableUSER.InsertRecord ([FALSE, ID, NUM, Nil, Nil, Nil, '1']) ;
     end ;
     BitBtn21.Click ;
end;

procedure TMainForm.BitBtn23Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if ((TableUSER.FieldByName('WLP').AsString='T')or(TableUSER.FieldByName('WLP').AsString='B')) then
          begin
               Application.MessageBox( '该子目不可以删除,请重新删除!',
                                       pChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
          if (Application.MessageBox( '将要删除当前子目,继续吗?',
                                      pChar(AppName),
                                      MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
             exit ;
          TableUSER.Delete ;
     end ;
     BitBtn21.Click ;
end;


procedure TMainForm.BitBtn31Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     RefreshTabSheet3 ;
end;

procedure TMainForm.BitBtn32Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;

     MainPWD := '' ;
     WatchDog ;
     if (MainPWD='NODOG') then
     begin
          Application.MessageBox( '没有检测到软件狗!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (copy(MainPWD,1,10)<>'QASSYSDEMO') then
     begin
          Application.MessageBox( '软件狗没有授权,请与潮涌公司联系!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (MainPWD[10+PrjHead.GclbId]='*') then
     begin
          Application.MessageBox( pChar('软件狗没有授权'+PrjHead.Gclb+',请与潮涌公司联系!'),
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;

     WaitDlg.Show ;
     WaitDlg.RePaint ;
     RefreshRCJ ;
     WaitDlg.Hide ;
     BitBtn31.Click ;
end;

procedure TMainForm.BitBtn33Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;

     MainPWD := '' ;
     WatchDog ;
     if (MainPWD='NODOG') then
     begin
          Application.MessageBox( '没有检测到软件狗!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (copy(MainPWD,1,10)<>'QASSYSDEMO') then
     begin
          Application.MessageBox( '软件狗没有授权,请与潮涌公司联系!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (MainPWD[10+PrjHead.GclbId]='*') then
     begin
          Application.MessageBox( pChar('软件狗没有授权'+PrjHead.Gclb+',请与潮涌公司联系!'),
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;

     WaitDlg.Show ;
     WaitDlg.RePaint ;
     ZRJXTB ;
     WaitDlg.Hide ;
end;

procedure TMainForm.BitBtn34Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;

     MainPWD := '' ;
     WatchDog ;
     if (MainPWD='NODOG') then
     begin
          Application.MessageBox( '没有检测到软件狗!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (copy(MainPWD,1,10)<>'QASSYSDEMO') then
     begin
          Application.MessageBox( '软件狗没有授权,请与潮涌公司联系!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (MainPWD[10+PrjHead.GclbId]='*') then
     begin
          Application.MessageBox( pChar('软件狗没有授权'+PrjHead.Gclb+',请与潮涌公司联系!'),
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
        
     ZZJDlg.ShowModal ;
end;

procedure TMainForm.BitBtn35Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;

     MainPWD := '' ;
     WatchDog ;
     if (MainPWD='NODOG') then
     begin
          Application.MessageBox( '没有检测到软件狗!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (copy(MainPWD,1,10)<>'QASSYSDEMO') then
     begin
          Application.MessageBox( '软件狗没有授权,请与潮涌公司联系!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (MainPWD[10+PrjHead.GclbId]='*') then
     begin
          Application.MessageBox( pChar('软件狗没有授权'+PrjHead.Gclb+',请与潮涌公司联系!'),
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;

     XXJDlg.Tag := 1 ;
     XXJDlg.ShowModal ;
end;

procedure TMainForm.BitBtn36Click(Sender: TObject);
var
   SQLCommand : string ;
   BookMark : TBookMark ;
begin
     if (ManDWGCDlg.ShowModal=IDOK) then
     begin
          if (ManDWGCDlg.FName=Dbs.TableUSER.TableName) then
          begin
               Application.MessageBox( '对不起，您选择的文件正在编辑，请重新选择！',
                                       pChar(AppName),
                                       MB_OK or MB_ICONSTOP );
               exit ;
          end ;

          WaitDlg.Show ;
          WaitDlg.RePaint ;

          BookMark := Dbs.TableUSER.GetBookmark ;
          Dbs.TableUSER.DisableControls ;

          Dbs.QueryUSER.Close ;
          Dbs.QueryUSER.DataBaseName := 'USER' ;
          Dbs.TableUSER.First ;
          while (TRUE) do
          begin
               if (Dbs.TableUSER.EOF) then
                  break ;

               if (Dbs.TableUSER.FieldByName('WLP').AsString='FCL') then
               begin
                    SQLCommand := 'SELECT * FROM "'+ManDWGCDlg.FName+'" WHERE ID="RCJ"' ;
                    SQLCommand := SQLCommand+' AND CODE="'+Dbs.TableUSER.FieldByName('CODE').AsString+'"' ;
                    SQLCommand := SQLCommand+' AND DEID='+Dbs.TableUSER.FieldByName('DEID').AsString ;
                    SQLCommand := SQLCommand+' AND CODEID='+Dbs.TableUSER.FieldByName('CODEID').AsString ;
                    Dbs.QueryUSER.Close ;
                    Dbs.QueryUSER.SQL.Clear ;
                    Dbs.QueryUSER.SQL.Add (SQLCommand) ;
                    Dbs.QueryUSER.Open ;
                    if (Dbs.QueryUSER.RecordCount<>0) then
                    begin
                         Dbs.TableUSER.Edit ;
                         Dbs.TableUSER.FieldByName('LABFEE').AsFloat := Dbs.QueryUSER.FieldByName('LABFEE').AsFloat ;
                         Dbs.TableUSER.Post
                    end ;
               end ;

               Dbs.TableUSER.Next ;
          end ;

          Dbs.QueryUSER.Close ;

          Dbs.TableUSER.GotoBookmark ( BookMark ) ;
          Dbs.TableUSER.FreeBookmark ( BookMark ) ;
          Dbs.TableUSER.EnableControls ;

          WaitDlg.Hide ;
     end ;
end;

procedure TMainForm.BitBtn41Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     RefreshTabSheet4 ;
end;

procedure TMainForm.BitBtn42Click(Sender: TObject);
var
   ID : string[10] ;
   NUM: shortint ;
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if (TableUSER.FieldByName('WLP').AsString='T') then
             TableUSER.Next ;
          ID  := TableUSER.FieldByName('ID').AsString ;
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          TableUSER.InsertRecord ([FALSE, ID, NUM, 'FCL', Nil, Nil, '1']) ;
     end ;
     BitBtn41.Click ;
end;

procedure TMainForm.BitBtn43Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if ((TableUSER.FieldByName('WLP').AsString='T')or(TableUSER.FieldByName('WLP').AsString='B')) then
          begin
               Application.MessageBox( '该子目不可以删除,请重新删除!',
                                       pChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
          if (Application.MessageBox( '将要删除当前子目,继续吗?',
                                      pChar(AppName),
                                      MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
             exit ;
          TableUSER.Delete ;
     end ;
     BitBtn41.Click ;
end;

procedure TMainForm.BitBtn51Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     RefreshTabSheet5 ;
end;

procedure TMainForm.BitBtn52Click(Sender: TObject);
var
   ID : string[10] ;
   NUM: shortint ;
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if (TableUSER.FieldByName('WLP').AsString='T') then
             TableUSER.Next ;
          ID  := TableUSER.FieldByName('ID').AsString ;
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          TableUSER.InsertRecord ([FALSE, ID, NUM, 'FCL', Nil, Nil, '1']) ;
     end ;
     BitBtn51.Click ;
end;

procedure TMainForm.BitBtn53Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if ((TableUSER.FieldByName('WLP').AsString='T')or(TableUSER.FieldByName('WLP').AsString='B')) then
          begin
               Application.MessageBox( '该子目不可以删除,请重新删除!',
                                       pChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
          if (Application.MessageBox( '将要删除当前子目,继续吗?',
                                      pChar(AppName),
                                      MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
             exit ;
          TableUSER.Delete ;
     end ;
     BitBtn51.Click ;
end;

procedure TMainForm.BitBtn61Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     RefreshTabSheet6 ;
end;

procedure TMainForm.BitBtn62Click(Sender: TObject);
var
   ID : string[10] ;
   NUM: shortint ;
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if (TableUSER.FieldByName('WLP').AsString='T') then
             TableUSER.Next ;
          ID  := TableUSER.FieldByName('ID').AsString ;
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          TableUSER.InsertRecord ([FALSE, ID, NUM, 'FCL', Nil, Nil, '1']) ;
     end ;
     BitBtn61.Click ;
end;

procedure TMainForm.BitBtn63Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if ((TableUSER.FieldByName('WLP').AsString='T')or(TableUSER.FieldByName('WLP').AsString='B')) then
          begin
               Application.MessageBox( '该子目不可以删除,请重新删除!',
                                       pChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
          if (Application.MessageBox( '将要删除当前子目,继续吗?',
                                      pChar(AppName),
                                      MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
             exit ;
          TableUSER.Delete ;
     end ;
     BitBtn61.Click ;
end;

procedure TMainForm.BitBtn71Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     RefreshTabSheet7 ;
end;

procedure TMainForm.BitBtn72Click(Sender: TObject);
var
   ID : string[10] ;
   NUM: shortint ;
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if (TableUSER.FieldByName('WLP').AsString='T') then
             TableUSER.Next ;
          ID  := TableUSER.FieldByName('ID').AsString ;
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          TableUSER.InsertRecord ([FALSE, ID, NUM, 'FCL', Nil, Nil, '1']) ;
     end ;
     BitBtn71.Click ;
end;

procedure TMainForm.BitBtn73Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if ((TableUSER.FieldByName('WLP').AsString='T')or(TableUSER.FieldByName('WLP').AsString='B')) then
          begin
               Application.MessageBox( '该子目不可以删除,请重新删除!',
                                       pChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
          if (Application.MessageBox( '将要删除当前子目,继续吗?',
                                      pChar(AppName),
                                      MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
             exit ;
          TableUSER.Delete ;
     end ;
     BitBtn71.Click ;
end;


procedure TMainForm.BitBtn81Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     SFLDlg.Tag := PrjHead.GclbId ;
     SFLDlg.ShowModal ;
end;

procedure TMainForm.BitBtn82Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;

     MainPWD := '' ;
     WatchDog ;
     if (MainPWD='NODOG') then
     begin
          Application.MessageBox( '没有检测到软件狗!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (copy(MainPWD,1,10)<>'QASSYSDEMO') then
     begin
          Application.MessageBox( '软件狗没有授权,请与潮涌公司联系!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     if (MainPWD[10+PrjHead.GclbId]='*') then
     begin
          Application.MessageBox( pChar('软件狗没有授权'+PrjHead.Gclb+',请与潮涌公司联系!'),
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;

     WaitDlg.Show ;
     WaitDlg.RePaint ;
     CalcPrjZJ ;
     WaitDlg.Hide ;
end;

procedure TMainForm.BitBtn83Click(Sender: TObject);
var
   ID : string[10] ;
   NUM: shortint ;
   WLP: string[10] ;
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if (TableUSER.FieldByName('WLP').AsString='T') then
             TableUSER.Next ;
          ID  := TableUSER.FieldByName('ID').AsString ;
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          WLP := TableUSER.FieldByName('WLP').AsString ;
          TableUSER.InsertRecord ([FALSE, ID, NUM, WLP, Nil, Nil, '1']) ;
     end ;
     RefreshTabSheet8 ;
end;

procedure TMainForm.BitBtn84Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if ((TableUSER.FieldByName('WLP').AsString='T')or(TableUSER.FieldByName('WLP').AsString='B')) then
          begin
               Application.MessageBox( '该子目不可以删除,请重新删除!',
                                       pChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
          if (Application.MessageBox( '将要删除当前子目,继续吗?',
                                      pChar(AppName),
                                      MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
             exit ;
          TableUSER.Delete ;
     end ;
     RefreshTabSheet8 ;
end;

procedure TMainForm.BitBtn91Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     RefreshTabSheet9 ;
end;

procedure TMainForm.BitBtn92Click(Sender: TObject);
var
   ID : string[10] ;
   NUM: shortint ;
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          ID  := TableUSER.FieldByName('ID').AsString ;
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          TableUSER.InsertRecord ([FALSE, ID, 1, 'FM', Nil, Nil, '1']) ;
     end ;
     BitBtn91.Click ;
end;

procedure TMainForm.BitBtn93Click(Sender: TObject);
begin
     if (PrjHead.OpenFlag=FALSE) then
     begin
          ClearSearchDeRec ;
          Application.MessageBox( '没有打开工程文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     with Dbs do
     begin
          if ((TableUSER.FieldByName('WLP').AsString='T')or(TableUSER.FieldByName('WLP').AsString='B')) then
          begin
               Application.MessageBox( '该子目不可以删除,请重新删除!',
                                       pChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
          if (Application.MessageBox( '将要删除当前子目,继续吗?',
                                      pChar(AppName),
                                      MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
             exit ;
          TableUSER.Delete ;
     end ;
     BitBtn91.Click ;
end;

procedure TMainForm.RPTRadioGroupClick(Sender: TObject);
begin
     case RptRadioGroup.ItemIndex of
     0 :
         begin
              RPTCheckListBox.Items[2] := '工程预算书(1)';
              RPTCheckListBox.Items[3] := '工程预算书(2)';
              RPTCheckListBox.Items[4] := '工程预算书(3)';
              RPTCheckListBox.Items[5] := '工程预算书(4)';
         end ;
     1 :
         begin
              RPTCheckListBox.Items[2] := '工程决算书(1)';
              RPTCheckListBox.Items[3] := '工程决算书(2)';
              RPTCheckListBox.Items[4] := '工程决算书(3)';
              RPTCheckListBox.Items[5] := '工程决算书(4)';
         end ;
     2 :
         begin
              RPTCheckListBox.Items[2] := '工程招标书(1)';
              RPTCheckListBox.Items[3] := '工程招标书(2)';
              RPTCheckListBox.Items[4] := '工程招标书(3)';
              RPTCheckListBox.Items[5] := '工程招标书(4)';
         end ;
     3 :
         begin
              RPTCheckListBox.Items[2] := '工程投标书(1)';
              RPTCheckListBox.Items[3] := '工程投标书(2)';
              RPTCheckListBox.Items[4] := '工程投标书(3)';
              RPTCheckListBox.Items[5] := '工程投标书(4)';
         end ;
     end ;
end;

procedure TMainForm.DBGrid9DblClick(Sender: TObject);
begin
     with Dbs do
     begin
          TableUSER.Edit ;
          if (TableUSER.FieldByName('CODE').AsString='工程造价') then
             TableUSER.FieldByName('NAME').AsString := format('%0.2f',[PrjHead.GCZJ]) ;
          if (TableUSER.FieldByName('CODE').AsString='编制日期') then
             TableUSER.FieldByName('NAME').AsString := DateToStr(Date) ;
          TableUSER.Post ;
     end ;
end;

end.

