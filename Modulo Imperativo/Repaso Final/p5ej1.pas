program ej1;
const
	DF=300;
type
	rango= 1..DF;
	oficina= record
		cod:integer;
		dniProp:integer;
		valor: real;
	end;
	vect=array [rango] of oficina;

procedure lectura (var o: oficina);
begin
	writeln('ingrese el codigo de la oficina');
	read(o.cod);
	if(o.cod <> -1)then begin
		writeln('ingrese el dni del propietario');
		read(o.dniProp);
		writeln('ingrese el valor de las expensas');
		read(o.valor);
	end;
end;

procedure cargarVect(var v:vect;var dl:integer);
var
	o:oficina;
begin
	dl:=0;
	lectura(o);
	while((o.cod <> -1)and(dl<DF))do begin
		v[dl]:=o;
		dl:= dl+1;
		lectura(o);
	end;
end;

procedure imprimirV(v:vect;dl:integer);
var
	i:integer;
begin
	for i:= 1 to dl do 
		writeln('el codigo de identificacion es: ',v[i].cod);
end;

procedure seleccion (var v: vect; dl:integer);
var
	i,j,posm:integer;
	aux:oficina;
begin
	for i:= 1 to (dl-1)do begin
		posm:=i;
		for j:= i+1 to dl do
			if(v[j].cod<v[posm].cod)then
				posm:=j;
		aux:=v[posm];
		v[posm]:=v[i];
		v[i]:=aux;
	end;
end;

function totalExp (v:vect;dl:integer):real;
begin
	if(dl=0)then
		totalExp:=0
	else
		totalExp:= v[dl].valor + totalExp(v,(dl-1));
end;

var
	v:vect;
	dl:integer;
begin
	cargarVect(v,dl);
	imprimirV(v,dl);
	seleccion(v,dl);
	imprimirV(v,dl);
	writeln('el total de expensas a cobrar es: ',totalExp(v,dl));
end.
