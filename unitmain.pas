unit UnitMain;

interface

uses
  {$ifdef darwin} RichMemoEx, {$endif}
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ExtCtrls, ComCtrls, IniFiles, LCLIntf, LCLType, LCLProc, ActnList,
  ClipBrd, StdActns, PrintersDlgs, Types, RichMemo, UnboundMemo, UnitType;

type

  { TMainForm }

  TMainForm = class(TForm)
    ActionInterline: TAction;
    IdleTimer: TIdleTimer;
    MenuItem4: TMenuItem;
    miInterlinear: TMenuItem;
    pmInterlinear: TMenuItem;
    miTranslate: TMenuItem;
    PrintDialog: TPrintDialog;
    FontDialog: TFontDialog;
    FontDialogNotes: TFontDialog;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ToolSeparator1: TToolButton;
    ToolButtonVerses: TToolButton;
    ActionList: TActionList;
    ComboBox: TComboBox;
    FileOpen1: TFileOpen;
    EditCut1: TEditCut;

    MemoBible: TUnboundMemo;
    MemoSearch: TUnboundMemo;
    MemoCompare: TUnboundMemo;
    MemoNotes: TUnboundMemo;

    ActionCopyVerses: TAction;
    ActionEditSelAll: TEditSelectAll;
    ActionFont: TAction;
    ActionOptions: TAction;
    ActionBullets: TAction;
    ActionRight: TAction;
    ActionCenter: TAction;
    ActionLeft: TAction;
    ActionLink: TAction;
    ActionUnderline: TAction;
    ActionItalic: TAction;
    ActionBold: TAction;
    ActionCompare: TAction;
    ActionEditCopy: TAction;
    ActionEditCut: TAction;
    ActionEditDel: TAction;
    ActionEditFont: TAction;
    ActionEditPaste: TAction;
    ActionEditUndo: TAction;
    ActionExit: TAction;
    ActionFileNew: TAction;
    ActionFileOpen: TAction;
    ActionFilePrint: TAction;
    ActionFileSaveAs: TAction;
    ActionFileSave: TAction;
    ActionAbout: THelpAction;
    ActionSearch: TAction;
    ActionCopyAs: TAction;
    ActionTrans: TAction;

    ChapterBox: TListBox;
    BookBox: TListBox;
    MenuItem1: TMenuItem;
    Ruler: TPanel;
    PanelLeft: TPanel;
    Splitter: TSplitter;
    StatusBar: TStatusBar;
    Images: TImageList;

    PageControl: TPageControl;
    TabSheetBible: TTabSheet;
    TabSheetSearch: TTabSheet;
    TabSheetCompare: TTabSheet;
    TabSheetNotes: TTabSheet;

    MainMenu: TMainMenu;
    miNoteNew: TMenuItem;
    miNoteOpen: TMenuItem;
    miNoteSave: TMenuItem;
    miNoteSaveAs: TMenuItem;
    miHelpAbout: TMenuItem;
    miTools: TMenuItem;
    miDownload: TMenuItem;
    miHome: TMenuItem;
    miNotes: TMenuItem;
    miHelp: TMenuItem;
    miEdit: TMenuItem;
    miCopyAs: TMenuItem;
    miSelectAll: TMenuItem;
    miClear: TMenuItem;
    miPaste: TMenuItem;
    miCopy: TMenuItem;
    miCut: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    miUndo: TMenuItem;
    miExit: TMenuItem;
    miLocalization: TMenuItem;
    miOptions: TMenuItem;
    miPrint: TMenuItem;
    miCompare: TMenuItem;
    miSearch: TMenuItem;
    miBibleFolder: TMenuItem;
    miReopen: TMenuItem;
    miInformation: TMenuItem;
    N9: TMenuItem;
    miManual: TMenuItem;
    miVerses: TMenuItem;

    PopupMenu: TPopupMenu;
    pmCut: TMenuItem;
    pmCopy: TMenuItem;
    pmPaste: TMenuItem;
    pmCopyAs: TMenuItem;
    pmVerses: TMenuItem;

    StandardToolBar: TToolBar;
    ToolButtonFB: TToolButton;
    ToolSeparator2: TToolButton;
    ToolButtonNew: TToolButton;
    ToolButtonOpen: TToolButton;
    ToolButtonSave: TToolButton;
    ToolButtonPrint: TToolButton;
    ToolButtonSearch: TToolButton;
    ToolSeparator3: TToolButton;
    ToolButtonCut: TToolButton;
    ToolButtonCopy: TToolButton;
    ToolButtonPaste: TToolButton;
    ToolButtonUndo: TToolButton;
    ToolSeparator4: TToolButton;
    ToolButtonCompare: TToolButton;
    ToolButtonFont: TToolButton;
    ToolSeparator5: TToolButton;
    ToolButtonBold: TToolButton;
    ToolButtonItalic: TToolButton;
    ToolButtonUnderline: TToolButton;
    ToolButtonLink: TToolButton;
    ToolButtonLeft: TToolButton;
    ToolButtonCenter: TToolButton;
    ToolButtonRight: TToolButton;
    ToolButtonBullets: TToolButton;

    procedure CmdInterline(Sender: TObject);
    procedure CmdCompare(Sender: TObject);
    procedure CmdOptions(Sender: TObject);
    procedure CmdStyle(Sender: TObject);
    procedure CmdAbout(Sender: TObject);
    procedure CmdSearch(Sender: TObject);
    procedure CmdTrans(Sender: TObject);
    procedure CmdEdit(Sender: TObject);
    procedure CmdFileNew(Sender: TObject);
    procedure CmdFileOpen(Sender: TObject);
    procedure CmdFileSave(Sender: TObject);
    procedure CmdFileSaveAs(Sender: TObject);
    procedure CmdFilePrint(Sender: TObject);
    procedure CmdExit(Sender: TObject);
    procedure CmdStyle2(Sender: TObject);
    procedure CmdCopyVerses(Sender: TObject);
    procedure CmdCopyAs(Sender: TObject);

    procedure ComboBoxChange(Sender: TObject);
    procedure ComboBoxDrawItem(Control: TWinControl; Index: integer; ARect: TRect; State: TOwnerDrawState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IdleTimerTimer(Sender: TObject);
    procedure BookBoxClick(Sender: TObject);
    procedure ChapterBoxClick(Sender: TObject);
    procedure MemoContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure MemoBibleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MemoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure MemoNotesAttrChange;
    procedure miBibleFolderClick(Sender: TObject);
    procedure miDownloadClick(Sender: TObject);
    procedure miHomeClick(Sender: TObject);
    procedure miManualClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure RadioButtonClick(Sender: TObject);
    procedure ToolButtonFBClick(Sender: TObject);
  private
    NoteFileName: string;
    ReopenMax: integer;
    ReopenList: TStringList;
    {$ifdef darwin} bag01 : boolean; {$endif}
    {$ifdef darwin} bag02 : boolean; {$endif}
    {$ifdef linux } IdleMessage : string; {$endif}
    function UnboundMemo: TUnboundMemo;
    function CheckFileSave: boolean;
    procedure ComboBoxInit;
    {$ifdef darwin} procedure ComboBoxSetIndex; {$endif}
    procedure EnableButtons;
    procedure UpDownButtons;
    procedure SelectBook(title: string);
    procedure GoToVerse(Verse: TVerse; select: boolean);
    procedure LangMenuInit;
    procedure LoadChapter;
    procedure LoadCompare;
    procedure LoadTranslate(Verse: TVerse);
    procedure MakeBookList;
    procedure MakeChapterList(n: integer);
    {$ifdef darwin} procedure ScrollBoxes; {$endif}
    procedure OnLangClick(Sender: TObject);
    procedure OnReopenClick(Sender: TObject);
    procedure PerformFileOpen(const FileName: string);
    procedure ReadIniFile;
    procedure RebuildReopenList;
    procedure ReopenMenuInit;
    procedure SaveIniFile;
    procedure SearchText(s: string);
    procedure SelectPage(page: integer);
    procedure Translate;
    procedure UpdateCaption(s: string);
    procedure UpdateStatus(s: string);
    procedure UpdateActionImage;
    procedure VersesToClipboard;
    procedure ShowPopup;
    {$ifdef darwin} procedure UpdateMenuImage; {$endif}
    {$ifdef darwin} procedure UpdateShortCut; {$endif}
  public
    procedure TranslateAll;
  end;

var
  MainForm: TMainForm;
  ShortLink: boolean;
  FBPageVisited: boolean;

implementation

uses
  UnitAbout, UnitSearch, UnitCompare, UnitTool,
  UnitStream, UnitLib, UnitLang, UnitShelf, UnitCopy, UnitTrans;

resourcestring
  sUntitled = 'Untitled';

const
  ms_Save : string = '';
  ms_OverWrite : string = '';
  ms_found : string = '';
  ms_loading : string = '';
  ms_Confirm : string = '';

{$R *.lfm}

procedure TMainForm.ComboBoxInit;
var
  i : integer;
begin
  ComboBox.Items.Clear;

  for i := 0 to Shelf.Count - 1 do
  begin
    ComboBox.Items.Add(Shelf[i].Name);
    {$ifndef darwin} if i = Shelf.Current then ComboBox.ItemIndex := i; {$endif}
  end;
end;

{$ifdef darwin}
procedure TMainForm.ComboBoxSetIndex;
var
  i : integer;
begin
  for i := 0 to Shelf.Count - 1 do
    if i = Shelf.Current then ComboBox.ItemIndex := i;
end;
{$endif}

procedure TMainForm.UpdateCaption(s: string);
begin
  Caption := AppName + ' ' + VersionInfo + ' - ' + s;
end;

procedure TMainForm.UpdateStatus(s: string);
begin
  StatusBar.SimpleText := '  ' + s;
end;

procedure TMainForm.ShowPopup;
var
  CursorPos: TPoint;
begin
  GetCursorPos(CursorPos);
  PopupMenu.Popup(CursorPos.X, CursorPos.Y);
end;

//----------------------------------------------------------------------------------------
//                                   memo's events
//----------------------------------------------------------------------------------------

procedure TMainForm.MemoBibleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
    begin
      ActiveVerse.Number := MemoBible.ParagraphStart;
      ActiveVerse.Count  := MemoBible.ParagraphCount;
      if FormTranslate.Visible then LoadTranslate(ActiveVerse);
    end;

  if Button = mbRight then
    begin
      {$ifdef darwin} MemoBible.RestoreSelection; {$endif}
      ShowPopup;
    end;

  {$ifdef darwin} if Button = mbLeft then MemoBible.SaveSelection; {$endif}
end;

procedure TMainForm.MemoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  Verse : TVerse;
  s : string;
begin
  if Button = mbRight then ShowPopup;

  if Button <> mbLeft then Exit;
  if Shelf.Count = 0  then Exit;

  s := (Sender as TUnboundMemo).hyperlink;
  Verse := Bible.SrtToVerse(s);
  if Verse.Book = 0 then Exit;

  if FormTranslate.Visible then LoadTranslate(Verse);

  if (Sender = MemoSearch) or (not FormTranslate.Visible) or (ssCtrl in Shift)
    then GoToVerse(Verse, True);
end;

procedure TMainForm.MemoNotesAttrChange;
begin
  UpDownButtons;
end;

procedure TMainForm.MemoContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True; // disable system popup menu
end;

//----------------------------------------------------------------------------------------

procedure TMainForm.SelectBook(title: string);
var
  i, index : integer;
begin
  index := -1;
  for i:=0 to BookBox.Items.Count-1 do
    if BookBox.Items[i] = title then index := i;

  if index < 0 then Exit;

  BookBox.ItemIndex := index;
  ChapterBox.ItemIndex := ActiveVerse.Chapter - 1;
  {$ifdef darwin} ScrollBoxes; {$endif}
end;

procedure TMainForm.GoToVerse(Verse: TVerse; select: boolean);
var
  Book : TBook;
begin
  {$ifdef darwin} bag02 := True; {$endif}
  Book := Bible.BookByNum(Verse.Book);
  if Book = nil then Exit;

  ActiveVerse := Verse;
  LoadChapter;
  SelectBook(Book.title);
  ChapterBox.ItemIndex := Verse.Chapter - 1;

  if select then MemoBible.SelectParagraph(Verse.Number);
  {$ifdef darwin} bag02 := False; {$endif}
  Repaint;
end;

procedure TMainForm.Translate;
begin
  miTools.Caption := T('Menu.Tools');
  miEdit.Caption := T('Menu.Edit');
//miBible.Caption := T('Menu.Bible');
  miNotes.Caption := T('Menu.Notes');
  miHelp.Caption := T('Menu.Help');
  miSearch.Caption := T('Menu.Search') + '...';
  miCompare.Caption := T('Compare.Caption') + '...';
  miTranslate.Caption := T('Menu.Translate');
  miInterlinear.Caption := T('Menu.Interlinear');
  miPrint.Caption := T('Menu.Print');
  miOptions.Caption := T('Menu.Font') + '...';
  miLocalization.Caption := T('Menu.Localization');
//miLangEdit.Caption := T('Menu.LangEdit');
  miExit.Caption := T('Menu.Exit');
  miUndo.Caption := T('Menu.Undo');
  miCut.Caption := T('Menu.Cut');
  miCopy.Caption := T('Menu.Copy');
  miPaste.Caption := T('Menu.Paste');
  miClear.Caption := T('Menu.Clear');
  miSelectAll.Caption := T('Menu.SelectAll');
  miCopyAs.Caption := T('Menu.CopyAs') + '...';
  miVerses.Caption := T('Menu.Verses');
  miNoteNew.Caption := T('Menu.New');
  miNoteOpen.Caption := T('Menu.Open') + '...';
  miNoteSave.Caption := T('Menu.Save');
  miNoteSaveAs.Caption := T('Menu.SaveAs') + '...';
  miReopen.Caption := T('Menu.Reopen');

  miInformation.Caption := T('Menu.Info');
  miManual.Caption := T('Menu.Manual');
  miHome.Caption := T('Menu.HomePage');
//miUBPage.Caption := T('Menu.UBPage');
  miDownload.Caption := T('Menu.Download');
  miBibleFolder.Caption := T('Menu.BibleFolder');
  miHelpAbout.Caption := T('Menu.About');

  pmCut.Caption := T('Menu.Cut');
  pmCopy.Caption := T('Menu.Copy');
  pmPaste.Caption := T('Menu.Paste');
  pmCopyAs.Caption := T('Menu.CopyAs') + '...';
  pmVerses.Caption := T('Menu.Verses');
  pmInterlinear.Caption := T('Menu.Interlinear') + ' (biblehub.com)';

  TabSheetBible.Caption := TT('Menu.Bible');
  TabSheetSearch.Caption := TT('Menu.Search');
  TabSheetCompare.Caption := TT('Menu.Compare');
  TabSheetNotes.Caption := TT('Menu.Notes');

//ToolButtonInfo.Hint := T('Menu.Info');
  ToolButtonNew.Hint := T('Menu.New');
  ToolButtonOpen.Hint := T('Menu.Open');
  ToolButtonSave.Hint := T('Menu.Save');
  ToolButtonPrint.Hint := T('Menu.Print');
  ToolButtonSearch.Hint := T('Menu.Search');
  ToolButtonCut.Hint := T('Menu.Cut');
  ToolButtonCopy.Hint := T('Menu.Copy');
  ToolButtonVerses.Hint := T('Menu.Verses');
  ToolButtonPaste.Hint := T('Menu.Paste');
  ToolButtonUndo.Hint := T('Menu.Undo');
  ToolButtonCompare.Hint := T('Compare.Caption');

  ToolButtonFont.Hint := T('Main.FontName');
  ToolButtonBold.Hint := T('Main.Bold');
  ToolButtonItalic.Hint := T('Main.Italic');
  ToolButtonUnderline.Hint := T('Main.Underline');
  ToolButtonLink.Hint := T('Main.Link');
  ToolButtonLeft.Hint := T('Main.Left');
  ToolButtonCenter.Hint := T('Main.Center');
  ToolButtonRight.Hint := T('Main.Right');
  ToolButtonBullets.Hint := T('Main.Bullets');

  ms_Save := T('Message.Save');
  ms_OverWrite := T('Message.OverWrite');
  ms_loading := T('Message.Loading') + '...';
  ms_found := T('Message.Found');
  ms_Confirm := T('Message.Confirm');
end;

function TMainForm.CheckFileSave: boolean;
var
  Response : integer;
begin
  Result := True;

  if not MemoNotes.Modified then Exit;
  SelectPage(apNotes);

  {$ifdef windows}
    Response := MessageBox(Handle, PChar(ms_Save), PChar(ms_Confirm), MB_YESNOCANCEL or MB_ICONQUESTION);
  {$else}
    Response := MessageDlg(ms_Save, mtConfirmation, mbYesNoCancel, 0);
    // этот вариант рисует кнопки с картинками
  {$endif}

  // remake!!
  case Response of
    idYes:
    begin
      CmdFileSave(self);
      Result := not MemoNotes.Modified;
    end;
    idNo: {Nothing};
    idCancel: Result := False; // Abort;
  end;
end;

procedure TMainForm.OnLangClick(Sender: TObject);
var
  i: integer;
begin
  facelang := LowerCase((Sender as TMenuItem).Caption);

  for i := 0 to miLocalization.Count - 1 do
    miLocalization.Items[i].Checked := False;
  (Sender as TMenuItem).Checked := True;

  TranslateAll;
end;

procedure TMainForm.OnReopenClick(Sender: TObject);
var i: integer;
begin
  for i := 0 to miReopen.Count - 1 do
    if (Sender as TMenuItem).tag = i then
      if CheckFileSave then
        PerformFileOpen(ReopenList[i]);
end;

procedure TMainForm.LangMenuInit;
var
  List: TStringList;
  Checked: boolean;
  s: string;
  i: integer;
begin
  List := TStringList.Create;

  GetFileList(AppLocation + Slash + LangDirectory + Slash + '*.lng', List, False);
  List.Sort;

  for i := 0 to List.Count - 1 do
  begin
    s := OneUpCase(List[i]);
    Checked := (List[i] = FaceLang);
    miLocalization.Insert(i, NewItem(s, 0, Checked, True, OnLangClick, 0, ''));
  end;

  List.Free;
end;

procedure TMainForm.ReopenMenuInit;
var
  Item : TMenuItem;
  s : string;
  i : integer;
begin
  miReopen.Enabled := ReopenList.Count > 0;
  miReopen.Clear;

  for i := ReopenList.Count - 1 downto 0 do
    begin
      s := ExtractOnlyName(ReopenList[i]);
      Item := NewItem(s, 0, False, True, OnReopenClick, 0, '');
      Item.Tag := i;
      miReopen.Add(Item);
    end;
end;

function TMainForm.UnboundMemo: TUnboundMemo;
begin
  case PageControl.ActivePageIndex of
    apBible   : Result := MemoBible;
    apSearch  : Result := MemoSearch;
    apCompare : Result := MemoCompare;
    apNotes   : Result := MemoNotes;
    else
      Result := nil;
  end;
end;

procedure TMainForm.EnableButtons;
var
  B, L: boolean;
begin
  B := PageControl.ActivePageIndex = apBible;
  L := PageControl.ActivePageIndex = apNotes;

  ActionEditCut.Enabled := L;
  ActionEditPaste.Enabled := L;
  ActionEditDel.Enabled := L;
  ActionEditUndo.Enabled := L;

  ActionFont.Enabled := L;
  ActionBold.Enabled := L;
  ActionItalic.Enabled := L;
  ActionUnderline.Enabled := L;
  ActionLink.Enabled := L;
  ActionLeft.Enabled := L;
  ActionCenter.Enabled := L;
  ActionRight.Enabled := L;
  ActionBullets.Enabled := L;

  ActionCopyAs.Enabled := B;
  ActionCopyVerses.Enabled := B;

  UpdateActionImage;
end;

procedure TMainForm.UpDownButtons;
{$ifdef windows} var ParaNumbering : TParaNumbering; {$endif}
begin
  if PageControl.ActivePageIndex <> apNotes then Exit;

  with MemoNotes do
    try
      ToolButtonBold.Down := fsBold in SelAttributes.Style;
      ToolButtonItalic.Down := fsItalic in SelAttributes.Style;
      ToolButtonUnderline.Down := fsUnderline in SelAttributes.Style;
      ToolButtonLink.Down := clNavy = SelAttributes.Color;

      {$ifdef windows}

      case GetParaAlignment(SelStart) of
        paLeft: ToolButtonLeft.Down := True;
        paRight: ToolButtonRight.Down := True;
        paCenter: ToolButtonCenter.Down := True;
      end;

      GetParaNumbering(SelStart, ParaNumbering );
      ToolButtonBullets.Down := ParaNumbering.Style = pnBullet;

      {$endif}

      ActionEditUndo.Enabled := CanUndo;
    except
      //
    end;
end;

procedure TMainForm.UpdateActionImage;
var i: integer;
begin
  with ActionList do
    for i := 0 to ActionCount - 1 do
      if TAction(Actions[i]).Tag > 0 then
        if TAction(Actions[i]).Enabled
          then TAction(Actions[i]).ImageIndex := TAction(Actions[i]).Tag
          else TAction(Actions[i]).ImageIndex := TAction(Actions[i]).Tag + 1;
end;

{$ifdef darwin}
procedure TMainForm.UpdateMenuImage;
var
  i,j : integer;
begin
  with MainMenu do
    for i:=0 to Items.Count-1 do
      for j:=0 to Items[i].Count-1 do
        Items[i].Items[j].ImageIndex := -1; // Bitmap := nil;

  with PopupMenu do
    for i:=0 to Items.Count-1 do Items[i].ImageIndex := -1;
end;
{$endif}

{$ifdef darwin}
procedure TMainForm.UpdateShortCut;
begin
  ActionSearch    .ShortCut := ShortCut(VK_F, [ssMeta]);
  ActionEditUndo  .ShortCut := ShortCut(VK_Z, [ssMeta]);
  ActionEditCut   .ShortCut := ShortCut(VK_X, [ssModifier]);
  ActionEditCopy  .ShortCut := ShortCut(VK_C, [ssMeta]);
  ActionCopyVerses.ShortCut := ShortCut(VK_R, [ssMeta]);
  ActionEditPaste .ShortCut := ShortCut(VK_V, [ssMeta]);
  ActionEditSelAll.ShortCut := ShortCut(VK_A, [ssMeta]);
  ActionFileNew   .ShortCut := ShortCut(VK_N, [ssMeta]);
  ActionFileOpen  .ShortCut := ShortCut(VK_O, [ssMeta]);
  ActionFileSave  .ShortCut := ShortCut(VK_S, [ssMeta]);
  ActionFilePrint .ShortCut := ShortCut(VK_P, [ssMeta]);
  ActionBold      .ShortCut := ShortCut(VK_B, [ssMeta]);
  ActionItalic    .ShortCut := ShortCut(VK_I, [ssMeta]);
  ActionUnderline .ShortCut := ShortCut(VK_U, [ssMeta]);
  ActionLink      .ShortCut := ShortCut(VK_K, [ssMeta]);
end;
{$endif}

procedure TMainForm.RebuildReopenList;
var
  i: integer;
begin
  for i := 0 to ReopenList.Count - 1 do
    if ReopenList[i] = NoteFileName then
    begin
      ReopenList.Delete(i);
      Break;
    end;

  ReopenList.Add(NoteFileName);
  if ReopenList.Count > ReopenMax then ReopenList.Delete(0);
  ReopenMenuInit;
end;

procedure TMainForm.PerformFileOpen(const FileName: string);
begin
  if not FileExists(FileName) then Exit;
  MemoNotes.LoadFromFile(FileName);
  NoteFileName := FileName;
  RebuildReopenList;
  SelectPage(apNotes);
  MemoNotes.SetFocus;
  MemoNotes.Modified := False;
  UpdateCaption(ExtractOnlyName(NoteFileName));
end;

procedure TMainForm.SelectPage(page: integer);
begin
  PageControl.ActivePageIndex := page;
  EnableButtons;
  Refresh;
  if page <> apNotes then UnboundMemo.HideCursor;
end;

//=================================================================================================
//                                       Actions
//=================================================================================================

procedure TMainForm.CmdAbout(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.CmdStyle(Sender: TObject);
var
  fp: TFontParams;
  tempStart, tempLength: integer;
begin
  fp := MemoNotes.SelAttributes;

  tempStart  := MemoNotes.SelStart;
  tempLength := MemoNotes.SelLength;

  if MemoNotes.SelLength = 0 then MemoNotes.SelectWord;

  if Sender = ActionBold then
    if fsBold in fp.Style then fp.Style := fp.Style - [fsBold]
                          else fp.Style := fp.Style + [fsBold];

  if Sender = ActionItalic then
    if fsItalic in fp.Style then fp.Style := fp.Style - [fsItalic]
                            else fp.Style := fp.Style + [fsItalic];

  if Sender = ActionUnderline then
    if fsUnderline in fp.Style then fp.Style := fp.Style - [fsUnderline]
                               else fp.Style := fp.Style + [fsUnderline];

  if Sender = ActionLink then
    if fp.Color = clNavy then fp.Color := clBlack
                         else fp.Color := clNavy;

  if Sender = ActionFont then
  begin
    FontDialogNotes.Font.Name  := fp.Name;
    FontDialogNotes.Font.Size  := fp.Size;
    FontDialogNotes.Font.Style := fp.Style;
    FontDialogNotes.Font.Color := fp.Color;

    if FontDialogNotes.Execute then
    begin
      fp.Name  := FontDialogNotes.Font.Name;
      fp.Size  := FontDialogNotes.Font.Size;
      fp.Style := FontDialogNotes.Font.Style;
      fp.Color := FontDialogNotes.Font.Color;
    end;
  end;

  MemoNotes.SelAttributes := fp;

  MemoNotes.SelStart := tempStart; // unselect word
  MemoNotes.SelLength := tempLength;

  MemoNotes.Repaint;
end;

procedure TMainForm.CmdStyle2(Sender: TObject);
{$ifdef windows} var ParaNumbering : TParaNumbering; {$endif}
begin
  {$ifdef windows}
  with MemoNotes do
    begin
      if Sender = ActionLeft    then SetParaAlignment(SelStart, SelLength, paLeft   );
      if Sender = ActionCenter  then SetParaAlignment(SelStart, SelLength, paCenter );
      if Sender = ActionRight   then SetParaAlignment(SelStart, SelLength, paRight  );

      if Sender = ActionBullets then
        begin
          GetParaNumbering(SelStart, ParaNumbering );
          if ToolButtonBullets.Down
            then ParaNumbering.Style := pnBullet
            else ParaNumbering.Style := pnNone;
          SetParaNumbering(SelStart, SelLength, ParaNumbering );
        end;
    end;

  MemoNotes.Repaint;
  {$endif}
end;

procedure TMainForm.ComboBoxChange(Sender: TObject);
var
  select : boolean;
begin
  Shelf.SetCurrent(ComboBox.ItemIndex);
  UpdateStatus(Bible.Info);
  MakeBookList;

  select := MemoBible.Selected;
  if Bible.BookByNum(ActiveVerse.Book) = nil then select := false;
  if not select then ActiveVerse := Bible.FirstVerse;

  {$ifdef linux}
    if select then IdleMessage := 'GotoVerse(ActiveVerse,true)'
              else IdleMessage := 'GotoVerse(ActiveVerse,false)';
  {$else}
    GotoVerse(ActiveVerse,select);
  {$endif}
end;

procedure TMainForm.ComboBoxDrawItem(Control: TWinControl; Index: integer; ARect: TRect; State: TOwnerDrawState);
begin
  ComboBox.canvas.fillrect(ARect);
  Canvas.TextOut(ARect.Left + 5, ARect.Top, ComboBox.Items[Index]);
  Canvas.TextOut(ARect.Left + 220, ARect.Top, '[ru]');
end;

procedure TMainForm.CmdCompare(Sender: TObject);
begin
  if CompareForm.ShowModal = mrOk then LoadCompare;
end;

procedure TMainForm.CmdInterline(Sender: TObject);
var s : string;
begin
  if not (ActiveVerse.book in [1..66]) then Exit;
  s := BibleHubArray[ActiveVerse.book];
  s := s + '/' +  IntToStr(ActiveVerse.chapter) + '-' + IntToStr(ActiveVerse.number) + '.htm';
  OpenURL('http://biblehub.com/interlinear/' + s);
end;

procedure TMainForm.CmdEdit(Sender: TObject);
begin
  if Sender = ActionEditCut then
    begin
      UnboundMemo.CopyToClipboard;
      UnboundMemo.ClearSelection;
    end;

  if Sender = ActionEditCopy   then UnboundMemo.CopyToClipboard;
  if Sender = ActionEditPaste  then UnboundMemo.PasteFromClipboard;
  if Sender = ActionEditDel    then UnboundMemo.ClearSelection;
  if Sender = ActionEditSelAll then UnboundMemo.SelectAll;
  if Sender = ActionEditUndo   then UnboundMemo.Undo;
end;

procedure TMainForm.CmdCopyAs(Sender: TObject);
begin
  FormCopy.ShowModal;
  {$ifdef darwin} MemoBible.RestoreSelection; {$endif}
end;

procedure TMainForm.CmdCopyVerses(Sender: TObject);
begin
  VersesToClipboard;
end;

procedure TMainForm.CmdSearch(Sender: TObject);
begin
  SearchForm.Edit.Font.Name := CurrFont.Name;
  if SearchForm.ShowModal = mrOk then SearchText(SearchForm.Edit.Text);
end;

procedure TMainForm.CmdTrans(Sender: TObject);
begin
  FormTranslate.Show;
  LoadTranslate(ActiveVerse);
end;

procedure TMainForm.CmdFileNew(Sender: TObject);
begin
  SelectPage(apNotes);
  if not CheckFileSave then Exit;
  NoteFileName := sUntitled;
  MemoNotes.Lines.Clear;
  MemoNotes.Modified := False;
  UpdateCaption(NoteFileName);
end;

procedure TMainForm.CmdFileOpen(Sender: TObject);
begin
  if not CheckFileSave then Exit;
  if OpenDialog.Execute then
  begin
    PerformFileOpen(OpenDialog.FileName);
    MemoNotes.ReadOnly := ofReadOnly in OpenDialog.Options;
  end;
end;

procedure TMainForm.CmdFileSave(Sender: TObject);
begin
  SelectPage(apNotes);
  if not MemoNotes.Modified then Exit;
  if NoteFileName = sUntitled then
    CmdFileSaveAs(Sender)
  else
  begin
    MemoNotes.SaveToFile(NoteFileName);
    MemoNotes.Modified := False;
  end;
end;

procedure TMainForm.CmdFileSaveAs(Sender: TObject);
begin
  SelectPage(apNotes);

  if NoteFileName = sUntitled then SaveDialog.InitialDir := UserDocumentsPath
                              else SaveDialog.InitialDir := ExtractFilePath(NoteFileName);

  if SaveDialog.Execute then
  begin
    if Pos('.rtf', SaveDialog.FileName) = 0 then
      SaveDialog.FileName := SaveDialog.FileName + '.rtf';

    if FileExists(SaveDialog.FileName) then
      if MessageDlg(Format(ms_OverWrite, [SaveDialog.FileName]),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;

    MemoNotes.SaveToFile(SaveDialog.FileName);
    NoteFileName := SaveDialog.FileName;

    RebuildReopenList;

    MemoNotes.Modified := False;
    UpdateCaption(ExtractOnlyName(NoteFileName));
  end;
end;

procedure TMainForm.CmdFilePrint(Sender: TObject);
var
  prm : TPrintParams;
begin
  InitPrintParams(prm{%H-});
  if PrintDialog.Execute then UnboundMemo.Print(prm);
end;

procedure TMainForm.CmdExit(Sender: TObject);
begin
  Close
end;

//=================================================================================================
//                                     Create Main Form
//=================================================================================================

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Caption := AppName + ' ' + VersionInfo + ' - Open Source Application';

  CreateDirectories;

  Shelf := TShelf.Create;
  ReopenList := TStringList.Create;
  Shelf.Sort(Comparison);

  SaveDialog.InitialDir := UserDocumentsPath;

  NoteFileName := sUntitled;

  ReadIniFile;
  ComboBoxInit;
  LangMenuInit;
  ReopenMenuInit;

  if Shelf.Count > 0 then
  begin
    MakeBookList;
    ActiveVerse := Bible.FirstVerse;
    UpdateStatus(Bible.Info);
    // LoadChapter; // RichMemo doesn't load from Stream,
                    // so we call LoadChapter from FormActivate
  end;

  if Shelf.Count = 0 then
  begin
    ActionSearch .Enabled := False;
    ActionOptions.Enabled := False;
    ActionCompare.Enabled := False;
    ActionCopyAs .Enabled := False; // ??
  end;

  NoteFileName := sUntitled;
  MemoNotes.Lines.Clear;
  MemoNotes.Font.Size := CurrFont.Size;
  ToolButtonFB.Visible := not FBPageVisited;

  {$ifdef unix}
  ActionLeft    .Visible := False;
  ActionCenter  .Visible := False;
  ActionRight   .Visible := False;
  ActionBullets .Visible := False;
  ToolSeparator1.Visible := False;
  ToolSeparator2.Visible := False;
  ToolSeparator3.Visible := False;
  ToolSeparator4.Visible := False;
  ToolSeparator5.Visible := False;
  {$endif}

  {$ifdef darwin}
  bag01 := False;
  bag02 := False;

  ChapterBox.Width := ChapterBox.Width + 5;

  N4.Visible            := False;
  miExit.Visible        := False;
  ActionExit.Enabled    := False;

  UpdateMenuImage;
  UpdateShortCut;
  {$endif}

  {$ifdef linux}
  IdleMessage := '';
  IdleTimer.Enabled := true;
  {$endif}

  UpdateActionImage;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  if ChapterBox.Items.Count = 0 then LoadChapter; // first time
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  SaveIniFile;
  ReopenList.Free;
  Shelf.Free;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  try
    CanClose := CheckFileSave;
  except
    CanClose := False;
  end;
end;

procedure TMainForm.TranslateAll;
begin
  Lang := TLang.Create;

                Translate;
  SearchForm   .Translate;
  CompareForm  .Translate;
  AboutBox     .Translate;
  FormCopy     .Translate;
  FormTranslate.Translate;

  Lang.Free;
end;

procedure TMainForm.FormPaint(Sender: TObject);
{$ifdef darwin} var o : integer; {$endif}
begin
  ComboBox.Width := PanelLeft.Width - 14;

  BookBox.Top := ComboBox.Top + ComboBox.Height + 4;
  ChapterBox.Top := BookBox.Top;

  BookBox.Height := PanelLeft.Height - ComboBox.Top - ComboBox.Height - 10; // 5
  ChapterBox.Height := BookBox.Height;

  ChapterBox.Width := WidthInPixels('150') + 30;
  BookBox.Width := PanelLeft.Width - ChapterBox.Width - 18;
  ChapterBox.Left := PanelLeft.Width - ChapterBox.Width - 5; // + 5;

// StatusBar.Panels[3].Width := Width - 500;

  {$ifdef darwin}
  bag01 := True;

  o := BookBox.ItemIndex;
  if BookBox.Items.Count > 0 then BookBox.ItemIndex := 1;
  BookBox.ItemIndex := o;

  o := ChapterBox.ItemIndex;
  if ChapterBox.Items.Count > 0 then ChapterBox.ItemIndex := 1;
  ChapterBox.ItemIndex := o;

  bag01 := False;
  {$endif}

  // MemoNotes.SetEditRect;
  // Memo.HideCursor;
end;

procedure TMainForm.BookBoxClick(Sender: TObject);
var
  Book : TBook;
  s : string;
begin
  {$ifdef darwin} if bag01 or bag02 then Exit; {$endif}
  if BookBox.Count = 0 then Exit;
  s := BookBox.Items[BookBox.ItemIndex];

  Book := Bible.BookByName(s);
  if Book = nil then Exit;

  ActiveVerse.Book := Book.Number;
  ActiveVerse.Chapter := 1;
  ActiveVerse.Number := 1;
  ActiveVerse.Count := 1;

  ChapterBox.ItemIndex := 0;
  LoadChapter;
  UpdateStatus('');
end;

procedure TMainForm.ChapterBoxClick(Sender: TObject);
begin
  {$ifdef darwin} if bag01 or bag02 then Exit; {$endif}
  ActiveVerse.Chapter := ChapterBox.ItemIndex + 1;
  ActiveVerse.Number := 1;
  ActiveVerse.Count := 1;
  LoadChapter;
end;

procedure TMainForm.miBibleFolderClick(Sender: TObject);
begin
  OpenFolder(AppDataPath);
end;

procedure TMainForm.SaveIniFile;
var
  IniFile: TIniFile;
  i: integer;
begin
  if Shelf.Count = 0 then Exit;

  IniFile := TIniFile.Create(ConfigFile);

  if WindowState = wsNormal then
  begin
    IniFile.WriteInteger('Application', 'Left',   Left);
    IniFile.WriteInteger('Application', 'Top',    Top);
    IniFile.WriteInteger('Application', 'Width',  Width);
    IniFile.WriteInteger('Application', 'Height', Height);
  end;

  if WindowState = wsMaximized then IniFile.WriteString('Application', 'State', 'Maximized')
                               else IniFile.WriteString('Application', 'State', 'Normal');

  IniFile.WriteString('Application', 'FileName', Bible.FileName);
  IniFile.WriteString('Application', 'FontName', CurrFont.Name);
  IniFile.WriteInteger('Application', 'FontSize', CurrFont.Size);
  IniFile.WriteInteger('Application', 'Splitter', PanelLeft.Width);
  IniFile.WriteString('Application', 'Interface', FaceLang);
  IniFile.WriteBool('Application', 'ShortLink', ShortLink);
  IniFile.WriteInteger('Application', 'ReopenMax', ReopenMax);
  IniFile.WriteBool('Application', 'ShortLink', ShortLink);
  IniFile.WriteBool('Application', 'FBPage', FBPageVisited);
  IniFile.WriteBool('Options', 'cvAbbr', Options.cvAbbr);
  IniFile.WriteBool('Options', 'cvDelim', Options.cvDelim);
  IniFile.WriteBool('Options', 'cvEnd', Options.cvEnd);
  IniFile.WriteBool('Options', 'cvNum', Options.cvNum);
  IniFile.WriteBool('Options', 'cvWrap', Options.cvWrap);
  IniFile.WriteInteger('Reopen', 'Count', ReopenList.Count);

  for i := 0 to ReopenList.Count - 1 do
    IniFile.WriteString('Reopen', 'File_' + IntToStr(i), ReopenList[i]);

  IniFile.Free;
end;

function GetDefaultBible: string;
begin
  if GetDefaultLanguage = 'russian' then Result := 'russian.txt'
                                    else Result := 'english-kjv.txt';
end;

procedure TMainForm.ReadIniFile;
var
  IniFile: TIniFile;
  BibleFile: string;
  i, max: integer;
begin
  IniFile := TIniFile.Create(ConfigFile);
  {
  if IniFile.ReadString('Application', 'State', 'Normal') = 'Maximized'  // not working
    then WindowState := wsMaximized else WindowState := wsNormal;
  }
  BibleFile := IniFile.ReadString('Application', 'FileName', GetDefaultBible);

  Height := IniFile.ReadInteger('Application', 'Height', Screen.Height - 200);
  Width := IniFile.ReadInteger('Application', 'Width', Screen.Width - 400);
  Left := IniFile.ReadInteger('Application', 'Left', 200);
  Top := IniFile.ReadInteger('Application', 'Top', 70);

  CurrFont.Name := IniFile.ReadString('Application', 'FontName', CurrFont.Name);
  CurrFont.Size := IniFile.ReadInteger('Application', 'FontSize', CurrFont.Size);
  PanelLeft.Width := IniFile.ReadInteger('Application', 'Splitter', 250);
  FaceLang := IniFile.ReadString('Application', 'Interface', GetDefaultLanguage);
  ShortLink := IniFile.ReadBool('Application', 'ShortLink', True);
  ReopenMax := IniFile.ReadInteger('Application', 'ReopenMax', 5);
  FBPageVisited := IniFile.ReadBool('Application', 'FBPage', False);
  Options.cvAbbr := IniFile.ReadBool('Options', 'cvAbbr', False);
  Options.cvDelim := IniFile.ReadBool('Options', 'cvDelim', False);
  Options.cvEnd := IniFile.ReadBool('Options', 'cvEnd', False);
  Options.cvNum := IniFile.ReadBool('Options', 'cvNum', False);
  Options.cvWrap := IniFile.ReadBool('Options', 'cvWrap', False);
  Max := IniFile.ReadInteger('Reopen', 'Count', ReopenList.Count);

  for i := 0 to Max - 1 do
    ReopenList.Add(IniFile.ReadString('Reopen', 'File_' + IntToStr(i), ''));

  Shelf.SetCurrent(BibleFile);

  IniFile.Free;
end;

procedure TMainForm.miHomeClick(Sender: TObject);
begin
  if facelang = 'russian' then OpenURL('http://vladimirrybant.org/ru')
                          else OpenURL('http://vladimirrybant.org');
end;

procedure TMainForm.miManualClick(Sender: TObject);
begin
  if facelang = 'russian' then OpenURL('http://vladimirrybant.org/ru/index.php?page=bible-help')
                          else OpenURL('http://vladimirrybant.org/index.php?page=bible-help');
end;

procedure TMainForm.miDownloadClick(Sender: TObject);
begin
//OpenURL('http://vladimirrybant.org/index.php?page=download');
  OpenURL('http://unbound.biola.edu/index.cfm?method=downloads.showDownloadMain');
end;

procedure TMainForm.CmdOptions(Sender: TObject);
begin
  FontDialog.Font.Assign(CurrFont);
  if FontDialog.Execute then
  begin
    CurrFont.Assign(FontDialog.Font);
    MakeBookList;
    LoadChapter;
    FormPaint(self);
    Invalidate;
  end;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  {$ifdef darwin}
  if Height < 300 then Height := 300;
  if Width  < 500 then Width  := 500;
  {$endif}
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  {$ifdef darwin} if ComboBox.ItemIndex = -1 then ComboBoxSetIndex; {$endif}
end;

procedure TMainForm.IdleTimerTimer(Sender: TObject);
begin
  {$ifdef linux}
  if IdleMessage = 'GotoVerse(ActiveVerse,true)' then
                    GotoVerse(ActiveVerse,true);

  if IdleMessage = 'GotoVerse(ActiveVerse,false)' then
                    GotoVerse(ActiveVerse,false);

  if IdleMessage <> '' then IdleMessage := '';
  {$endif}
end;

procedure TMainForm.PageControlChange(Sender: TObject);
begin
  EnableButtons;
  UpDownButtons;
  UpdateStatus('');
  UnboundMemo.SetFocus;
  UnboundMemo.Repaint;
  if PageControl.ActivePageIndex = apCompare then LoadCompare;
  if PageControl.ActivePageIndex <> apNotes then UnboundMemo.HideCursor;
end;

procedure TMainForm.RadioButtonClick(Sender: TObject);
begin
  MakeBookList;
  LoadChapter;
end;

procedure TMainForm.ToolButtonFBClick(Sender: TObject);
begin
  OpenURL('http://www.facebook.com/unbound.bible.tools/');
  FBPageVisited := True;
end;

procedure TMainForm.MakeBookList;
var
  List: TStringList;
  l : boolean;
begin
  l := BookBox.ItemIndex < 0;

  BookBox.Items.BeginUpdate;
  BookBox.Items.Clear;
  BookBox.Font.Assign(CurrFont);

  List := TStringList.Create;
  Bible.GetTitles(List);
  BookBox.BiDiMode := bdLeftToRight;
  if Bible.RightToLeft then BookBox.BiDiMode := bdRightToLeft;
  BookBox.Items.Assign(List);
  List.Free;

  if l and (BookBox.Count > 0) then BookBox.ItemIndex := 0;
  BookBox.Items.EndUpdate;
end;

//-----------------------------------------------------------------------------------------

procedure TMainForm.MakeChapterList(n: integer);
var
  i: integer;
begin
  ChapterBox.Font.Assign(CurrFont);
  if ChapterBox.Items.Count = n then Exit;

  {$ifdef darwin} bag01 := True; {$endif}

  ChapterBox.Items.BeginUpdate;
  ChapterBox.Items.Clear;

  for i := 1 to n do ChapterBox.Items.Add(IntToStr(i));
  {$ifdef darwin} if n = 1 then ChapterBox.Items.Add(''); {$endif}

  ChapterBox.ItemIndex := 0;
  ChapterBox.Items.EndUpdate;

  {$ifdef darwin} bag01 := False; {$endif}
end;

{$ifdef darwin}
procedure TMainForm.ScrollBoxes;
var i: integer;
begin
  for i:=0 to BookBox.Count-1 do
    begin
      if BookBox.ItemFullyVisible(BookBox.ItemIndex) then break;
      BookBox.TopIndex := i;
    end;
  for i:=0 to ChapterBox.Count-1 do
    begin
      if ChapterBox.ItemFullyVisible(ChapterBox.ItemIndex) then break;
      ChapterBox.TopIndex := i;
    end;
end;
{$endif}

//----------------------------------------------------------------------------------------
//                                       tools
//----------------------------------------------------------------------------------------

procedure TMainForm.LoadChapter;
var
  Stream : TRichStream;
begin
  if Shelf.Count = 0 then Exit;
  Stream := TRichStream.Create;

  Load_Chapter(Stream);
  MemoBible.LoadRichText(Stream);
  MakeChapterList(Bible.ChaptersCount(ActiveVerse));
  if FormTranslate.Visible then LoadTranslate(ActiveVerse);
  SelectPage(apBible);

  Stream.Free;
end;

procedure TMainForm.SearchText(s: string);
var
  Stream : TRichStream;
  Count: integer;
begin
  Stream := TRichStream.Create;
  MemoSearch.Cursor := crHourGlass;
  Search_Text(Stream, s, Count);
  MemoSearch.LoadRichText(Stream);
  MemoSearch.Cursor := crArrow;
  SelectPage(apSearch);
  UpdateStatus(IntToStr(Count) + ' ' + ms_found);
  Stream.Free;
end;

procedure TMainForm.LoadCompare;
var
  Stream : TRichStream;
begin
  if not Shelf.IsLoaded then
    begin
      Stream := TRichStream.Create;
      Show_Message(Stream, ms_loading);
      MemoCompare.LoadRichText(Stream);
      Stream.Free;
    end;

  Stream := TRichStream.Create;
  SelectPage(apCompare);
  Load_Compare(Stream);
  MemoCompare.LoadRichText(Stream);
  Stream.Free;
end;

procedure TMainForm.LoadTranslate(Verse: TVerse);
var
  Stream : TRichStream;
begin
  Stream := TRichStream.Create;
  Load_Translate(Stream, Verse);
  FormTranslate.Memo.LoadRichText(Stream);
  FormTranslate.Repaint;
  Stream.Free;
end;

{$ifdef windows}
procedure TMainForm.VersesToClipboard;
var
  Stream : TRichStream;
begin
  Stream := TRichStream.Create;
  ActiveVerse.number := MemoBible.ParagraphStart;
  ActiveVerse.count  := MemoBible.ParagraphCount;
  Load_Verses(Stream);
  StreamToClipboard(Stream);
  Stream.free;
end;
{$endif}

{$ifdef unix}
procedure TMainForm.VersesToClipboard;
var
  MemoPreview : TUnboundMemo;
  Stream: TRichStream;
begin
  Stream := TRichStream.Create;
  MemoPreview := TUnboundMemo.Create(self);

  with MemoPreview do
    begin
      Parent := MainForm;
      Left   := 0;
      Top    := 0;
      Height := 100;
      Width  := 100;
    end;

  ActiveVerse.Number := MemoPreview.ParagraphStart;
  ActiveVerse.Count  := MemoPreview.ParagraphCount;
  Load_Verses(Stream);

  MemoPreview.LoadRichText(Stream);
  MemoPreview.SelectAll;
  MemoPreview.CopyToClipboard;

  Stream.Free;
  MemoPreview.Free;
end;
{$endif}

end.

