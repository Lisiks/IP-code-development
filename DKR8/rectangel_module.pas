unit Rectangel_module;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TRectangle_form }

  TRectangle_form = class(TForm)
    bg_image: TImage;
    Result_button: TButton;
    S_edit: TEdit;
    B_edit: TEdit;
    A_edit: TEdit;
    Head: TLabel;
    information_label: TLabel;
    S_L: TLabel;
    A_L: TLabel;
    B_L: TLabel;
    procedure information_labelClick(Sender: TObject);
    procedure Result_buttonClick(Sender: TObject);
  private

  public

  end;

var
  Rectangle_form: TRectangle_form;

implementation

{$R *.lfm}

{ TRectangle_form }

procedure TRectangle_form.Result_buttonClick(Sender: TObject);
begin
     if A_edit.Text = '' then
        showmessage('Введите длинну стороны A :(')
     else if B_edit.Text = '' then
        showmessage('Введите длинну стороны B :(')
     else
     try
        S_edit.Text := floattostr(strtofloat(A_edit.Text) * strtofloat(B_edit.Text));
     except
           showmessage('Длины сторон введены неверно :(');
     end;
end;

procedure TRectangle_form.information_labelClick(Sender: TObject);
begin

end;



end.

