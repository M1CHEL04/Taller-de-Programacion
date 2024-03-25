package Estacionamiento;
public class MainEstacionamiento {
    public static void main(String[] args) {
        Estacionamiento e1= new Estacionamiento ("aaa","bbb",8,20,3,3);
        Auto a1,a2,a3,a4,a5,a6;
        //creo los autos
        a1= new Auto ("A","aaa");
        a2= new Auto ("B","bbb");
        a3= new Auto ("C","ccc");
        a4= new Auto ("D","ddd");
        a5= new Auto ("E","eee");
        a6= new Auto ("F","fff");
        //agrego los autos
        e1.addAuto(1, 1, a1);
        e1.addAuto(2, 2, a2);
        e1.addAuto(3, 3, a3);
        e1.addAuto(1, 2, a4);
        e1.addAuto(2, 3, a5);
        e1.addAuto(3, 1, a6);
        System.out.println(e1.toString());
        System.out.println("La cantidad de autos en la plaza 1 es: "+e1.cantAutosPlazaX(1)+" autos.");
        System.out.println(e1.buscarPorPatente("aaa"));
    }
    
}
