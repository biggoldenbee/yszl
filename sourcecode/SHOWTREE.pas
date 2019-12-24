unit SHOWTREE;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls, Db, DBTables, ImgList;

type
  TShowTreeDlg = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    STreeView: TTreeView;
    ImageList: TImageList;
    TXMT: TTable;
    TXMTXMTID: TSmallintField;
    TXMTXMTMC: TStringField;
    TXMTJSDW: TStringField;
    TXMTGCDD: TStringField;
    TXMTXMJL: TStringField;
    TXMTLXRQ: TDateField;
    TFXGC: TTable;
    TFXGCXMTID: TSmallintField;
    TFXGCFXGCID: TSmallintField;
    TFXGCGCMC: TStringField;
    TFXGCDWA: TStringField;
    TFXGCDWB: TStringField;
    TFXGCDWC: TStringField;
    TFXGCJGLX: TStringField;
    TFXGCJCXS: TStringField;
    TFXGCJZTZ: TStringField;
    TFXGCGCLB: TStringField;
    TFXGCJZMJ: TFloatField;
    TFXGCGCZJ: TFloatField;
    TFXGCSCG: TFloatField;
    TFXGCBZCG: TFloatField;
    TFXGCPMZJ: TFloatField;
    TFXGCYG: TFloatField;
    TFXGCBZR: TStringField;
    TFXGCJHR: TStringField;
    TFXGCSHR: TStringField;
    TFXGCBZRQ: TDateField;
    TDWGC: TTable;
    TDWGCXMTID: TSmallintField;
    TDWGCFXGCID: TSmallintField;
    TDWGCDWGCID: TSmallintField;
    TDWGCGCMC: TStringField;
    TDWGCZYLBID: TSmallintField;
    TDWGCZYLB: TStringField;
    TDWGCBZR: TStringField;
    TDWGCBZRQ: TDateField;
    TDWGCFNAME: TStringField;
    TUSER: TTable;
    TUSERID: TStringField;
    TUSERNUM: TSmallintField;
    TUSERWLP: TStringField;
    TUSERCODE: TStringField;
    TUSERATTRIB: TStringField;
    TUSERNAME: TStringField;
    TUSERUNIT: TStringField;
    TUSERQUANTITY: TFloatField;
    TUSERPRICE: TFloatField;
    TUSERLABFEE: TFloatField;
    TUSERLPD: TFloatField;
    TUSERMTRLFEE: TFloatField;
    TUSERMCHNFEE: TFloatField;
    TUSERCOUNT: TFloatField;
    TUSERLABCOUNT: TFloatField;
    TUSERLPDCOUNT: TFloatField;
    TUSERMTRCOUNT: TFloatField;
    TUSERMCHCOUNT: TFloatField;
    TUSERZCC: TFloatField;
    TUSERLABBC: TFloatField;
    TUSERLPDBC: TFloatField;
    TUSERMTRBC: TFloatField;
    TUSERMCHBC: TFloatField;
    TUSERP1: TFloatField;
    TUSERP2: TFloatField;
    TUSERP3: TFloatField;
    TUSERP4: TFloatField;
    TUSERP5: TFloatField;
    TUSERSPRICE: TFloatField;
    TUSERSLABFEE: TFloatField;
    TUSERSLPD: TFloatField;
    TUSERSMTRLFEE: TFloatField;
    TUSERSMCHNFEE: TFloatField;
    TUSERSCOUNT: TFloatField;
    TUSERSLABCOUNT: TFloatField;
    TUSERSLPDCOUNT: TFloatField;
    TUSERSMTRCOUNT: TFloatField;
    TUSERSMCHCOUNT: TFloatField;
    TUSERSZCC: TFloatField;
    TUSERSLABBC: TFloatField;
    TUSERSLPDBC: TFloatField;
    TUSERSMTRBC: TFloatField;
    TUSERSMCHBC: TFloatField;
    TUSERSP1: TFloatField;
    TUSERSP2: TFloatField;
    TUSERSP3: TFloatField;
    TUSERSP4: TFloatField;
    TUSERSP5: TFloatField;
    TUSERBZ: TStringField;
    TUSERFLAG: TBooleanField;
    procedure ClearSJ ;
    procedure GetSJFromDbf ;
    procedure RestoreXMT ;
    procedure RestoreFXGC ;
    procedure RestoreDWGC ;
    procedure InitSTree ;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure STreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure BitBtn1Click(Sender: TObject);
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
    //backup file directory
    directory : string ;
  end;

var
  ShowTreeDlg: TShowTreeDlg;

implementation

uses main, YSZLDBS, COPYDLG;

{$R *.DFM}

procedure TShowTreeDlg.ClearSJ ;
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

procedure TShowTreeDlg.GetSJFromDbf ;
var
   id1, id2, id3 : integer ;
   Node : TTreeNode ;
begin
     TFXGC.Filtered := FALSE ;
     TFXGC.Filter := '' ;
     TDWGC.Filtered := FALSE ;
     TDWGC.Filter := '' ;
     if (STreeView.Selected=Nil) then exit ;
     Node := STreeView.Selected ;
     case Node.Level of
     0 :
          begin
               id1 := -1-Node.StateIndex ;
               if (TXMT.FindKey([id1])) then
               begin
                    XMTID     := TXMT.FieldByName('XMTID').AsInteger ;
                    XMTMC     := TXMT.FieldByName('XMTMC').AsString ;
                    XMTJSDW   := TXMT.FieldByName('JSDW').AsString ;
                    XMTGCDD   := TXMT.FieldByName('GCDD').AsString ;
                    XMTXMJL   := TXMT.FieldByName('XMJL').AsString ;
                    XMTLXRQ   := TXMT.FieldByName('LXRQ').AsDateTime
               end ;
          end ;
     1 :
          begin
               id1 := -1-Node.Parent.StateIndex ;
               id2 := -1-Node.StateIndex ;
               if (TXMT.FindKey([id1])) then
               begin
                    XMTID     := TXMT.FieldByName('XMTID').AsInteger ;
                    XMTMC     := TXMT.FieldByName('XMTMC').AsString ;
                    XMTJSDW   := TXMT.FieldByName('JSDW').AsString ;
                    XMTGCDD   := TXMT.FieldByName('GCDD').AsString ;
                    XMTXMJL   := TXMT.FieldByName('XMJL').AsString ;
                    XMTLXRQ   := TXMT.FieldByName('LXRQ').AsDateTime
               end ;
               if (TFXGC.FindKey([id1,id2])) then
               begin
                    FXGCID    := TFXGC.FieldByName('FXGCID').AsInteger ;
                    FXGCMC    := TFXGC.FieldByName('GCMC').AsString ;
                    FXGCDWA   := TFXGC.FieldByName('DWA').AsString ;
                    FXGCDWB   := TFXGC.FieldByName('DWB').AsString ;
                    FXGCDWC   := TFXGC.FieldByName('DWC').AsString ;
                    FXGCJGLX  := TFXGC.FieldByName('JGLX').AsString ;
                    FXGCJCXS  := TFXGC.FieldByName('JCXS').AsString ;
                    FXGCJZTZ  := TFXGC.FieldByName('JZTZ').AsString ;
                    FXGCGCLB  := TFXGC.FieldByName('GCLB').AsString ;
                    FXGCJZMJ  := TFXGC.FieldByName('JZMJ').AsFloat ;
                    FXGCGCZJ  := TFXGC.FieldByName('GCZJ').AsFloat ;
                    FXGCSCG   := TFXGC.FieldByName('SCG').AsFloat ;
                    FXGCBZCG  := TFXGC.FieldByName('BZCG').AsFloat ;
                    FXGCPMZJ  := TFXGC.FieldByName('PMZJ').AsFloat ;
                    FXGCYG    := TFXGC.FieldByName('YG').AsFloat ;
                    FXGCBZR   := TFXGC.FieldByName('BZR').AsString ;
                    FXGCJHR   := TFXGC.FieldByName('JHR').AsString ;
                    FXGCSHR   := TFXGC.FieldByName('SHR').AsString ;
                    FXGCBZRQ  := TFXGC.FieldByName('BZRQ').AsDateTime ;
               end ;
          end ;
     2 :
          begin
               id1 := -1-Node.Parent.Parent.StateIndex ;
               id2 := -1-Node.Parent.StateIndex ;
               id3 := -1-Node.StateIndex ;
               if (TXMT.FindKey([id1])) then
               begin
                    XMTID     := TXMT.FieldByName('XMTID').AsInteger ;
                    XMTMC     := TXMT.FieldByName('XMTMC').AsString ;
                    XMTJSDW   := TXMT.FieldByName('JSDW').AsString ;
                    XMTGCDD   := TXMT.FieldByName('GCDD').AsString ;
                    XMTXMJL   := TXMT.FieldByName('XMJL').AsString ;
                    XMTLXRQ   := TXMT.FieldByName('LXRQ').AsDateTime
               end ;
               if (TFXGC.FindKey([id1,id2])) then
               begin
                    FXGCID    := TFXGC.FieldByName('FXGCID').AsInteger ;
                    FXGCMC    := TFXGC.FieldByName('GCMC').AsString ;
                    FXGCDWA   := TFXGC.FieldByName('DWA').AsString ;
                    FXGCDWB   := TFXGC.FieldByName('DWB').AsString ;
                    FXGCDWC   := TFXGC.FieldByName('DWC').AsString ;
                    FXGCJGLX  := TFXGC.FieldByName('JGLX').AsString ;
                    FXGCJCXS  := TFXGC.FieldByName('JCXS').AsString ;
                    FXGCJZTZ  := TFXGC.FieldByName('JZTZ').AsString ;
                    FXGCGCLB  := TFXGC.FieldByName('GCLB').AsString ;
                    FXGCJZMJ  := TFXGC.FieldByName('JZMJ').AsFloat ;
                    FXGCGCZJ  := TFXGC.FieldByName('GCZJ').AsFloat ;
                    FXGCSCG   := TFXGC.FieldByName('SCG').AsFloat ;
                    FXGCBZCG  := TFXGC.FieldByName('BZCG').AsFloat ;
                    FXGCPMZJ  := TFXGC.FieldByName('PMZJ').AsFloat ;
                    FXGCYG    := TFXGC.FieldByName('YG').AsFloat ;
                    FXGCBZR   := TFXGC.FieldByName('BZR').AsString ;
                    FXGCJHR   := TFXGC.FieldByName('JHR').AsString ;
                    FXGCSHR   := TFXGC.FieldByName('SHR').AsString ;
                    FXGCBZRQ  := TFXGC.FieldByName('BZRQ').AsDateTime ;
               end ;
               if (TDWGC.FindKey([id1,id2,id3])) then
               begin
                    DWGCID    := TDWGC.FieldByName('DWGCID').AsInteger ;
                    DWGCMC    := TDWGC.FieldByName('GCMC').AsString ;
                    DWGCZYLBID:= TDWGC.FieldByName('ZYLBID').AsInteger ;
                    DWGCZYLB  := TDWGC.FieldByName('ZYLB').AsString ;
                    DWGCBZR   := TDWGC.FieldByName('BZR').AsString ;
                    DWGCBZRQ  := TDWGC.FieldByName('BZRQ').AsDateTime ;
                    DWGCFNAME := TDWGC.FieldByName('FNAME').AsString ;
               end ;
          end ;
     end ;
end ;

procedure TShowTreeDlg.InitSTree ;
var
   node0 : TTreeNode ;
   node1 : TTreeNode ;
   node2 : TTreeNode ;
begin
     //initialize STreeView
     STreeView.Items.Clear ;
     STreeView.Selected := Nil ;

     TXMT.TableName := directory+'XMT.DB' ;
     TFXGC.TableName := directory+'FXGC.DB' ;
     TDWGC.TableName := directory+'DWGC.DB' ;

     if (TXMT.Active=FALSE) then TXMT.Open ;
     if (TFXGC.Active=FALSE) then TFXGC.Open ;
     if (TDWGC.Active=FALSE) then TDWGC.Open ;
     TXMT.First ;
     while (TRUE) do
     begin
          if (TXMT.EOF) then
             break ;
          //Add level 0
          node0 := STreeView.Items.AddChild (nil, TXMTXMTMC.Value) ;
          node0.ImageIndex := 0 ;
          node0.SelectedIndex := 0 ;
          node0.StateIndex := -1-TXMTXMTID.Value ;
          //Add level 1
          TFXGC.Filtered := FALSE ;
          TFXGC.Filter := 'XMTID='+TXMTXMTID.AsString ;
          TFXGC.Filtered := TRUE ;
          while (TRUE) do
          begin
               if (TFXGC.EOF) then
                  break ;
               node1 := STreeView.Items.AddChild (node0, TFXGCGCMC.Value) ;
               node1.ImageIndex := 1 ;
               node1.SelectedIndex := 1 ;
               node1.StateIndex := -1-TFXGCFXGCID.Value ;

               TDWGC.Filtered := FALSE ;
               TDWGC.Filter := 'XMTID='+TFXGCXMTID.AsString+' AND FXGCID='+TFXGCFXGCID.AsString ;
               TDWGC.Filtered := TRUE ;
               while (TRUE) do
               begin
                    if (TDWGC.EOF) then
                       break ;
                    //Check DWGC
                    TUSER.Close ;
                    TUSER.TableName := directory+TDWGCFNAME.AsString ;
                    Try
                       TUSER.Open ;
                    except
                          TUSER.Close ;
                    end ;
                    //Add level 2
                    if (TUSER.Active) then
                    begin
                         TUSER.Close ;
                         node2 := STreeView.Items.AddChild (node1, TDWGCGCMC.Value) ;
                         node2.ImageIndex := 2 ;
                         node2.SelectedIndex := 2 ;
                         node2.StateIndex := -1-TDWGCDWGCID.Value ;
                    end ;
                    TDWGC.Next ;
               end ;
               TFXGC.Next ;
          end ;
          TXMT.Next ;
     end ;
     TUSER.Close ;
end ;

procedure TShowTreeDlg.FormShow(Sender: TObject);
begin
     with Dbs do
     begin
          if (TableXMT.Active=FALSE) then TableXMT.Open ;
          if (TableFXGC.Active=FALSE) then TableFXGC.Open ;
          if (TableDWGC.Active=FALSE) then TableDWGC.Open ;
          TableUSER.Close ;
     end ;
     TXMT.Close ;
     TFXGC.Close ;
     TDWGC.Close ;
     TUSER.Close ;
     TXMT.DatabaseName  := '' ;
     TFXGC.DatabaseName := '' ;
     TDWGC.DatabaseName := '' ;
     TUSER.DatabaseName := '' ;
     InitSTree ;
     STreeView.SetFocus ;
     if (STreeView.Items.Count<=0) then
     begin
          Application.MessageBox( '对不起，您现在没有建设项目或其他的工程文件！请先建立新的建设项目或工程文件！',
                                  PChar(AppName),
                                  MB_OK or MB_ICONINFORMATION ) ;
          exit ;
     end ;
     STreeView.Selected := STreeView.Items[0] ;
end;

procedure TShowTreeDlg.RestoreXMT ;
var
   node0, node1 : TTreeNode ;
begin
     node0 := STreeView.Selected ;
     node0.Expand(TRUE) ;
     if (node0.HasChildren) then
     begin
          node1 := node0.GetFirstChild ;
          STreeView.Selected := node1 ;
          RestoreFXGC ;
          while (TRUE) do
          begin
               node1 := node1.GetNextChild (node1) ;
               if (node1=Nil) then
                  break ;
               STreeView.Selected := node1 ;
               RestoreFXGC ;
          end ;
     end ;
     STreeView.Selected := node0 ;
end ;

procedure TShowTreeDlg.RestoreFXGC ;
var
   node1, node2 : TTreeNode ;
begin
     node1 := STreeView.Selected ;
     node1.Expand(TRUE) ;
     if (node1.HasChildren) then
     begin
          node2 := node1.GetFirstChild ;
          STreeView.Selected := node2 ;
          RestoreDWGC ;
          while (TRUE) do
          begin
               node2 := node1.GetNextChild (node2) ;
               if (node2=Nil) then
                  break ;
               STreeView.Selected := node2 ;
               RestoreDWGC ;
          end ;
     end ;
     STreeView.Selected := node1 ;
end ;

procedure TShowTreeDlg.RestoreDWGC ;
var
   FName : string ;
begin
     with DBS do
     begin
          if (not TableXMT.FindKey([XMTID])) then
          begin
               TableXMT.AppendRecord( [XMTID,XMTMC,XMTJSDW,XMTGCDD,XMTXMJL,XMTLXRQ] ) ;
          end ;
          if (not TableFXGC.FindKey([XMTID,FXGCID])) then
          begin
               TableFXGC.AppendRecord( [XMTID,FXGCID] ) ;
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
          if (not TableDWGC.FindKey([XMTID,FXGCID,DWGCID])) then
          begin
               TableDWGC.AppendRecord([XMTID,FXGCID,DWGCID,DWGCMC,
                                       DWGCZYLBID,DWGCZYLB,DWGCBZR,
                                       DWGCBZRQ,DWGCFNAME]) ;
          end ;
          CopyFileDlg.Show ;
          FName := DWGCFNAME+'.DB' ;
          CopyFileDlg.f1 := directory + FName ;
          CopyFileDlg.f2 := USERDatabase.Directory + FName ;
          CopyFileDlg.Repaint ;
          CopyFileDlg.Hide ;
     end ;
end ;

procedure TShowTreeDlg.BitBtn1Click(Sender: TObject);
begin
     case STreeView.Selected.Level of
     0 : RestoreXMT ;
     1 : RestoreFXGC ;
     2 : RestoreDWGC ;
     end ;
end;

procedure TShowTreeDlg.BitBtn2Click(Sender: TObject);
begin
     Self.Close ;
end;

procedure TShowTreeDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     TXMT.Close ;
     TFXGC.Close ;
     TDWGC.Close ;
     TUSER.Close ;
end;

procedure TShowTreeDlg.STreeViewChange(Sender: TObject; Node: TTreeNode);
begin
     ClearSJ ;
     GetSJFromDbf ;
end;

procedure TShowTreeDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MainForm.OnKeyUp (MainForm, Key, Shift) ;
end;

end.
