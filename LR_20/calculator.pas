unit calculator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TClaculator_form }

  TClaculator_form = class(TForm)
    Eqials_Button: TButton;
    mines_number_button: TButton;
    plus_button: TButton;
    minus_button: TButton;
    multi_button: TButton;
    podelit_button: TButton;
    Button_7: TButton;
    Button_0: TButton;
    Button_CE: TButton;
    Button_dot: TButton;
    Button_4: TButton;
    Button_1: TButton;
    Button_8: TButton;
    Button_5: TButton;
    Button_2: TButton;
    Button_9: TButton;
    Button_6: TButton;
    Button_3: TButton;
    Output_edit: TEdit;
    procedure Button_0Click(Sender: TObject);
    procedure Button_1Click(Sender: TObject);
    procedure Button_2Click(Sender: TObject);
    procedure Button_3Click(Sender: TObject);
    procedure Button_4Click(Sender: TObject);
    procedure Button_5Click(Sender: TObject);
    procedure Button_6Click(Sender: TObject);
    procedure Button_7Click(Sender: TObject);
    procedure Button_8Click(Sender: TObject);
    procedure Button_9Click(Sender: TObject);
    procedure Button_dotClick(Sender: TObject);
    procedure Button_CEClick(Sender: TObject);
    procedure Eqials_ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mines_number_buttonClick(Sender: TObject);
    procedure minus_buttonClick(Sender: TObject);
    procedure multi_buttonClick(Sender: TObject);
    procedure plus_buttonClick(Sender: TObject);
    procedure podelit_buttonClick(Sender: TObject);
  private

  public

  end;

var
  Claculator_form: TClaculator_form;
  operation, saved_num: string;

implementation

{$R *.lfm}

{ TClaculator_form }

procedure TClaculator_form.Button_CEClick(Sender: TObject);
begin
     Output_edit.Text := '';
     saved_num := '';
     operation := '';
end;

procedure TClaculator_form.Eqials_ButtonClick(Sender: TObject);
begin
    if   (Output_edit.Text <> '-') and (Output_edit.Text <> '+') and (Output_edit.Text <> '/') and (Output_edit.Text <> '*') and (saved_num <> '') and (operation <> '') then begin
         case operation of
            '-':  saved_num := floattostr(strtofloat(saved_num) - strtofloat(Output_edit.Text));
            '+':  saved_num := floattostr(strtofloat(saved_num) + strtofloat(Output_edit.Text));
            '/':  if Output_edit.Text <> '0' then
            saved_num := floattostr(strtofloat(saved_num) / strtofloat(Output_edit.Text))
            else
            begin
                 showmessage(':(');
                 Output_edit.Text := '';
                  saved_num := '';
                  operation := '';
            end;



            '*':  saved_num := floattostr(strtofloat(saved_num) * strtofloat(Output_edit.Text));
         end;
         operation := '';
         Output_edit.Text := saved_num;

    end;

end;

procedure TClaculator_form.FormCreate(Sender: TObject);
begin

end;

procedure TClaculator_form.mines_number_buttonClick(Sender: TObject);
begin

  if (Output_edit.Text <> '-') and (Output_edit.Text <> '+') and (Output_edit.Text <> '/') and (Output_edit.Text <> '*') and (Output_edit.Text <> '0') and (length(Output_edit.Text) <> 0 ) then
      if Output_edit.Text[1] <> '-' then
           Output_edit.Text := '-' + Output_edit.Text
      else
           Output_edit.Text := Copy(Output_edit.Text, 2, length(Output_edit.Text));
end;

procedure TClaculator_form.minus_buttonClick(Sender: TObject);
begin
     if (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
        Output_edit.Text := '-'

     else if length(Output_edit.Text) <> 0 then
     begin
         if operation <> '' then
            case operation of
            '-':  saved_num := floattostr(strtofloat(saved_num) - strtofloat(Output_edit.Text));
            '+':  saved_num := floattostr(strtofloat(saved_num) + strtofloat(Output_edit.Text));
            '/':  saved_num := floattostr(strtofloat(saved_num) / strtofloat(Output_edit.Text));
            '*':  saved_num := floattostr(strtofloat(saved_num) * strtofloat(Output_edit.Text));
            end
         else
            saved_num := Output_edit.Text;
         Output_edit.Text := '-';
     end;

end;

procedure TClaculator_form.multi_buttonClick(Sender: TObject);
begin
     if (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
        Output_edit.Text := '*'

     else if length(Output_edit.Text) <> 0 then
     begin
         if operation <> '' then
            case operation of
            '-':  saved_num := floattostr(strtofloat(saved_num) - strtofloat(Output_edit.Text));
            '+':  saved_num := floattostr(strtofloat(saved_num) + strtofloat(Output_edit.Text));
            '/':  saved_num := floattostr(strtofloat(saved_num) / strtofloat(Output_edit.Text));
            '*':  saved_num := floattostr(strtofloat(saved_num) * strtofloat(Output_edit.Text));
            end
         else
            saved_num := Output_edit.Text;
         Output_edit.Text := '*';
     end;
end;

procedure TClaculator_form.plus_buttonClick(Sender: TObject);
begin
     if (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
        Output_edit.Text := '+'

     else if length(Output_edit.Text) <> 0 then
     begin
         if operation <> '' then
            case operation of
            '-':  saved_num := floattostr(strtofloat(saved_num) - strtofloat(Output_edit.Text));
            '+':  saved_num := floattostr(strtofloat(saved_num) + strtofloat(Output_edit.Text));
            '/':  saved_num := floattostr(strtofloat(saved_num) / strtofloat(Output_edit.Text));
            '*':  saved_num := floattostr(strtofloat(saved_num) * strtofloat(Output_edit.Text));
            end
         else
            saved_num := Output_edit.Text;
         Output_edit.Text := '+';
     end;
end;

procedure TClaculator_form.podelit_buttonClick(Sender: TObject);
begin
     if (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
        Output_edit.Text := '/'

     else if length(Output_edit.Text) <> 0 then
     begin
         if operation <> '' then
            case operation of
            '-':  saved_num := floattostr(strtofloat(saved_num) - strtofloat(Output_edit.Text));
            '+':  saved_num := floattostr(strtofloat(saved_num) + strtofloat(Output_edit.Text));
            '/':  saved_num := floattostr(strtofloat(saved_num) / strtofloat(Output_edit.Text));
            '*':  saved_num := floattostr(strtofloat(saved_num) * strtofloat(Output_edit.Text));
            end
         else
            saved_num := Output_edit.Text;
         Output_edit.Text := '/';
     end;
end;

procedure TClaculator_form.Button_dotClick(Sender: TObject);
begin
     if (length(Output_edit.Text) <> 0) and (Pos(',', Output_edit.Text) = 0) then
         Output_edit.Text := Output_edit.Text + ','

end;

procedure TClaculator_form.Button_0Click(Sender: TObject);
begin
     if (Output_edit.Text = '0') or (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then begin
         if   (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
              operation := Output_edit.Text;
         Output_edit.Text := '0'
     end
     else
         Output_edit.Text :=  Output_edit.Text + '0';
end;

procedure TClaculator_form.Button_1Click(Sender: TObject);
begin
     if (Output_edit.Text = '0') or (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then begin
         if   (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
              operation := Output_edit.Text;
         Output_edit.Text := '1' ;
     end
     else
         Output_edit.Text :=  Output_edit.Text + '1';
end;

procedure TClaculator_form.Button_2Click(Sender: TObject);
begin
     if (Output_edit.Text = '0') or (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then   begin
         if   (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
              operation := Output_edit.Text;
         Output_edit.Text := '2'
     end
     else
         Output_edit.Text :=  Output_edit.Text + '2';
end;

procedure TClaculator_form.Button_3Click(Sender: TObject);
begin
     if (Output_edit.Text = '0') or (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then   begin
         if   (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
              operation := Output_edit.Text;
         Output_edit.Text := '3'
     end
     else
         Output_edit.Text :=  Output_edit.Text + '3';
end;

procedure TClaculator_form.Button_4Click(Sender: TObject);
begin
     if (Output_edit.Text = '0') or (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then  begin
         if   (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
              operation := Output_edit.Text;
         Output_edit.Text := '4'
     end
     else
         Output_edit.Text :=  Output_edit.Text + '4';
end;

procedure TClaculator_form.Button_5Click(Sender: TObject);
begin
     if (Output_edit.Text = '0') or (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then   begin
         if   (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
              operation := Output_edit.Text;
         Output_edit.Text := '5'
     end
     else
         Output_edit.Text :=  Output_edit.Text + '5';
end;

procedure TClaculator_form.Button_6Click(Sender: TObject);
begin
     if (Output_edit.Text = '0') or (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then begin
         if   (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
              operation := Output_edit.Text;
         Output_edit.Text := '6'
     end
     else
         Output_edit.Text :=  Output_edit.Text + '6';
end;

procedure TClaculator_form.Button_7Click(Sender: TObject);
begin
     if (Output_edit.Text = '0') or (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then  begin
         if   (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
              operation := Output_edit.Text;
         Output_edit.Text := '7'
     end
     else
         Output_edit.Text :=  Output_edit.Text + '7';
end;

procedure TClaculator_form.Button_8Click(Sender: TObject);
begin
     if (Output_edit.Text = '0') or (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then  begin
         if   (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
              operation := Output_edit.Text;
         Output_edit.Text := '8'
     end
     else
         Output_edit.Text :=  Output_edit.Text + '8';
end;

procedure TClaculator_form.Button_9Click(Sender: TObject);
begin
     if (Output_edit.Text = '0') or (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then  begin
         if   (Output_edit.Text = '-') or (Output_edit.Text = '+') or (Output_edit.Text = '/') or (Output_edit.Text = '*') then
              operation := Output_edit.Text;
         Output_edit.Text := '9'
     end
     else
         Output_edit.Text :=  Output_edit.Text + '9';
end;

end.

