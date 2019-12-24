unit STREE;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls, ImgList;

type
  TSTreeViewDlg = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    STreeView: TTreeView;
    ImageList: TImageList;
    procedure InitSTree ;
    procedure FormShow(Sender: TObject);
    procedure STreeViewExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    ExpandLevel : integer ;
    sid1, sid2, sid3 : integer ;
  end;

var
  STreeViewDlg: TSTreeViewDlg;

implementation

uses main, YSZLDBS;

{$R *.DFM}


procedure TSTreeViewDlg.InitSTree ;
var
   node0 : TTreeNode ;
   node1 : TTreeNode ;
   node2 : TTreeNode ;
begin
     //initialize STreeView
     STreeView.Items.Clear ;
     STreeView.Selected := Nil ;
     with Dbs do
     begin
          if (TableXMT.Active=FALSE) then TableXMT.Open ;
          TableXMT.First ;
          while (TRUE) do
          begin

               if (TableXMT.EOF) then
                  break ;
               //Add level 0
               node0 := STreeView.Items.AddChild (nil, TableXMTXMTMC.Value) ;
               node0.ImageIndex := 0 ;
               node0.SelectedIndex := 0 ;
               node0.StateIndex := -1-TableXMTXMTID.Value ;
               //Add level 1
               TableFXGC.Filtered := FALSE ;
               TableFXGC.Filter := 'XMTID='+TableXMTXMTID.AsString ;
               TableFXGC.Filtered := TRUE ;
               while (TRUE) do
               begin
                    if (TableFXGC.EOF) then
                       break ;
                    node1 := STreeView.Items.AddChild (node0, TableFXGCGCMC.Value) ;
                    node1.ImageIndex := 1 ;
                    node1.SelectedIndex := 1 ;
                    node1.StateIndex := -1-TableFXGCFXGCID.Value ;

                    TableDWGC.Filtered := FALSE ;
                    TableDWGC.Filter := 'XMTID='+TableFXGCXMTID.AsString+
                                        ' AND FXGCID='+TableFXGCFXGCID.AsString ;
                    TableDWGC.Filtered := TRUE ;
                    while (TRUE) do
                    begin
                         if (TableDWGC.EOF) then
                            break ;
                         //Add level 2
                         node2 := STreeView.Items.AddChild (node1, TableDWGCGCMC.Value) ;
                         node2.ImageIndex := 2 ;
                         node2.SelectedIndex := 2 ;
                         node2.StateIndex := -1-TableDWGCDWGCID.Value ;

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
end ;

procedure TSTreeViewDlg.FormShow(Sender: TObject);
begin
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

procedure TSTreeViewDlg.STreeViewExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
     if (Node.Level>=ExpandLevel) then AllowExpansion:=FALSE ;
end;

procedure TSTreeViewDlg.BitBtn1Click(Sender: TObject);
begin
     if (STreeView.Selected.Level<>ExpandLevel) then
     begin
          case ExpandLevel of
          0 :  Application.Messagebox( '对不起，您要选择一个项目体名称！',
                                       PChar(AppName),
                                       MB_OK or MB_ICONSTOP) ;
          1 :  Application.Messagebox( '对不起，您要选择一个分项工程！',
                                       PChar(AppName),
                                       MB_OK or MB_ICONSTOP) ;
          2 :  Application.Messagebox( '对不起，您要选择一个单位工程！',
                                       PChar(AppName),
                                       MB_OK or MB_ICONSTOP) ;
          end ;
          exit ;
     end ;
     sid1 := -1 ;
     sid2 := -1 ;
     sid3 := -1 ;
     case STreeView.Selected.Level of
     0 :
          begin
               sid1 := -1-STreeView.Selected.StateIndex ;
          end ;
     1 :
          begin
               sid1 := -1-STreeView.Selected.Parent.StateIndex ;
               sid2 := -1-STreeView.Selected.StateIndex ;
          end ;
     2 :
          begin
               sid1 := -1-STreeView.Selected.Parent.Parent.StateIndex ;
               sid2 := -1-STreeView.Selected.Parent.StateIndex ;
               sid3 := -1-STreeView.Selected.StateIndex ;
          end ;
     end ;
     ModalResult := IDOK ;
end;

procedure TSTreeViewDlg.BitBtn2Click(Sender: TObject);
begin
     ModalResult := IDCANCEL ;
end;

procedure TSTreeViewDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MainForm.OnKeyUp (MainForm, Key, Shift) ;
end;

end.
