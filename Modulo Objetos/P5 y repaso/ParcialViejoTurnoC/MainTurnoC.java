package ParcialViejoTurnoC;
public class MainTurnoC {
    public static void main(String[] args) {
        Estacion e1;
        Surtidor s1,s2;
        Venta v1,v2,v3;
        //creo la estacion
        e1= new Estacion ("Lavalle");
        //creo las ventas;
        v1= new Venta (44,3,200,1);
        v2= new Venta (11,6,400,2);
        v3= new Venta (55,1,50,1);
        //creo los surtidores;
        s1=new Surtidor (12,10,2);
        s2= new Surtidor (15,10,2);
        //asigno los surtidores a mi estacion
        e1.agregarSurtidor(s1);
        e1.agregarSurtidor(s2);
        //agrego las ventas a los surtidores
        e1.agregarVentaASurtidor(v1,1);
        e1.agregarVentaASurtidor(v2,0);
        e1.agregarVentaASurtidor(v3,1);
        //consulto cual es el surtidor que recaudo mayor dinero en efectivo
        System.out.println("El surtidor que recaudo mayor dinero en efectivo es el surtidor numero: "+e1.surtidorMayorRecaudoEfectivo());
        //imprimo la situacion de la estacion
        System.out.println(e1.toString());
    }
    
}
