program RESTServer;

{$mode objfpc}{$H+}

uses
  cthreads, custhttpapp, sqldbrestbridge, PQConnection;

type

  { TRESTServer }

  TRESTServer = class(TCustomHTTPApplication)
  private
    FDispatcher: TSQLDBRestDispatcher;
    Procedure DoLog(Sender : TObject; aType : TRestDispatcherLogOption; Const aMessage : UTF8String);
  protected
    procedure DoRun; override;
  end;

var
  Application: TRESTServer;

{ TRESTServer }

procedure TRESTServer.DoLog(Sender: TObject; aType: TRestDispatcherLogOption;
  const aMessage: UTF8String);
begin
  WriteLn(aMessage);
end;

procedure TRESTServer.DoRun;
begin
  FDispatcher:=TSQLDBRestDispatcher.Create(Self);
  FDispatcher.CORSAllowedOrigins:='*';
  FDispatcher.CORSAllowCredentials:=True;
  FDispatcher.ExposeDatabase('PostgreSQL', 'yaht', 'sandbox', 'kveroneau', 'password');
  FDispatcher.OnLog:=@DoLog;
  FDispatcher.Active:=True;
  inherited DoRun;
end;

begin
  Application:=TRESTServer.Create(Nil);
  Application.Title:='REST Server';
  Application.Port:=3000;
  Application.Threaded:=True;
  Application.Initialize;
  Application.Run;
  Application.Free;
end.

