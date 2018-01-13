Unit BiosLogo;

Interface

Uses CRT;

Procedure DesenhaLogo(x, y: ShortInt);

Implementation

Procedure DesenhaLogo(x, y: ShortInt);
var i: ShortInt;
Begin
 textbackground(0);
 textcolor(15);
 clrscr;
 gotoxy(x, y);
 write(#219#219#219#0#219#219#219#0#219#219#219#0#219#219#219);
 gotoxy(x, y+1);
 write(#219#0#0#0#0#219#0#0#219#0#0#0#219);
 gotoxy(x, y+2);
 write(#219#219#0#0#0#219#0#0#219#219#0#0#219);
 gotoxy(x, y+3);
 write(#219#0#0#0#0#219#0#0#219#0#0#0#219);
 gotoxy(x, y+4);
 write(#219#219#219#0#0#219#0#0#219#219#219#0#219#219#219);
 textColor(14);
 for i:=0 to 14 do
 Begin
  delay(200);
  gotoxy(x+i, y+6);
  writeln(#219);
 End;
End;

End.
