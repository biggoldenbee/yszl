unit MANGCWJ;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, DBTables, Grids, DBGrids, Db, Dialogs;

type
  TManGCWJDlg = class(TForm)
    ListBoxUSER: TListBox;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    PanelTitle: TPanel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    TableTEMP: TTable;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    ODialog: TOpenDialog;
    function  CheckFile(FName:string) : boolean ;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FName : string ;
  end;

var
  ManGCWJDlg: TManGCWJDlg;

implementation

uses main, YSZLDBS, NEWDWGC, MANPRJ, SDRIVE, COPYDLG;

{$R *.DFM}

function TManGCWJDlg.CheckFile(FName : string) : boolean ;
begin
     Result := FALSE ;
     //check if is a empty table
     if (FName='') then
     begin
          Dbs.CreateNewDwgc(NewDWGCDLG.DWGCMC,NewDWGCDLG.DWGCZYLBID) ;
          FName := Dbs.TableUSER.TableName ;
     end ;
     //check tableuser if exsit
     if (Dbs.TableUSER.Active=TRUE) then Dbs.TableUSER.Close ;
     Dbs.TableUSER.TableName := FName ;
     try
        Dbs.TableUSER.Open ;
     except
     on EDataBaseError do
        begin
             Dbs.TableUSER.Close ;
             if (Application.MessageBox('对不起，该单位工程文件不存在，您是否要重新生成单位工程文件？',
                                        PChar(AppName),
                                        MB_OKCANCEL or MB_ICONQUESTION)=IDCANCEL) then
                exit ;
             Dbs.CreateNewDwgc(NewDWGCDLG.DWGCMC,NewDWGCDLG.DWGCZYLBID) ;
        end ;
     end ;
     Dbs.TableUSER.Close ;
     Result := TRUE ;
end ;

procedure TManGCWJDlg.FormShow(Sender: TObject);
begin
     TableTEMP.Close ;
     ListBoxUSER.Items.Clear ;
     Session.GetTableNames(Dbs.UserDatabase.DatabaseName,'',FALSE,FALSE,ListBoxUSER.Items) ;
     ListBoxUSER.ItemIndex := 0 ;
     ListBoxUSER.SetFocus ;
end;

procedure TManGCWJDlg.BitBtn1Click(Sender: TObject);
begin
     NewDWGCDlg.XMTID  := 1 ;
     NewDWGCDlg.FXGCID := 1 ;
     if (NewDWGCDlg.ShowModal=IDOK) then
     begin
          if (CheckFile('')=TRUE) then
          begin
               FNAME := Dbs.TableUSER.TableName ;
               Dbs.TableDWGC.Edit ;
               Dbs.TableDWGC.FieldByName('FNAME').AsString := FNAME ;
               Dbs.TableDWGC.Post ;
               FormShow(Self);
          end ;
     end ;
end;

procedure TManGCWJDlg.BitBtn2Click(Sender: TObject);
begin
     TableTEMP.Close ;
     FName := ListBoxUSER.Items[ListBoxUSER.ItemIndex] ;
     if (FName='') then
     begin
          Application.MessageBox('对不起，您没有选择工程文件！',
                                 PChar(AppName),
                                 MB_OK or MB_ICONINFORMATION) ;
          exit ;
     end ;
     ManPrjDlg.DWGCFNAME := FName ;
     ModalResult := IDOK ;
end;

procedure TManGCWJDlg.BitBtn3Click(Sender: TObject);
begin
     if (SDriveDlg.ShowModal=IDOK) then
     begin
          FName := ListBoxUSER.Items[ListBoxUSER.ItemIndex] ;
          //Show CopyFileDlg
          CopyFileDlg.Show ;
          //Copy User File
          FName := FName+'.DB' ;
          CopyFileDlg.f1 := Dbs.UserDatabase.Directory+FName ;
          CopyFileDlg.f2 := SDriveDlg.directory+FName ;
          CopyFileDlg.Repaint ;
          //Hide CopyFileDlg
          CopyFileDlg.Hide ;
     end ;
end;

procedure TManGCWJDlg.BitBtn4Click(Sender: TObject);
begin
     if (ODialog.Execute) then
     begin
          FName := ExtractFileName(ODialog.FileName) ;
          //Show CopyFileDlg
          CopyFileDlg.Show ;
          //Copy User File
          CopyFileDlg.f1 := ODialog.FileName ;
          CopyFileDlg.f2 := Dbs.UserDatabase.Directory+FName ;
          CopyFileDlg.Repaint ;
          //Hide CopyFileDlg
          CopyFileDlg.Hide ;
     end ;
     FormShow(Self);
end;

procedure TManGCWJDlg.BitBtn5Click(Sender: TObject);
begin
     if (Application.MessageBox(PChar('您真的删除工程文件['+ListBoxUSER.Items[ListBoxUSER.ItemIndex]+']吗？'),
                                PChar(AppName),
                                MB_OKCANCEL or MB_ICONQUESTION)=IDCANCEL) then
        exit ;
     if (Dbs.TableUSER.TableName=ListBoxUSER.Items[ListBoxUSER.ItemIndex]) then
     begin
          Application.MessageBox('对不起，您要删除的文件正在使用！',
                                 PChar(AppName),
                                 MB_OK or MB_ICONINFORMATION) ;
          exit ;
     end ;
     TableTEMP.TableName := ListBoxUSER.Items[ListBoxUSER.ItemIndex] ;
     TableTEMP.DeleteTable ;
     Self.FormShow (Self) ;
end;

procedure TManGCWJDlg.BitBtn6Click(Sender: TObject);
begin
     TableTEMP.Close ;
     ModalResult := IDCANCEL ;
end;

procedure TManGCWJDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MainForm.OnKeyUp (MainForm, Key, Shift) ;
end;

end.
