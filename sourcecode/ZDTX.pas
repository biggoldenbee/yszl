unit ZDTX;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, DB;

type
  TZDTXDlg = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    QuitBitBtn: TBitBtn;
    procedure AutoWriteCLB ;

    procedure QuitBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZDTXDlg: TZDTXDlg;

implementation

uses SCL;

{$R *.DFM}

procedure TZDTXDlg.QuitBitBtnClick(Sender: TObject);
begin
     Self.Close ;
end;

procedure TZDTXDlg.FormShow(Sender: TObject);
begin
     Edit1.Text := '' ;
     Edit2.Text := '0' ;
     Edit1.SetFocus ;
end;

procedure TZDTXDlg.AutoWriteCLB ;
var
   i,j : integer ;
   s : string ;
   BookMark : TBookMark ;
begin
     s := Edit1.Text ;
     try
        j := StrToInt (Edit2.Text) ;
     except
           j := 0 ;
     end ;
     with SCLDlg do
     begin
          BookMark := TableCL.GetBookmark ;
          TableCL.DisableControls ;
          i := 0 ;
          while (TRUE) do
          begin
               if (TableCL.EOF) then
                  break ;
               TableCL.Edit ;
               case DBGridCL.SelectedField.DataType of
               ftString   : DBGridCL.SelectedField.AsString  := s ;
               end ;
               TableCL.Post ;
               if (j>-1) then
               begin
                    if (i>=j) then
                       break ;
                    inc(i) ;
               end ;
               TableCL.Next ;
          end ;
          TableCL.First ;
          TableCL.GotoBookmark (BookMark) ;
          TableCL.FreeBookmark (BookMark) ;
          TableCL.EnableControls ;
     end ;
end ;

procedure TZDTXDlg.BitBtn1Click(Sender: TObject);
begin
     case Self.Tag of
     0 : ;
     1 : ;
     2 : AutoWriteCLB;
     end ;
end;

end.
