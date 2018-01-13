Program Grav;

Uses Crt;

const MAX_BUFFER = 1024 * 1024 * 8;

var arquivo: file of byte;
	Buffer: array[0..MAX_BUFFER] of byte;
	i, iFim: integer;

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

Begin
	Write('Inicializando...');
	//Cria e associa o arquivo
	Assign(arquivo, 'arquivo.bin');
	Rewrite(arquivo);
	
	//Preenche o Buffer
	for	i := 0 to MAX_BUFFER do
		Buffer[i] := 1;
	
	iFim := (1024 * 1024 * 1024) div MAX_BUFFER;
	
	clrscr;
	Write('Gravando...');
	
	for i := 0 to iFim do
		blockWrite(arquivo, Buffer, MAX_BUFFER);
End.
