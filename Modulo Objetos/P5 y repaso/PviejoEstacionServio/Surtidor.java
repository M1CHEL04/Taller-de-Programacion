package PviejoEstacionServio;
public class Surtidor {
    private int DF;
    private int DL;
    private String nCombustible;
    private double precioXlitro;
    private Venta [] vectVentas;
    
    //construcor
    public Surtidor (String nCombustible, double pXl, int df){
        this.setDF(df);
        this.setnCombustible(nCombustible);
        this.setPrecioXlitro(pXl);
        this.setDL(0);
        this.vectVentas= new Venta [this.getDF()];
        for (int i = 0; i < this.getDF(); i++) {
            this.vectVentas[i]=null;
        }
    }
    
    //getter y stters
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
    public String getnCombustible() {
        return nCombustible;
    }
    public void setnCombustible(String nCombustible) {
        this.nCombustible = nCombustible;
    }
    public double getPrecioXlitro() {
        return precioXlitro;
    }
    public void setPrecioXlitro(double precioXlitro) {
        this.precioXlitro = precioXlitro;
    }
    private void incDL (){
        this.DL++;
    }
    
    //agregar venta
    public void addventa (Venta v){
        if (this.getDL()<this.getDF()){
            this.vectVentas[this.getDL()]=v;
            this.incDL();
        }
    }
    
    //totalVentas efectivo
    public double totalVentasEfect (){
        double aux=0;
        for (int i = 0; i < this.getDL(); i++) {
            if (this.vectVentas[i].getMedioDePago().equals("efectivo")){
                aux=aux+this.vectVentas[i].getMonto();
            }
        }
        return aux;
    }
    
    //descrip surt
    public String desc (){
        String aux=" ";
        for (int i = 0; i < this.getDL(); i++) {
            aux = aux +" "+ this.vectVentas[i].toString();
        }
        return aux;
    }
    
    //toString
    public String toString (){
        return ("Nombre del combustible: "+this.getnCombustible()+", Precio por litro: "+this.getPrecioXlitro()+" Ventas: "+this.desc());
    }
}
