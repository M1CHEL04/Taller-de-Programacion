package P3;
import PaqueteLectura.Lector;
public class P3Ej4 {
    public static void main(String[] args) {
        Hotel hotel;
        Cliente c;
        String nombre;
        int dni,edad,cantHabitaciones,nhabitacion;
        System.out.println("ingrese el cantidad de habitaciones del hotel");
        cantHabitaciones = Lector.leerInt();
        hotel= new Hotel(cantHabitaciones);
        //cargar los clientes
        for (int i = 0; i < cantHabitaciones; i++) {
            System.out.println("ingrese el nombre del cliente");
            nombre= Lector.leerString();
            System.out.println("ingrese la edad del cliente");
            edad= Lector.leerInt();
            System.out.println("ingrese el dni del cliente");
            dni=Lector.leerInt();
            System.out.println("ingrese el numero de habitacion");
            nhabitacion= Lector.leerInt();
            c= new Cliente (edad,dni,nombre);
            
            
        }
    } 
}
