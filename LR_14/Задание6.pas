procedure solid_fib(i, n, counter, max_fib: integer);
begin
  if counter <= max_fib then
    case counter of
      0: begin
        println(1);
        solid_fib(0, 1, counter + 1, max_fib);
      end;
      1: begin
        println(1);
        solid_fib(1, 1, counter + 1, max_fib);
      end
      else
      begin
        println(n+i);
        solid_fib(n, n+i, counter + 1, max_fib);
      end;
    end;
end;



procedure fib (i,n: integer);
  begin
       writeln (i+n,' ');
       if n + (i + n) <= 89 then
           fib(n, i+n)
  end;
begin
  fib(0,1);
  solid_fib(0, 0, 0, 12);
end.