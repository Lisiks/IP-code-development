program DKR;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Main_manu, Rectangel_module, curcle_module, paralelogramm_module,
trapec_module
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMenu_form, Menu_form);
  Application.CreateForm(TRectangle_form, Rectangle_form);
  Application.CreateForm(TCircle_form, Circle_form);
  Application.CreateForm(TPar_form, Par_form);
  Application.CreateForm(Ttrap_form, trap_form);
  Application.Run;
end.

