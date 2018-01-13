Program ID_Cor;
uses CRT;
var i: Shortint;

Begin
 for i:=0 to 15 do
 Begin
  textcolor(i);
  textBackground(i);
  Write('L¢gica ‚ legal'); 
  textcolor(15);
  textBackground(0);
  Writeln(' N§ ', i);
 End;
 readln;
End.
