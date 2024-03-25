program ej6;
procedure binario (aux: integer);
begin
	if (aux<>0)then begin
		binario(aux DIV 2);
		write(aux MOD 2);
	end;
end;

procedure lectura();
var
	aux: integer;
begin
	writeln ('ingrese el numero a transformar');
	read(aux);
	while(aux<>0)do begin
		writeln('el numero ', aux, ' en binario es: ');
		binario(aux);
		readln(aux);
	end;
end;

begin
	lectura ();
end.
