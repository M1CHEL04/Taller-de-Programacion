package ParcialViejoTurnoF;
public class Empresa {
    private String nombreEmpresa;
    private String direccion;
    private Director directorEjecutivo;
    private Encargado [] encargadosSucursales;
    private int df;
    private int dl;
    
    //creo el constructor;
    public Empresa (String nombreEmpresa, String direccion, Director directorEjecutivo, int df){
        this.setNombreEmpresa(nombreEmpresa);
        this.setDireccion(direccion);
        this.setDirectorEjecutivo(directorEjecutivo);
        this.setDf(df);
        this.encargadosSucursales=new Encargado [this.getDf()];
        this.setDl(0);
    }
    
    //creo los getters y setters
    public String getNombreEmpresa() {
        return nombreEmpresa;
    }
    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }
    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public Director getDirectorEjecutivo() {
        return directorEjecutivo;
    }
    public void setDirectorEjecutivo(Director directorEjecutivo) {
        this.directorEjecutivo = directorEjecutivo;
    }
    public int getDf() {
        return df;
    }
    public void setDf(int df) {
        this.df = df;
    }
    public int getDl() {
        return dl;
    }
    private void setDl(int dl) {
        this.dl = dl;
    }
    private void incDL (){
        this.dl++;
    }
    
    //agrego encargado a sucursal
    public void agregarEncargado (Encargado e, int nSucursal){
        if(this.encargadosSucursales[nSucursal-1] == null){
            this.encargadosSucursales[nSucursal-1]= e;
            this.incDL();
        }
    }
    
    //creo la descripcion de los encargados de las distintas sucursales
    public String descripcionEncargados (){
        String aux=" ";
        for (int i = 0; i < this.getDf(); i++) {
            if(this.encargadosSucursales[i] == null){
                aux= aux+(" La sucursal "+(i+1)+" no tiene encargado");
            }
            else{
                aux= aux + (" El encargado de la sucursal "+(i+1)+" es "+this.encargadosSucursales[i].toString());
            }
        }
        return aux;
    }
    
    //creo el toString de la empresa
    public String toString (){
        String aux;
        aux=("Nombre de la empresa: "+this.getNombreEmpresa()+". Direccion: "+this.getDireccion()+". Director Ejecutivo: "+this.getDirectorEjecutivo().toString()+". Encargados de las sucursales: "+this.descripcionEncargados());
        return aux;
    }
}
