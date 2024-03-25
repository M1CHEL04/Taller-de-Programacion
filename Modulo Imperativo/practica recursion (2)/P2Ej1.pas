program ej1;
Const
	dimF= 10;
type
	rango= 1..10;
	vecCaracteres= array [rango] of char;
	lista=^nodo;
	nodo= record
		d: char;
		sig: lista;
	end;
	
procedure cargaVectorCaracteres (var v: vecCaracteres; var dimL: integer);
var
	aux: char;
begin
	writeln ('ingrese el caracter');
	readln (aux);
	if(aux<>'.')and(dimL<dimF)then begin
		dimL:= dimL+1;
		v[dimL]:= aux;
		cargaVectorCaracteres(v,dimL);
	end;
end;

procedure imprimir (v: vecCaracteres; dimL: integer);
var
	i:integer;
begin
	for i:= 1 to dimL do
		writeln ('el caracter es',v[i]);
end;

procedure imprimirRecursivo (v: vecCaracteres; dimL: integer);
begin
	if(dimL<>0)then begin
		imprimirRecursivo(v,dimL-1);
		writeln ('el caracter es',v[dimL]);
	end;
end;

procedure contarCaracteres (var cont:integer);
var
	aux: char;
begin
	writeln('ingrese el caracter');
	readln(aux);
	if(aux<>'.')then begin
		cont:= cont+1;
		contarCaracteres(cont);
	end;
end;

procedure addLista (var Pi:lista; c: char);
var
	n: lista;
begin
	new(n);
	n^.d:= c;
	n^.sig:= pi;
	pi:=n;
end;

procedure ListaCaracteres (var Pi: lista);
var
	aux: char;
	
begin
	writeln ('ingrese un caracter');
	readln(aux);
	if(aux<>'.')then begin
		addLista(pi,aux);
		listaCaracteres(pi);
	end;
end;

procedure imprimirLista (pi:lista);
begin
	if(pi<>nil)then begin
		writeln('el caracter almacenado en la lista es',pi^.d);
		pi:= pi^.sig;
		imprimirLista(pi);
	end;
end;


var
	dimL: integer;
	v: vecCaracteres;
	counter: integer;
	l: lista;
begin
	dimL:= 0;
	cargaVectorCaracteres(v,dimL);
	imprimir(v,dimL);
	imprimirRecursivo(v,dimL);
	counter:= 0;
	contarCaracteres(counter);
	writeln('la cantidad de caracteres ingresados es',counter);
	listaCaracteres(l);
	imprimirLista(l);
	
end.
