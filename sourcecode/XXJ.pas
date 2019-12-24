unit XXJ;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Spin, Db, DBTables, Grids, DBGrids, DECZ;

type
  TXXJDlg = class(TForm)
    ListBox1: TListBox;
    TableXXJ: TTable;
    DataSourceZZJ: TDataSource;
    DBGridZZJ: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel1: TBevel;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    TableXXJBH: TStringField;
    TableXXJBS: TStringField;
    TableXXJMC: TStringField;
    TableXXJDW: TStringField;
    TableXXJRGF: TFloatField;
    TableXXJCLF: TFloatField;
    TableXXJJXF: TFloatField;
    TableXXJDJ: TFloatField;
    TableXXJXRGF: TFloatField;
    TableXXJXCLF: TFloatField;
    TableXXJXJXF: TFloatField;
    TableXXJXDJ: TFloatField;
    EditBH: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure EditBHKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  XXJDlg: TXXJDlg;

implementation
uses main, YSZLDBS ;
{$R *.DFM}

procedure TXXJDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TableXXJ.Close ;
     ListBox1.Items.Clear ;
end;

procedure TXXJDlg.FormShow(Sender: TObject);
var
   i : integer ;
begin
     ListBox1.Items.Clear ;
     Session.GetTableNames('XXJ', 'xxj*.*', True, False, ListBox1.Items);
     TableXXJ.Close ;
     EditBH.Visible := TableXXJ.Active ;
end;

procedure TXXJDlg.BitBtn1Click(Sender: TObject);
begin
     Label4.Caption := '' ;
     if (TableXXJ.Active) then
        TableXXJ.Close ;
     if (ListBox1.ItemIndex>=0) then
     begin
          TableXXJ.TableName := ListBox1.Items[ListBox1.ItemIndex] ;
          TableXXJ.Open ;
          Label4.Caption := TableXXJ.TableName ;
     end ;
     EditBH.Visible := TableXXJ.Active ;
end;

procedure TXXJDlg.BitBtn2Click(Sender: TObject);
begin
     TableXXJ.Close ;
     Label4.Caption := '' ;
     EditBH.Visible := TableXXJ.Active ;
end;

procedure TXXJDlg.BitBtn3Click(Sender: TObject);
var
   dj: double ;
   SQLCommand : string ;
   BookMark : TBookMark ;
begin
     if (ListBox1.SelCount=0) then
     begin
          Application.MessageBox( '请选择现行价文件!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     TableXXJ.Close ;
     TableXXJ.DisableControls ;
     TableXXJ.TableName := ListBox1.Items[ListBox1.ItemIndex] ;
     TableXXJ.Open ;
     with Dbs do
     begin

          BookMark := TableUSER.GetBookmark ;

          case Self.Tag of
          0 :
               begin
                    TableUSER.First ;
                    while (TRUE) do
                    begin
                         if (TableUSER.EOF) then
                            break ;

                         if ( (TableUSER.FieldByName('ID').AsString='DEZM')and
                              (TableUSER.FieldByName('DEID').AsInteger=6)or
                              (TableUSER.FieldByName('DEID').AsInteger=7) ) then
                         begin
                              if (TableUSER.FieldByName('BS').AsString='') then
                              begin
                                   if (TableXXJ.FindKey([TableUSER.FieldByName('CODE').AsString])) then
                                   begin
                                        TableUSER.Edit ;
                                        TableUSER.FieldByName('SPRICE').AsFloat := TableXXJ.FieldByName('XDJ').AsFloat ;
                                        TableUSER.Post ;
                                   end ;
                              end else if (TableUSER.FieldByName('BS').AsString='换') then
                              begin
                                   dj := 0.0 ;
                                   QueryHS.Close ;
                                   SQLCommand := 'Select * From "'+PrjHead.FileName+'" Where BZ='+'"'+TableUSER.FieldByName('BZ').AsString+'" ' ;
                                   SQLCommand := SQLCommand+'And ATTRIB="0"' ;
                                   QueryHS.SQL.Clear ;
                                   QueryHS.SQL.Add ( SQLCommand ) ;
                                   QueryHS.RequestLive := TRUE ;
                                   QueryHS.Open ;
                                   QueryHS.First ;
                                   while (TRUE) do
                                   begin
                                        if (QueryHS.EOF) then
                                           break ;

                                        if (TableXXJ.FindKey([QueryHS.FieldByName('CODE').AsString])) then
                                        begin
                                             QueryHS.Edit ;
                                             QueryHS.FieldByName('SPRICE').AsFloat := TableXXJ.FieldByName('XDJ').AsFloat ;
                                             QueryHS.Post ;
                                             dj := dj+QueryHS.FieldByName('QUANTITY').AsFloat*QueryHS.FieldByName('SPRICE').AsFloat ;
                                        end ;

                                        QueryHS.Next ;
                                   end ;
                                   QueryHS.Close ;
                                   
                                   TableUSER.Edit ;
                                   TableUSER.FieldByName('SPRICE').AsFloat := dj ;
                                   TableUSER.Post ;
                              end ;
                         end ;
                         TableUSER.Next ;
                    end ;
               end ;
          1 :
               begin
                    TableUSER.First ;
                    while (TRUE) do
                    begin
                         if (TableUSER.EOF) then
                            break ;

                         if (TableUSER.FieldByName('DEID').AsInteger=3) then
                         begin
                              if (TableXXJ.FindKey([TableUSER.FieldByName('CODE').AsString])) then
                              begin
                                   TableUSER.Edit ;
                                   TableUSER.FieldByName('SPRICE').AsFloat := TableXXJ.FieldByName('XDJ').AsFloat ;
                                   TableUSER.Post ;
                              end ;                              
                         end ;

                         TableUSER.Next ;
                    end ;

               end ;
          end ;

          TableUSER.GotoBookMark (BookMark) ;
          TableUSER.FreeBookMark (BookMark) ;
     end ;
     TableXXJ.Close ;
     TableXXJ.EnableControls ;
end;

procedure TXXJDlg.BitBtn4Click(Sender: TObject);
begin
     Self.Close ;
end;

procedure TXXJDlg.EditBHKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_RETURN) then
     begin
          if (TableXXJ.FindKey([EditBH.Text])) then
             TableXXJ.GotoKey ;
     end ;
end;

end.

var
   bh : string[12] ;
   hs : string[10] ;
   XXJFileName : string ;
   i : integer ;
   sl: real ;
   f1:real ;
begin
     SXXJDlg := TSXXJDlg.Create(Self);
     if (SXXJDlg.ShowModal=IDOK) then
     begin
        XXJFileName := SystemDir+'\XXJ\'+SXXJDlg.Edit1.Text ;
        SXXJDlg.Free;
     end else
     begin
          SXXJDlg.Free;
          exit ;
     end ;
     ChDir(FilePath) ;
     TableXXJ.Close ;
     TableXXJ.TableName := XXJFileName ;
     try
        TableXXJ.Open ;
     except
     on EDataBaseError do
        exit ;
     end;
     for i:=0 to 9 do
     begin
          TabSet1.TabIndex := i ;
          QueryUSER.First ;
          while (TRUE) do
          begin
               if (QueryUSER.Eof) then
                  break ;
               if (QueryUSERID.Value='FMC') then
               begin
                    QueryUSER.Next ;
                    continue ;
               end ;
               bh := QueryUSERCODE.Value ;
               hs := QueryUSERWLP.Value ;
               if (TableXXJ.FindKey ([bh])) then
               begin
                    QueryUSER.Edit ;
                    QueryUSERZCC.Value := TableXXJXDJ.Value ;
                    QueryUSER.Post ;
               end else
               begin
                    f1 := 0.0 ;
                    if (hs<>'') then
                    begin
                         QueryHS.close ;
                         QueryHS.SQL.clear ;
                         SQLCommand := 'Select * From '+'"'+FileName+'"'+' Where WLP='+'"'+hs+'"' ;
                         QueryHS.SQL.Add (SQLCommand) ;
                         QueryHS.Open ;
                         QueryHS.First ;
                         QueryHS.Next ;
                         while (TRUE) do
                         begin
                              if (QueryHS.eof) then
                                 break ;
                              bh := QueryHSCODE.Value ;
                              sl := (100.0 + QueryHSP4.Value) / 100.0 ;
                              if (TableXXJ.FindKey ([bh])) then
                              begin
                                   QueryHS.Edit ;
                                   QueryHSZCC.Value := TableXXJXDJ.Value ;
                                   QueryHS.Post ;
                              end ;
                              f1 := f1+sl*QueryHSZCC.Value ;
                              QueryHS.Next ;
                         end ;
                         QueryUSER.Edit ;
                         QueryUSERZCC.Value := f1 ;
                         QueryUSER.Post ;
                    end ;
               end ;

               if (abs(QueryUSERZCC.Value)<0.001) then
               begin
                    QueryUSER.Edit ;
                    QueryUSERZCC.Value := QueryUSERPRICE.Value ;
                    QueryUSER.Post ;
               end ;
               QueryUSER.Next ;
          end ;
     end ;
     for i:=0 to 2 do
     begin
          TabSetJGCL.TabIndex := i ;
          QueryJGCL.First ;
          while (TRUE) do
          begin
               if (QueryJGCL.Eof) then break ;
               bh := QueryJGCLCODE.Value ;
               if (TableXXJ.FindKey ([bh])) then
                  f1 := TableXXJXDJ.Value
               else
                   f1 := QueryJGCLPRICE.Value ;
               QueryJGCL.Edit ;
               QueryJGCLZCC.Value := f1 ;
               QueryJGCL.Post ;
               QueryJGCL.Next ;
          end ;
     end ;
     TableXXJ.Close ;

