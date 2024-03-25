package P4;
public class P4Ej5 {
    public static void main(String[] args) {
        VisorFigurasVector visor= new VisorFigurasVector ();
        Cuadrado c1 = new Cuadrado (2,"Naranja","Verde");
        Cuadrado c2 = new Cuadrado (3,"verde","Amarillo");
        Rectangulo r1 = new Rectangulo (3,3,"azul","amarillo");
        visor.addFigura(c1);
        visor.addFigura(c2);
        visor.addFigura(r1);
        for (int i = 0; i < 3; i++) {
            visor.mostrar(i);
        }
        System.out.println("la cantidad de figuras son: "+ visor.getGuardadas());
    }
    
}
