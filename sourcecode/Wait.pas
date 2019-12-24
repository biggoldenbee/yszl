unit Wait;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TWaitDlg = class(TForm)
    Label1: TLabel;
    Animate: TAnimate;
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WaitDlg: TWaitDlg;

implementation

uses main;

{$R *.DFM}

procedure TWaitDlg.FormHide(Sender: TObject);
begin
     Animate.Active := FALSE ;
end;

procedure TWaitDlg.FormShow(Sender: TObject);
begin
     Animate.FileName := 'CYRJ.AVI' ;
     Animate.Active := TRUE ;
end;

procedure TWaitDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MainForm.OnKeyUp (MainForm, Key, Shift) ;
end;

end.
