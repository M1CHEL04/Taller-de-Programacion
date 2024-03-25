package P4;
public class VisorFigurasVector {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura [] vector;
    
    //creo el constructor 
    public VisorFigurasVector(){
        vector = new Figura [capacidadMaxima];
        this.guardadas= 0;
    }
    
    //aniado al vector la figura
    public void addFigura (Figura f){
        vector[guardadas]=f;
        guardadas++;
    }
    
    //checkeo si queda espacio
    public boolean quedaEspacio(){
       boolean aux= false;
       if(this.getGuardadas()!=5){
           aux= true;
       }
       return aux;
    }
    
    //mostrar
    public void mostrar(int i){
        System.out.println(this.vector[i].toString());
    }
    
    // retorno la cantidad de elementos guardados
    public int getGuardadas (){
        return guardadas;
    }
}
