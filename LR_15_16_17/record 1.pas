type
anketa = record
  fio:string;
  birth:string;
  kurs: 1..5;
end;

var
  student: anketa;
begin
  student.fio := readstring('Введите полное ФИО: ');
  student.birth := readstring('Введите вашу дату рождения: ');
  student.kurs := readinteger('Введите ваш курс: ');
  println('ФИО:',student.fio);
  println('ДР:',student.birth);
  println('Курс:',student.kurs);
end.