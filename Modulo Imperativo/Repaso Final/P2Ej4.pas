program ej4;
type
var
	vect= array [1..20] of integer;

procedure cargarVector (var v: vet; i: integer);
var
	aux: integer;
begin
	aux:= random(100);
	if(i<=20)then begin
		v[i]:= aux;
		cargarVector(v,i+1);
	end;
end;


//ver si se puede hacer como una funcion.
procedure max (v: vect, i: integer, var max: integer);
begin
	if (i < 20)then begin
		if(v[i]>max)then
			max:= v[i];
		max(v,i+1,max);
	end;
end;

function suma (v: vect, i: integer, var suma: integer);
begin
	if(i<20)then begin
		suma:= suma+ v[i];
		suma(v,i+1,suma);
	end;
end;

begin

end.
