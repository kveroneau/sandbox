unit vfsdb;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, dbf, DB, DateUtils;

type

  { TVFSModule }

  TVFSModule = class(TDataModule)
    DataSource: TDataSource;
    Dbf: TDbf;
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    procedure AddFile(const AFile: string; AType, ALocation: integer);
    procedure FindFile(const AFile: string);
  end;

var
  VFSModule: TVFSModule;

implementation

{$R *.lfm}

{ TVFSModule }

procedure TVFSModule.DataModuleCreate(Sender: TObject);
begin
  Dbf.Active:=True;
end;

procedure TVFSModule.AddFile(const AFile: string; AType, ALocation: integer);
begin
  with Dbf do
  begin
    Append;
    FieldValues['FILENAME']:=AFile;
    FieldValues['TYPE']:=AType;
    FieldValues['LOCATION']:=ALocation;
    FieldValues['MODIFIED']:=Now;
    UpdateRecord;
  end;
end;

procedure TVFSModule.FindFile(const AFile: string);
begin
  Dbf.FilterOptions:=[foCaseInsensitive];
  Dbf.Filter:='FILENAME='+QuotedStr(AFile);
  Dbf.Filtered:=True;
  Dbf.First;
end;

end.

