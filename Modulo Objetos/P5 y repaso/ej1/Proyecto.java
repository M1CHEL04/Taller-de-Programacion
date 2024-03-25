package ej1;

import ej1.Investigador;

public class Proyecto {
    private String nombreProyecto;
    private int codigo;
    private String nombreDirector;
    private Investigador [] investigadores;
    private int cantInvestigadores;
    
    //creo el constructor
    public Proyecto(String nombreProyecto, int cod, String nombreDirector){
        this.setCodigo(cod);
        this.setNombreDirector(nombreDirector);
        this.setNombreProyecto(nombreProyecto);
        this.investigadores= new Investigador [50];
        this.cantInvestigadores=0;
    }
    
    //creo los getters y setters
    public String getNombreProyecto() {
        return nombreProyecto;
    }
    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }
    public int getCodigo() {
        return codigo;
    }
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    public String getNombreDirector() {
        return nombreDirector;
    }
    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }
    public int getCantInvestigadores() {
        return cantInvestigadores;
    }
    private void setCantInvestigadores(int cantInvestigadores) {
        this.cantInvestigadores = cantInvestigadores;
    }
    
    
    //agregar investigador
    public void agregarInvestigador (Investigador unInvestigador){
        this.investigadores[cantInvestigadores]= unInvestigador;
        cantInvestigadores++;
    }
    
    //ototorgar todos los subsidios a un investigador dado
    public void otorgarTodos (String unNombre){
        int aux=0;
        while(!((this.investigadores[aux].getNombreInvestigador()).equals(unNombre))) {
            aux++;
        }
        this.investigadores[aux].otorgarSubsidios();
    }
    //creo la el string de la cantidad de trabajadores.
    private String descripcionInvestigadores (){
        String aux= " ";
        for (int i = 0; i < this.getCantInvestigadores(); i++) {
            aux= aux + this.investigadores[i].toString();
        }
        return aux;
    }
    
    //creo el toString
    public String toString(){
        String aux;
        aux= ("el proyecto "+this.getNombreProyecto()+" con codigo "+this.getCodigo()+" tiene como director a "+this.getNombreDirector()+" y sus investigadores son: "+ this.descripcionInvestigadores());
        return aux;
    }
}
