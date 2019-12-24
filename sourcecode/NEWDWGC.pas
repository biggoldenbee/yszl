unit NEWDWGC;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, DBTables;

type
  TNewDwgcDlg = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DWGCLabel1: TLabel;
    DWGCEdit1: TEdit;
    DWGCLabel2: TLabel;
    DWGCEdit2: TComboBox;
    DWGCLabel3: TLabel;
    DWGCEdit3: TComboBox;
    DWGCEdit4: TEdit;
    Label1: TLabel;
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
    //about fxgc
    FXGCID    : shortint ;        //1
    //about dwgc sj
    DWGCID    : shortint ;        //1
    DWGCMC    : string[100] ;     //2
    DWGCZYLBID: shortint ;        //3
    DWGCZYLB  : string[100] ;     //4
    DWGCBZR   : string[50] ;      //5
    DWGCBZRQ  : TDateTime ;       //6
    DWGCFNAME : string[255] ;     //7
  end;

var
  NewDwgcDlg: TNewDwgcDlg;

implementation

uses main, YSZLDBS;

{$R *.DFM}


procedure TNewDwgcDlg.ClearSJ ;
var
   i : integer ;
begin
     DWGCID    := -1 ;
     DWGCMC    := '' ;
     DWGCZYLBID:= DWGCEdit2.ItemIndex+1 ;
     DWGCZYLB  := DWGCEdit2.Items[DWGCZYLBID] ;
     DWGCBZR   := DWGCEdit3.Items[0] ; 
     DWGCBZRQ  := Date ;
     DWGCFNAME := '' ;
     //Get a new xmtid
     i := 1 ;
     while (TRUE) do
     begin
          if (i<=0) then
          begin
               Application.MessageBox( '对不起，软件中管理的单位工程超过管理上限！',
                                       PChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
          if (not Dbs.TableDWGC.FindKey([XMTID,FXGCID,i])) then break ;
          i := i+1 ;
     end ;
     DWGCID := i ;
end ;

procedure TNewDwgcDlg.InitComBox ;
begin
     with Dbs do
     begin
          //Get DEZY item
          DWGCEdit2.Items.Clear ;
          if (TableDEZY.Active=FALSE) then TableDEZY.Open ;
          TableDEZY.First ;
          while (TRUE) do
          begin
               if (TableDEZY.EOF) then break ;
               DWGCEdit2.Items.Add(TableDEZY.FieldByName('ZYLB').AsString) ;
               TableDEZY.Next ;
          end ;
          //Get XM
          DWGCEdit3.Items.Clear ;
          if (TableXM.Active=FALSE) then TableXM.Open ;
          TableXM.First ;
          while (TRUE) do
          begin
               if (TableXM.EOF) then break ;
               DWGCEdit3.Items.Add(TableXM.FieldByName('MC').AsString) ;
               TableXM.Next ;
          end ;
     end ;
end ;

procedure TNewDwgcDlg.CheckSJ ;
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
     CheckMC(DWGCEdit3, Dbs.TableXM) ;
     InitCombox ;
end ;

procedure TNewDwgcDlg.GetSJFromPanel ;
begin
     DWGCMC    := DWGCEdit1.Text ;
     DWGCZYLBID:= DWGCEdit2.ItemIndex+1 ;
     DWGCZYLB  := DWGCEdit2.Text ;
     DWGCBZR   := DWGCEdit3.Text ;
     DWGCBZRQ  := StrToDate(DWGCEdit4.Text) ;
     DWGCFNAME := '' ;
end ;

procedure TNewDwgcDlg.DisplaySJ ;
begin
     DWGCEdit1.Text := DWGCMC ;
     DWGCEdit2.ItemIndex := DWGCZYLBID-1 ;
     DWGCEdit3.Text := DWGCBZR ;
     DWGCEdit4.Text := DateToStr(DWGCBZRQ) ;
end ;

procedure TNewDwgcDlg.WriteSJ ;
begin
     if (XMTID<=0) then
     begin
          Application.MessageBox( '对不起，软件中管理的单位工程超过管理上限！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     Dbs.TableDWGC.AppendRecord([XMTID,FXGCID,DWGCID,DWGCMC,
                                 DWGCZYLBID,DWGCZYLB,DWGCBZR,
                                 DWGCBZRQ,DWGCFNAME]) ;
end ;

procedure TNewDwgcDlg.FormShow(Sender: TObject);
begin
     InitComBox ;
     DWGCEdit2.ItemIndex := 0 ;
     ClearSJ ;
     DisplaySJ ;
     DWGCEdit1.SetFocus ;
end;

procedure TNewDwgcDlg.BitBtn1Click(Sender: TObject);
begin
     if (XMTID=-1) then
     begin
          ModalResult := IDCANCEL ;
     end ;
     GetSJFromPanel ;
     if (DWGCMC='') then
     begin
          Application.MessageBox( '对不起，单位工程名称不能为空，请重新输入单位工程名称！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          DWGCEdit1.SetFocus ;
          exit ;
     end ;
     CheckSJ ;
     WriteSJ ;
     ModalResult := IDOK ;
end;

procedure TNewDwgcDlg.BitBtn2Click(Sender: TObject);
begin
     ModalResult := IDCANCEL ;
end;

procedure TNewDwgcDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=13) then
        BitBtn1Click(BitBtn1) ;
     if (Key=27) then
        BitBtn2Click(BitBtn2) ;
end;

procedure TNewDwgcDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MainForm.OnKeyUp (MainForm, Key, Shift) ;
end;


end.
