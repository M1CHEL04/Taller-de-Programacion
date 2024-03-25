package ParcialViejoTurnoF;
public class Encargado extends Empleado{
    private int cantACargo;
    
    //creo el constructor
    public Encargado (String nombre,int dni, int anoIngreso, double sueldoBasico, int cantACargo){
        super(nombre,dni,anoIngreso,sueldoBasico);
        this.setCantACargo(cantACargo);
    }
    
    // creo los getters y setters
    public int getCantACargo() {
        return cantACargo;
    }
    public void setCantACargo(int cantACargo) {
        this.cantACargo = cantACargo;
    }
    
    //calculo el sueldo a cobrar para el encargado
    public double sueldoACobrar(){
        double aux;
        aux= (this.getSueldoBasico()+this.plusXAntiguedad()+(1000*this.getCantACargo()));
        return aux;
    }
    
    //creo el toString
    public String toString (){
        return super.toString();
    }
}
