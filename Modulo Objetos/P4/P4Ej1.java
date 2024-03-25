package P4;
public class P4Ej1 {
    public static void main(String[] args) {
        Triangulo t1;
        Circulo c1;
        t1= new Triangulo (3,3,3,"rojo","violeta");
        c1= new Circulo (4,"naranja","azul");
        System.out.println(c1.toString());
        System.out.println(t1.toString());
        c1.despintar();
        t1.despintar();
        System.out.println(c1.toString());
        System.out.println(t1.toString());
    }
    
}
