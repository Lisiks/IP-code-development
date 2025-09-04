uses crt;
const
Stack_maximum = 25;

type
Stack = record
  stack_array: array [1..Stack_maximum] of string;
  head: integer := 1;
end;

var
  main_stack:stack;
  
function is_stack_full(S:stack):boolean;
begin
  if S.head > high(S.stack_array) then
    is_stack_full := True
  else
    is_stack_full := False;
end;

function is_stack_empy(S:stack): boolean;
begin
  if S.head = 1 then
    is_stack_empy := True
  else
    is_stack_empy := False;
end;

procedure stupid_input();
begin
  writeln;
  println('Нажмите любую клавишу для выхода в меню');
  var k:= readkey;
end;


procedure stack_append(var S:stack);
begin
  clrscr;
  for var i:= 1 to readlninteger('Сколько элементов необходимо добавить: ') do
  if not(is_stack_full(S)) then
  begin
    S.stack_array[S.head] := readlnstring('Введите элемент стека: ');
    S.head += 1;
    textcolor(2);
    println('Элемент успешно добавлен!');
    textcolor(3);
  end
  else
  begin
    textcolor(4);
    println('Стек переполнен!!!');
    textcolor(3);
    break;
  end;
  stupid_input()
end;

procedure stack_pop(var S:stack);
begin
  clrscr;
  for var i:= 1 to readlninteger('Сколько элементов необходимо удалить: ') do
    if not(is_stack_empy(S)) then
    begin
      textcolor(2);
      println('Элемент', S.stack_array[S.head - 1],'удален!');
      textcolor(3);
      S.stack_array[S.head - 1] := '';
      S.head -= 1;
    end
    else
    begin
      textcolor(4);
      println('Удаление невозможно - стек пуст!');
      textcolor(3);
      break;
    end;
    stupid_input()

end;

procedure stack_output(S:stack);
begin
  clrscr;
  for var i:= 1 to S.head - 1 do
  begin
    write(i,'.', S.stack_array[i]);
    if i <> S.head - 1 then print(' -->');
  end;
  stupid_input()
end;

begin
  textcolor(3);
  Hidecursor;
  while 1=1 do
  begin
    ClrScr;
    
    println('Работа со стеком');
    println('1. Пополнить стек');
    println('2. Извлеч елемент');
    println('3. Просмотр содержимого');
    println('0. Выход');
    
    var key:string := readkey;
    case key of
      '1': stack_append(main_stack);
      '2': stack_pop(main_stack);
      '3': stack_output(main_stack);
      '0': halt;
    end;
  end;
end.