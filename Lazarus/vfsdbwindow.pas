unit vfsdbwindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  DBDateTimePicker, vfsdb, DateUtils, vfsgridwindow;

type

  { TVFSDBForm }

  TVFSDBForm = class(TForm)
    ReleaseBtn: TButton;
    GridBtn: TButton;
    FindBtn: TButton;
    GenerateBtn: TButton;
    DBModified: TDBDateTimePicker;
    DBLocation: TDBEdit;
    DBOwner: TDBEdit;
    DBType: TDBEdit;
    DBFilename: TDBEdit;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    VFSNavigator: TDBNavigator;
    procedure FindBtnClick(Sender: TObject);
    procedure GenerateBtnClick(Sender: TObject);
    procedure GridBtnClick(Sender: TObject);
    procedure ReleaseBtnClick(Sender: TObject);
  private

  public

  end;

var
  VFSDBForm: TVFSDBForm;

implementation

{$R *.lfm}

{ TVFSDBForm }

procedure TVFSDBForm.GenerateBtnClick(Sender: TObject);
begin
  with VFSModule do
  begin
    AddFile('File from AddFile 2', $67, $88);
    Dbf.FieldValues['OWNER']:=$87;
    Dbf.UpdateRecord;
  end;
end;

procedure TVFSDBForm.GridBtnClick(Sender: TObject);
begin
  VFSGridForm.Show;
end;

procedure TVFSDBForm.ReleaseBtnClick(Sender: TObject);
begin
  VFSModule.Dbf.Filtered:=False;
end;

procedure TVFSDBForm.FindBtnClick(Sender: TObject);
begin
  VFSModule.FindFile('File from AddFile');
end;

end.

