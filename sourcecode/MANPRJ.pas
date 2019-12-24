unit MANPRJ;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, Dialogs, Db, DBTables, Menus, ImgList;

type
  TManPrjDlg = class(TForm)
    XMTTreeView: TTreeView;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    ImageList: TImageList;
    PanelXMT: TPanel;
    XMTLabel1: TLabel;
    XMTLabel2: TLabel;
    XMTLabel3: TLabel;
    XMTLabel4: TLabel;
    XMTLabel5: TLabel;
    XMTEdit1: TEdit;
    XMTEdit2: TComboBox;
    XMTEdit3: TEdit;
    XMTEdit4: TComboBox;
    XMTEdit5: TEdit;
    XMTSpeedButton1: TSpeedButton;
    PanelDXGC: TPanel;
    FXGCLabel1: TLabel;
    FXGCLabel2: TLabel;
    FXGCLabel3: TLabel;
    FXGCLabel4: TLabel;
    FXGCLabel5: TLabel;
    FXGCLabel6: TLabel;
    FXGCLabel7: TLabel;
    FXGCLabel8: TLabel;
    FXGCLabel9: TLabel;
    FXGCLabel10: TLabel;
    FXGCLabel11: TLabel;
    FXGCLabel12: TLabel;
    FXGCLabel13: TLabel;
    FXGCLabel14: TLabel;
    FXGCLabel15: TLabel;
    FXGCLabel16: TLabel;
    FXGCLabel17: TLabel;
    FXGCLabel18: TLabel;
    FXGCLabel19: TLabel;
    FXGCLabel20: TLabel;
    FXGCLabel21: TLabel;
    FXGCLabel22: TLabel;
    FXGCLabel24: TLabel;
    FXGCLabel23: TLabel;
    FXGCEdit1: TEdit;
    FXGCEdit2: TComboBox;
    FXGCEdit3: TComboBox;
    FXGCEdit4: TComboBox;
    FXGCEdit5: TComboBox;
    FXGCEdit6: TComboBox;
    FXGCEdit7: TComboBox;
    FXGCEdit8: TComboBox;
    FXGCEdit9: TEdit;
    FXGCEdit10: TEdit;
    FXGCEdit11: TEdit;
    FXGCEdit12: TEdit;
    FXGCEdit13: TEdit;
    FXGCEdit14: TEdit;
    FXGCEdit15: TComboBox;
    FXGCEdit16: TComboBox;
    FXGCEdit17: TComboBox;
    FXGCEdit18: TEdit;
    FXGCSpeedButton1: TSpeedButton;
    PanelDWGC: TPanel;
    DWGCLabel1: TLabel;
    DWGCLabel2: TLabel;
    DWGCLabel3: TLabel;
    DWGCLabel4: TLabel;
    DWGCLabel5: TLabel;
    DWGCEdit1: TEdit;
    DWGCEdit2: TComboBox;
    DWGCEdit3: TComboBox;
    DWGCEdit4: TEdit;
    DWGCEdit5: TEdit;
    DWGCSpeedButton1: TSpeedButton;
    DWGCSpeedButton2: TSpeedButton;
    ManPrjPMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    procedure ShowBitBtn ;
    procedure ShowPanel ;
    procedure ClearSJ ;
    procedure GetSJFromDbf ;
    procedure GetSJFromPanel ;
    procedure DisplaySJ ;
    procedure CheckSJ ;
    procedure WriteSJ ;
    procedure InitCombox ;
    function  CheckFile(FName:string) : boolean ;
    procedure InitXmtTree ;
    procedure FormShow(Sender: TObject);
    procedure XMTTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure XMTSpeedButton1Click(Sender: TObject);
    procedure CopyXmt(SXMTID : integer; DXMTID : integer) ;
    procedure CopyFxgc(SXMTID : integer; SFXGCID : integer; DXMTID : integer; DFXGCID : integer) ;
    procedure CopyDwgc(SXMTID : integer; SFXGCID : integer; SDWGCID : integer ;
                       DXMTID : integer; DFXGCID : integer; DDWGCID : integer ) ;

    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure XMTEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DWGCSpeedButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
    //about dwgc sj
    DWGCID    : shortint ;        //1
    DWGCMC    : string[100] ;     //2
    DWGCZYLBID: shortint ;        //3
    DWGCZYLB  : string[100] ;     //4
    DWGCBZR   : string[50] ;      //5
    DWGCBZRQ  : TDateTime ;       //6
    DWGCFNAME : string[255] ;     //7
    //other sj
    SLevel    : integer ;
    SId1      : integer ;
    SId2      : integer ;
    SId3      : integer ;
    //debug command
    scommand : string ;
  end;

var
  ManPrjDlg: TManPrjDlg;

implementation
uses MAIN, YSZLDBS, NEWXMT, NEWDXGC, NEWDWGC, MANDWGC, STREE, SDRIVE,
  COPYDLG, SHOWTREE;
{$R *.DFM}

procedure TManPrjDlg.ShowPanel ;
begin
     //display panel
     PanelXMT.Visible  := FALSE ;
     PanelDWGC.Visible := FALSE ;
     PanelDXGC.Visible := FALSE ;
     if (XMTTreeView.Selected=Nil) then exit ;
     case XMTTreeView.Selected.Level of
     0 :
          begin
               PanelXMT.Visible  := TRUE ;
          end ;
     1 :
          begin
               PanelDXGC.Visible := TRUE ;
          end ;
     2 :
          begin
               PanelDWGC.Visible := TRUE ;
          end ;
     end ;
end ;

procedure TManPrjDlg.ShowBitBtn ;
begin
     //display bitbtn1 bitbtn2 bitbtn3
     case SLevel of
     -1 :
          begin
               BitBtn1.Enabled := TRUE ;
               BitBtn2.Enabled := FALSE ;
               BitBtn3.Enabled := FALSE ;
          end ;
     0  :
          begin
               BitBtn1.Enabled := TRUE ;
               BitBtn2.Enabled := TRUE ;
               BitBtn3.Enabled := FALSE ;
          end ;
     1  :
          begin
               BitBtn1.Enabled := FALSE ;
               BitBtn2.Enabled := TRUE ;
               BitBtn3.Enabled := TRUE ;
          end ;
     2  :
          begin
               BitBtn1.Enabled := FALSE ;
               BitBtn2.Enabled := FALSE ;
               BitBtn3.Enabled := TRUE ;
          end ;
     end ;
     N1.Enabled := BitBtn1.Enabled ;
     N2.Enabled := BitBtn2.Enabled ;
     N3.Enabled := BitBtn3.Enabled ;
end ;

procedure TManPrjDlg.ClearSJ ;
begin
     //Clear xmt sj
     XMTID     := -1 ;
     XMTMC     := '' ;
     XMTJSDW   := '';
     XMTGCDD   := '' ;
     XMTXMJL   := '' ;
     XMTLXRQ   := Date ;
     //clear fcgc sj
     FXGCID    := -1 ;
     FXGCMC    := '' ;
     FXGCDWA   := '' ;
     FXGCDWB   := '' ;
     FXGCDWC   := '' ;
     FXGCJGLX  := '' ;
     FXGCJCXS  := '' ;
     FXGCJZTZ  := '' ;
     FXGCGCLB  := '' ;
     FXGCJZMJ  := 0.0 ;
     FXGCGCZJ  := 0.0 ;
     FXGCSCG   := 0.0 ;
     FXGCBZCG  := 0.0 ;
     FXGCPMZJ  := 0.0 ;
     FXGCYG    := 0.0 ;
     FXGCBZR   := '' ;
     FXGCJHR   := '' ;
     FXGCSHR   := '' ;
     FXGCBZRQ  := Date ;
     //clear dwgc sj
     DWGCID    := -1 ;
     DWGCMC    := '' ;
     DWGCZYLBID:= -1 ;
     DWGCZYLB  := '' ;
     DWGCBZR   := '' ;
     DWGCBZRQ  := Date ;
     DWGCFNAME := '' ;
end ;

procedure TManPrjDlg.GetSJFromDbf ;
var
   id1, id2, id3 : integer ;
   Node : TTreeNode ;
begin
     Dbs.TableFXGC.Filtered := FALSE ;
     Dbs.TableFXGC.Filter := '' ;
     Dbs.TableDWGC.Filtered := FALSE ;
     Dbs.TableDWGC.Filter := '' ;
     if (XMTTreeView.Selected=Nil) then exit ;
     Node := XMTTreeView.Selected ;
     case Node.Level of
     0 :
          begin
               id1 := -1-Node.StateIndex ;
               if (Dbs.TableXMT.FindKey([id1])) then
               begin
                    XMTID     := Dbs.TableXMT.FieldByName('XMTID').AsInteger ;
                    XMTMC     := Dbs.TableXMT.FieldByName('XMTMC').AsString ;
                    XMTJSDW   := Dbs.TableXMT.FieldByName('JSDW').AsString ;
                    XMTGCDD   := Dbs.TableXMT.FieldByName('GCDD').AsString ;
                    XMTXMJL   := Dbs.TableXMT.FieldByName('XMJL').AsString ;
                    XMTLXRQ   := Dbs.TableXMT.FieldByName('LXRQ').AsDateTime
               end ;
          end ;
     1 :
          begin
               id1 := -1-Node.Parent.StateIndex ;
               id2 := -1-Node.StateIndex ;
               if (Dbs.TableXMT.FindKey([id1])) then
               begin
                    XMTID     := Dbs.TableXMT.FieldByName('XMTID').AsInteger ;
                    XMTMC     := Dbs.TableXMT.FieldByName('XMTMC').AsString ;
                    XMTJSDW   := Dbs.TableXMT.FieldByName('JSDW').AsString ;
                    XMTGCDD   := Dbs.TableXMT.FieldByName('GCDD').AsString ;
                    XMTXMJL   := Dbs.TableXMT.FieldByName('XMJL').AsString ;
                    XMTLXRQ   := Dbs.TableXMT.FieldByName('LXRQ').AsDateTime
               end ;
               if (Dbs.TableFXGC.FindKey([id1,id2])) then
               begin
                    FXGCID    := Dbs.TableFXGC.FieldByName('FXGCID').AsInteger ;
                    FXGCMC    := Dbs.TableFXGC.FieldByName('GCMC').AsString ;
                    FXGCDWA   := Dbs.TableFXGC.FieldByName('DWA').AsString ;
                    FXGCDWB   := Dbs.TableFXGC.FieldByName('DWB').AsString ;
                    FXGCDWC   := Dbs.TableFXGC.FieldByName('DWC').AsString ;
                    FXGCJGLX  := Dbs.TableFXGC.FieldByName('JGLX').AsString ;
                    FXGCJCXS  := Dbs.TableFXGC.FieldByName('JCXS').AsString ;
                    FXGCJZTZ  := Dbs.TableFXGC.FieldByName('JZTZ').AsString ;
                    FXGCGCLB  := Dbs.TableFXGC.FieldByName('GCLB').AsString ;
                    FXGCJZMJ  := Dbs.TableFXGC.FieldByName('JZMJ').AsFloat ;
                    FXGCGCZJ  := Dbs.TableFXGC.FieldByName('GCZJ').AsFloat ;
                    FXGCSCG   := Dbs.TableFXGC.FieldByName('SCG').AsFloat ;
                    FXGCBZCG  := Dbs.TableFXGC.FieldByName('BZCG').AsFloat ;
                    FXGCPMZJ  := Dbs.TableFXGC.FieldByName('PMZJ').AsFloat ;
                    FXGCYG    := Dbs.TableFXGC.FieldByName('YG').AsFloat ;
                    FXGCBZR   := Dbs.TableFXGC.FieldByName('BZR').AsString ;
                    FXGCJHR   := Dbs.TableFXGC.FieldByName('JHR').AsString ;
                    FXGCSHR   := Dbs.TableFXGC.FieldByName('SHR').AsString ;
                    FXGCBZRQ  := Dbs.TableFXGC.FieldByName('BZRQ').AsDateTime ;
               end ;
          end ;
     2 :
          begin
               id1 := -1-Node.Parent.Parent.StateIndex ;
               id2 := -1-Node.Parent.StateIndex ;
               id3 := -1-Node.StateIndex ;
               if (Dbs.TableXMT.FindKey([id1])) then
               begin
                    XMTID     := Dbs.TableXMT.FieldByName('XMTID').AsInteger ;
                    XMTMC     := Dbs.TableXMT.FieldByName('XMTMC').AsString ;
                    XMTJSDW   := Dbs.TableXMT.FieldByName('JSDW').AsString ;
                    XMTGCDD   := Dbs.TableXMT.FieldByName('GCDD').AsString ;
                    XMTXMJL   := Dbs.TableXMT.FieldByName('XMJL').AsString ;
                    XMTLXRQ   := Dbs.TableXMT.FieldByName('LXRQ').AsDateTime
               end ;
               if (Dbs.TableFXGC.FindKey([id1,id2])) then
               begin
                    FXGCID    := Dbs.TableFXGC.FieldByName('FXGCID').AsInteger ;
                    FXGCMC    := Dbs.TableFXGC.FieldByName('GCMC').AsString ;
                    FXGCDWA   := Dbs.TableFXGC.FieldByName('DWA').AsString ;
                    FXGCDWB   := Dbs.TableFXGC.FieldByName('DWB').AsString ;
                    FXGCDWC   := Dbs.TableFXGC.FieldByName('DWC').AsString ;
                    FXGCJGLX  := Dbs.TableFXGC.FieldByName('JGLX').AsString ;
                    FXGCJCXS  := Dbs.TableFXGC.FieldByName('JCXS').AsString ;
                    FXGCJZTZ  := Dbs.TableFXGC.FieldByName('JZTZ').AsString ;
                    FXGCGCLB  := Dbs.TableFXGC.FieldByName('GCLB').AsString ;
                    FXGCJZMJ  := Dbs.TableFXGC.FieldByName('JZMJ').AsFloat ;
                    FXGCGCZJ  := Dbs.TableFXGC.FieldByName('GCZJ').AsFloat ;
                    FXGCSCG   := Dbs.TableFXGC.FieldByName('SCG').AsFloat ;
                    FXGCBZCG  := Dbs.TableFXGC.FieldByName('BZCG').AsFloat ;
                    FXGCPMZJ  := Dbs.TableFXGC.FieldByName('PMZJ').AsFloat ;
                    FXGCYG    := Dbs.TableFXGC.FieldByName('YG').AsFloat ;
                    FXGCBZR   := Dbs.TableFXGC.FieldByName('BZR').AsString ;
                    FXGCJHR   := Dbs.TableFXGC.FieldByName('JHR').AsString ;
                    FXGCSHR   := Dbs.TableFXGC.FieldByName('SHR').AsString ;
                    FXGCBZRQ  := Dbs.TableFXGC.FieldByName('BZRQ').AsDateTime ;
               end ;
               if (Dbs.TableDWGC.FindKey([id1,id2,id3])) then
               begin
                    DWGCID    := Dbs.TableDWGC.FieldByName('DWGCID').AsInteger ;
                    DWGCMC    := Dbs.TableDWGC.FieldByName('GCMC').AsString ;
                    DWGCZYLBID:= Dbs.TableDWGC.FieldByName('ZYLBID').AsInteger ;
                    DWGCZYLB  := Dbs.TableDWGC.FieldByName('ZYLB').AsString ;
                    DWGCBZR   := Dbs.TableDWGC.FieldByName('BZR').AsString ;
                    DWGCBZRQ  := Dbs.TableDWGC.FieldByName('BZRQ').AsDateTime ;
                    DWGCFNAME := Dbs.TableDWGC.FieldByName('FNAME').AsString ;
                    if (CheckFile(DWGCFNAME)=TRUE) then
                    begin
                         DWGCFNAME := Dbs.TableUSER.TableName ;
                         Dbs.TableDWGC.Edit ;
                         Dbs.TableDWGC.FieldByName('FNAME').AsString := DWGCFNAME ;
                         Dbs.TableDWGC.Post ;
                    end
               end ;
          end ;
     end ;
end ;

procedure TManPrjDlg.GetSJFromPanel ;
var
   Node : TTreeNode ;
begin
     if (XMTTreeView.Selected=Nil) then exit ;
     Node := XMTTreeView.Selected ;
     case Node.Level of
     0 :
          begin
               XMTMC     := XMTEdit1.Text ;
               XMTJSDW   := XMTEdit2.Text ;
               XMTGCDD   := XMTEdit3.Text ;
               XMTXMJL   := XMTEdit4.Text ;
               XMTLXRQ   := StrToDate(XMTEdit5.Text) ;
          end ;
     1 :
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
     2 :
          begin
               //First Check DWGCEdit5
               if (DWGCFNAME<>DWGCEdit5.Text) then
               begin
                    if (CheckFile(DWGCFNAME)=TRUE) then
                    begin
                         DWGCFNAME := DWGCEdit5.Text ;
                         if (pos('.',DWGCFNAME)<>0) then
                            DWGCFNAME := copy(DWGCFNAME, 1, pos('.',DWGCFNAME)-1)  ;
                         try
                            Dbs.TableUSER.RenameTable (DWGCFNAME) ;
                         except;
                         end ;
                         Dbs.TableUSER.Close ;
                         DWGCEdit5.Text := DWGCFNAME ;
                    end ;
               end ;
               DWGCMC    := DWGCEdit1.Text ;
               DWGCZYLBID:= DWGCEdit2.ItemIndex+1 ;
               DWGCZYLB  := DWGCEdit2.Text ;
               DWGCBZR   := DWGCEdit3.Text ;
               DWGCBZRQ  := StrToDate(DWGCEdit4.Text) ;
               DWGCFNAME := DWGCEdit5.Text ;
               if (CheckFile(DWGCFNAME)=TRUE) then
               begin
                    DWGCFNAME := Dbs.TableUSER.TableName ;
                    DWGCEdit5.Text := DWGCFNAME ;
               end ;
          end ;
     end ;
end ;

procedure TManPrjDlg.DisplaySJ ;
var
   Node : TTreeNode ;
begin
     InitCombox ;
     SLevel := -1 ;
     SId1 := -1 ;
     SId2 := -1 ;
     SId3 := -1 ;
     if (XMTTreeView.Selected=Nil) then exit ;
     Node := XMTTreeView.Selected ;
     case Node.Level of
     0 :
          begin
               if (XMTID>0) then
               begin
                    XMTEdit1.Text := XMTMC ;
                    XMTEdit2.Text := XMTJSDW ;
                    XMTEdit3.Text := XMTGCDD ;
                    XMTEdit4.Text := XMTXMJL ;
                    XMTEdit5.Text := DateToStr(XMTLXRQ) ;
                    SLevel := 0 ;
                    SId1 := XMTID ;
               end ;
          end ;
     1 :
          begin
               if ((XMTID>0)and(FXGCID>0)) then
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
                    SLevel := 1 ;
                    SId1 := XMTID ;
                    SId2 := FXGCID ;
               end ;
          end ;
     2 :
          begin
               if ((XMTID>0)and(FXGCID>0)and(DWGCID>0)) then
               begin
                    DWGCEdit1.Text := DWGCMC ;
                    DWGCEdit2.ItemIndex := DWGCZYLBID-1 ;
                    DWGCEdit3.Text := DWGCBZR ;
                    DWGCEdit4.Text := DateToStr(DWGCBZRQ) ;
                    DWGCEdit5.Text := DWGCFNAME ;
                    SLevel := 2 ;
                    SId1 := XMTID ;
                    SId2 := FXGCID ;
                    SId3 := DWGCID ;
               end ;
          end ;
     end ;
     //goto current record
     with Dbs do
     begin
          TableXMT.Filtered := FALSE ;
          TableXMT.Filter   := '' ;
          TableFXGC.Filtered:= FALSE ;
          TableFXGC.Filter  := '' ;
          TableDWGC.Filtered:= FALSE ;
          TableDWGC.Filter  := '' ;
          TableXMT.FindKey([XMTID]) ;
          TableFXGC.FindKey([XMTID, FXGCID]) ;
          TableDWGC.FindKey([XMTID, FXGCID, DWGCID]) ;
     end ;
end ;

procedure TManPrjDlg.CheckSJ ;
var
   Node : TTreeNode ;
   procedure CheckMC(Sender: TObject) ;
   var
      s : string ;
      flag : boolean ;
      TableMC : TTable ;
   begin
        TableMC := TTable.Create (Self) ;
        TableMC.DatabaseName := 'SYSYSZL' ;
        s := TComboBox(Sender).Text ;
        if (s='') then exit ;
        flag := FALSE ;
        case TComboBox(Sender).Tag of
        1 : TableMC.TableName := 'GSMC' ;
        2 : TableMC.TableName := 'XM' ;
        3 : TableMC.TableName := 'JGLX' ;
        4 : TableMC.TableName := 'JCXS' ;
        5 : TableMC.TableName := 'JZTZ' ;
        6 : TableMC.TableName := 'GCLB' ;
        end ;
        TableMC.Open ;
        TableMC.First ;
        while(TRUE) do
        begin
             if (TableMC.EOF) then break ;
             if (s=TableMC.FieldByName('MC').AsString) then
             begin
                  flag := TRUE ;
                  break ;
             end ;
             TableMC.Next ;
        end ;
        if (flag) then
        begin
             TableMC.Close ;
             TableMC.Free ;
             exit ;
        end ;
        TableMC.AppendRecord([s]) ;
        TableMC.Close ;
        TableMC.Free ;
   end ;
begin
     if (XMTTreeView.Selected=Nil) then exit ;
     Node := XMTTreeView.Selected ;
     case Node.Level of
     0 :
          begin
               CheckMC(XMTEdit2) ;
               CheckMC(XMTEdit4) ;
          end ;
     1 :
          begin
               CheckMC(FXGCEdit2) ;
               CheckMC(FXGCEdit3) ;
               CheckMC(FXGCEdit4) ;
               CheckMC(FXGCEdit5) ;
               CheckMC(FXGCEdit6) ;
               CheckMC(FXGCEdit7) ;
               CheckMC(FXGCEdit8) ;
               CheckMC(FXGCEdit15) ;
               CheckMC(FXGCEdit16) ;
               CheckMC(FXGCEdit17) ;
          end ;
     2 :
          begin
               CheckMC(DWGCEdit3) ;
          end ;
     end ;
     InitCombox ;
end ;

procedure TManPrjDlg.WriteSJ ;
var
   Node : TTreeNode ;
begin
     if (XMTTreeView.Selected=Nil) then exit ;
     Node := XMTTreeView.Selected ;
     with Dbs do
     begin
          case Node.Level of
          0 :
               begin
                    if (TableXMT.FindKey([XMTID])) then
                    begin
                         TableXMT.Edit ;
                         TableXMT.FieldByName('XMTMC').AsString  := XMTMC ;
                         TableXMT.FieldByName('JSDW').AsString   := XMTJSDW ;
                         TableXMT.FieldByName('GCDD').AsString   := XMTGCDD ;
                         TableXMT.FieldByName('XMJL').AsString   := XMTXMJL ;
                         TableXMT.FieldByName('LXRQ').AsDateTime := XMTLXRQ ;
                         TableXMT.Post ;
                    end ;
               end ;
          1 :
               begin
                    if (TableFXGC.FindKey([XMTID,FXGCID])) then
                    begin
                         TableFXGC.Edit ;
                         TableFXGC.FieldByName('GCMC').AsString    := FXGCMC ;
                         TableFXGC.FieldByName('DWA').AsString     := FXGCDWA ;
                         TableFXGC.FieldByName('DWB').AsString     := FXGCDWB ;
                         TableFXGC.FieldByName('DWC').AsString     := FXGCDWC ;
                         TableFXGC.FieldByName('JGLX').AsString    := FXGCJGLX ;
                         TableFXGC.FieldByName('JCXS').AsString    := FXGCJCXS ;
                         TableFXGC.FieldByName('JZTZ').AsString    := FXGCJZTZ ;
                         TableFXGC.FieldByName('GCLB').AsString    := FXGCGCLB ;
                         TableFXGC.FieldByName('JZMJ').AsFloat     := FXGCJZMJ ;
                         TableFXGC.FieldByName('GCZJ').AsFloat     := FXGCGCZJ ;
                         TableFXGC.FieldByName('SCG').AsFloat      := FXGCSCG ;
                         TableFXGC.FieldByName('BZCG').AsFloat     := FXGCBZCG ;
                         TableFXGC.FieldByName('PMZJ').AsFloat     := FXGCPMZJ ;
                         TableFXGC.FieldByName('YG').AsFloat       := FXGCYG ;
                         TableFXGC.FieldByName('BZR').AsString     := FXGCBZR ;
                         TableFXGC.FieldByName('JHR').AsString     := FXGCJHR ;
                         TableFXGC.FieldByName('SHR').AsString     := FXGCSHR ;
                         TableFXGC.FieldByName('BZRQ').AsDateTime  := FXGCBZRQ ;
                         TableFXGC.Post ;
                    end ;
               end ;
          2 :
               begin
                    if (DWGCZYLBID<=0) then
                    begin
                         Application.MessageBox('对不起，该单位工程的专业类别请重新设置！',
                                                PChar(AppName),
                                                MB_OK or MB_ICONINFORMATION) ;
                         exit ;
                    end ;
                    if (TableDWGC.FindKey([XMTID,FXGCID,DWGCID])) then
                    begin
                         TableDWGC.Edit ;
                         TableDWGC.FieldByName('GCMC').AsString    := DWGCMC ;
                         TableDWGC.FieldByName('ZYLBID').AsInteger := DWGCZYLBID ;
                         TableDWGC.FieldByName('ZYLB').AsString    := DWGCZYLB ;
                         TableDWGC.FieldByName('BZR').AsString     := DWGCBZR ;
                         TableDWGC.FieldByName('BZRQ').AsDateTime  := DWGCBZRQ ;
                         TableDWGC.FieldByName('FNAME').AsString   := DWGCFNAME ;
                         TableDWGC.Post ;
                    end ;
               end ;
          end ;
     end ;
end ;

procedure TManPrjDlg.InitComBox ;
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
          XMTEdit2.Items  := FXGCEdit2.Items ;
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
          XMTEdit4.Items   := FXGCEdit15.Items ;
          FXGCEdit16.Items := FXGCEdit15.Items ;
          FXGCEdit17.Items := FXGCEdit15.Items ;
          DWGCEdit3.Items  := FXGCEdit15.Items ;
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
     end ;
end ;

function TManPrjDlg.CheckFile(FName : string) : boolean ;
begin
     Result := FALSE ;
     //check if is a empty table
     if (FName='') then
     begin
          Dbs.CreateNewDwgc(DWGCMC,DWGCZYLBID) ;
          FName := Dbs.TableUSER.TableName ;
     end ;
     //check tableuser if exsit
     if (Dbs.TableUSER.Active=TRUE) then Dbs.TableUSER.Close ;
     Dbs.TableUSER.TableName := FName ;
     try
        Dbs.TableUSER.Open ;
     except
     on EDataBaseError do
        begin
             Dbs.TableUSER.Close ;
             if (Application.MessageBox('对不起，该单位工程文件不存在或文件格式不正确，您是否要重新生成单位工程文件？',
                                        PChar(AppName),
                                        MB_OKCANCEL or MB_ICONQUESTION)=IDCANCEL) then
                exit ;
             Dbs.CreateNewDwgc(DWGCMC,DWGCZYLBID) ;
        end ;
     end ;
     Dbs.TableUSER.Close ;
     Result := TRUE ;
end ;

procedure TManPrjDlg.InitXmtTree ;
var
   node0 : TTreeNode ;
   node1 : TTreeNode ;
   node2 : TTreeNode ;
   snode : TTreeNode ;
begin
     //set XMTTreeView.OnChange is null
     XMTTreeView.OnChange := Nil ;
     //initialize XMTTreeView
     XMTTreeView.Items.Clear ;
     XMTTreeView.Selected := Nil ;
     snode := Nil ;
     with Dbs do
     begin
          if (TableXMT.Active=FALSE) then TableXMT.Open ;
          TableXMT.First ;
          while (TRUE) do
          begin

               if (TableXMT.EOF) then
                  break ;
               //Add level 0
               node0 := XMTTreeView.Items.AddChild (nil, TableXMTXMTMC.Value) ;
               node0.ImageIndex := 0 ;
               node0.SelectedIndex := 0 ;
               node0.StateIndex := -1-TableXMTXMTID.Value ;
               if (SLevel=0) then
               begin
                    if (SId1=TableXMTXMTID.Value) then
                       snode := node0 ;
               end ;
               //Add level 1
               TableFXGC.Filtered := FALSE ;
               TableFXGC.Filter := 'XMTID='+TableXMTXMTID.AsString ;
               TableFXGC.Filtered := TRUE ;
               while (TRUE) do
               begin
                    if (TableFXGC.EOF) then
                       break ;
                    node1 := XMTTreeView.Items.AddChild (node0, TableFXGCGCMC.Value) ;
                    node1.ImageIndex := 1 ;
                    node1.SelectedIndex := 1 ;
                    node1.StateIndex := -1-TableFXGCFXGCID.Value ;
                    if (SLevel=1) then
                    begin
                         if ((SId1=TableXMTXMTID.Value)and
                             (SId2=TableFXGCFXGCID.Value)) then
                            snode := node1 ;
                    end ;

                    TableDWGC.Filtered := FALSE ;
                    TableDWGC.Filter := 'XMTID='+TableFXGCXMTID.AsString+
                                        ' AND FXGCID='+TableFXGCFXGCID.AsString ;
                    TableDWGC.Filtered := TRUE ;
                    while (TRUE) do
                    begin
                         if (TableDWGC.EOF) then
                            break ;
                         //Add level 2
                         node2 := XMTTreeView.Items.AddChild (node1, TableDWGCGCMC.Value) ;
                         node2.ImageIndex := 2 ;
                         node2.SelectedIndex := 2 ;
                         node2.StateIndex := -1-TableDWGCDWGCID.Value ;
                         if (SLevel=2) then
                         begin
                              if((SId1=TableXMTXMTID.Value)and
                                 (SID2=TableFXGCFXGCID.Value)and
                                 (SId3=TableDWGCDWGCID.Value)) then
                                 snode := node2 ;
                         end ;

                         TableDWGC.Next ;

                    end ;

                    TableFXGC.Next ;
               end ;

               TableXMT.Next ;

          end ;
          TableFXGC.Filtered := FALSE ;
          TableFXGC.Filter := '' ;
          TableDWGC.Filtered := FALSE ;
          TableDWGC.Filter := '' ;
     end ;
     //set XMTTreeView.OnChange default value
     XMTTreeView.OnChange := XMTTreeViewChange ;
     //set selected node
     if (snode<>Nil) then
        XMTTreeView.Selected := snode
     else
         ShowPanel ;
end ;

procedure TManPrjDlg.FormShow(Sender: TObject);
begin
     //initialize system argument
     scommand := '' ;

     PanelXMT.Visible  := FALSE ;
     PanelDXGC.Visible := FALSE ;
     PanelDWGC.Visible := FALSE ;

     BitBtn1.Enabled := TRUE ;
     BitBtn2.Enabled := FALSE ;
     BitBtn3.Enabled := FALSE ;
     N1.Enabled := BitBtn1.Enabled ;
     N2.Enabled := BitBtn2.Enabled ;
     N3.Enabled := BitBtn3.Enabled ;

     PanelXMT.Left := 232 ;
     PanelXMT.Top := 8 ;
     PanelDXGC.Left := 232 ;
     PanelDXGC.Top := 8 ;
     PanelDWGC.Left := 232 ;
     PanelDWGC.Top := 8 ;

     XMTEdit2.Tag   := 1 ;
     FXGCEdit2.Tag  := 1 ;
     FXGCEdit3.Tag  := 1 ;
     FXGCEdit4.Tag  := 1 ;

     XMTEdit4.Tag   := 2 ;
     FXGCEdit15.Tag := 2 ;
     FXGCEdit16.Tag := 2 ;
     FXGCEdit17.Tag := 2 ;
     DWGCEdit3.Tag  := 2 ;

     FXGCEdit5.Tag  := 3 ;
     FXGCEdit6.Tag  := 4 ;
     FXGCEdit7.Tag  := 5 ;
     FXGCEdit8.Tag  := 6 ;

     //initialize project tree
     SLevel := -1 ;
     SId1 := -1 ;
     SId2 := -1 ;
     SId3 := -1 ;
     InitXmtTree ;
     XMTTreeView.SetFocus ;
     //check if projrct tree is null
     if (XMTTreeView.Items.Count<=0) then
     begin
          Application.MessageBox( '对不起，您现在没有建设项目或其他的工程文件！请先建立新的建设项目或工程文件！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     //set item[0] is selected
     XMTTreeView.Selected := XMTTreeView.Items[0] ;
end;

procedure TManPrjDlg.XMTTreeViewChange(Sender: TObject; Node: TTreeNode);
begin
     ClearSJ ;
     GetSJFromDbf ;
     DisplaySJ ;
     ShowPanel ;
     ShowBitBtn ;
end;

procedure TManPrjDlg.XMTSpeedButton1Click(Sender: TObject);
var
   Node : TTreeNode ;
begin
     if (Application.MessageBox('您是否确认将修改结果保存？',
                                PChar(AppName),
                                MB_OKCANCEL or MB_ICONQUESTION)=IDCANCEL) then
     begin
          GetSJFromDbf ;
          DisplaySJ ;
     end ;
     GetSJFromPanel ;
     CheckSJ ;
     WriteSJ ;
     GetSJFromDbf ;
     DisplaySJ ;
     ShowBitBtn ;
     if (XMTTreeView.Selected=Nil) then exit ;
     Node := XMTTreeView.Selected ;
     case Node.Level of
     0 : Node.Text := XMTMC ;
     1 : Node.Text := FXGCMC ;
     2 : Node.Text := DWGCMC ;
     end ;
end;

procedure TManPrjDlg.DWGCSpeedButton1Click(Sender: TObject);
begin
     if (ManDWGCDlg.ShowModal=IDOK) then
     begin
          DWGCEdit5.Text := ManDWGCDlg.FName ;
          XMTSpeedButton1Click(DWGCSpeedButton2) ;
     end ;
end;

procedure TManPrjDlg.XMTEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   s : string ;
   TableMC : TTable ;
begin
     TableMC := TTable.Create (Self) ;
     TableMC.DatabaseName := 'SYSYSZL' ;
     case TComboBox(Sender).Tag of
     1 : TableMC.TableName := 'GSMC' ;
     2 : TableMC.TableName := 'XM' ;
     3 : TableMC.TableName := 'JGLX' ;
     4 : TableMC.TableName := 'JCXS' ;
     5 : TableMC.TableName := 'JZTZ' ;
     6 : TableMC.TableName := 'GCLB' ;
     end ;
     TableMC.Open ;
     TableMC.First ;
     if (TComboBox(Sender).DroppedDown) then
     begin
          if (Key=46) then
          begin
               s := TComboBox(Sender).Items[TComboBox(Sender).ItemIndex] ;
               TableMC.First ;
               while (TRUE) do
               begin
                    if (TableMC.EOF) then break ;
                    if (s=TableMC.FieldByName('MC').AsString) then
                    begin
                         TableMC.Delete ;
                         break ;
                    end ;
                    TableMC.Next ;
               end ;
               TableMC.Close ;
               TableMC.Free ;
               InitComBox ;
               DisplaySJ ;
          end ;
     end ;
end;

procedure TManPrjDlg.CopyXmt(SXMTID : integer; DXMTID : integer) ;
var
   i : integer ;
begin
     //check SXMTID
     //value -1    Current Record
     //other       Special Record
     if (SXMTID<>-1) then
     begin
          if (Dbs.TableXMT.FindKey([SXMTID])) then
          begin
               XMTID     := Dbs.TableXMT.FieldByName('XMTID').AsInteger ;
               XMTMC     := Dbs.TableXMT.FieldByName('XMTMC').AsString ;
               XMTJSDW   := Dbs.TableXMT.FieldByName('JSDW').AsString ;
               XMTGCDD   := Dbs.TableXMT.FieldByName('GCDD').AsString ;
               XMTXMJL   := Dbs.TableXMT.FieldByName('XMJL').AsString ;
               XMTLXRQ   := Dbs.TableXMT.FieldByName('LXRQ').AsDateTime ;
          end else
          begin
               Application.MessageBox('对不起，您选择的建设项目在项目体数据表中不存在，请检查！',
                                      PChar(AppName),
                                      MB_OK or MB_ICONSTOP) ;
               exit ;
          end ;
     end ;
     //check DXMTID
     //value -1    Auto find DXMTID
     //other       Special DXMTID
     if (DXMTID=-1) then
     begin
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
          DXMTID := i ;
     end else
     begin
          if (Dbs.TableXMT.FindKey([DXMTID])) then
          begin
               Application.MessageBox( '对不起，该项目体已经存在，请检查！',
                                       PChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
     end ;
     XMTID := DXMTID ;
     XMTMC := '复制'+XMTMC ;
     Dbs.TableXMT.AppendRecord( [XMTID,XMTMC,XMTJSDW,XMTGCDD,XMTXMJL,XMTLXRQ] ) ;
end ;

procedure TManPrjDlg.CopyFxgc(SXMTID : integer; SFXGCID : integer; DXMTID : integer; DFXGCID : integer) ;
var
   i : integer ;
begin
     //check SXMTID
     //value -1    Current Record
     //other       Special Record
     if (SXMTID<>-1) then
     begin
          if (Dbs.TableXMT.FindKey([SXMTID])) then
          begin
               XMTID     := Dbs.TableXMT.FieldByName('XMTID').AsInteger ;
               XMTMC     := Dbs.TableXMT.FieldByName('XMTMC').AsString ;
               XMTJSDW   := Dbs.TableXMT.FieldByName('JSDW').AsString ;
               XMTGCDD   := Dbs.TableXMT.FieldByName('GCDD').AsString ;
               XMTXMJL   := Dbs.TableXMT.FieldByName('XMJL').AsString ;
               XMTLXRQ   := Dbs.TableXMT.FieldByName('LXRQ').AsDateTime ;
          end else
          begin
               Application.MessageBox('对不起，您选择的建设项目在项目体数据表中不存在，请检查！',
                                      PChar(AppName),
                                      MB_OK or MB_ICONSTOP) ;
               exit ;
          end ;
     end ;
     //Check SFXGCID
     //value -1     Current record
     //other        Spicial record
     if (SFXGCID<>-1) then
     begin
          if (Dbs.TableFXGC.FindKey([SXMTID,SFXGCID])) then
          begin
               FXGCID    := Dbs.TableFXGC.FieldByName('FXGCID').AsInteger ;
               FXGCMC    := Dbs.TableFXGC.FieldByName('GCMC').AsString ;
               FXGCDWA   := Dbs.TableFXGC.FieldByName('DWA').AsString ;
               FXGCDWB   := Dbs.TableFXGC.FieldByName('DWB').AsString ;
               FXGCDWC   := Dbs.TableFXGC.FieldByName('DWC').AsString ;
               FXGCJGLX  := Dbs.TableFXGC.FieldByName('JGLX').AsString ;
               FXGCJCXS  := Dbs.TableFXGC.FieldByName('JCXS').AsString ;
               FXGCJZTZ  := Dbs.TableFXGC.FieldByName('JZTZ').AsString ;
               FXGCGCLB  := Dbs.TableFXGC.FieldByName('GCLB').AsString ;
               FXGCJZMJ  := Dbs.TableFXGC.FieldByName('JZMJ').AsFloat ;
               FXGCGCZJ  := Dbs.TableFXGC.FieldByName('GCZJ').AsFloat ;
               FXGCSCG   := Dbs.TableFXGC.FieldByName('SCG').AsFloat ;
               FXGCBZCG  := Dbs.TableFXGC.FieldByName('BZCG').AsFloat ;
               FXGCPMZJ  := Dbs.TableFXGC.FieldByName('PMZJ').AsFloat ;
               FXGCYG    := Dbs.TableFXGC.FieldByName('YG').AsFloat ;
               FXGCBZR   := Dbs.TableFXGC.FieldByName('BZR').AsString ;
               FXGCJHR   := Dbs.TableFXGC.FieldByName('JHR').AsString ;
               FXGCSHR   := Dbs.TableFXGC.FieldByName('SHR').AsString ;
               FXGCBZRQ  := Dbs.TableFXGC.FieldByName('BZRQ').AsDateTime ;
          end else
          begin
               Application.MessageBox('对不起，您选择的分项工程在分项工程数据表中不存在，请检查！',
                                      PChar(AppName),
                                      MB_OK or MB_ICONSTOP) ;
               exit ;
          end ;
     end ;
     //check DXMTID
     if (not Dbs.TableXMT.FindKey([DXMTID])) then
     begin
          Application.MessageBox( '对不起，您要选择的目标项目体在项目体数据表中不存在，请检查！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONSTOP) ;
          exit ;
     end ;
     //check DFXGCID
     //value -1    Auto find DFXGCID
     //other       Special DFXGCID
     if (DFXGCID=-1) then
     begin
          i := 1 ;
          while (TRUE) do
          begin
               if (i<=0) then
               begin
                    Application.MessageBox( '对不起，软件中管理的分项工程超过管理上限！',
                                            PChar(AppName),
                                            MB_OK or MB_ICONSTOP ) ;
                    exit ;
               end ;
               if (not Dbs.TableFXGC.FindKey([DXMTID,i])) then break ;
               i := i+1 ;
          end ;
          DFXGCID := i ;
     end else
     begin
          if (Dbs.TableFXGC.FindKey([DXMTID,DFXGCID])) then
          begin
               Application.MessageBox( '对不起，该分项工程已经存在，请检查！',
                                       PChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
     end ;

     XMTID := DXMTID ;
     FXGCID := DFXGCID ;
     FXGCMC := '复制'+FXGCMC ;
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

procedure TManPrjDlg.CopyDwgc(SXMTID : integer; SFXGCID : integer; SDWGCID : integer;
                              DXMTID : integer; DFXGCID : integer; DDWGCID : integer) ;
var
   i : integer ;
   TableList : TstringList ;
   SName, DName : string ;
   T : TTable ;
begin
     SName     := DWGCFNAME ;
     DName     := DWGCFNAME ;
     //check SXMTID
     //value -1    Current Record
     //other       Special Record
     if (SXMTID<>-1) then
     begin
          if (Dbs.TableXMT.FindKey([SXMTID])) then
          begin
               XMTID     := Dbs.TableXMT.FieldByName('XMTID').AsInteger ;
               XMTMC     := Dbs.TableXMT.FieldByName('XMTMC').AsString ;
               XMTJSDW   := Dbs.TableXMT.FieldByName('JSDW').AsString ;
               XMTGCDD   := Dbs.TableXMT.FieldByName('GCDD').AsString ;
               XMTXMJL   := Dbs.TableXMT.FieldByName('XMJL').AsString ;
               XMTLXRQ   := Dbs.TableXMT.FieldByName('LXRQ').AsDateTime ;
          end else
          begin
               Application.MessageBox('对不起，您选择的建设项目在项目体数据表中不存在，请检查！',
                                      PChar(AppName),
                                      MB_OK or MB_ICONSTOP) ;
               exit ;
          end ;
     end ;
     //check SFXGCID
     //value -1     Current record
     //other        Special record
     if (SFXGCID<>-1) then
     begin
          if (Dbs.TableFXGC.FindKey([SXMTID,SFXGCID])) then
          begin
               FXGCID    := Dbs.TableFXGC.FieldByName('FXGCID').AsInteger ;
               FXGCMC    := Dbs.TableFXGC.FieldByName('GCMC').AsString ;
               FXGCDWA   := Dbs.TableFXGC.FieldByName('DWA').AsString ;
               FXGCDWB   := Dbs.TableFXGC.FieldByName('DWB').AsString ;
               FXGCDWC   := Dbs.TableFXGC.FieldByName('DWC').AsString ;
               FXGCJGLX  := Dbs.TableFXGC.FieldByName('JGLX').AsString ;
               FXGCJCXS  := Dbs.TableFXGC.FieldByName('JCXS').AsString ;
               FXGCJZTZ  := Dbs.TableFXGC.FieldByName('JZTZ').AsString ;
               FXGCGCLB  := Dbs.TableFXGC.FieldByName('GCLB').AsString ;
               FXGCJZMJ  := Dbs.TableFXGC.FieldByName('JZMJ').AsFloat ;
               FXGCGCZJ  := Dbs.TableFXGC.FieldByName('GCZJ').AsFloat ;
               FXGCSCG   := Dbs.TableFXGC.FieldByName('SCG').AsFloat ;
               FXGCBZCG  := Dbs.TableFXGC.FieldByName('BZCG').AsFloat ;
               FXGCPMZJ  := Dbs.TableFXGC.FieldByName('PMZJ').AsFloat ;
               FXGCYG    := Dbs.TableFXGC.FieldByName('YG').AsFloat ;
               FXGCBZR   := Dbs.TableFXGC.FieldByName('BZR').AsString ;
               FXGCJHR   := Dbs.TableFXGC.FieldByName('JHR').AsString ;
               FXGCSHR   := Dbs.TableFXGC.FieldByName('SHR').AsString ;
               FXGCBZRQ  := Dbs.TableFXGC.FieldByName('BZRQ').AsDateTime ;
          end else
          begin
               Application.MessageBox('对不起，您选择的分项工程在分项工程数据表中不存在，请检查！',
                                      PChar(AppName),
                                      MB_OK or MB_ICONSTOP) ;
               exit ;
          end ;
     end ;
     //check SDWGCID
     //value -1     Current record
     //other        Special record
     if (SDWGCID<>-1) then
     begin
          if (Dbs.TableDWGC.FindKey([SXMTID,SFXGCID,SDWGCID])) then
          begin
               DWGCID    := Dbs.TableDWGC.FieldByName('DWGCID').AsInteger ;
               DWGCMC    := Dbs.TableDWGC.FieldByName('GCMC').AsString ;
               DWGCZYLBID:= Dbs.TableDWGC.FieldByName('ZYLBID').AsInteger ;
               DWGCZYLB  := Dbs.TableDWGC.FieldByName('ZYLB').AsString ;
               DWGCBZR   := Dbs.TableDWGC.FieldByName('BZR').AsString ;
               DWGCBZRQ  := Dbs.TableDWGC.FieldByName('BZRQ').AsDateTime ;
               DWGCFNAME := Dbs.TableDWGC.FieldByName('FNAME').AsString ;
               SName     := DWGCFNAME ;
               DName     := DWGCFNAME ;
          end else
          begin
               Application.MessageBox('对不起，您选择的分项工程在分项工程数据表中不存在，请检查！',
                                      PChar(AppName),
                                      MB_OK or MB_ICONSTOP) ;
               exit ;
          end ;
     end ;
     //check DXMTID
     if (not Dbs.TableXMT.FindKey([DXMTID])) then
     begin
          Application.MessageBox( '对不起，您要选择的目标项目体在项目体数据表中不存在，请检查！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONSTOP) ;
          exit ;
     end ;
     //check DFXGCID
     if (not Dbs.TableFXGC.FindKey([DXMTID,DFXGCID])) then
     begin
          Application.MessageBox( '对不起，您要选择的目标单项工程在单项工程数据表中不存在，请检查！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONSTOP) ;
          exit ;
     end ;
     //check DDWGCID
     //value -1    Auto find DDWGCID
     //other       Special DDWGCID
     if (DDWGCID=-1) then
     begin
          i := 1 ;
          while (TRUE) do
          begin
               if (i<=0) then
               begin
                    Application.MessageBox( '对不起，软件中管理的单位工程工程超过管理上限！',
                                            PChar(AppName),
                                            MB_OK or MB_ICONSTOP ) ;
                    exit ;
               end ;
               if (not Dbs.TableDWGC.FindKey([DXMTID,DFXGCID,i])) then break ;
               i := i+1 ;
          end ;
          DDWGCID := i ;
     end else
     begin
          if (Dbs.TableDWGC.FindKey([DXMTID,DFXGCID,DDWGCID])) then
          begin
               Application.MessageBox( '对不起，该单位工程已经存在，请检查！',
                                       PChar(AppName),
                                       MB_OK or MB_ICONSTOP ) ;
               exit ;
          end ;
     end ;

     //check FNAME
     if (pos('.',DName)<>0) then copy(DName,1,pos('.',DName)-1) ;
     //get all table file and find if this table file is exist
     TableList := TstringList.Create ;
     Session.GetTableNames(Dbs.UserDatabase.DatabaseName,'',FALSE,FALSE,TableList) ;
     //auto-create a befit table
     if (TableList.IndexOf(DName)<>-1) then
     begin
          i := -1 ;
          while (TRUE) do
          begin
               i := i+1 ;
               if (TableList.IndexOf(DName+IntToStr(i))=-1) then
               begin
                    DName := DName+IntToStr(i) ;
                    break ;
               end ;
          end ;
     end else
     begin
          TableList.Free ;
          exit ;
     end ;
     TableList.Free ;

     //copy SFname to DFname
     if (Dbs.TableUSER.Active) then Dbs.TableUSER.Close ;
     Dbs.TableUSER.DatabaseName := 'USER' ;
     Dbs.TableUSER.TableName := SName ;
     T := TTable.Create(Self) ;
     T.DatabaseName := 'USER' ;
     T.TableName := DName ;
     T.BatchMove (Dbs.TableUSER, batCopy) ;
     T.Close ;
     Dbs.TableUSER.Close ;
     T.Free ;
     //a few statement
     XMTID     := DXMTID ;
     FXGCID    := DFXGCID ;
     DWGCID    := DDWGCID ;
     DWGCMC    := '复制'+DWGCMC ;
     DWGCFNAME := DName ;
     Dbs.TableDWGC.AppendRecord([XMTID,FXGCID,DWGCID,DWGCMC,
                                 DWGCZYLBID,DWGCZYLB,DWGCBZR,
                                 DWGCBZRQ,DWGCFNAME]) ;
end ;

procedure TManPrjDlg.BitBtn1Click(Sender: TObject);
begin
     //create a new xmt
     if (NewXmtDlg.ShowModal=IDOK) then
     begin
          SLevel := 0 ;
          SId1 := DBS.TableXMT.FieldByName('XMTID').AsInteger ;
          SId2 := -1 ;
          SId3 := -1 ;
          InitXmtTree ;
     end ;
end;

procedure TManPrjDlg.BitBtn2Click(Sender: TObject);
begin
     if (XMTID<=0) then
     begin
          Application.MessageBox( '请您先选择一个项目体！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     NewDXGCDlg.XMTID := XMTID ;
     if (NewDXGCDlg.ShowModal=IDOK) then
     begin
          SLevel := 1 ;
          SId1 := DBS.TableXMT.FieldByName('XMTID').AsInteger ;
          SId2 := DBS.TableFXGC.FieldByName('FXGCID').AsInteger ;
          SId3 := -1 ;
          InitXmtTree ;
     end ;
end;

procedure TManPrjDlg.BitBtn3Click(Sender: TObject);
begin
     if ((XMTID<=0)or(FXGCID<=0)) then
     begin
          Application.MessageBox( '请您先选择一个项目体！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     NewDWGCDlg.XMTID  := XMTID ;
     NewDWGCDlg.FXGCID := FXGCID ;
     if (NewDWGCDlg.ShowModal=IDOK) then
     begin
          SLevel := 2 ;
          SId1 := DBS.TableXMT.FieldByName('XMTID').AsInteger ;
          SId2 := DBS.TableFXGC.FieldByName('FXGCID').AsInteger ;
          SId3 := DBS.TableDWGC.FieldByName('DWGCID').AsInteger ;
          InitXmtTree ;
     end ;
end;

procedure TManPrjDlg.BitBtn4Click(Sender: TObject);
begin
     if (XMTTreeView.Items.Count<=0) then
     begin
          Application.MessageBox( '对不起，您现在没有建设项目或其他的工程文件！请先建立新的建设项目或工程文件！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     if (Application.MessageBox( '您真的删除选定的条目吗？',
                                 PChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION)=IDCANCEL) then
        exit ;
     if (XMTTreeView.Selected=Nil) then exit ;

     case XMTTreeView.Selected.Level of
     0 :
          begin
               with Dbs do
               begin
                    if (TableUSER.Active=TRUE) then
                       exit ;
                    if (TableXMT.FindKey([XMTID])) then
                    begin
                         TableFXGC.Filtered := FALSE ;
                         TableFXGC.Filter   := 'XMTID='+TableXMTXMTID.AsString ;
                         TableFXGC.Filtered := TRUE ;
                         while (TRUE) do
                         begin
                              TableFXGC.First ;
                              if (TableFXGC.EOF) then
                                 break ;
                              TableDWGC.Filtered := FALSE ;
                              TableDWGC.Filter := 'XMTID='+TableFXGCXMTID.AsString+
                                                  ' AND FXGCID='+TableFXGCFXGCID.AsString ;
                              TableDWGC.Filtered := TRUE ;
                              while (TRUE) do
                              begin
                                   TableDWGC.First ;
                                   if (TableDWGC.EOF) then
                                      break ;
                                   TableUSER.TableName := TableDWGC.FieldByName('FNAME').AsString ;
                                   try
                                      TableUSER.DeleteTable ;
                                   except
                                   on EDataBaseError do
                                      MessageBeep (0) ;
                                   end ;
                                   TableDWGC.Delete ;
                              end ;
                              TableFXGC.Delete ;
                         end ;
                         TableXMT.Delete ;
                         if (TableXMT.RecordCount<>0) then
                         begin
                              SLevel := 0 ;
                              SId1   := TableXMT.FieldByName('XMTID').AsInteger ;
                              SId2   := -1 ;
                              SId3   := -1 ;
                         end else
                         begin
                              SLevel := -1 ;
                              SId1   := -1 ;
                              SId2   := -1 ;
                              SId3   := -1 ;
                         end ;
                    end ;
               end ;
          end ;
     1 :
          begin
               with Dbs do
               begin
                    if (TableUSER.Active=TRUE) then
                       exit ;
                    TableFXGC.Filtered := FALSE ;
                    TableFXGC.Filter   := 'XMTID='+IntToStr(XMTID) ;
                    TableFXGC.Filtered := TRUE ;
                    if (TableFXGC.FindKey([XMTID, FXGCID])) then
                    begin
                         TableDWGC.Filtered := FALSE ;
                         TableDWGC.Filter := 'XMTID='+TableFXGCXMTID.AsString+
                                             ' AND FXGCID='+TableFXGCFXGCID.AsString ;
                         TableDWGC.Filtered := TRUE ;
                         while (TRUE) do
                         begin
                              TableDWGC.First ;
                              if (TableDWGC.EOF) then
                                 break ;
                              TableUSER.TableName := TableDWGC.FieldByName('FNAME').AsString ;
                              try
                                 TableUSER.DeleteTable ;
                              except
                              on EDataBaseError do
                                 MessageBeep (0) ;
                              end ;
                              TableDWGC.Delete ;
                         end ;
                         TableFXGC.Delete ;
                         if (TableFXGC.RecordCount<>0) then
                         begin
                              SLevel := 1 ;
                              SId2   := TableFXGC.FieldByName('FXGCID').AsInteger ;
                              SId3   := -1 ;
                         end else
                         begin
                              SLevel := 0 ;
                              SId2   := -1 ;
                              SId3   := -1 ;
                         end ;
                    end ;
               end ;
          end ;
     2 :
          begin
               with Dbs do
               begin
                    if (TableUSER.Active=TRUE) then
                       exit ;
                    TableDWGC.Filtered := FALSE ;
                    TableDWGC.Filter := 'XMTID='+IntToStr(XMTID)+' AND FXGCID='+IntToStr(FXGCID) ;
                    TableDWGC.Filtered := TRUE ;
                    if (TableDWGC.FindKey([XMTID, FXGCID, DWGCID])) then
                    begin
                         TableUSER.TableName := TableDWGC.FieldByName('FNAME').AsString ;
                         try
                            TableUSER.DeleteTable ;
                         except
                         on EDataBaseError do
                            MessageBeep (0) ;
                         end ;
                         TableDWGC.Delete ;
                         if (TableDWGC.RecordCount<>0) then
                         begin
                              SLevel := 2 ;
                              SId3 := TableDWGC.FieldByName('DWGCID').AsInteger
                         end else
                         begin
                              SLevel := 1 ;
                              SId3 := -1 ;
                         end ;
                    end ;
               end ;
          end ;
     end ;

     InitXmtTree ;
     GetSJFromDbf ;
     DisplaySJ ;
     ShowBitBtn ;

     //set default value
     with Dbs do
     begin
          TableXMT.Filtered  := FALSE ;
          TableXMT.Filter    := '' ;
          TableFXGC.Filtered := FALSE ;
          TableFXGC.Filter   := '' ;
          TableDWGC.Filtered := FALSE ;
          TableDWGC.Filter   := '' ;
     end ;
     //check if project tree is null
     if (XMTTreeView.Items.Count<=0) then
     begin
          Application.MessageBox( '对不起，您现在没有建设项目或其他的工程文件！请先建立新的建设项目或工程文件！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
end;

procedure TManPrjDlg.BitBtn5Click(Sender: TObject);
var
   s1, s2 : integer ;
   TT : TTable ;
   T1 : TTable ;
begin
     if (XMTTreeView.Items.Count<=0) then
     begin
          Application.MessageBox( '对不起，您现在没有建设项目或其他的工程文件！请先建立新的建设项目或工程文件！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     TT := TTable.Create(Self) ;
     TT.DatabaseName := 'SYSYSZL' ;
     T1 := TTable.Create(Self) ;
     T1.DatabaseName := 'SYSYSZL' ;
     case XMTTreeView.Selected.Level of
     0 :
         begin
              if (Application.MessageBox('您是否复制当前选择的建设项目？',
                                         PChar(AppName),
                                         MB_OKCANCEL or MB_ICONQUESTION)=IDOK) then
              begin
                   SLevel := 0 ;
                   SId1 := XMTID ;
                   SId2 := -1 ;
                   SId3 := -1 ;
                   CopyXmt(-1,-1) ;

                   s1 := XMTID ;
                   Dbs.TableFXGC.Filtered := FALSE ;
                   Dbs.TableFXGC.Filter := 'XMTID='+IntToStr(SId1) ;
                   Dbs.TableFXGC.Filtered := TRUE ;

                   TT.Close ;
                   TT.TableName := 'TEMP' ;
                   TT.BatchMove (Dbs.TableFXGC,batCopy) ;
                   Dbs.TableFXGC.Filtered := FALSE ;
                   Dbs.TableFXGC.Filter := '' ;

                   TT.Open ;
                   TT.First ;
                   while (TRUE) do
                   begin
                         if (TT.EOF) then
                            break ;
                         XMTID := SId1 ;
                         FXGCID := TT.FieldByName('FXGCID').AsInteger ;
                         SID2 := FXGCID ;
                         CopyFxgc(XMTID,FXGCID,s1,-1) ;

                         s1 := XMTID ;
                         s2 := FXGCID ;
                         Dbs.TableDWGC.Filtered := FALSE ;
                         Dbs.TableDWGC.Filter := 'XMTID='+IntToStr(SId1)+
                                                 ' AND FXGCID='+IntToStr(SId2) ;
                         Dbs.TableDWGC.Filtered := TRUE ;
                         T1.Close ;
                         T1.TableName := 'TEMP1' ;
                         T1.BatchMove (Dbs.TableDWGC,batCopy) ;
                         Dbs.TableDWGC.Filtered := FALSE ;
                         Dbs.TableDWGC.Filter := '' ;

                         T1.Open ;
                         T1.First ;
                         while (TRUE) do
                         begin
                              if (T1.EOF) then
                                 break ;
                              XMTID := SId1 ;
                              FXGCID := SId2 ;
                              DWGCID := T1.FieldByName('DWGCID').AsInteger ;
                              CopyDwgc(XMTID,FXGCID,DWGCID,s1,s2,-1) ;
                              T1.Next ;
                         end ;
                         T1.Close ;
                         T1.DeleteTable ;

                         TT.Next ;
                   end ;
                   TT.Close ;
                   TT.DeleteTable ;
              end ;
         end ;
     1 :
         begin
              STreeViewDlg.ExpandLevel := 0 ;
              if (STreeViewDlg.ShowModal=IDOK) then
              begin
                   SLevel := 1 ;
                   SId1 := XMTID ;
                   SId2 := FXGCID ;
                   SId3 := -1 ;
                   CopyFxgc(-1,-1,STreeViewDlg.Sid1,-1) ;
                   s1 := XMTID ;
                   s2 := FXGCID ;
                   Dbs.TableDWGC.Filtered := FALSE ;
                   Dbs.TableDWGC.Filter := 'XMTID='+IntToStr(SId1)+
                                           ' AND FXGCID='+IntToStr(SId2) ;
                   Dbs.TableDWGC.Filtered := TRUE ;
                   TT.Close ;
                   TT.TableName := 'TEMP' ;
                   TT.BatchMove (Dbs.TableDWGC,batCopy) ;
                   Dbs.TableDWGC.Filtered := FALSE ;
                   Dbs.TableDWGC.Filter := '' ;

                   TT.Open ;
                   TT.First ;
                   while (TRUE) do
                   begin
                         if (TT.EOF) then
                            break ;
                         XMTID := SId1 ;
                         FXGCID := SId2 ;
                         DWGCID := TT.FieldByName('DWGCID').AsInteger ;
                         CopyDwgc(XMTID,FXGCID,DWGCID,s1,s2,-1) ;
                         TT.Next ;
                   end ;
                   TT.Close ;
                   TT.DeleteTable ;
              end ;
         end ;
     2 :
         begin
              STreeViewDlg.ExpandLevel := 1 ;
              if (STreeViewDlg.ShowModal=IDOK) then
              begin
                   SLevel := 2 ;
                   SId1 := XMTID ;
                   SId2 := FXGCID ;
                   SId3 := DWGCID ;
                   CopyDwgc(-1,-1,-1,STreeViewDlg.Sid1,STreeViewDlg.Sid2,-1) ;
              end ;
         end ;
     end ;
     if (TT.Active=TRUE) then TT.Close ;
     if (T1.Active=TRUE) then T1.Close ;
     TT.Free ;
     T1.Free ;
     //initialize interface
     InitXmtTree ;
     GetSJFromDbf ;
     DisplaySJ ;
     ShowBitBtn ;
end;

procedure TManPrjDlg.BitBtn6Click(Sender: TObject);
var
   FName : string ;
   TT : TTable ;
   T1 : TTable ;
   procedure CopySystemSJ ;
   begin
        with Dbs do
        begin
             TableXMT.Close ;
             TableFXGC.Close ;
             TableDWGC.Close ;
             TableUSER.Close ;
        end ;
        FName := 'XMT.DB' ;
        CopyFileDlg.f1 := Dbs.SysDatabase.Directory+FName ;
        CopyFileDlg.f2 := SDriveDlg.directory+FName ;
        CopyFileDlg.Repaint ;
        FName := 'XMT.PX' ;
        CopyFileDlg.f1 := Dbs.SysDatabase.Directory+FName ;
        CopyFileDlg.f2 := SDriveDlg.directory+FName ;
        CopyFileDlg.Repaint ;
        FName := 'FXGC.DB' ;
        CopyFileDlg.f1 := Dbs.SysDatabase.Directory+FName ;
        CopyFileDlg.f2 := SDriveDlg.directory+FName ;
        CopyFileDlg.Repaint ;
        FName := 'FXGC.PX' ;
        CopyFileDlg.f1 := Dbs.SysDatabase.Directory+FName ;
        CopyFileDlg.f2 := SDriveDlg.directory+FName ;
        CopyFileDlg.Repaint ;
        FName := 'DWGC.DB' ;
        CopyFileDlg.f1 := Dbs.SysDatabase.Directory+FName ;
        CopyFileDlg.f2 := SDriveDlg.directory+FName ;
        CopyFileDlg.Repaint ;
        FName := 'DWGC.PX' ;
        CopyFileDlg.f1 := Dbs.SysDatabase.Directory+FName ;
        CopyFileDlg.f2 := SDriveDlg.directory+FName ;
        CopyFileDlg.Repaint ;
        with Dbs do
        begin
             TableXMT.Open ;
             TableFXGC.Open ;
             TableDWGC.Open ;
        end ;
   end ;
begin
     if (XMTTreeView.Items.Count<=0) then
     begin
          Application.MessageBox( '对不起，您现在没有建设项目或其他的工程文件！请先建立新的建设项目或工程文件！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;

     TT := TTable.Create(Self) ;
     TT.DatabaseName := 'SYSYSZL' ;
     T1 := TTable.Create(Self) ;
     T1.DatabaseName := 'SYSYSZL' ;

     case XMTTreeView.Selected.Level of
     0 :
         begin
              if (SDriveDlg.ShowModal=IDOK) then
              begin
                   //Show CopyFileDlg
                   CopyFileDlg.Show ;
                   //Copy System Information
                   CopySystemSJ ;
                   //Copy USER file
                   Dbs.TableFXGC.Filtered := FALSE ;
                   Dbs.TableFXGC.Filter   := 'XMTID='+IntToStr(XMTID) ;
                   Dbs.TableFXGC.Filtered := TRUE ;
                   TT.Close ;
                   TT.TableName := 'TEMP' ;
                   TT.BatchMove (Dbs.TableFXGC,batCopy) ;
                   Dbs.TableFXGC.Filtered := FALSE ;
                   Dbs.TableFXGC.Filter := '' ;
                   TT.Open ;
                   TT.First ;
                   while (TRUE) do
                   begin
                         if (TT.EOF) then
                            break ;
                         FXGCID := TT.FieldByName('FXGCID').AsInteger ;
                         Dbs.TableDWGC.Filtered := FALSE ;
                         Dbs.TableDWGC.Filter := 'XMTID='+IntToStr(XMTID)+
                                                 ' AND FXGCID='+IntToStr(FXGCID) ;
                         Dbs.TableDWGC.Filtered := TRUE ;
                         T1.Close ;
                         T1.TableName := 'TEMP1' ;
                         T1.BatchMove (Dbs.TableDWGC,batCopy) ;
                         Dbs.TableDWGC.Filtered := FALSE ;
                         Dbs.TableDWGC.Filter := '' ;
                         T1.Open ;
                         T1.First ;
                         while (TRUE) do
                         begin
                              if (T1.EOF) then
                                 break ;
                              FName := T1.FieldByName('FNAME').AsString+'.DB' ;
                              CopyFileDlg.f1 := Dbs.UserDatabase.Directory+FName ;
                              CopyFileDlg.f2 := SDriveDlg.directory+FName ;
                              CopyFileDlg.Repaint ;
                              T1.Next ;
                         end ;
                         T1.Close ;
                         T1.DeleteTable ;
                         TT.Next ;
                   end ;
                   TT.Close ;
                   TT.DeleteTable ;
                   //Hide CopyFileDlg
                   CopyFileDlg.Hide ;
              end ;
         end ;
     1 :
         begin
              if (SDriveDlg.ShowModal=IDOK) then
              begin
                   //Show CopyFileDlg
                   CopyFileDlg.Show ;
                   //Copy System Information
                   CopySystemSJ ;
                   //Copy USER file
                   Dbs.TableDWGC.Filtered := FALSE ;
                   Dbs.TableDWGC.Filter := 'XMTID='+IntToStr(XMTID)+
                                           ' AND FXGCID='+IntToStr(FXGCID) ;
                   Dbs.TableDWGC.Filtered := TRUE ;
                   TT.Close ;
                   TT.TableName := 'TEMP' ;
                   TT.BatchMove (Dbs.TableDWGC,batCopy) ;
                   Dbs.TableDWGC.Filtered := FALSE ;
                   Dbs.TableDWGC.Filter := '' ;
                   TT.Open ;
                   TT.First ;
                   while (TRUE) do
                   begin
                        if (TT.EOF) then
                           break ;
                        if (CheckFile(TT.FieldByName('FNAME').AsString)=TRUE) then
                        begin
                             FName := TT.FieldByName('FNAME').AsString+'.DB' ;
                             CopyFileDlg.f1 := Dbs.UserDatabase.Directory+FName ;
                             CopyFileDlg.f2 := SDriveDlg.directory+FName ;
                             CopyFileDlg.Repaint ;
                        end ;
                        TT.Next ;
                   end ;
                   TT.Close ;
                   TT.DeleteTable ;
                   //Hide CopyFileDlg
                   CopyFileDlg.Hide ;
              end ;
         end ;
     2 :
         begin
              if (SDriveDlg.ShowModal=IDOK) then
              begin
                   if (CheckFile(DWGCFNAME)=TRUE) then
                   begin
                        //Show CopyFileDlg
                        CopyFileDlg.Show ;
                        //Copy System Information
                        CopySystemSJ ;
                        //Copy User File
                        FName := DWGCFNAME+'.DB' ;
                        CopyFileDlg.f1 := Dbs.UserDatabase.Directory+FName ;
                        CopyFileDlg.f2 := SDriveDlg.directory+FName ;
                        CopyFileDlg.Repaint ;
                        //Hide CopyFileDlg
                        CopyFileDlg.Hide ;
                   end ;
              end ;
         end ;
     end ;
     if (TT.Active=TRUE) then TT.Close ;
     if (T1.Active=TRUE) then T1.Close ;
     TT.Free ;
     T1.Free ;
end;

procedure TManPrjDlg.BitBtn7Click(Sender: TObject);
begin
     if (XMTTreeView.Selected<>Nil) then
     begin
          case XMTTreeView.Selected.Level of
          0 :
              begin
                   SLevel := 0 ;
                   SId1 := XMTID ;
                   SID2 := -1 ;
                   SID3 := -1 ;
              end ;
          1 :
              begin
                   SLevel := 1 ;
                   SId1 := XMTID ;
                   SID2 := FXGCID ;
                   SID3 := -1 ;
              end ;
          2 :
              begin
                   SLevel := 2 ;
                   SId1 := XMTID ;
                   SID2 := FXGCID ;
                   SID3 := DWGCID ;
              end ;
          end ;
     end ;
     if (SDriveDlg.ShowModal=IDOK) then
     begin
          ShowTreeDlg.directory := SDriveDlg.directory ;
          ShowTreeDlg.ShowModal ;
          InitXmtTree ;
     end ;
end;

procedure TManPrjDlg.BitBtn8Click(Sender: TObject);
begin
     ModalResult := IDOK ;
end;

procedure TManPrjDlg.BitBtn9Click(Sender: TObject);
begin
     ModalResult := IDCANCEL ;
end;

procedure TManPrjDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_ESCAPE) then
     begin
          DisplaySJ ;
          ShowBitBtn ;
     end ;
end;

procedure TManPrjDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
     //this is a international command "CLEAR"
     if (Key=#13) then
     begin
          if (UpperCase(scommand)='CLEAR') then
          begin
               if (Application.MessageBox('将要删除所有数据及单位工程文件！继续码？',
                                          PChar(AppName),
                                          MB_OKCANCEL or MB_ICONQUESTION)=IDCANCEL) then
               begin
                    exit ;
               end else
               begin
                    Dbs.ClearAllXmtSJ ;
                    ClearSJ ;
                    InitXmtTree ;
                    DisplaySJ ;
                    ShowPanel ;
                    ShowBitBtn ;
               end ;
          end ;
          scommand := '' ;
          Key := #0 ;
          exit ;
     end ;
     scommand := scommand+Key ;
end;

procedure TManPrjDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MainForm.OnKeyUp (MainForm, Key, Shift) ;
end;


end.

