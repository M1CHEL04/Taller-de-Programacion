program ej4;
type
  reclamo=record
    cod: integer;
    dni: integer;
    ano: integer;
    tipo: string;
  end;
  reclamoRed= record
    cod: integer;
    ano: integer;
    tipo: string;
  end;
  lista=^nodol;
  nodol=record
    d:reclamoRed;
    sig:lista;
  end;
  datosLista= record
    dni: integer;
    totalReclamos: integer;
    r: lista;
  end;
  arbol=^nodo1;
  nodo1= record
    d: datosLista;
    hi:arbol;
    hd:arbol;
  end;
  
procedure lectura (var r: reclamo);
begin
  writeln('ingrese el codigo de reclamo');
  readln(r.cod);
  if(r.cod<>-1)then begin
    writeln('ingrese el dni de la persona que hizo el reclamo');
    readln(r.dni);
    writeln('ingrese el ano en el que se hizo el reclamo');
    readln(r.ano);
    writeln('ingrese el tipo de reclamo');
    readln(r.tipo);
  end;
end;

procedure add_lista(var l: lista; cod,ano: integer; tipo: string);
var
  nuevo:lista;
begin
  new(nuevo);
  nuevo^.d.cod:= cod;
  nuevo^.d.ano:= ano;
  nuevo^.d.tipo:= tipo;
  nuevo^.sig:= l;
  l:=nuevo;
end;

procedure add_arbol (var a: arbol; rec: reclamo);
begin
  if(a=nil)then begin
    new(a);
    a^.d.r:= nil;
    add_lista(a^.d.r,rec.cod,rec.ano,rec.tipo);
    a^.d.dni:= rec.dni;
    a^.d.totalReclamos:= 1;
    a^.hi:= nil;
    a^.hd:= nil;
  end
  else
    if(a^.d.dni=rec.dni)then begin
      add_lista(a^.d.r,rec.cod,rec.ano,rec.tipo);
      a^.d.totalReclamos:= a^.d.totalReclamos +1;
    end
    else
      if(a^.d.dni>rec.dni)then
	add_arbol(a^.hi,rec)
      else
	add_arbol(a^.hd,rec);
end;

function cant_reclamos (l:lista):integer;
var
  aux: integer;
begin
  aux:=0;
  while(l<>nil)do begin
    aux:= aux +1;
    l:=l^.sig;
  end;
  cant_reclamos:= aux;
end;

function cantidad_reclamos_arbol (a:arbol; dni: integer): integer;
begin
  if(a=nil)then
    cantidad_reclamos_arbol:= 0
  else
    if(a^.d.dni=dni)then
      cantidad_reclamos_arbol:= cant_reclamos (a^.d.r)
    else
      if(a^.d.dni>dni)then
	cantidad_reclamos_arbol:= cantidad_reclamos_arbol(a^.hi,dni)
      else
	cantidad_reclamos_arbol:= cantidad_reclamos_arbol(a^.hd,dni);
end;

procedure punto_b (a:arbol);
var
  aux: integer;
begin
  writeln('ingrese el numero de dni que se deseas saber la cantidad total de reclamos');
  readln(aux);
  writeln('la cantidad de reclamos que hizo el dni ', aux,' es ', cantidad_reclamos_arbol(a,aux));
end;

procedure cargar_arbol(var a: arbol);
var
  rec: reclamo;
begin
  lectura(rec);
  while(rec.cod<>-1)do begin
    add_arbol(a,rec);
    lectura(rec);
  end;
end;

function cant_reclamos_entre_dos(a:arbol;li,ls:integer):integer;
begin
	if(a=nil)then
		cant_reclamos_entre_dos:= 0
	else
		if(a^.d.dni>=li)then
			if(a^.d.dni<=ls)then
				cant_reclamos_entre_dos:= cant_reclamos(a^.d.r) + cant_reclamos_entre_dos(a^.hd,li,ls) + cant_reclamos_entre_dos(a^.hi,li,ls)
			else
				cant_reclamos_entre_dos:= cant_reclamos_entre_dos(a^.hi,li,ls)
		else
			cant_reclamos_entre_dos:= cant_reclamos_entre_dos(a^.hd,li,ls);
end;

procedure punto_c (a: arbol);
var
	li,ls: integer;
begin
	writeln('ingrese el limite inferior');
	readln(li);
	writeln('ingrese el limite superior');
	readln(ls);
	writeln('la cantidad de reclamos que hay entre los dni ', li,' y ',ls,' son ', cant_reclamos_entre_dos(a,li,ls),' reclamos.');
end;

function reclamosXano (l:lista; ano: integer): integer;
var
	aux: integer;
begin
	aux:= 0;
	while(l<>nil)do begin
		if(l^.d.ano=ano)then
			aux:= aux+1;
		l:=l^.sig;
	end;
	reclamosXano:=aux;
end;

function reclamos_arbol (a:arbol; ano: integer):integer;
begin
	if(a=nil)then
		reclamos_arbol:= 0
	else
		reclamos_arbol:= reclamosXano(a^.d.r,ano) + reclamos_arbol(a^.hi,ano) + reclamos_arbol(a^.hd,ano);
end;

procedure punto_d (a: arbol);
var
	aux: integer;
begin
	writeln('ingrese el ano que se desea buscar todos los reclamos');
	readln(aux);
	writeln('en el ano ',aux,' se hicieron ', reclamos_arbol(a,aux),' reclamos.');
end;

procedure imprir_lista (l: lista);
begin
	while(l<>nil)do begin
		writeln('el codigo del reclamo es ',l^.d.cod,' y se hizo en el ano ',l^.d.ano);
		l:=l^.sig;
	end;
end;

procedure imprimir_arbol (a:arbol);
begin
	if(a<>nil)then begin
		writeln('el dni que realizo el reclamo es: ',a^.d.dni);
		imprir_lista(a^.d.r);
		imprimir_arbol(a^.hi);
		imprimir_arbol(a^.hd);
	end;
end;

var
  a: arbol;
  
begin
  cargar_arbol(a);
	imprimir_arbol(a);
  punto_b(a);
  punto_c(a);
  punto_d(a);
end.
