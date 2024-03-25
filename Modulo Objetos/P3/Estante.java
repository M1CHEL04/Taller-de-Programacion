package P3;


public class Estante {
    private Libro [] vector = new Libro [20];
    private int dl=0;
    //constructor
    public void Estante (){
    }
    //metodos
    
    public int cantLibros (){
            return dl;
    }
    
    public boolean estaLLeno (){
        return(dl==20);
    }
    
    public void  setAddLibro(Libro unLibro) {
        vector[dl]= unLibro;
        dl++;
    }
    
    public Libro estaLibro (String unTitulo){
        int i=0;
        boolean check = false;
        Libro aux = null;
        while((i<dl)&&(!check)){
            if(vector[i].getTitulo().equals(unTitulo)){
                check= true;
                aux= vector[i];
            }    
            else
                i++;
        }
        return aux;
    }
}
