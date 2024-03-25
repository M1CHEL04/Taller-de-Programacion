package ej2;
public class ejercicio2 {
    public static void main(String[] args) {
        Estacionamiento e1;
        e1= new Estacionamiento ("aa","43",8,21,3,3);
        Auto a1= new Auto ("valentin","aza");
        Auto a2= new Auto ("SAntiago","aaa");
        Auto a3= new Auto ("juan","poo");
        Auto a4= new Auto ("pepe","ape");
        Auto a5= new Auto ("jorge","pas");
        Auto a6= new Auto ("dario","dsaa");
        e1.agregarAuto(a1,1,1);
        e1.agregarAuto(a2,2,2);
        e1.agregarAuto(a3,3,3);
        e1.agregarAuto(a4,1,2);
        e1.agregarAuto(a5,2,3);
        e1.agregarAuto(a6,3,1);
        System.out.println(e1.toString());
        System.out.println("La cantiadad de autos en la plaza 1 es "+e1.cantAutosPlaza(1));
        System.out.println(e1.buscarPatente("ape"));
    }
}

