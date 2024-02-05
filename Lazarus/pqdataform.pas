unit PQDataForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, PQConnection, SQLDB, DB, Forms, Controls, Graphics,
  Dialogs, DBCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    PQConnection: TPQConnection;
    SQLQuery: TSQLQuery;
    SQLTransaction: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  SQLQuery.ApplyUpdates;
  SQLTransaction.Commit;
  SQLTransaction.Active:=True;
  SQLQuery.Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  with SQLQuery do
  begin
    Append;
    FieldValues['ID']:=42;
    FieldValues['NAME']:='SoMe DuDe';
    FieldValues['PHONE']:='5552220505';
    FieldValues['ADDRESS']:='Unknown';
    FieldValues['MEMO']:='A memo about some dude.';
    UpdateRecord;
  end;
end;

end.

