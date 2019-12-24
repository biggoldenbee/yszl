unit NEWDXGC;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, DBTables;

type
  TNewDxgcDlg = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FXGCLabel1: TLabel;
    FXGCEdit1: TEdit;
    FXGCLabel2: TLabel;
    FXGCEdit2: TComboBox;
    FXGCLabel3: TLabel;
    FXGCEdit3: TComboBox;
    FXGCLabel4: TLabel;
    FXGCEdit4: TComboBox;
    FXGCLabel5: TLabel;
    FXGCEdit5: TComboBox;
    FXGCLabel6: TLabel;
    FXGCEdit6: TComboBox;
    FXGCLabel7: TLabel;
    FXGCEdit7: TComboBox;
    FXGCLabel8: TLabel;
    FXGCEdit8: TComboBox;
    FXGCLabel9: TLabel;
    FXGCEdit9: TEdit;
    FXGCLabel19: TLabel;
    FXGCLabel10: TLabel;
    FXGCEdit10: TEdit;
    FXGCLabel20: TLabel;
    FXGCLabel11: TLabel;
    FXGCEdit11: TEdit;
    FXGCLabel21: TLabel;
    FXGCLabel12: TLabel;
    FXGCEdit12: TEdit;
    FXGCLabel22: TLabel;
    FXGCLabel13: TLabel;
    FXGCEdit13: TEdit;
    FXGCLabel23: TLabel;
    FXGCLabel14: TLabel;
    FXGCEdit14: TEdit;
    FXGCLabel24: TLabel;
    FXGCLabel15: TLabel;
    FXGCEdit15: TComboBox;
    FXGCLabel16: TLabel;
    FXGCEdit16: TComboBox;
    FXGCLabel17: TLabel;
    FXGCEdit17: TComboBox;
    FXGCLabel18: TLabel;
    FXGCEdit18: TEdit;
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
    //about fxgc sj
    FXGCID    : shortint ;        //1
    FXGCMC    : string[100] ;     //2
    FXGCDWA   : string[100] ;     //3
    FXGCDWB   : string[100] ;     //4
    FXGCDWC   : string[100] ;     //5
    FXGCJGLX  : string[100] ;     //6
    FXGCJCXS  : string[100] ;     //7
    FXGCJZTZ  : string[100] ;     //8
    FXGCGCLB  : string[100] ;     //9
    FXGCJZMJ  : double ;          //10
    FXGCGCZJ  : double ;          //11
    FXGCSCG   : double ;          //12
    FXGCBZCG  : double ;          //13
    FXGCPMZJ  : double ;          //14
    FXGCYG    : double ;          //15
    FXGCBZR   : string[50] ;      //16
    FXGCJHR   : string[50] ;      //17
    FXGCSHR   : string[50] ;      //18
    FXGCBZRQ  : TDateTime ;       //19
  end;

var
  NewDxgcDlg: TNewDxgcDlg;

implementation

uses main, YSZLDBS;

{$R *.DFM}


procedure TNewDxgcDlg.ClearSJ ;
var
   i : integer ;
begin
     if (XMTID<=0) then exit ;

     FXGCID    := -1 ;
     FXGCMC    := '' ;
     FXGCDWA   := FXGCEdit2.Items[0] ;
     FXGCDWB   := FXGCEdit3.Items[0] ;
     FXGCDWC   := FXGCEdit4.Items[0] ;
     FXGCJGLX  := FXGCEdit5.Items[0] ;
     FXGCJCXS  := FXGCEdit6.Items[0] ;
     FXGCJZTZ  := FXGCEdit7.Items[0] ;
     FXGCGCLB  := FXGCEdit8.Items[0] ;
     FXGCJZMJ  := 0.0 ;
     FXGCGCZJ  := 0.0 ;
     FXGCSCG   := 0.0 ;
     FXGCBZCG  := 0.0 ;
     FXGCPMZJ  := 0.0 ;
     FXGCYG    := 0.0 ;
     FXGCBZR   := FXGCEdit15.Items[0] ;
     FXGCJHR   := FXGCEdit16.Items[0] ;
     FXGCSHR   := FXGCEdit17.Items[0] ;
     FXGCBZRQ  := Date ;
     //Get a new xmtid
     i := 1 ;
     while (TRUE) do
     begin
          if (i<=0) then
          begin
               Application.MessageBox( '对不起，软件中管理的单项工程超过管理上限！',
                                       PChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
          if (not Dbs.TableFXGC.FindKey([XMTID,i])) then break ;
          i := i+1 ;
     end ;
     FXGCID := i ;
end ;

procedure TNewDxgcDlg.InitComBox ;
begin
     with Dbs do
     begin
          //Get DWMC
          FXGCEdit2.Items.Clear ;
          if (TableGSMC.Active=FALSE) then TableGSMC.Open ;
          TableGSMC.First ;
          while (TRUE) do
          begin
               if (TableGSMC.EOF) then break ;
               FXGCEdit2.Items.Add(TableGSMC.FieldByName('MC').AsString) ;
               TableGSMC.Next ;
          end ;
          FXGCEdit3.Items := FXGCEdit2.Items ;
          FXGCEdit4.Items := FXGCEdit2.Items ;
          //Get JGLX
          FXGCEdit5.Items.Clear ;
          if (TableJGLX.Active=FALSE) then TableJGLX.Open ;
          TableJGLX.First ;
          while (TRUE) do
          begin
               if (TableJGLX.EOF) then break ;
               FXGCEdit5.Items.Add(TableJGLX.FieldByName('MC').AsString) ;
               TableJGLX.Next ;
          end ;
          //Get JCXS
          FXGCEdit6.Items.Clear ;
          if (TableJCXS.Active=FALSE) then TableJCXS.Open ;
          TableJCXS.First ;
          while (TRUE) do
          begin
               if (TableJCXS.EOF) then break ;
               FXGCEdit6.Items.Add(TableJCXS.FieldByName('MC').AsString) ;
               TableJCXS.Next ;
          end ;
          //Get JZTZ
          FXGCEdit7.Items.Clear ;
          if (TableJZTZ.Active=FALSE) then TableJZTZ.Open ;
          TableJZTZ.First ;
          while (TRUE) do
          begin
               if (TableJZTZ.EOF) then break ;
               FXGCEdit7.Items.Add(TableJZTZ.FieldByName('MC').AsString) ;
               TableJZTZ.Next ;
          end ;
          //Get GCLB
          FXGCEdit8.Items.Clear ;
          if (TableGCLB.Active=FALSE) then TableGCLB.Open ;
          TableGCLB.First ;
          while (TRUE) do
          begin
               if (TableGCLB.EOF) then break ;
               FXGCEdit8.Items.Add(TableGCLB.FieldByName('MC').AsString) ;
               TableGCLB.Next ;
          end ;
          //Get XM
          FXGCEdit15.Items.Clear ;
          if (TableXM.Active=FALSE) then TableXM.Open ;
          TableXM.First ;
          while (TRUE) do
          begin
               if (TableXM.EOF) then break ;
               FXGCEdit15.Items.Add(TableXM.FieldByName('MC').AsString) ;
               TableXM.Next ;
          end ;
          FXGCEdit16.Items := FXGCEdit15.Items ;
          FXGCEdit17.Items := FXGCEdit15.Items ;
     end ;
end ;

procedure TNewDxgcDlg.CheckSJ ;
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
     CheckMC(FXGCEdit2, Dbs.TableGSMC) ;
     CheckMC(FXGCEdit3, Dbs.TableGSMC) ;
     CheckMC(FXGCEdit4, Dbs.TableGSMC) ;
     CheckMC(FXGCEdit5, Dbs.TableJGLX) ;
     CheckMC(FXGCEdit6, Dbs.TableJCXS) ;
     CheckMC(FXGCEdit7, Dbs.TableJZTZ) ;
     CheckMC(FXGCEdit8, Dbs.TableGCLB) ;
     CheckMC(FXGCEdit15, Dbs.TableXM) ;
     CheckMC(FXGCEdit16, Dbs.TableXM) ;
     CheckMC(FXGCEdit17, Dbs.TableXM) ;
     InitCombox ;
end ;

procedure TNewDxgcDlg.GetSJFromPanel ;
begin
     FXGCMC    := FXGCEdit1.Text ;
     FXGCDWA   := FXGCEdit2.Text ;
     FXGCDWB   := FXGCEdit3.Text ;
     FXGCDWC   := FXGCEdit4.Text ;
     FXGCJGLX  := FXGCEdit5.Text ;
     FXGCJCXS  := FXGCEdit6.Text ;
     FXGCJZTZ  := FXGCEdit7.Text ;
     FXGCGCLB  := FXGCEdit8.Text ;
     FXGCJZMJ  := StrToFloat(FXGCEdit9.Text) ;
     FXGCGCZJ  := StrToFloat(FXGCEdit10.Text) ;
     FXGCSCG   := StrToFloat(FXGCEdit11.Text) ;
     FXGCBZCG  := StrToFloat(FXGCEdit12.Text) ;
     FXGCPMZJ  := StrToFloat(FXGCEdit13.Text) ;
     FXGCYG    := StrToFloat(FXGCEdit14.Text) ;
     FXGCBZR   := FXGCEdit15.Text ;
     FXGCJHR   := FXGCEdit16.Text ;
     FXGCSHR   := FXGCEdit17.Text ;
     FXGCBZRQ  := StrToDate(FXGCEdit18.Text) ;
end ;

procedure TNewDxgcDlg.DisplaySJ ;
begin
     FXGCEdit1.Text := FXGCMC ;
     FXGCEdit2.Text := FXGCDWA ;
     FXGCEdit3.Text := FXGCDWB ;
     FXGCEdit4.Text := FXGCDWC ;
     FXGCEdit5.Text := FXGCJGLX ;
     FXGCEdit6.Text := FXGCJCXS ;
     FXGCEdit7.Text := FXGCJZTZ ;
     FXGCEdit8.Text := FXGCGCLB ;
     FXGCEdit9.Text := format('%0.2f',[FXGCJZMJ]) ;
     FXGCEdit10.Text:= format('%0.2f',[FXGCGCZJ]) ;
     FXGCEdit11.Text:= format('%0.2f',[FXGCSCG]) ;
     FXGCEdit12.Text:= format('%0.2f',[FXGCBZCG]) ;
     FXGCEdit13.Text:= format('%0.2f',[FXGCPMZJ]) ;
     FXGCEdit14.Text:= format('%0.2f',[FXGCYG]) ;
     FXGCEdit15.Text:= FXGCBZR ;
     FXGCEdit16.Text:= FXGCJHR ;
     FXGCEdit17.Text:= FXGCSHR ;
     FXGCEdit18.Text:= DateToStr(FXGCBZRQ) ;
end ;

procedure TNewDxgcDlg.WriteSJ ;
begin
     if ((XMTID<=0)or(FXGCID<=0)) then
     begin
          Application.MessageBox( '对不起，软件中管理的建设项目超过管理上限！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     Dbs.TableFXGC.AppendRecord( [XMTID,FXGCID] ) ;
     Dbs.TableFXGC.Edit ;
     Dbs.TableFXGC.FieldByName('GCMC').AsString    := FXGCMC ;
     Dbs.TableFXGC.FieldByName('DWA').AsString     := FXGCDWA ;
     Dbs.TableFXGC.FieldByName('DWB').AsString     := FXGCDWB ;
     Dbs.TableFXGC.FieldByName('DWC').AsString     := FXGCDWC ;
     Dbs.TableFXGC.FieldByName('JGLX').AsString    := FXGCJGLX ;
     Dbs.TableFXGC.FieldByName('JCXS').AsString    := FXGCJCXS ;
     Dbs.TableFXGC.FieldByName('JZTZ').AsString    := FXGCJZTZ ;
     Dbs.TableFXGC.FieldByName('GCLB').AsString    := FXGCGCLB ;
     Dbs.TableFXGC.FieldByName('JZMJ').AsFloat     := FXGCJZMJ ;
     Dbs.TableFXGC.FieldByName('GCZJ').AsFloat     := FXGCGCZJ ;
     Dbs.TableFXGC.FieldByName('SCG').AsFloat      := FXGCSCG ;
     Dbs.TableFXGC.FieldByName('BZCG').AsFloat     := FXGCBZCG ;
     Dbs.TableFXGC.FieldByName('PMZJ').AsFloat     := FXGCPMZJ ;
     Dbs.TableFXGC.FieldByName('YG').AsFloat       := FXGCYG ;
     Dbs.TableFXGC.FieldByName('BZR').AsString     := FXGCBZR ;
     Dbs.TableFXGC.FieldByName('JHR').AsString     := FXGCJHR ;
     Dbs.TableFXGC.FieldByName('SHR').AsString     := FXGCSHR ;
     Dbs.TableFXGC.FieldByName('BZRQ').AsDateTime  := FXGCBZRQ ;
     Dbs.TableFXGC.Post ;
end ;

procedure TNewDxgcDlg.FormShow(Sender: TObject);
begin
     InitComBox ;
     ClearSJ ;
     DisplaySJ ;
     FXGCEdit1.SetFocus ;
end;

procedure TNewDxgcDlg.BitBtn1Click(Sender: TObject);
begin
     if ((XMTID=-1)or(FXGCID=-1)) then
     begin
          ModalResult := IDCANCEL ;
     end ;
     GetSJFromPanel ;
     if (FXGCMC='') then
     begin
          Application.MessageBox( '对不起，单项工程名称不能为空，请重新输入单项工程名称！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          FXGCEdit1.SetFocus ;
          exit ;
     end ;
     CheckSJ ;
     WriteSJ ;
     ModalResult := IDOK ;
end;

procedure TNewDxgcDlg.BitBtn2Click(Sender: TObject);
begin
     ModalResult := IDCANCEL ;
end;


procedure TNewDxgcDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=13) then
        BitBtn1Click(BitBtn1) ;
     if (Key=27) then
        BitBtn2Click(BitBtn2) ;
end;

procedure TNewDxgcDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MainForm.OnKeyUp (MainForm, Key, Shift) ;
end;

end.
