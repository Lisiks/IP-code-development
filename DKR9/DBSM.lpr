program DBSM;

{$mode objfpc}{$H+}

uses
{$IFDEF UNIX}
cthreads,
{$ENDIF}
{$IFDEF HASAMIGA}
athreads,
{$ENDIF}
Interfaces, // this includes the LCL widgetset
Forms, Main_unit, edit_unit, quary_unit, ack_unit
{ you can add units after this };

{$R *.res}

begin
RequireDerivedFormResource:=True;
Application.Scaled:=True;
Application.Initialize;
Application.CreateForm(TMainForm, MainForm);
Application.CreateForm(TEditForm, EditForm);
Application.CreateForm(TQuaryForm, QuaryForm);
Application.CreateForm(TDialogForm, DialogForm);
Application.Run;
end.

