unit RFORM16;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, Db, DBTables, DECZ;

type
  TRptForm16 = class(TForm)
    QuickRep: TQuickRep;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    TableRPT: TTable;
    RptName: TQRLabel;
    PageFooterBand1: TQRBand;
    L5: TQRLabel;
    QRSysData2: TQRSysData;
    L4: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape11: TQRShape;
    QRLabel11: TQRLabel;
    QRShape12: TQRShape;
    QRLabel12: TQRLabel;
    QRShape13: TQRShape;
    QRLabel13: TQRLabel;
    QRShape14: TQRShape;
    QRLabel14: TQRLabel;
    QRShape15: TQRShape;
    QRLabel15: TQRLabel;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRShape10: TQRShape;
    QRLabel10: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    L3: TQRLabel;
    L1: TQRLabel;
    L2: TQRLabel;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptForm16: TRptForm16;

implementation
uses Main,YSZLDBS ;
{$R *.DFM}

procedure TRptForm16.QuickRepAfterPreview(Sender: TObject);
begin
     TableRPT.Close ;
     try
        TableRPT.DeleteTable ;
     except
     end ;
end;

procedure TRptForm16.QuickRepAfterPrint(Sender: TObject);
begin
     TableRPT.Close ;
     try
        TableRPT.DeleteTable ;
     except
     end ;
end;

procedure TRptForm16.QuickRepBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
     L1.Caption := '工程名称:'+PrjHead.GCMC ;
     L2.Caption := '建设单位:'+PrjHead.JSDW ;
     L3.Caption := '编制单位:'+PrjHead.BZDW ;
     L4.Caption := ConWelcomeWord ;
     RptName.Tag := 0 ;
     case MainForm.RptRadioGroup.ItemIndex of
     0 : RptName.Caption := '工程预算书' ;
     1 : RptName.Caption := '工程决算书' ;
     2 : begin
              RptName.Tag := 1 ;
              RptName.Caption := '工程招标书' ;
         end ;
     3 : RptName.Caption := '工程投标书' ;
     end ;
     TableRPT.Close ;
     TableRPT.TableName := Self.Name ;
     with Dbs do
     begin
          QueryUSER.Close ;
          QueryUSER.DatabaseName := 'USER' ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add( 'SELECT * FROM"'+PrjHead.FileName+'" WHERE ID="DEZM"' ) ;
          TableRPT.BatchMove(QueryUSER, batCopy) ;
          QueryUSER.Close ;
     end ;
     TableRPT.Open ;
     TableRPT.First ;
     while (TRUE) do
     begin
          if (TableRPT.EOF) then
             break ;
          if (TableRPT.FieldByName('WLP').AsString='T') then
          begin
               TableRPT.Next ;
               if (TableRPT.FieldByName('WLP').AsString='B') then
               begin
                    TableRPT.Prior ;
                    TableRPT.Delete ;
                    TableRPT.Delete ;
                    continue ;
               end ;
               TableRPT.Prior ;
          end ;
          TableRPT.Next ;
     end ;
     TableRPT.First ;
     QRDBText1.DataField := 'XH' ;
     QRDBText2.DataField := 'CODE' ;
     QRDBText3.DataField := 'NAME' ;
     QRDBText4.DataField := 'UNIT' ;
     QRDBText5.DataField := 'QUANTITY' ;
     QRDBText6.DataField := 'PRICE' ;
     QRDBText7.DataField := 'LABFEE' ;
     QRDBText8.DataField := 'LPD' ;
     QRDBText9.DataField := 'MTRLFEE' ;
     QRDBText10.DataField:= 'MCHNFEE' ;
     QRDBText11.DataField:= 'COUNT' ;
     QRDBText12.DataField:= 'LABCOUNT' ;
     QRDBText13.DataField:= 'LPDCOUNT' ;
     QRDBText14.DataField:= 'MTRCOUNT' ;
     QRDBText15.DataField:= 'MCHCOUNT' ;
     if (RptName.Tag=0) then
     begin
          QRDBText1.Enabled := TRUE ;
          QRDBText2.Enabled := TRUE ;
          QRDBText3.Enabled := TRUE ;
          QRDBText4.Enabled := TRUE ;
          QRDBText5.Enabled := TRUE ;
          QRDBText6.Enabled := TRUE ;
          QRDBText7.Enabled := TRUE ;
          QRDBText8.Enabled := TRUE ;
          QRDBText9.Enabled := TRUE ;
          QRDBText10.Enabled:= TRUE ;
          QRDBText11.Enabled:= TRUE ;
          QRDBText12.Enabled:= TRUE ;
          QRDBText13.Enabled:= TRUE ;
          QRDBText14.Enabled:= TRUE ;
          QRDBText15.Enabled:= TRUE ;
     end else
     begin
          QRDBText1.Enabled := TRUE ;
          QRDBText2.Enabled := FALSE ;
          QRDBText3.Enabled := TRUE ;
          QRDBText4.Enabled := TRUE ;
          QRDBText5.Enabled := TRUE ;
          QRDBText6.Enabled := FALSE ;
          QRDBText7.Enabled := FALSE ;
          QRDBText8.Enabled := FALSE ;
          QRDBText9.Enabled := FALSE ;
          QRDBText10.Enabled:= FALSE ;
          QRDBText11.Enabled:= FALSE ;
          QRDBText12.Enabled:= FALSE ;
          QRDBText13.Enabled:= FALSE ;
          QRDBText14.Enabled:= FALSE ;
          QRDBText15.Enabled:= FALSE ;
     end ;
end;

procedure TRptForm16.QRDBText5Print(sender: TObject; var Value: String);
begin
     if (StrToFloat(Value)=0.0) then Value := '' ;
end;

procedure TRptForm16.QRDBText1Print(sender: TObject; var Value: String);
begin
     if (StrToFloat(Value)=0) then Value := '' ;
end;



end.
