type
anketa = record
  fio:string;
  birth:string;
  kurs: 1..5;
end;

var
  students_array: array[1..100] of anketa;
begin
  students_array[1].fio := 'Карамзина Анна Викторовна';
  students_array[2].fio := 'Федосюк Аркадий Дмитриевич';
  students_array[3].fio := 'Зерев Никанор Андреевич';
  
  students_array[1].birth := '03.05.2003';
  students_array[2].birth := '04.06.2005';
  students_array[3].birth := '25.06.2004';
  
  students_array[1].kurs := 5;
  students_array[2].kurs := 3;
  students_array[3].kurs := 4;
  
  for var i:= 1 to 3 do
  begin
    println('Анкета студента №',i);
    println('Полное ФИО:', students_array[i].fio);
    println('Дата рождения:', students_array[i].birth);
    println('Курс:', students_array[i].kurs);
    println();
  end;
  
end.