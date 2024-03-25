package ej4;
public class CoroSemicircular extends Coro {
    private Corista [] coristas;
    
    //creo el construcor
    public CoroSemicircular(String nombreCoro, Director director,int df){
        super(nombreCoro,director,df);
        this.coristas=new Corista[this.getDf()];
    }
 
    //creo el metodo para agregar un corista
    public void agregarCorista (Corista c){
        if(this.getDl()<this.getDf()) {
            this.coristas[this.getDl()]= c;
            this.incDl();
        }
    }
    
    //metodo para ver si esta bien ordenado o no;
    public boolean estaBienFormado (){
        int i= 1;
        int ant= this.coristas[0].getTono();
        boolean aux= true;
        while((aux)&&(i<this.getDf())){
            if(ant<this.coristas[i].getTono()) {
                aux= false;
            }
            else{
                ant= this.coristas[i].getTono();
                i++;
            }
        }
        return aux;
    }
    
    //retorno la descripcion de los coristas
    public String descripcionCoristas (){
        String aux = " ";
        for (int i = 0; i < this.getDl(); i++) {
            aux= aux+ " " +this.coristas[i].toString()+" ";
        }
        return aux;
    }
    
    //creo el toString
    public String toString (){
        return (super.toString()+" y los coristas son: "+this.descripcionCoristas());
    }
}
