type
stack_p = ^stack_element;
stack_element = record
  num : integer;
  next : stack_p;
  end;
  
procedure stack_append(var head, s_element: stack_p);
begin
  s_element^.next := head;
  head :=  s_element;
end;

function create_element(enum: integer): stack_p;
var new_element: stack_p;
begin
  new (new_element);
  with new_element^ do
  begin
    num := enum;
    next := nil;
  end;
  create_element := new_element;
end;

function get_element(var head : stack_p): integer;
var q : stack_p;
begin
  get_element := head^.num;
  
  q := head;
  head := head^.next;
  Dispose(q);
  
  
end;


var
  input, output: text;
  input_num, output_num : integer;
  stack_head: stack_p;
  s_element: stack_p;
begin
    assign(input, 'C:\Users\mikha\OneDrive\Рабочий стол\College\2 симместр\Прога\Лабораторная работа №17\input_file.txt');
    assign(output, 'C:\Users\mikha\OneDrive\Рабочий стол\College\2 симместр\Прога\Лабораторная работа №17\output_file.txt');
    
    reset(input);
    while not Eof(input) do
    begin
      readln(input, input_num);
      s_element := create_element(input_num);
      stack_append(stack_head,  s_element);
    end;
    close(input);
    
   rewrite(output);
   while stack_head <> nil do
   begin
     output_num := get_element(stack_head);
     writeln(output, output_num);
   end;
   close(output)
   
end.