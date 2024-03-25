package P4;
public class Triangulo extends Figura{
    private double lado1,lado2,lado3;
    
    //creo el constructor
    public Triangulo (double lado1,double lado2, double lado3, String unCr, String unCl){
        super(unCr,unCl);
        this.setLado1(lado1);
        this.setLado2(lado2);
        this.setLado3(lado3);
    }
    
    //creo los getters y setters
    public double getLado1() {
        return lado1;
    }
    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }
    public double getLado2() {
        return lado2;
    }
    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }
    public double getLado3() {
        return lado3;
    }
    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    //creo el toString
    public String toString (){
        return super.toString();
    }
    
    //calculo el perimetro
    public double calcularPerimetro (){
        return (this.getLado1()+this.getLado2()+this.getLado3());
    }
    
    //calculo el area
    public double calcularArea (){
        double aux,s;
        s=(this.calcularPerimetro()/2);
        aux=(Math.sqrt(s*(s-this.getLado1())*(s-this.getLado2())*(s-this.getLado3())));
        return aux;
    }
}
