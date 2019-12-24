unit SDRIVE;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, FileCtrl, Grids, Outline, DirOutln, Menus;

type
  TSDriveDlg = class(TForm)
    DirectoryListBox: TDirectoryListBox;
    DriveComboBox: TDriveComboBox;
    DirLabel: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DriveComboBoxClick(Sender: TObject);
    procedure DriveComboBoxChange(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    drive : char ;
    directory : string ;
    systemdir : string ;
  end;

var
  SDriveDlg: TSDriveDlg;

implementation

uses main;
{$R *.DFM}

procedure TSDriveDlg.FormShow(Sender: TObject);
begin
     drive := #0 ;
     directory := '' ;
     GetDir (0, systemdir) ;
     DriveComboBox.Drive := SystemDir[1] ;
     DirectoryListBox.Directory := SystemDir ;
end;

procedure TSDriveDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key=#13) then
        BitBtn1.OnClick (BitBtn1) ;
     if (Key=#27) then
        BitBtn2.OnClick (BitBtn2) ;
end;

procedure TSDriveDlg.BitBtn1Click(Sender: TObject);
var
   i : integer ;
begin
     drive := DirectoryListBox.Drive ;
     directory := DirectoryListBox.Directory ;
     i := length(directory) ;
     if (directory[i]<>'\') then
        directory := directory+'\' ;
     ModalResult := IDOK ;
end;

procedure TSDriveDlg.BitBtn2Click(Sender: TObject);
begin
     ModalResult := IDCANCEL ;
end;

procedure TSDriveDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     ChDir(systemdir) ;
end;

procedure TSDriveDlg.DriveComboBoxClick(Sender: TObject);
var
   s : string ;
   i : integer ;
begin
     s := UpperCase(DriveComboBox.Text) ;
     i := DiskSize(ord(s[1])-ord('A')+1) ;
     if (i<>-1) then exit ;
     Application.MessageBox( '对不起，您选择的驱动器没准备好，请检查！',
                             PChar(AppName),
                             MB_OK or MB_ICONSTOP ) ;
     DriveComboBox.Drive := #0 ;
end;

procedure TSDriveDlg.DriveComboBoxChange(Sender: TObject);
begin
     if (DriveComboBox.Drive<>DirectoryListBox.Drive) then
        DriveComboBox.Drive := DirectoryListBox.Drive ;
end;

procedure TSDriveDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MainForm.OnKeyUp (MainForm, Key, Shift) ;
end;

end.
