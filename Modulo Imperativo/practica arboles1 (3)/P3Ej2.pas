program ej2;
type
	ventas= record
		cod: integer;
		fecha: integer;
		cantVendida: integer;
	end;
	arbol1=^nodo1;
	nodo1= record
		d: ventas;
		hi: arbol1;
		hd: arbol1;
	end;
	ventasRed= record
		cod: integer;
		cantVendida: integer;
	end;
	arbol2=^nodo2;
	nodo2= record
		dato: ventasRed;
		hi:arbol2;
		hd: arbol2;
	end;
	
procedure lectura (var v: ventas);
begin
	writeln('ingrese el codigo de producto');
	readln(v.cod);
	if(v.cod<>0)then begin
		writeln('ingrese la fecha en la que se vendio el producto');
		readln(v.fecha);
		writeln('ingrese la cantidad vendida');
		readln(v.cantVendida);
	end;
end;

procedure agregar_arbol1 (var a: arbol1; v: ventas);
begin
	if(a=nil)then begin 
		new(a);
		a^.d:= v;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else begin
		if(v.cod <= a^.d.cod)then
			agregar_arbol1(a^.hi,v)
		else
			agregar_arbol1(a^.hd,v);
		end;
end;

procedure agregar_arbol2 (var a:arbol2; cod, cantVendida: integer);
begin
	if(a=nil)then begin
		new (a);
		a^.dato.cod:= cod;
		a^.dato.cantVendida:= cantVendida;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else if(cod=a^.dato.cod)then
		a^.dato.cantVendida:= a^.dato.cantVendida + cantVendida
	else if(cod < a^.dato.cod)then
		agregar_arbol2(a^.hi,cod,cantVendida)
	else 
		agregar_arbol2(a^.hd,cod,cantVendida);
end;

procedure cargar_arboles (var a1: arbol1; var a2: arbol2);
var
	v:ventas;
begin
	lectura(v);
	while(v.cod<>0) do begin
		agregar_arbol1(a1,v);
		agregar_arbol2(a2,v.cod,v.cantVendida);
		lectura(v);
	end;
end;

procedure inicializar_arboles (var a1: arbol1; var a2: arbol2);
begin
	a1:= nil;
	a2:= nil;
end;

function buscar_ventas_arbol1 (a: arbol1; codigo: integer): integer;
begin
	if(a=nil)then 
		buscar_ventas_arbol1:= 0
	else
		if(a^.d.cod=codigo)then
			buscar_ventas_arbol1:= a^.d.cantVendida + buscar_ventas_arbol1(a^.hi,codigo)
		else
			if(a^.d.cod < codigo)then
				buscar_ventas_arbol1:= buscar_ventas_arbol1(a^.hd,codigo)
			else 
				buscar_ventas_arbol1:= buscar_ventas_arbol1(a^.hi,codigo);
end;

function buscar_ventas_arbol2 (a:arbol2; codigo: integer): integer;
begin
	if (a= nil) then
		buscar_ventas_arbol2:= 0;
		
	else
		if(codigo <= a^.dato.codigo)then
			buscar_ventas_arbol2
end;

var
	a1: arbol1;
	a2: arbol2;
	codigo: integer;
	
begin
	inicializar_arboles (a1,a2);
	cargar_arboles(a1,a2);
	writeln('ingrese el codigo de producto a buscar');
	readln(codigo);
	writeln ('el codigo de producto ', codigo, ' vendio ',buscar_ventas_arbol1(a1,codigo),' unidades.');
	writeln('ingrese el codigo a buscar');
	readln(codigo);
	writeln('el codigo de producto ', codigo, 'vendio ', buscar_ventas_arbol2(a2,codigo),' unidades.');
end.
