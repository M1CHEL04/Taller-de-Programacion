program ej5;
procedure binario (aux: integer);
begin
	if(aux <> 0)then begin
		binario (aux DIV 2);
		write (aux MOD 2);
	end;
end;

procedure lectura ();
var
	num: integer;
begin
	writeln('ingrese un numero');
	read(num);
	while(num<>0)do begin
		binario(num);
		writeln('ingrese un numero');
		read(num);
	end;
end;
begin
	lectura();
end.
