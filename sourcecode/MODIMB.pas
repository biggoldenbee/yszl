unit MODIMB;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Db, Grids, DBGrids, DBTables, DECZ;

type
  TMODIMBDlg = class(TForm)
    DataSourceDOT: TDataSource;
    DBGridDOT: TDBGrid;
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MODIMBDlg: TMODIMBDlg;

implementation
uses main, YSZLDBS ;
{$R *.DFM}

procedure TMODIMBDlg.FormShow(Sender: TObject);
begin
     Dbs.TableDOT.Close ;
     DbGridDOT.Columns.Clear ;
     ListBox1.Items.Clear ;
     Session.GetTableNames('DOT', '', True, False, ListBox1.Items);
     ShowTable('USER.DB', '', Dbs.TableTEMP, DbGridDOT) ;
     Dbs.TableTEMP.Close ;
end;

procedure TMODIMBDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Dbs.TableDOT.Close ;
     DbGridDOT.Columns.Clear ;
     ListBox1.Items.Clear ;
end;

procedure TMODIMBDlg.BitBtn1Click(Sender: TObject);
begin
     Dbs.TableDOT.Close ;
     Self.Caption := '±à¼­Ä£°å' ;
     if (ListBox1.ItemIndex>-1) then
     begin
          Dbs.TableDOT.TableName := ListBox1.Items[ListBox1.ItemIndex] ;
          Dbs.TableDOT.Open ;
          Self.Caption := '±à¼­Ä£°å'+'['+Dbs.TableDOT.TableName+']' ;
     end ;
end;

procedure TMODIMBDlg.BitBtn2Click(Sender: TObject);
begin
     Dbs.TableDOT.Close ;
     Self.Caption := '±à¼­Ä£°å' ;
end;

procedure TMODIMBDlg.BitBtn3Click(Sender: TObject);
begin
     if (Dbs.TableDOT.Active) then
     begin
          Dbs.TableDOT.InsertRecord ([nil]) ;
     end ;
end;

procedure TMODIMBDlg.BitBtn4Click(Sender: TObject);
begin
     if (Application.MessageBox( 'ÕæµÄÉ¾³ý¸Ã×ÓÄ¸Âð?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONSTOP )=IDCANCEL) then
        exit ;                                 
     if (Dbs.TableDOT.Active) then
     begin
          Dbs.TableDOT.Delete ;
     end ;
end;

procedure TMODIMBDlg.BitBtn5Click(Sender: TObject);
begin
     Self.Close ;
end;

end.
