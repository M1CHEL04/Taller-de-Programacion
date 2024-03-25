program ej3;
const
	DF= 8;
type
	rango= 1..8;
	pelicula = record
		codP: integer;
		codG: rango;
		pp: real;
	end;
	l= ^nodo;
	nodo= record
		dato: pelicula;
		sig:l;
	end;
	vect= array [rango] of l;
	peliMax= record
		codP: integer;
		puntaje: real;
	end;
	vectMax= array [rango] of peliMax;

procedure lectura (var p: pelicula);
begin
	writeln('ingrese el codigo de pelicula');
	read(p.codP);
	if(p.codP <> -1) then begin
		writeln('ingrese el codigo de genero');
		read(p.codG);
		writeln('ingrese el puntaje promedio');
		readln(p.pp);
	end;
end;

procedure iniciarVect (var v: vect);
var
	i: integer;
begin
	for i:= 1 to DF do
		v[i]:= nil;
end;

procedure addLista (var pi: l; p: pelicula);
var
	n: l;
begin
	new(n);
	n^.dato:= p;
	n^.sig:= pi;
	pi:=n;
end;

procedure cargarVect(var v: vect);
var
	p: pelicula;
begin
	lectura (p);
	while (p.codP <> -1) do begin
		addLista (v[p.codG],p);
		lectura(p);
	end;
end;

procedure max (pi: l; var max: peliMax);
begin
	max.puntaje:= -1;
	while (pi <> nil)do begin
		if(pi^.dato.pp < max.puntaje) then begin
			max.puntaje:= pi^.dato.pp;
			max.codP:= pi^.dato.codG;
		end;
		pi:= pi^.sig;
	end;
end;

procedure vectorMax (var v: vectMax; vLista: vect);
var
	i: integer;
begin
	for i:= 1 to DF do
		max (vLista[i],v[i]);
end;

procedure seleccion (v: vectMax);
var
	i,j,posm:integer;
	aux: peliMax;
begin
	for	i:= 1 to (8-1) do begin
		posm:= i;
		for j:= (i+1) to 8 do 
			if (v[j].puntaje<v[posm].puntaje)then
				posm:= j;
		aux:= v[posm];
		v[posm]:= v[i];
		v[i]:= aux;
	end;
end;

procedure imprimir (v: vectMax);
begin
	writeln('La pelicula de mayor puntuacion es: ',v[8].codP,' y la de menor puntuacion es: ',v[1].codP);
end;
var
	v: vect;
	vMax: vectMax;
begin
	cargarVect (v);
	vectorMax(vMax,v);
	seleccion (vMax);
	imprimir(vMax);
end.
