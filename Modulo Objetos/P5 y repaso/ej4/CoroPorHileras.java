package ej4;
public class CoroPorHileras extends Coro {
    private Corista [][] coristasM;
    private int filas;
    private int columnas;
    
    //creo el constructor
    public CoroPorHileras(String nombreCoro,Director director,int filas, int columnas){
        super(nombreCoro,director,(filas*columnas));
        this.setColumnas(columnas);
        this.setFilas(filas);
        this.coristasM= new Corista [this.getFilas()][this.getColumnas()];
    }
 
    //creo los getters y setters
    public int getFilas() {
        return filas;
    }
    public void setFilas(int filas) {
        this.filas = filas;
    }
    public int getColumnas() {
        return columnas;
    }
    public void setColumnas(int columnas) {
        this.columnas = columnas;
    }
    
    //agrego corista
    public void agregarCorista(Corista c){
        if(this.getDl() < this.getDf()){
            this.coristasM[this.getDl() / this.getColumnas()][this.getDl() % this.getColumnas()] = c;
            this.incDl();
        }
    }
    
    //checkeo si esta en orden o no el coro
    public boolean estaBienFormado (){
        return true;
    }
    
    //retorno la descripcion de los coristas
    public String descripcionCoristas (){
        int i=0;
        String aux=" ";
        while (i<this.getDl()){
            aux= aux+" "+ this.coristasM[i/this.getColumnas()][i%this.getColumnas()].toString()+" ";
            i++;
        }
        return aux;
    }
    
    //creo el toString
    public String toString (){
        return (super.toString()+" y los coristas son "+this.descripcionCoristas());
    }
}
