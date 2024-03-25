package PviejoEmpresa;
public class Encargado extends Trabajador {
    private int empleadosCargo;
    
    //constructor
    public Encargado (String nombre, int dni, int aIngreso, double basico, int empleadosCargo){
        super(nombre,dni,aIngreso,basico);
        this.setEmpleadosCargo(empleadosCargo);
    }
    //getter y setter
    public int getEmpleadosCargo() {
        return empleadosCargo;
    }
    public void setEmpleadosCargo(int empleadosCargo) {
        this.empleadosCargo = empleadosCargo;
    }
    
    //sueldo a cobrar
    public double sueldoFinal (){
        double aux= (this.getBasico()+this.getEmpleadosCargo()*1000);
        if ((2024-this.getaIngreso())>=20){
            aux= (aux +this.getBasico()*0.1); 
        }
        return aux;
    }
    
    //toString
    public String toString (){
        return (super.toString()+", Sueldo a cobrar: "+this.sueldoFinal());
    }
}
