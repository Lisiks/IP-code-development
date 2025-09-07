unit function_unit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Math;

type

  { TFunctionForm }

  TFunctionForm = class(TForm)
    BLabel: TLabel;
    FLabel: TLabel;
    CalButton: TButton;
    ClrButton: TButton;
    FEdit: TEdit;
    bg: TImage;
    XLabel: TLabel;
    XEdit: TEdit;
    Head: TStaticText;
    F1: TLabel;
    F3: TLabel;
    F2: TLabel;
    AEdit: TEdit;
    BEdit: TEdit;
    ALabel: TLabel;
    procedure CalButtonClick(Sender: TObject);
    procedure ClrButtonClick(Sender: TObject);
    procedure HeadClick(Sender: TObject);
  private

  public

  end;

var
  FunctionForm: TFunctionForm;

implementation

{$R *.lfm}

{ TFunctionForm }

procedure TFunctionForm.HeadClick(Sender: TObject);
begin

end;

procedure TFunctionForm.ClrButtonClick(Sender: TObject);
begin
      FunctionForm.XEdit.Text := '';
      FunctionForm.AEdit.Text := '';
      FunctionForm.BEdit.Text := '';
      FunctionForm.FEdit.Text := '';
end;

procedure TFunctionForm.CalButtonClick(Sender: TObject);
var
  x, a, b, sinbx, cosbx, f, exp: double;
begin
     if (FunctionForm.XEdit.Text = '') or (FunctionForm.AEdit.Text = '') or (FunctionForm.BEdit.Text = '') then
     ShowMessage('Недостаточно данных для рассчета!!!')
     else
     begin
       exp := 2.718281828;
       x := strtofloat(FunctionForm.XEdit.Text);
       a := strtofloat(FunctionForm.AEdit.Text);
       b := strtofloat(FunctionForm.BEdit.Text);
       Math.sincos(x*b, sinbx, cosbx);
       f := (Math.power(a, 2)*x + power(exp, -x) * cosbx) / (b*x - power(exp, -x) * sinbx + 1);
       FunctionForm.FEdit.Text := floattostr(f);
     end;

end;

end.

