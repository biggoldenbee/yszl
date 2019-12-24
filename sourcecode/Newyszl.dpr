program newyszl;

uses
  Forms,
  main in 'main.pas' {MainForm},
  MANPRJ in 'MANPRJ.pas' {ManPrjDlg},
  YSZLDBS in 'YSZLDBS.pas' {Dbs: TDataModule},
  NEWXMT in 'NEWXMT.pas' {NewXmtDlg},
  NEWDXGC in 'NEWDXGC.pas' {NewDxgcDlg},
  NEWDWGC in 'NEWDWGC.pas' {NewDwgcDlg},
  MANDWGC in 'MANDWGC.pas' {ManDWGCDlg},
  STREE in 'STREE.pas' {STreeViewDlg},
  SDRIVE in 'SDRIVE.pas' {SDriveDlg},
  COPYDLG in 'COPYDLG.pas' {CopyFileDlg},
  SHOWTREE in 'SHOWTREE.pas' {ShowTreeDlg},
  Wait in 'Wait.pas' {WaitDlg},
  MODIZD in 'MODIZD.pas' {ModiZDDlg},
  FORTRAN in 'FORTRAN.pas' {ForTranDlg},
  Hdtz in 'Hdtz.pas' {HDTZDlg},
  Splash in 'Splash.pas' {SplashForm},
  About in 'About.pas' {AboutBox},
  dogutil in 'dogutil.pas',
  DECZ in 'DECZ.pas',
  Ingcl in 'Ingcl.pas' {INGCLDlg},
  Wjj in 'Wjj.pas' {WJJDlg},
  DEMARCO in 'DEMARCO.pas',
  DEQUERY in 'DEQUERY.pas' {DEQueryDlg},
  Smmxx in 'Smmxx.pas' {SMMXXDlg},
  mmcl in 'mmcl.pas' {MMCLDlg},
  Dexx in 'dexx.pas' {DEXXDlg},
  CLQUERY in 'CLQUERY.pas' {CLQueryDlg},
  GZDJ in 'GZDJ.pas' {GZDJDlg},
  INGZDJ in 'INGZDJ.pas' {INGZDJDlg},
  CLLB in 'CLLB.pas' {CLLBDlg},
  INCLLB in 'INCLLB.pas' {INCLLBDlg},
  ADDCL in 'ADDCL.pas' {ADDCLDlg},
  CLXX in 'CLXX.pas' {CLXXDlg},
  SCL in 'SCL.pas' {SCLDlg},
  BCDE in 'BCDE.pas' {BCDEDlg},
  ZDTX in 'ZDTX.pas' {ZDTXDlg},
  SDE in 'SDE.pas' {SDEDlg},
  Lsgs in 'Lsgs.pas' {LSGSDlg},
  XZZD in 'XZZD.pas' {XZZDDlg},
  SWJJCL in 'SWJJCL.pas' {SWJJCLDlg},
  DEHS in 'DEHS.pas' {DEHSDlg},
  TDJ in 'TDJ.pas' {TDJDlg},
  SPT in 'SPT.pas' {SPTDlg},
  TSELECT in 'TSELECT.pas' {TSELECTDlg},
  XTJHSPT in 'XTJHSPT.pas' {XJTHSPTDlg},
  INSPT in 'INSPT.pas' {INSPTDlg},
  ZZJ in 'ZZJ.PAS' {ZZJDlg},
  Price in 'Price.pas' {PriceDlg},
  XXJ in 'XXJ.pas' {XXJDlg},
  Jsj in 'Jsj.pas' {JsjDlg},
  SFL in 'SFL.pas' {SFLDlg},
  COPYFEE in 'COPYFEE.pas' {COPYFEEDlg},
  RFORM1 in 'RFORM1.pas' {RptForm1},
  RFORM2 in 'RFORM2.pas' {RptForm2},
  RFORM0 in 'RFORM0.pas' {RptForm0},
  RFORM3 in 'RFORM3.pas' {RptForm3},
  RFORM4 in 'RFORM4.pas' {RptForm4},
  RFORM5 in 'RFORM5.pas' {RptForm5},
  RFORM6 in 'RFORM6.pas' {RptForm6},
  RFORM7 in 'RFORM7.pas' {RptForm7},
  RFORM8 in 'RFORM8.pas' {RptForm8},
  RFORM9 in 'RFORM9.pas' {RptForm9},
  RFORM10 in 'RFORM10.pas' {RptForm10},
  RFORM11 in 'RFORM11.pas' {RptForm11},
  RFORM12 in 'RFORM12.pas' {RptForm12},
  RFORM13 in 'RFORM13.pas' {RptForm13},
  RFORM14 in 'RFORM14.pas' {RptForm14},
  RFORM15 in 'RFORM15.pas' {RptForm15},
  RFORM16 in 'RFORM16.pas' {RptForm16},
  MODIMB in 'MODIMB.pas' {MODIMBDlg},
  MANGCWJ in 'MANGCWJ.pas' {ManGCWJDlg};

{$R *.RES}

begin
  SplashForm := TSplashForm.Create(Application) ;
  SplashForm.Show ;
  SplashForm.Update ;
  Application.Initialize;
  Application.Title := '≥±”ø»Ìº˛÷Æ°∂‘§À„÷˙¿Ì°∑';
  Application.CreateForm(TDbs, Dbs);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TManPrjDlg, ManPrjDlg);
  Application.CreateForm(TNewXmtDlg, NewXmtDlg);
  Application.CreateForm(TNewDxgcDlg, NewDxgcDlg);
  Application.CreateForm(TNewDwgcDlg, NewDwgcDlg);
  Application.CreateForm(TManDWGCDlg, ManDWGCDlg);
  Application.CreateForm(TSTreeViewDlg, STreeViewDlg);
  Application.CreateForm(TSDriveDlg, SDriveDlg);
  Application.CreateForm(TCopyFileDlg, CopyFileDlg);
  Application.CreateForm(TShowTreeDlg, ShowTreeDlg);
  Application.CreateForm(TWaitDlg, WaitDlg);
  Application.CreateForm(TModiZDDlg, ModiZDDlg);
  Application.CreateForm(TForTranDlg, ForTranDlg);
  Application.CreateForm(THDTZDlg, HDTZDlg);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TINGCLDlg, INGCLDlg);
  Application.CreateForm(TWJJDlg, WJJDlg);
  Application.CreateForm(TDEQueryDlg, DEQueryDlg);
  Application.CreateForm(TSMMXXDlg, SMMXXDlg);
  Application.CreateForm(TMMCLDlg, MMCLDlg);
  Application.CreateForm(TDEXXDlg, DEXXDlg);
  Application.CreateForm(TCLQueryDlg, CLQueryDlg);
  Application.CreateForm(TGZDJDlg, GZDJDlg);
  Application.CreateForm(TINGZDJDlg, INGZDJDlg);
  Application.CreateForm(TCLLBDlg, CLLBDlg);
  Application.CreateForm(TINCLLBDlg, INCLLBDlg);
  Application.CreateForm(TADDCLDlg, ADDCLDlg);
  Application.CreateForm(TCLXXDlg, CLXXDlg);
  Application.CreateForm(TSCLDlg, SCLDlg);
  Application.CreateForm(TBCDEDlg, BCDEDlg);
  Application.CreateForm(TZDTXDlg, ZDTXDlg);
  Application.CreateForm(TSDEDlg, SDEDlg);
  Application.CreateForm(TLSGSDlg, LSGSDlg);
  Application.CreateForm(TXZZDDlg, XZZDDlg);
  Application.CreateForm(TSWJJCLDlg, SWJJCLDlg);
  Application.CreateForm(TDEHSDlg, DEHSDlg);
  Application.CreateForm(TTDJDlg, TDJDlg);
  Application.CreateForm(TSPTDlg, SPTDlg);
  Application.CreateForm(TTSELECTDlg, TSELECTDlg);
  Application.CreateForm(TXJTHSPTDlg, XJTHSPTDlg);
  Application.CreateForm(TINSPTDlg, INSPTDlg);
  Application.CreateForm(TZZJDlg, ZZJDlg);
  Application.CreateForm(TPriceDlg, PriceDlg);
  Application.CreateForm(TXXJDlg, XXJDlg);
  Application.CreateForm(TJsjDlg, JsjDlg);
  Application.CreateForm(TSFLDlg, SFLDlg);
  Application.CreateForm(TCOPYFEEDlg, COPYFEEDlg);
  Application.CreateForm(TRptForm0, RptForm0);
  Application.CreateForm(TRptForm1, RptForm1);
  Application.CreateForm(TRptForm2, RptForm2);
  Application.CreateForm(TRptForm3, RptForm3);
  Application.CreateForm(TRptForm4, RptForm4);
  Application.CreateForm(TRptForm5, RptForm5);
  Application.CreateForm(TRptForm6, RptForm6);
  Application.CreateForm(TRptForm7, RptForm7);
  Application.CreateForm(TRptForm8, RptForm8);
  Application.CreateForm(TRptForm9, RptForm9);
  Application.CreateForm(TRptForm10, RptForm10);
  Application.CreateForm(TRptForm11, RptForm11);
  Application.CreateForm(TRptForm12, RptForm12);
  Application.CreateForm(TRptForm13, RptForm13);
  Application.CreateForm(TRptForm14, RptForm14);
  Application.CreateForm(TRptForm15, RptForm15);
  Application.CreateForm(TRptForm16, RptForm16);
  Application.CreateForm(TMODIMBDlg, MODIMBDlg);
  Application.CreateForm(TManGCWJDlg, ManGCWJDlg);
  SplashForm.Destroy ;
  Application.Run;
end.
