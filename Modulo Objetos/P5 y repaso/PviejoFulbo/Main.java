package PviejoFulbo;
public class Main {
    public static void main(String[] args) {
       Torneo t;
       Goleador g1,g2,g3,g4;
       t= new Torneo ("Sergio Daniel (Manteca) Martinez",3,3);
       g1= new Goleador ("Edinson Cavani","Boca Juniors",4);
       g2= new Goleador ("Cristina Medina","Boca Juniors",2);
       g3= new Goleador ("Hernan Lopez","Godoy Cruz",3);
       g4= new Goleador ("Miguel Borja","RiBer Plata",1);
       t.addGoleador(1, g1);
       t.addGoleador(2, g2);
       t.addGoleador(2, g3);
       t.addGoleador(3, g4);
       if (t.menosGolesFechaX(2) != null){
           System.out.println(t.menosGolesFechaX(2).toString());
       }
       else
            System.out.println("Fechas sin goleadores");
       System.out.println("La cantidad de goleadores del torneo son: "+t.goleadoresDelTorneo());
       System.out.println(t.toString());
    }
}
