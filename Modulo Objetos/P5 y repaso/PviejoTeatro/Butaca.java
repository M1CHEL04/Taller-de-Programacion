package PviejoTeatro;
public class Butaca {
    private String desc;
    private double precio;
    private boolean estado;
    
    //constructor
    public Butaca (String desc, double precio, boolean estado){
        this.setDesc(desc);
        this.setEstado(estado);
        this.setPrecio(precio);
    }
    
    //getter y setter
    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
    public double getPrecio() {
        return precio;
    }
    public void setPrecio(double precio) {
        this.precio = precio;
    }
    public boolean isEstado() {
        return estado;
    }
    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    
    
    //toString
    public String toString (){
        return ("Descripcion: "+this.getDesc()+", Precio: "+this.getPrecio()+", Estado: "+this.isEstado());
    }
}
