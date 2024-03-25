program e1j;
type
	lista=^NODO;
	NODO=record
		d:integer;
		sig:lista;
	end;

procedure addLista (var l: lista; x: integer);
var
	n,aux: lista;
begin
	new (n);
	n^.d:=x;
	n^.sig:=nil;
	if(l=nil)then
		l:=n
	else begin
		aux:=l;
		while(aux<>nil)do 
			aux:= aux^.sig;
		aux^.sig:=n;
	end;
end;

procedure addListaA (var l:lista; x: integer);
var
	n: lista;
begin
	new (n);
	n^.d:=x;
	n^.sig:=l;
	l:=n;
end;

procedure imprimirLista (l:lista);
begin
	while(l<>nil)do begin
		writeln(l^.d);
		l:=l^.sig;
	end;
end;

procedure eliminar (var l:lista; x: integer);
var
	ant,act:lista;
begin
	act:=l;
	while(act<>nil)and(act^.d<>x)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act<>nil)then begin
		if(act=l)then
			l:=l^.sig
		else
			ant^.sig:=act^.sig;
		dispose(act);
	end;
end;

procedure addOrdenado (var l: lista; x: integer);
var
	act,ant,n: lista;
begin
	new(n);
	n^.d:=x;
	act:=l;
	ant:=l;
	while(act<>nil)and(act^.d<x)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act=ant)then
		l:=n
	else
		ant^.sig:=n;
	n^.sig:=act;
end;

procedure cargar (var l: lista);
var
	x: integer;
begin
	writeln('ingresa');
	readln(x);
	while (x<>0)do begin
		addOrdenado(l,x);
		writeln('ingresa');
		readln(x);
	end;
end;

procedure eliminarMultiple (var l: lista; x: integer);
var
	act, ant: lista;
begin
	act:= l;
	while(act<>nil)do begin
		if(act^.d<>x)then begin
			ant:=act;
			act:=act^.sig;
		end
		else
			if(act=l)then begin
				l:=l^.sig;
				dispose(act);
				act:=l;
			end
			else begin
				ant^.sig:= act^.sig;
				dispose(act);
				act:=ant;
			end;
	end;
end;

var
	l:lista;
begin
	l:=nil;
	cargar(l);
	imprimirLista(l);
	eliminarMultiple(l,3);
	writeln('aaaaa');
	imprimirLista(l);
end.
