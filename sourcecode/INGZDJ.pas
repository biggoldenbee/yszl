unit INGZDJ;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TINGZDJDlg = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  INGZDJDlg: TINGZDJDlg;

implementation

uses main, GZDJ, FORTRAN;

{$R *.DFM}

procedure TINGZDJDlg.FormShow(Sender: TObject);
begin
     Edit1.Text := '' ;
     Edit2.Text := '' ;
     if (Self.Tag=1) then
     begin
          Edit1.Enabled := TRUE ;
          Edit2.Enabled := TRUE ;
          Edit1.SetFocus ;
     end else
     begin
          Edit1.Enabled := FALSE ;
          Edit2.Enabled := TRUE ;
          Edit1.Text := GZDJDlg.TableGZDJ.FieldByName('DJ').AsString ;
          Edit2.Text := GZDJDlg.TableGZDJ.FieldByName('GZ').AsString ;
          Edit2.SetFocus ;
     end ;
end;

procedure TINGZDJDlg.BitBtn1Click(Sender: TObject);
begin
     if (Edit1.Text='') then
     begin
          Application.MessageBox( '对不起,工资等级编号不可以为空!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          Edit1.SetFocus ;
          exit ;
     end ;
     if (ForTranDlg.SCheckConX(Edit2.Text)=FALSE) then
     begin
          Application.MessageBox( '对不起您输入的工资有错误,请修改!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP );
          Edit2.SetFocus ;
          exit ;
     end ;
     if (ForTranDlg.ErrorFlag<>0) then
     begin
          Application.MessageBox( '对不起您输入的工资有错误,请修改!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP );
          Edit2.SetFocus ;
          exit ;
     end ;

     if (Self.Tag=1) then
     begin
          if (GZDJDlg.TableGZDJ.FindKey([Edit1.Text])) then
          begin
               Application.MessageBox ( '对不起,您新增加的工资等级已经存在,请重新输入!',
                                        pChar(AppName),
                                        MB_OK or MB_ICONSTOP ) ;
               Edit1.SetFocus ;
               exit ;
          end else
          begin
               GZDJDlg.TableGZDJ.AppendRecord([Edit1.Text, Edit2.Text]) ;
          end ;
     end else
     begin
          if (GZDJDlg.TableGZDJ.FindKey([Edit1.Text])) then
          begin
               GZDJDlg.TableGZDJ.Edit ;
               GZDJDlg.TableGZDJ.FieldByName('GZ').AsString := Edit2.Text ;
               GZDJDlg.TableGZDJ.Post ;
          end ;
     end ;
     ModalREsult := IDOK ;
end;

procedure TINGZDJDlg.BitBtn2Click(Sender: TObject);
begin
     ModalREsult := IDCANCEL ;
end;

end.
