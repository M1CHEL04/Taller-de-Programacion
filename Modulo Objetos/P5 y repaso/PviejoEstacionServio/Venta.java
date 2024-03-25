package PviejoEstacionServio;
public class Venta {
    private int dni;
    private int cantL;
    private double monto;
    private String medioDePago;
    
    //constructor
    public Venta (int dni, int cantL, double monto, String medioDePago){
        this.setDni(dni);
        this.setCantL(cantL);
        this.setMonto(monto);
        this.setMedioDePago(medioDePago);
    }
    
    //getter y setter
    public int getDni() {
        return dni;
    }
    public void setDni(int dni) {
        this.dni = dni;
    }
    public int getCantL() {
        return cantL;
    }
    public void setCantL(int cantL) {
        this.cantL = cantL;
    }
    public double getMonto() {
        return monto;
    }
    public void setMonto(double monto) {
        this.monto = monto;
    }
    public String getMedioDePago() {
        return medioDePago;
    }
    public void setMedioDePago(String medioDePago) {
        this.medioDePago = medioDePago;
    }
    
    //string
    public String toString (){
        return("Dni del cliente: "+this.getDni()+", monto abonado: "+this.getMonto());
    }
}
