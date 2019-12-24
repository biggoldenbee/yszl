unit RFORM9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, Db, DBTables, DECZ;

type
  TRptForm9 = class(TForm)
    QuickRep: TQuickRep;
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
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    DetailBand1: TQRBand;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel9: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRExpr1: TQRExpr;
    QRShape23: TQRShape;
    L3: TQRLabel;
    L1: TQRLabel;
    L2: TQRLabel;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptForm9: TRptForm9;

implementation
uses Main,YSZLDBS ;
{$R *.DFM}

procedure TRptForm9.QuickRepAfterPreview(Sender: TObject);
begin
     TableRPT.Close ;
     try
        TableRPT.DeleteTable ;
     except
     end ;
end;

procedure TRptForm9.QuickRepAfterPrint(Sender: TObject);
begin
     TableRPT.Close ;
     try
        TableRPT.DeleteTable ;
     except
     end ;
end;

procedure TRptForm9.QuickRepBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
var
   i : integer ;
begin
     L1.Caption := '工程名称:'+PrjHead.GCMC ;
     L2.Caption := '建设单位:'+PrjHead.JSDW ;
     L3.Caption := '编制单位:'+PrjHead.BZDW ;
     L4.Caption := ConWelcomeWord ;
     RptName.Caption := '材料补差表' ;
     TableRPT.Close ;
     TableRPT.TableName := Self.Name ;
     with Dbs do
     begin
          QueryUSER.Close ;
          QueryUSER.DatabaseName := 'USER' ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add( 'SELECT * FROM"'+PrjHead.FileName+'" WHERE ID="RCJ" AND NUM=2 AND LABFEE>0.0' ) ;
          TableRPT.BatchMove(QueryUSER, batCopy) ;
          QueryUSER.Close ;
     end ;
     TableRPT.Open ;
     TableRPT.First ;
     i := 0 ;
     while(TRUE) do
     begin
          if (TableRPT.EOF) then
             break ;
          inc(i) ;
          TableRPT.Edit ;
          TableRPT.FieldByName('COUNT').AsFloat := TableRPT.FieldByName('QUANTITY').AsFloat*
                                                  (TableRPT.FieldByName('LABFEE').AsFloat-TableRPT.FieldByName('PRICE').AsFloat) ;
          TableRPT.FieldByName('XH').AsInteger  := i ;
          TableRPT.Post ;
          TableRPT.Next ;
     end ;
     QRDBText1.DataField := 'XH' ;
     QRDBText2.DataField := 'NAME' ;
     QRDBText3.DataField := 'UNIT' ;
     QRDBText4.DataField := 'QUANTITY' ;
     QRDBText5.DataField := 'PRICE' ;
     QRDBText6.DataField := 'LABFEE' ;
     QRDBText7.DataField := 'COUNT' ;
     QRExpr1.Expression  := 'SUM(TableRPT.COUNT)' ;
end;

procedure TRptForm9.QRDBText4Print(sender: TObject; var Value: String);
begin
     if (StrToFloat(Value)=0.0) then Value := '' ;
end;



end.
