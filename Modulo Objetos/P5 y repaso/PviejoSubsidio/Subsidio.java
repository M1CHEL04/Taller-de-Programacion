package PviejoSubsidio;
public abstract class Subsidio {
    private String nombreInvest;
    private String nombreTrabajo;
    private String fechaSolicitud;
    
    //creo el constructor
    public Subsidio (String nombreI, String nombreT, String fecha){
        this.setFechaSolicitud(fecha);
        this.setNombreInvest(nombreI);
        this.setNombreTrabajo(nombreT);
    }
    
    //creo los getters y setters
    public String getNombreInvest() {
        return nombreInvest;
    }
    public void setNombreInvest(String nombreInvest) {
        this.nombreInvest = nombreInvest;
    }
    public String getNombreTrabajo() {
        return nombreTrabajo;
    }
    public void setNombreTrabajo(String nombreTrabajo) {
        this.nombreTrabajo = nombreTrabajo;
    }
    public String getFechaSolicitud() {
        return fechaSolicitud;
    }
    public void setFechaSolicitud(String fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }
    
    //toString
    public String toString (){
        return ("Nombre del Investigador: "+this.getNombreInvest()+", Plan de trabajo: "+this.getNombreTrabajo()+", Fecha de solicitud: "+this.getFechaSolicitud());
    }
    
    public abstract double montoTotal();
    
}
