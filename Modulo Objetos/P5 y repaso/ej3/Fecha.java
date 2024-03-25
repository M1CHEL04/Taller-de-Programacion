package ej3;
public class Fecha {
    private String ciudad;
    private int dia;
    
    //creo el contructor
    public Fecha (String ciudad, int dia){
        this.setCiudad(ciudad);
        this.setDia(dia);
    }
    
    //creo los getters y setters
    public String getCiudad() {
        return ciudad;
    }
    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    public int getDia() {
        return dia;
    }
    public void setDia(int dia) {
        this.dia = dia;
    }
    
}
