package P4;
public class Circulo extends Figura {
    private double radio;
    
    //creo el cosntructor
    public Circulo (double radio, String unCr,String unCl){
        super(unCr,unCl);
        this.setRadio(radio);
    }
    
    //creo los getters y setters
    public double getRadio() {
        return radio;
    }
    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    //creo el toString
    public String toString (){
        return super.toString();
    }
    
    //calculo el perimetro
    public double calcularPerimetro (){
        return(this.getRadio()*2*Math.PI);
    }
    
    //calculo el area
    public double calcularArea(){
        return(this.getRadio()*this.getRadio()*Math.PI);
    }
    
}
