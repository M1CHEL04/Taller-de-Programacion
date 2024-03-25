package P3;
import PaqueteLectura.GeneradorAleatorio;
public class Habitacion {
    private double precio;
    private boolean estaOcupada;
    private Cliente cliente;
    
    // creo el constructor y le doy un precio
    public Habitacion(){
        GeneradorAleatorio.iniciar();
        precio= GeneradorAleatorio.generarDouble(6000)+2000;
    }
    
    //creo los getters y setters
    public double getPrecio() {
        return precio;
    }
    public void setPrecio(double precio) {
        this.precio = precio;
    }
    public boolean isEstaOcupada() {
        return estaOcupada;
    }
    public void setEstaOcupada(boolean estado) {
       estaOcupada = estado;
    }
    public Cliente getCliente() {
        return cliente;
    }
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    //representacion del estado de la habitacion
    public String toString(){
        String aux;
        if (this.isEstaOcupada()){
            aux= ("El precio de la habitacion es "+this.getPrecio()+ " y esta ocupada por el cliente"+ this.getCliente().toString());
        }
        else{
            aux=("El precio de la habitacion es "+ this.getPrecio()+" y esta desocupada");
        }
        return aux;
    }
}
