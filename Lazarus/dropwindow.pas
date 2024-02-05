unit dropwindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, logwindow;

type

  { TDropForm }

  TDropForm = class(TForm)
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
  private

  public

  end;

var
  DropForm: TDropForm;

implementation

{$R *.lfm}

{ TDropForm }

procedure TDropForm.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  img: TImage;
begin
  LogMessage('Sender Class: '+TComponent(Sender).ClassName);
  LogMessage('Source Class: '+TComponent(Source).ClassName);
  img:=TImage.Create(Self);
  img.Top:=Y;
  img.Left:=X;
  img.Picture:=TImage(Source).Picture;
  img.Parent:=Self;
end;

procedure TDropForm.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=True;
end;

procedure TDropForm.FormDropFiles(Sender: TObject;
  const FileNames: array of string);
begin
  LogMessage('Files dropped: '+IntToStr(Length(FileNames)));
  LogMessage('First file: '+FileNames[0]);
end;

end.

