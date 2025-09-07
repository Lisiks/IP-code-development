type
toy = record
  name:string;
  price:real;
  age: intRange;
end;

var
  toys_array: array[1..3] of toy;
begin
  with toys_array[1] do
  begin
    name := 'Pop it';
    price := 1.20;
    age := 3..12;
  end;
  
  with toys_array[2] do
  begin
    name := 'Tedy bear';
    price := 3.40;
    age := 0..10;
  end;

  with toys_array[3] do
  begin
    name := 'Tank';
    price := 4.00;
    age := 5..13;
  end;

for var i:= 1 to 3 do
begin
  println('Товар №',i);
  println('Наименование:', toys_array[i].name );
  println('Цена:', toys_array[i].price,'$');
  println('Преднозначен для лиц:', toys_array[i].age,'лет');
  println;
end;
end.