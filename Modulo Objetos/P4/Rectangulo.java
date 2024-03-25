package P4;
public class Rectangulo extends Figura{
    private double base;
    private double altura;
    
    //creo el constructor
    public Rectangulo(double base, double altura, String unColorR, String unColorL){
        super(unColorR,unColorL);
        setBase(base);
        setAltura(altura);
    } 

    //creo los getters y setters
    public double getBase() {
        return base;
    }
    public void setBase(double unaBase) {
        base = unaBase;
    }
    public double getAltura() {
        return altura;
    }
    public void setAltura(double unaAltura) {
        altura = unaAltura;
    }

    //calculo el area
    public double calcularArea() {
        return (getBase()*getAltura()); 
    }

    //calculo el perimetro
    public double calcularPerimetro() {
        return (2*getBase()+2*getAltura());
    }
    
    //creo el toString
    public String toString(){
       String aux = super.toString() + 
                    " Base: " + getBase() +
                    " Altura: " + getAltura();
       return aux;
    }
}
