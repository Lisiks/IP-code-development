function sumTo(num:integer):integer;
begin
  if num > 0 then
    sumTo := num + sumTo(num - 1)
  else
    sumTo := 0;
end;

begin
  var n := readinteger('Введите число для суммы: ');
  println(sumTo(n));
end.