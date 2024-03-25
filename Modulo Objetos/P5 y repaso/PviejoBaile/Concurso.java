package PviejoBaile;
public class Concurso {
    private Pareja [] vect;
    private int DL;
    private int DF;
    
    //creo el constructor
    public Concurso (int df){
        this.setDF(df);
        this.setDL(0);
        this.vect=new Pareja [this.getDF()];
        for (int i = 0; i < this.getDF(); i++) {
            this.vect[i]=null;
        }
    }
    
    //creo los getters y setters
    public int getDL() {
        return DL;
    }
    private void setDL(int DL) {
        this.DL = DL;
    }
    public int getDF() {
        return DF;
    }
    private void setDF(int DF) {
        this.DF = DF;
    }
    private void incDL (){
        this.DL++;
    }
    
    //addPareja
    public void addPareja (Pareja p){
        if (this.getDL()<this.getDF()){
            this.vect[this.getDL()]=p;
            this.incDL();
        }
    }
    
    //max diferencia de edad
    public Pareja maxDif (Pareja p){
        int max=-1;
        Pareja pMax=p;
        for (int i = 0; i < this.getDL(); i++) {
            if (this.vect[i].difEdad()>max){
                max= this.vect[i].difEdad();
                pMax= this.vect[i];
            }
        }
        return (pMax);
    }
    
    public String descrip (Pareja p){
        return(p.toString());
    }
}
