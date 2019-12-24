unit Hdtz;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, Spin, SysUtils, Mask;

type
  THDTZDlg = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    EditDEBH: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditDEMC: TEdit;
    procedure STransFt ;
    procedure SGetFromDEMC ;
    procedure DisplayDEMC ;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EditDEMCChange(Sender: TObject);
    procedure EditDEMCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditDEMCEnter(Sender: TObject);
    procedure EditDEMCMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    bh : string ;
    ft : string ;
    ft1 : string ;
    ft2 : string ;
    hsbh : string ;
    base : double ;
    step : double ;
    mc : string ;
    sl : double ;
    addsl : double ;
  end;

var
  HDTZDlg: THDTZDlg;

implementation

{$R *.DFM}

procedure THDTZDlg.STransFt ;
begin
     if (ft='') then
     begin
          exit ;
          MessageBeep ( 0 ) ;
     end ;
     ft1 := copy (ft,1,pos('%',ft)-1) ;
     ft2 := copy (ft,pos('f',ft)+1,length(ft)-pos('f',ft)) ;
end ;

procedure THDTZDlg.SGetFromDEMC ;
var
   i,l : integer ;
   s : string ;
   w : string ;
begin
     s := EditDEMC.Text ;
     //check s
     if (s='') then
     begin
          exit ;
     end ;
     //get w
     w := copy (s, length(ft1)+1, length(s)-length(ft1)-length(ft2)) ;
     if (w='') then exit ;
     //check w
     l := length(w) ;
     for i:=1 to l do
     begin
          if (w[i]='.') then
             continue ;
          if (('0'<=w[i])and(w[i]<='9')) then
             continue ;
          exit ;
     end ;
     //check w
     if (pos('.',w)<>0) then
     begin
          s := copy (w,pos('.',w)+1,Length(w)-pos('.',w)) ;
          if (pos('.',s)<>0) then
             exit ;
     end ;
     //calc addsl
     addsl := (StrToFloat(w)-base)/step ;
end ;

procedure THDTZDlg.DisplayDEMC ;
begin
     sl := base+step*addsl ;
     mc := Format(ft,[sl]) ;
     EditDEMC.Text := mc ;
     EditDEMC.SelStart := length(ft1) ;
     EditDEMC.SelLength := pos(ft2,EditDEMC.Text)-length(ft1)-1 ;
     EditDEMC.SetFocus ;
end ;

procedure THDTZDlg.FormShow(Sender: TObject);
begin
     STransFT ;

     EditDEBH.Text := bh+'»»' ;
     addsl := 0.0 ;
     DisplayDEMC ;
end;

procedure THDTZDlg.BitBtn1Click(Sender: TObject);
begin
     SGetFromDEMC ;
     DisplayDEMC ;
     if (addsl<>0.0) then
        ModalResult := IDOK
     else
        ModalResult := IDCANCEL ;
end;

procedure THDTZDlg.BitBtn2Click(Sender: TObject);
begin
     ModalResult := IDCANCEL ;
end;

procedure THDTZDlg.EditDEMCChange(Sender: TObject);
begin
     if ((pos(ft1,EditDEMC.Text)=0) or (pos(ft2,EditDEMC.Text)=0)) then
     begin
          DisplayDEMC ;
          EditDEMC.SelStart := pos ( '%', ft ) - 1 ;
     end ;
end;

procedure THDTZDlg.EditDEMCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Shift<>[]) then
     begin
          DisplayDEMC ;
          exit ;
     end ;
     case Key of
     VK_HOME :
                begin
                     Key := 0 ;
                end ;
     VK_END :
                begin
                     Key := 0 ;
                end ;
     VK_LEFT :
                begin
                     EditDEMC.SelLength := 0 ;
                     if (EditDEMC.SelStart<=length(ft1)) then
                        Key := 0 ;
                end ;
     VK_RIGHT :
                begin
                     EditDEMC.SelLength := 0 ;
                     if (EditDEMC.SelStart>=Pos(ft2,EditDEMC.Text)-1) then
                        Key := 0 ;
                end ;
     VK_UP :
                begin
                     Key := 0 ;
                     addsl := addsl + 0.1 ;
                     DisplayDEMC ;
                end ;
     VK_DOWN :
                begin
                     Key := 0 ;
                     addsl := addsl - 0.1 ;
                     DisplayDEMC ;
                end ;
     VK_RETURN :
                begin
                     SGetFromDEMC ;
                     DisplayDEMC ;
                end ;
     VK_DELETE :
                begin
                end ;
     VK_BACK :
                begin
                end ;
     else
                begin
                     if (EditDEMC.SelLength<>0) then
                     begin
                          EditDEMC.ClearSelection ;
                          EditDEMC.SelLength := 0 ;
                     end ;
                end ;
     end ;
end;

procedure THDTZDlg.EditDEMCEnter(Sender: TObject);
begin
     DisplayDEMC ;
end;

procedure THDTZDlg.EditDEMCMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     DisplayDEMC ;
end;

procedure THDTZDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
     VK_RETURN : BitBtn1.OnClick ( BitBtn1 ) ;
     VK_ESCAPE : BitBtn2.OnClick ( BitBtn2 ) ;
     end ;
end;

end.
