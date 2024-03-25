package P4;
public class VisorFiguras {
    private int mostradas;
    
    //creo el constructor 
    public VisorFiguras(){
        mostradas=0;
    }
    
    public void mostrar(Figura f){
        System.out.println(f.toString());
        mostradas++;
    }
    
    public int getMostradas (){
        return mostradas;
    }
}
