program pizzeria;
type
	compra= record
		dni: integer;
		nombre: string;
		fecha: string;
		monto: real;
	end;
	compraRed= record
		fecha: string;
		monto: real;
	end;
	lista=^nodoL;
	nodoL=record
		d:compraRed;
		sig:lista;
	end;
	datoA= record
		dni: integer;
		nombre: string;
		info: lista;
	end;
	arbol=^nodoA;
	nodoA=record
		d:datoA;
		hi:arbol;
		hd:arbol;
	end;

procedure lectura (var c: compra);
begin
	writeln ('Ingrese el monto de la compra');
	readln(c.monto);
	if(c.monto<>0)then begin
		writeln('Ingrese el dni del comprador');
		readln(c.dni);
		writeln('Ingrese el nombre del comprador');
		readln(c.nombre);
		writeln('Ingrese la fecha que se realizo la compra');
		readln(c.fecha);
	end;
end;

procedure addLista (var l: lista; fecha: String; monto: real );
var
	n:lista;
begin
	new(n);
	n^.d.fecha:=fecha;
	n^.d.monto:=monto;
	n^.sig:=l;
	l:=n;
end;

procedure addArbol (var a: arbol; c: compra);
begin
	if(a=nil)then begin
		new(a);
		a^.d.dni:=c.dni;
		a^.d.nombre:=c.nombre;
		a^.d.info:=nil;
		addLista(a^.d.info,c.fecha,c.monto);
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if(a^.d.dni=c.dni)then
			addLista(a^.d.info,c.fecha,c.monto)
		else
			if(a^.d.dni>c.dni)then
				addArbol(a^.hi,c)
			else
				addArbol(a^.hd,c);
end;

procedure cargarArbol (var a: arbol);
var
	c: compra;
begin
	lectura(c);
	while(c.monto<>0)do begin
		addArbol(a,c);
		lectura(c);
	end;
end;

procedure imprimirLista (l: lista);
begin
	while (l<>nil)do begin
		writeln('el monto de la compra es: ',l^.d.monto);
		l:=l^.sig;
	end;
end;

procedure imprimirArbol (a: arbol);
begin
	if(a<>nil)then begin
		imprimirArbol(a^.hi);
		writeln('El DNI ',a^.d.dni,' hizo las siguientes compras: ');
		imprimirLista(a^.d.info);
		imprimirArbol(a^.hd);
	end;
end;

function recorrerListaB (l: lista; x:string): integer;
var
	aux:integer;
begin
	aux:=0;
	while (l<>nil)do begin
		if(l^.d.fecha = x)then
			aux:= aux+1;
		l:=l^.sig;
	end;
	recorrerListaB:= aux;
end;

function recorrerArbolB(a: arbol; x: string): integer;
begin
	if(a=nil)then 
		recorrerArbolB:=0
	else
		recorrerArbolB:= recorrerListaB(a^.d.info,x) + recorrerArbolB(a^.hi,x) + recorrerArbolB(a^.hd,x);
end;

procedure recorrerListaC (l:lista; var montoTotal: real; var ventas: integer);
begin
	while(l<>nil)do begin
		montoTotal:= montoTotal+ l^.d.monto;
		ventas:= ventas+1;
		l:=l^.sig
	end;
end;

procedure recorrerArbolC (a: arbol; dni:integer; var montoTotal: real; var ventas: integer);
begin
	if(a<>nil)then
		if(a^.d.dni=dni)then
			recorrerListaC(a^.d.info,montoTotal,ventas)
		else
			if(a^.d.dni>dni)then
				recorrerArbolC(a^.hi,dni,montoTotal,ventas)
			else
				recorrerArbolC(a^.hd,dni,montoTotal,ventas)
	else
		ventas:=0;
end;

var
	a:arbol;
	x: string;
	montoTotal:real;
	ventas,dni: integer;
	
begin
	a:=nil;
	cargarArbol(a);
	imprimirArbol(a);
	writeln('ingrese la fecha a buscar');
	readln(x);
	writeln('La cantidad de ventas que se realizaron en la fecha ',x,' son: ',recorrerArbolB(a,x));
	montoTotal:=0;
	ventas:=0;
	writeln('ingrese el dni que desea saber las compras');
	readln(dni);
	recorrerArbolC(a,dni,montoTotal,ventas);
	writeln('El dni ',dni,' realizo ',ventas,' compras y en total tiene un monto de ',montoTotal,' pesos.')
end.
