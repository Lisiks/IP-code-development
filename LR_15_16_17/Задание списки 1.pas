type 
PNode = ^Node;   { указатель на элемент связанного списка }  
 
Node = record    { тип элемента связяанного списка }
  word_: string[40]; { слово }
  count: integer;   { счетчик повторов слов }
  next: PNode;      { ссылка на следующий элемент связанного списка}
end;
     
procedure AddFirst ( var Head: PNode; NewNode: PNode );
begin
  NewNode^.next := Head;
  Head := NewNode;
end;    
     
     
procedure AddAfter(var AfterNode, NewNode: PNode);
begin
  NewNode^.next := AfterNode^.next;
  AfterNode^.next := NewNode;
end;


function CreateNode(NewWord: string): PNode; // Эта функция создает и возвращает УКАЗАТЕЛЬ на новый элемент связанного списка (указатель на ЗАПИСЬ)
var NewNode: PNode; // Создает новый указатель на элемент списка
begin
  New(NewNode);
  with NewNode^ do
  begin
    word_ := NewWord;
    count := 1;
    next := nil;
  end;
  Result := NewNode;  // Возвращаем указатель
end;



function TakeWord ( F: Text ) : string;
var c: char;
begin
  Result := '';
  c := ' '; 

  while not eof(f) and not (c in ['A'..'Z', 'a'..'z']) do 
    read(F, c);  
  while not eof(f) and (c in ['A'..'Z', 'a'..'z']) do begin
    Result := Result + c;
    read(F, c);
    
    Result := Result.ToLower;  // Переводим в нижний регистр (к сожалению не ручками :( ) это деляется для корректного формирования словаря, т.к. нижний регистр весит больше чем верхний
  end;
end;


 var
   word_counter: integer;
   Head: PNode; // Первый элемент связанного списка
   text_file:text;

   
   Node_for_list_moving:PNode;
   New_list_element: PNode;

 begin
   assign(text_file, 'C:\Users\mikha\OneDrive\Рабочий стол\College\2 симместр\Прога\Лабораторная работа №16\text.txt');
   reset(text_file); // Присваиваем переменной фаил и открываем его
   
   while not(Eof(text_file)) do // Гоу ту зе файл
   begin
     New_list_element := CreateNode(TakeWord(text_file)); // Создаем указатель на запись с полученным словом - элемент списка
     
     
     if (Head = nil) or (New_list_element^.word_ < Head^.word_) then  // Если список пуст или слово из начала списка больше чем слово нового элемента вставляем его в начало
       AddFirst(Head, New_list_element)
     
     else  // В противном случае начинаем движение по списку начинаем движение по нему
     begin
     Node_for_list_moving:= Head;  // Присваиваем указателю Hode_for_list_moving значение первого элемента списка
     
       while 1=1 do  // Цикл бесконечный, т.к. в его теле учитываются все возможные исходы обработки списка с выходом из цикла (да, мне лень выдумывать условия, лучше 10 раз написать break)
       begin
         if Node_for_list_moving^.word_ = New_list_element^.word_ then // Проверяем, равно ли наше слово, слову текущего проверяемого елемента списка, если да, то просто увеличиваем значение count этого элемента и приступаем к следующему слову
         begin
           Node_for_list_moving^.count += 1; 
           break
         end
                                                                                                                                                                        
         else if  Node_for_list_moving^.word_ < New_list_element^.word_ then // Если текущий проверяемый элемент лексикографически меньше, т.е. элемент нужно вставить ЗА НИМ, осуществляем следующие проверки
           if Node_for_list_moving^.next = nil then // Если следующего за ним элемента нет, то просто добавляем наш новый элемент за ним и приступим к следующему слову и конечно же BREAK
           begin
             Node_for_list_moving^.next := New_list_element;
             break
           end
           else if  Node_for_list_moving^.next^.word_ > New_list_element^.word_ then  // Проверяем следующее слово по списку при помощи ссылки .next, и если оно лексикографически больше, значит необходимо вставить
           begin                                                                                                              // Текущий элемент перед ним, а это легко сделать при помощи Add After, передавая в качестве параметров текущий проверяемый элемент и тот, который нужно добавить. Ну и само собой BREAK
             Addafter(Node_for_list_moving, New_list_element);
             break
           end
           else
             Node_for_list_moving := Node_for_list_moving^.next // Во всех остальных случаях продолжаем движение.
       end;
     end;
   end;
   // В данном алгоритме ситуация когда слово нужно вставить перед текущим элементом возможна только в отношении головы списка, то мы заранее это учли в первом условии.
   close(text_file);
   
   
   Node_for_list_moving := Head;
   while Node_for_list_moving <> nil do
   begin
     writeln(Node_for_list_moving^.word_, ' - ', Node_for_list_moving^.count);
     word_counter += 1;
     Node_for_list_moving := Node_for_list_moving^.next;
   end;
   writeln('Общее число различных слов - ', word_counter);
 end.