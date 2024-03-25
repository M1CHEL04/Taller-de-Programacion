package ParcialViejoTurnoF;
public class Director extends Empleado {
    private double montoViaticos;
    
    //creo el contructor
    public Director (String nombre, int dni, int anoIngreso, double sueldoBasico, double montoViatico){
        super(nombre,dni,anoIngreso,sueldoBasico);
        this.setMontoViaticos(montoViatico);
    }
    
    
    //creo los getters y setters
    public double getMontoViaticos() {
        return montoViaticos;
    }
    public void setMontoViaticos(double montoViaticos) {
        this.montoViaticos = montoViaticos;
    }
    
    public double sueldoACobrar (){
        double aux;
        aux=(this.getSueldoBasico()+ this.plusXAntiguedad() + this.getMontoViaticos());
        return aux;
    }
    
    //creo el toString
    public String toString (){
        return super.toString();
    }
    
}
