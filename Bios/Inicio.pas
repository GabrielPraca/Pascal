Program Inicio;
Uses CHardware, BiosLogo, BiosInicio, CRT;
Var key: char;

Begin
 Writeln('Alt+Enter para entrar no modo Tela Cheia');
 delay(5000);
 desenhaLogo(34, 22);
 delay(500);
 ReconheceHardware;
 if keypressed then
 Begin
  key:= readkey;
  if key = #0 then
  Begin
   key:= readkey;
   if key = #83 then
    iniciaBios;
  End;
 End;
 delay(10000);
End.
