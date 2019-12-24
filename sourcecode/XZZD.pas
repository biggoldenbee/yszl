unit XZZD;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, DECZ, checklst, Db, DBTables;

type
  TXZZDDlg = class(TForm)
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    CheckListBox1: TCheckListBox;
    BitBtn1: TBitBtn;
    USERTEMP: TTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  XZZDDlg: TXZZDDlg;

implementation
uses main, YSZLDBS ;
{$R *.DFM}

procedure TXZZDDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     USERTEMP.Close ;
     CheckListBox1.Items.Clear ;
end;

procedure TXZZDDlg.FormShow(Sender: TObject);
var
   i : integer ;
begin
     CheckListBox1.Items.Clear ;

     with Dbs do
     begin

          USERTEMP.Close ;
          USERTEMP.TableName := PrjHead.FileName ;
          USERTEMP.Filter := 'ID='+''''+'HEAD'+'''' ;
          USERTEMP.Filtered := TRUE ;
          USERTEMP.Open ;

          if (not TableSysDict.Active) then
             TableSysDict.Open ;
          for i:=0 to TableUSER.FieldCount-1 do
          begin
               if (TableSysDICT.FindKey(['USER.DB', USERTEMP.FieldS[i].FieldName])) then
                  CheckListBox1.Items.Add(TableSysDICT.FieldByName('FIELDLABEL').AsString)
               else
                  CheckListBox1.Items.Add(USERTEMP.Fields[i].FieldName) ;
          end ;
          TableSysDict.Close ;
          for i:=0 to 55 do
          begin
               if (PrjHead.FieldShowFlag[0,i]) then
                  CheckListBox1.State[i] := cbChecked
               else
                  CheckListBox1.State[i] := cbUnchecked ;
               if (i<=9) then
                  CheckListBox1.State[i] := cbGrayed ;
               if (i>=51) then
                  CheckListBox1.State[i] := cbGrayed ;
          end ;
     end ;
end;

procedure TXZZDDlg.BitBtn1Click(Sender: TObject);
var
   i : integer ;
begin
     for i:=0 to 55 do
     begin
          if ((i>9)and(i<51)) then
          begin
               if (CheckListBox1.State[i]=cbChecked) then
                  PrjHead.FieldShowFlag[0,i] := TRUE
               else
                  PrjHead.FieldShowFlag[0,i] := FALSE ;
          end ;
     end ;
     if (USERTEMP.Active) then
     begin
          USERTEMP.Edit ;
          for i:=10 to 50 do
          begin
               if (PrjHead.FieldShowFlag[0,i]) then
                  USERTEMP.Fields[i].AsFloat := 1.0
               else
                  USERTEMP.Fields[i].AsFloat := 0.0
          end ;
          USERTEMP.Post ;
     end ;
     MainForm.YSZLPageControl.ActivePage := MainForm.TabSheet1 ;
     MainForm.YSZLPageControl.OnChange (MainForm.YSZLPageControl) ;
end;

procedure TXZZDDlg.BitBtn2Click(Sender: TObject);
begin
     Self.Close ;
end;

procedure TXZZDDlg.CheckListBox1ClickCheck(Sender: TObject);

begin
     if (CheckListBox1.ItemIndex<=9) then
        CheckListBox1.State[CheckListBox1.ItemIndex] := cbGrayed
     else if (CheckListBox1.ItemIndex>=51) then
        CheckListBox1.State[CheckListBox1.ItemIndex] := cbGrayed ;
end;

end.

