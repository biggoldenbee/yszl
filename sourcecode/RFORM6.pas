unit RFORM6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, Db, DBTables, DECZ;

type
  TRptForm6 = class(TForm)
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
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    DetailBand1: TQRBand;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    L2: TQRLabel;
    L1: TQRLabel;
    L3: TQRLabel;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptForm6: TRptForm6;

implementation
uses Main,YSZLDBS ;
{$R *.DFM}

procedure TRptForm6.QuickRepAfterPreview(Sender: TObject);
begin
     TableRPT.Close ;
     try
        TableRPT.DeleteTable ;
     except
     end ;
end;

procedure TRptForm6.QuickRepAfterPrint(Sender: TObject);
begin
     TableRPT.Close ;
     try
        TableRPT.DeleteTable ;
     except
     end ;
end;

procedure TRptForm6.QuickRepBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
     L1.Caption := '工程名称:'+PrjHead.GCMC ;
     L2.Caption := '建设单位:'+PrjHead.JSDW ;
     L3.Caption := '编制单位:'+PrjHead.BZDW ;
     L4.Caption := ConWelcomeWord ;
     RptName.Caption := '开办费' ;
     TableRPT.Close ;
     TableRPT.TableName := Self.Name ;
     with Dbs do
     begin
          QueryUSER.Close ;
          QueryUSER.DatabaseName := 'USER' ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add( 'SELECT * FROM"'+PrjHead.FileName+'" WHERE ID="KBF" AND ATTRIB="1"' ) ;
          TableRPT.BatchMove(QueryUSER, batCopy) ;
          QueryUSER.Close ;          
     end ;
     TableRPT.Open ;
     QRDBText1.DataField := 'XH' ;
     QRDBText2.DataField := 'NAME' ;
     QRDBText3.DataField := 'PRICE' ;
end;

procedure TRptForm6.QRDBText3Print(sender: TObject; var Value: String);
begin
     if (StrToFloat(Value)=0.0) then Value := '' ;
end;



end.
