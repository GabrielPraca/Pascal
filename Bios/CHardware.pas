Unit CHardware;

Interface

Uses DOS, CRT;

Procedure ReconheceHardware;

Implementation

Procedure ReconheceHardware;
var hora, min, seg, msec: Word;
    key: char;
Begin
 GetTime(hora, min, seg, msec);
 textbackground(0);
 textcolor(7);
 clrscr;
 textcolor(1);
 Writeln(stdout, #7);
 gotoxy(1, 1);
 Writeln(#219);
 Write(#219);
 textcolor(7);
 gotoxy(2, 1);
 Write('Phoenix - AwardBIOS v6.00PG, An Energy Star Ally');
 gotoxy(2, 2);
 Write('Copyright (C) 1984-2006, Phoenix Technologies, LTD');
 gotoxy(1, 49);
 Write('Press DEL to enter SETUP');
 textcolor(15);
 gotoxy(7, 49);
 Write('DEL');
 textcolor(7); 
 gotoxy(1, 50);
 Write('10/25/2007-P4M890-8237-6A7L8M48C-00');
 gotoxy(1, 4);
 Write('W7255VTI V9.4B1 102507 ', hora:2, ':', min:2, ':', seg:2);
 delay(20);
 gotoxy(1, 6);
 Write('Main Processor : Intel(R) Celeron(R) 2.92GHz(266x11.0)');
 delay(2000);
 gotoxy(1, 7);
 Write('Memory Testing : 1571776K OK');
 delay(20);
 gotoxy(1, 8);
 Write('CPU Brand Name : Intel(R) Celeron(R) CPU          450  @ 2.20GHz');
 gotoxy(1, 9);
 Write('EM64T CPU');
 delay(500);
 gotoxy(1, 11);
 Write('DDR DIMM Speed : ');
 textcolor(15);
 Write('533');
 textcolor(7);
 gotoxy(1, 12);
 Write('DDR DIMM Data Width : ');
 textcolor(15);
 Write('64-Bit, Single Channel');
 delay(20);
 textcolor(7);
 gotoxy(1, 13);
 Write('PCI Express Slot0 : ');
 textcolor(15);
 Write('x16 Lane Widths');
 textcolor(7);
 gotoxy(1, 14);
 Write('Detecting IDE Drives ...');
 delay(1100);
 textcolor(7);
 gotoxy(1, 14);
 Write('IDE Channel 0 Master : None');
 delay(5);
 gotoxy(1, 15);
 Write('IDE Channel 0 Slave : None');
 delay(5);
 gotoxy(1, 16);
 Write('IDE Channel 1 Master : DVDRW  20X20X12 6A31');
 delay(5);
 gotoxy(1, 17);
 Write('IDE Channel 1 Slave : None');
 gotoxy(1, 19);
 Write('Detecting IDE Drives ...');
 delay(1100);
 gotoxy(1, 19);
 Write('IDE Channel 2 Master : SAMSUNG HD082GJ JE100-19');
 delay(5);
 gotoxy(1, 20);
 Writeln('IDE Channel 3 Master : None');
 delay(2000);
End;

End.
