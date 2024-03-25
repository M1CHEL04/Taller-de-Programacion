package ParcialViejo2022;
public class Concurso {
    private int df;
    private int dl;
    private Pareja [] parejas;
    
    //creo el cosntructor
    public Concurso (int cantParejas){
        this.setDf(cantParejas);
        this.parejas=  new Pareja [this.getDf()];
        this.setDl(0);
    }
    
    
    //creo los getters y setters
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
    private void incDl (){
        this.dl++;
    }
    
    //agrego pareja al concurso;
    public void agregarPareja(Pareja p){
        this.parejas[this.getDl()]=p;
        this.incDl();
    }
    
    //caluclo pareja con mayor diferencia de edad
    public int getParejaMaxDifEdad (){
        int maxDif=0;
        int maxPareja=-1;
        for (int i = 0; i < this.getDl(); i++) {
            if(this.parejas[i].getDiferenciaEdad()>maxDif){
                maxDif= this.parejas[i].getDiferenciaEdad();
                maxPareja=i;
            }
        }
        return maxPareja;
    }
    //creo el toString de una possicion
    public String toString (int indice){
        return (this.parejas[indice].toString());
    }
}
