package Estacionamiento;
public class Auto {
    private String nombreDuenio;
    private String patente;
    
    //creo el constructor;
    public Auto (String nombreDuenio,String patente){
        this.setNombreDuenio(nombreDuenio);
        this.setPatente(patente);
    }
    
    //creo los getters y setters
    public String getNombreDuenio() {
        return nombreDuenio;
    }
    public void setNombreDuenio(String nombreDuenio) {
        this.nombreDuenio = nombreDuenio;
    }
    public String getPatente() {
        return patente;
    }
    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    //toString
    public String toStrig (){
        return ("Duenio: "+this.getNombreDuenio()+" Patente: "+this.getPatente());
    }
}
