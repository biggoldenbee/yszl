unit Lsgs;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, SysUtils, DECZ;

type
  TLSGSDlg = class(TForm)
    Bevel1: TBevel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    rgf, clf, jxf, dj, rgs : double ;
  end;

var
  LSGSDlg: TLSGSDlg;

implementation
uses main, YSZLDBS, Ingcl ;
{$R *.DFM}

procedure TLSGSDlg.FormShow(Sender: TObject);
var
   s:string[20] ;
begin
     Edit1.Text := '' ;
     Edit2.Text := '估-' ;
     Edit3.Text := '' ;
     Edit4.Text := '0.0000' ;
     Edit5.Text := '0.0000' ;
     Edit6.Text := '0.0000' ;
     Edit7.Text := '0.0000' ;
     Edit8.Text := '0.0000' ;
     Edit4.OnKeyUp := Edit4KeyUp ;
     Edit5.OnKeyUp := Edit4KeyUp ;
     Edit6.OnKeyUp := Edit4KeyUp ;
     Edit7.OnKeyUp := Edit4KeyUp ;
end;

procedure TLSGSDlg.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_RETURN) then
     begin
          rgf := StrToFloat(Edit4.Text) ;
          rgs := StrToFloat(Edit5.Text) ;
          clf := StrToFloat(Edit6.Text) ;
          jxf := StrToFloat(Edit7.Text) ;
          dj := rgf+clf+jxf ;
          Edit4.Text := format(formatstr,[rgf]) ;
          Edit5.Text := format(formatstr,[rgs]) ;
          Edit6.Text := format(formatstr,[clf]) ;
          Edit7.Text := format(formatstr,[jxf]) ;
          Edit8.Text := format(formatstr,[dj]) ;
     end ;
end;

procedure TLSGSDlg.BitBtn1Click(Sender: TObject);
var
   ID : string[10] ;
   NUM: shortint ;
begin
     if (Edit2.Text='') then
     begin
          Application.MessageBox( '定额编号不可以为空,请检查!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          Edit1.SetFocus ;
          exit ;
     end ;

     rgf := StrToFloat(Edit4.Text) ;
     rgs := StrToFloat(Edit5.Text) ;
     clf := StrToFloat(Edit6.Text) ;
     jxf := StrToFloat(Edit7.Text) ;
     dj := rgf+clf+jxf ;
     Edit4.Text := format(formatstr,[rgf]) ;
     Edit5.Text := format(formatstr,[rgs]) ;
     Edit6.Text := format(formatstr,[clf]) ;
     Edit7.Text := format(formatstr,[jxf]) ;
     Edit8.Text := format(formatstr,[dj]) ;

     with Dbs do
     begin
          //if current postion at end of file then exit
          if (TableUSER.EOF) then exit ;
          //Disablecontrols
          TableUSER.DisableControls ;
          //GetCurrent DE information
          if (TableUSER.FieldByName('WLP').AsString='B') then
          begin
               //now current postion at part end
               //If is begin of file then exit
               if (TableUSER.BOF) then
               begin
                    TableUSER.EnableControls ;
                    exit ;
               end ;
               //judge current postion if can insert record
               NUM := TableUSER.FieldByName('NUM').AsInteger ;
               TableUSER.Prior ;
               if (TableUSER.FieldByName('NUM').AsInteger<>NUM) then
               begin
                    //at this postion you can not insert recor and exit
                    Application.MessageBox ( '对不起，您当前录入定额时所选择的位置不正确，请将光标放在分部之间完成定额录入！',
                                             pChar(AppName),
                                             MB_OK or MB_ICONINFORMATION ) ;
                    TableUSER.Next ;
                    TableUSER.EnableControls ;
                    exit ;
               end else
               begin
                    //you can insert record and return current postion
                    TableUSER.Next ;
               end ;
          end else if (TableUSER.FieldByName('WLP').AsString='T') then
          begin
               //current postion at begin of file
               TableUSER.Next ;
               if (TableUSER.EOF) then
               begin
                    //if current postion at end of file then exit
                    TableUSER.EnableControls ;
                    exit ;
               end ;
          end ;

          ID  := TableUSER.FieldByName('ID').AsString ;
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          TableUSER.InsertRecord ([FALSE, ID, NUM, '', 0, '', '1']) ;
          TableUSER.Edit ;
          TableUSER.FieldByName('WLP').AsString    := 'FDE' ;
          TableUSER.FieldByName('CODE').AsString   := Edit2.Text ;
          TableUSER.FieldByName('ATTRIB').AsString := '1' ;
          TableUSER.FieldByName('NAME').AsString   := Edit1.Text ;
          TableUSER.FieldByName('UNIT').AsString   := Edit3.Text ;
          TableUSER.FieldByName('LABFEE').AsFloat  := rgf ;
          TableUSER.FieldByName('MTRLFEE').AsFloat := clf ;
          TableUSER.FieldByName('MCHNFEE').AsFloat := jxf ;
          TableUSER.FieldByName('PRICE').AsFloat   := dj ;
          TableUSER.FieldByName('LPD').AsFloat     := rgs ;
          TableUSER.FieldByName('BS').AsString     := '' ;
          TableUSER.FieldByName('DEID').AsInteger  := 0 ;
          TableUSER.FieldByName('DEMC').AsString   := '临时估算' ;
          TableUSER.FieldByName('CODEID').AsInteger:= 0 ;
          TableUSER.Post ;
          TableUSER.EnableControls ;
     end ;
     ModalResult := IDOK ;
end;

procedure TLSGSDlg.BitBtn2Click(Sender: TObject);
begin
     ModalResult := IDCANCEL ;
end;

procedure TLSGSDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Edit4.OnChange := Nil ;
     Edit5.OnChange := Nil ;
     Edit6.OnChange := Nil ;
     Edit7.OnChange := Nil ;
end;

end.

