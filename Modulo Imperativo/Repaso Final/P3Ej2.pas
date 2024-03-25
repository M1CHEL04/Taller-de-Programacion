program ej2;
type
	venta= record
		codP: integer;
		cantU: integer;
		fecha: integer;
	end;
	vXu= record
		codP: integer;
		total: integer;
	end;
	arbol1=^nodo1;
	nodo1=record
		d:venta;
		hi:arbol1;
		hd:arbol1;
	end;
	arbol2=^nodo2;
	nodo2=record
		d:vXu;
		hi:arbol2;
		hd:arbol2;
	end;

procedure inicializarArboles (var a1: arbol1; var a2: arbol2);
begin
	a1:=nil;
	a2:=nil;
end;

procedure lectura (var v: venta);
begin
	writeln('ingrese el codigo de producto');
	read(v.codP);
	if(v.codP<>0)then begin
		writeln('ingrese la cantidad de unidades vendidas');
		read(v.cantU);
		writeln('ingrese la fecha de la venta');
		read(v.fecha);
	end;
end;

procedure addArbol1 (var a1:arbol1; v: venta);
begin
	if(a1=nil)then begin
		new(a1);
		a1^.d:=v;
		a1^.hi:=nil;
		a1^.hd:=nil;
	end
	else
		if(a1^.d.codP >= v.codP)then
			addArbol1(a1^.hi,v)
		else
			addArbol1(a1^.hd,v);
end;

procedure addArbol2 (var a2: arbol2; codP: integer; unidades:integer);
begin
	if(a2=nil)then begin
		new(a2);
		a2^.d.codP:=codP;
		a2^.d.total:=unidades;
		a2^.hi:=nil;
		a2^.hd:=nil;
	end
	else
		if(a2^.d.codP=codP)then
			a2^.d.total:= a2^.d.total + unidades
		else
			if(a2^.d.codP>codP)then
				addArbol2(a2^.hi,codP,unidades)
			else
				addArbol2(a2^.hd,codP,unidades);
end;

procedure cargarArboles (var a1: arbol1; var a2: arbol2);
var
	v:venta;
begin
	lectura(v);
	while(v.codP<>0)do begin
		addArbol1(a1,v);
		addArbol2(a2,v.codP,v.cantU);
		lectura(v);
	end;
end;

function totalVentasA1 (a1:arbol1; codBuscar: integer):integer;
begin
	if(a1=nil)then
		totalVentasA1:= 0
	else
		if(a1^.d.codP=codBuscar)then
			totalVentasA1:= a1^.d.cantU + totalVentasA1(a1^.hi,codBuscar)
		else
			if(a1^.d.codP>codBuscar)then
				totalVentasA1:= totalVentasA1(a1^.hi,codBuscar)
			else
				totalVentasA1:= totalVentasA1(a1^.hd,codBuscar);
end;

function totalVentasA2 (a2:arbol2; codBuscar: integer):integer;
begin
	if(a2=nil)then
		totalVentasA2:=0
	else
		if(a2^.d.codP=codBuscar)then
			totalVentasA2:= a2^.d.total
		else
			if(a2^.d.codP>codBuscar)then
				totalVentasA2:= totalVentasA2(a2^.hi,codBuscar)
			else
				totalVentasA2:= totalVentasA2(a2^.hd,codBuscar);
end;

var
	a1:arbol1;
	a2:arbol2;
begin
	cargarArboles(a1,a2);
	writeln('La cantidad de ventas del cod de producto 2 es: ',totalVentasA1(a1,2));
	writeln('La cantidad de ventas del cod de producto 2 es: ',totalVentasA2(a2,2));
end.
