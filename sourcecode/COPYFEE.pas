unit COPYFEE;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Grids, DBGrids, Db, DBTables;

type
  TCOPYFEEDlg = class(TForm)
    Bevel1: TBevel;
    FEEGROUP: TTable;
    FEEGROUPID: TSmallintField;
    FEEGROUPBH: TStringField;
    FEEGROUPMC: TStringField;
    DataSourceFEEGROUP: TDataSource;
    DBGridFEEGROUP: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Table1: TTable;
    Table2: TTable;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  COPYFEEDlg: TCOPYFEEDlg;

implementation

uses main ;

{$R *.DFM}

procedure TCOPYFEEDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Table1.Close ;
     Table2.Close ;
     FEEGROUP.Filter := '' ;
     FEEGROUP.Filtered := FALSE ;
     FEEGROUP.Close ;
end;

procedure TCOPYFEEDlg.FormShow(Sender: TObject);
begin
     Edit1.Text := '' ;
     Edit2.Text := '' ;
     Table1.Close ;
     Table2.Close ;
     FEEGROUP.Close ;
     FEEGROUP.Filter := 'ID='+IntToStr(Self.Tag) ;
     FEEGROUP.Filtered := TRUE ;
     FEEGROUP.Open ;
     FEEGROUP.First ;
end;

procedure TCOPYFEEDlg.SpeedButton1Click(Sender: TObject);
begin
     Edit1.Text := FEEGROUP.FieldByName('BH').AsString ;
end;

procedure TCOPYFEEDlg.SpeedButton2Click(Sender: TObject);
begin
     Edit2.Text := FEEGROUP.FieldByName('BH').AsString ;
end;

procedure TCOPYFEEDlg.BitBtn1Click(Sender: TObject);
begin
     if (Edit1.Text=Edit2.Text) then
     begin
          Application.MessageBox( '对不起,您选择的编号一致!',
                                  pChar(AppName),
                                  MB_OK or MB_ICONSTOP ) ;
          exit ;
     end ;
     Table1.Close ;
     Table2.Close ;
     Table1.TableName := Edit1.Text ;
     Table2.TableName := Edit2.Text ;
     Table2.BatchMove( Table1, batCopy ) ;
end;

procedure TCOPYFEEDlg.BitBtn2Click(Sender: TObject);
begin
     Self.Close ;
end;

end.
