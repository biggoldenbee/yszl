unit SFL;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Grids, DBGrids, Db, DBTables, DBCtrls, DECZ;

type
  TSFLDlg = class(TForm)
    Bevel1: TBevel;
    FEEGROUP: TTable;
    FEEGROUPID: TSmallintField;
    FEEGROUPBH: TStringField;
    FEEGROUPMC: TStringField;
    TableFEE: TTable;
    DataSourceFEE: TDataSource;
    DBGridFEE: TDBGrid;
    TableFEENO: TSmallintField;
    TableFEENAME: TStringField;
    TableFEECALC: TStringField;
    TableFEECALC_SCRPT: TStringField;
    BitBtn7: TBitBtn;
    DataSourceFEEGROUP: TDataSource;
    DBGridFEEGROUP: TDBGrid;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;

    procedure ReWriteFee ;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FEEGROUPAfterScroll(DataSet: TDataSet);
    procedure DBGridFEEGROUPDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SQLCommand : string ;
  end;

var
  SFLDlg: TSFLDlg;

implementation

uses main, YSZLDBS, COPYFEE;

{$R *.DFM}

procedure TSFLDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FEEGROUP.Filter := '' ;
     FEEGROUP.Filtered := FALSE ;
     FEEGROUP.Close ;
     TableFEE.Close ;
end;

procedure TSFLDlg.FormShow(Sender: TObject);
begin
     FEEGROUP.Close ;
     TableFEE.Close ;
     FEEGROUP.Filter := 'ID='+IntToStr(Self.Tag) ;
     FEEGROUP.Filtered := TRUE ;
     FEEGROUP.Open ;
     FEEGROUP.First ;
end;

procedure TSFLDlg.BitBtn1Click(Sender: TObject);
var
   id : integer ;
   f : string ;
begin
     if (FEEGROUP.Active=FALSE) then exit ;
     FEEGROUP.Last ;
     id := FEEGROUP.FieldByName('ID').AsInteger ;
     f := FEEGROUP.FieldByName('BH').AsString ;
     f[length(f)] := char(succ(f[length(f)])) ;
     TableFEE.Close ;
     TableFEE.TableName := f ;
     TableFEE.CreateTable ;
     FEEGROUP.AppendRecord( [id, f, '自定义费率表'] ) ;
end;

procedure TSFLDlg.BitBtn2Click(Sender: TObject);
begin
     TableFEE.Close ;
     COPYFEEDlg.Tag := Self.Tag ;
     COPYFEEDlg.ShowModal ;
     FEEGROUP.AfterScroll(FEEGROUP) ;
end;

procedure TSFLDlg.BitBtn3Click(Sender: TObject);
begin
     if (FEEGROUP.Active=FALSE) then exit ;
     if (Application.MessageBox( '真的删除该子目吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     TableFEE.Close ;
     TableFEE.DeleteTable ;
     FEEGROUP.Delete ;
end;

procedure TSFLDlg.BitBtn4Click(Sender: TObject);
var
   i : integer ;
   BookMark : TBookMark ;
begin
     if (TableFEE.Active=FALSE) then exit ;
     TableFEE.InsertRecord( [0, nil, nil, nil] ) ;
     BookMark := TableFEE.GetBookmark ;
     TableFEE.DisableControls ;
     TableFEE.First ;
     i := 0 ;
     while (TRUE) do
     begin
          if (TableFEE.EOF) then
             break ;
          inc(i) ;
          TableFEE.Edit ;
          TableFEE.FieldByName('NO').AsInteger := i ;
          TableFEE.Post ;
          TableFEE.Next ;
     end ;
     TableFEE.GotoBookmark( BookMark ) ;
     TableFEE.FreeBookmark( BookMark ) ;
     TableFEE.EnableControls ;
end;

procedure TSFLDlg.BitBtn5Click(Sender: TObject);
var
   BookMark : TBookMark ;
   i : integer ;
begin
     if (TableFEE.Active=FALSE) then exit ;
     if (Application.MessageBox( '真的删除该子目吗?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
        exit ;
     TableFEE.Delete ;
     BookMark := TableFEE.GetBookmark ;
     TableFEE.DisableControls ;
     TableFEE.First ;
     i := 0 ;
     while (TRUE) do
     begin
          if (TableFEE.EOF) then
             break ;
          inc(i) ;
          TableFEE.Edit ;
          TableFEE.FieldByName('NO').AsInteger := i ;
          TableFEE.Post ;
          TableFEE.Next ;
     end ;
     TableFEE.GotoBookmark( BookMark ) ;
     TableFEE.FreeBookmark( BookMark ) ;
     TableFEE.EnableControls ;
end;

procedure TSFLDlg.BitBtn6Click(Sender: TObject);
begin
     with Dbs do
     begin
          QueryUSER.Close ;
          QueryUSER.SQL.Clear ;
          SQLCommand := 'DELETE FROM "'+PrjHead.FileName+'" WHERE ID="P$$" AND WLP="FL"' ;
          QueryUSER.SQL.Add (SQLcommand) ;
          QueryUSER.ExecSQL ;
          QueryUSER.Close ;
          TableUSER.Refresh ;
          TableUSER.First ;
          TableUSER.InsertRecord ([FALSE, 'P$$', 2, 'FL', 0, '', '1']) ;
          TableUSER.Edit ;
          TableUSER.FieldByName('XH').AsString   := '' ;
          TableUSER.FieldByName('CODE').AsString := '费率表' ;
          TableUSER.FieldByName('NAME').AsString := FEEGROUP.FieldByName('MC').AsString ;
          TableUSER.FieldByName('BZ').AsString   := FEEGROUP.FieldByName('BH').AsString ;
          TableUSER.Post ;
          TableUSER.Next ;
          TableFEE.First ;
          while (TRUE) do
          begin
               if (TableFEE.EOF) then
                  break ;

               TableUSER.InsertRecord ([FALSE, 'P$$', 2, 'FL', 0, '', '1']) ;
               TableUSER.Edit ;
               TableUSER.FieldByName('XH').AsInteger  := TableFEE.FieldByName('NO').AsInteger ;
               TableUSER.FieldByName('CODE').AsString := TableFEE.FieldByName('NAME').AsString ;
               TableUSER.FieldByName('GS').AsString   := TableFEE.FieldByName('CALC').AsString ;
               TableUSER.FieldByName('BZ').AsString   := TableFEE.FieldByName('CALC_SCRPT').AsString ;
               TableUSER.Post ;
               TableUSER.Next ;

               TableFEE.Next ;
          end ;
          TableFEE.First ;
     end ;
end;

procedure TSFLDlg.BitBtn7Click(Sender: TObject);
begin
     Self.Close ;
end;

procedure TSFLDlg.FEEGROUPAfterScroll(DataSet: TDataSet);
begin
     TableFEE.Close ;
     TableFEE.TableName := FEEGROUP.FieldByName('BH').AsString ;
     TableFEE.Open ;
end;

procedure TSFLDlg.ReWriteFee ;
var
   i: integer ;
   s0, s1 : string ;
begin
     FEEGROUP.Filtered := FALSE ;
     FEEGROUP.First ;
     while (TRUE) do
     begin
          if (FEEGROUP.EOF) then
             break ;
          if (TableFEE.Active) then
          begin
               TableFEE.First ;
               while (TRUE) do
               begin
                    if (TableFEE.EOF) then
                       break ;
                    s0 := TableFEE.FieldByName('CALC').AsString ;
                    s1 := '' ;
                    for i:=1 to length(s0) do
                    begin
                         if (s0[i]<>'$') then
                         begin
                              s1 := s1+s0[i] ;
                         end ;
                    end ;
                    TableFEE.Edit ;
                    TableFEE.FieldByName('CALC').AsString := s1;
                    TableFEE.Post ;
                    TableFEE.Next ;
               end ;
          end ;
          FEEGROUP.Next ;
     end ;
     FEEGROUP.Filtered := TRUE ;
     FEEGROUP.First ;
end;

procedure TSFLDlg.DBGridFEEGROUPDblClick(Sender: TObject);
begin
     ReWriteFEE ;
end;

end.
