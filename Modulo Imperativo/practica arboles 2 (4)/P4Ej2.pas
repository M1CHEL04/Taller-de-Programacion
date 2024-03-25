program ej2;
type
	prestamo= record
		isbn: integer;
		nSocio: integer;
		fechaD: integer;
		fechaM: integer;
		tiempo: integer;
	end;
	arbol1=^nodo1;
	nodo1= record
		d: prestamo;
		hi: arbol1;
		hd: arbol1;
	end;
	prestamoRed = record
		nSocio: integer;
		fechaD: integer;
		fechaM: integer;
		tiempo: integer;
	end;
	
	lista= ^nodolista;
	nodolista = record
		d: prestamoRed;
		sig: lista;
	end;
	
	dato = record
		isbn: integer;
		pres: lista;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record	
		d: dato;
		hi: arbol2;
		hd: arbol2;
	end;
	
	arbol3=^nodo3;
	datoA3= record
		isbn: integer;
		prestamos_totales: integer;
	end;
	nodo3= record
		d: datoA3;
		hi: arbol3;
		hd: arbol3;
	end;
	listaG=^nodoG;
	nodoG= record
		d: datoA3;
		sig: listaG;
	end;
	
procedure lectura(var p: prestamo);
begin
	writeln('ingrese el numero de isbn');
	readln(p.isbn);
	if(p.isbn<>-1)then begin
		writeln('ingrese el numero de socio');
		readln(p.nSocio);
		writeln('ingrese el dia que se inicio el prestamo');
		readln(p.fechaD);
		writeln('ingrese el mes en el que se inicio el prestamo');
		readln(p.fechaM);
		writeln('ingrese la cantidad de dias del prestamo');
		readln(p.tiempo);
	end;
end;	

procedure add_arbol1 (var a: arbol1; p: prestamo);
begin
	if(a=nil)then begin
		new(a);
		a^.d:= p;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
		if(p.isbn<= a^.d.isbn)then
			add_arbol1(a^.hi,p)
		else
			add_arbol1(a^.hd,p);
end;

procedure add_lista (var l: lista; nSocio, fechaD, fechaM, tiempo: integer);
var
	nuevo: lista;
begin
	new (nuevo);
	nuevo^.d.nSocio:= nSocio;
	nuevo^.d.fechaD:= fechaD;
	nuevo^.d.fechaM:= fechaM;
	nuevo^.d.tiempo:= tiempo;
	nuevo^.sig:= l;
	l:= nuevo;
end;

procedure add_arbol2 (var a: arbol2; p: prestamo);
begin
	if(a=nil)then begin
		new(a);
		a^.d.pres:= nil;
		a^.d.isbn:= p.isbn;
		add_lista(a^.d.pres,p.nSocio,p.fechaD,p.fechaM,p.tiempo);
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
		if(p.isbn = a^.d.isbn)then
			add_lista(a^.d.pres,p.nSocio,p.fechaD,p.fechaM,p.tiempo)
		else
			if (p.isbn<a^.d.isbn)then
				add_arbol2(a^.hi,p)
			else
				add_arbol2 (a^.hd,p);
end;

procedure cargar_arboles (var a1: arbol1; var a2: arbol2);
var
	p: prestamo;
begin
	lectura(p);
	while(p.isbn<>-1)do begin
		add_arbol1(a1,p);
		add_arbol2(a2,p);
		lectura(p);
	end;
end;

function max(a: arbol1): integer;
begin
	if(a=nil)then
		max:= -1
	else
		if(a^.hd <> nil)then 
			max:= max(a^.hd)
		else
			max:= a^.d.isbn;
end;

function minimo (a: arbol2): integer;
begin
	if (a = nil) then
		minimo:= -1
	else
		if (a^.hi <> nil) then
			minimo:= minimo (a^.hi)
		else
			minimo:= a^.d.isbn;
end;

function prestamos_socio_D(a: arbol1; nSocio: integer):integer;
begin
	if(a=nil)then
		prestamos_socio_D:= 0
	else
		if(a^.d.nSocio=nSocio)then
			prestamos_socio_D:= 1 + prestamos_socio_D(a^.hi,nSocio) + prestamos_socio_D (a^.hd,nSocio)
		else
			prestamos_socio_D:= prestamos_socio_D(a^.hi,nSocio)+ prestamos_socio_D(a^.hd,nSocio);
end;

function cant_prestamo_lista (l:lista; nSocio: integer): integer;
var
	cant: integer;
begin
	cant:= 0;
	while (l<>nil)do begin
		if(l^.d.nSocio=nSocio)then begin
			cant:= cant + 1;
			l:= l^.sig;
		end
		else
			l:= l^.sig;
	end;
	cant_prestamo_lista:= cant;
end;

function cant_prestamo_arbol2 (a2: arbol2; nSocio: integer): integer;
begin
	if(a2=nil)then
		cant_prestamo_arbol2:= 0
	else
		cant_prestamo_arbol2:= cant_prestamo_lista(a2^.d.pres,nSocio) + cant_prestamo_arbol2(a2^.hi,nSocio) + cant_prestamo_arbol2(a2^.hd,nSocio);
end;

procedure inicializar_arboles (var a1: arbol1; var a2: arbol2; var a3: arbol3; var l: listaG);
begin
	a1:= nil;
	a2:= nil;
	a3:= nil;
	l:= nil;
end;

procedure add_arbol3 ( var a3: arbol3; isbn: integer);
begin
		if(a3=nil)then begin
			new(a3);
			a3^.d.isbn:= isbn;
			a3^.d.prestamos_totales:= 1;
			a3^.hi:= nil;
			a3^.hd:= nil;
		end
		else
			if(a3^.d.isbn=isbn)then
				a3^.d.prestamos_totales:= a3^.d.prestamos_totales + 1
			else
				if(a3^.d.isbn>isbn)then
					add_arbol3(a3^.hi,isbn)
				else
					add_arbol3(a3^.hd,isbn);
end;

procedure recorrer_arbol1_agregar (a1: arbol1; var a3: arbol3);
begin
  if(a1<>nil)then
    recorrer_arbol1_agregar(a1^.hi,a3);
    add_arbol3(a3,a1^.d.isbn);
    recorrer_arbol1_agregar(a1^.hd,a3);
end;

function cant_prestamo_lista_isbn (l: lista): integer;
var
	cant: integer;
begin
	cant:= 0;
	while (l<>nil)do begin
		cant:= cant + 1;
		l:=l^.sig; 
	end;
	cant_prestamo_lista_isbn:= cant;
end;

procedure insertarOrdenado (var l: listaG; a2: arbol2);
var
	nuevo,ant,act: listaG;
begin
	new(nuevo);
	nuevo^.d.isbn:= a2^.d.isbn;
	nuevo^.d.prestamos_totales:= cant_prestamo_lista_isbn(a2^.d.pres);
	ant:= l;
	act:= l;
	while(act<>nil)and(a2^.d.isbn>act^.d.isbn)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(ant=act)then
		l:= nuevo
	else
		ant^.sig:= nuevo;
	nuevo^.sig:= act;
end;

procedure cargar_listaG (var Lg: listaG; a2: arbol2);
begin
	insertarOrdenado(Lg,a2);
	cargar_listaG(Lg,a2^.hi);
	cargar_listaG(Lg,a2^.hd);
end;

procedure Imprimir_arbol1 (a1:arbol1);
begin
	if(a1<>nil)then begin
		Imprimir_arbol1(a1^.hi);
		writeln('para el arbol 1, el numero de isbn es: ', a1^.d.isbn);
		Imprimir_arbol1(a1^.hd);
	end;
end;

procedure Imprimir_arbol2 (a2: arbol2);
begin
	if(a2<>nil)then begin
		Imprimir_arbol2(a2^.hi);
		writeln('para el arbol 2, el numero de isbn es: ', a2^.d.isbn);
		Imprimir_arbol2(a2^.hd);
	end;
end;

procedure Imprimir_arbol3 (a3: arbol3);
begin
	if(a3<>nil)then begin
		Imprimir_arbol3(a3^.hi);
		writeln('la cantidad de prestamos que tuvo el isbn ', a3^.d.isbn,'fueron: ', a3^.d.prestamos_totales,' prestamos.');
		Imprimir_arbol3(a3^.hd);
	end;
end;

procedure Imprimir_listaG (l:listaG);
begin
	while (l<>nil)do begin
		writeln('para el isbn: ', l^.d.isbn,'se hicieron ', l^.d.prestamos_totales,' prestamos.');
		l:= l^.sig;
	end;
end;

function prestamos_entre_dos (a1: arbol1; li,ls:integer): integer;
begin
	if(a1= nil)then
		prestamos_entre_dos:= 0
	else
		if(a1^.d.isbn>li)then
			if(a1^.d.isbn<ls)then
				prestamos_entre_dos:= 1 + prestamos_entre_dos(a1^.hi,li,ls) + prestamos_entre_dos(a1^.hd,li,ls)
			else
				prestamos_entre_dos:= prestamos_entre_dos(a1^.hi,li,ls)
		else
			prestamos_entre_dos:= prestamos_entre_dos(a1^.hd,li,ls);
end;

function prestamos_entre_dos_arbol2(a2: arbol2; li,ls: integer): integer;
begin
	if(a2= nil)then
		prestamos_entre_dos_arbol2:= 0
	else
		if(a2^.d.isbn>li)then
			if(a2^.d.isbn<ls)then
				prestamos_entre_dos_arbol2:= cant_prestamo_lista_isbn(a2^.d.pres) + prestamos_entre_dos_arbol2(a2^.hi,li,ls) + prestamos_entre_dos_arbol2(a2^.hd,li,ls)
			else
				prestamos_entre_dos_arbol2:= prestamos_entre_dos_arbol2(a2^.hi,li,ls)
		else
			prestamos_entre_dos_arbol2:= prestamos_entre_dos_arbol2 (a2^.hd,li,ls);
end;

var
	a1: arbol1;
	a2: arbol2;
	a3: arbol3;
	Socio_a_buscar,li,ls: integer;
	lg:listaG;
	
begin
	inicializar_arboles(a1,a2,a3,lg);
	cargar_arboles (a1, a2);
	Imprimir_arbol1(a1);
	Imprimir_arbol2(a2);
	writeln('el isbn maximo del arbol 1 es: ', max(a1));
	writeln ('el isbn minimo del arbol 2 es: ', minimo(a2));
	writeln('ingrese el numero de socio que se desea saber la cantidad de prestamos que se le hicieron');
	readln(Socio_a_buscar);
	writeln('al numero de socio ', Socio_a_buscar, ' se le hicieron: ', prestamos_socio_D(a1,Socio_a_buscar), ' prestamos.');
	writeln ('ignrse el numerop de socio que se desea saber la cantidad de prestamos que se le hicieron');
	readln(Socio_a_buscar);
	writeln('al numeor de socio ', Socio_a_buscar,' se le hicieron ', cant_prestamo_arbol2(a2,Socio_a_buscar),' prestamos.');
	recorrer_arbol1_agregar(a1,a3);
	Imprimir_arbol3(a3);
	cargar_listaG(lg,a2);
	Imprimir_listaG(lg);
	writeln('ingrese el numero isbn mayor');
	readln(ls);
	writeln('ingrese el numero de isbn menor');
	readln(li);
	writeln ('la cantidad de prestamos que hay entre el isbn ', li,' y el isbn ', ls,' es de ', prestamos_entre_dos(a1,li,ls),' prestamos.');
	writeln('ingrese el numero de isbn mayor');
	readln(ls);
	writeln('ingrese el numero de isbn menor');
	readln(li);
	writeln('la cantidad de prestamos que hay entre el isbn ', li,' y el isbn ',ls,' es de ', prestamos_entre_dos_arbol2(a2,li,ls), 'prestamos.');
end.
