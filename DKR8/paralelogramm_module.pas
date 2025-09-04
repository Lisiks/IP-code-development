unit paralelogramm_module;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TPar_form }

  TPar_form = class(TForm)
    bg_image: TImage;
    Rezult_button: TButton;
    S_edit: TEdit;
    H_edit: TEdit;
    A_edit: TEdit;
    Head: TLabel;
    information_label: TLabel;
    S_L: TLabel;
    H_L: TLabel;
    A_L: TLabel;
    procedure Rezult_buttonClick(Sender: TObject);
  private

  public

  end;

var
  Par_form: TPar_form;

implementation

{$R *.lfm}

{ TPar_form }

procedure TPar_form.Rezult_buttonClick(Sender: TObject);
begin
  if A_edit.Text = '' then
     showmessage('Введите длинну основания :(')
  else if H_edit.Text = '' then
        showmessage('Введите высоту :(')
     else
     try
        S_edit.Text := floattostr(strtofloat(A_edit.Text) * strtofloat(H_edit.Text));
     except
           showmessage('Параметры введены неверно :(');
     end;
end;

end.

