type t_chs = set of Char;
const
  lett: t_chs = ['a'..'z','A'..'Z','_'];
  num: t_chs = ['0'..'9'];
var
  str: string;
  i: byte;
  flag: boolean = True;
  
begin
  str := readstring('Введите строку для проверки: ');
  
 for i := 1 to length(str) do
   if (i = 1) and not(str[i] in lett) then
   begin
     flag := False;
     break
   end
   else if not(str[i] in lett) and not(str[i] in num) then
   begin
     flag := False;
     break
   end;
   
   if flag = true then
     print('Строка',str,'корректна!')
   else
     print('Строка "',str,'" некорректна!')
 
end.