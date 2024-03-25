package ej4;
public class ppEj4 {

    public static void main(String[] args) {
        CoroSemicircular cS;
        CoroPorHileras cH;
        Director dCS;
        Director dCH;
        Corista c1,c2,c3,c4,c5,c6;
        //creo los directores
        dCS= new Director ("Juan",33,46,7);
        dCH= new Director ("Pedro",89,76,50);
        //creo los coros 
        cS= new CoroSemicircular ("Los pijas",dCS,2);
        cH= new CoroPorHileras("BOCAAAAA",dCH,3,3);
        //creo coristas 
        c1=new Corista ("pepe",12,33,1);
        c2=new Corista ("rama",32,11,5);
        c3=new Corista ("eusebio",89,9,2);
        c4=new Corista ("carlos",41,45,3);
        c5=new Corista ("joaco",65,10,4);
        c6=new Corista("Santiago",78,20,6);
        //agrego coristas al coro semicircular
        cS.agregarCorista(c2);
        cS.agregarCorista(c1);
        //agrego coristas al coro por hileras
        cH.agregarCorista(c3);
        cH.agregarCorista(c4);
        cH.agregarCorista(c5);
        cH.agregarCorista(c6);
        //imprimo el coro semicircular
        System.out.println("Coro semicircular");
        if(cS.estaBienFormado()){
            System.out.println("El coro esta bien formado. "+ cS.toString());
        }
        else{
            System.out.println("El coro no esta bien formado. "+cS.toString());
        }
        //imprimo el coro por hileras
        System.out.println("Coro por hileras");
        if(cH.estaBienFormado()){
            System.out.println("El coro esta bien formado. "+cH.toString());
        }
        else{
            System.out.println("El coro no esta bien formado. "+cH.toString());
        }
    }
    
}
