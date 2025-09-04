Unit Peano_curwe;
 uses GraphABC;
 
 procedure draw_peano(x1, y1, x2, y2: integer; vector: string);
 var
  a, b:integer;
 begin
   
  if (x2-x1 > 9) and (y2-y1 > 9) then // Проверка длинны и ширины области
  begin
    
    a := (x2-x1) div 3;  // Выделение 1/3 от длинны и ширины (для удобства использования в формулах)
    b := (y2-y1) div 3;
    
    
    if vector = 'left_top-right_bottom' then // Разделение области Левый верхний угол-Правый нижний угол
    begin
      
 
      draw_peano(x1, y1, x1+a, y1+b,  'left_top-right_bottom'); //1
      line(x1+a-1, y1+b-2, x1+a-1, y1+b);
      
      line(x1 + a - 1, y1 + b, x1 + a - 1, y1 + b + 2);
      draw_peano(x1, y1+b, x1+a, y1+2*b, 'left_bottom-right_top'); //2
      line(x1+2, y1 + 2*b-1, x1+2, y1 + 2*b);
      
      line(x1 + 2, y1 + 2*b, x1 + 2, y1 + 2*b+2);
      draw_peano(x1, y1+2*b, x1+a, y2, 'left_top-right_bottom'); //3
      line(x1 + a - 1, y2-1, x1 + a, y2 - 1);
      
      line(x1 + a, y2 - 1, x1 + a + 2, y2 - 1);
      draw_peano(x1+a, y1+2*b, x1+2*a, y2, 'left_bottom-right_top'); //4
      line(x1 + 2*a - 1, y1 + 2*b + 2, x1 + 2*a - 1, y1 + 2*b);
      
      
      line(x1 + 2*a - 1, y1 + 2*b, x1 + 2*a - 1, y1 + 2*b - 1);
      draw_peano(x1+a, y1+b, x1+2*a, y1+2*b, 'left_top-right_bottom'); //5
      line(x1 +a + 2, y1 + b + 2, x1 +a + 2, y1 + b);
      
      line(x1 +a + 2, y1 + b, x1 +a + 2, y1 + b-1);
      draw_peano(x1+a, y1, x1+2*a, y1+b, 'left_bottom-right_top'); //6
      line(x1 +2*a - 1, y1 + 2, x1 + 2*a, y1 + 2);
       
       
      line(x1 +2*a, y1 + 2, x1 + 2*a+2, y1 + 2);
      draw_peano(x1+2*a, y1, x2, y1+b,  'left_top-right_bottom'); //7
      line(x2 - 1, y1 + b - 1, x2 - 1, y1 + b);
      
      
      line(x2 - 1, y1 + b, x2 - 1, y1 + b+2);
      draw_peano(x1+2*a, y1+b, x2, y1+2*b, 'left_bottom-right_top'); //8
      line(x1 +2*a + 2, y1 + 2*b - 1, x1 +2*a + 2, y1 + 2*b);
      
      
      line(x1 +2*a + 2, y1 + 2*b, x1 +2*a + 2, y1 + 2*b+2);
      draw_peano(x1+2*a, y1+2*b, x2, y2, 'left_top-right_bottom'); //9
      
    end
    else // Разделение области Правый верхний угол-Левый нижний угол
    begin
      draw_peano(x1, y1+2*b, x1+a, y2, 'left_bottom-right_top'); //1
      line(x1+a - 1, y1 + 2*b + 2, x1+a - 1, y1 + 2*b);
      
      line(x1+a - 1, y1 + 2*b, x1+a - 1, y1 + 2*b - 1);
      draw_peano(x1, y1+b, x1+a, y1+2*b, 'left_top-right_bottom'); //2
      line(x1 + 2, y1+b + 2, x1+2, y1+b);
      
      line(x1 + 2, y1+b, x1+2, y1+b-1);
      draw_peano(x1, y1, x1+a, y1+b, 'left_bottom-right_top'); //3
      line(x1 + a - 1, y1 + 2, x1 + a, y1 + 2);
      
      line(x1 + a, y1 + 2, x1 + a + 2, y1 + 2);
      draw_peano(x1+a, y1, x1+2*a, y1+b, 'left_top-right_bottom'); //4
      line(x1 + 2*a - 1, y1 + b - 2, x1 + 2*a - 1, y1 + b);
      
      
      line(x1 + 2*a - 1, y1 + b, x1 + 2*a - 1, y1 + b + 2);
      draw_peano(x1+a, y1+b, x1+2*a, y1+2*b, 'left_bottom-right_top'); //5
      line(x1 + a + 2, y1 +2* b - 2, x1 + a + 2, y1 + 2 * b);
      
      
      line(x1 + a + 2, y1 +2* b , x1 + a + 2, y1 + 2 * b+2);
      draw_peano(x1+a, y1+2*b, x1+2*a, y2, 'left_top-right_bottom'); //6
      line(x1 + 2*a - 1, y2 - 1, x1 + 2*a, y2 - 1);
      
      
      line(x1 + 2*a, y2 - 1, x1 + 2*a+2, y2 - 1);
      draw_peano(x1+2*a, y1+2*b, x2, y2, 'left_bottom-right_top'); //7
      line(x2 - 1, y1 + 2*b + 2, x2 - 1, y1 + 2*b);
      
      line(x2 - 1, y1 + 2*b , x2 - 1, y1 + 2*b-1);
      draw_peano(x1+2*a, y1+b, x2, y1+2*b, 'left_top-right_bottom'); //8
      line(x1 + 2*a + 2, y1 + b + 2, x1 + 2*a + 2, y1 + b);
      
      line(x1 + 2*a + 2, y1 + b , x1 + 2*a + 2, y1 + b-1);
      draw_peano(x1+2*a, y1, x2, y1+b, 'left_bottom-right_top'); //9
    end;
    
  
  end
  else
  begin
    if vector = 'left_top-right_bottom' then // Отрисовка элемента  Левый верхний угол-Правый нижний угол
    begin
      line(x1 + 2, y1 + 2, x1 + 2, y1 + 8);
      line(x1 + 2, y1 + 8, x1 + 5, y1 + 8);
      line(x1 + 5, y1 + 8, x1 + 5, y1 + 2);
      line(x1 + 5, y1 + 2, x1 + 8, y1 + 2);
      line(x1 + 8, y1 + 2, x1 + 8, y1 + 8);
    end
    else  // Отрисовка элемента  Правый верхний угол-Левый нижний угол
    begin
      line(x1 + 2, y1 + 8, x1 + 2, y1 + 2);
      line(x1 + 2, y1 + 2, x1 + 5, y1 + 2);
      line(x1 + 5, y1 + 2, x1 + 5, y1 + 8);
      line(x1 + 5, y1 + 8, x1 + 8, y1 + 8);
      line(x1 + 8, y1 + 8, x1 + 8, y1 + 2);
    end;
  end;
end;

end.


