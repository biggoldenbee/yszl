unit INCLLB;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TINCLLBDlg = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
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
  INCLLBDlg: TINCLLBDlg;

implementation

uses main, CLLB;

{$R *.DFM}


procedure TINCLLBDlg.FormShow(Sender: TObject);
begin
     Edit1.Text := '' ;
     Edit2.Text := '' ;
     Edit3.Text := '' ;
     if (Self.Tag=1) then
     begin
          Edit1.Enabled := TRUE ;
          Edit2.Enabled := TRUE ;
          Edit3.Enabled := TRUE ;
          Edit1.SetFocus ;
     end else
     begin
          Edit1.Enabled := FALSE ;
          Edit2.Enabled := FALSE ;
          Edit3.Enabled := TRUE ;
          Edit1.Text := CLLBDlg.TableCLLB.FieldByName('ID').AsString ;
          Edit2.Text := CLLBDlg.TableCLLB.FieldByName('CODE').AsString ;
          Edit3.Text := CLLBDlg.TableCLLB.FieldByName('MC').AsString ;
          Edit3.SetFocus ;
     end ;
end;

procedure TINCLLBDlg.BitBtn1Click(Sender: TObject);
begin
     if (Edit1.Text='') then
     begin
          Application.MessageBox( '对不起,您输入的材料类别标识为空请检查!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          Edit1.SetFocus ;
          exit ;
     end ;
     if (Self.Tag=1) then
     begin
          if (CLLBDlg.TableCLLB.FindKey([Edit1.Text, Edit2.Text])) then
          begin
               Application.MessageBox( '对不起,您新增加的材料类别已经存在,请重新输入!',
                                       pChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               Edit1.SetFocus ;
               exit ;
          end else
          begin
               CLLBDlg.TableCLLB.AppendRecord([ Edit1.Text,
                                                Edit2.Text,
                                                Edit3.Text ]) ;
          end ;
     end else
     begin
          if (CLLBDlg.TableCLLB.FindKey([Edit1.Text, Edit2.Text])) then
          begin
               CLLBDlg.TableCLLB.Edit ;
               CLLBDlg.TableCLLB.FieldByName('MC').AsString := Edit3.Text ;
               CLLBDlg.TableCLLB.Post ;
          end ;
     end ;
     ModalResult := IDOK ;
end;

procedure TINCLLBDlg.BitBtn2Click(Sender: TObject);
begin
     ModalResult := IDCANCEL ;
end;

end.
