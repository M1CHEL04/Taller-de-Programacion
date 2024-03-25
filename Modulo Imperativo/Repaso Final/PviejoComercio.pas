program comercio;
type
	compra=record
		codC: integer;
		dia: integer;
		cantP: integer;
		montoTotal: real;
	end;
	compraRed= record
		dia: integer;
		cantP: integer;
		montoTotal: real;
	end;
	lista=^nodoL;
	nodoL=record
		d:compraRed;
		sig:lista;
	end;
	datoA= record
		codC:integer;
		info: lista;
	end;
	arbol=^nodoA;
	nodoA=record
		d:datoA;
		hi:arbol;
		hd:arbol;
	end;

procedure lectura (var  c: compra);
begin
	writeln('ingrese la cantidad de productos');
	readln(c.cantP);
	if(c.cantP<>0)then begin
		writeln('ingrese el codigo de cliente');
		readln(c.codC);
		writeln('ingrese el dia en el que se realizo la compra');
		readln(c.dia);
		writeln('ingrese el monto total de la compra');
		readln(c.montoTotal);
	end;
end;

procedure addLista (var l: lista; cantP,dia: integer; monto: real);
var
	n: lista;
begin
	new(n);
	n^.d.cantP:= cantP;
	n^.d.dia:= dia;
	n^.d.montoTotal:= monto;
	n^.sig:=l;
	l:=n;
end;

procedure addArbol (var a: arbol; c: compra);
begin
	if(a=nil)then begin
		new(a);
		a^.d.info:=nil;
		a^.d.codC:=c.codC;
		addLista(a^.d.info,c.cantP,c.dia,c.montoTotal);
		a^.hi:=nil;
		a^.hd:= nil;
	end
	else
		if(a^.d.codC = c.codC)then
			addLista(a^.d.info,c.cantP,c.dia,c.montoTotal)
		else
			if(a^.d.codC> c.codC)then
				addArbol(a^.hi,c)
			else
				addArbol(a^.hd,c);
end;

procedure cargarArbol (var a: arbol);
var
	c: compra;
begin
	lectura(c);
	while(c.cantP<>0)do begin
		addArbol(a,c);
		lectura(c);
	end;
end;

procedure imprimirLista (l:lista);
begin
	while (l<>nil)do begin
		writeln('La cantidad de articulos es: ',l^.d.cantP);
		l:=l^.sig;
	end;
end;

procedure imprimirArbol (a: arbol);
begin
	if(a<>nil)then begin
		imprimirArbol(a^.hi);
		writeln('El codigo de cliente: ',a^.d.codC,' hizo estas compras: ');
		imprimirLista(a^.d.info);
		imprimirArbol(a^.hd);
	end;
end;



function comprasClienteX (a:arbol; x: integer): lista;
begin
	if(a=nil)then
		comprasClienteX:=nil
	else
		if(a^.d.codC=x)then
			comprasClienteX:= a^.d.info
		else
			if(a^.d.codC>x)then
				comprasClienteX:= comprasClienteX(a^.hi,x)
			else
				comprasClienteX:= comprasClienteX(a^.hd,x);
end;

function montoMax (l: lista): real;
var
	aux: real;
	max: integer;
begin
	max:=-1;
	aux:=-1;
	while(l<>nil)do begin
		if(l^.d.cantP>max)then begin
			aux:= l^.d.montoTotal;
			max:= l^.d.cantP;
		end;
		l:=l^.sig;
	end;
	montoMax:=aux;
end;

procedure puntoByC (a: arbol);
var
	x: integer;
	comprasX: lista;
begin
	writeln('ingrese el codigo de clinete a buscar');
	readln(x);
	comprasX:= comprasClienteX(a,x);
	if(comprasX=nil)then
		writeln('El cliente ',x,' no hizo ninguna compra.')
	else begin
		writeln('Las compras que hizo el cliente ',x,' son: ');
		imprimirLista(comprasX);
	end;
	writeln('El monto de la compra con mayor cantidad de productos es: ',montoMax(comprasX));
end;

var
	a: arbol;
begin
	a:= nil;
	cargarArbol(a);
	writeln('Arbol: ');
	imprimirArbol(a);
	puntoByC(a);
end.
