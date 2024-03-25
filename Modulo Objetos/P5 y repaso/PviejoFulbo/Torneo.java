package PviejoFulbo;
public class Torneo {
    private String nombre;
    private Goleador [][] matriz;
    private int [] vect;
    private int fechas;
    private int goleadorXFecha;
    
    //constructor
    public Torneo (String nombre, int fechas, int goleadoresXFecha){
        this.setNombre(nombre);
        this.setFechas(fechas);
        this.setGoleadorXFecha(goleadoresXFecha);
        this.matriz= new Goleador [fechas][goleadorXFecha];
        this.vect= new int [this.getFechas()];
        for (int i = 0; i < this.getFechas(); i++) {
            for (int j = 0; j < this.getGoleadorXFecha(); j++) {
                this.matriz[i][j]=null;
            }
        }
        for (int i = 0; i < this.getFechas(); i++) {
            this.vect[i]=0;
        }
    }
    
    //getter y setter
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getFechas() {
        return fechas;
    }
    private void setFechas(int fechas) {
        this.fechas = fechas;
    }
    public int getGoleadorXFecha() {
        return goleadorXFecha;
    }
    private void setGoleadorXFecha(int goleadorXFecha) {
        this.goleadorXFecha = goleadorXFecha;
    }
    
    //agregar goleador a la fecha X
    public void addGoleador (int f, Goleador g){
        this.matriz[(f-1)][(this.vect[f-1])]=g;
        this.vect[(f-1)]++;
    }
    
    //goleador con menos goles en la fecha X
    public Goleador menosGolesFechaX (int f){
        Goleador aux=null;
        int min=1000;
        for (int i = 0; i < this.vect[(f-1)]; i++) {
            if (this.matriz[(f-1)][i].getGoles()<min);{
                min=this.matriz[(f-1)][i].getGoles();
                aux=this.matriz[(f-1)][i];
            }
        }
        return aux;
    }
    
    //goleadores del torneo
    public int goleadoresDelTorneo (){
        int aux=0;
        for (int i = 0; i < this.getFechas(); i++) {
            aux= aux+ this.vect[i];
        }
        return aux;
    }
    
    //toString
    public String toString (){
        String aux= " ";
        for (int i = 0; i < this.getFechas(); i++) {
            aux= (aux+" fecha # "+(i+1)+"| goles "+this.vect[i]+" |");
            for (int j = 0; j < this.vect[i]; j++) {
                aux= (aux + " "+ this.matriz[i][j].toString());
            }
        }
        return("Toneo "+this.getNombre()+ aux);
    }
}
