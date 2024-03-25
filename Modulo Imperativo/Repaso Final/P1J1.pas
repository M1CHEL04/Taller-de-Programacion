Program ej1;
Const
	DF= 300;
Type
	rango = 1..DF;
	cartOficina= record
		cod: integer;
		dni: integer;
		exp: real;
	end;
	vect= array [rango] of cartOficina;

procedure lectura (var c: cartOficina);
begin
	writeln ('ingrese el codigo');
	read(c.cod);
	if(c.cod <> -1)then begin;
		writeln ('ingrese el dni');
		read(c.dni);
		writeln ('ingrese el valor de las expensas');
		read(c.exp);
	end;
end;

procedure cargarVect (var v: vect; var dl: integer);
var
	c: cartOficina;
begin
	lectura (c);
	while((c.cod<>-1) and (dl<DF) ) do begin
		dl:= dl+1;
		v[dl]:= c;
		lectura (c);
	end;
end;

procedure seleccion (var v: vect; dl: integer);
var
	i,j,Posm: integer;
	aux: cartOficina;
begin
	for i:= 1 to (dl - 1)do begin
		Posm:= i;
		for j:= (i+1) to dl do 
			if (v[j].cod < v[Posm].cod) then
				Posm:= j;
		{hago el intercambio}
		aux:= v[Posm];
		v[Posm]:= v[i];
		v[i]:=aux;
	end;
end;

procedure imprimir (v: vect; dl: integer);
var
	i: integer;
begin
	for i:= 1 to dl do 
		writeln (v[i].cod)
end;
Var
	v: vect;
	dl: integer;
begin
	dl:=0;
	cargarVect(v,dl);
	imprimir(v,dl);
	seleccion(v,dl);
	imprimir(v,dl);
end.
