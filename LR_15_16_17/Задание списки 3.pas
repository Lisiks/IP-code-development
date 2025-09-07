type
list_p = ^list_element;

list_element = record
  main_element : integer;
  next : list_p;
end;

function Create_element(num:integer): list_p;
var
  new_list_element : list_p;
begin
  New (new_list_element);
  
  with new_list_element^ do
  begin
    main_element := num;
    next := nil;
  end;
  
  Create_element := new_list_element;
end;

var
  list_Head, moving_element : list_p;
  New_list_element : list_p;
  last_append_element: list_p;
  
  _min_, _max_:integer;
 
  
begin
  while 1=1 do
  begin
    var num := readinteger('Введите элемент связанного списка (для завершения ввода введите 0): ');
    if num = 0 then
      break;
    
    New_list_element := Create_element(num);
    
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
  
  
  moving_element := list_Head;
  while moving_element <> nil do
  begin
    if (moving_element^.main_element > _max_) or (moving_element = list_Head) then
      _max_ := moving_element^.main_element;
    if (moving_element^.main_element < _min_) or (moving_element = list_Head) then
      _min_ := moving_element^.main_element;
    moving_element := moving_element^.next;
  end;
   
  writeln('Максимальный элемент списка: ', _max_);
  writeln('Минимальный элемент списка: ', _min_);
end.