package PviejoEmpresa;
public abstract class Trabajador {
    private String nombre;
    private int dni;
    private int aIngreso;
    private double basico;
    
    //constructor
    public Trabajador (String nombre, int dni, int aIngreso, double basico){
        this.setBasico(basico);
        this.setDni(dni);
        this.setNombre(nombre);
        this.setaIngreso(aIngreso);
    }
    
    //getter y setter
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
    public int getaIngreso() {
        return aIngreso;
    }
    public void setaIngreso(int aIngreso) {
        this.aIngreso = aIngreso;
    }
    public double getBasico() {
        return basico;
    }
    public void setBasico(double basico) {
        this.basico = basico;
    }
    
    //calcular sueldo
    public abstract double sueldoFinal ();
    
    //representacion
    public String toString (){
        return ("Nombre: "+this.getNombre()+", DNI: "+this.getDni());
    }
}
