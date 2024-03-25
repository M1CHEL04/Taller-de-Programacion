package ParcialViejo2022;
public class Persona {
    private String nombre;
    private int dni;
    private int edad;
    
    //creo el constructor
    public Persona (String nombre, int dni, int edad){
        this.setDni(dni);
        this.setEdad(edad);
        this.setNombre(nombre);
    }
    
    
    //creo los getters y setters
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getDni() {
        return dni;
    }
    public void setDni(int dni) {
        this.dni = dni;
    }
    public int getEdad() {
        return edad;
    }
    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    //creo el toString
    public String toString(){
        return ("Nombre: "+this.getNombre()+". Edad: "+this.getEdad());
    }
}
