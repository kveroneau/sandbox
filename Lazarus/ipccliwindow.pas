unit ipccliwindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, simpleipc, Forms, Controls, Graphics, Dialogs, StdCtrls,
  RTTICtrls, logwindow, msgwindow;

type

  { TIPCClientForm }

  TIPCClientForm = class(TForm)
    ReadmeBtn: TButton;
    StrMessage: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SimpleIPCClient: TSimpleIPCClient;
    TICheckBox1: TTICheckBox;
    TIEdit1: TTIEdit;
    procedure ReadmeBtnClick(Sender: TObject);
    procedure StrMessageKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  IPCClientForm: TIPCClientForm;

implementation

{$R *.lfm}

{ TIPCClientForm }

procedure TIPCClientForm.StrMessageKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
    SimpleIPCClient.SendStringMessage(StrMessage.Text);
end;

procedure TIPCClientForm.ReadmeBtnClick(Sender: TObject);
begin
  MessageForm.ShowResource('IPC Research', 'IPC');
end;

end.

