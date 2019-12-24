unit SCL;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Db, Grids, DBGrids, DBTables, Mask, DBCtrls, DECZ,
  ComCtrls, Tabs, Menus;

type
  TSCLDlg = class(TForm)
    DataSourceCL: TDataSource;
    TableCL: TTable;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QuitBitBtn: TBitBtn;
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
    TabSetCL: TTabSet;
    DBGridCL: TDBGrid;
    FunPopupMenu: TPopupMenu;
    FN1: TMenuItem;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditBHKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuitBitBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure TabControlCLChange(Sender: TObject);
    procedure EditMCKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSetCLClick(Sender: TObject);
    procedure FN1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CLID : smallint ;
    BS : smallint ;
  end;

var
  SCLDlg: TSCLDlg;

implementation
{$R *.DFM}
uses MAIN, YSZLDBS, ADDCL, CLXX, BCDE, ZDTX, DEHS;

procedure TSCLDlg.FormShow(Sender: TObject);
begin
     EditBH.Text := '' ;
     EditMC.Text := '' ;
     DBGridCL.ReadOnly := TRUE ;

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

procedure TSCLDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TableCL.Close ;
     TableCL.Filter := '' ;
     TableCL.Filtered := FALSE ;
     TabControlCL.Tabs.Clear ;
end;

procedure TSCLDlg.EditBHKeyUp(Sender: TObject; var Key: Word;
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

procedure TSCLDlg.EditMCKeyUp(Sender: TObject; var Key: Word;
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

procedure TSCLDlg.QuitBitBtnClick(Sender: TObject);
begin
     Self.Close ;
end;

procedure TSCLDlg.BitBtn1Click(Sender: TObject);
begin
     ADDCLDlg.BS := BS ;
     ADDCLDlg.CLID := CLID ;
     ADDCLDlg.ShowModal ;
     TableCL.Refresh ;
end;

procedure TSCLDlg.BitBtn2Click(Sender: TObject);
begin
     case Self.Tag of
     0 :
         begin
              with DEHSDlg do
              begin
                   if (CLID<>CODEID) then
                   begin
                        Application.MessageBox( '对不起,您选择的材料类别不相匹配,请选择匹配的材料!',
                                                pChar(AppName),
                                                MB_OK or MB_ICONSTOP ) ;
                        exit ;
                   end ;
                   if (GetSearchClRec(Dbs.TableCODE, CLID, TableCL.FieldByName('CODE').AsString)) then
                   begin
                        HSDETEMP.AppendRecord([0, TableCL.FieldByName('CODE').AsString]) ;
                        WriteHSDETEMP(0, 0.0) ;
                   end ;
              end ;
         end ;
     1 :
         begin
              with BCDEDlg do
              begin
                   if (CLID<>CODEID) then
                   begin
                        Application.MessageBox( '对不起,您选择的材料类别不相匹配,请选择匹配的材料!',
                                                pChar(AppName),
                                                MB_OK or MB_ICONSTOP ) ;
                        exit ;
                   end ;

                   DEZCTEMP.DisableControls ;
                   DEZCTEMP.First ;
                   while (TRUE) do
                   begin
                        if (DEZCTEMP.EOF) then
                           break ;
                        if (DEZCTEMP.FieldByName('CODE').AsString=TableCL.FieldByName('CODE').AsString) then
                        begin
                             DEZCTEMP.EnableControls ;
                             Application.MessageBox( '对不起,该材料已经存在!',
                                                     pChar(AppName),
                                                     MB_OK or MB_ICONSTOP ) ;
                             exit ;
                        end ;
                        DEZCTEMP.Next ;
                   end ;
                   DEZCTEMP.EnableControls ;
                   DEZCTEMP.AppendRecord([ID,BH]) ;
                   DEZCTEMP.Edit ;
                   DEZCTEMP.FieldByName ('CODE').AsString := TableCL.FieldByName('CODE').AsString ;
                   DEZCTEMP.FieldByName ('LB').AsString   := TableCL.FieldByName('LB1').AsString ;
                   DEZCTEMP.Post ;
              end ;
         end ;
     2 :
         begin
              with CLXXDlg do
              begin
                   if (CLID<>ID) then
                   begin
                        Application.MessageBox( '对不起,您选择的材料类别不相匹配,请选择匹配的材料!',
                                                pChar(AppName),
                                                MB_OK or MB_ICONSTOP ) ;
                        exit ;
                   end ;

                   CLFXTemp.DisableControls ;
                   CLFXTemp.First ;
                   BH := DBEdit1.Text ;
                   while (TRUE) do
                   begin
                        if (CLFXTemp.EOF) then
                           break ;
                        if (CLFXTEMP.FieldByName('CODE').AsString=TableCL.FieldByName('CODE').AsString) then
                        begin
                             CLFXTemp.EnableControls ;
                             Application.MessageBox( '对不起,该材料已经存在!',
                                                     pChar(AppName),
                                                     MB_OK or MB_ICONSTOP ) ;
                             exit ;
                        end ;
                        CLFXTemp.Next ;
                   end ;
                   CLFXTemp.EnableControls ;
                   CLFXTemp.AppendRecord ([CLID,BH]) ;
                   CLFXTemp.Edit ;
                   CLFXTemp.FieldByName('CODE').AsString   := TableCL.FieldByName('CODE').AsString ;
                   CLFXTemp.FieldByName('HL').AsFloat      := 0.0 ;
                   CLFXTemp.FieldByName('LB').AsString     := TableCL.FieldByName('LB1').AsString ;
                   CLFXTemp.FieldByName('FL').AsString     := TableCL.FieldByName('FL').AsString ;
                   CLFXTemp.FieldByName('FLCODE').AsString := TableCL.FieldByName('FLCODE').AsString ;
                   CLFXTemp.Post ;
              end ;
         end ;
     end ;
end;

procedure TSCLDlg.BitBtn3Click(Sender: TObject);
begin
     if (Application.MessageBox( '您真得删除当前定额吗？',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     TableCL.Delete ;
end;

procedure TSCLDlg.TabControlCLChange(Sender: TObject);
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

procedure TSCLDlg.TabSetCLClick(Sender: TObject);
begin
     TabControlCLChange(TabControlCL);
end;

procedure TSCLDlg.FN1Click(Sender: TObject);
begin
     ZDTXDlg.Tag := 2 ;
     ZDTXDlg.ShowModal ;
end;

end.

