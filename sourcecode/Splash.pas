unit Splash ;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TSplashForm = class(TForm)
    TitleImage: TImage;
    Animate1: TAnimate;
    WelcomeWord: TLabel;
    SoftName: TLabel;
    SoftVersion: TLabel;
    Tel: TLabel;
    Email: TLabel;
    CompanyName: TLabel;
    CompanyAddress: TLabel;
    PostCode: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  SplashForm: TSplashForm;

implementation
uses main ;
{$R *.DFM}

procedure TSplashForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Animate1.Active := FALSE ;
end;

procedure TSplashForm.FormCreate(Sender: TObject);
begin
     //software information
     WelcomeWord.Caption := ConWelcomeWord ;
     SoftName.Caption := ConSoftName ;
     SoftVersion.Caption := ConSoftVersion ;
     Tel.Caption := ConTel ;
     Email.Caption := ConEmail ;
     PostCode.Caption := ConPostCode ;
     CompanyName.Caption := ConCompanyName ;
     CompanyAddress.Caption := ConAddress ;
     //initialize Animate1
     Animate1.FileName := 'CYRJ.AVI' ;
     Animate1.Active := TRUE ;
end;

procedure TSplashForm.FormShow(Sender: TObject);
begin
     if (Animate1.Active=FALSE) then
        Animate1.Active := TRUE ;
end;

end.
