package ParcialViejoTurnoC;
public class Surtidor {
    private int combustibleDispensa;
    private double precioXLitro;
    private Venta [] ventas;
    private int cantVentasMax;
    private int cantVentas;
    
    //creo el cosntructor;
    public Surtidor (int combustibleDispensa, double precioXLitro, int cantVentasMax){
        this.setCantVentasMax(cantVentasMax);
        this.setCombustibleDispensa(combustibleDispensa);
        this.setPrecioXLitro(precioXLitro);
        this.ventas=new Venta [this.getCantVentasMax()];
        this.setCantVentas(0);
    }
    
    //creo los getters y setters
    public int getCombustibleDispensa() {
        return combustibleDispensa;
    }
    public void setCombustibleDispensa(int combustibleDispensa) {
        this.combustibleDispensa = combustibleDispensa;
    }
    public double getPrecioXLitro() {
        return precioXLitro;
    }
    public void setPrecioXLitro(double precioXLitro) {
        this.precioXLitro = precioXLitro;
    }
    public int getCantVentasMax() {
        return cantVentasMax;
    }
    public void setCantVentasMax(int cantVentasMax) {
        this.cantVentasMax = cantVentasMax;
    }
    public int getCantVentas() {
        return cantVentas;
    }
    private void setCantVentas(int cantVentas) {
        this.cantVentas = cantVentas;
    }
    private void incCantVentas (){
        this.cantVentas++;
    }
    
    //agrego una venta al surtidor x
    public void agregarVenta (Venta v){
        if (this.getCantVentas()<this.getCantVentasMax()){
            this.ventas[this.getCantVentas()]=v;
            this.incCantVentas();
        }
    }
    
    //calcular monto recaudado
    public double montoRecaudado (){
        double aux= 0;
        for (int i = 0; i < this.getCantVentas(); i++) {
            if (this.ventas[i].getMedioDePago() == 1)
                aux= aux+ this.ventas[i].getMontoAbonado();
        }
        return aux;
    }
    //creo el toString;
    public String informeVentas(){
        String aux= " ";
        for (int i = 0; i < this.getCantVentas(); i++) {
            aux=aux+this.ventas[i].toString();
        }
        return aux;
    }
}
