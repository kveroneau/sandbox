unit logwindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TGlobalLog }

  TGlobalLog = class(TForm)
    LogMessages: TListBox;
    procedure FormResize(Sender: TObject);
  private

  public

  end;

var
  GlobalLog: TGlobalLog;

procedure LogMessage(const msg: string);

implementation

procedure LogMessage(const msg: string);
var
  i: Integer;
begin
  WriteLn(msg);
  if not GlobalLog.Visible then
    GlobalLog.Show;
  with GlobalLog.LogMessages do
  begin
    i:=Items.Add(msg);
    Selected[i]:=True;
    MakeCurrentVisible;
  end;
end;

{$R *.lfm}

{ TGlobalLog }

procedure TGlobalLog.FormResize(Sender: TObject);
begin
  LogMessages.Width:=ClientWidth;
  LogMessages.Height:=ClientHeight;
end;

end.

