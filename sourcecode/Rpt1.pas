unit Rpt1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,qrprntr;

type
  TQuickRpt1 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
  private

  public

  end;

var
  QuickRpt1: TQuickRpt1;

implementation
uses main ,YSZLDBS ;
{$R *.DFM}

end.
