program ej3;
type
	rango= 1..8;
	subrango = 1..30;
	articulo= record
		codProducto: integer;
		codRubro: rango;
		precio: real;
	end;
	lista=^nodo;
	nodo= record
		d: articulo;
		sig: lista;
	end;
	vec= array [rango] of lista;
	vecRubro3= array [subrango] of articulo;
	
procedure inicializarVec (var v: vec);
var 
	i: integer;
begin
	for i:= 1 to 8 do 
		v[i]:= nil;
end;

procedure lectura (var a: articulo);
begin
	writeln('ingrese el precio del articulo');
	readln(a.precio);
	if(a.precio<>0)then begin
		writeln('ingrese el codigo del producto');
		readln(a.codProducto);
		writeln('ingrese el codigo del rubro');
		readln(a.codRubro);
	end;
end;

procedure addOrd (var pi: lista; a: articulo);
var
	act,ant,n: lista;
begin
	new(n);
	n^.d:= a;
	act:= pi;
	while (act <> nil) and (act^.d.codProducto<n^.d.codProducto) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (pi= nil) then
		n^.sig:= pi
	else begin
		ant^.sig:= n;
		n^.sig:= act;
	end;
end;

procedure cargar (var v: vec);
var
	a: articulo;
begin
	lectura (a);
	while(a.precio<>0)do begin
		addOrd(v[a.codRubro],a);
		lectura(a);
	end;
end;

procedure recorrerLista ( l: lista);
begin
	while(l<>nil) do begin
		writeln(l^.d.codProducto);
		l:=l^.sig;
	end;
end;

procedure informarVect (v: vec);
var
	i: integer;
begin
	for i:= 1 to 8 do
		recorrerLista(v[i]);
end;

procedure nuevoVector (v:vec; var VR3:vecRubro3; var dimL: integer);
begin
	dimL:= 0;
	while (v[3]<>nil)and(dimL<30)do begin
		dimL:= dimL +1;
		VR3[dimL]:= v[3]^.d;
		v[3]:= v[3]^.sig;
	end;
end;

procedure insercion (VR3: vecRubro3; dimL: integer);
var
	i,j: integer;
	act: articulo;
begin
	for i:= 2 to dimL do begin
		act:= VR3[i];
		j:= i-1;
		while (j>0) and (VR3[j].precio>act.precio) do begin
			VR3[j+1]:= VR3[j];
			j:= j-1;
		end;
		VR3[j+1]:= act;
	end;
end;

procedure informarVectOrdenado (vr3: vecRubro3; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do 
		writeln ('el producto',vr3[i].codProducto,'cuesta',vr3[i].precio,'pesos');
end;

var
	v:vec;
	VR3:vecRubro3;
	dimL: integer;
begin
	inicializarVec(v);
	cargar (v);
	informarVect(v);
	nuevoVector(v,VR3,dimL);
	insercion(VR3,dimL);
	informarVectOrdenado (VR3,dimL);
end.
