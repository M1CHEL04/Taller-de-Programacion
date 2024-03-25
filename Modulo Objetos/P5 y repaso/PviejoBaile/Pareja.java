package PviejoBaile;
public class Pareja {
    private Participante p1;
    private Participante p2;
    private String estilo;
    
    //creo el constructor
    public Pareja (Participante p1, Participante p2, String estilo){
        this.setP1(p1);
        this.setP2(p2);
        this.setEstilo(estilo);
    }
    //creo los getters y setters
    public Participante getP1() {
        return p1;
    }
    public void setP1(Participante p1) {
        this.p1 = p1;
    }
    public Participante getP2() {
        return p2;
    }
    public void setP2(Participante p2) {
        this.p2 = p2;
    }
    public String getEstilo() {
        return estilo;
    }
    public void setEstilo(String estilo) {
        this.estilo = estilo;
    }
    
    //diferencia de edad
    public int difEdad (){
        int aux;
        if (this.p1.getEdad()>this.p2.getEdad())
            aux= (this.p1.getEdad() - this.p2.getEdad());
        else
            aux= (this.p2.getEdad() - this.p1.getEdad());
        
        return (aux);
    }
    
    //toString
    public String toString(){
        return("Participante 1: "+this.p1.toString()+". Participante 2: "+this.p2.toString()+". Estilo: "+this.getEstilo());
    }
    
}
