unit RFORM5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, Db, DBTables, DECZ;

type
  TRptForm5 = class(TForm)
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
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    L3: TQRLabel;
    L1: TQRLabel;
    L2: TQRLabel;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptForm5: TRptForm5;

implementation
uses Main,YSZLDBS ;
{$R *.DFM}

procedure TRptForm5.QuickRepAfterPreview(Sender: TObject);
begin
     TableRPT.Close ;
     try
        TableRPT.DeleteTable ;
     except
     end ;
end;

procedure TRptForm5.QuickRepAfterPrint(Sender: TObject);
begin
     TableRPT.Close ;
     try
        TableRPT.DeleteTable ;
     except
     end ;
end;

procedure TRptForm5.QuickRepBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
     L1.Caption := '工程名称:'+PrjHead.GCMC ;
     L2.Caption := '建设单位:'+PrjHead.JSDW ;
     L3.Caption := '编制单位:'+PrjHead.BZDW ;
     L4.Caption := ConWelcomeWord ;
     RptName.Tag := 0 ;
     case MainForm.RptRadioGroup.ItemIndex of
     0 : RptName.Caption := '工程预算书(现行价)' ;
     1 : RptName.Caption := '工程决算书(现行价)' ;
     2 : begin
              RptName.Tag := 1 ;
              RptName.Caption := '工程招标书(现行价)' ;
         end ;
     3 : RptName.Caption := '工程投标书(现行价)' ;
     end ;
     TableRPT.Close ;
     TableRPT.TableName := Self.Name ;
     with Dbs do
     begin
          QueryUSER.Close ;
          QueryUSER.DatabaseName := 'USER' ;
          QueryUSER.SQL.Clear ;
          QueryUSER.SQL.Add( 'SELECT * FROM"'+PrjHead.FileName+'" WHERE ID="DEZM" AND ATTRIB="1"' ) ;
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
     QRDBText7.DataField := 'COUNT' ;
     QRDBText8.DataField := 'SPRICE' ;
     QRDBText9.DataField := 'SCOUNT' ;
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
     end ;
end;

procedure TRptForm5.QRDBText5Print(sender: TObject; var Value: String);
begin
     if (StrToFloat(Value)=0.0) then Value := '' ;
end;





end.
