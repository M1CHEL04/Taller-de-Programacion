package ParcialViejoTurnoC;
public class Venta {
    private int dni;
    private int cantLitrosCargados;
    private double montoAbonado;
    private int medioDePago;
    
    //creo el constructor
    public Venta (int dni, int cantLitrosCargados, double montoAbonado, int medioDePago){
        this.setCantLitrosCargados(cantLitrosCargados);
        this.setDni(dni);
        this.setMedioDePago(medioDePago);
        this.setMontoAbonado(montoAbonado);
    }
    
    //creo los getters y setters
    public int getDni() {
        return dni;
    }
    public void setDni(int dni) {
        this.dni = dni;
    }
    public int getCantLitrosCargados() {
        return cantLitrosCargados;
    }
    public void setCantLitrosCargados(int cantLitrosCargados) {
        this.cantLitrosCargados = cantLitrosCargados;
    }
    public double getMontoAbonado() {
        return montoAbonado;
    }
    public void setMontoAbonado(double montoAbonado) {
        this.montoAbonado = montoAbonado;
    }
    public int getMedioDePago() {
        return medioDePago;
    }
    public void setMedioDePago(int medioDePago) {
        this.medioDePago = medioDePago;
    }
    
    //creo el toString
    public String toString (){
        return ("["+this.getDni()+", "+this.getCantLitrosCargados()+", "+this.getMontoAbonado()+"]");
    }
}
