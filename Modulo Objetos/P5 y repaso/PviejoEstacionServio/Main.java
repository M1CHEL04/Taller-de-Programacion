package PviejoEstacionServio;
public class Main {
    public static void main(String[] args) {
        EstacionDeServicio E;
        Surtidor s1,s2;
        Venta v1,v2,v3,v4;
        v1= new Venta (0,0,0,"a");
        v2= new Venta (0,0,0,"");
        v3= new Venta (0,0,0,"");
        v4= new Venta (0,0,0,"");
        s1= new Surtidor ("V-Power",200,4);
        s2= new Surtidor ("Infinia",300,3);
        E= new EstacionDeServicio("Av 60");
        E.addSurtidor(s1);
        E.addSurtidor(s2);
        E.addVenta(2, 44, 3, "efectivo", v1);
        E.addVenta(2, 33, 2,"efectivo", v2);
        E.addVenta(2, 33, 5, "efectivo", v3);
        E.addVenta(1, 55, 2, "efectivo", v4);
        System.out.println("El surtidor que mas dinero en efectivo vendio fue "+E.surtidorMaxEfectivo());
        System.out.println(E.toString());
    }
    
}
