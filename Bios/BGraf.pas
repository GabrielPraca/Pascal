Unit BGraf;

Interface

Uses CRT;

Procedure DesenhaRetangulo(ax, ay, bx, by, linha: ShortInt);

Implementation

Procedure DesenhaRetangulo(ax, ay, bx, by, linha: ShortInt);
var i: Shortint;
Begin
 for i:=ax+1 to bx-1 do
 Begin
  Case linha of
   0: Begin
       gotoxy(i, ay);
       Write('�');
       gotoxy(i, by);
       Write('�');
      End;
   1: Begin
       gotoxy(i, ay);
       Write('�');
       gotoxy(i, by);
       Write('�');
      End;
  End;
 End;
 for i:=ay+1 to by-1 do
 Begin
  Case linha of
   0: Begin
       gotoxy(ax, i);
       Write('�');
       gotoxy(bx, i);
       Write('�');
      End;
   1: Begin
       gotoxy(ax, i);
       Write('�');
       gotoxy(bx, i);
       Write('�');
      End;
  End;
 End;
 Case linha of
  0: Begin
      gotoxy(bx, ay);
      Write('�');
      gotoxy(ax, by);
      Write('�');
      gotoxy(bx, by);
      Write('�'); 
      gotoxy(ax, ay);
      Write('�');
     End;
  1: Begin
      gotoxy(bx, ay);
      Write('�');
      gotoxy(ax, by);
      Write('�');
      gotoxy(bx, by);
      Write('�'); 
      gotoxy(ax, ay);
      Write('�');
     End;
 End;
End;

End.
