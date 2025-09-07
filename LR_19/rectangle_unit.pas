unit rectangle_unit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Math;

type

  { TRectangleForm }

  TRectangleForm = class(TForm)
    bg: TImage;
    CulButton: TButton;
    Dlabel: TLabel;
    SEdit1: TEdit;
    DEdit1: TEdit;
    ClrButton1: TButton;
    Rlabel: TLabel;
    REdit: TEdit;
    NEdit: TEdit;
    Quest: TLabel;
    Nlabel: TLabel;
    Slabel1: TLabel;
    procedure ClrButton1Click(Sender: TObject);
    procedure CulButtonClick(Sender: TObject);
  private

  public

  end;

var
  RectangleForm: TRectangleForm;

implementation

{$R *.lfm}

{ TRectangleForm }


procedure TRectangleForm.ClrButton1Click(Sender: TObject);
begin
       RectangleForm.REdit.Text := '';
       RectangleForm.NEdit.Text := '';
       RectangleForm.SEdit1.Text := '';
       RectangleForm.DEdit1.Text := '';


end;

procedure TRectangleForm.CulButtonClick(Sender: TObject);
var
  tga, cosa, a, b, R, D, S: double;
begin
  if   (RectangleForm.REdit.Text = '') or (RectangleForm.NEdit.Text = '') then
       ShowMessage('Недостаточно данных для рассчета!')
  else
  begin
    R := strtofloat(RectangleForm.REdit.Text);
    tga := strtofloat(RectangleForm.NEdit.Text);
    D := R*2;
    cosa := sqrt(1/(power(tga, 2) + 1));
    b := D*cosa;
    a := sqrt(Math.power(D, 2) - Math.power(b, 2));
    S := a*b;
    RectangleForm.SEdit1.Text := floattostr(S);
    RectangleForm.DEdit1.Text := floattostr(D);

  end;

end;

end.

