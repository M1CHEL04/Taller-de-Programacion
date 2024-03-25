package P3;
public class Hotel {
    private Habitacion [] vector;
    private int cantHabitaciones; 
    
    //creo el constructor;
    public Hotel (int cantHabitaciones){
        this.cantHabitaciones=cantHabitaciones;
        vector =new Habitacion [this.cantHabitaciones];
        for (int i = 0; i < cantHabitaciones ; i++) {
            vector[i]= new Habitacion ();
            vector[i].setEstaOcupada(true);
        }
    }
    
    //creo un getter
    private int getCantHabitaciones(){
        return cantHabitaciones;
    }
    
    //creo ingresar al hotel
    public void ingresarCliente (Cliente c, int cuarto){
        vector[(cuarto-1)].setCliente(c);
        vector[(cuarto-1)].setEstaOcupada(true);
    }
    
    //aumento de precio de la habitacion
    public void aumentoPrecio (double unPrecio){
        for (int i = 0; i < this.getCantHabitaciones(); i++) {
            vector[i].setPrecio((vector[i].getPrecio())+unPrecio);
        }
    }
    
    //representacion del estado del hotel
    public String toString(){
        String aux="";
        for (int i = 0; i < this.getCantHabitaciones(); i++) {
            aux= (aux + vector[i].toString()+ "\n"); 
        }
        return aux;
    }
}
