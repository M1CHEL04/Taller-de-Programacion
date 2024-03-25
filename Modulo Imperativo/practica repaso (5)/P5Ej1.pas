program ej1;
const
	dimF= 300;
type
	rango= 1..dimF;
	oficina=record
		cod: integer;
		dni: integer;
		expensas: real;
	end;
	vOficina= array [rango] of oficina;

procedure lectura (var o: oficina);
begin
	writeln('ingrese el codigo de identificacion');
	readln(o.cod);
	if(o.cod<>-1)then begin
		writeln('ingrese el dni del propietario');
		readln(o.dni);
		writeln('ingrese el valor de las expensas');
		readln(o.expensas);
	end;
end;

procedure cargar_vector (var v: vOficina; var dimL: integer);
var
	o: oficina;
begin
	diml:= 0;
	lectura(o);
	while(o.cod<>-1)and(dimL<dimF)do begin
		dimL:= dimL + 1;
		v[dimL]:= o;
		lectura(o);
	end;
end;

procedure insercion (var v:vOficina; dimL:integer);
var
	i,j: integer;
	act: oficina;
begin
	for i:= 2 to dimL do begin
		act:= v[i];
		j:= i-1;
		while(j>0)and(v[j].cod>act.cod)do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= act;
	end;
end;

procedure imprimir_vector (v: vOficina; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do 
		writeln('el codigo de de identificacion es: ',v[i].cod);
end;

function busqueda_dicotomica (v:vOficina; dimL,cod:integer): integer;
var
	pri,ult,mid,aux: integer;
begin
	aux:= 0;
	pri:= 1; ult:= dimL; mid:= (pri+ult) DIV 2;
	while(pri<= ult)and (cod<>v[mid].cod)do begin
		if (cod<v[mid].cod)then
			ult:= mid-1
		else
			pri:= mid +1;
		mid:=(pri+ult) DIV 2;
	end;
	if(pri<= ult)and(cod=v[mid].cod)then
		aux:= mid;
	busqueda_dicotomica:= aux;
end;

function total_expensas(v:vOficina; dimL:integer):real;
begin
	if(dimL=0)then
		total_expensas:=0
	else
		if(diml>0)then
			total_expensas:= v[dimL].expensas + total_expensas(v,dimL-1)
end;

var
	v:vOficina;
	dimL, aux:integer;
	
begin
	cargar_vector(v,dimL);
	imprimir_vector(v,dimL);
	insercion(v,dimL);
	imprimir_vector(v,dimL);
	writeln('ingrese el codigo de oficina a buscar');
	readln(aux);
	aux:= busqueda_dicotomica(v,dimL,aux);
	if(aux=0)then
		writeln(aux,' , el codigo de oficina no se encontro.')
	else
		writeln('El codigo de oficina se encontro en la posicion ', aux, ' del vector y el numero de dni del propietario es: ',v[aux].dni);
	writeln('el monto total de las expensas es: ',total_expensas(v,dimL):4:0,' pesos.')
end.
