unit ipcsrvwindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, simpleipc, Forms, Controls, Graphics, Dialogs, StdCtrls,
  RTTIGrids, RTTICtrls, logwindow;

type

  { TIPCServerForm }

  TIPCServerForm = class(TForm)
    SimpleIPCServer: TSimpleIPCServer;
    IPCProperties: TTIPropertyGrid;
    procedure FormResize(Sender: TObject);
    procedure SimpleIPCServerMessage(Sender: TObject);
    procedure SimpleIPCServerMessageError(Sender: TObject; Msg: TIPCServerMsg);
    procedure SimpleIPCServerMessageQueued(Sender: TObject);
    procedure SimpleIPCServerThreadError(Sender: TObject);
  private

  public

  end;

var
  IPCServerForm: TIPCServerForm;

implementation

{$R *.lfm}

{ TIPCServerForm }

procedure TIPCServerForm.FormResize(Sender: TObject);
begin
  IPCProperties.Width:=ClientWidth;
  IPCProperties.Height:=ClientHeight;
end;

procedure TIPCServerForm.SimpleIPCServerMessage(Sender: TObject);
begin
  LogMessage('IPC Server OnMessage: '+SimpleIPCServer.StringMessage);
end;

procedure TIPCServerForm.SimpleIPCServerMessageError(Sender: TObject;
  Msg: TIPCServerMsg);
begin
  LogMessage('IPC Server Error: '+Msg.StringMessage);
end;

procedure TIPCServerForm.SimpleIPCServerMessageQueued(Sender: TObject);
begin
  LogMessage('IPC Server Message Queued.');
  SimpleIPCServer.ReadMessage;
end;

procedure TIPCServerForm.SimpleIPCServerThreadError(Sender: TObject);
begin
  LogMessage('IPC Server Thread Error!');
end;

end.

