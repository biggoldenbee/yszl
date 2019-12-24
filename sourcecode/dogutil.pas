unit dogutil;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;
var
  _DogData:^byte;  { a pointer point to operation data }
  _DogResult:longint; { store the convert result }
  _DogBytes:integer;  { indicate the size of operation data }
  _DogCode:integer;  { secret code, ReadDog and WriteDog function need it }
  _DogAddr:integer;  { indicate where the operation data to be store in Dog }

procedure ClearDog ;
procedure WatchDog ;
function _DogCheck: longint; external;
function _DogConvert: longint; external;
function _WriteDog: longint; external;
function _ReadDog: longint; external;

implementation
uses main ;

{$F-}
{$L cwin32.obj}

procedure ClearDog ;
var
   j : longint ;
begin
     //check soft dog
     _DogCode:=7172 ;
     j := _DogCheck ;
     if (j<>0) then
     begin
          Application.MessageBox( '对不起，没检测到软件狗！',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION) ;
          exit ;
     end ;
     //clear
     MainPWD := 'QASSYSDEMO**********' ;
     _DogCode:=7172 ;
     _DogAddr:=100 ;
     _DogBytes:= 20 ;
     _DogData:=@MainPWD[1] ;
     _WriteDog ;
     //read
     MainPWD := '                    ' ;
     _DogCode:=7172;
     _DogAddr:=100;
     _DogBytes:= 20;
     _DogData:=@MainPWD[1] ;
     _ReadDog ;
     if (MainPWD='QASSYSDEMO**********') then
     begin
          Application.MessageBox( '注册成功！',
                                  pChar(AppName),
                                  MB_OK or MB_ICONINFORMATION) ;
     end ;
end ;

procedure WatchDog ;
var
   j : longint ;
begin
     MainPWD := 'QASSYSDEMO111111****' ;
     exit ;
     //check soft dog
     _DogCode:=7172 ;
     j := _DogCheck ;
     if (j<>0) then
     begin
          MainPWD := 'NODOG' ;
          exit ;
     end ;
     //read password
     MainPWD := '                    ' ;
     _DogCode:=7172 ;
     _DogAddr:=100 ;
     _DogBytes:= 20 ;
     _DogData:=@MainPWD[1] ;
     _ReadDog ;

     _DogCode:=7172 ;
     _DogAddr:=120 ;
     _DogBytes:= Sizeof(TDateTime) ;
     _DogData:= @RegisterDate ;
     _ReadDog ;

     _DogCode:=7172 ;
     _DogAddr:=130 ;
     _DogBytes:= Sizeof(Integer) ;
     _DogData:= @PeriodDay ;
     _ReadDog ;

end ;

end.



