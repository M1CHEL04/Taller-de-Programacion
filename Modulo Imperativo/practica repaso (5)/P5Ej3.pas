program ej3;
const
	dimF=10;
type
	rango= 1..dimF;
	producto= record
		cod:integer;
		rubro: rango;
		stock: integer;
		PxU: real;
	end;
	arbol=^nodo;
	nodo=record
		d:producto;
		hi:arbol;
		hd:arbol;
	end;
	vProducto= array[rango]of arbol;

procedure lectura (var p:producto);
begin
	writeln('ingrese el codigo de producto');
	readln(p.cod);
	if(p.cod<>-1)then begin
		writeln('ingrese el rubro');
		readln(p.rubro);
		writeln('ingrese el stock del producto');
		readln(p.stock);
		writeln('ingrese el precio por unidad del producto');
		readln(p.PxU);
	end;
end;

procedure add_arbol(var a:arbol; p: producto);
begin
	if(a=nil)then begin
		new(a);
		a^.d:=p;
		a^.hi:= nil;
		a^.hd:=nil;
	end
	else
		if(a^.d.cod>=p.cod)then
			add_arbol(a^.hi,p)
		else
			add_arbol(a^.hd,p);
end;

procedure cargar_vector (var v:vProducto);
var
	p:producto;
begin
	lectura(p);
	while(p.cod<>-1)do begin
		add_arbol(v[p.rubro],p);
		lectura(p);
	end;
end;

procedure crear_arbol (var v: vProducto);
var
	i: rango;
begin
	for i:= 1 to dimF do
		v[i]:= nil;
end;

function recorrer_arbol (a:arbol; cod: integer):boolean;
begin
	if(a=nil)then
		recorrer_arbol:= false
	else
		if (a^.d.cod=cod)then
			recorrer_arbol:= true
		else
			if(a^.d.cod>cod)then
				recorrer_arbol:= recorrer_arbol(a^.hi,cod)
			else
				recorrer_arbol:= recorrer_arbol(a^.hd,cod);
end;

procedure punto_b (v:vProducto);
var
	cod: integer;
	rubro: integer;
begin
	writeln('ingrese el codigo de producto a buscar');
	readln(cod);
	writeln('ingrese el el rubro del prudcto a buscar');
	readln(rubro);
	if(recorrer_arbol(v[rubro],cod))then
		writeln('el codigo de producto ', cod,' se ha encontrado')
	else
		writeln('el codigo de producto ', cod, 'no se ha encontrado');
end;

procedure imprimir_arbol (a:arbol);
begin
	if(a<>nil)then begin
		imprimir_arbol(a^.hi);
		writeln('el codigo de producto es: ', a^.d.cod);
		imprimir_arbol(a^.hd);
	end;
end;

procedure imprimir_vector (v:vProducto);
var
	i: rango;
begin
	for i:= 1 to dimF do
		writeln('en el rubro ', i,':');
		imprimir_arbol(v[i]);
end;

procedure max (a: arbol; var maxCod, maxCodStock:integer);
begin
	if(a<>nil)then
		if(a^.d.cod> maxCod)then begin
			maxCod:= a^.d.cod;
			maxCodStock:= a^.d.stock;
			max(a^.hd,maxCod,maxCodStock);
		end
		else
			max(a^.hd,maxCod,maxCodStock);
end;

procedure max_vector (v:vProducto);
var
	i,maxCod,maxCodStock:integer;
begin
	for i:= 1 to dimF do begin
		maxCod:= -1; 
		max(v[i],maxCod,maxCodStock);
		writeln('el codigo de producto de mayor valor numerico del rubro ', i, ' es: ',maxCod,' y tiene ', maxCodStock,' productos de stock.');
	end;
end;

function entre_dos (a: arbol; li,ls:integer):integer;
begin
	if(a=nil)then
		entre_dos:= 0
	else
		if(a^.d.cod>= li)then
			if(a^.d.cod<=ls)then
				entre_dos:= 1 + entre_dos(a^.hi,li,ls) + entre_dos(a^.hd,li,ls)
			else
				entre_dos:= entre_dos(a^.hi,li,ls)
		else
			entre_dos:= entre_dos(a^.hd,li,ls);
end;

procedure entre_dos_vector (v: vProducto);
var
	i,li,ls: integer;
begin
	for i:= 1 to dimF do begin
		writeln('ingrese el limite inferior que se desea buscar en el rubro ', i);
		readln(li);
		writeln('ingrese el limite superior que se desea buscar en el rubro ', i);
		readln(ls);
		writeln('la cantidad de productos que hay en el rubro ', i,' entre ', li,' y ', ls,' son ', entre_dos(v[i],li,ls), ' productos.');
	end;
end;

var
	v:vProducto;
begin
	crear_arbol(v);
	cargar_vector(v);
	imprimir_vector(v);
	punto_b(v);
	max_vector(v);
	entre_dos_vector(v);
end.
