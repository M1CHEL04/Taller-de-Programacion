package ej1;

public class Ej1 {
    public static void main(String[] args) {
        //isntacio el proyecto
        Proyecto p1= new Proyecto ("La septima",7,"Jorge Almiron");
        //instacio los 3 investigadores
        Investigador i1= new Investigador ("Marcos Rojo",2,"Central");
        Investigador i2= new Investigador ("Edinson Cavani",9,"Delantero");
        Investigador i3= new Investigador ("Dario Benedeto",9,"Delantero");
        //agrego los 3 investigadores al proyecto
        p1.agregarInvestigador(i1);
        p1.agregarInvestigador(i2);
        p1.agregarInvestigador(i3);
        //instacio los 4 subsidios
        Subsidio s1i1= new Subsidio(10," ");
        Subsidio s2i1= new Subsidio(20," ");
        Subsidio s1i2= new Subsidio (300," ");
        Subsidio s2i2= new Subsidio (477," ");
        //agrego los 4 subsidios
        i1.agregarSubsidio(s1i1);
        i1.agregarSubsidio(s2i1);
        i2.agregarSubsidio(s1i2);
        i2.agregarSubsidio(s2i2);
        //otorgo todos los subsidios solicitados por un investigador
        p1.otorgarTodos("Edinson Cavani");
        //imprimo en pantalla
        System.out.println(p1.toString());
    }
}
