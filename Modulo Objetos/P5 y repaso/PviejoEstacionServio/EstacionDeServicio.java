package PviejoEstacionServio;
public class EstacionDeServicio {
    private String direccion;
    private Surtidor [] vectSurtidores;
    private int DL;
    
    //creo el constructor
    public EstacionDeServicio (String direccion){
        this.setDireccion(direccion);
        this.setDL(0);
        this.vectSurtidores= new Surtidor [6];
        for (int i = 0; i < 6; i++) {
            this.vectSurtidores[i]=null;
        }
    }
    //getters y setters
    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public int getDL() {
        return DL;
    }
    private void setDL(int DL) {
        this.DL = DL;
    }
    private void incDL (){
        this.DL++;
    }
    
    //agregar surtidor
    public void addSurtidor (Surtidor s){
        if (this.getDL()<6){
            this.vectSurtidores[this.getDL()]=s;
            this.incDL();
        }
    }
    
    //crear venta en surtidor x
    public void addVenta (int nSurtidor, int dni, int cantL, String medioDePago, Venta v){
        Venta aux=v;
        aux.setDni(dni);
        aux.setMedioDePago(medioDePago);
        aux.setCantL(cantL);
        aux.setMonto((cantL*this.vectSurtidores[(nSurtidor-1)].getPrecioXlitro()));
        this.vectSurtidores[(nSurtidor-1)].addventa(aux);
    }
    
    //max ventas en efectivo surtidor x
    public int surtidorMaxEfectivo(){
        double max=-1;
        int sMax=0;
        for (int i = 0; i < 6; i++) {
            if(this.vectSurtidores[i] != null){
                if (this.vectSurtidores[i].totalVentasEfect()>max){
                    max= this.vectSurtidores[i].totalVentasEfect();
                    sMax=(i+1);
                }
            }
        }
        return sMax;
    }
    
    public String toString (){
        String aux= " ";
        for (int i = 0; i < 6; i++) {
            aux= (aux + "Surtidor "+(i=1)+": ");
            if (this.vectSurtidores[i] == null)
                aux= aux +" No existe el surtidor "+(i+1);
            else
                aux= aux+" "+this.vectSurtidores[i].toString();
        }
        return aux;
    }
}
