unit ZZJ;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Spin, Db, DBTables, Grids, DBGrids;

type
  TZZJDlg = class(TForm)
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    ListBox1: TListBox;
    TableZZJ: TTable;
    TableZZJBH: TStringField;
    TableZZJJJ: TFloatField;
    TableZZJYF: TFloatField;
    TableZZJSH: TFloatField;
    TableZZJDJ: TFloatField;
    DataSourceZZJ: TDataSource;
    DBGridZZJ: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel1: TBevel;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    ZZJTEMP: TTable;
    ZZJTEMPBH: TStringField;
    ZZJTEMPMC: TStringField;
    ZZJTEMPDW: TStringField;
    ZZJTEMPDJ: TFloatField;
    QueryKEY: TQuery;
    ZZJTEMPP: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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
  ZZJDlg: TZZJDlg;

implementation
uses main, YSZLDBS, Price ;
{$R *.DFM}

procedure TZZJDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TableZZJ.Close ;
     QueryKEY.Close ;
     ZZJTEMP.Close ;
     ListBox1.Items.Clear ;
end;

procedure TZZJDlg.FormShow(Sender: TObject);
var
   i : integer ;
begin
     ListBox1.Items.Clear ;
     Session.GetTableNames('ZZJ', '??????.*', True, False, ListBox1.Items);
     TableZZJ.Close ;
     QueryKEY.Close ;
     ZZJTEMP.Close ;
end;

procedure TZZJDlg.BitBtn1Click(Sender: TObject);
begin
     Label4.Caption := '' ;
     if (TableZZJ.Active) then
        TableZZJ.Close ;
     if (ListBox1.ItemIndex>=0) then
     begin
          TableZZJ.TableName := ListBox1.Items[ListBox1.ItemIndex] ;
          TableZZJ.Open ;
          Label4.Caption := TableZZJ.TableName ;
     end ;
end;

procedure TZZJDlg.BitBtn2Click(Sender: TObject);
begin
     TableZZJ.Close ;
     Label4.Caption := '' ;
end;

procedure TZZJDlg.BitBtn3Click(Sender: TObject);
var
   BH : string[16] ;
   fName : string ;
   fdl1,fdl2 : double ;
   i : integer ;
   n : integer ;
   dj: double ;
   SQLCommand : string ;
   BookMark : TBookMark ;
begin
     if (ListBox1.SelCount=0) then
     begin
          Application.MessageBox( '请选择中准价文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     TableZZJ.DisableControls ;
     with Dbs do
     begin
          fdl1 := SpinEdit1.Value ;
          fdl2 := SpinEdit2.Value ;

          BookMark := TableUSER.GetBookmark ;

          TableUSER.First ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;

               if ((TableUSER.FieldByName('NUM').AsInteger=2)and
                   (TableUSER.FieldByName('WLP').AsString='FCL'))then
               begin
                    SQLCommand := 'SELECT * FROM "KEY" ' ;
                    SQLCommand := SQLcommand+'WHERE ID='+TableUSER.FieldByName('DEID').AsString+' AND ' ;
                    SQLCommand := SQLcommand+'CODE="'+TableUSER.FieldByName('CODE').AsString+'"' ;

                    QueryKEY.Close ;
                    QueryKEY.SQL.clear ;
                    QueryKEY.SQL.Add (SQLCommand) ;
                    QueryKEY.Open ;
                    if (QueryKEY.RecordCount>0) then
                    begin
                         ZZJTEMP.Close ;
                         ZZJTEMP.TableName := 'TEMP' ;
                         ZZJTEMP.CreateTable ;
                         ZZJTEMP.Open ; 
                         QueryKEY.First ;
                         while (TRUE) do
                         begin
                              if (QueryKEY.EOF) then
                                 break ;
                              ZZJTEMP.AppendRecord([ QueryKEY.FieldByName('BH').AsString,
                                                     QueryKEY.FieldByName('MC').AsString,
                                                     QueryKEY.FieldByName('DW').AsString,
                                                     0.0,
                                                     QueryKEY.FieldByName('P').AsFloat ]) ;
                              QueryKEY.Next ;
                         end ;
                         ZZJTEMP.First ;

                         while (TRUE) do
                         begin
                              if (ZZJTEMP.EOF) then
                                 break ;

                              dj:= 0.0 ;
                              n := 0 ;
                              for i:=0 to ListBox1.Items.Count-1 do
                              begin
                                   if (ListBox1.Selected[i]) then
                                   begin
                                        fName := ListBox1.Items[i] ;
                                        SQLCommand := 'SELECT * FROM '+'"'+Fname+'"'+
                                                      ' WHERE BH='+'"'+ZZJTEMP.FieldByName('BH').AsString+'"' ;
                                        QueryKey.close ;
                                        QueryKey.SQL.clear ;
                                        QueryKey.SQL.Add (SQLCommand) ;
                                        QueryKey.Open ;

                                        dj := dj+QueryKey.FieldByName('JJ').AsFloat*(1+fdl1/100) ;
                                        if (CheckBox1.Checked) then
                                           dj := dj+QueryKey.FieldByName('YF').AsFloat ;
                                        if (CheckBox1.Checked) then
                                           dj := dj+QueryKey.FieldByName('SH').AsFloat ;
                                        n := n+1 ;
                                   end ;
                              end ;
                              dj := dj/n ;
                              ZZJTEMP.Edit ;
                              ZZJTEMP.FieldByName('DJ').AsFloat := dj*(1+fdl2/100) ;
                              ZZJTEMP.Post ;

                              ZZJTEMP.Next ;
                         end ;
                         ZZJTEMP.First ;

                         if (PriceDlg.ShowModal=IDOK) then
                         begin
                              TableUSER.Edit ;
                              TableUSER.FieldByName('NAME').AsString := ZZJTEMP.FieldByName('MC').AsString ; 
                              TableUSER.FieldByName('LABFEE').AsFloat:= ZZJTEMP.FieldByName('DJ').AsFloat*
                                                                        ZZJTEMP.FieldByName('P').AsFloat ; 
                              TableUSER.Post ;
                         end ;

                         ZZJTEMP.Close ;
                         ZZJTEMP.DeleteTable ;
                    end ;
               end ;

               TableUSER.Next ;
          end ;

          TableUSER.GotoBookMark( BookMark ) ;
          TableUSER.FreeBookMark( BookMark ) ;

          QueryKEY.Close ;
     end ;
     TableZZJ.EnableControls ;
end;

procedure TZZJDlg.BitBtn4Click(Sender: TObject);
begin
     Self.Close ;
end;


end.

