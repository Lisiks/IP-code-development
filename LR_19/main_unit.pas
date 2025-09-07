unit main_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  function_unit, rectangle_unit;

type

  { TMainForm }

  TMainForm = class(TForm)
    FuncButton: TButton;
    RecButton: TButton;
    ExitButton: TButton;
    menu_head: TLabel;
    menu_image: TImage;
    procedure FuncButtonClick(Sender: TObject);
    procedure RecButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }


procedure TMainForm.ExitButtonClick(Sender: TObject);
begin
      close();
end;

procedure TMainForm.RecButtonClick(Sender: TObject);
begin
      rectangle_unit.RectangleForm.Show;
end;

procedure TMainForm.FuncButtonClick(Sender: TObject);
begin
      function_unit.FunctionForm.Show;
end;

end.

