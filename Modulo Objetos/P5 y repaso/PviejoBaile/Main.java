package PviejoBaile;
public class Main {
    public static void main(String[] args) {
        Participante p1,p2,p3,p4,p5,p6;
        Pareja par1,par2,par3;
        Concurso c1;
        p1= new Participante("Juan",44,20);
        p2= new Participante("Silvia",32,30);
        p3= new Participante("Pedro",312,50);
        p4= new Participante ("Marta",54,20);
        p5= new Participante ("aaa",43,0);
        p6= new Participante ("dsa",321,0);
        par1= new Pareja (p1,p2,"Salsa");
        par2= new Pareja (p3,p4,"Tango");
        par3= new Pareja (p5,p6,"asdsa");
        c1= new Concurso (3);
        c1.addPareja(par1);
        c1.addPareja(par2);
        System.out.println(c1.descrip(c1.maxDif(par3)));
    }
}
