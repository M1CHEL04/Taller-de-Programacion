program ej2;
const
	dimF= 300;
Type
	rango= 1..4;
	CaractOficina=record
		codigo: integer;
		DNIprop: integer;
		valorExpen: real;
	end;
	vecOficinas= array [rango] of CaractOficina;
	
procedure lectura (var c: CaractOficina);
begin
	read(c.codigo);
	if (c.codigo <> -1) then begin;
		read(c.DNIprop);
		read(c.valorExpen);
	end;
end;

procedure cargaVec (var v: vecOFicinas; var dimL: integer);
var
	i: integer;
	c: CaractOficina;
begin
	lectura (c);
	i:= 0;
	while (c.codigo <> -1) and (i<dimF) do begin
		i:= i+1;
		v[i]:= c;
		lectura (c);
	end;
	dimL:= i;
end;


procedure insercion (var v: vecOficinas; dimL: integer);
var
	i,j: integer;
	act: CaractOFicina;
begin
	for i:= 2 to dimL do begin
		act:= v[i];
		j:= i-1;
		while (j>0) and (v[j].codigo > act.codigo) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= act;
	end;
end;

procedure seleccion (var v: vecOficinas; dimL: integer);
var
i,j,POSm: integer;
item: CaractOficina;
begin
	for i:=1 to dimL-1 do begin
		POSm:= i;
		for j:= i+1 to dimL do 
			if (v[j].codigo < v[POSm].codigo)then
				POSm:= j;
		item:= v[POSm];
		v[POSm]:= v[i];
		v[i]:= item;
	end;
end;

procedure imprimir (v: vecOficinas; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		writeln (v[i].codigo);
end;
var
	v: vecOficinas;
	dimL: integer;
	
begin
	cargaVec (v,dimL);
	imprimir (v,dimL);
	insercion(v,dimL);
	imprimir (v,dimL);
	seleccion (v,dimL);
	imprimir (v,dimL);
end.
