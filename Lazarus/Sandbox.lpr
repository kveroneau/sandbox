program Sandbox;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, runtimetypeinfocontrols, memdslaz, sdflaz, datetimectrls, sqlite3laz,
  hubwindow, msgwindow, ipcsrvwindow, logwindow, ipccliwindow, dropwindow,
  dawindow, vfsdb, vfsdbwindow, vfsgridwindow, storedb, sql1window, sql2window
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='Sandbox Project';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TSandboxHubForm, SandboxHubForm);
  Application.CreateForm(TMessageForm, MessageForm);
  Application.CreateForm(TIPCServerForm, IPCServerForm);
  Application.CreateForm(TGlobalLog, GlobalLog);
  Application.CreateForm(TIPCClientForm, IPCClientForm);
  Application.CreateForm(TDropForm, DropForm);
  Application.CreateForm(TDataAccessForm, DataAccessForm);
  Application.CreateForm(TVFSModule, VFSModule);
  Application.CreateForm(TVFSDBForm, VFSDBForm);
  Application.CreateForm(TVFSGridForm, VFSGridForm);
  Application.CreateForm(TStoreDBForm, StoreDBForm);
  Application.CreateForm(TSQL1DBForm, SQL1DBForm);
  Application.CreateForm(TSQL2Form, SQL2Form);
  Application.Run;
end.

