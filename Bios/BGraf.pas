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
       Write('Ä');
       gotoxy(i, by);
       Write('Ä');
      End;
   1: Begin
       gotoxy(i, ay);
       Write('Í');
       gotoxy(i, by);
       Write('Í');
      End;
  End;
 End;
 for i:=ay+1 to by-1 do
 Begin
  Case linha of
   0: Begin
       gotoxy(ax, i);
       Write('³');
       gotoxy(bx, i);
       Write('³');
      End;
   1: Begin
       gotoxy(ax, i);
       Write('º');
       gotoxy(bx, i);
       Write('º');
      End;
  End;
 End;
 Case linha of
  0: Begin
      gotoxy(bx, ay);
      Write('¿');
      gotoxy(ax, by);
      Write('À');
      gotoxy(bx, by);
      Write('Ù'); 
      gotoxy(ax, ay);
      Write('Ú');
     End;
  1: Begin
      gotoxy(bx, ay);
      Write('»');
      gotoxy(ax, by);
      Write('È');
      gotoxy(bx, by);
      Write('¼'); 
      gotoxy(ax, ay);
      Write('É');
     End;
 End;
End;

End.
