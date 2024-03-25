package ej3;
public class pp_ej3 {
    public static void main(String[] args) {
        Evento e1;
        Gira g1;
        Fecha f1;
        Fecha f2;
        //creo las fechas
        f1= new Fecha("La plata",13);
        f2= new Fecha ("Los toldos",14);
        //creo mi gira y mi evento
        g1=new Gira("ciuffi",2,"Camioneta",2);
        e1= new Evento("Los totoras",2,"Show de TV","Mario",3);
        //aniado las fechas a la gira
        g1.agregarFecha(f1);
        g1.agregarFecha(f2);
        //aniado temas al tracklist de la gira
        g1.agregarTema("aaa");
        g1.agregarTema("bbb");
        //aniado temas al tracklist del evento
        e1.agregarTema("ccc");
        e1.agregarTema("ddd");
        //el actuar de la gira
        g1.actuar();
        g1.actuar();
        System.out.println("y para el evento");
        e1.actuar();
        //calculo los costos de la gira
        System.out.println("El costo de la gira "+g1.getNombreGira()+" es de "+g1.calcularCosto()+" pesos.");
        //calculo el costo del evento
        System.out.println("El costo del evento organizado por "+e1.getNombreContratante()+" es de "+e1.calcularCosto()+" pesos.");
    }
    
}
