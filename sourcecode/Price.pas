unit Price;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, DBTables, DB, Grids, DBGrids;

type
  TPriceDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    DataSourceTEMP: TDataSource;
    DBGridTemp: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PriceDlg: TPriceDlg;

implementation
uses ZZJ;
{$R *.DFM}

end.
