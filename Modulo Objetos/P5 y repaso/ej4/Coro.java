package ej4;
public abstract class Coro {
    private String nombreCoro;
    private Director director;
    private int dl;
    private int df;
    
    //creo el constructor
    public Coro(String nombreCoro, Director director,int df){
        this.setNombreCoro(nombreCoro);
        this.setDirector(director);
        this.setDf(df);
        this.setDl(0);
    }
    
    //creo los getters y setters
    public String getNombreCoro() {
        return nombreCoro;
    }
    public void setNombreCoro(String nombreCoro) {
        this.nombreCoro = nombreCoro;
    }
    public Director getDirector() {
        return director;
    }
    public void setDirector(Director director) {
        this.director = director;
    }
    public int getDl() {
        return dl;
    }
    public void setDl(int dl) {
        this.dl = dl;
    }
    public int getDf() {
        return df;
    }
    public void setDf(int df) {
        this.df = df;
    }
    
    //incrementar dl
    public void incDl(){
        this.dl++;
    }
    
    
    //declaro el agregar corista como abstracto
    public abstract void agregarCorista (Corista c);
    
    //averiguo si el coro esta lleno o vacio
    public boolean estaLLeno (){
        return this.getDl()==this.getDf();
    }
    
    //metodo para ver si el coro esta bien formado
    public abstract boolean estaBienFormado ();
    
    //declaro metodo abstracto para la descripcion de los coristas
    public abstract String descripcionCoristas();
    
    //creo el toString
    public String toString(){
        return ("Nombre del coro: "+this.getNombreCoro()+" y su director es: "+this.getDirector().toString());
    }
}
