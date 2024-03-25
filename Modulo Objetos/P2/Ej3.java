package P2;
import PaqueteLectura.Lector;
public class Ej3 {
    public static void main(String[] args){ 
        Persona [][] matriz = new Persona [8][5];
	int edad, dni, dl,dia,turno,i;
	String nombre;
	System.out.println("Ingrese el nombre de la persona");
	nombre = Lector.leerString();
	dl = -1;
	while((dl<39)&&(!nombre.equals("ZZZ"))){
            dl++;
            dia= dl/8;
            turno= dl % 8;
            System.out.println("ingrese el dni de la persona");
            dni = Lector.leerInt();
            System.out.println("ingrese la edad de la persona");
            edad = Lector.leerInt();
            matriz [dia][turno]= new Persona (nombre,dni,edad);
            System.out.println("ingrese el nombre de la persona");
            nombre = Lector.leerString();
        }
        for(i=0; i<=dl;i++){
            dia = i/8;
            turno = i % 8;
            System.out.println("dia "+ dia);
            System.out.println("turno "+ turno);
            System.out.println(matriz[dia][turno].toString());
        }
    }
}


