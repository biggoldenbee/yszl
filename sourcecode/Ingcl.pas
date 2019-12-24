unit Ingcl;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls;

type
  TINGCLDlg = class(TForm)
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  INGCLDlg: TINGCLDlg;

implementation
uses main, FORTRAN, YSZLDBS ;
{$R *.DFM}

procedure TINGCLDlg.FormShow(Sender: TObject);
begin
     Self.Top := 20 ;
     Self.Left := 10 ;
     Edit1.Text := '0.0000' ;
     Edit1.SelectAll ;
end;

procedure TINGCLDlg.Edit1KeyDown(Sender: TObject; var Key: Word;
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
                                Dbs.TableUSER.FieldByName('QUANTITY').AsString := Edit1.Text ;
                                Dbs.TableUSER.Post ;
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
                      Dbs.TableUSER.Edit ;
                      Dbs.TableUSER.FieldByName('QUANTITY').Value := 0.0 ;
                      Dbs.TableUSER.Post ;
                      ModalResult := IDCANCEL ;
                 end ;
     end ;
end;

end.

