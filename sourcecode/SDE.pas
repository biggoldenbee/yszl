unit SDE;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Db, Grids, DBGrids, DBTables, Mask, DBCtrls, DECZ,
  ComCtrls;

type
  TSDEDlg = class(TForm)
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
    QuitBitBtn: TBitBtn;
    TabControlDE: TTabControl;
    DBGridDE: TDBGrid;
    Bevel1: TBevel;
    Label14: TLabel;
    EditBH: TEdit;
    Label15: TLabel;
    EditMC: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditBHKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuitBitBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TabControlDEChange(Sender: TObject);
    procedure EditMCKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    DEID : smallint ;
  end;

var
  SDEDlg: TSDEDlg;

implementation
{$R *.DFM}
uses MAIN, YSZLDBS, BCDE, DEHS ;

procedure TSDEDlg.FormShow(Sender: TObject);
begin
     EditBH.Text := '' ;
     EditMC.Text := '' ;
     DBGridDE.ReadOnly := TRUE ;

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

procedure TSDEDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TableDE.Close ;
     TableDE.Filter := '' ;
     TableDE.Filtered := FALSE ;
     TabControlDE.Tabs.Clear ;
end;

procedure TSDEDlg.EditBHKeyUp(Sender: TObject; var Key: Word;
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

procedure TSDEDlg.EditMCKeyUp(Sender: TObject; var Key: Word;
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

procedure TSDEDlg.QuitBitBtnClick(Sender: TObject);
begin
     Self.Close ;
end;

procedure TSDEDlg.BitBtn1Click(Sender: TObject);
begin
     case Self.Tag of
     0 :
         begin
              with DEHSDlg do
              begin
                   if (GetSearchDeRec(Dbs.TableDE, TableDE.FieldByName('ID').AsInteger, TableDE.FieldByName('BH').AsString)) then
                   begin
                        HSDETEMP.AppendRecord([TableDE.FieldByName('ID').AsInteger, TableDE.FieldByName('BH').AsString]) ;
                        WriteHSDETEMP(TableDE.FieldByName('ID').AsInteger, 0.0) ;
                   end ;
              end ;
         end ;
     1 :
         begin
              with BCDEDlg do
              begin
                   DEZCTEMP.DisableControls ;
                   DEZCTEMP.First ;
                   while (TRUE) do
                   begin
                        if (DEZCTEMP.EOF) then
                           break ;
                        if (DEZCTEMP.FieldByName('CODE').AsString=TableDE.FieldByName('BH').AsString) then
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
                   DEZCTEMP.FieldByName ('CODE').AsString := TableDE.FieldByName('BH').AsString ;
                   DEZCTEMP.FieldByName ('LB').AsString   := TableDE.FieldByName('DEMC').AsString ;
                   DEZCTEMP.Post ;
              end ;
         end ;
     end ;
end;

procedure TSDEDlg.TabControlDEChange(Sender: TObject);
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

end.

