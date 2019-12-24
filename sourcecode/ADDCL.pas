unit ADDCL;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TADDCLDlg = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CLID : smallint ;
    BS : smallint ;
  end;

var
  ADDCLDlg: TADDCLDlg;

implementation

uses main, FORTRAN, YSZLDBS;

{$R *.DFM}


procedure TADDCLDlg.FormShow(Sender: TObject);
begin
     Edit1.Text := '' ;
     Edit2.Text := '' ;
     Edit3.Text := '' ;
     Edit4.Text := '0.00' ;
     Edit1.SetFocus ;
end;

procedure TADDCLDlg.BitBtn1Click(Sender: TObject);
begin
     if (Edit1.Text='') then
     begin
          Application.MessageBox( '对不起,材料编号不可以为空,请检查!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          Edit1.SetFocus ;
          exit ;
     end ;
     if (ForTranDlg.SCheckConX(Edit4.Text)=FALSE) then
     begin
          Application.MessageBox( '对不起您输入的单价有错误,请修改!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP );
          Edit4.SetFocus ;
          exit ;
     end ;
     if (ForTranDlg.ErrorFlag<>0) then
     begin
          Application.MessageBox( '对不起您输入的单价有错误,请修改!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP );
          Edit4.SetFocus ;
          exit ;
     end ;
     if (Dbs.TableCODE.FindKey([CLID,Edit1.Text])) then
     begin
          Application.MessageBox( '对不起,您新增加的材料已经存在,请检查!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          Edit1.SetFocus ;
          exit ;
     end else
     begin
          Dbs.TableCODE.AppendRecord ([ CLID,
                                        Edit1.Text,
                                        Edit2.Text,
                                        Edit3.Text,
                                        Edit4.Text,
                                        BS, '', '', '1.0']) ;
     end ;
     ModalResult := IDOK ;
end;

procedure TADDCLDlg.BitBtn2Click(Sender: TObject);
begin
     ModalResult := IDCANCEL ;
end;

end.
