program parcial;
const
	DF= 15;
type
	rango= 1..DF;
	atencion = record
		dni: integer;
		mes: integer;
		codDiagnostico: integer;
	end;
	datoA= record
		dni: integer;
		totalA: integer;
	end;
	arbol=^nodoA;
	nodoA=record
		d: datoA;
		hi:arbol;
		hd: arbol;
	end;
	vect= array [rango] of integer;

procedure lectura (var a: atencion);
begin
	writeln('Ingrese el mes');
	readln(a.mes);
	if(a.mes <> 0)then begin
		writeln ('Ingrese el dni del paciente');
		readln(a.dni);
		writeln('Ingrese el codigo de diagnostico');
		readln(a.codDiagnostico);
	end;
end;

procedure addArbol (var a: arbol; dni: integer);

begin
	if(a=nil)then begin
		new(a);
		a^.d.dni:= dni;
		a^.d.totalA:=1;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if(a^.d.dni=dni)then
			a^.d.totalA:= a^.d.totalA +1
		else
			if(a^.d.dni>dni)then
				addArbol (a^.hi,dni)
			else
				addArbol(a^.hd,dni);
end;

procedure cargarEstructuras (var v: vect; var a: arbol);
var
	at: atencion;
begin
	lectura(at);
	while(at.mes<>0)do begin
		addArbol(a,at.dni);
		v[at.codDiagnostico]:= v[at.codDiagnostico] +1;
		lectura(at);
	end;
end;

procedure inicializar (var v: vect; var a: arbol);
var
	i: integer;
begin
	a:=nil;
	for i:= 1 to DF do
		v[i]:=0;
end;

procedure imprimirVect (v: vect);
var
	i: integer;
begin
	for i:= 1 to DF do
		writeln('El codigo de diagnostico ',i, ' tuvo ',v[i],' atenciones.');
end;

procedure imprimirArbol (a: arbol);
begin
	if(a<>nil)then begin
		imprimirArbol(a^.hi);
		writeln('El numero de dni ',a^.d.dni,' tuvo ',a^.d.totalA,' atenciones.');
		imprimirArbol(a^.hd);
	end;
end;
//ver estos modulos porque estan mal
function cantPacientesMasAtencionesX (a: arbol; li,ls,x:integer): integer;
begin
	if(a=nil)then
		cantPacientesMasAtencionesX:=0
	else
		if(a^.d.dni>li)then
			if(a^.d.dni<ls)then
				if(a^.d.totalA>x)then
					cantPacientesMasAtencionesX:= 1 + cantPacientesMasAtencionesX(a^.hi,li,ls,x) + cantPacientesMasAtencionesX(a^.hd,li,ls,x)
			else
				cantPacientesMasAtencionesX:= cantPacientesMasAtencionesX(a^.hi,li,ls,x)
		else
			cantPacientesMasAtencionesX:= cantPacientesMasAtencionesX(a^.hd,li,ls,x);
end;

procedure puntoB (a: arbol);
var
	li,ls,x: integer;
begin
	writeln('ingrese el limite inferior');
	readln(li);
	writeln('ingrese el limite superior');
	readln(ls);
	writeln('ingrese la cantidad de atenciones');
	readln(x);
	writeln('La cantidad de dni que tiene mas atenciones entre los dni ',li,' y ',ls,' con mas atenciones de ',x,' son: ',cantPacientesMasAtencionesX(a,li,ls,x),'.');
end;

function atencion0(v: vect; df: integer):integer;
begin
	if(df<>0)then
		if(v[df]=0)then 
			atencion0:= 1 + atencion0(v,(df-1));
end;

procedure puntoC (v: vect);
var
	i: integer;
begin
	i:= DF;
	writeln('La cantidad de codigos de diagnosticos con 0 atenciones son: ',atencion0(v,i));
end;

var
	v: vect;
	a: arbol;
begin
	inicializar(v,a);
	cargarEstructuras(v,a);
	writeln('Vector: ');
	imprimirVect(v);
	writeln('Arbol: ');
	imprimirArbol(a);
	puntoB(a);
	puntoC(v);
end.
