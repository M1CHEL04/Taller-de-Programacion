package ParcialViejoTurnoC;
public class Estacion {
    private String direccion;
    private Surtidor [] surtidores;
    private int cantSurtidores;
    
    //creo el constructor;
    public Estacion (String direccion){
        this.setDireccion(direccion);
        this.surtidores= new Surtidor [6];
        this.setCantSurtidores(0);
    }
    
    //creo los getters y setters
    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public int getCantSurtidores() {
        return cantSurtidores;
    }
    private void setCantSurtidores(int cantSurtidores) {
        this.cantSurtidores = cantSurtidores;
    }
    public void incDl(){
        this.cantSurtidores++;
    }
    
    //metodo para ageregar un surtidor
    public void agregarSurtidor (Surtidor s){
        if(this.getCantSurtidores()< 6) {
            this.surtidores[this.getCantSurtidores()]=s;
            this.incDl();
        }
    }
    
    //agrego una venta a un surtidor x
    public void agregarVentaASurtidor (Venta v, int nSurtidor){
        this.surtidores[nSurtidor].agregarVenta(v);
    }
    
    //que surtidor recaudo mas dinero en efectivo
    public int surtidorMayorRecaudoEfectivo (){
        double max=-1;
        int maxSurtidor=-1;
        for (int i = 0; i < this.getCantSurtidores(); i++) {
            if (this.surtidores[i].montoRecaudado()>max){
                max=this.surtidores[i].montoRecaudado();
                maxSurtidor=i;
            }
        }
        return maxSurtidor;
    }
    
    
    //descripcion surtidores
    public String descripcionSurtiores (){
        String aux= " ";
        for (int i = 0; i < this.getCantSurtidores(); i++) {
            aux= aux+ "Surtidor "+i+": Combustible dispensado: "+this.surtidores[i].getCombustibleDispensa()+" precio por litro: "+this.surtidores[i].getPrecioXLitro()+" ventas: "+this.surtidores[i].informeVentas();
        }
        return aux;
    }
    
    //creo el toString
    public String toString (){
        return ("Estacion de Servicio: "+this.getDireccion()+". Cantidad de surtidores: "+this.getCantSurtidores()+this.descripcionSurtiores());  
    }
}
