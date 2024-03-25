program biblioteca;
type
	prestamo=record
		isbn: integer;
		nPrestamo: integer;
		codSocio: integer;
	end;
	datoA=record
		isbn:integer;
		pTotal:integer;
	end;
	arbol=^nodoA;
	nodoA=record
		d:datoA;
		hi:arbol;
		hd:arbol;
	end;
	datoL=record
		codSocio:integer;
		pTotal:integer;
	end;
	lista=^nodoL;
	nodoL=record
		d:datoL;
		sig:lista;
	end;
		
procedure lectura (var p: prestamo);
begin
	writeln('Ingrese el codigo de socio');
	readln(p.codSocio);
	if(p.codSocio<>0)then begin
		writeln('Ingrese el isbn del libro prestado');
		readln(p.isbn);
		writeln('Ingrese el nPrestamo');
		readln(p.nPrestamo);
	end;
end;

procedure addLista (var l: lista; x,codSocio:integer);
var
	n: lista;
begin
	new(n);
	n^.d.codSocio:=codSocio;
	n^.d.pTotal:=x;
	n^.sig:=l;
	l:=n;
end;

procedure addArbol (var a: arbol; isbn:integer);
begin
	if(a=nil)then begin
		new(a);
		a^.d.isbn:=isbn;
		a^.d.pTotal:=1;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if(a^.d.isbn=isbn)then
			a^.d.pTotal:= a^.d.pTotal +1
		else
			if(a^.d.isbn>isbn)then
				addArbol(a^.hi,isbn)
			else
				addArbol(a^.hd,isbn);
end;

procedure cargarEstructuras (var a: arbol; var l: lista);
var
	p: prestamo;
	actCod,cant:integer;
begin
	lectura(p);
	while(p.codSocio<>0)do begin
		actCod:=p.codSocio;
		cant:=0;
		while(p.codSocio=actCod)do begin
			addArbol(a,p.isbn);
			cant:=cant+1;
			lectura (p);
		end;
		addLista(l,cant,actCod);
	end;
end;

procedure inicializar (var a: arbol; var l: lista);
begin
	a:=nil;
	l:=nil;
end;

procedure imprimirArbol (a: arbol);
begin
	if(a<>nil)then begin
		imprimirArbol(a^.hi);
		writeln('El isbn ',a^.d.isbn,' tuvo ',a^.d.pTotal,' prestamos.');
		imprimirArbol(a^.hd);
	end;
end;

procedure imprimirLista (l:lista);
begin
	while(l<>nil)do begin
		writeln('El numero de socio ',l^.d.codSocio,' realizo ',l^.d.pTotal,' prestamos.');
		l:=l^.sig;
	end;
end;

function prestamosIsbnX (a: arbol; x: integer): integer;
begin
	if(a=nil)then
		prestamosIsbnX:=0
	else
		if(a^.d.isbn=x)then
			prestamosIsbnX:= a^.d.pTotal
		else
			if(a^.d.isbn>x)then
				prestamosIsbnX:= prestamosIsbnX(a^.hi,x)
			else
				prestamosIsbnX:= prestamosIsbnX(a^.hd,x);
end;

function mayoresPrestamosX (l:lista; x: integer):integer;
begin
	if(l=nil)then
		mayoresPrestamosX:=0
	else
		if(l^.d.pTotal>x)then
			mayoresPrestamosX:= 1 + mayoresPrestamosX(l^.sig,x)
		else
			mayoresPrestamosX:= mayoresPrestamosX(l^.sig,x);
end;

var
	a:arbol;
	l:lista;
begin
	inicializar(a,l);
	cargarEstructuras(a,l);
	writeln('Arbol: ');
	imprimirArbol(a);
	writeln('Lista: ');
	imprimirLista(l);
	writeln('El numero de isbn 7 estuvo en ',prestamosIsbnX(a,7),' prestamos.');
	writeln('La cantidad socios que tienen mas de 2 prestamos son: ',mayoresPrestamosX(l,2));
end.
