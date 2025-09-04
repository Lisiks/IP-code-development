unit trapec_module;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { Ttrap_form }

  Ttrap_form = class(TForm)
    bg_image: TImage;
    Rezult_button: TButton;
    S_Edit: TEdit;
    H_edit: TEdit;
    O1_edit: TEdit;
    O2_Edit: TEdit;
    Head: TLabel;
    information_label: TLabel;
    S_L: TLabel;
    H_L: TLabel;
    O1_L: TLabel;
    O2_L: TLabel;
    procedure Rezult_buttonClick(Sender: TObject);
  private

  public

  end;

var
  trap_form: Ttrap_form;

implementation

{$R *.lfm}

{ Ttrap_form }

procedure Ttrap_form.Rezult_buttonClick(Sender: TObject);
begin
  if O1_edit.Text = '' then
     showmessage('Введите длинну первого основания :(')
  else if H_edit.Text = '' then
     showmessage('Введите высоту :(')
  else if O1_edit.Text = '' then
     showmessage('Введите длинну первого основания :(')
  else
     try
        S_edit.Text := floattostr((strtofloat(O1_edit.Text) + strtofloat(O2_edit.Text)) / 2 * (strtofloat(H_edit.Text)));
     except
           showmessage('Параметры введены неверно :(');
     end;
end;

end.

