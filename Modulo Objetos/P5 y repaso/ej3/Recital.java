package ej3;
public abstract class Recital {
    private String nombreBanda;
    private String [] trackList;
    private int cantTemasTotales; //es mi dimesnion fisica
    private int cantTemasActuales; //es mi dimension logica

    
    //creo el constructor
    public Recital (String nombreBanda, int cantTemasTotales){
        this.setNombreBanda(nombreBanda);
        this.setCantTemasTotales(cantTemasTotales);
        this.trackList= new String [this.getCantTemasTotales()];
        this.setCantTemasActuales(0);
    }
    
    //creo los getters y setters
    public String getNombreBanda() {
        return nombreBanda;
    }
    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }
    public int getCantTemasTotales() {
        return cantTemasTotales;
    }
    public void setCantTemasTotales(int cantTemasTotales) {
        this.cantTemasTotales = cantTemasTotales;
    }
    public int getCantTemasActuales() {
        return cantTemasActuales;
    }
    private void setCantTemasActuales(int cantTemasActuales) {
        this.cantTemasActuales = cantTemasActuales;
    }

    
    public void agregarTema(String tema){
        if((this.getCantTemasActuales()) < (this.getCantTemasTotales())){
            this.trackList[this.getCantTemasActuales()]= tema;
            this.cantTemasActuales++;
        }

    }
    
    public void actuar (){
        for (int i = 0; i < this.getCantTemasActuales(); i++) {
            System.out.println("y ahora tocaremos..."+this.trackList[i]);
        }
    }
    
    //creo un metodo abstracto
    public abstract int calcularCosto();

}
