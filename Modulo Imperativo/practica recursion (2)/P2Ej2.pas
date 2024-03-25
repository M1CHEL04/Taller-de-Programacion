program ej2;
procedure imprimirNum(aux: integer);
begin
	if(aux<>0)then begin
		writeln(aux MOD 10);
		aux:= aux DIV 10;
		imprimirNum(aux);
	end;
end;

var
	num: integer;
begin
	writeln('ingrese el numero');
	readln(num);
	while(num<>0)do begin
		imprimirNum(num);
		writeln('ingrese el numero');
		readln(num);
	end;
end.
