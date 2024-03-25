package ej3;
public class Gira extends Recital {
    private String nombreGira;
    private Fecha [] fechas;
    private int cantFechas; //dl del vector
    private int cantFechasTotales; //df del vector
    private int fechaActual;
    
    //creo el constructor
    public Gira (String nombreBanda, int cantTemas, String nombreGira, int cantFechasTotales){
        super(nombreBanda,cantTemas);
        this.setNombreBanda(nombreBanda);
        this.setCantFechasTotales(cantFechasTotales); //pongo la dimension fisica del vector
        this.setCantFechas(0); //pongo mi dimension logica en 0
        this.setFechaActual(0); //pongo mi fecha actual en 0;
        this.fechas=new Fecha [this.getCantFechasTotales()];
    }
    
    //creo los getters y setters
    public String getNombreGira() {
        return nombreGira;
    }
    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }
    public int getCantFechas() {
        return cantFechas;
    }
    public void setCantFechas(int cantFechas) {
        this.cantFechas = cantFechas;
    }
    public int getCantFechasTotales() {
        return cantFechasTotales;
    }
    public void setCantFechasTotales(int cantFechasTotales) {
        this.cantFechasTotales = cantFechasTotales;
    }
    public int getFechaActual() {
        return fechaActual;
    }
    private void setFechaActual(int fechaActual) {
        this.fechaActual = fechaActual;
    }
    
    //creo el metodo para agregar una fecha
    public void agregarFecha (Fecha f){
        this.fechas[this.getCantFechas()]= f;
        this.cantFechas++;
    }
    
    //creo el metodo para representar
    public void actuar (){
        if(this.getCantFechas()<= this.getCantFechasTotales()){
            System.out.println("Buenas noches "+this.fechas[this.getFechaActual()].getCiudad());
            super.actuar();
            this.fechaActual++;
        }
        else{
            System.out.println("Ya terminaron todas las fechas");
        }
    }
    
    //calculo el costo de la gira
    public int calcularCosto(){
        int aux;
        aux= this.getCantFechas()*30000;
        return aux;
    }
}
