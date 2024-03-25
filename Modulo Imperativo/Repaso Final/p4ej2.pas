program ej2;
type
	prestamo=record
		ISBN:integer;
		nSocio: integer;
		fecha: integer;
		dura: integer;
	end;
	prestamoRed=record
		nSocio:integer;
		fecha:integer;
		dura:integer;
	end;
	arbol1=^nodo1;
	nodo1=record
		d:prestamo;
		hi:arbol1;
		hd:arbol1;
	end;
	lista=^nodol;
	nodol=record
		d:prestamoRed;
		sig:lista;
	end;
	regArbol2=record
		ISBN:integer;
		info:lista;
	end;
	arbol2=^nodo2;
	nodo2=record
		d:regArbol2;
		hi:arbol2;
		hd:arbol2;
	end;
	datoA3=record
		ISBN:integer;
		total_prestamos:integer;
	end;
	arbol3=^nodo3;
	nodo3=record
		d:datoA3;
		hi:arbol3;
		hd:arbol3;
	end;
	listaG=^nodoG;
	nodoG=record
		d:datoA3;
		sig:listaG;
	end;
	
procedure lectura (var p:prestamo);
begin
	writeln('ingrese el numero de ISBN');
	read(p.ISBN);
	if( p.ISBN <> -1)then begin
		writeln('ingrese el numero de numero de socio del solicitante');
		read(p.nSocio);
		writeln('ingrese la fecha en la que se inicio el prestamo');
		read(p.fecha);
		writeln('ingrese la cantidad de dias que dura el prestamo');
		read(p.dura);
	end;
end;
	
procedure addArbol1 (var a1:arbol1; p:prestamo);
begin
	if(a1=nil)then begin
		new (a1);
		a1^.d:=p;
		a1^.hd:=nil;
		a1^.hi:=nil;
	end
	else 
		if(a1^.d.ISBN >= p.ISBN)then
			addArbol1(a1^.hi,p)
		else
			addArbol1(a1^.hd,p);
end;

procedure addLista (var l:lista; nSocio:integer; fecha:integer; duracion:integer);
var
	n:lista;
begin
	new (n);
	n^.d.nSocio:=nSocio;
	n^.d.fecha:=fecha;
	n^.d.dura:=duracion;
	n^.sig:=l;
	l:=n;
end;

procedure addArbol2 (var a2: arbol2; p:prestamo);
begin
	if(a2=nil)then begin
		new (a2);
		a2^.d.ISBN:= p.ISBN;
		a2^.d.info:=nil; //inicializo la lista
		addLista(a2^.d.info,p.nSocio,p.fecha,p.dura);
		a2^.hi:=nil;
		a2^.hd:=nil;
	end
	else
		if(a2^.d.ISBN=p.ISBN)then
			addLista(a2^.d.info,p.nSocio,p.fecha,p.dura)
		else
			if(a2^.d.ISBN > p.ISBN)then
				addArbol2(a2^.hi,p)
			else
				addArbol2(a2^.hd,p);
end;

procedure cargarArboles (var a1:arbol1;var a2: arbol2);
var
	p: prestamo;
begin
	lectura(p);
	while(p.ISBN <> -1)do begin
		addArbol1(a1,p);
		addArbol2(a2,p);
		lectura(p);
	end;
end;

function max (a1:arbol1):integer;
begin
	if(a1=nil)then
		max:=-1
	else
		if(a1^.hd <> nil)then
			max:= max (a1^.hd)
		else
			max:= a1^.d.ISBN;
end;

function min (a2:arbol2):integer;
begin
	if(a2 = nil)then
		min:=-1
	else
		if(a2^.hi <> nil)then
			min:= min (a2^.hi)
		else
			min:= a2^.d.ISBN;
end;

function prestamoXSocio1 (a1:arbol1;socioABuscar:integer):integer;
begin
	if(a1=nil)then
		prestamoXSocio1:= 0
	else
		if(a1^.d.nSocio= socioABuscar)then
			prestamoXSocio1:= 1 + prestamoXSocio1(a1^.hi,socioABuscar) + prestamoXSocio1(a1^.hd,socioABuscar)
		else
			prestamoXSocio1:= prestamoXSocio1(a1^.hi,socioABuscar) + prestamoXSocio1(a1^.hd,socioABuscar);
end;

function cantPrestamosLista (l:lista;socio:integer):integer;
var
	cant:integer;
begin
	cant:=0;
	while(l<>nil)do begin
		if(l^.d.nSocio=socio)then
			cant:=cant+1;
		l:=l^.sig;
	end;
	cantPrestamosLista:=cant;
end;

function prestamoXSocio2 (a2:arbol2;socio:integer):integer;
begin
	if(a2=nil)then
		prestamoXSocio2:=0
	else
		prestamoXSocio2:= cantPrestamosLista(a2^.d.info,socio) + prestamoXSocio2(a2^.hi,socio) + prestamoXSocio2(a2^.hd,socio);
end;

procedure addArbol3 (var a3:arbol3; isbn:integer);
begin
	if(a3=nil)then begin
		new(a3);
		a3^.d.ISBN:= isbn;
		a3^.d.total_prestamos:= 1;
		a3^.hi:=nil;
		a3^.hd:=nil;
	end
	else
		if(a3^.d.ISBN = isbn)then
			a3^.d.total_prestamos:= a3^.d.total_prestamos +1
		else
			if(a3^.d.ISBN > isbn)then
				addArbol3(a3^.hi,isbn)
			else
				addArbol3(a3^.hd,isbn);
end;

procedure cargarArbol3 (var a3: arbol3; a1:arbol1);
begin
	if(a1<>nil)then begin
		cargarArbol3(a3,a1^.hi);
		addArbol3(a3,a1^.d.ISBN);
		cargarArbol3(a3,a1^.hd);
	end;
end;

function cantPrestamosListaG (l:lista):integer;
var
	cant:integer;
begin
	cant:=0;
	while(l<>nil)do begin
		cant:= cant+1;
		l:=l^.sig;
	end;
	cantPrestamosListaG:=cant;
end;

procedure addOrdenadoL (var lg: listaG; isbn: integer; l:lista);
var
	n,ant,act:listaG;
begin
	new(n);
	n^.d.ISBN:=isbn;
	n^.d.total_prestamos:= cantPrestamosListaG(l);
	ant:=lg;
	act:=lg;
	while ((act<>nil)and(isbn>act^.d.ISBN))do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(ant=act)then
		lg:=n
	else
		ant^.sig:=n;
	n^.sig:=act;
end;

procedure cargarListaG (var lg:listaG;a2:arbol2);
begin
	if(a2<>nil)then begin
		cargarListaG(lg,a2^.hi);
		addOrdenadoL(lg,a2^.d.ISBN,a2^.d.info);
		cargarListaG(lg,a2^.hd);
	end;
end;

procedure inicializarArboles (var a1: arbol1; var a2:arbol2; var a3:arbol3; var lg:listaG);
begin
	a1:=nil;
	a2:=nil;
	a3:=nil;
	lg:=nil;
end;

procedure imprimirA1 (a1:arbol1);
begin
	if(a1<>nil)then begin
		imprimirA1(a1^.hi);
		writeln('Arbol 1 - isbn: ',a1^.d.ISBN);
		imprimirA1(a1^.hd);
	end;
end;

procedure imprimirA2(a2:arbol2);
begin
	if(a2<>nil)then begin
		imprimirA2(a2^.hi);
		writeln('Arbol 2 - isbn: ',a2^.d.ISBN);
		imprimirA2(a2^.hd);
	end;
end;

procedure imprimirA3 (a3:arbol3);
begin
	if(a3<>nil)then begin
		imprimirA3(a3^.hi);
		writeln('Para el numero de isbn = ',a3^.d.ISBN,' se realizaron ',a3^.d.total_prestamos,' prestamos.');
		imprimirA3(a3^.hd);
	end;
end;

procedure imprimirLg (lg:listaG);
begin
	while(lg<>nil)do begin
		writeln('para el isbn : ',lg^.d.isbn,' se le realizaron ',lg^.d.total_prestamos,' prestamos.');
		lg:=lg^.sig;
	end;
end; 

var
	a1:arbol1;
	a2:arbol2;
	a3:arbol3;
	lg:listaG;

begin
	inicializarArboles(a1,a2,a3,lg);
	cargarArboles(a1,a2);
	imprimirA1(a1);
	imprimirA2(a2);
	writeln('El isbn maximo del arbol 1 es: ',max(a1));
	writeln('El isbn minimo del arbol 2 es: ',min(a2));
	writeln('Al socio numero: 3345 se le otorgaron',prestamoXSocio1(a1,3345),' prestamos.');
	writeln('Al socio numero: 9987 se le otorgaron',prestamoXSocio2(a2,9987),' prestamos.');
	cargarArbol3(a3,a1);
	imprimirA3(a3);
	cargarListaG(lg,a2);
	imprimirLg(lg);
end.
