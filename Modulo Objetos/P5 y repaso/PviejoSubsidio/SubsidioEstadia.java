package PviejoSubsidio;
public class SubsidioEstadia extends Subsidio {
    private String destino;
    private double costoP;
    private int cantDias;
    private double costoXdia;
    
    //creo el cosntructor
    public SubsidioEstadia (String nombreI, String nombreT, String fecha, String destino, double pasajes, int cantD, double costoXdia){
        super(nombreI,nombreT,fecha);
        this.setCantDias(cantD);
        this.setCostoP(pasajes);
        this.setCostoXdia(costoXdia);
        this.setDestino(destino);
    }
    
    //creo los getters y setters
    public String getDestino() {
        return destino;
    }
    public void setDestino(String destino) {
        this.destino = destino;
    }
    public double getCostoP() {
        return costoP;
    }
    public void setCostoP(double costoP) {
        this.costoP = costoP;
    }
    public int getCantDias() {
        return cantDias;
    }
    public void setCantDias(int cantDias) {
        this.cantDias = cantDias;
    }
    public double getCostoXdia() {
        return costoXdia;
    }
    public void setCostoXdia(double costoXdia) {
        this.costoXdia = costoXdia;
    }
    
    public double montoTotal (){
        return (this.getCostoP()+(this.getCantDias()*this.getCostoXdia()));
    }
    
    //toString
    public String toString (){
        return(super.toString()+". Monto total: "+this.montoTotal()+", Lugar de destino:  "+this.getDestino()+", Dias de estadia: "+this.getCantDias());
    }
}
