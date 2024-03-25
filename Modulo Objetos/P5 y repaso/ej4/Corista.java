package ej4;
public class Corista {
    private String nombreCorista;
    private int dniCorista;
    private int edadCorista;
    private int tono;
    
    //creo el constructor
    public Corista (String nombreCorista, int dniCorista, int edadCorista, int tono){
        this.setDniCorista(dniCorista);
        this.setEdadCorista(edadCorista);
        this.setNombreCorista(nombreCorista);
        this.setTono(tono);
    }
    
    //creo los getters y setters
    public String getNombreCorista() {
        return nombreCorista;
    }
    public void setNombreCorista(String nombreCorista) {
        this.nombreCorista = nombreCorista;
    }
    public int getDniCorista() {
        return dniCorista;
    }
    public void setDniCorista(int dniCorista) {
        this.dniCorista = dniCorista;
    }
    public int getEdadCorista() {
        return edadCorista;
    }
    public void setEdadCorista(int edadCorista) {
        this.edadCorista = edadCorista;
    }
    public int getTono() {
        return tono;
    }
    public void setTono(int tono) {
        this.tono = tono;
    }
    
    //creo el toString
    public String toString (){
        return ("Corista: "+this.getNombreCorista()+" edad: "+this.getEdadCorista()+" tono: "+this.getTono());
    }
}
