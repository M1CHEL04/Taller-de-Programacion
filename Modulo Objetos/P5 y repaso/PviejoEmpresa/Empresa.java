package PviejoEmpresa;
public class Empresa {
    private String nombre;
    private String direccion;
    private Director dir;
    private Encargado [] vect;
    private int DF;
    private int DL;
    
    //constructor
    public Empresa (String nombre, String direccion, Director dir, int df){
        this.setNombre(nombre);
        this.setDireccion(direccion);
        this.setDir(dir);
        this.setDF(df);
        this.setDL(0);
        this.vect= new Encargado [this.getDF()];
        for (int i = 0; i < this.getDF(); i++) {
            this.vect[i]=null;
        }
    }
    
    //getter y setters
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
    public Director getDir() {
        return dir;
    }
    public void setDir(Director dir) {
        this.dir = dir;
    }
    public int getDF() {
        return DF;
    }
    private void setDF(int DF) {
        this.DF = DF;
    }
    public int getDL() {
        return DL;
    }
    private void setDL(int DL) {
        this.DL = DL;
    }
    private void incDL (){
        this.DL++;
    }
    
    //agregar encargado
    public void addEncargado (Encargado e,int x){
        if (this.vect[x-1] == null){
            this.vect[x-1]=e;
            this.incDL();
        }
    }
    
    //descripcion de encargados
    public String desc (){
        String aux=" ";
        for (int i = 0; i < this.getDF(); i++) {
            aux= (aux + "Sucursal: "+(i+1));
            if (this.vect[i] == null)
                aux= (aux+", Esta sucursal no posee encargado.");
            else
                aux= (aux+" "+this.vect[i].toString());
        }
        return aux;
    }
    
    //creo el toString
    public String toString (){
        return ("Nombre de la empresa: "+this.getNombre()+", direccon: "+this.getDireccion()+". Datos del director"+this.dir.toString()+". Datos de los encargados: "+this.desc());
    }
}
