function NOD(first_num, second_num: integer):integer;
begin
  if first_num < second_num then
    swap(first_num, second_num);
  
  if first_num mod second_num = 0 then
    NOD := second_num
  else
    NOD := NOD(second_num, first_num mod second_num);
end;

begin
  var num1 := readinteger('Введите первое число: ');
  var num2 := readinteger('Введите второе число: ');
  println('НОД: ', NOD(num1, num2));
end.