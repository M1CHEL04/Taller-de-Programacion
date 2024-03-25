package ej4;
public class Director {
    private String nombreDirector;
    private int dniDirector;
    private int edadDirector;
    private int antiguedadDirector;
    
    
    //creo el constructor
    public Director (String nombreDirector, int dniDirector, int edadDirector, int AntiguedadDirector){
        this.setNombreDirector(nombreDirector);
        this.setEdadDirector(edadDirector);
        this.setDniDirector(dniDirector);
        this.setAntiguedadDirector(AntiguedadDirector);
    }
    
    //creo los getters y setters
    public String getNombreDirector() {
        return nombreDirector;
    }
    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }
    public int getDniDirector() {
        return dniDirector;
    }
    public void setDniDirector(int dniDirector) {
        this.dniDirector = dniDirector;
    }
    public int getEdadDirector() {
        return edadDirector;
    }
    public void setEdadDirector(int edadDirector) {
        this.edadDirector = edadDirector;
    }
    public int getAntiguedadDirector() {
        return antiguedadDirector;
    }
    public void setAntiguedadDirector(int antiguedadDirector) {
        this.antiguedadDirector = antiguedadDirector;
    }
    
    //creo el toString 
    public String toString (){
        return ("el nombre del director es "+this.getNombreDirector()+" de edad "+this.getEdadDirector()+" anios y con "+this.getAntiguedadDirector()+" anios de antiguiedad.");
    }
}
