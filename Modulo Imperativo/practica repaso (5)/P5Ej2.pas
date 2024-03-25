program ej2;
type
	year= 2010..2018;
	auto= record
		patente: integer;
		ano: year;
		marca: string;
		modelo: string;
	end;
	autoRed=record
		patente:integer;
		ano: year;
		modelo: string;
	end;
	autoRed2=record
		patente: integer;
		marca: string;
		modelo: string;
	end;
	listaD=^nodoD;
	nodoD=record
		d:autoRed2;
		sig: listaD;
	end;
	lista=^nodoLista;
	nodoLista= record
		d:autoRed;
		sig:lista;
	end;
	datosArbol2=record
		marca: string;
		caract: lista;
	end;
	arbol1=^nodo1;
	nodo1=record
		d: auto;
		hi: arbol1;
		hd: arbol1;
	end;
	arbol2=^nodo2;
	nodo2=record
		d: datosArbol2;
		hi: arbol2;
		hd: arbol2;
	end;
	vAnos= array [year]of listaD;

procedure lectura (var a: auto);
begin
	writeln('ingrese la pantente del auto');
	readln(a.patente);
	if(a.patente<>-1)then begin
		writeln('ingrese el ano de fabricacion del auto');
		readln(a.ano);
		writeln('ingrese la marca del auto');
		readln(a.marca);
		writeln('ingrese el modelo del auto');
		readln(a.modelo);
	end;
end;

procedure add_arbol1(var a1:arbol1; a:auto);
begin
	if(a1=nil)then begin
		new(a1);
		a1^.d:=a;
		a1^.hi:= nil;
		a1^.hd:= nil;
	end
	else
		if(a1^.d.patente>=a.patente)then
			add_arbol1(a1^.hi,a)
		else
			add_arbol1(a1^.hd,a);
end;

procedure add_lista (var l:lista; patente: integer; ano: year; modelo: string);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.d.patente:= patente;
	nuevo^.d.ano:= ano;
	nuevo^.d.modelo:= modelo;
	nuevo^.sig:= l;
	l:=nuevo;
end;

procedure add_arbol2 (var a2: arbol2; a: auto);
begin
	if(a2=nil)then begin
		new(a2);
		a2^.d.caract:=nil;
		a2^.d.marca:= a.marca;
		add_lista(a2^.d.caract,a.patente,a.ano,a.modelo);
		a2^.hi:=nil;
		a2^.hd:= nil;
	end
	else
		if(a2^.d.marca=a.marca)then
			add_lista(a2^.d.caract,a.patente,a.ano,a.modelo)
		else
			if(a2^.d.marca>a.marca)then
				add_arbol2(a2^.hi,a)
			else
				add_arbol2(a2^.hd,a);
end;

procedure cargar_arboles (var a1: arbol1; var a2: arbol2);
var
	a: auto;
begin
	lectura (a);
	while(a.patente<>-1)do begin
		add_arbol1(a1,a);
		add_arbol2(a2,a);
		lectura(a);
	end;
end;

procedure inicializar_arboles (var a1: arbol1; var a2: arbol2);
begin
	a1:=nil;
	a2:= nil;
end;

function cant_marca(a1:arbol1;marca:string):integer;
begin
	if(a1=nil)then
		cant_marca:= 0
	else
		if(a1^.d.marca=marca)then
			cant_marca:= 1 + cant_marca(a1^.hi,marca) + cant_marca(a1^.hd,marca)
		else
			cant_marca:= cant_marca(a1^.hi,marca) + cant_marca(a1^.hd,marca);
end;

procedure punto_b (a1: arbol1);
var
	aux: string;
begin
	writeln('ingrese la marca que se desea saber la cantidad de autos que hay');
	readln(aux);
	writeln('hay ', cant_marca(a1,aux), ' autos de la marca ',aux);
end;

function cant_marca_lista (l:lista): integer;
var
	aux: integer;
begin
	aux:= 0;
	while (l<>nil)do begin
		aux:= aux +1;
		l:= l^.sig;
	end;
	cant_marca_lista:= aux;
end;

{procedure recorrer_arbol2_c (a2: arbol2; marca: string; var total: integer);
begin
	if(a2<>nil)then
		if(a2^.d.marca= marca)then
			total:= cant_marca_lista(a2^.d.caract)
		else
			if(a2^.d.marca> marca)then
				recorrer_arbol2_c(a2^.hi,marca,total)
			else
				recorrer_arbol2_c(a2^.hd,marca,total);
end;}

function cant_marca_c(a2:arbol2; marca:string):integer;
begin
	if(a2=nil)then
		cant_marca_c:= 0
	else
		if(a2^.d.marca=marca)then
			cant_marca_c:= cant_marca_lista(a2^.d.caract)
		else
			if(a2^.d.marca>marca)then
				cant_marca_c:= cant_marca_c(a2^.hi,marca)
			else
				cant_marca_c:= cant_marca_c(a2^.hd,marca);
end;

procedure punto_c(a2:arbol2);
var
	aux: string;
begin
	writeln('ingrese la marca que se desea saber cuantos autos hay');
	readln(aux);
	writeln('la cantidad total de autos de la maraca ',aux,' es ',cant_marca_c(a2,aux));
end;

procedure imprimir_arbol1 (a1:arbol1);
begin
	if(a1<>nil)then begin
		imprimir_arbol1(a1^.hi);
		writeln('la patente es: ', a1^.d.patente,' y su marca es ',a1^.d.marca);
		imprimir_arbol1(a1^.hd);
	end;
end;

procedure imprimir_lista (l:lista);
begin
	while(l<>nil)do begin
		writeln('la patente es: ',l^.d.patente);
		l:= l^.sig;
	end;
end;

procedure imprimir_arbol2 (a2: arbol2);
begin
	if(a2<>nil)then begin
		imprimir_arbol2(a2^.hi);
		writeln('la marca es: ', a2^.d.marca);
		imprimir_lista(a2^.d.caract);
		imprimir_arbol2(a2^.hd);
	end;
end;

procedure inicializar_vector(var v:vAnos);
var
	i:integer;
begin
	for i:= 2010 to 2018 do
		v[i]:= nil;
end;

procedure add_listaD (var l: listaD; patente: integer; marca,modelo: string);
var
	nuevo: listaD;
begin
	new(nuevo);
	nuevo^.d.patente:= patente;
	nuevo^.d.marca:= marca;
	nuevo^.d.modelo:= modelo;
	nuevo^.sig:= l;
	l:=nuevo;
end;

procedure punto_d (a1: arbol1; var vD: vAnos);
begin
	if(a1<>nil)then begin
		punto_d(a1^.hi,vD);
		add_listaD(vD[a1^.d.ano],a1^.d.patente,a1^.d.marca,a1^.d.modelo);
		punto_d(a1^.hd,vD);
	end;
end;

procedure imprimir_listaD (l:listaD);
begin
	while (l<>nil) do begin
		writeln('el auto es marca ', l^.d.marca,' modelo ', l^.d.modelo,' y su patente es ',l^.d.patente);
		l:=l^.sig;
	end;
end;

procedure imprimir_vectorD(vD: vAnos);
var
	i: year;
begin
	for i:= 2010 to 2018 do begin
		writeln('para el ano ', i,' hay los siguientes autos:');
		imprimir_listaD(vD[i]);
	end;
end;

function patente_a_bucar (a1: arbol1; patente:integer): string;
begin
	if(a1=nil)then
		patente_a_bucar:= 'la patente no se encontro'
	else
		if(a1^.d.patente=patente)then
			patente_a_bucar:= a1^.d.modelo
		else
			if(a1^.d.patente>patente)then
				patente_a_bucar:= patente_a_bucar(a1^.hi,patente)
			else
				patente_a_bucar:= patente_a_bucar(a1^.hd,patente);
end;

procedure punto_e (a1: arbol1);
var
	aux: integer;
begin
	writeln('ingrese la patente del auto que se desea saber el modelo');
	readln(aux);
	writeln('el modelo del auto con patente ',aux,' es: ',patente_a_bucar(a1,aux));
end;

procedure patente_lista_f (l:lista; patente: integer; var check: boolean; var patenteEncontrar: string );
var
  aux: string;
begin
	aux:= 'no se encontro la patente en esta marca';
	while(l<>nil)and(not check)do begin
		if(l^.d.patente=patente)then begin
			check:= true;
			aux:= l^.d.modelo;
		end;
		l:=l^.sig;
	end;
	patenteEncontrar:= aux;
end;

procedure patente_arbol2 (a2: arbol2; patente: integer; var modEncontrar:string; var check: boolean);
begin
	if(not check)then begin
		patente_lista_f(a2^.d.caract,patente,check,modEncontrar);
		patente_arbol2(a2^.hi,patente,modEncontrar,check);
		patente_arbol2(a2^.hd,patente,modEncontrar,check);
	end;
end;

procedure punto_f(a2: arbol2);
var
	aux: integer;
	modEncontrar: string;
	check: boolean;
begin
	check:= false;
	writeln('ingrese la patente del auto que se desea saber el modelo');
	readln(aux);
	patente_arbol2(a2,aux,modEncontrar,check);
	writeln('el modelo del auto con patente ',aux,' es ',modEncontrar);
end;
var
	a1: arbol1;
	a2: arbol2;
	vD: vAnos;
begin
	inicializar_vector(vD);
	inicializar_arboles(a1,a2);
	cargar_arboles(a1,a2);
	imprimir_arbol1(a1);
	imprimir_arbol2(a2);
	punto_b(a1);
	punto_c(a2);
	punto_d(a1,vD);
	imprimir_vectorD(vD);
	punto_e(a1);
	punto_f(a2);
	
end.

