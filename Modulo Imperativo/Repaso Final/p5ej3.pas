program ej3;
type
	rango= 1..10;
	producto=record
		codP:integer;
		rubro:rango;
		stock:integer;
		precioU:real;
	end;
	arbol=^nodoA;
	nodoA=record
		d:producto;
		hi:arbol;
		hd:arbol;
	end;
	vect= array[rango]of arbol;
	
	
procedure leer (var p: producto);
begin
	writeln('ingrese el codigo de producto');
	readln(p.codP);
	if(p.codP<>-1)then begin
		writeln('ingrese el codigo de rubro');
		readln(p.rubro);
		writeln('ingrese el stock');
		readln(p.stock);
		writeln('ingrese el precio por unidad');
		readln(p.precioU);
	end;
end;

procedure inicializar (var v: vect);
var
	i: rango;
begin
	for i:= 1 to 10 do
		v[i]:=nil;
end;

procedure addArbol (var a:arbol ; p: producto);
begin
	if(a=nil)then begin
		new(a);
		a^.d:=p;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if(a^.d.codP=p.codP)then
			a^.d.stock:= a^.d.stock + p.stock
		else
			if(a^.d.codP>p.codP)then
				addArbol(a^.hi,p)
			else
				addArbol(a^.hd,p);
end;

procedure cargarVector (var v: vect);
var
	p:producto;
begin
	leer(p);
	while(p.codP <>  -1)do begin
		addArbol(v[p.rubro],p);
		leer(p);
	end;
end;

function buscarCodP (a:arbol;codP:integer):boolean;
begin
	if(a=nil)then
		buscarCodP:= false
	else
		if(a^.d.codP=codP)then
			buscarCodP:=true
		else
			if(a^.d.codP>codP)then
				buscarCodP:=buscarCodP(a^.hi,codP)
			else
				buscarCodP:=buscarCodP(a^.hd,codP);
end;
procedure puntoB (v:vect);
var
	rubroBuscar:integer;
	codPrubro:integer;
begin
	writeln('ingrese el rubro del producto que desea buscar');
	read(rubroBuscar);
	writeln('ingrese el codigo del producto que desea buscar');
	read(codPrubro);
	if(buscarCodP(v[rubroBuscar],codPrubro))then
		writeln('el producto se ha encontrado')
	else
		writeln('el producto no se ha encontrado');
end;

procedure maxArbol (a: arbol; var stockMax:integer; var codPMax:integer);
begin
	if(a<>nil)then 
		if(a^.hd<>nil)then
			maxArbol(a^.hd,stockMax,codPMax)
		else begin
			stockMax:=a^.d.stock;
			codPMax:= a^.d.codP;
		end;
end;

procedure puntoC(v:vect);
var
	i,codPMax,stockMax:integer;
begin
	for i:= 1 to 10 do begin
		codPMax:= -1;
		stockMax:=-1;
		maxArbol(v[i],stockMax,codPMax);
		writeln('El codigo de producto maximo del rubro ',i,' es: ',codPMax,' y cuenta con ',stockMax,' unidades de stock');
	end;
end;

function entreDos (a: arbol; li,ls:integer):integer;
begin
	if(a=nil)then
		entreDos:=0
	else
		if(a^.d.codP>=li)then 
			if(a^.d.codP<=ls)then
				entreDos:= 1+ entreDos(a^.hi,li,ls)+ entreDos(a^.hd,li,ls)
			else
				entreDos:= entreDos(a^.hi,li,ls)
		else
			entreDos:= entreDos(a^.hd,li,ls);
end;

procedure puntoD (v:vect);
var
	li,ls,i:integer;
begin
	writeln('ingrese el limete inferior');
	read(li);
	writeln('ingrese el limete superior');
	read(ls);
	for	i:= 1 to 10 do
		writeln('La cantidad de codigos de productos que hay entre ',li,' y ',ls,' del rubro ',i,' es: ',entreDos(v[i],li,ls));
end;

var
	v:vect;
begin
	inicializar(v);
	cargarVector(v);
	puntoB(v);
	puntoC(v);
	puntoD(v);
end.
