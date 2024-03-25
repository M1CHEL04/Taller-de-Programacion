package PviejoSubsidio;
public class Main {
    public static void main(String[] args) {
        SubsidioEstadia se;
        SubsidioBienes sb;
        Bien b1,b2,b3;
        b1= new Bien ("precinto",3,100);
        b2= new Bien ("tuerca",2,50);
        b3= new Bien ("tornillo",5,100);
        sb= new SubsidioBienes("Francisco","Ferreteria","22 de Marzo",4);
        sb.addBien(b1);
        sb.addBien(b2);
        sb.addBien(b3);
        se= new SubsidioEstadia ("Fernando","viaje","30 de marzo","Bariloche",2000,3,200);
        System.out.println("Subsidio estadia: "+se.montoTotal());
        System.out.println("Subsidio bien: "+sb.montoTotal());
        System.out.println(se.toString());
        System.out.println(sb.toString());
    }
}
