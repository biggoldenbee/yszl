unit MODIZD;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, DB;

type
  TModiZDDlg = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Edit1: TEdit;
    Panel2: TPanel;
    Edit2: TEdit;
    Panel3: TPanel;
    Edit3: TEdit;
    Panel4: TPanel;
    Edit4: TEdit;
    Panel5: TPanel;
    Edit5: TEdit;
    Panel6: TPanel;
    Edit6: TEdit;
    Panel7: TPanel;
    Edit7: TEdit;
    Panel8: TPanel;
    Edit8: TEdit;
    Bevel1: TBevel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModiZDDlg: TModiZDDlg;

implementation
uses YSZLDBS, main;
{$R *.DFM}


procedure TModiZDDlg.FormShow(Sender: TObject);
begin
     Edit1.Text := Dbs.TableTEMP.Fields[0].AsString ;
     Edit2.Text := Dbs.TableTEMP.Fields[1].AsString ;
     Edit3.Text := Dbs.FieldTypeName(Dbs.TableTEMP.Fields[2].AsInteger) ;
     Edit4.Text := Dbs.TableTEMP.Fields[3].AsString ;
     Edit5.Text := Dbs.TableTEMP.Fields[4].AsString ;
     Edit6.Text := Dbs.TableTEMP.Fields[5].AsString ;
     Edit7.Text := Dbs.TableTEMP.Fields[6].AsString ;
     Edit8.Text := Dbs.TableTEMP.Fields[7].AsString ;
     Edit6.SetFocus ;
end;

procedure TModiZDDlg.BitBtn1Click(Sender: TObject);
begin
     if (Dbs.TableTEMP.BOF) then
     begin
          Application.MessageBox( '对不起，已经到文件头！',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          Dbs.TableTEMP.First ;
          Self.FormShow (Self) ;
          exit ;
     end ;
     Dbs.TableTEMP.Prior ;
     Self.FormShow (Self) ;
end;

procedure TModiZDDlg.BitBtn2Click(Sender: TObject);
begin
     if (Dbs.TableTEMP.EOF) then
     begin
          Application.MessageBox( '对不起，已经到文件尾！',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          Dbs.TableTEMP.Last ;
          Self.FormShow (Self) ;
          exit ;
     end ;
     Dbs.TableTEMP.Next ;
     Self.FormShow (Self) ;
end;

procedure TModiZDDlg.BitBtn3Click(Sender: TObject);
begin
     Dbs.TableTEMP.Edit ;
     Dbs.TableTEMP.Fields[5].AsString  := Edit6.Text ;
     Dbs.TableTEMP.Fields[6].AsString  := Edit7.Text ;
     Dbs.TableTEMP.Fields[7].AsInteger := StrToInt(Edit8.Text) ;
     Dbs.TableTEMP.Post ;
     Self.FormShow (Self) ;
end;

procedure TModiZDDlg.BitBtn4Click(Sender: TObject);
begin
     Self.Close ;
end;

procedure TModiZDDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
     38:
          begin
               BitBtn1.Click ;
               exit ;
          end ;
     40:
          begin
               BitBtn2.Click ;
               exit ;
          end ;
     13:
          begin
               BitBtn3.Click ;
               exit ;
          end ;
     27:
          begin
               BitBtn4.Click ;
               exit ;
          end ;
     end ;
     MainForm.OnKeyUp(MainForm, Key, Shift) ;
end;

end.
