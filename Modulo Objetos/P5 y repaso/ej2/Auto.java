package ej2;
public class Auto {
    private String nombreDueno;
    private String patente;
    
    //creo el constructor
    public Auto(String nombreDueno, String patente){
        this.setNombreDueno(nombreDueno);
        this.setPatente(patente);
    }
    
    //creo los getters y setters
    public String getNombreDueno() {
        return nombreDueno;
    }
    public void setNombreDueno(String nombreDueno) {
        this.nombreDueno = nombreDueno;
    }
    public String getPatente() {
        return patente;
    }
    public void setPatente(String patente) {
        this.patente = patente;
    }
    //creo el toString 
    public String toString(){
        return ("el auto con patente "+this.getPatente()+" su dueno es "+this.getNombreDueno());
    }
    
}
