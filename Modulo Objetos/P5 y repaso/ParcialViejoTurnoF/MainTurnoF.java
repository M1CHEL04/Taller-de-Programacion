package ParcialViejoTurnoF;
public class MainTurnoF {
    public static void main(String[] args) {
        Empresa e1;
        Director d1;
        Encargado en1,en2,en3;
        //creo mi director de empresa
        d1= new Director ("Gustavo",4444,2000,2000,300);
        //creo mi empresa;
        e1= new Empresa ("Maikel","av 60",d1,4);
        //creo los engargadods 
        en1= new Encargado ("Santiago",3333,2000,200,5);
        en2= new Encargado ("Pedro",2222,2002,300,2);
        en3= new Encargado ("Luciano",1111,2022,400,4);
        //asigno los encargados a las diferentes sucursales
        e1.agregarEncargado(en1, 1);
        e1.agregarEncargado(en2, 2);
        e1.agregarEncargado(en3, 4);
        //imprimo los datos de la empresa
        System.out.println(e1.toString());
        
    }
    
}
