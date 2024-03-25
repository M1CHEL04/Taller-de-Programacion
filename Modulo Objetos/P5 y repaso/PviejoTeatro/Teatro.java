package PviejoTeatro;
public class Teatro {
    private String nombre;
    private String fecha;
    private String hora;
    private int f;
    private int c;
    private Butaca [][] mat;
    
    //constructor
    public Teatro (String nombre, String fecha,String Hora, int f, int c){
        this.setNomnbre(nombre);
        this.setHora(Hora);
        this.setFecha(fecha);
        this.setC(c);
        this.setF(f);
        this.mat= new Butaca [this.getF()][this.getC()];
        for (int i = 0; i < this.getF(); i++) {
            for (int j = 0; j < this.getC(); j++) {
                this.mat[i][j]= new Butaca (("Butaca "+(i+1)+", "+(j+1)),(800+100*(i+1)),false);
            }
        }
    }
    
    //getter y setter
    public String getNombre() {
        return nombre;
    }
    public void setNomnbre(String nombre) {
        this.nombre = nombre;
    }
    public String getFecha() {
        return fecha;
    }
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    public String getHora() {
        return hora;
    }
    public void setHora(String hora) {
        this.hora = hora;
    }
    public int getF() {
        return f;
    }
    private void setF(int f) {
        this.f = f;
    }
    public int getC() {
        return c;
    }
    private void setC(int c) {
        this.c = c;
    }
    
    //ocupar una butaca en fila F columna C
    public double ocuparButaca (int F, int C){
        double aux=-1;
        if (this.mat[(F-1)][(C-1)].isEstado()==false){
            this.mat[(F-1)][(C-1)].setEstado(true);
            aux= this.mat[(F-1)][(C-1)].getPrecio();
        }
        return aux;
    }
    
    //desocupar todas las butacas de una fila F
    public void desocuparFilaF (int F){
        for (int i = 0; i < this.getC(); i++) {
            this.mat[(F-1)][i].setEstado(false);
        }
    }
    
    public String toString (){
        String aux=" ";
        for (int i = 0; i < this.getF(); i++) {
            for (int j = 0; j < this.getC(); j++) {
                aux= (aux + " "+ this.mat[i][j].toString());
            }
        }
        return ("Nombre: "+this.getNombre()+", Fecha: "+this.getFecha()+", Descripcion butacas: "+aux);
    }
}
