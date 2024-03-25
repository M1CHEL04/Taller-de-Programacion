package ParcialViejoTema2;
public class Estudiante {
    private String nombre;
    private String apellido;
    private int dni;
    
    //creo el contructor
    public Estudiante (String nombre, String apellido, int dni){
        this.setApellido(apellido);
        this.setDni(dni);
        this.setNombre(nombre);
    }
    
    
    //creo los getters y setters
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellido() {
        return apellido;
    }
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    public int getDni() {
        return dni;
    }
    public void setDni(int dni) {
        this.dni = dni;
    }
    
}
