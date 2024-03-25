package P3;
public class Circulo {
    private double radio;
    private String cRelleno;
    private String cLinea;
    
    // contructor
    public Circulo (double radio, String cRelleno, String cLinea){
        this.radio= radio;
        this.cRelleno= cRelleno;
        this.cLinea= cLinea;
    }
    
    // getters y setters
    public double getRadio() {
        return radio;
    }
    public void setRadio(double radio) {
        this.radio = radio;
    }
    public String getcRelleno() {
        return cRelleno;
    }
    public void setcRelleno(String cRelleno) {
        this.cRelleno = cRelleno;
    }
    public String getcLinea() {
        return cLinea;
    }
    public void setcLinea(String cLinea) {
        this.cLinea = cLinea;
    }
    
    //to string
    public String toString (){
        String aux;
        aux= ("el radio del circulo es "+this.radio+", su color de linea es "+this.cLinea+" y el color de relleno es "+this.cRelleno);
        return aux;
    }
    
    //calculo de perimetro
    public double calcularPerimetro (){
        return (Math.PI*2*this.radio);
    }
    
    //calculo del area
    public double calcularArea(){
        return (Math.PI*this.radio*this.radio);
    }
}
