package PviejoFulbo;
public class Goleador {
    private String nombre;
    private String equipo;
    private int goles;
    
    //constructor
    public Goleador (String nombre, String equipo, int goles){
        this.setEquipo(equipo);
        this.setGoles(goles);
        this.setNombre(nombre);
    }
    //getter y setter
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getEquipo() {
        return equipo;
    }
    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }
    public int getGoles() {
        return goles;
    }
    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    //toString
    public String toString (){
        return ("Nombre: "+this.getNombre()+", Equipo: "+this.getEquipo()+", Cantidad de goles: "+this.getGoles());
    }
}
