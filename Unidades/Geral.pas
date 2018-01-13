Unit Geral;

Interface

Const PI = 3.1415926535897932385;

Function ToInteger(n: real): integer;

Implementation

Function ToInteger(n: real): integer;
Begin
 ToInteger:= Round(n);
End;

End.
