program ej1;
type
	socio= record
		nSocio: integer;
		nombre: string;
		edad: integer;
	end;
	arbol=^nodo;
	nodo=record
		d: socio;
		HI: arbol;
		HD: arbol;
	end;

procedure agregar (var a: arbol; dato: socio);
begin
	if(a=nil) then begin
		new(a);
		a^.d:= dato;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if(dato.nSocio<=a^.d.nSocio)then
		agregar(a^.HI,dato)
	else
		agregar(a^.HD,dato);
end;

procedure lectura (var s: socio);
begin
	writeln ('ingrese el numero de socio');
	readln(s.nSocio);
	if(s.nSocio<>0)then begin
		writeln('ingrese el nombre');
		readln(s.nombre);
		writeln('ingrese la edad');
		readln(s.edad);
	end;
end;

procedure cargar_arbol (var a: arbol);
var
	dato: socio;
begin
	lectura(dato);
	while(dato.nSocio<>0) do begin
		agregar(a,dato);
		lectura(dato);
	end;
end;

procedure imprimir_arbol(a:arbol);
begin
	if(a<>nil)then begin
		writeln('el elemento numero de socio es: ', a^.d.nSocio);
		writeln('la edad del socio es: ', a^.d.edad);
		imprimir_arbol(a^.HI);
		imprimir_arbol(a^.HD);
	end;
end;

function max (a: arbol): integer; 
begin
	if(a<>nil)then begin
		if(a^.HD<>nil)then
			max:= max(a^.HD)
		else
			max:= a^.d.nSocio;
	end
	else
		max:=1;
end;

function min (a:arbol): integer;
begin
	if (a<>nil)then begin
		if(a^.HI<>nil)then
			min:= min(a^.HI)
		else
			min:= a^.d.nSocio;
	end
	else
		min:=1000;
end;
	
procedure mayor_edad(a: arbol; var maxEdad: integer; var socioMaxEdad: integer); {maxEdad viene inicializado desde el programa principal}
begin
	if(a<>nil) then begin
		if(a^.d.edad>maxEdad)then begin
			maxEdad:= a^.d.edad;
			socioMaxEdad:= a^.d.nSocio;
		end;
		mayor_edad(a^.HI,maxEdad,socioMaxEdad);
		mayor_edad(a^.HD,maxEdad,socioMaxEdad);
	end;
end;	

function max_entre_dos(v1:integer; v2: integer): integer;
begin
	if(v1>v2)then
		max_entre_dos:= v1
	else
		max_entre_dos:= v2;
end;

function mayorEdad (a:arbol):integer;
begin
	if(a=nil)then 
		mayorEdad:= -1
	else
		mayorEdad:= max_entre_dos(a^.d.edad,max_entre_dos(mayorEdad(a^.HI),mayorEdad(a^.HD)));
end;

procedure aumentar_edad (a: arbol);
begin
	if(a<>nil) then begin
		aumentar_edad(a^.HI);
		a^.d.edad:= a^.d.edad +1;
		aumentar_edad(a^.HD);
	end;
end;

function buscar_valor(a: arbol; n:integer): boolean; {n se lee desde el programa principal}
begin
	if(a<>nil) then begin
		if(a^.d.nSocio=n)then
			buscar_valor:= true
		else if (a^.d.nSocio>n) then
			buscar_valor(a^.HI,n)
		else
			buscar_valor(a^.HD,n);
	end
	else
		buscar_valor:= false;
end;

procedure buscar_socio (a: arbol; aux: string; var check: boolean); {check viene inicializada en false desde el programa principal}
begin                                                               {aux se lee en el programa principal}
	if (a<>nil)and(not check)then begin
		buscar_socio(a^.HI,aux,check);
		if(a^.d.nombre=aux)then
			check:= true;
		buscar_socio(a^.HD,aux,check);
	end;
end;

function contar_socios(a:arbol): integer;
begin
	if(a<>nil)then 
		contar_socios:= 1 + contar_socios(a^.HI) + contar_socios(a^.HD)
	else
		contar_socios:= 0;
end;

function edad_socios(a: arbol): integer;
begin
	if(a<>nil)then
		edad_socios:= a^.d.edad + edad_socios(a^.HI) + edad_socios(a^.HD)
	else 
		edad_socios:= 0;
end;

procedure imprimir_creciente (a: arbol);
begin
	if(a<>nil)then begin
		imprimir_creciente(a^.HI);
		writeln('el numero de socio es: ', a^.d.nSocio);
		imprimir_creciente(a^.HD);
	end;
end;

procedure imprimir_decreciente (a:arbol);
begin
	if (a<> nil) then begin
		imprimir_decreciente(a^.HD);
		writeln('el numero de socio es: ', a^.d.nSocio);
		imprimir_decreciente(a^.HI);
	end;
end;

var
	a: arbol;
	socioMaxEdad, maxEdad, n: integer;
	check: boolean;
	aux: string;
begin
	a:= nil;
	cargar_arbol(a);
	imprimir_arbol(a);
	writeln('el numero de socio mas grande es: ', max(a));
	writeln('el numero de socio mas chico es: ', min(a));
	maxEdad:= 0;
	mayor_edad(a,maxEdad,socioMaxEdad);
	writeln('el numero de socio con mayor edad es: ', socioMaxEdad);
	aumentar_edad(a);
	writeln('ingrese el numero de socio a buscar');
	readln(n);
	writeln(buscar_valor(a,n));
	check:= false;
	writeln('ingrse el nombre del socio a buscar');
	readln(aux);
	buscar_socio(a,aux,check);
	writeln(check);
	writeln('la cantidad total de socios es: ', contar_socios(a));
	writeln ('la edad total de todos los socios es: ', edad_socios(a));
	writeln('el promedio de edad de los socios es: ', edad_socios(a) / contar_socios(a):3:0, ' años');
	writeln('el arbol ordenado por numero de socio de menor a mayor queda de la siguente forma: ');
	imprimir_creciente(a);
	writeln('el arbol ordenado por numero de socio de mayor a menor queda de la siguente forma: ');
	imprimir_decreciente(a);
end.

