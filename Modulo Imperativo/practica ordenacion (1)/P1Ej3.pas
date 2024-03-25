program ej3;
type
	rango= 1..8;
	pelicula= record
		codPelicula: integer;
		codGenero: rango;
		puntaje: real;
	end;
	lista=^nodo;
	nodo= record
		d: pelicula;
		sig: lista;
	end;
	vec= array [rango] of lista;
	peliMAX= record
		codPelicula: integer;
		puntaje: real;
	end;
	vecPuntaje= array [rango] of peliMAX;
	
procedure inicializarVec (var v: vec);
var 
	i: integer;
begin
	for i:= 1 to 8 do 
		v[i]:= nil;
end;

procedure lectura (var p: pelicula);
begin
	writeln('ingresar codigo de pelicula');
	readln (p.codPelicula);
	if (p.codPelicula<>-1) then begin
		writeln('ingresar codigo de genero');
		readln (p.codGenero);
		writeln('ingresar puntaje obtenido');
		readln (p.puntaje);
	end;
end;

procedure addLista (var pi: lista; p: pelicula);
var 
	nuevo, aux: lista;
begin
	new(nuevo);
	nuevo^.d:= p;
	nuevo^.sig:= nil;
	if (pi = nil) then 
		pi:= nuevo
	else begin
		aux:= pi;
		while (aux^.sig <> nil) do
			aux:= aux^.sig;
		aux^.sig:= nuevo;
	end;
end;

procedure cargar (var v: vec);
var
	p: pelicula;
begin
	lectura(p);
	while(p.codPelicula <> -1) do begin
		addLista (v[p.codGenero], p);
		lectura(p);
	end;
end;

procedure Max ( pi: lista; var max: peliMAX);
begin
	max.puntaje:= -1;
	while (pi<>nil) do begin
		if (pi^.d.puntaje > max.puntaje) then
			max.puntaje:= pi^.d.puntaje;
			max.codPelicula:= pi^.d.codPelicula;
		pi:= pi^.sig;
	end;
end;

procedure cargarVectorMaximos (var v: vecPuntaje; vLista: vec);
var
	i:integer;
begin
	for i:= 1 to 8 do
		Max (vLista[i],v[i]); 
end;

procedure insercion ( var v: vecPuntaje);
var
	i,j: integer;
	act: peliMAX;
begin
	for i:= 2 to 8 do  begin
		act:= v[i];
		j:= i-1;
		while (j>0) and (v[j].puntaje<act.puntaje) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= act;
	end;
end;

procedure imprimir (v:vecPuntaje);
begin
	writeln(v[1].codPelicula, 'es el codigo de pelicula con mayor puntuacion ', v[8].codPelicula, 'es el codigo de pelicula con menor puntuacion');
end;


var
	v: vec;
	vPuntaje:vecPuntaje;
begin
	inicializarVec (v);
	cargar (v);
	cargarVectorMaximos (vPuntaje,v);
	insercion (vPuntaje);
	imprimir (vPuntaje);
end.
