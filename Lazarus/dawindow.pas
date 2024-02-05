unit dawindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, memds, DB, SdfData, dbf, Forms, Controls, Graphics,
  Dialogs, DBGrids, DBCtrls, StdCtrls;

type

  { TDataAccessForm }

  TDataAccessForm = class(TForm)
    DataSource: TDataSource;
    DBDate: TDBCalendar;
    DBNavigator: TDBNavigator;
    DBString: TDBEdit;
    Dbf: TDbf;
    Label1: TLabel;
    Label2: TLabel;
    MemDataset: TMemDataset;
    SdfDataSet: TSdfDataSet;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  DataAccessForm: TDataAccessForm;

implementation

{$R *.lfm}

{ TDataAccessForm }

procedure TDataAccessForm.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction:=caHide;
  {SdfDataSet.SaveFileAs('new.sdf');}
  {SdfDataSet.Active:=False;}
end;

procedure TDataAccessForm.FormCreate(Sender: TObject);
begin

end;

procedure TDataAccessForm.FormShow(Sender: TObject);
begin
  {SdfDataSet.Active:=True;}
end;

end.

