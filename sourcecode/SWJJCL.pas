unit SWJJCL;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, DB, DBTables, Grids, DBGrids, SysUtils, ExtCtrls;

type
  TSWJJCLDlg = class(TForm)
    QueryWJJCL: TQuery;
    DataSourceWJJCL: TDataSource;
    Bevel1: TBevel;
    EditBH: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditMC: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridWJJCL: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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
    CODE : string[16] ;
  end;

var
  SWJJCLDlg: TSWJJCLDlg;

implementation
{$R *.DFM}

procedure TSWJJCLDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryWJJCL.Close ;
end;

procedure TSWJJCLDlg.FormShow(Sender: TObject);
begin
     CODE := '' ;
     EditBH.Text := '' ;
     EditMC.Text := '' ;
     QueryWJJCL.Close ;
     SQLCommand := 'SELECT * FROM CODE WHERE ID=2 AND LB1="Ö÷²Ä"' ;
     QueryWJJCL.SQL.Clear ;
     QueryWJJCL.SQL.Add (SQLCommand) ;
     QueryWJJCL.Open ;
end;

procedure TSWJJCLDlg.EditBHKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   BookMark : TBookMark ;
begin
     if (Key=VK_RETURN) then
     begin
          if (EditBH.Text='') then
             exit ;
          BookMark := QueryWJJCL.GetBookmark ;
          QueryWJJCL.DisableControls ;
          QueryWJJCL.First ;
          while (TRUE) do
          begin
               if (QueryWJJCL.EOF) then
                  break ;
               if (QueryWJJCL.FieldByName('CODE').AsString=EditBH.Text) then
               begin
                    QueryWJJCL.FreeBookmark (BookMark) ;
                    QueryWJJCL.EnableControls ;
                    exit ;
               end ;
               QueryWJJCL.Next ;
          end ;
          QueryWJJCL.GotoBookmark (BookMark) ;
          QueryWJJCL.FreeBookmark (BookMark) ;
          QueryWJJCL.EnableControls ;
     end ;
end;

procedure TSWJJCLDlg.EditMCKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   BookMark : TBookMark ;
begin
     if (Key=VK_RETURN) then
     begin
          if (EditMC.Text='') then
             exit ;
          BookMark := QueryWJJCL.GetBookmark ;
          QueryWJJCL.DisableControls ;
          if (Pos(EditMC.Text,QueryWJJCL.FieldByName('MC').AsString)=0) then
             QueryWJJCL.First
          else
             QueryWJJCL.Next ;
          while (TRUE) do
          begin
               if (QueryWJJCL.EOF) then
                  break ;
               if (Pos(EditMC.Text,QueryWJJCL.FieldByName('MC').AsString)<>0) then
               begin
                    QueryWJJCL.FreeBookmark (BookMark) ;
                    QueryWJJCL.EnableControls ;
                    exit ;
               end ;
               QueryWJJCL.Next ;
          end ;
          QueryWJJCL.GotoBookmark (BookMark) ;
          QueryWJJCL.FreeBookmark (BookMark) ;
          QueryWJJCL.EnableControls ;
     end ;
end;

procedure TSWJJCLDlg.BitBtn1Click(Sender: TObject);
begin
     CODE := QueryWJJCL.FieldByName('CODE').Value ;
     ModalResult := IDOK ;
end;

procedure TSWJJCLDlg.BitBtn2Click(Sender: TObject);
begin
     CODE := '' ;
     ModalResult := IDCANCEL ;
end;



end.
