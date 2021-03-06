unit UnitCopy;

interface

uses
  Classes, SysUtils, LazFileUtils, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, UnboundMemo, UnitLib, UnitType, UnitStream;

type

  { TFormCopy }

  TFormCopy = class(TForm)
    ButtonCancel: TButton;
    ButtonCopy: TButton;
    CheckBox: TCheckBox;
    CheckGroup: TCheckGroup;
    Memo: TUnboundMemo;
    procedure ButtonCopyClick(Sender: TObject);
    procedure CheckGroupItemClick(Sender: TObject; {%H-}Index: integer);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    TempOptions : TCopyOptions;
    procedure LoadText;
    procedure CopyToClipboard;
  public
    ParagraphStart : integer;
    ParagraphEnd : integer;
    procedure Translate;
  end;

var
  FormCopy: TFormCopy;

implementation

uses UnitTool, UnitLang;

const
  cgAbbreviate  = 0;
  cgEnumerated  = 1;
  cgGuillemets  = 2;
  cgParentheses = 3;
  cgEnd         = 4;

{$R *.lfm}

procedure TFormCopy.Translate;
begin
  Caption := ' ' + T('Verses.Caption');

  CheckGroup  .Caption := T('Verses.Options' );
  ButtonCopy  .Caption := T('Menu.Copy'      );
  ButtonCancel.Caption := T('Button.Cancel'  );

  CheckGroup.Items[cgAbbreviate]  := T('Verses.Abbreviate'  );
  CheckGroup.Items[cgEnumerated]  := T('Verses.Enumerated'  );
  CheckGroup.Items[cgGuillemets]  := T('Verses.Guillemets'  );
  CheckGroup.Items[cgParentheses] := T('Verses.Parentheses' );
  CheckGroup.Items[cgEnd]         := T('Verses.End'         );

  CheckBox.Caption := T('Verses.Default');
end;

procedure TFormCopy.FormActivate(Sender: TObject);
begin
  {$ifdef linux}
  ButtonCancel.Top := 255;
  CheckBox.Top := 290;
  CheckBox.Left := 290;
  {$endif}

  TempOptions := Options;

  CheckGroup.Checked[cgAbbreviate]  := Options.cvAbbreviate;
  CheckGroup.Checked[cgEnumerated]  := Options.cvEnumerated;
  CheckGroup.Checked[cgGuillemets]  := Options.cvGuillemets;
  CheckGroup.Checked[cgParentheses] := Options.cvParentheses;
  CheckGroup.Checked[cgEnd]         := Options.cvEnd;

  CheckBox.Checked:= False;

  LoadText;
end;

procedure TFormCopy.LoadText;
var
  Stream: TRichStream;
begin
  Stream := TRichStream.Create;
  Load_Verses(Stream);
  Memo.LoadRichText(Stream);
  Stream.Free;
end;

procedure TFormCopy.CopyToClipboard;
begin
  Memo.SelectAll;
  Memo.CopyToClipboard;
  Memo.SelStart  := 0;
  Memo.SelLength := 0;
end;

procedure TFormCopy.CheckGroupItemClick(Sender: TObject; Index: integer);
begin
  Options.cvAbbreviate  := CheckGroup.Checked[cgAbbreviate];
  Options.cvEnumerated  := CheckGroup.Checked[cgEnumerated];
  Options.cvGuillemets  := CheckGroup.Checked[cgGuillemets];
  Options.cvParentheses := CheckGroup.Checked[cgParentheses];
  Options.cvEnd         := CheckGroup.Checked[cgEnd];
  LoadText;
  Repaint;
end;

procedure TFormCopy.ButtonCopyClick(Sender: TObject);
begin
  CopyToClipboard;
end;

procedure TFormCopy.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if self.ModalResult <> mrOk then Options := TempOptions;
  if (self.ModalResult = mrOk) and (not CheckBox.Checked) then Options := TempOptions;
end;

end.

