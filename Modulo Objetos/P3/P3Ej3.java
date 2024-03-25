package P3;
import PaqueteLectura.Lector;
public class P3Ej3 {
    public static void main(String[] args) {
        Estante estante = new Estante ();
        Libro libro1;
        int i;
        String titulo;
        for(i=0;i<5;i++){
            System.out.println("ingrese el titulo del libro");
            titulo = Lector.leerString();
            libro1 = new Libro (titulo);
            estante.setAddLibro(libro1);
        }
        System.out.println(estante.estaLibro("mujercitas"));
    }

}
