type
toy = record
  name:string[30];
  price:real;
  age: string[5];
end;

var
  toys_array: array[1..3] of toy;
  toys_file: file of toy;
  simple_toy: toy;
begin
  with toys_array[1] do
  begin
    name := 'Pop it';
    price := 1.20;
    age := '3-12';
  end;
  
  with toys_array[2] do
  begin
    name := 'Tedy bear';
    price := 3.40;
    age := '0-10';
  end;

  with toys_array[3] do
  begin
    name := 'Tank';
    price := 4.00;
    age := '5-13';
  end;

assign(toys_file, 'C:\Users\mikha\OneDrive\Рабочий стол\College\2 симместр\Прога\Лабораторная работа №15\toys.txt');
rewrite(toys_file);
for var i:= 1 to 3 do
  write(toys_file, toys_array[i]);
close(toys_file);

reset(toys_file);
while not(Eof(toys_file)) do
begin
  read(toys_file, simple_toy);
  println('Наименование:', simple_toy.name );
  println('Цена:', simple_toy.price,'$');
  println('Преднозначен для лиц:', simple_toy.age,'лет');
  println;  
end;
close(toys_file)

end.