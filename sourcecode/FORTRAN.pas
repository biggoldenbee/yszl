unit FORTRAN;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, DECZ;
const
     MaxNum = 254 ;
     KeyX = $0100 ;
     VarX = $0200 ;
     ConX = $0400 ;
     FunX = $0800 ;
     Operator : array[1..9] of char = ( '+',  '-',  '*',  '/',  '(',')', '#', ',', ';' ) ;
     OperTable : array[1..7, 1..7] of integer =(
                             ( 1,  1, -1, -1, -1,  1,  1),
                             ( 1,  1, -1, -1, -1,  1,  1),
                             ( 1,  1,  1,  1, -1,  1,  1),
                             ( 1,  1,  1,  1, -1,  1,  1),
                             (-1, -1, -1, -1, -1,  0,  2),
                             ( 1,  1,  1,  1,  2,  1,  1),
                             (-1, -1, -1, -1, -1,  2,  0)) ;
     S_Normal     = 0 ;
     S_Empty      = 1 ;
     S_StartZero  = 2 ;
     S_HasKeyWord = 3 ;
     S_TooLength  = 4 ;
     S_FloatError = 5 ;
     S_ArgName    = 6 ;
     S_ArgNum     = 7 ;
     S_DivZero    = 8 ;
type
  TForTranDlg = class(TForm)
    BitBtn1: TBitBtn;
    T1: TLabel;
    EditGS: TEdit;
    T2: TLabel;
    EditCS: TEdit;
    T3: TLabel;
    EditRESULT: TEdit;
    Status: TPanel;
    //define fortran function and procedure
    procedure ShowError ;
    function  SCheckConX(W: string) : boolean ;
    function  SCheckVarX(W: string) : word ;
    procedure SInit ;
    procedure SWord(S: string; var W: string; var n: Integer) ;
    procedure STrans(S: string; var SObj : array of word) ;
    procedure SCount(SObj : array of word; var LRESULT : double) ;
    procedure SObjS(SObj : array of word; var s : string) ;
    procedure SGetCs(S : string) ;

    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    S_Gs   : string ;                              //define gs
    S_Calc : string ;                              //define calc format
    S_Cs   : string ;                              //define cs format
    S_SObj : array[0..MaxNum] of word ;            //define command object
    S_VarX : array[0..MaxNum] of double ;          //define var
    S_VarXName : array[0..MaxNum] of string[20] ;  //define var name
    S_VarXCName : array[0..MaxNum] of string[100] ; //define var chinese name
    S_VarXP: integer ;                             //define var pointer
    S_ConX : array[0..MaxNum] of double ;          //define con
    S_ConXP: integer ;                             //define con pointer
    LRESULT : double ;
    ErrorFlag : Integer ;
  end;

var
  ForTranDlg: TForTranDlg;

implementation

uses main;

{$R *.DFM}

procedure TForTranDlg.ShowError ;
var
   s : string ;
begin
     case ErrorFlag of
     S_Normal       : s := '' ;
     S_Empty        : s := '您输入的公式是空的！' ;
     S_StartZero    : s := '开始翻译的起始地址为零！' ;
     S_HasKeyWord   : s := '您输入的公式内含有字符#！' ;
     S_TooLength    : s := '您输入的公式太长！' ;
     S_FloatError   : s := '浮点数转换错误！' ;
     S_ArgName      : S := '参数定义错误！' ;
     S_ArgNum       : s := '您输入的参数不正确！' ;
     S_DivZero      : s := '除零操作！' ;
     end ;
     Status.Caption := s ;
end ;

function TForTranDlg.SCheckConX (W:String) : boolean ;
var
   i : integer ;
   s : string ;
begin
     ErrorFlag := S_NORMAL ;
     result := FALSE ;
     //word is empty
     if (W='') then
     begin
//          ErrorFlag := S_FloatError ;
          result := FALSE ;
          exit ;
     end ;
     //if is a right float const
     result := TRUE ;
     for i:=1 to length(W) do
     begin
          if (pos(W[i],'0123456789.')=0) then
          begin
               //not a right float const and exit function
//               ErrorFlag := S_FloatError ;
               result := FALSE ;
               exit ;
          end ;
     end ;
     //judge W'format if is '0.00'
     if (pos('.',W)<>0) then
     begin
          s := copy (W,pos('.',W)+1,Length(W)-pos('.',W)) ;
          if (pos('.',s)<>0) then
             ErrorFlag := S_FloatError ;
     end ;
     result := TRUE ;
end ;

function TForTranDlg.SCheckVarX (W:String) : word ;
var
   i : word ;
begin
     result := $FFFF ;
     //word is empty
     if (W='') then
     begin
          result := $FFFF ;
          exit ;
     end ;
     //first char is number
     if (('0'<=W[1])and(W[1]<='9')) then
     begin
          result := $FFFF ;
          exit ;
     end ;
     //has char '.'
     if (pos('.',W)<>0) then
     begin
          result := $FFFF ;
          exit ;
     end ;
     //if S_VarXP value is -1
     if (S_VarXP<=-1) then
     begin
          inc (S_VarXP) ;
          result := S_VarXP ;
          exit ;
     end ;
     //search a right S_VarXP
     for i:=0 to S_VarXP do
     begin
          if (S_VarXName[i]=W) then
          begin
               result := i ;
               exit ;
          end ;
     end ;
     //w is new varx
     inc (S_VarXP) ;
     result := S_VarXP ;
end ;

procedure TForTranDlg.SInit ;
var
   i : integer ;
begin
     for i:=0 to MaxNum do
     begin
          S_SObj[i]      := $0000 ;
          S_VarX[i]      := 0.0 ;
          S_VarXName[i]  := '' ;
          S_VarXCName[i] := '' ;
          S_ConX[i]      := 0.0 ;
     end ;
     S_VarXP := -1 ;
     S_ConXP := -1 ;
     ErrorFlag := S_Normal ;
     ShowError ;
end ;

procedure TForTranDlg.SWord(S: string; var W: string; var n: Integer) ;
var
   i : integer ;
begin
     //judge there is error
     if (S='') then
     begin
          //This string s is empty
          ErrorFlag := S_Empty ;
          exit ;
     end ;
     if (n<=0) then
     begin
          //Start address is zero
          ErrorFlag := S_StartZero ;
          exit ;
     end ;
     //clear word buffer
     W := '' ;
     //search current char if is operator
     for i:=1 to sizeof(Operator) do
     begin
          if (S[n]=Operator[i]) then
          begin
               W := S[n] ;
               inc (n) ;
               exit ;
          end ;
     end ;
     //search next operator
     while TRUE do
     begin
          //Length(S) > 255 is error
          if (n>=MaxNum+1) then
          begin
               ErrorFlag := S_TooLength ;
               break ;
          end ;
          //End of S
          if (S[n]=#0) then
             break ;
          //End of S
          if (S[n]='#') then
             break ;
          //Next Operator
          for i:=1 to sizeof(Operator) do
          begin
               if (S[n]=Operator[i]) then
                  exit ;
          end ;
          //Construct a Token Word
          W := W + S[n];
          inc (n) ;
     end ;
end;

procedure TForTranDlg.STrans(S: string; var SObj : array of word) ;
var
   w : string ;
   f : double ;
   i : integer ;
   j : integer ;
   n : integer ;
begin
     //clear S_SObj
     for i:=0 to MaxNum do S_SObj[i] := $0000 ;
     //judge string s if is empty
     if (S='') then
     begin
          ErrorFlag := S_Empty ;
          exit ;
     end ;
     //iudge s if has keyword '#'
     if (Pos('#',S)<>0) then
     begin
          ErrorFlag := S_HasKeyWord ;
          exit ;
     end ;

     j := -1 ;
     n := 1 ;
     S := UpperCase(S)+'#' ;
     inc(j) ;
     SObj[j] := KeyX or 7 ;
     While TRUE do
     begin
          //end of s and break loop
          if (S[n]='#') then
             break ;
          //get a word
          SWord (s, w, n) ;
          //there is error and exit procedure
          if (ErrorFlag<>0) then
          begin
               exit ;
          end ;
          //if w is a null string
          if (w='') then
          begin
               continue ;
          end ;
          //first search if is a operator
          for i:=1 to sizeof(Operator) do
          begin
               if (w=Operator[i]) then
               begin
                    //is a operator such as '+','-','*','/','(',')','#'
                    if (i<=7) then
                    begin
                         inc (j) ;
                         SObj[j] := KeyX or i ;
                    end ;
                    //is a ';' or ',' do nothing
                    break ;
               end
          end;
          //w is a varx or conx or funx
          if (i>sizeof(Operator)) then
          begin
               //w is a conx
               if (SCheckConX(w)) then
               begin
                    if (ErrorFlag<>0) then
                       exit ;
                    f := StrToFloat (w) ;
                    inc(j) ;
                    inc(S_ConXP) ;
                    SObj[j] := ConX or S_ConXP ;
                    S_ConX[S_ConXP] := f ;
                    continue ;
               end ;
               //w is a varx
               i := SCheckVarX(w) ;
               if (i<>$FFFF) then
               begin
                    if (ErrorFlag<>0) then
                       exit ;
                    inc(j) ;
                    SObj[j] := VarX or i ;
                    S_VarXName[i] := w ;
                    continue ;
               end else
               begin
                    ErrorFlag := S_ArgName ;
                    exit ;
               end ;
          end ;
     end ;
     inc (j) ;
     SObj[j] := KeyX or 7 ;
end ;

procedure TForTranDlg.SCount(SObj : array of word; var LRESULT : double) ;
label
     AAA ;
var
   s0 : array[0..MaxNum] of word ;
   s0p: integer ;
   s1 : array[0..MaxNum] of double ;
   s1p: integer ;
   i  : integer ;
   a  : word ;
   b  : word ;
   f0,f1: double ;
   OperatorCode : word ;
   OperatorNum  : word ;
begin
     //clear stack pointer and instruct pointer
     s0p := -1 ;
     s1p := -1 ;
     i := -1 ;
     //get first operator code from Sobj and push it to stack s0p
     inc (s0p) ;
     inc (i) ;
     a := SObj[i] ;
     s0[s0p] := $00FF and a ;
     b := s0[s0p] ;
     while TRUE do
     begin
          inc (i) ;
          //get instruct
          a := SObj[i] ;
          //get operator code
          OperatorCode := $FF00 and a ;
          //get operator num
          OperatorNum  := $00FF and a ;
          //start count
          case OperatorCode of
          KeyX :            //dealwith Key X
               begin
                    a := OperatorNum ;
                    AAA :
                    case OperTable[b,a] of
                    -1 :
                       begin
                            inc (s0p) ;
                            s0[s0p] := a ;
                            b := s0[s0p] ;
                       end ;
                    0 :
                       begin
                            if (a=7) then
                               break ;
                            dec (s0p) ;
                            b := s0[s0p] ;
                       end ;
                    1 :
                       begin
                            if (s1p>=0) then
                            begin
                                 f0 := s1[s1p] ;
                                 dec (s1p) ;
                            end else
                            begin
                                 f0 := 0.0 ;
                            end ;
                            if (s1p>=0) then
                            begin
                                 f1 := s1[s1p] ;
                                 dec (s1p) ;
                            end else
                            begin
                                 f1 := 0.0 ;
                            end ;
                            case b of
                            1 : f0 := f1 + f0 ;
                            2 : f0 := f1 - f0 ;
                            3 : f0 := f1 * f0 ;
                            4 :
                                begin
                                     if (f0<>0) then
                                        f0 := f1 / f0
                                     else
                                     begin
                                          ErrorFlag := S_DivZero ;
                                          exit ;
                                     end ;
                                end ;
                            end ;
                            inc (s1p) ;
                            s1[s1p] := f0 ;
                            dec (s0p) ;
                            b := s0[s0p] ;
                            goto AAA ;
                       end ;
                    2 :
                       begin
                            break ;
                       end ;
                    end ;
               end ;
          VarX :            //dealwith var X
               begin
                    inc (s1p) ;
                    s1[s1p] := S_VarX[OperatorNum] ;
               end ;
          ConX :            //dealwith con X
               begin
                    inc (s1p) ;
                    s1[s1p] := S_ConX[OperatorNum] ;
               end ;
          FunX :            //dealwith math function
               begin
               end ;
          end ;
     end ;
     LRESULT := s1[s1p] ;
end ;

procedure TForTranDlg.SObjS(SObj : array of word; var s : string) ;
var
   i : integer ;
   a : word ;
   OperatorCode : word ;
   OperatorNum  : word ;
begin
     i := 0  ;
     s := '' ;
     while TRUE do
     begin
          inc(i) ;
          //get instruct
          a := SObj[i] ;
          //get operator code
          OperatorCode := $FF00 and a ;
          //get operator num
          OperatorNum  := $00FF and a ;
          //start translate
          case OperatorCode of
          KeyX :            //dealwith Key X
               begin
                    //judge if exit
                    if (Operator[OperatorNum]='#') then
                       exit ;
                    //translate ％ and ‰
                    if (Operator[OperatorNum]='/') then
                    begin
                         a := SObj[i+1] ;
                         if (($FF00 and a)=ConX) then
                         begin
                              if (S_ConX[$00FF and a]=100.0) then
                              begin
                                   s := s+'％' ;
                                   inc(i) ;
                                   continue ;
                              end ;
                              if (S_ConX[$00FF and a]=1000.0) then
                              begin
                                   s := s+'‰' ;
                                   inc(i) ;
                                   continue ;
                              end ;
                         end ;
                    end ;
                    //translate operator
                    s := s+Operator[OperatorNum] ;
               end ;
          VarX :            //dealwith var X
               begin
                    if (OperatorNum<MaxArgNum) then
                    begin
                         if (S_VarXCName[OperatorNum]<>'') then
                            s := s+S_VarXCName[OperatorNum]
                         else
                             s := s+format('%0.2f',[S_VarX[OperatorNum]]) ;
                    end else
                    begin
                         s := s+'('+IntToStr(OperatorNum-49)+')' ;
                    end ;
               end ;
          ConX :            //dealwith con X
               begin
                    s := s+format('%0.2f',[S_ConX[OperatorNum]]) ;
               end ;
          FunX :            //dealwith math function
               begin
               end ;
          end ;
     end ;
end ;

procedure TForTranDlg.SGetCs (S : string) ;
var
   w : string ;
   f : double ;
   i : integer ;
   j : integer ;
   n : integer ;
begin
     //iudge s if has keyword '#'
     if (Pos('#',S)<>0) then
     begin
          ErrorFlag := S_HasKeyWord ;
          exit ;
     end ;

     j := -1 ;
     n := 1 ;
     S := UpperCase(S)+'#' ;
     While TRUE do
     begin
          if (S[n]='#') then
             break ;
          SWord (s, w, n) ;
          if (ErrorFlag<>0) then
          begin
               exit ;
          end ;
          for i:=1 to sizeof(Operator) do
          begin
               if (w=Operator[i]) then
                  break ;
          end;
          if (i>sizeof(Operator)) then
          begin
               if (SCheckConX(w)) then
               begin
                    if (ErrorFlag<>0) then
                       exit ;
                    f := StrToFloat (w) ;
                    inc (j) ;
                    S_VarX[j] := f ;
               end ;
          end ;
     end ;
     if (j<>S_VarXP) then
        ErrorFlag := S_ArgNum ;
end ;

procedure TForTranDlg.BitBtn1Click(Sender: TObject);
begin
     SInit ;
     S_Calc := EditGS.Text ;
     S_Cs := EditCS.Text ;
     STRans(S_Calc, S_Sobj) ;
     if (ErrorFlag<>0) then
     begin
          ShowError ;
          EditGS.SetFocus ;
          exit ;
     end ;
     SGetCs (S_Cs) ;
     if (ErrorFlag<>0) then
     begin
          ShowError ;
          EditCS.SetFocus ;
          exit ;
     end ;
     SCount (S_SObj, LRESULT) ;
     if (ErrorFlag<>0) then
     begin
          ShowError ;
          EditGS.SetFocus ;
          exit ;
     end ;
     EditRESULT.Text := format ('%0.3f', [LRESULT]) ;
end;

procedure TForTranDlg.FormShow(Sender: TObject);
begin
     //Clear Display Interface
     EditGs.Text := '' ;
     EditCs.Text := '' ;
     EditRESULT.Text := '' ;
     SInit ;
     //split S_Calc and S_Cs from S_GS
     if (S_Gs<>'') then
     begin
          if (Pos(';',S_Gs)<>0) then
          begin
               S_Calc := Copy (S_Gs,1,Pos(';',S_Gs)-1) ;
               S_Cs := Copy (S_Gs,Pos(';',S_Gs)+1,Length(S_Gs)-Pos(';',S_Gs)) ;
          end else
          begin
               S_Calc := S_Gs ;
               S_Cs := '' ;
          end ;
     end else
     begin
          S_Gs := '' ;
          S_Calc := '' ;
          S_Cs := '' ;
     end ;
     //Initialize form interface
     EditGS.Text := S_Calc ;
     EditCS.Text := S_Cs ;
     EditRESULT.Text := '' ;
     EditGS.SetFocus ;
     if (S_Calc<>'') then
        BitBtn1.OnClick (BitBtn1) ;
end;

procedure TForTranDlg.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MainForm.OnKeyUp (MainForm, Key, Shift) ;
end;

procedure TForTranDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
     VK_RETURN :
          begin
               BitBtn1.OnClick (BitBtn1) ;
               if (ErrorFlag<>0) then
                  exit ;
               S_Gs := S_Calc + ';' + S_Cs ;
               ModalResult := IDOK ;
          end ;
     VK_ESCAPE :
          begin
               S_Gs := '0' ;
               LRESULT := 0.0 ;
               ModalResult := IDCANCEL ;
          end ;
     end ;
end;

end.

