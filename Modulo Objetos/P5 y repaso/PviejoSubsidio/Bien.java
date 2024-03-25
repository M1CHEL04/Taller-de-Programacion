package PviejoSubsidio;
public class Bien {
    private String desc;
    private int cant;
    private double costoXunidad;
    
    //creo constructor
    public Bien (String desc, int cant, double costoXunidad){
        this.setCant(cant);
        this.setCostoXunidad(costoXunidad);
        this.setDesc(desc);
    }
    
    //creo getter y setter
    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
    public int getCant() {
        return cant;
    }
    public void setCant(int cant) {
        this.cant = cant;
    }
    public double getCostoXunidad() {
        return costoXunidad;
    }
    public void setCostoXunidad(double costoXunidad) {
        this.costoXunidad = costoXunidad;
    }
    
   public double costoXBien (){
       return(this.getCant()*this.getCostoXunidad());
   }
   
   //string
   public String toString (){
       return ("Descripcion: "+this.getDesc());
   }
}
