package P3;
import PaqueteLectura.Lector;
public class Ej1 {
    public static void main(String[] args) {
        Triangulo triangulo1;
        double lado1,lado2,lado3;
        String colorRelleno,colorLineas;
        System.out.println("ingrese el tamanio del lado 1");
        lado1 = Lector.leerDouble();
        System.out.println("ingrese el tamanio del lado 2");
        lado2= Lector.leerDouble();
        System.out.println("ingrese el tamanio del lado 3");
        lado3= Lector.leerDouble();
        System.out.println("ingrese el color de relleno del triangulo");
        colorRelleno=Lector.leerString();
        System.out.println("ingrese el color de las lineas del triangulo");
        colorLineas=Lector.leerString();
        triangulo1= new Triangulo (lado1,lado2,lado3,colorRelleno,colorLineas);
        System.out.println("el perimetro del triangulo es: "+ triangulo1.calcularPerimetro());
        System.out.println("el area del trinagulo es: "+ triangulo1.calcularArea(triangulo1.calcularS()));
    }
}
