program tres;
type 
	listas=^nodo;
	nodo = record 
		d: integer;
		sig: listas;
	end;

procedure agregarLista (var pri: listas; aux: integer);
var
	n: listas;
begin
	new (n);
	n^.d:= aux;
	writeln(n^.d);
	n^.sig:= pri;
	pri:= n;
end;
procedure cargarLista (var pri: listas);
var
	aux: integer;
begin
	aux:= random (100);
	if (aux <> 0) then begin
		agregarLista (pri, aux);
		cargarLista (pri);
	end;
end;

procedure calcularMin (pri: listas; var min: integer);
begin
	if (pri <> nil) then begin
		if (pri^.d < min) then
			min:= pri^.d;
		calcularMin (pri^.sig, min);
	end;
end;
function calcularMax (pri: listas): integer;
var
	aux: integer;
begin
	
	if (pri = nil) then
		calcularMax:= -1
	else begin
		aux:= calcularMax(pri^.sig);
		if (pri^.d > aux) then
			calcularMax:= pri^.d
		else
			calcularMax:= aux;
	end;
end;

procedure check (pri: listas; num: integer; var aux: boolean); {el aux viene en false desde el p. principal}
begin
	if(pri<> nil)then begin
		if(pri^.d=num)then
			aux:= true
		else
		check(pri^.sig,num,aux);
	end;
end;

{function encontrar (pri: listas; num: integer): boolean;
var
begin
	if (pri = nil) then
		encontrar:= false;
	else begin
		if (pri^.d = num)then
			encontrar:= true;
		else
			
	end;
end;
}
var 
	pri: listas;
	min:integer;
	num: integer;
	aux: boolean;
begin
	randomize;
	min:= 101;
	pri:= nil;
	cargarLista (pri);
	calcularMin (pri, min);
	writeln('el minimo es: ', min);
	writeln ('El maximo es: ', calcularMax (pri));
	num:= random(99)+1;
	writeln('el numero a encontrar es:',num);
	aux:= false;
	check(pri,num,aux);
	writeln(aux);
	{writeln (encontrar (pri, num));}
end.
