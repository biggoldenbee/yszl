unit NEWXMT;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, DBTables;

type
  TNewXmtDlg = class(TForm)
    XMTLabel1: TLabel;
    XMTEdit1: TEdit;
    XMTLabel2: TLabel;
    XMTEdit2: TComboBox;
    XMTLabel3: TLabel;
    XMTEdit3: TEdit;
    XMTLabel4: TLabel;
    XMTEdit4: TComboBox;
    XMTLabel5: TLabel;
    XMTEdit5: TEdit;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure ClearSJ ;
    procedure InitComBox ;
    procedure CheckSJ ;
    procedure GetSJFromPanel ;
    procedure DisplaySJ ;
    procedure WriteSJ ;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    //about xmt sj
    XMTID     : shortint ;        //1
    XMTMC     : string[100] ;     //2
    XMTJSDW   : string[100] ;     //3
    XMTGCDD   : string[100] ;     //4
    XMTXMJL   : string[50] ;      //5
    XMTLXRQ   : TDateTime ;       //6
  end;

var
  NewXmtDlg: TNewXmtDlg;

implementation

uses main, YSZLDBS;

{$R *.DFM}


procedure TNewXmtDlg.ClearSJ ;
var
   i : integer ;
begin
     XMTID     := -1 ;
     XMTMC     := '' ;
     XMTJSDW   := XMTEdit2.Items[0] ;
     XMTGCDD   := '' ;
     XMTXMJL   := XMTEdit4.Items[0] ;
     XMTLXRQ   := Date ;
     //Get a new xmtid
     i := 1 ;
     while (TRUE) do
     begin
          if (i<=0) then
          begin
               Application.MessageBox( '对不起，软件中管理的建设项目超过管理上限！',
                                       PChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
          if (not Dbs.TableXMT.FindKey([i])) then break ;
          i := i+1 ;
     end ;
     XMTID := i ;
end ;

procedure TNewXmtDlg.InitComBox ;
begin
     with Dbs do
     begin
          //Get DWMC
          XMTEdit2.Items.Clear ;
          if (TableGSMC.Active=FALSE) then TableGSMC.Open ;
          TableGSMC.First ;
          while (TRUE) do
          begin
               if (TableGSMC.EOF) then break ;
               XMTEdit2.Items.Add(TableGSMC.FieldByName('MC').AsString) ;
               TableGSMC.Next ;
          end ;
          //Get XM
          XMTEdit4.Items.Clear ;
          if (TableXM.Active=FALSE) then TableXM.Open ;
          TableXM.First ;
          while (TRUE) do
          begin
               if (TableXM.EOF) then break ;
               XMTEdit4.Items.Add(TableXM.FieldByName('MC').AsString) ;
               TableXM.Next ;
          end ;
     end ;
end ;

procedure TNewXmtDlg.CheckSJ ;
   procedure CheckMC(Sender: TObject; TT: TTable) ;
   var
      s : string ;
      flag : boolean ;
   begin
        s := TComboBox(Sender).Text ;
        if (s='') then exit ;
        flag := FALSE ;
        TT.First ;
        while(TRUE) do
        begin
             if (TT.EOF) then break ;
             if (s=TT.FieldByName('MC').AsString) then
             begin
                  flag := TRUE ;
                  break ;
             end ;
             TT.Next ;
        end ;
        if (flag) then exit ;
        TT.AppendRecord([s]) ;
   end ;

begin
     CheckMC(XMTEdit2, Dbs.TableGSMC) ;
     CheckMC(XMTEdit4, Dbs.TableXM) ;
     InitCombox ;
end ;

procedure TNewXmtDlg.GetSJFromPanel ;
begin
     XMTMC     := XMTEdit1.Text ;
     XMTJSDW   := XMTEdit2.Text ;
     XMTGCDD   := XMTEdit3.Text ;
     XMTXMJL   := XMTEdit4.Text ;
     XMTLXRQ   := StrToDate(XMTEdit5.Text) ;
end ;

procedure TNewXmtDlg.DisplaySJ ;
begin
     XMTEdit1.Text := XMTMC ;
     XMTEdit2.Text := XMTJSDW ;
     XMTEdit3.Text := XMTGCDD ;
     XMTEdit4.Text := XMTXMJL ;
     XMTEdit5.Text := DateToStr(XMTLXRQ) ;
end ;

procedure TNewXmtDlg.WriteSJ ;
begin
     if (XMTID<=0) then
     begin
          Application.MessageBox( '对不起，软件中管理的建设项目超过管理上限！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     Dbs.TableXMT.AppendRecord( [XMTID,XMTMC,XMTJSDW,XMTGCDD,XMTXMJL,XMTLXRQ] ) ;
end ;

procedure TNewXmtDlg.FormShow(Sender: TObject);
begin
     InitComBox ;
     ClearSJ ;
     DisplaySJ ;
     XMTEdit1.SetFocus ;
end;

procedure TNewXmtDlg.BitBtn1Click(Sender: TObject);
begin
     if (XMTID=-1) then
     begin
          ModalResult := IDCANCEL ;
     end ;
     GetSJFromPanel ;
     if (XMTMC='') then
     begin
          Application.MessageBox( '对不起，项目体名称不能为空，请重新输入项目体名称！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          XMTEdit1.SetFocus ;
          exit ;
     end ;
     CheckSJ ;
     WriteSJ ;
     ModalResult := IDOK ;
end;

procedure TNewXmtDlg.BitBtn2Click(Sender: TObject);
begin
     ModalResult := IDCANCEL ;
end;

procedure TNewXmtDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=13) then
        BitBtn1Click(BitBtn1) ;
     if (Key=27) then
        BitBtn2Click(BitBtn2) ;
end;

procedure TNewXmtDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MainForm.OnKeyUp (MainForm, Key, Shift) ;
end;

end.
