var
  i:integer;
  i_ptr: ^integer;
begin
  i := 2;
  i_ptr := @i;
  writeln('По адресу: ', i_ptr, ' - храниться значение: ', i_ptr^);
end.