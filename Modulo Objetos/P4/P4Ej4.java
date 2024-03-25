package P4;
public class P4Ej4 {
    public static void main(String[] args) {
        VisorFiguras visor = new VisorFiguras();
        Cuadrado c1= new Cuadrado (10,"Violeta","Rosa");
        Rectangulo r1= new Rectangulo (20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado (30,"Rojo","Naranja");
        
        visor.mostrar(c1);
        visor.mostrar(r1);
        visor.mostrar(c2);
        
        System.out.println(visor.getMostradas());
    }  
}
