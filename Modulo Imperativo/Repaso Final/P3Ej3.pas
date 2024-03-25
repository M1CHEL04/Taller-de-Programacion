program ej3;
type
	rFinal= record
		codM: integer;
		nota: integer;
	end;
	lista=^nodoL;
	nodoL=record
		d:rFinal;
		sig:lista;
	end;
	alumno= record
		legajo:integer;
		dni:integer;
		ingreso:integer;
		finales:lista;
	end;
	arbol=^nodoA;
	nodoA=record
		d:alumno;
		hi:arbol;
		hd:arbol;
	end;
	
procedure lecturaFinales (var f: rFinal);
begin
	writeln('ingrese el codigo de materia');
	read(f.codM);
	if(f.codM<>-1)then begin
		writeln('ingrese la nota de la materia ingresada anteriormente');
		read(f.nota);
	end;
end;

procedure addLista(var l: lista; f:rFinal);
var
	n:lista;
begin
	new (n);
	n^.d:=f;
	n^.sig:=l;
	l:=n;
end;

procedure lecturaAlumnos (var a: alumno);
var
	f:rFinal;
begin
	a.finales:=nil;
	writeln('ingrese el numero de legajo');
	read(a.legajo);
	if(a.legajo <> 0)then begin
		writeln('ingrese el numero de DNI');
		read(a.dni);
		writeln('ingrese el anio de ingreso');
		read(a.ingreso);
		lecturaFinales(f);
		while (f.codM <> -1)do begin
			addLista(a.finales,f);
			lecturaFinales(f);
		end;
	end;
end;

procedure addArbol (var a: arbol; alu: alumno);
begin
	if(a=nil)then begin
		new (a);
		a^.d:=alu;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if(a^.d.legajo>=alu.legajo)then
			addArbol(a^.hi,alu)
		else
			addArbol(a^.hd,alu);
end;

procedure cargarArbol (var a: arbol);
var
	alu:alumno;
begin
	lecturaAlumnos(alu);
	while (alu.legajo <> 0)do begin
		addArbol(a,alu);
		lecturaAlumnos(alu);
	end;
end;

procedure imprimirArbol (a:arbol);
begin
	imprimirArbol(a^.hi);
	writeln('el numero de legajo es: ',a^.d.legajo);
	imprimirArbol(a^.hd);
end;

function maxLegajo (a:arbol):integer;
begin
	if(a=nil)then
		maxLegajo:= -1
	else
		if(a^.hd <> nil)then
			maxLegajo:= maxLegajo(a^.hd)
		else
			maxLegajo:= a^.d.legajo;
end;

function mayorEntreDos (v1,v2:integer):integer;
begin
	if(v1>v2)then
		mayorEntreDos:=v1
	else
		mayorEntreDos:=v2;
end;

function maxDNI (a:arbol):integer;
begin
	if(a=nil)then
		maxDNI:= -1
	else
		maxDNI:= mayorEntreDos(a^.d.dni,mayorEntreDos(maxDNI(a^.hi),maxDNI(a^.hd)));
end;

function esImpar(aux:integer):boolean;
begin
	if(aux MOD 2 =0)then
		esImpar:= false
	else
		esImpar:= true;
end;

function impares (a:arbol):integer;
begin
	if(a=nil)then 
		impares:=0
	else
		if(esImpar(a^.d.legajo))then
			impares:= 1 + impares(a^.hi)+impares(a^.hd)
		else
			impares:= impares(a^.hi)+impares(a^.hd);
end;

function prom (l:lista):real;
var
	notas: integer;
	cantNotas:integer;
begin
	notas:= 0;
	cantNotas:= 0;
	if(l=nil)then
		prom:=0
	else
		while (l<>nil) do begin
			notas:= notas + l^.d.nota;
			cantNotas:= cantNotas +1;
			l:=l^.sig;
		end;
		prom:= notas/cantNotas;
end;

procedure mayorPromedio (a:arbol; var aluMayorProm:integer; var max:real);
begin
	if(a<>nil)then begin
		if(prom(a^.d.finales)>max)then begin
			aluMayorProm:= a^.d.legajo;
			max:= prom(a^.d.finales);
		end;
		mayorPromedio(a^.hi,aluMayorProm,max);
		mayorPromedio(a^.hd,aluMayorProm,max);
	end;
end;

var
	a: arbol;
	max: real;
	aluMayorProm: integer;
begin
	a:= nil;
	max:=-1;
	cargarArbol(a);
	imprimirArbol(a);
	writeln('el numero de legajo mas grande es: ',maxLegajo(a));
	writeln('el numero de dni mas grande es: ',maxDNI(a));
	writeln('la cantidad de legajos impares son: ',impares(a));
	mayorPromedio(a,aluMayorProm,max);
	writeln('el alumno de mayor promedio es: ',aluMayorProm,' y tiene promedio de: ',max);
end.
