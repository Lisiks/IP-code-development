program DKR7;
uses Peano_curwe;
uses GraphABC;

var
  x0, y0, range_key:integer;

procedure key_press(key:integer);
begin
  case key of
    VK_A: x0 -= 80;
    VK_D: x0 += 80;
    VK_W: y0 -= 80;
    VK_S: y0 += 80;
    VK_E: range_key *= 3;
  end;
  
  if (key = VK_Q) and (range_key >= 3) then
    range_key := range_key div 3;
  
  if key in [VK_A, VK_D, VK_W, VK_S, VK_E, VK_Q] then
  begin
    clearwindow(clblack);
    DrawRectangle(x0-2, y0-2, x0+(3*3*3)  * range_key + 4, y0+(3*3*3)  * range_key + 4);
    Peano_curwe.draw_peano(x0, y0, x0+(3*3*3) * range_key, y0+(3*3*3) * range_key,  'left_top-right_bottom');
  end;
end;

begin
  x0 := 230;
  y0:=230;
  range_key := 1;
  
  window.Width := 800;
  window.Height := 800;
  
  Pen.Color := clwhite;
  clearwindow(clblack);
  
  DrawRectangle(x0-2, y0-2, x0+(3*3*3) * range_key + 4, y0+(3*3*3) * range_key + 4);
  Peano_curwe.draw_peano(x0, y0, x0+(3*3*3) , y0+(3*3*3),  'left_top-right_bottom');
  OnKeyDown := key_press;
end.
