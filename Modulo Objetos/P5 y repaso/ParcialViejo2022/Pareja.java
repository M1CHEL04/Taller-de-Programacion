package ParcialViejo2022;
public class Pareja {
    private Persona participante1;
    private Persona participante2;
    private String estilo;
    
    //creo el constructor
    public Pareja (Persona p1, Persona p2, String estilo){
        this.setParticipante1(p1);
        this.setParticipante2(p2);
        this.setEstilo(estilo);
    }
    
    //creo los getters y setters
    public Persona getParticipante1() {
        return participante1;
    }
    public void setParticipante1(Persona participante1) {
        this.participante1 = participante1;
    }
    public Persona getParticipante2() {
        return participante2;
    }
    public void setParticipante2(Persona participante2) {
        this.participante2 = participante2;
    }
    public String getEstilo() {
        return estilo;
    }
    public void setEstilo(String estilo) {
        this.estilo = estilo;
    }
    
    //verificar que participante es mas grande
    public boolean getMayor (){
        boolean aux=false;
        if(this.getParticipante1().getEdad()>this.getParticipante2().getEdad()){
            aux= true;
        }
        return aux;
    }
    
    //obtener diferencia de la pareja
    public int getDiferenciaEdad (){
        int aux=0;
        if(this.getMayor()){
            aux= (this.getParticipante1().getEdad()-this.getParticipante2().getEdad());
        }
        else{
            aux= (this.getParticipante2().getEdad()-this.getParticipante1().getEdad());
        }
        return aux;
    }
    
    //creo el toString de la pereja
    public String toString (){
        return ("Integrante 1: "+this.getParticipante1().toString()+". Integrante 2: "+this.getParticipante2().toString());
    }
}
