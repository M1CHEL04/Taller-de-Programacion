package ej2;
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private int horaApertura;
    private int horaCierre;
    private int nPisos;
    private int nPlazas;
    private Auto [][] matriz;
    private int cantAutosGuardados;
    
    //creo el contructor 1
    public Estacionamiento (String nombre,String direccion){
        this.setNombre(nombre);
        this.setDireccion(direccion);
        this.setnPisos(5);
        this.setnPlazas(10);
        this.setHoraApertura(8);
        this.setHoraCierre(21);
        matriz= new Auto [this.getnPisos()][this.getnPlazas()];
        this.setCantAutosGuardados(0);
    }
    
    //creo el constructor 2
    public Estacionamiento(String nombre, String direccion, int horaApertura, int horaCierre,int nPisos,int nPlazas){
        this.setNombre(nombre);
        this.setDireccion(direccion);
        this.setHoraApertura(horaApertura);
        this.setHoraCierre(horaCierre);
        this.setnPisos(nPisos);
        this.setnPlazas(nPlazas);
        this.setCantAutosGuardados(0);
        matriz= new Auto [this.getnPisos()][this.getnPlazas()];
    }
    
    //creo los getters y setters.
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public int getHoraApertura() {
        return horaApertura;
    }
    public void setHoraApertura(int horaApertura) {
        this.horaApertura = horaApertura;
    }
    public int getHoraCierre() {
        return horaCierre;
    }
    public void setHoraCierre(int horaCierre) {
        this.horaCierre = horaCierre;
    }
    public int getnPisos() {
        return nPisos;
    }
    public void setnPisos(int nPisos) {
        this.nPisos = nPisos;
    }
    public int getnPlazas() {
        return nPlazas;
    }
    public void setnPlazas(int nPlazas) {
        this.nPlazas = nPlazas;
    }
    public int getCantAutosGuardados() {
        return cantAutosGuardados;
    }
    private void setCantAutosGuardados(int cantAutosGuardados) {
        this.cantAutosGuardados = cantAutosGuardados;
    }
    
    //agregamos un auto a la matriz
    public void agregarAuto (Auto a1, int nPiso, int nPlaza){
        this.matriz[nPiso-1][nPlaza-1]= a1;
        this.cantAutosGuardados++;
    }
    
    //buscar auto por patente
    public String buscarPatente (String patente){
        boolean check=false;
        String aux;
        int c=0;
        int f=0;
        while(!(check)&&(c<(this.getnPlazas()))){
            if(this.matriz[f][c]!=null){
                if(this.matriz[f][c].getPatente().equals(patente)){
                    check=true;
                }
                else{
                    f++;
                    if(f==(this.getnPisos())){
                    f=0;
                    c++;
                    }
                }
            }
            else{
                    f++;
                    if(f==(this.getnPisos())){
                    f=0;
                    c++;
                    }
                }
        }
        if(c==(this.getnPlazas())){
            aux= "Auto inexistente.";
        }
        else{
            aux=(this.matriz[f][c].toString()+" se encuentra en el piso "+(f+1)+" y plaza "+(c+1));
        }
        return aux;
    }
    
    //retornar la cantidad de autos por plaza
    public int cantAutosPlaza(int nPlaza){
        int aux=0;
        for (int f = 0; f < this.getnPisos(); f++) {
           if(!(this.matriz[f][(nPlaza-1)]==null)){
               aux++;
           }
        }
        return aux;
    }
    
    //creo la representacion del estacionamiento
    public String toString (){
        String aux= " ";
        for (int c = 0; c < this.getnPlazas(); c++) {
            for (int f = 0; f < this.getnPisos(); f++) {
                if(!(this.matriz[f][c]==null)){
                    aux= aux+(" piso "+(c+1)+" fila "+(f+1)+this.matriz[f][c].toString());
                }
                else{
                    aux= aux+(" piso "+(c+1)+" fila "+(f+1)+" esta libre.");
                }
            }
        }
        return aux;
    }
}
