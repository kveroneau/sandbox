unit vfsgridwindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids;

type

  { TVFSGridForm }

  TVFSGridForm = class(TForm)
    VFSGrid: TDBGrid;
    procedure FormResize(Sender: TObject);
  private

  public

  end;

var
  VFSGridForm: TVFSGridForm;

implementation

{$R *.lfm}

{ TVFSGridForm }

procedure TVFSGridForm.FormResize(Sender: TObject);
begin
  VFSGrid.Width:=ClientWidth;
  VFSGrid.Height:=ClientHeight;
end;

end.

