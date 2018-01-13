Program ID_Cor;
uses CRT;
var key: char;

Begin
 repeat
 Begin
  key:= readkey;
  textbackground(0);
  clrscr;
  textcolor(14);
  textbackground(1);
  if key = #0 then
  Begin
   gotoxy(36, 12);
   Write('Especial');
   key:= readkey;
  End;
  gotoxy(31, 13);   
  Write('           ');  
  gotoxy(31, 13);   
  Write('Caracter: ', key);
  gotoxy(42, 13);
  Write(' ID: ', ord(key));
 End;
 Until false
End.
