package ParcialViejoTurnoF;
public abstract class Empleado {
    private String nombre;
    private int dni;
    private int anoIngreso;
    private double sueldoBasico;
    
    //creo el cosntructor
    public Empleado (String nombre, int dni, int anoIngreso, double sueldoBasico){
        this.setAnoIngreso(anoIngreso);
        this.setSueldoBasico(sueldoBasico);
        this.setDni(dni);
        this.setNombre(nombre);
    }
    
    //creo los getters y setters.
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
    public int getAnoIngreso() {
        return anoIngreso;
    }
    public void setAnoIngreso(int anoIngreso) {
        this.anoIngreso = anoIngreso;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }
    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }
    
    //declaro el metodo sueldo a cobrar como abstracto
    public abstract double sueldoACobrar();
    
    //calculo el plus por antiguedad
    public double plusXAntiguedad(){
        double aux=0;
        if((this.getAnoIngreso()+20)<2023){
            aux=(this.getSueldoBasico()*0.10);
        }
        return aux;
    }
    
    //creo el toString
    public String toString (){
        String aux;
        aux=("Nombre: "+this.getNombre()+". DNI: "+this.getDni()+". Sueldo a cobrar: "+ this.sueldoACobrar());
        return aux;
    }
}
