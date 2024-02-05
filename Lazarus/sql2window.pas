unit sql2window;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLite3DS, DB, sqldbrestbridge, sqldbrestschema, Forms,
  Controls, Graphics, Dialogs, DBGrids;

type

  { TSQL2Form }

  TSQL2Form = class(TForm)
    DataSource: TDataSource;
    DBGrid1: TDBGrid;
    SQLDBRestBusinessProcessor1: TSQLDBRestBusinessProcessor;
    SQLDBRestDispatcher1: TSQLDBRestDispatcher;
    SQLDBRestSchema1: TSQLDBRestSchema;
    Sqlite3Dataset: TSqlite3Dataset;
    procedure SQLDBRestBusinessProcessor1GetDataset(aSender: TObject;
      aContext: TBaseRestContext; aFieldList: TRestFieldPairArray;
      aOrderBy: TRestFieldOrderPairArray; aLimit, aOffset: Int64;
      var aDataset: TDataset);
    procedure Sqlite3DatasetAfterOpen(DataSet: TDataSet);
  private

  public

  end;

var
  SQL2Form: TSQL2Form;

implementation

{$R *.lfm}

{ TSQL2Form }

procedure TSQL2Form.Sqlite3DatasetAfterOpen(DataSet: TDataSet);
begin
  with Sqlite3Dataset.FieldDefs do
  begin
    Items[1].DataType:=ftString;
    Items[2].DataType:=ftString;
    Items[3].DataType:=ftString;
  end;
end;

procedure TSQL2Form.SQLDBRestBusinessProcessor1GetDataset(aSender: TObject;
  aContext: TBaseRestContext; aFieldList: TRestFieldPairArray;
  aOrderBy: TRestFieldOrderPairArray; aLimit, aOffset: Int64;
  var aDataset: TDataset);
begin

end;

end.

