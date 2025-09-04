unit Main_manu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Rectangel_module, curcle_module, paralelogramm_module, trapec_module;

type

  { TMenu_form }

  TMenu_form = class(TForm)
    Select_button: TButton;
    Figure_box: TComboBox;
    Head_label: TLabel;
    information_label: TLabel;
    Menu_bg_image: TImage;
    procedure Select_buttonClick(Sender: TObject);



  private

  public

  end;

var
  Menu_form: TMenu_form;

implementation

{$R *.lfm}

{ TMenu_form }


procedure TMenu_form.Select_buttonClick(Sender: TObject);
begin
  if Figure_box.Text = 'Круг' then
     Circle_form.show
  else if Figure_box.Text = 'Прямоугольник' then
     Rectangle_form.show
  else if Figure_box.Text = 'Параллелограмм' then
     Par_form.show
  else
     Trap_form.show;
end;

end.





