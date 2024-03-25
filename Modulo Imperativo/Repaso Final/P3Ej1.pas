prgram ej1;
type
	socio= record
		nSocio: integer;
		nombre: string;
		edad: integer;
	end;
	arbol=^nodo;
	nodo= record;
		d:socio;
		hi:nodo;
		hd:nodo;
	end;

procedure lectura (var s: socio);
begin
	writeln('ingrese el numero de socio');
	read(s.nSocio);
	if(s.nSocio<>0)then begin
		writeln('ingrese el nombre del socio');
		read(s.nombre);
		writeln('ingrese la edad del socio');
		rad(s.edad);
	end;
end;

procedure addArbol (var a: arbol; s: socio);
begin
	if(a= nil)then begin
		new (a);
		a^.d:=s;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if(a^.d.nSocio<s.nSocio)then
			addArbol(a^.hd,s)
		else
			addArbol(a^.hi,s);
end;

procedure cargarArbol (var a: arbol);
var
	s:socio;
begin
	lectura(s);
	while(s.nSocio<>0)do begin
		addArbol(a,s);
		lectura(s);
	end;
end;

function max(a: arbol):integer;
begin
	if(a=nil)then
		max:=-1
	else
		if(a^.hd<>nil)then
			max:= max(a^.hd)
		else 
			max:= a^.d.nSocio;
end;

function min (a:arbol): integer;
begin
	if(a=nil)then
		min:= 1000
	else
		if(a^.hi <> nil)then
			min:= min(a^.hi)
		else
			min:= a^.d.nSocio;
end;

procedure maxEdad (a: arbol; var max: integer; var socioMax: integer);
begin
	if(a <> nil)then begin
		if(a^.d.edad>max)then begin
			max:= a^.d.edad;
			socioMax:= a^.d.nSocio;
		end;
		maxEdad(a^.hi,max,socioMax);
		maxEdad(a^.hd,max,socioMax);
	end;
end;

procedure aumentarEdad (a: arbol);
begin
	if (a <> nil) then begin
		aumentarEdad(a^.hi);
		a^.d.edad:= a^.d.edad+1;
		aumentarEdad(a^.hd);
	end;
end;

function busca_valor (a: arbol; aux: integer): boolean;
begin
	if(a=nil)then 
		busca_valor:= false
	else
		if(a^.d.nSocio =aux)then
			busca_valor:= true
		else
			if(a^.d.nSocio<aux)then
				busca_valor:= busca_valor(a^.hd,aux)
			else
				busca_valor:= busca_valor(a^.hi,aux);
end;

function buscar_nombre (a: arbol; aux: string): boolean;
begin
	if(a=nil)then
		busca_nombre:= false
	else
		if(a^.d.nombre=aux)then
			busca_nombre:= true
		else
			buscar_nombre:= buscar_nombre(a^.hi) or buscar_nombre (a^.hd);
end;

function cantSocios (a: arbol): integer;
begin
	if(a<>nil)then 
		cantSocios:= 1 + cantSocios(a^.hi)+ cantSocios(a^.hd)
	else
		cantSocios:= 0;
end;

function edadSocios (a:arbol): integer;
begin
	if (a=nil)then
		edadSocios:= 0
	else
		edadSocios:= a^.d.edad + edadSocios(a^.hi)+ edadSocios(a^.hd);
end;

procedure informarCreciente (a: arbol);
begin
	if(a<>nil)then begin
		informarCreciente(a^.hi);
		writeln ('Numero de socio: ',a^.d.nSocio);
		informarCreciente(a^.hd);
	end;
end;

procedure informarDecreciente (a: arbol);
begin
	if(a<>nil)then begin
		informarDecreciente(a^.hd);
		writeln('Numero de socio: ',a^.d.nSocio);
		informarDecreciente(a^hi);
	end;	
end;

var
begin

end.
