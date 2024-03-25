program ej3;
type
	rFinal= record
		cod: integer;
		nota: integer;
	end;
	lista=^nodo;
	nodo= record
		d: rFinal;
		sig: lista;
	end;
	alumno= record
		legajo: integer;
		dni: integer;
		ingreso: integer;
		finales: lista;
	end;
	arbol= ^nodoArbol;
	nodoArbol= record
		d: alumno;
		hi: arbol;
		hd: arbol;
	end;
	lista2=^nodo2;
	infoB= record
		dni: integer;
		ingreso: integer;
	end;
	nodo2= record
		d: infoB;
		sig: lista2;
	end;

procedure addLista(var l: lista; d: rFinal);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.d:= d;
	nuevo^.sig:= l;
	l:= nuevo;
end;

procedure lectura (var a: alumno);
var
	f: rFinal;
begin
	a.finales:= nil;
	writeln('ingrese el nuemero de legajo');
	readln(a.legajo);
	if(a.legajo<>0)then begin
		writeln('ingrese el dni del alumno');
		readln(a.dni);
		writeln('ingrese el ano de ingreso');
		readln(a.ingreso);
		writeln('ingrese el codigo de materia');
		readln(f.cod);
		while (f.cod<>-1)do begin
			writeln('ingrese la nota de la materia');
			readln(f.nota);
			addLista(a.finales,f);
			writeln('ingrese el codigo de materia');
			readln(f.cod);
		end;
	end;
end;

procedure add_arbol (var a: arbol; alu: alumno);
begin
	if (a=nil)then begin
		new(a);
		a^.d:= alu;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else 
		if(alu.legajo<=a^.d.legajo)then
			add_arbol(a^.hi,alu)
		else
			add_arbol(a^.hd,alu);
end;

procedure cargar_arbol (var a: arbol);
var
	alu: alumno;
begin
	lectura(alu);
	while(alu.legajo<>0)do begin
		add_arbol(a,alu);
		lectura(alu);
	end;
end;

procedure addLista2(var l: lista2; dni, ingreso: integer);
var
	nuevo: lista2;
begin
	new(nuevo);
	nuevo^.d.dni:= dni;
	nuevo^.d.ingreso:= ingreso;
	nuevo^.sig:= l;
	l:= nuevo;
end;

procedure recorrer_b (a: arbol; leg: integer; var l2: lista2);
begin
	if(a<>nil)then
		if(leg >= a^.d.legajo)then begin
			recorrer_b(a^.hi,leg,l2);
			addLista2(l2,a^.d.dni,a^.d.ingreso);
			recorrer_b(a^.hd,leg,l2);
		end
		else 
			recorrer_b(a^.hi,leg,l2);
end;

procedure puntoB(a: arbol; var l2: lista2);
var
	leg: integer;
begin
	writeln('ingrese el numero de legajo para buscar sus menores');
	readln(leg);
	recorrer_b(a,leg,l2);
end;

procedure imprimir_lista (l: lista2);
begin
	while (l<>nil)do begin
		writeln('el dni es: ', l^.d.dni);
		l:= l^.sig;
	end;
end;

function max (a: arbol): integer; 
begin
	if(a<>nil)then begin
		if(a^.HD<>nil)then
			max:= max(a^.HD)
		else
			max:= a^.d.legajo;
	end
	else
		max:=1;
end;

function mayor_entre_dos (v1,v2: integer): integer;
begin
	if(v1>v2)then
		mayor_entre_dos:= v1;
	else
		mayor_entre_dos:= v2;
end;

function maxDNI (a: arbol): integer;
begin
	if(a=nill)then
		maxDNI:=-1;
	else
		maxDNI:= mayor_entre_dos(a^.d.dni, mayor_entre_dos(maxDNI(a^.hi), maxDNI(a^.hd)));
end:



var
	a: arbol;
	l2: lista2;
begin
	l2:= nil;
	a:= nil;
	cargar_arbol(a);
	puntoB(a,l2);
	imprimir_lista(l2);
	writeln('el numero de legajo mas grande es: ', max(a));
	writeln('el numero de DNI mas grande es: ', maxDNI(a));
	
end.
