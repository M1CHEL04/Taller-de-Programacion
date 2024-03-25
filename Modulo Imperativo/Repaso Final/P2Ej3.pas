program ej3;
type
	lista= ^nodo;
	nodo= record
		d: integer;
		sig: lista;
	end;
	
procedure addLista (var l: lista; aux: integer);
var
	n: lista;
begin
	new(n);
	n^.d:= aux;
	n^.sig:= l;
	l:= n;
end;

procedure cargarLista(var l: lista);
var
	aux: integer;
begin
	//aux:= random (100);
	read(aux);
	if(aux <> 0)then begin
		addLista(l,aux);
		cargarLista(l);
	end;
end;

procedure min (l: lista; var m: integer);
begin
	if(l <> nil)then begin
		if(l^.d<m)then
			m:= l^.d;
		min(l^.sig,m);
	end;
end;

function max (l: lista): integer;
var
	aux: integer;
begin
	if(l=nil)then
		max:= -1
	else begin
		aux:= max(l^.sig);
		if(l^.d>aux)then
			max:= l^.d
		else
			max:= aux;
	end;
end;

function esta (l: lista; num: integer): boolean;
begin
	if(l=nil)then
		esta:= false
	else 
		if(l^.d=num)then
			esta:= true
		else
			esta:= esta(l^.sig,num);
end;

var
	l:lista;
begin
	cargarLista(l);
	writeln(esta(l,3));
end.
