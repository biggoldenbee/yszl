unit Wjj;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls;

type
  TWJJDlg = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Panel2: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WJJDlg: TWJJDlg;

implementation
uses main, YSZLDBS, FORTRAN ;
{$R *.DFM}

procedure TWJJDlg.FormShow(Sender: TObject);
var
   s : string[10] ;
begin
     Self.Top := 20 ;
     Self.Left := 10 ;
     str (Dbs.TableUSER.FieldByName('PRICE').AsFloat:0:2, s) ;
     Edit1.Text := s ;
     Panel1.Caption := Dbs.TableUSER.FieldByName('NAME').AsString ;
     Panel2.Caption := Dbs.TableUSER.FieldByName('UNIT').AsString ;
     Edit1.SelectAll ;
end;

procedure TWJJDlg.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
     VK_RETURN :
                 begin
                      if (ForTranDlg.SCheckConX(Edit1.Text)=TRUE) then
                      begin
                           if (ForTranDlg.ErrorFlag=0) then
                           begin
                                Dbs.TableUSER.Edit ;
                                Dbs.TableUSER.FieldByName('PRICE').AsString := Edit1.Text ;
                                Dbs.TableUSER.Post ;
                                Dbs.TableCODE.Edit ;
                                Dbs.TableCODE.FieldByName('DEJ').AsString := Edit1.Text ;
                                Dbs.TableCODE.Post ;
                           end ;
                           ModalResult := IDOK ;
                      end else
                      begin
                           Edit1.Text := '0.0000' ;
                           Edit1.SelectAll ;
                      end ;
                 end ;
     VK_ESCAPE :
                 begin
                      ModalResult := IDCANCEL ;
                 end ;
     end ;
end;

end.
