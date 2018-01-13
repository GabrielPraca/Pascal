Program Som;

uses CRT, Windows;

Const duracao = 50;
      nota_do = 264;
      nota_re = 297;
      nota_mi = 330;
      nota_fa = 352;
      nota_sol = 396;
      nota_la = 440;
      nota_si = 495;
      nota_dos = 278;
      nota_res = 312;
      nota_fas = 370;
      nota_sols = 416;
      nota_las = 467;

var tom: integer;
    key: char;

Begin
 tom := 1;
 write('Tom n¡vel ',tom);
 repeat
 Begin
  if keypressed then
  Begin
   key:= upcase(readkey);
   if key = #0 then
   Begin
    key:= readkey;
    if key = #72 then
    begin
     inc(tom);
     Beep(tom, duracao);
    end;
    if (key = #80) and (tom > 1) then
    begin
     dec(tom);   
     Beep(tom, duracao);
    end;
    clrscr;
    write('Tom n¡vel ',tom);
   End
   else
   Begin
    case key of
     'Q': Beep(nota_do * (2 ** (tom - 1)), duracao);
     'W': Beep(nota_re * (2 ** (tom - 1)), duracao);
     'E': Beep(nota_mi * (2 ** (tom - 1)), duracao);
     'R': Beep(nota_fa * (2 ** (tom - 1)), duracao);
     'T': Beep(nota_sol * (2 ** (tom - 1)), duracao);
     'Y': Beep(nota_la * (2 ** (tom - 1)), duracao);
     'U': Beep(nota_si * (2 ** (tom - 1)), duracao);
     'I': Beep(nota_do * (2 ** tom), duracao);
     '2': Beep(nota_dos * (2 ** (tom - 1)), duracao);
     '3': Beep(nota_res * (2 ** (tom - 1)), duracao);
     '5': Beep(nota_fas * (2 ** (tom - 1)), duracao);
     '6': Beep(nota_sols * (2 ** (tom - 1)), duracao);
     '7': Beep(nota_las * (2 ** (tom - 1)), duracao);
     #27: break;
    End;
   End;
  End;
 sleep(1);
 End;
 Until false;
End.
