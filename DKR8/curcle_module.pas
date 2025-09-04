unit curcle_module;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Math;

type

  { TCircle_form }

  TCircle_form = class(TForm)
    R_edL: TLabel;
    Rezult_button: TButton;
    R_edit: TEdit;
    S_edit: TEdit;
    form_image: TImage;
    Head: TLabel;
    information_label: TLabel;
    S_edL1: TLabel;

    procedure Rezult_buttonClick(Sender: TObject);

  private

  public

  end;

var
  Circle_form: TCircle_form;

implementation

{$R *.lfm}

{ TCircle_form }

procedure TCircle_form.Rezult_buttonClick(Sender: TObject);

begin

     if R_edit.Text = '' then
        showmessage('Недостаточно данных для рассчета :(')
     else
     try
        S_edit.Text := floattostr(Power(strtofloat(R_edit.Text), 2) * 3.14159265359);
     except
           showmessage('Радиуc введен неверно :(');
     end;

end;


end.

