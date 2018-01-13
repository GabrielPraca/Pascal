Program Simulador_Celular;

Uses Crt, Graph, Windows;

Type Bitmap = record
	R: array[1..512, 1..512] of byte;
	G: array[1..512, 1..512] of byte;
	B: array[1..512, 1..512] of byte;
	End;
	
	Telap = record
	R: array[1..128, 1..160] of byte;
	G: array[1..128, 1..160] of byte;
	B: array[1..128, 1..160] of byte;
	End;

var tela: Telap;
	bufferbit: array[1..$F] of Bitmap;
	sair: boolean;

Procedure startGraph();
var gm, gd: SmallInt;
Begin
	gm:= 0;
	gd:= 0;
	initGraph(gm, gd, '');
End;

Function existeArquivo(caminho: string): Boolean;
var arq: file of byte;
Begin
	Assign(arq, caminho);
	{$I-}
	Reset(arq);
	{$I+}
	if (IOResult = 0) then
		existeArquivo:= true
	else
		existeArquivo:= false;
	close(arq);
End;

Procedure addBitmap(buf: byte; x, y, xi, yi, xf, yf: integer);
var i, ii, xd, yd: integer;
Begin
	xd:= xf-xi+1;
	yd:= yf-yi+1;
	for ii:=1 to yd do
		for i:=1 to xd do
		Begin
			tela.R[i+x, ii+y]:= bufferbit[buf].R[xi+i-1, yi+ii-2];
			tela.G[i+x, ii+y]:= bufferbit[buf].G[xi+i-1, yi+ii-2];
			tela.B[i+x, ii+y]:= bufferbit[buf].B[xi+i-1, yi+ii-2];
		End;
End;

Procedure carregaBitmap(buf: byte; caminho: string);
var arq: file of byte;
	Buffer4b: array[1..4] of byte;
	largura, altura, vazio, x, y: integer;
Begin
	if not(existeArquivo(caminho)) then
		exit;
	assign(arq, caminho);
	reset(arq);
	blockRead(arq, buffer4b, 2);
	if not((buffer4b[1] = $42) and (buffer4b[2] = $4D)) then
		exit;
	seek(arq, 18);
	blockRead(arq, buffer4b, 4);
	largura:= buffer4b[1]+buffer4b[2]<<8+buffer4b[3]<<16+buffer4b[4]<<24;
	blockRead(arq, buffer4b, 4);
	altura:= buffer4b[1]+buffer4b[2]<<8+buffer4b[3]<<16+buffer4b[4]<<24;
	vazio:= (fileSize(arq)-(3*(largura*altura)+55)) div altura;
	seek(arq, 54);
	for y:=1 to altura do
	Begin
		for x:=1 to largura do
		Begin
			blockRead(arq, buffer4b, 3);
			bufferbit[buf].R[x-1, altura-y-1]:= buffer4b[3];
			bufferbit[buf].G[x-1, altura-y-1]:= buffer4b[2];
			bufferbit[buf].B[x-1, altura-y-1]:= buffer4b[1];
		End;
		blockRead(arq, buffer4b, vazio);
	End;
	close(arq);
End;

Procedure DrawTela();
var x, y: integer;
Begin
	for y:=1 to 160 do
		for x:=1 to 128 do
		Begin
			setRGBPalette(0, tela.R[x, y], tela.G[x, y], tela.B[x, y]);
			putPixel(x - 1, y - 1, 0);
		End;
End;

Begin
	startGraph;
	carregaBitmap(1, 'Firmware/load.bmp');
	addBitmap(1, 0, 0, 0, 0, 128, 160);
	DrawTela();
	readln;
	closeGraph;
End.
