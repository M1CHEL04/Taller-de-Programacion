package ej1;

public class Investigador {
    private String nombreInvestigador;
    private int categoria;
    private String especialidad;
    private Subsidio [] subsidios;
    private int cantSubsidios;
    
    //creo el constructor
    public Investigador (String nombre, int categoria, String especialidad){
        this.setCategoria(categoria);
        this.setNombreInvestigador(nombre);
        this.setEspecialidad(especialidad);
        this.subsidios= new Subsidio [5];
        this.setCantSubsidios(0);
    }
    
    //creo los getters y setters
    public String getNombreInvestigador() {
        return nombreInvestigador;
    }
    public void setNombreInvestigador(String nombreInvestigador) {
        this.nombreInvestigador = nombreInvestigador;
    }
    public int getCategoria() {
        return categoria;
    }
    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
    public String getEspecialidad() {
        return especialidad;
    }
    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    public int getCantSubsidios() {
        return cantSubsidios;
    }
    private void setCantSubsidios(int cantSubsidios) {
        this.cantSubsidios = cantSubsidios;
    }
    
    //agrego un subsidio
    public void agregarSubsidio (Subsidio unSubsidio){
        this.subsidios[this.getCantSubsidios()]= unSubsidio;
        this.cantSubsidios++;
    }
    
    //retorno la cantidad de dinero otorgada
    public double dineroTotalOtorgado (){
        double aux=0;
        for (int i = 0; i < this.getCantSubsidios(); i++) {
            aux= aux+this.subsidios[i].getMonto();
        }
        return aux;
    }
    
    //otorgar todos los subsidios no otorgados
    public void otorgarSubsidios(){
        for (int i = 0; i < this.getCantSubsidios(); i++) {
            if(!(this.equals(this.subsidios[i].isOtorgado()))){
                this.subsidios[i].setOtorgado(true);
            }
        }
    }
    
    //creo el toString
    public String toString (){
        String aux;
        aux= ("nombre "+this.getNombreInvestigador()+" pertenece a la categoria "+this.getCategoria()+" Su especialidad es "+this.getEspecialidad()+" y el total de dinero en subsidios que se le otorgo fue "+this.dineroTotalOtorgado()+" pesos.");
        return aux;
    }
}
