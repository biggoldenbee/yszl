unit mmcl;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls;

type
  TMMCLDlg = class(TForm)
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
  MMCLDlg: TMMCLDlg;

implementation
uses main, YSZLDBS, FORTRAN ;
{$R *.DFM}

procedure TMMCLDlg.FormShow(Sender: TObject);
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

procedure TMMCLDlg.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   CODE : string[16] ;
   CODEID : smallint ;
begin
     case Key of
     VK_RETURN :
                 begin
                      if (ForTranDlg.SCheckConX(Edit1.Text)=TRUE) then
                      begin
                           if (ForTranDlg.ErrorFlag=0) then
                           begin
                                with Dbs do
                                begin
                                     TableUSER.Edit ;
                                     TableUSER.FieldByName('PRICE').AsString := Edit1.Text ;
                                     TableUSER.Post ;
                                     CODE   := TableUSER.FieldByName('CODE').AsString ;
                                     CODEID := TableUSER.FieldByName('CODEID').AsInteger ;
                                     if (TableCODE.FindKey([CODEID, CODE])) then
                                     begin
                                          TableCODE.Edit ;
                                          TableCODE.FieldByName('DEJ').AsString := Edit1.Text ;
                                          TableCODE.Post ;
                                     end ;
                                end ;
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
