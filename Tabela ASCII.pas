Program Tabela_ASCII;
var i: integer;

Begin
 for i:=0 to $FF do
  Write(i, '=', chr(i), ' ');
 readln;
End.
