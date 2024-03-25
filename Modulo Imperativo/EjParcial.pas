program ejParcial;
const
	dimF= 15;
type
	rango= 1..dimF;
	atencion= record
		dni: integer;
		nmes: integer;
		cod: rango;
	end;
	atencionRed= record
		nmes: integer;
		cod: rango;
	end;
	lista=^nodoL;
	nodoL=record
		d:atencionRed;
		sig:lista;
	end;
	dato= record
		dni: integer;
		l: lista;
	end;
	arbol1=^nodoA;
	nodoA= record
		d:dato;
		hi: arbol1;
		hd: arbol1;
	end;
	vAtencion= array [rango] of integer;
	
procedure lectura (var a: atencion);
begin
	writeln('ingrese el numero de mes en el que se realizo la atencion');
	readln(a.nmes);
	if(a.nmes<>0)then begin
		writeln('ingrese el dni del paciente');
		readln(a.dni);
		writeln('ingrese el codigo de diagnostico');
		readln(a.cod);
	end;
end;

procedure add_lista(var l: lista; nMes: integer; cod: rango);
var 
	n: lista;
begin
	new(n);
	n^.d.nmes:= nMes;
	n^.d.cod:= cod;
	n^.sig:= l;
	l:=n;
end;

procedure add_arbol (var a: arbol1; at: atencion);
begin
	if(a=nil)then begin
		new(a);
		a^.d.l:=nil;
		a^.d.dni:=at.dni;
		add_lista(a^.d.l,at.nmes,at.cod);
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
		if(a^.d.dni=at.dni)then
			add_lista(a^.d.l,at.nmes,at.cod)
		else
			if(a^.d.dni>at.dni)then
				add_arbol(a^.hi,at)
			else
				add_arbol(a^.hd,at);
end;

procedure inicializar_vector (var v:vAtencion);
var 
i: rango;
begin
	for i:= 1 to dimF do 
		v[i]:= 0;
end;

procedure cargar_estructuras (var a: arbol1; var v: vAtencion);
var
	at:atencion;
begin
	lectura(at);
	while(at.nmes<>0)do begin
		add_arbol(a,at);
		v[at.cod]:=v[at.cod] +1;
		lectura(at);
	end;
end;

procedure inicializar_estructuras (var a: arbol1; var v: vAtencion);
begin
	a:=nil;
	inicializar_vector(v);
end;

function mayor (l: lista): integer;
var
	aux: integer;
begin
	aux:= 0;
	while(l<>nil)do begin
		aux:= aux +1;
		l:= l^.sig;
	end;
	mayor:= aux;
end;

function recorrer_arbol(a: arbol1; li,ls,aux: integer): integer;
begin
	if(a=nil)then 
		recorrer_arbol:=0
	else
		if(a^.d.dni>=li)then 
			if(a^.d.dni<=ls)then
				if(mayor(a^.d.l)>aux)then
					recorrer_arbol:= 1 + recorrer_arbol(a^.hi,li,ls,aux) + recorrer_arbol(a^.hd,li,ls,aux)
			else 
				recorrer_arbol:= recorrer_arbol(a^.hi,li,ls,aux)
		else
			recorrer_arbol:= recorrer_arbol(a^.hd,li,ls,aux);
end;

procedure punto_b(a: arbol1);
var
	li,ls,aux: integer;
begin
	writeln('ingrese el limite inferior');
	readln(li);
	writeln('ingrese el limite superior');
	readln(ls);
	writeln('ingrese el valor X cantidad');
	readln(aux);
	writeln('la cantidad de pacientes con dni ente ',li,' y ', ls,' con mayor cantidad de atenciones que ', aux, ' son ', recorrer_arbol(a,li,ls,aux));
end;
	
function recorrer_vector (v: vAtencion; aux: integer): integer;
begin
	if(aux=0)then
		recorrer_vector:= 0
	else
		if(v[aux]=0)then
			recorrer_vector:= 1 + recorrer_vector(v,aux-1)
		else
			recorrer_vector:= recorrer_vector(v,aux-1);
end;

procedure punto_c (v:vAtencion);
var
	aux: integer;
begin
	aux:= dimF;
	writeln('la cantidad de diagnosticos que no tuvieron ninguna atencion son: ', recorrer_vector(v,aux));
end;

procedure imprimir_vector (v:vAtencion);
var
	i: integer;
begin
	for i:= 1 to 15 do 
		writeln('la cantidad de atenciones que tuvo el diagnostico ', i, ' es ', v[i]);
end;

procedure imprimir_lista (l: lista);
begin
	while (l<>nil)do begin
		writeln('el codigo de diagnostico es: ', l^.d.cod);
		l:=l^.sig;
	end;
end;

procedure imprimir_arbol (a:arbol1);
begin
	if(a<>nil)then begin
		writeln('el dni ',a^.d.dni,' tuvo estas atenciones: ');
		imprimir_lista(a^.d.l);
		imprimir_arbol(a^.hi);
		imprimir_arbol(a^.hd);
	end;
end;
var
	a: arbol1;
	v: vAtencion;
begin
	inicializar_estructuras(a,v);
	cargar_estructuras(a,v);
	imprimir_arbol(a);
	imprimir_vector(v);
	punto_b(a);
	punto_c(v);
end.
