unit msgwindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TMessageForm }

  TMessageForm = class(TForm)
    MessageText: TMemo;
    procedure FormResize(Sender: TObject);
  private

  public
    procedure ShowResource(const aTitle, resName: string);
  end;

var
  MessageForm: TMessageForm;

implementation

{$R *.lfm}

{ TMessageForm }

procedure TMessageForm.FormResize(Sender: TObject);
begin
  MessageText.Width:=ClientWidth;
  MessageText.Height:=ClientHeight;
end;

procedure TMessageForm.ShowResource(const aTitle, resName: string);
var
  s: string;
begin
  Caption:=aTitle;
  with TResourceStream.Create(HINSTANCE, resName, RT_RCDATA) do
  try
    SetLength(s, Size);
    Read(s[1], Size);
    MessageText.Text:=s;
    ShowModal;
  finally
    Free;
  end;
end;

end.

