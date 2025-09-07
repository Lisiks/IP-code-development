var x,y: integer;
function stepen (a,b: integer):real;
begin
  if b = 0 then
    stepen := 1
  else if b > 0 then
    stepen := a * stepen(a, b-1)
  else
    stepen := (1 / a) *  stepen(a, b+1);
end;
begin
  writeln('число?');
  readln(x);
  writeln('степень?');
  readln(y);
  writeln(stepen(x,y));
end.