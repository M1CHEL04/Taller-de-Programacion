package P2;
import PaqueteLectura.Lector;
public class Ej5 {
    public static void main(String[] args) {
        int df= 20;
        Partido[] vPartidos;
        vPartidos = new Partido [df];
        int dl,golesL,golesV,i;
        String equipoL,equipoV;
        //cargar vecetor
        dl =-1;
        System.out.println("ingrese el nombre del equipo visitante");
        equipoV = Lector.leerString();
        while((dl<df)&&(!equipoV.equals("ZZZ"))){
            dl++;
            System.out.println("ingrese el nombre del equipo local");
            equipoL = Lector.leerString();
            System.out.println("ingrese los goles marcados por el equipo local");
            golesL = Lector.leerInt();
            System.out.println("ingrese los goles marcados por el equipo visitante");
            golesV = Lector.leerInt();
            vPartidos [dl] = new Partido (equipoL,equipoV,golesL,golesV);
            System.out.println("ingrese el nombre del equipo visitante");
            equipoV = Lector.leerString();
        }         
        //imprimir vector de la forma {EquipoL goles VS EquipoV goles}
        for(i=0;i<=dl;i++)
            System.out.println(vPartidos[i].getLocal()+ " " +vPartidos[i].getGolesLocal() + "  VS  " +vPartidos[i].getVisitante()+ " " + vPartidos[i].getGolesVisitante());
        // calculo la cantida de partidos ganados por riBer
        int cantRiver= 0;
        for (i=0;i<=dl;i++)
            if((vPartidos[i].getLocal().equals("river"))||(vPartidos[i].getVisitante().equals("river")))
                if(vPartidos[i].getGanador().equals("river"))
                    cantRiver++;
        System.out.println("la cantidad de partidos que gano river es: "+cantRiver);
        //calculo la cantidad de goles de boca de local
        int cantGolesBoca=0;
        for (i=0;i<=dl;i++)
            if(vPartidos[i].getLocal().equals("boca"))
                cantGolesBoca = cantGolesBoca + vPartidos[i].getGolesLocal();
        System.out.println("la cantidad de goles que hizo boca de local son: "+cantGolesBoca);
    }
}
