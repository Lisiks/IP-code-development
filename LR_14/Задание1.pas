procedure recursion_numbers(num:integer);
begin
  if num >= 0 then
  begin
    print(num);
    recursion_numbers(num-2);
  end;
end;

begin
  var n := readinteger('Введите число: ');
  recursion_numbers(n);
end.