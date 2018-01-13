Program Som;
uses CRT;
var i, ii: integer;

Begin
 for ii:=0 to 4 do
 Begin
  for i:=0 to 200 do
  Begin
   sound(i*10);
   delay((ii+1)*2);
   nosound;
  End;
  for i:=0 to 200 do
  Begin
   sound((200-i)*10);
   delay((ii+1)*2);
   nosound;
  End;
 End;
End.
