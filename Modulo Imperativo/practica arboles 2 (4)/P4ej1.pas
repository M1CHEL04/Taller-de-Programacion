program ej1;
type
	ventas= record
		codV: integer;
		codP: integer;
		cantV: integer;
		PUnidad: real;
	end;
	V_almacenar= record
		codP: integer;
		totalV: integer;
		totalP: real;
	end;
	arbol=^nodo;
	nodo= record
		d: V_almacenar;
		hi: arbol;
		hd: arbol;
	end;
	lista=^nodoL;
	datosLista= record
		codP: integer;
		cantV: integer;
	end;
	nodoL= record
		d: datosLista;
		sig: lista;
	end;

procedure lectura (var v: ventas);
begin
	writeln('ingrese el codigo de venta');
	readln(v.codV);
	if(v.codV<>-1)then begin
		writeln('ingrese el codigo de producto');
		readln(v.codP);
		writeln('ingrese la cantidad de unidades vendidas');
		readln(v.cantV);
		writeln('ingrese el precio por unidad del producto');
		readln(v.PUnidad);
	end;
end;

procedure add_arbol (var a: arbol; codP, cantV: integer; PUnidad: real);
begin
	if(a=nil)then begin
		new(a);
		a^.d.codP:= codP;
		a^.d.totalV:= cantV;
		a^.d.totalP:= (PUnidad * cantV);
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else 
		if (a^.d.codP=codP)then begin
			a^.d.totalV:= a^.d.totalV + cantV;
			a^.d.totalP:= a^.d.totalP + (PUnidad * cantV);
		end
		else 
			if( codP < a^.d.codP)then
				add_arbol(a^.hi,codP,cantV,PUnidad)
			else
				add_arbol(a^.hd,codP,cantV,PUnidad);
end;

procedure cargar_arbol (var a: arbol);
var
	v: ventas;
begin
	lectura(v);
	while(v.codV<>-1)do begin
		add_arbol(a,v.codP,v.cantV,v.PUnidad);
		lectura(v);
	end;
end;

procedure imprimir_arbol (a: arbol);
begin
	if(a<>nil)then begin
		imprimir_arbol(a^.hi);
		writeln('el codigo de producto ',a^.d.codP,' vendio ', a^.d.totalV,' unidades y el monto total recaudado de este producto es ', a^.d.totalP :3:0,' pesos');
		imprimir_arbol(a^.hd);
	end;
end;

function mayor (v1,v2:integer):integer;
begin
	if(v1>v2)then
		mayor:= v1
	else
		mayor:= v2;
end;

procedure codigo_de_producto_mas_vendido (a:arbol; var max, codPmax:integer); {max viene inicializado desde el programa principal}
begin
	if(a<>nil)then begin
		codigo_de_producto_mas_vendido(a^.hi,max,codPmax);
		if(a^.d.totalV>max)then	begin
			max:= a^.d.totalV;
			codPmax:= a^.d.codP;
		end;
		codigo_de_producto_mas_vendido(a^.hd,max,codPmax);
	end;	
end;

{function codP_mas_vendido(a: arbol): integer;
begin
	if(a=nil)then
		codP_mas_vendido:= -1
	else
		codP_mas_vendido:= mayor(a^)
end;}

procedure add_lista (var l:lista; codP,cantV: integer);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.d.codP:= codP;
	nuevo^.d.cantV:= cantV;
	nuevo^.sig:= l;
	l:= nuevo;
end;

procedure recorrer_d (a: arbol; aux: integer; var l:lista); 
begin
	if(a<>nil)then
		if(aux >= a^.d.codP)then begin
			recorrer_d(a^.hi,aux,l);
			add_lista(l,a^.d.codP,a^.d.totalV);
			recorrer_d(a^.hd,aux,l);
		end
		else
			recorrer_d(a^.hi,aux,l);
end;

procedure puntoD (a: arbol; var l: lista);
var
	aux: integer;
begin
	writeln('ingrese el codigo de prodcuto que se desdea buscar sus menores');
	readln(aux);
	recorrer_d(a,aux,l);
end;

procedure imprimir_lista (l: lista);
begin
	if(l<>nil)then begin
		writeln('el codigo de producto es: ', l^.d.codP);
		imprimir_lista(l^.sig);
	end;
end;

function sumar_ventas (a: arbol; Li,Ls: integer): integer;
begin
	if(a<>nil)then
		if(a^.d.totalV >= Li)then
			if (a^.d.totalV <= Ls) then 
				sumar_ventas:= a^.d.totalV + sumar_ventas(a^.hi,Li,Ls) + sumar_ventas(a^.hd,Li,Ls)
			else 
				sumar_ventas:= sumar_ventas(a^.hi,Li,Ls)
		else
			sumar_ventas(a^.hd,Li,Ls)
	else
		sumar_ventas:= 0;
end;

var
	a: arbol;
	max, codPmax,Li,Ls: integer;
	l:lista;
begin
	a:= nil;
	l:= nil;
	cargar_arbol(a);
	imprimir_arbol(a);
	max:=-1;
	codigo_de_producto_mas_vendido(a,max,codPmax);
	writeln('el codigo de producto mas vendido es ', codPmax);
	puntoD(a,l);
	imprimir_lista(l);
	writeln('ingrese el limite superior');
	readln(Ls);
	writeln('ingrese el limite inferior');
	readln(Li);
	writeln('la cantidad de ventas entre los codidigos de producto ', Ls,' y ', Li,' es: ', sumar_ventas(a,Li,Ls),' unidades.');
end.
