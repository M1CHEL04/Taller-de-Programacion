package ej3;
public class Evento extends Recital {
    private String motivo;
    private String nombreContratante;
    private int dia;
    
    //creo el constructor
    public Evento (String nombreBanda, int cantTemas,String motivo,String nombreContratante,int dia){
        super(nombreBanda,cantTemas);
        this.setMotivo(motivo);
        this.setNombreContratante(nombreContratante);
        this.setDia(dia);
    }
    
    //creo los getters y setters
    public String getMotivo() {
        return motivo;
    }
    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
    public String getNombreContratante() {
        return nombreContratante;
    }
    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }
    public int getDia() {
        return dia;
    }
    public void setDia(int dia) {
        this.dia = dia;
    }
    
    //creo el actuar de beneficencia
    public void actuar(){
        if(this.getMotivo().equals("beneficencia")){
            System.out.println("Recuerde colaborar con... "+this.getNombreContratante());
        } 
        else if(this.getMotivo().equals("Show de TV")){
            System.out.println("Saludos amigos televidentes");
        }
        else {
            System.out.println("Un feliz cumpleanios para... "+this.getNombreContratante());
        }
        super.actuar();
    }
    
    //calculo el costo
    public int calcularCosto (){
        int aux;
        if(this.getMotivo().equals("beneficencia")) {
            aux= 0;
        }
        else if(this.getMotivo().equals("Show de TV")){
            aux=50000;
        } 
        else {
            aux=150000;
        }
        return aux;
    }
}
