unit MANDWGC;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, DBTables, Grids, DBGrids, Db;

type
  TManDWGCDlg = class(TForm)
    ListBoxUSER: TListBox;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PanelTitle: TPanel;
    TableTEMP: TTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    FName : string ;
  end;

var
  ManDWGCDlg: TManDWGCDlg;

implementation

uses main, YSZLDBS;

{$R *.DFM}

procedure TManDWGCDlg.FormShow(Sender: TObject);
begin
     TableTEMP.Close ;
     ListBoxUSER.Items.Clear ;
     Session.GetTableNames(Dbs.UserDatabase.DatabaseName,'',FALSE,FALSE,ListBoxUSER.Items) ;
     ListBoxUSER.ItemIndex := 0 ;
     ListBoxUSER.SetFocus ;
end;

procedure TManDWGCDlg.BitBtn1Click(Sender: TObject);
begin
     FName := ListBoxUSER.Items[ListBoxUSER.ItemIndex] ;
     if (FName='') then
     begin
          Application.MessageBox('对不起，您没有选择工程文件！',
                                 PChar(AppName),
                                 MB_OK or MB_ICONINFORMATION) ;
          exit ;
     end ;
     ModalResult := IDOK ;
end;

procedure TManDWGCDlg.BitBtn2Click(Sender: TObject);
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

procedure TManDWGCDlg.BitBtn3Click(Sender: TObject);
begin
     TableTEMP.Close ;
     ModalResult := IDCANCEL ;
end;

procedure TManDWGCDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MainForm.OnKeyUp (MainForm, Key, Shift) ;
end;

end.
