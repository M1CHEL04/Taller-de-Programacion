package P4;
public class Trabajador extends Persona {
    private String oficio;
    
    //creo el contructor;
    public Trabajador(String nombre, int edad, int dni, String oficio){
        super(nombre,dni,edad);
        this.setOficio(oficio);
    }
    
    // creo los getters y setters
    public String getOficio() {
        return this.oficio;
    }

    public void setOficio(String oficio) {
        this.oficio = oficio;
    }
    
    // Creo el toString
    public String toString (){
        return (super.toString()+" Soy "+this.getOficio()+".");
    }
}
