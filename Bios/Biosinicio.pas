Unit BiosInicio;

Interface

Uses CRT, BGraf;
Var Opcs: integer;
    Opcstr: array[0..11] of String;

Procedure IniciaBios;

Implementation

Procedure AtualizaOpcao;
var i: integer;
Begin
 for i:=0 to 11 do
 Begin
  if i <= 5 then
   gotoxy(3, 5+(i*2))
  else
   gotoxy(43, 5+((i-6)*2));
  if i = Opcs then
  Begin
   textcolor(15);
   textbackground(4);
  End
  else
  Begin
   textcolor(14);
   textbackground(1);
  End;
  Write(Opcstr[i]);
 End;
End;

Procedure IniciaBios;
var i: integer;
Begin
 textbackground(1);
 textcolor(15);
 clrscr;
 desenhaRetangulo(1, 43, 80, 46, 0);
 desenhaRetangulo(1, 2, 80, 50, 1);
 for i:=3 to 42 do
 Begin
  gotoxy(41, i);
  Write('³');
 End;
 gotoxy(41, 43);
 Write('Á');
 gotoxy(21, 1);
 Write('Phoenix - AwardBIOS CMOS Setup Utility');
 opcstr[0]:= #16' Standard CMOS Features';
 opcstr[1]:= #16' Advanced BIOS Features';
 opcstr[2]:= #16' Integrated Peripherals';
 opcstr[3]:= #16' Power Management Setup';
 opcstr[4]:= #16' PnP/PCI Configurations';
 opcstr[5]:= #16' H/W Monitor';
 opcstr[6]:= #16' Frequency/Voltage Control';
 opcstr[7]:= #16' Load Fail-Safe Defaults';
 opcstr[8]:= #16' Load Potimized Defaults';
 opcstr[9]:= #16' BIOS Setting Password';
 opcstr[10]:= #16' Save & Exit Setup';
 opcstr[11]:= #16' Exit Without Saving';
 atualizaOpcao;
End;
End.
