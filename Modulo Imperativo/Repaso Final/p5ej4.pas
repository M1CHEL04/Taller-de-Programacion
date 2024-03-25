program ej4;
type
	reclamo = record
		cod:integer;
		dni:integer;
		anio:integer;
		tReclamo:string;
	end;
	reclamoRed = record
		cod:integer;
		anio:integer;
		tReclamo:string;
	end;
	lista=^nodol;
	nodol=record
		d:reclamoRed;
		sig:lista;
	end;
	datoA=record
		dni:integer;
		info:lista;
		total:integer;
	end;
	arbol=^nodoA;
	nodoA=record
		d:datoA;
		hi:arbol;
		hd:arbol;
	end;
	
procedure lectura (var r:reclamo);
begin
	writeln('ingrese el codigo de reclamo');
	readln(r.cod);
	if(r.cod <> -1 )then begin
		writeln('ingrese el dni del solicitante');
		readln(r.dni);
		writeln('ingrese el anio');
		readln(r.anio);
		writeln('ingrese el tipo de reclamo');
		readln(r.tReclamo);
	end;
end;

procedure addLista (var l: lista; cod,anio:integer; tipo:string);
var
	n:lista;
begin
	new(n);
	n^.d.cod:=cod;
	n^.d.anio:=anio;
	n^.d.tReclamo:=tipo;
	n^.sig:=l;
	l:=n;
end;

procedure addArbol (var a:arbol; r:reclamo);
begin
	if(a=nil)then begin
		new(a);
		a^.d.info:=nil;
		a^.d.dni:= r.dni;
		addLista(a^.d.info,r.cod,r.anio,r.tReclamo);
		a^.d.total:=1;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if(a^.d.dni = r.dni)then begin
			addLista(a^.d.info,r.cod,r.anio,r.tReclamo);
			a^.d.total:= a^.d.total +1;
		end
		else
			if(a^.d.dni>r.dni)then
				addArbol(a^.hi,r)
			else
				addArbol(a^.hd,r);
end;

procedure cargarArbol (var a:arbol);
var
	r:reclamo;
begin
	lectura(r);
	while(r.cod<>-1)do begin
		addArbol(a,r);
		lectura(r);
	end;
end;

function reclamosXDni(a:arbol;dni:integer):integer;
begin
	if(a=nil)then
		reclamosXDni:=0
	else
		if(a^.d.dni=dni)then
			reclamosXDni:= a^.d.total
		else
			if(a^.d.dni>dni)then
				reclamosXDni:= reclamosXDni(a^.hi,dni)
			else
				reclamosXDni:= reclamosXDni(a^.hd,dni);
end;

function reclamosEntreDos (a:arbol; li,ls:integer):integer;
begin
	if(a=nil)then
		reclamosEntreDos:=0
	else
		if(a^.d.dni >= li)then
			if(a^.d.dni <= ls)then
				reclamosEntreDos:= a^.d.total + reclamosEntreDos(a^.hi,li,ls)+ reclamosEntreDos(a^.hd,li,ls)
			else
				reclamosEntreDos:= reclamosEntreDos(a^.hi,li,ls)
		else
			reclamosEntreDos:= reclamosEntreDos(a^.hd,li,ls);
end;

procedure imprimirLista (l:lista);
begin
	while (l<>nil)do begin
		writeln('cod de reclamo: ',l^.d.cod);
		l:=l^.sig;
	end;
end;

procedure imprimirArbol(a:arbol);
begin
	if(a<>nil)then begin
		imprimirArbol(a^.hi);
		writeln('Dni: ',a^.d.dni);
		imprimirLista(a^.d.info);
		imprimirArbol(a^.hd);
	end;
end;

function cantReclamosAnio (l:lista; anio:integer):integer;
var
	aux:integer;
begin
	aux:=0;
	while(l<>nil)do begin
		if(l^.d.anio = anio)then
			aux:= aux +1;
		l:= l^.sig;
	end;
	cantReclamosAnio:=aux;
end;

function puntoD (a:arbol; anio:integer):integer;
begin
	if(a=nil)then
		puntoD:=0
	else
		puntoD:= cantReclamosAnio(a^.d.info,anio) + puntoD(a^.hi,anio) + puntoD(a^.hd,anio);
end;

var
	a:arbol;
begin
	a:=nil;
	cargarArbol(a);
	imprimirArbol(a);
	writeln('El dni 44 solicito ',reclamosXDni(a,44),' tramites.');
	writeln('La cantidad de reclamos que se solicitaron entre los dni comprendidos entre 1 y 34 son: ',reclamosEntreDos(a,1,34),' reclamos.');
	writeln('La cantidad de reclamos que se hicieron en el anio 2015 son: ',puntoD(a,2015));
end.
