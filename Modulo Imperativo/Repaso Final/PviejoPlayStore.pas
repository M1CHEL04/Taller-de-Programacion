program playstore;
const
	DF= 12;
type
	rango= 1..DF;
	compra= record
		codJ: integer;
		codC: integer;
		mes: rango;
	end;
	compraRed= record
		codJ: integer;
		mes: rango;
	end;
	lista=^nodoL;
	nodoL= record
		d:compraRed;
		sig:lista;
	end;
	datoA=record
		codC:integer;
		info: lista;
	end;
	arbol= ^nodoA;
	nodoA=record
		d: datoA;
		hi: arbol;
		hd: arbol;
	end;
	vect= array [rango] of integer;
	
procedure lectura (var c: compra);
begin
	writeln('ingrese el codigo de cliente');
	readln(c.codC);
	if(c.codC<>0)then begin
		writeln('ingrese el codigo del juego');
		readln(c.codJ);
		writeln('ingrese el mes de la compra');
		readln(c.mes);
	end;
end;

procedure addLista (var l: lista; codJ: integer; mes: rango);
var
	n: lista;
begin
	new(n);
	n^.d.codJ:= codJ;
	n^.d.mes:=mes;
	n^.sig:=l;
	l:=n;
end;

procedure addArbol (var a: arbol; c: compra);
begin
	if(a=nil)then begin
		new(a);
		a^.d.info:=nil;
		a^.d.codC:= c.codC;
		addLista(a^.d.info,c.codJ,c.mes);
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if(a^.d.codC>c.codC)then
			addArbol(a^.hi,c)
		else
			addArbol(a^.hd,c);
end;

procedure cargarEstructuras (var a: arbol; var v: vect);
var
	c:compra;
begin
	lectura(c);
	while(c.codC<>0)do begin
		addArbol(a,c);
		v[c.mes]:= v[c.mes] +1;
		lectura(c);
	end;
end;

procedure inicializar (var a: arbol; var v: vect);
var
	i: integer;
begin
	a:=nil;
	for i:= 1 to DF do
		v[i]:=0;
end;

procedure imprimirLista (l: lista);
begin
	writeln('hiozo las siguentes compras: ');
	while (l<>nil)do begin
		writeln('el codigo de videojuego es: ',l^.d.codJ);
		l:=l^.sig;
	end;
end;

procedure imprimirArbol (a: arbol);
begin
	if(a<> nil)then begin
		imprimirArbol(a^.hi);
		write('el codigo de cliente : ',a^.d.codC);
		imprimirLista(a^.d.info);
		imprimirArbol(a^.hd);
	end;
end;

procedure imprimirVector (v: vect);
var
	i: integer;
begin
	for i:= 1 to DF do 
		writeln ('En el mes ',i,' se hicieron ',v[i],' ventas.');
end;

function comprasClienteX (a: arbol; x: integer): lista;
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

procedure seleccion (var v: vect);
var
	i,j,posm:rango;
	aux: integer;
begin
	for i:= 1 to (DF-1)do begin
		posm:=i;
		for j:= (i+1) to DF do;
			if(v[j]>v[posm])then
				posm:=j;
		aux:= v[posm];
		v[posm]:=v[i];
		v[i]:=aux;
	end;
end;

var
	a: arbol;
	v: vect;
	comprasCliente: lista;
begin
	inicializar(a,v);
	cargarEstructuras(a,v);
	writeln('Arbol: ');
	imprimirArbol(a);
	writeln('Vector: ');
	imprimirVector(v);
	comprasCliente:= comprasClienteX(a,23);
	imprimirLista(comprasCliente);
	seleccion(v);
	imprimirVector(v);
end.

