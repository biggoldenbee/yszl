unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls;

type
  TAboutBox = class(TForm)
    OKButton: TButton;
    TitleImage: TImage;
    Animate1: TAnimate;
    WelcomeWord: TLabel;
    SoftName: TLabel;
    SoftVersion: TLabel;
    Tel: TLabel;
    Email: TLabel;
    PostCode: TLabel;
    CompanyName: TLabel;
    CompanyAddress: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TitleImageDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    s : string[10] ;
    p : integer ;
  end;

var
  AboutBox: TAboutBox;

implementation
uses main, dogutil ;
{$R *.DFM}

procedure TAboutBox.FormShow(Sender: TObject);
begin
     s := '      ' ;
     p := 0 ;
     if (Animate1.Active=FALSE) then
        Animate1.Active := TRUE ;
end;

procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Animate1.Active := FALSE ;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
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
end;

procedure TAboutBox.TitleImageDblClick(Sender: TObject);
begin
     ClearDog ;
end;

end.

