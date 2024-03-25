package P2;
import PaqueteLectura.Lector;
public class ej1 {

    public static void main(String[] args) {
		Persona persona1;
		String nombre;
		int edad,dni;
		System.out.println("ingrese el nombre de la persona");
		nombre = Lector.leerString();
		System.out.println("ingrese el dni de la persona");
		dni = Lector.leerInt();
		System.out.println("ingrese la edad de la persona");
		edad = Lector.leerInt();
		persona1 = new Persona (nombre,dni,edad);
		System.out.println(persona1.toString());
    }

}

