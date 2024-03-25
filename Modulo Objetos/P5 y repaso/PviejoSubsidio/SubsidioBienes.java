package PviejoSubsidio;
public class SubsidioBienes extends Subsidio {
    private Bien [] vect;
    private int DF;
    private int DL;
    
    //creo constructor
    public SubsidioBienes (String nombreI, String nombreT, String fecha, int DF){
        super(nombreI,nombreT,fecha);
        this.setDF(DF);
        this.vect= new Bien [this.getDF()];
        this.setDL(0);
        for (int i = 0; i < this.getDF(); i++) {
            this.vect[i]=null;
        }
    }
    
    //creo getter y setter
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
    
    public void  addBien (Bien b){
        if (this.getDL()<this.getDF()){
            this.vect[this.getDL()]=b;
            this.incDL();
        }
    }
    
    public double montoTotal (){
        double aux=0;
        for (int i = 0; i < this.getDL(); i++) {
            aux= aux + this.vect[i].costoXBien();
        }
        return aux;
    }
    
    //creo el toString
    public String toString(){
        String aux=" ";
        for (int i = 0; i < this.getDL(); i++) {
            aux= (aux + "bien numero: "+ i+" "+ this.vect[i].toString()+".");
        }
        return (super.toString()+aux);
    }
}
