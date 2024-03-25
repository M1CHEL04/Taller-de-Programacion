Program ej2;
procedure imprimirNumero (aux: integer);
begin 
	if(aux <> 0 )then begin
		writeln(aux MOD 10);
		aux:= aux DIV 10;
		imprimirNumero (aux);
	end;
end;

var
	num: integer;
begin
	writeln('ingrese un numero');
	read(num);
	while(num <> 0)do begin
		writeln('el numero es: ');
		imprimirNumero(num);
		writeln('ingrese un numero');
		read(num);
	end;
end.
