unit Jsj;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, DBTables, DB, Grids, DBGrids, DBCtrls, SysUtils;

type
  TJsjDlg = class(TForm)
    Bevel1: TBevel;
    Panel1: TPanel;
    Edit1: TEdit;
    Panel2: TPanel;
    Edit2: TEdit;
    Panel3: TPanel;
    Edit3: TEdit;
    Panel4: TPanel;
    Edit4: TEdit;
    Panel5: TPanel;
    Edit5: TEdit;
    Panel6: TPanel;
    Edit6: TEdit;
    Panel7: TPanel;
    Edit7: TEdit;
    Panel8: TPanel;
    Edit8: TEdit;
    Bevel2: TBevel;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Bevel3: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    TableJSJ: TTable;
    DataSourceJSJ: TDataSource;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    TableJSJBH: TStringField;
    TableJSJP1: TFloatField;
    TableJSJP2: TFloatField;
    TableJSJP3: TFloatField;
    TableJSJP4: TFloatField;
    TableJSJP5: TFloatField;
    TableJSJP6: TFloatField;
    TableJSJBS: TStringField;
    BitBtn1: TBitBtn;
    DBGridJSJ: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Bevel4: TBevel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CalcOneItem ;
    procedure CalcOnePart ;
    procedure CalcAllItem ;
    procedure Edit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    BH : string[16] ;
    MC : string[100] ;
    DW : string[16] ;
    F1, F2, F3, F4, F5 : double ;
    DJ, RGF, RGS, CLF, JXF : double ;
    P1, P2, P3, P4, P5, P6 : double ;
  end;

var
  JsjDlg: TJsjDlg;

implementation
uses main, YSZLDBS ;
{$R *.DFM}

procedure TJsjDlg.SpeedButton1Click(Sender: TObject);
begin
     TableJSJ.Append ;
     TableJSJ.Edit ;
     TableJSJ.FieldByName('BH').AsString := '项目' ;
     TableJSJ.Post ;
end;

procedure TJsjDlg.SpeedButton2Click(Sender: TObject);
begin
     if (TableJSJ.Eof) then
        exit ;
     if (Application.MessageBox( '真的删除该项目吗？',
                                 pChar(AppName),
                                MB_OKCANCEL or MB_ICONQUESTION )=ID_CANCEL) then
        exit ;
     TableJSJ.Delete ;
end;

procedure TJsjDlg.BitBtn1Click(Sender: TObject);
var
   BS : string[3] ;
begin
     P1 := 0.0 ;
     P2 := 0.0 ;
     P3 := 0.0 ;
     P4 := 0.0 ;
     P5 := 0.0 ;
     P6 := 0.0 ;
     BH := '' ;
     MC := '' ;
     DW := '元' ;
     F1 := 0.0 ;
     F2 := 0.0 ;
     F3 := 0.0 ;
     F4 := 0.0 ;
     F5 := 0.0 ;
     CheckBox1.Checked := FALSE ;
     CheckBox2.Checked := FALSE ;
     CheckBox3.Checked := FALSE ;
     BH := TableJSJ.FieldByName('BH').AsString ;
     P1 := TableJSJ.FieldByName('P1').AsFloat ;
     P2 := TableJSJ.FieldByName('P2').AsFloat ;
     P3 := TableJSJ.FieldByName('P3').AsFloat ;
     P4 := TableJSJ.FieldByName('P4').AsFloat ;
     P5 := TableJSJ.FieldByName('P5').AsFloat ;
     P6 := TableJSJ.FieldByName('P6').AsFloat ;
     BS := TableJSJ.FieldByName('BS').AsString ;

     if (BS[1]='1') then
        CheckBox1.Checked := TRUE ;
     if (BS[2]='1') then
        CheckBox2.Checked := TRUE ;
     if (BS[3]='1') then
        CheckBox3.Checked := TRUE ;

     Edit1.Text := MC ;
     Edit2.Text := BH ;
     Edit3.Text := DW ;

     Edit9.Text  := format('%0.2f',[P1]) ;
     Edit10.Text := format('%0.2f',[P2]) ;
     Edit11.Text := format('%0.2f',[P3]) ;
     Edit12.Text := format('%0.2f',[P4]) ;
     Edit13.Text := format('%0.2f',[P5]) ;
     Edit14.Text := format('%0.2f',[P6]) ;

     Edit1Enter(Sender) ;
end;

procedure TJsjDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TableJSJ.Close ;
end;

procedure TJsjDlg.CalcOneItem ;
var
   flag : boolean ;
begin
     flag := TRUE ;
     if (Application.MessageBox( '是否累计已有的脚手架费用(或者其他单项费用)?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
     begin
          flag := FALSE ;
     end ;
     
     with Dbs do
     begin
          if ((TableUSER.FieldByName('WLP').AsString='FDE') and (flag or (TableUSER.FieldByName('DEMC').AsString<>'脚手架'))) then
          begin
               DJ := TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('PRICE').AsFloat ;
               RGF:= TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('LABFEE').AsFloat ;
               RGS:= TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('LPD').AsFloat ;
               CLF:= TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('MTRLFEE').AsFloat ;
               JXF:= TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('MCHNFEE').AsFloat ;
          end ;
     end ;
end ;

procedure TJsjDlg.CalcOnePart ;
var
   flag : boolean ;
begin
     flag := TRUE ;
     if (Application.MessageBox( '是否累计已有的脚手架费用(或者其他单项费用)?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
     begin
          flag := FALSE ;
     end ;

     with Dbs do
     begin
          while (TRUE) do
          begin
               if (TableUSER.FieldByName('WLP').AsString='T') then
                  break ;
               if (TableUSER.BOF) then
                  break ;
               TableUSER.Prior ;
          end ;
          while (TRUE) do
          begin
               if (TableUSER.FieldByName('WLP').AsString='B') then
                  break ;
               if (TableUSER.EOF) then
                  break ;

               if ((TableUSER.FieldByName('WLP').AsString='FDE') and (flag or (TableUSER.FieldByName('DEMC').AsString<>'脚手架'))) then
               begin
                    DJ := DJ +TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('PRICE').AsFloat ;
                    RGF:= RGF+TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('LABFEE').AsFloat ;
                    RGS:= RGS+TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('LPD').AsFloat ;
                    CLF:= CLF+TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('MTRLFEE').AsFloat ;
                    JXF:= JXF+TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('MCHNFEE').AsFloat ;
               end ;

               TableUSER.Next ;
          end ;
     end ;
end ;

procedure TJsjDlg.CalcAllItem ;
var
   flag : boolean ;
begin
     flag := TRUE ;
     if (Application.MessageBox( '是否累计已有的脚手架费用(或者其他单项费用)?',
                                 pChar(AppName),
                                 MB_OKCANCEL or MB_ICONQUESTION )=IDCANCEL) then
     begin
          flag := FALSE ;
     end ;

     with Dbs do
     begin
          while (TRUE) do
          begin
               if (TableUSER.BOF) then
                  break ;
               TableUSER.Prior ;
          end ;
          while (TRUE) do
          begin
               if (TableUSER.EOF) then
                  break ;

               if ((TableUSER.FieldByName('WLP').AsString='FDE') and (flag or (TableUSER.FieldByName('DEMC').AsString<>'脚手架'))) then
               begin
                    DJ := DJ +TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('PRICE').AsFloat ;
                    RGF:= RGF+TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('LABFEE').AsFloat ;
                    RGS:= RGS+TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('LPD').AsFloat ;
                    CLF:= CLF+TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('MTRLFEE').AsFloat ;
                    JXF:= JXF+TableUSER.FieldByName('QUANTITY').AsFloat*TableUSER.FieldByName('MCHNFEE').AsFloat ;
               end ;

               TableUSER.Next ;
          end ;
     end ;
end ;

procedure TJsjDlg.FormShow(Sender: TObject);
begin

     TableJSJ.Close ;
     TableJSJ.Open ;

     F1 := 0.0 ;
     F2 := 0.0 ;
     F3 := 0.0 ;
     F4 := 0.0 ;
     F5 := 0.0 ;

     DJ  := 0.0 ;
     RGF := 0.0 ;
     RGS := 0.0 ;
     CLF := 0.0 ;
     JXF := 0.0 ;

     case Self.Tag of
     0 : CalcOneItem ;
     1 : CalcOnePart ;
     2 : CalcAllItem ;
     end ;

     Edit1.Text  := '' ;
     Edit2.Text  := '' ;
     Edit3.Text  := '' ;
     Edit4.Text  := '' ;
     Edit5.Text  := '' ;
     Edit6.Text  := '' ;
     Edit7.Text  := '' ;
     Edit8.Text  := '' ;
     Edit9.Text  := '' ;
     Edit10.Text := '' ;
     Edit11.Text := '' ;
     Edit12.Text := '' ;
     Edit13.Text := '' ;
     Edit14.Text := '' ;
     Edit15.Text := format('%0.2f',[RGF]) ;
     Edit16.Text := format('%0.2f',[CLF]) ;
     Edit17.Text := format('%0.2f',[JXF]) ;

     BitBtn1.SetFocus ;

end;

procedure TJsjDlg.BitBtn2Click(Sender: TObject);
var
   ID : string[10] ;
   NUM: shortint ;
begin
     BH := Edit2.Text ;
     MC := Edit1.Text ;
     DW := Edit3.Text ;
     F2 := StrToFloat(Edit4.Text) ;
     F3 := StrToFloat(Edit5.Text) ;
     F4 := StrToFloat(Edit6.Text) ;
     F5 := StrToFloat(Edit7.Text) ;
     F1 := F2+F4+F5 ;
     Edit4.Text := format('%0.2f', [F2]) ;
     Edit5.Text := format('%0.2f', [F3]) ;
     Edit6.Text := format('%0.2f', [F4]) ;
     Edit7.Text := format('%0.2f', [F5]) ;
     Edit8.Text := format('%0.2f', [F1]) ;
     with Dbs do
     begin
          case Self.Tag of
          0 : TableUSER.Next ;
          1 : ;
          2 : TableUSER.Prior ;
          end ;
          ID  := TableUSER.FieldByName('ID').AsString ;
          NUM := TableUSER.FieldByName('NUM').AsInteger ;
          TableUSER.InsertRecord ([FALSE, ID, NUM, '', 0, '', '1']) ;
          TableUSER.Edit ;
          TableUSER.FieldByName('WLP').AsString    := 'FDE' ;
          TableUSER.FieldByName('CODE').AsString   := BH ;
          TableUSER.FieldByName('ATTRIB').AsString := '1' ;
          TableUSER.FieldByName('NAME').AsString   := MC ;
          TableUSER.FieldByName('UNIT').AsString   := DW ;
          TableUSER.FieldByName('PRICE').AsFloat   := F1 ;
          TableUSER.FieldByName('LABFEE').AsFloat  := F2 ;
          TableUSER.FieldByName('LPD').AsFloat     := F3 ;
          TableUSER.FieldByName('MTRLFEE').AsFloat := F4 ;
          TableUSER.FieldByName('MCHNFEE').AsFloat := F5 ;
          TableUSER.FieldByName('QUANTITY').AsFloat:= 1.0 ;
          TableUSER.FieldByName('DEID').AsInteger  := 0 ;
          TableUSER.FieldByName('DEMC').AsString   := '脚手架' ;
          TableUSER.FieldByName('CODEID').AsInteger:= 0 ;
          TableUSER.Post ;
     end ;
     ModalResult := IDOK ;
end;

procedure TJsjDlg.BitBtn3Click(Sender: TObject);
begin
     ModalResult := IDCANCEL ;
end;

procedure TJsjDlg.Edit1Enter(Sender: TObject);
begin

     P1  := StrToFloat (Edit9.Text) ;
     P2  := StrToFloat (Edit10.Text) ;
     P3  := StrToFloat (Edit11.Text) ;
     P4  := StrToFloat (Edit12.Text) ;
     P5  := StrToFloat (Edit13.Text) ;
     P6  := StrToFloat (Edit14.Text) ;
     RGF := StrToFloat (Edit15.Text) ;
     CLF := StrToFloat (Edit16.Text) ;
     JXF := StrToFloat (Edit17.Text) ;
     F1  := 0.0 ;
     F2  := 0.0 ;
     F3  := 0.0 ;
     F4  := 0.0 ;
     F5  := 0.0 ;

     Edit9.Text  := Format ('%0.2f',[P1]) ;
     Edit10.Text := Format ('%0.2f',[P2]) ;
     Edit11.Text := Format ('%0.2f',[P3]) ;
     Edit12.Text := Format ('%0.2f',[P4]) ;
     Edit13.Text := Format ('%0.2f',[P5]) ;
     Edit14.Text := Format ('%0.2f',[P6]) ;
     Edit15.Text := Format ('%0.2f',[RGF]) ;
     Edit16.Text := Format ('%0.2f',[CLF]) ;
     Edit17.Text := Format ('%0.2f',[JXF]) ;

     MC :='取(' ;
     if (CheckBox1.Checked=TRUE) then
     begin
          F1 := F1+rgf ;
          MC := MC+CheckBox1.Caption+'('+Edit15.Text+')' ;
     end ;
     if (CheckBox2.Checked=TRUE) then
     begin
          F1 := F1+clf ;
          MC := MC+CheckBox2.Caption+'('+Edit16.Text+')' ;
     end ;
     if (CheckBox3.Checked=TRUE) then
     begin
          F1 := F1+jxf ;
          MC := MC+CheckBox3.Caption+'('+Edit17.Text+')' ;
     end ;
     MC := MC+')*'+Edit9.Text+'%' ;
     Edit1.Text := MC ;

     F1 := F1*p1/100 ;
     F2 := F1*p2/100 ;
     F3 := RGS*p1/100 ;
     F4 := F1*p3/100 ;
     F5 := F1*p4/100 ;

     F1 := F2 + F4 + F5 ;

     Edit4.Text := format('%0.2f', [F2]) ;
     Edit5.Text := format('%0.2f', [F3]) ;
     Edit6.Text := format('%0.2f', [F4]) ;
     Edit7.Text := format('%0.2f', [F5]) ;
     Edit8.Text := format('%0.2f', [F1]) ;
end;



end.

