program test1;

{$mode objfpc}

uses
  browserconsole, browserapp, JS, Classes, SysUtils, Web, db, jsondataset,
  sqldbrestdataset;

type

  { TMyApplication }

  TMyApplication = class(TBrowserApplication)
  private
    FConn: TSQLDBRestConnection;
    FData: TSQLDBRestDataset;
    procedure DataLoaded(DataSet: TDataSet);
  protected
    procedure doRun; override;
  end;

procedure TMyApplication.DataLoaded(DataSet: TDataSet);
begin
  WriteLn(DataSet.FieldByName('key').AsString);
  with DataSet do
  begin
    DataSet.Append;
    FieldValues['id']:=2;
    FieldValues['key']:='REST Key';
    FieldValues['value']:='This key was added over REST!';
    Post;
  end;
end;

procedure TMyApplication.doRun;
begin
  FConn:=TSQLDBRestConnection.create(Self);
  FConn.BaseURL:='/';
  FData:=TSQLDBRestDataset.Create(Self);
  FData.AfterOpen:=@DataLoaded;
  FData.Connection:=FConn;
  FData.ResourceName:='webtest';
  FData.Load([], Nil);
end;

var
  Application : TMyApplication;

begin
  Application:=TMyApplication.Create(nil);
  Application.Initialize;
  Application.Run;
end.
