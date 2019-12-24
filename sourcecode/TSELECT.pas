unit TSELECT;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TTSELECTDlg = class(TForm)
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TSELECTDlg: TTSELECTDlg;

implementation

{$R *.DFM}

procedure TTSELECTDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Self.Tag := RadioGroup1.ItemIndex ;
end;

procedure TTSELECTDlg.FormShow(Sender: TObject);
begin
     Self.Tag := -1 ;
     RadioGroup1.ItemIndex := 0 ;
end;

procedure TTSELECTDlg.BitBtn1Click(Sender: TObject);
begin
     Self.Close ;
end;

end.
