unit Smmxx;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, DB, DBTables, Grids, DBGrids, SysUtils, ExtCtrls;

type
  TSMMXXDlg = class(TForm)
    DBGridXMXX: TDBGrid;
    QueryMMXX: TQuery;
    DataSourceMMXX: TDataSource;
    DBGrid1MMCL: TDBGrid;
    Bevel1: TBevel;
    EditBH: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditMC: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSourceMM: TDataSource;
    QueryMM: TQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure QueryMMAfterScroll(DataSet: TDataSet);
    procedure EditBHKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EditMCKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    SQLCommand : string ;
    BH : string[16] ;
    MC : string[100] ;
    DW : string[16] ;
    BS : smallint ;
    DEJ: double ;
  end;

var
  SMMXXDlg: TSMMXXDlg;

implementation
{$R *.DFM}

procedure TSMMXXDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryMM.Close ;
     QueryMMXX.Close ;
end;

procedure TSMMXXDlg.FormShow(Sender: TObject);
begin
     BH := '' ;
     MC := '' ;
     DW := '' ;
     DEJ:= 0.0 ;
     BS := -1 ;
     EditBH.Text := '' ;
     EditMC.Text := '' ;
     QueryMMXX.Close ;
     QueryMM.Close ;
     SQLCommand := 'SELECT * FROM CLLB WHERE ID="-"' ;
     QueryMM.SQL.Clear ;
     QueryMM.SQL.Add (SQLCommand) ;
     QueryMM.Open ;
     QueryMM.First ;
     QueryMMAfterScroll(QueryMM);
end;

procedure TSMMXXDlg.QueryMMAfterScroll(DataSet: TDataSet);
begin
     SQLCommand := 'SELECT * FROM CODE WHERE ID=4 AND FL="-" AND FLCODE="'+QueryMM.FieldByName('CODE').AsString+'"' ;
     QueryMMXX.Close ;
     QueryMMXX.SQL.Clear ;
     QueryMMXX.SQL.Add (SQLCommand) ;
     QueryMMXX.Open ;
end;

procedure TSMMXXDlg.EditBHKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   BookMark : TBookMark ;
begin
     if (Key=VK_RETURN) then
     begin
          if (EditBH.Text='') then
             exit ;
          BookMark := QueryMM.GetBookmark ;
          QueryMM.AfterScroll := Nil ;
          QueryMM.DisableControls ;
          QueryMMXX.DisableControls ;
          QueryMM.First ;
          while (TRUE) do
          begin
               if (QueryMM.EOF) then
                  break ;
               if (QueryMM.FieldByName('CODE').AsString=EditBH.Text) then
               begin
                    QueryMM.FreeBookmark (BookMark) ;
                    QueryMM.EnableControls ;
                    QueryMMXX.EnableControls ;
                    QueryMM.AfterScroll := QueryMMAfterScroll ;
                    QueryMMAfterScroll (QueryMM) ;
                    exit ;
               end ;
               QueryMM.Next ;
          end ;
          QueryMM.GotoBookmark (BookMark) ;
          QueryMM.FreeBookmark (BookMark) ;
          QueryMM.EnableControls ;
          QueryMMXX.EnableControls ;
          QueryMM.AfterScroll := QueryMMAfterScroll ;
          QueryMMAfterScroll (QueryMM) ;
     end ;
end;

procedure TSMMXXDlg.EditMCKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   BookMark : TBookMark ;
begin
     if (Key=VK_RETURN) then
     begin
          if (EditMC.Text='') then
             exit ;
          BookMark := QueryMM.GetBookmark ;
          QueryMM.AfterScroll := Nil ;
          QueryMM.DisableControls ;
          QueryMMXX.DisableControls ;
          if (Pos(EditMC.Text,QueryMM.FieldByName('MC').AsString)=0) then
             QueryMM.First
          else
             QueryMM.Next ;
          while (TRUE) do
          begin
               if (QueryMM.EOF) then
                  break ;
               if (Pos(EditMC.Text,QueryMM.FieldByName('MC').AsString)<>0) then
               begin
                    QueryMM.FreeBookmark (BookMark) ;
                    QueryMM.EnableControls ;
                    QueryMMXX.EnableControls ;
                    QueryMM.AfterScroll := QueryMMAfterScroll ;
                    QueryMMAfterScroll (QueryMM) ;
                    exit ;
               end ;
               QueryMM.Next ;
          end ;
          QueryMM.GotoBookmark (BookMark) ;
          QueryMM.FreeBookmark (BookMark) ;
          QueryMM.EnableControls ;
          QueryMMXX.EnableControls ;
          QueryMM.AfterScroll := QueryMMAfterScroll ;
          QueryMMAfterScroll (QueryMM) ;
     end ;
end;

procedure TSMMXXDlg.BitBtn1Click(Sender: TObject);
begin
     BH := QueryMMXX.FieldByName('CODE').Value ;
     MC := QueryMMXX.FieldByName('MC').Value ;
     DW := QueryMMXX.FieldByName('DW').Value ;
     DEJ:= QueryMMXX.FieldByName('DEJ').Value ;
     BS := QueryMMXX.FieldByName('BS').Value ;
     ModalResult := IDOK ;
end;

procedure TSMMXXDlg.BitBtn2Click(Sender: TObject);
begin
     BH := '' ;
     MC := '' ;
     DW := '' ;
     DEJ:= 0.0 ;
     BS := -1 ;
     ModalResult := IDCANCEL ;
end;


end.
