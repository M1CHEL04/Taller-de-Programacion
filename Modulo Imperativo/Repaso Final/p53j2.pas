program ej2;
const
	df=8;
type
	rango= 2010..2018;
	rangoVect= 1..df;
	auto= record
		patente:string;
		anio:rango;
		marca:string;
		modelo:string;
	end;
	arbol1=^nodo1;
	nodo1=record
		d:auto;
		hi:arbol1;
		hd:arbol1;
	end;
	autoRed=record
		patente:string;
		anio:rango;
		modelo:string;
	end;
	lista=^nodol;
	nodol=record
		d:autoRed;
		sig:lista;
	end;
	datoA2=record
		marca:string;
		info:lista;
	end;
	arbol2=^nodo2;
	nodo2=record
		d:datoA2;
		hi:arbol2;
		hd:arbol2;
	end;
	datoVect=record
		patente:string;
		marca:string;
		modelo:string;
	end;
	listaVect=^nodolv;
	nodolv=record
		d:datoVect;
		sig:listaVect;
	end;
	vect= array [rango] of listaVect;
	
procedure lectura (var a: auto);
begin
	writeln('ingrese la patente');
	read(a.patente);
	if(a.patente <> '-1')then begin
		writeln('ingrese el anio de fabricacion');
		read(a.anio);
		writeln('ingrese la marca');
		read(a.marca);
		writeln('ingrese el modelo');
		read(a.modelo);
	end;
end;

procedure addArbol1 (var a1: arbol1; a: auto);
begin
	if(a1=nil)then begin
		new(a1);
		a1^.d:=a;
		a1^.hi:=nil;
		a1^.hd:= nil;
	end
	else
		if(a1^.d.patente> a.patente)then
			addArbol1(a1^.hi,a)
		else
			addArbol1(a1^.hd,a);
end;

procedure addLista(var l: lista; pat:string; anio:rango; modelo: string);
var
	n: lista;
begin
	new (n);
	n^.d.patente:= pat;
	n^.d.anio:= anio;
	n^.d.modelo:=modelo;
	n^.sig:=l;
	l:=n;
end;

procedure addArbol2(var a2:arbol2; a:auto);
begin
	if(a2=nil)then begin
		new(a2);
		a2^.d.info:=nil; //creo la lista
		a2^.d.marca:=a.marca;
		addLista(a2^.d.info,a.patente,a.anio,a.modelo);
		a2^.hi:=nil;
		a2^.hd:=nil;
	end
	else
		if(a2^.d.marca=a.marca)then
			addLista(a2^.d.info,a.patente,a.anio,a.modelo)
		else
			if(a2^.d.marca > a.marca)then
				addArbol2(a2^.hi,a)
			else
				addArbol2(a2^.hd,a);
end;

procedure cargarArboles(var a1: arbol1; var a2: arbol2);
var
	a:auto;
begin
	lectura(a);
	while (a.patente <> '-1')do begin
		addArbol1(a1,a);
		addArbol2(a2,a);
		lectura(a);
	end;
end;

procedure inicializarArboles (var a1: arbol1; var a2: arbol2; var v:vect);
var
	i:integer;
begin
	a1:=nil;
	a2:=nil;
	for i:= 2010 to 2018 do
		v[i]:=nil;
end;

function autoXMarcaA1(a1:arbol1;m:string):integer;
begin
	if(a1=nil)then
		autoXMarcaA1:=0
	else
		if(a1^.d.marca=m)then
			autoXMarcaA1:= 1 + autoXMarcaA1(a1^.hi,m) + autoXMarcaA1(a1^.hd,m)
		else
			autoXMarcaA1:= autoXMarcaA1(a1^.hi,m) + autoXMarcaA1(a1^.hd,m);
end;

function marcaLista (l:lista):integer;
var
	cant:integer;
begin
	cant:=0;
	while(l<>nil)do begin
		cant:= cant+1;
		l:= l^.sig;
	end;
	marcaLista:=cant;
end;

function autoXMarcaA2 (a2: arbol2; m:string):integer;
begin
	if(a2=nil)then
		autoXMarcaA2:=0
	else
		if(a2^.d.marca = m)then
			autoXMarcaA2:= marcaLista(a2^.d.info)
		else
			if(a2^.d.marca>m)then
				autoXMarcaA2:= autoXMarcaA2(a2^.hi,m)
			else
				autoXMarcaA2:= autoXMarcaA2(a2^.hd,m);
end;

procedure addListaVect (var lv: listaVect; pat: string; marca: string; modelo:string);
var
	n:listaVect;
begin
	new (n);
	n^.d.marca:=marca;
	n^.d.patente:=pat;
	n^.d.modelo:= modelo;
	n^.sig:=lv;
	lv:=n;
end;

procedure imprimirLvect(l:listaVect);
begin
	while (l<>nil)do begin
		writeln('Patente: ',l^.d.patente,', marca: ',l^.d.marca,' y modelo: ',l^.d.modelo);
	end;
end;

procedure imprimirVect (v:vect);
var
	i:integer;
begin
	for i:= 2010 to 2018 do begin
		writeln('autos de anio de fabricacion ', i);
		imprimirLvect(v[i]);
	end;
end;

procedure cargarVect(a1:arbol1; var v:vect);
begin
	if(a1<>nil)then begin
		cargarVect(a1^.hi,v);
		addListaVect(v[a1^.d.anio],a1^.d.patente,a1^.d.marca,a1^.d.modelo);
		cargarVect(a1^.hd,v);
	end;
end;

function buscarPatenteA1 (a1: arbol1; pat:string):string;
begin
	if(a1=nil)then
		buscarPatenteA1:= 'no se ha encontrado la patente'
	else
		if(a1^.d.patente = pat)then
			buscarPatenteA1:= a1^.d.modelo
		else
			buscarPatenteA1:= buscarPatenteA1(a1^.hi,pat) + buscarPatenteA1 (a1^.hd,pat);
end;

procedure buscarPatenteL (l:lista; pat: string; var modABuscar: string; var check: boolean);
var
	aux: string;
begin
	aux:= 'no se ha encontrado la patente';
	while ((l<>nil)and (not check))do 
		if(l^.d.patente=pat)then begin
			aux:= l^.d.modelo;
			check:= true;
		end
		else
			l:= l^.sig;
	modABuscar:=aux;
end;

procedure buscarPatenteA2 (a2:arbol2; pat:string; var modABuscar:string; var check: boolean);
begin
	if(a2<>nil)then
		if(not check)then begin
			buscarPatenteA2(a2^.hi,pat,modABuscar,check);
			buscarPatenteL(a2^.d.info,pat,modABuscar,check);
			buscarPatenteA2(a2^.hd,pat,modABuscar,check);
		end;
end;


var
	a1:arbol1;
	a2:arbol2;
	v:vect;
	modABuscar:string;
	check: boolean;
begin
	check:=false;
	inicializarArboles(a1,a2,v);
	cargarArboles(a1,a2);
	writeln('Arbol 1 - cantidad de la marca nissan: ',autoXMarcaA1(a1,'nissan'));
	writeln('Arbol 2 - canridad de la marca toyota: ',autoXMarcaA2(a2,'toyota'));
	cargarVect(a1,v);
	imprimirVect(v);
	writeln('el modelo del auto con patente sus09 es: ',buscarPatenteA1(a1,'sus09'));
	buscarPatenteA2(a2,'huh54',modABuscar,check);
	writeln('el modelo del auto con patente huh54 es: ',modABuscar);
end.
