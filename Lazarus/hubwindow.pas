unit hubwindow;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, JSONPropStorage, msgwindow, ipcsrvwindow, ipccliwindow, logwindow,
  dropwindow, dawindow, vfsdbwindow, storedb, sql1window, sql2window;

type

  { TSandboxHubForm }

  TSandboxHubForm = class(TForm)
    DropIcon: TImage;
    DataAccessIcon: TImage;
    CustDBIcon: TImage;
    JSONPropStorage: TJSONPropStorage;
    SQL1Icon: TImage;
    SQL2Icon: TImage;
    VFSIcon: TImage;
    IPCCliIcon: TImage;
    IPCSrvIcon: TImage;
    Label1: TLabel;
    Label2: TLabel;
    AboutBtn: TSpeedButton;
    procedure AboutBtnClick(Sender: TObject);
    procedure CustDBIconDblClick(Sender: TObject);
    procedure DataAccessIconDblClick(Sender: TObject);
    procedure DropIconDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure IPCCliIconClick(Sender: TObject);
    procedure IPCSrvIconClick(Sender: TObject);
    procedure OnIconMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OnIconMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OnIconDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure OnIconEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure OnIconStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure OnIconDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SQL1IconDblClick(Sender: TObject);
    procedure SQL2IconDblClick(Sender: TObject);
    procedure VFSIconDblClick(Sender: TObject);
  private
    OldX, OldY: Integer;
  public

  end;

var
  SandboxHubForm: TSandboxHubForm;

implementation

{$R *.lfm}

{ TSandboxHubForm }

procedure TSandboxHubForm.FormCreate(Sender: TObject);
begin

end;

procedure TSandboxHubForm.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  LogMessage('FormDragDrop.');
  {TImage(Source).Top:=Y;
  TImage(Source).Left:=X;}
end;

procedure TSandboxHubForm.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=True;
end;

procedure TSandboxHubForm.AboutBtnClick(Sender: TObject);
begin
  MessageForm.ShowResource('Welcome to my Sandbox!', 'WELCOME');
end;

procedure TSandboxHubForm.CustDBIconDblClick(Sender: TObject);
begin
  StoreDBForm.Show;
end;

procedure TSandboxHubForm.DataAccessIconDblClick(Sender: TObject);
begin
  DataAccessForm.Show;
end;

procedure TSandboxHubForm.DropIconDblClick(Sender: TObject);
begin
  DropForm.Show;
end;

procedure TSandboxHubForm.FormShow(Sender: TObject);
begin

end;

procedure TSandboxHubForm.IPCCliIconClick(Sender: TObject);
begin
  IPCClientForm.Show;
end;

procedure TSandboxHubForm.IPCSrvIconClick(Sender: TObject);
begin
  IPCServerForm.Show;
end;

procedure TSandboxHubForm.OnIconMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with TImage(Sender) do
  begin
    OldX:=Left;
    OldY:=Top;
    BeginDrag(True);
  end;
end;

procedure TSandboxHubForm.OnIconMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  WriteLn(X,',',Y);
  if (X > 16) or (Y > 16) then
  begin
    TImage(Sender).Top:=OldY;
    TImage(Sender).Left:=OldX;
  end;
  TImage(Sender).EndDrag(True);
end;

procedure TSandboxHubForm.OnIconDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:=True;
  with TImage(Source) do
  begin
    Top:=Y+Top-16;
    Left:=X+Left-16;
  end;
end;

procedure TSandboxHubForm.OnIconEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  if Assigned(Target) then
    WriteLn(TComponent(Target).ClassName);
  WriteLn(X,',',Y);
  {TImage(Sender).Top:=Y;
  TImage(Sender).Left:=X;}
end;

procedure TSandboxHubForm.OnIconStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  LogMessage('StartDrag');
end;

procedure TSandboxHubForm.OnIconDragDrop(Sender, Source: TObject; X, Y: Integer
  );
begin
  LogMessage('IconDragDrop');
  WriteLn(X,',',Y);
end;

procedure TSandboxHubForm.SQL1IconDblClick(Sender: TObject);
begin
  SQL1DBForm.Show;
end;

procedure TSandboxHubForm.SQL2IconDblClick(Sender: TObject);
begin
  SQL2Form.Show;
end;

procedure TSandboxHubForm.VFSIconDblClick(Sender: TObject);
begin
  VFSDBForm.Show;
end;

end.

