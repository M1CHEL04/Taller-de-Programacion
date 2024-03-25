program ej4;
const
	dimF= 20;
type
	rango= 1..20;
	vec= array [rango]of integer;
	
procedure addVector (var v: vec; i:integer);
var
	aux: integer;
begin
	aux:= random(99)+1;
	if(i<=dimF)then begin
		v[i]:= aux;
		addVector(v,i+1)
	end;
end;
procedure imprimirVec (v: vec);
var
	i:integer;
begin
	for i:= 1 to dimF do 
		writeln(v[i]);
end;

procedure maximo (v: vec; i: integer; var max: integer);
begin
	if(i<dimF)then begin
		if(v[i]>max)then
			max:= v[i];
		maximo(v,i+1,max);
	end;
end;

procedure suma(v:vec; i:integer; var sumador: integer);     {sumador e i vienen inicializados desde el programa principal}
begin
	if(i<dimF)then begin
		suma(v,i+1,sumador);
		sumador:= sumador + v[i];
	end;
end;

var
	v: vec;
	i,max, sumador: integer;
begin
	randomize;
	i:=1;
	addVector(v,i);
	imprimirVec(v);
	max:=-1;
	i:= 1;
	maximo(v,i,max);
	writeln('el elemento mayor de la tabla es: ', max);
	i:=1;
	sumador:= 0;
	suma(v,i,sumador);
	writeln('la suma de todos los elementos de la tabla es: ', sumador);
end.
