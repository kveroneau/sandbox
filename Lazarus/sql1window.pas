unit sql1window;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLite3Conn, SQLDB, PQConnection, DB, Forms, Controls,
  Graphics, Dialogs, StdCtrls, DBCtrls;

type

  { TSQL1DBForm }

  TSQL1DBForm = class(TForm)
    DBMemo: TDBMemo;
    DBTitle: TDBMemo;
    DBNavigator: TDBNavigator;
    Label1: TLabel;
    SQLDataSource: TDataSource;
    SQLite3Connection: TSQLite3Connection;
    SQLQuery: TSQLQuery;
    SQLTransaction: TSQLTransaction;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  SQL1DBForm: TSQL1DBForm;

implementation

{$R *.lfm}

{ TSQL1DBForm }

procedure TSQL1DBForm.FormCreate(Sender: TObject);
begin
  SQLite3Connection.DatabaseName:=GetCurrentDir+'/test.db';
end;

procedure TSQL1DBForm.FormShow(Sender: TObject);
begin
  SQLite3Connection.Connected:=True;
  SQLTransaction.Active:=True;
  SQLQuery.Open;
end;

procedure TSQL1DBForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:=caHide;
  if SQLTransaction.Active then
  begin
    SQLQuery.ApplyUpdates;
    SQLTransaction.Commit;
    SQLQuery.Close;
  end;
end;

end.

