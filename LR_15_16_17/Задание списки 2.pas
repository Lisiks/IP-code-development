type
list_p = ^list_element;

list_element = record
  main_element : string;
  next : list_p;
end;

function Create_element(word_:string): list_p;
var
  new_list_element : list_p;
begin
  New (new_list_element);
  
  with new_list_element^ do
  begin
    main_element := word_;
    next := nil;
  end;
  
  Create_element := new_list_element;
end;

var
  list_Head, moving_element : list_p;
  New_list_element : list_p;
  last_append_element: list_p;
  chet_counter : integer;
  
begin
  for var i:= 1 to 10 do
  begin
    New_list_element := Create_element(readstring('Введите элемент связанного списка: '));
    
    if list_Head = nil then 
    begin
      list_Head := New_list_element;
      last_append_element := New_list_element;
    end
    else
    begin
      last_append_element^.next := New_list_element;
      last_append_element := New_list_element;
    end;
  end;
  
  writeln();
  writeln('Вывод всего списка');
  moving_element := list_Head;
   while moving_element <> nil do
   begin
     write(moving_element^.main_element, ' --> ');
     moving_element := moving_element^.next;
   end;
   
  writeln();
  writeln('Вывод четных элементов (при учете, что первый - 1)');
  moving_element := list_Head;
  
  while moving_element <> nil do
  begin
    chet_counter += 1;
    if chet_counter mod 2 = 0 then
      write(moving_element^.main_element, ' --> ');
    moving_element := moving_element^.next;
  end;
end.