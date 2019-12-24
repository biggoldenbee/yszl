unit INSPT;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TINSPTDlg = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit6: TEdit;
    Edit1: TComboBox;
    Edit2: TComboBox;
    Edit5: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  INSPTDlg: TINSPTDlg;

implementation

uses main, SPT, YSZLDBS;

{$R *.DFM}

procedure TINSPTDlg.FormShow(Sender: TObject);
begin
     Edit1.Items.Clear ;
     Edit1.Items.Add('泵送') ;
     Edit1.Items.Add('非泵送') ;

     with Dbs do
     begin
          Edit2.Items.Clear ;
          TableCLID.First ;
          while (TRUE) do
          begin
               if (TableCLID.EOF) then
                  break ;
               Edit2.Items.Add(TableCLID.FieldByName('ID').AsString) ;
               TableCLID.Next ;
          end ;
          Edit5.Items.Clear ;
          TableINSTALL.First ;
          while (TRUE) do
          begin
               if (TableINSTALL.EOF) then
                  break ;
               Edit5.Items.Add(TableINSTALL.FieldByName('ID').AsString) ;
               TableINSTALL.Next ;
          end ;
     end ;

     Edit1.Text := '' ;
     Edit2.Text := '' ;
     Edit3.Text := '' ;
     Edit4.Text := '' ;
     Edit5.Text := '' ;
     Edit6.Text := '' ;
     if (Self.Tag=1) then
     begin
          Edit1.Enabled := TRUE ;
          Edit2.Enabled := TRUE ;
          Edit3.Enabled := TRUE ;
          Edit1.Text := Edit1.Items[0] ;
          Edit1.SetFocus ;
     end else
     begin
          Edit1.Enabled := FALSE ;
          Edit2.Enabled := FALSE ;
          Edit3.Enabled := FALSE ;
          Edit1.Text := SPTDlg.TableSPT.FieldByName('FS').AsString ;
          Edit2.Text := SPTDlg.TableSPT.FieldByName('ID').AsString ;
          Edit3.Text := SPTDlg.TableSPT.FieldByName('CODE').AsString ;
          Edit4.Text := SPTDlg.TableSPT.FieldByName('SPTCODE').AsString ;
          Edit5.Text := SPTDlg.TableSPT.FieldByName('DEID').AsString ;
          Edit6.Text := SPTDlg.TableSPT.FieldByName('BH').AsString ;
          Edit4.SetFocus ;
     end ;
end;

procedure TINSPTDlg.BitBtn1Click(Sender: TObject);
begin
     if (Edit1.Text='') then
     begin
          Application.MessageBox( '对不起,工资等级编号不可以为空!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          Edit1.SetFocus ;
          exit ;
     end ;

     if (Self.Tag=1) then
     begin
          if (SPTDlg.TableSPT.FindKey([Edit1.Text, StrToInt(Edit2.Text), Edit3.Text])) then
          begin
               Application.MessageBox ( '对不起,您新增加的商品砼换算关系已经存在,请重新输入!',
                                        pChar(AppName),
                                        MB_OK or MB_ICONSTOP ) ;
               Edit1.SetFocus ;
               exit ;
          end else
          begin
               SPTDlg.TableSPT.AppendRecord([ Edit1.Text,
                                              StrToInt(Edit2.Text),
                                              Edit3.Text,
                                              Edit4.Text,
                                              StrToInt(Edit5.Text),
                                              Edit6.Text ]) ;
          end ;
     end else
     begin
          if (SPTDlg.TableSPT.FindKey([Edit1.Text, StrToInt(Edit2.Text), Edit3.Text])) then
          begin
               SPTDlg.TableSPT.Edit ;
               SPTDlg.TableSPT.FieldByName('SPTCODE').AsString := Edit4.Text ;
               SPTDlg.TableSPT.FieldByName('DEID').AsString := Edit5.Text ;
               SPTDlg.TableSPT.FieldByName('BH').AsString := Edit6.Text ;
               SPTDlg.TableSPT.Post ;
          end ;
     end ;
     ModalREsult := IDOK ;
end;

procedure TINSPTDlg.BitBtn2Click(Sender: TObject);
begin
     ModalREsult := IDCANCEL ;
end;

end.
