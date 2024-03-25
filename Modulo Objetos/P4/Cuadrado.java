package P4;
public class Cuadrado extends Figura{
    private double lado;
    
    //creo el constructor
    public Cuadrado(double unLado, String unColorR, String unColorL){
        super(unColorR,unColorL);
        setLado(unLado);
    } 
    
   //creo los getters y setters
    public double getLado(){
        return lado;       
    }
    public void setLado(double unLado){
        lado=unLado;
    }
    
    //calculo el area
    public double calcularArea(){
       return (getLado()* getLado());
    }
    
    //calculo el perimetro;
    public double calcularPerimetro(){
       return (getLado()*4);
    }
    
    // creo el toString
    public String toString(){
       String aux = super.toString() + 
                    " Lado: " + getLado();
       return aux;
    }
}
