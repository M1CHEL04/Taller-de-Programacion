package PviejoEmpresa;
public class Director extends Trabajador {
    private double viaticos;
    
    
    //constructor
    public Director (String nombre, int dni, int aIngreso, double basico, double viaticos){
        super(nombre,dni,aIngreso,basico);
        this.setViaticos(viaticos);
    }
    //getters y setters
    public double getViaticos() {
        return viaticos;
    }
    public void setViaticos(double viaticos) {
        this.viaticos = viaticos;
    }
    
    //sueldo a cobrar
    public double sueldoFinal (){
        double aux= (this.getBasico()+ this.getViaticos());
        if ((2024-this.getaIngreso())>= 20){
            aux= aux + (this.getBasico()*0.1);
        }
        return aux;
    }
    
    //toString
    public String toString (){
        return(super.toString()+", Sueldo a cobrar: "+this.sueldoFinal());
    }
}
