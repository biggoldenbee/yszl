unit COPYDLG;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls;

type
  TCopyFileDlg = class(TForm)
    FromLabel: TLabel;
    ToLabel: TLabel;
    ProgressBar: TProgressBar;
    procedure InitInterface ;
    procedure CopyFile(f1 : string; f2 : string) ;
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    f1 : string ;
    f2 : string ;
  end;

var
  CopyFileDlg: TCopyFileDlg;

implementation
uses main ;
{$R *.DFM}
procedure TCopyFileDlg.InitInterface ;
begin
     FromLabel.Caption := '' ;
     ToLabel.Caption := '' ;
     ProgressBar.Position := 0 ;
end ;

procedure TCopyFileDlg.CopyFile(f1 : string; f2 : string) ;
var
   spath, dpath : string ;
   d : byte ;
   dfreesize : integer ;
   FromStream, ToStream : TFileStream ;
begin
     InitInterface ;

     if (f1=f2) then
     begin
          Application.MessageBox( '对不起，您要备份的文件已经存在！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;

     spath := UpperCase(ExtractFilePath(f1)) ;
     dpath := UpperCase(ExtractFilePath(f2)) ;

     if (spath='') then
     begin
          GetDir(0,spath) ;
          spath := UpperCase(spath) ;
     end ;
     if (dpath='') then
     begin
          GetDir(0,dpath) ;
          dpath := UpperCase(dpath) ;
     end ;
     d := ord(dpath[1])-ord('A') ;
     d := d+1 ;
     dfreesize := DiskFree(d) ;

     try
        FromStream := TFileStream.Create (f1, fmOpenRead) ;
     except
           Application.MessageBox( '不能够打开要备份的源文件，请检查！',
                                   PChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
           exit ;
     end ;

     if (dfreesize<FromStream.Size) then
     begin
          if (Application.MessageBox( '对不起，磁盘空间不够！继续吗？',
                                      PChar(AppName),
                                      MB_OKCANCEL or MB_ICONSTOP )=IDCANCEL) then
          begin
               FromStream.Free ;
               exit ;
          end else
          begin
               FromStream.Free ;
               Self.Repaint ;
          end ;
     end ;

     try
        ToStream := TFileStream.Create (f2, fmCreate) ;
     except
           Application.MessageBox( '对不起，不能够生成备份文件！请检查磁盘！',
                                   PChar(AppName),
                                   MB_OK or MB_ICONSTOP ) ;
           FromStream.Free ;
           exit ;
     end ;

     FromLabel.Caption := '复制['+f1+']' ;
     ToLabel.Caption := '到['+f2+']' ;
     with ProgressBar  do
     begin
          min := 0 ;
          max := FromStream.Size ;
          Position := 0 ;
          Step := 512 ;
          Application.ProcessMessages ;
          While((ToStream.Position+Step)<=FromStream.Size) do
          begin
               try
                  ToStream.CopyFrom (FromStream, Step) ;
               except
                     Application.MessageBox( '备份文件出错，请检查！',
                                             PChar(AppName),
                                             MB_OK or MB_ICONSTOP ) ;
                     FromStream.Free ;
                     ToStream.Free ;
                     exit ;
               end ;
               StepIt ;
          end ;

          if (ToStream.Size<>FromStream.Size) then
          begin
               try
                  ToStream.CopyFrom (FromStream, FromStream.Size-ToStream.Size ) ;
               except
                     Application.MessageBox( '备份文件出错，请检查！',
                                             PChar(AppName),
                                             MB_OK or MB_ICONSTOP ) ;
                     FromStream.Free ;
                     ToStream.Free ;
                     exit ;
               end ;
          end ;
          Position := ToStream.Size ;
     end ;
     FromStream.Destroy ;
     ToStream.Destroy ;
end ;

procedure TCopyFileDlg.FormShow(Sender: TObject);
begin
     InitInterface ;
end;

procedure TCopyFileDlg.FormPaint(Sender: TObject);
begin
     if (f1='') then
     begin
          exit ;
     end ;
     if (f2='') then
     begin
          exit ;
     end ;
     CopyFile(f1, f2) ;
end;

procedure TCopyFileDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MainForm.OnKeyUp (MainForm, Key, Shift) ;
end;

end.
