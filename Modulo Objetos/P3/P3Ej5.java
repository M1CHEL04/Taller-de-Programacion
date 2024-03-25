package P3;
import PaqueteLectura.Lector;
public class P3Ej5 {
    public static void main(String[] args) {
       //declaro las variables a usar
       Circulo c1;
       double radio;
       String cRelleno,cLinea;
       //ingreso los datos del circulo
       System.out.println("ingrese el radio del circulo");
       radio= Lector.leerDouble();
       System.out.println("ingrese el color de relleno");
       cRelleno= Lector.leerString();
       System.out.println("ingrese el color de la linea");
       cLinea= Lector.leerString();
       //creo el objeto c1 de clase circulo
       c1= new Circulo (radio,cRelleno,cLinea);
       //imprimo las caracteristicas de mi circulo
        System.out.println(c1.toString());
       // calculo el perimetro y el area del circulo
       System.out.println("el perimetro del circulo es "+ c1.calcularPerimetro());
       System.out.println("el area del circulo es "+ c1.calcularArea()); 
    }
    
}
