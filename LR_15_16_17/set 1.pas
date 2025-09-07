begin
  var num := readstring('Введите положительное число: ');
  if num in ['11', '12', '13', '14'] then
   print(num,'лет')
  else  if num[length(num)] = '1' then
    print(num,'год')
  else if num[length(num)] in [ '2', '3', '4'] then
   print(num,'года')
  else
    print(num,'лет');
end.