package Estacionamiento;
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private int horaA;
    private int horaC;
    private int nPisos;
    private int nPlazas;
    private Auto [][] lugares;
    private int dl;
    
    //creo el constructor
    public Estacionamiento (String nombre, String direccion, int horaA, int horaC, int nPisos, int nPlazas){
        this.setDireccion(direccion);
        this.setNombre(nombre);
        this.setHoraA(horaA);
        this.setHoraC(horaC);
        this.setnPisos(nPisos);
        this.setnPlazas(nPlazas);
        this.lugares= new Auto [this.getnPisos()][this.getnPlazas()];
        this.setDl(0);
    }
    
    //creo los getters y setters
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
    public int getHoraA() {
        return horaA;
    }
    public void setHoraA(int horaA) {
        this.horaA = horaA;
    }
    public int getHoraC() {
        return horaC;
    }
    public void setHoraC(int horaC) {
        this.horaC = horaC;
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
    public int getDl() {
        return dl;
    }
    private void setDl(int dl) {
        this.dl = dl;
    }
    private void incDl (){
        this.dl++;
    }
    
    //aniado auto al estacionamiento
    public void addAuto (int nPiso, int nPlaza, Auto a){
        this.lugares[(nPiso-1)][(nPlaza-1)]=a;
        this.incDl();
    }
    
    //buscar auto por patente
    public String buscarPorPatente (String pat){
        int i=0;
        int j;
        boolean aux= false;
        String ret=("Auto inexistente.");
        while ((i<this.getnPisos())&&(!aux)){
            j=0;
            while ((j<this.getnPlazas())&&(!aux)){
                if (this.lugares[i][j].getPatente().equals(pat)){
                    aux= true;
                    ret= ("Se encuentra en el piso "+(i+1)+" y plaza "+(j+1)+".");
                }
                j++;
            }
            i++;
        }
        return ret;
    }
    
    //toString del estacionamiento
    public String toString (){
        String aux=" ";
        for (int i = 0; i < this.getnPisos(); i++) {
            for (int j = 0; j < this.getnPlazas(); j++) {
                if (this.lugares[i][j] != null){
                    aux= aux+(" Piso "+(i+1)+" Plaza "+(j+1)+" "+this.lugares[i][j].toStrig());
                }
                else{
                    aux= aux+ (" Piso "+(i+1)+" Plaza "+(j+1)+" Vacio");
                }
            }
        }
        return aux;
    }
    
    //cant autos por plaza
    public int cantAutosPlazaX (int nPlaza){
        int aux=0;
        for (int i = 0; i < this.getnPisos(); i++) {
            if (this.lugares[i][(nPlaza-1)] != null){
                aux++;
            }
        }
        return aux;
    }
}
