unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, Menus, StdCtrls,
  ComCtrls, ActnList, StdActns;

type

  { TForm1 }

  TForm1 = class(TForm)
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpeneningFile: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    ActionList1: TActionList;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    Add: TMenuItem;
    Edit: TMenuItem;
    Del: TMenuItem;
    PopupMenu1: TPopupMenu;
    Search: TMenuItem;
    line: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    PanelInstr: TMenuItem;
    Sostoin: TMenuItem;
    StatusBar1: TStatusBar;
    TablAnaliz: TMenuItem;
    MenuItem2: TMenuItem;
    GrafAnaliz: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    AddFile: TMenuItem;
    SaveFile: TMenuItem;
    SaveAs: TMenuItem;
    CloseProgram: TMenuItem;
    StringGrid1: TStringGrid;
    ToolBar1: TToolBar;
    OpenFile: TToolButton;
    tableAnaliz: TToolButton;
    AnalizGraf: TToolButton;
    ToolButton12: TToolButton;
    ClosedFile: TToolButton;
    Save: TToolButton;
    SaveAssFile: TToolButton;
    ToolButton4: TToolButton;
    plus: TToolButton;
    Editing: TToolButton;
    minus: TToolButton;
    searching: TToolButton;
    ToolButton9: TToolButton;
    procedure OpeneningFileExecute(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.OpeneningFileExecute(Sender: TObject);
begin
     ShowMessage('Hellow');
end;

end.

