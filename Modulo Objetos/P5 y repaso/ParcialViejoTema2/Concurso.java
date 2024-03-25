package ParcialViejoTema2;
public class Concurso {
    private int [] dimLogicas;
    private Cancion [][]matriz;
    private int cantCat;
    private int cantCancionXCat;
    
    
    //creo el contructor;
    public Concurso (int cantCat, int cantCancionesXCat){
        this.setCantCancionXCat(cantCancionXCat);
        this.setCantCat(cantCat);
        this.matriz=new Cancion [this.getCantCat()][this.getCantCancionXCat()];
        this.inicializarMatriz();
        this.dimLogicas= new int [this.getCantCancionXCat()];
        this.iniciarVect();
    }
    
    //creo los getters y setters
    public int getCantCat() {
        return cantCat;
    }
    public void setCantCat(int cantCat) {
        this.cantCat = cantCat;
    }
    public int getCantCancionXCat() {
        return cantCancionXCat;
    }
    public void setCantCancionXCat(int cantCancionXCat) {
        this.cantCancionXCat = cantCancionXCat;
    }
    public int getValorDl(int pos){
        return this.dimLogicas[pos];
    }
    
    //inicializar vec dim logicas
    public void iniciarVect (){
        for (int i = 0; i < this.getCantCancionXCat(); i++) {
            this.dimLogicas[i]=0;
        }
    }
    
    //inicializr matriz
    public void inicializarMatriz (){
        for (int i = 0; i < this.getCantCat(); i++) {
            for (int j = 0; j < this.getCantCancionXCat(); j++) {
                this.matriz[i][j]=null;
            }
        }
    }
    
    //agrego un elemento a la matriz
    public void agregarCancion (Cancion c, int cat){
        this.matriz[(cat-1)][this.getValorDl((cat-1))]= c;
        this.dimLogicas[(cat-1)]++;
    }
    
    //interpreto una cancion
    public void interpretar (int identi, Estudiante e, double puntajeOtorgado){
        int i=0;
        int j;
        boolean check= false;
        while ((i<this.getCantCat())&&(!check)){
            j=0;
            while((j<this.getValorDl(i))&&(!check)){
                if (this.matriz[i][j].getIdentificador()==identi){
                    check=true;
                    if(this.matriz[i][j].getPuntaje()<puntajeOtorgado){
                        this.matriz[i][j].setMejorInterpretacion(e);
                        this.matriz[i][j].setPuntaje(puntajeOtorgado);
                    }
                }
               j++; 
            }
            i++;
        }
    }
    
    //Estudiante ganador
    public Estudiante getGanadorDeCancionN (int identi){
        int i=0;
        int j;
        boolean check=false;
        Estudiante aux=null;
        while((i<this.getCantCat())&&(!check)){
            j=0;
            while((j<this.getValorDl(i))&&(!check)){
                if (this.matriz[i][j].getIdentificador()==identi){
                    check=true;
                    aux=this.matriz[i][j].getMejorInterpretacion();
                }
                j++;
            }
            i++;
        }
        return aux;
    }
    
    // Cancion con mayor puntaje
    public Cancion cancionMayorPuntaje (int cat){
        double maxPuntaje=-1;
        Cancion aux=null;
        for (int i = 0; i < this.getValorDl((cat-1)); i++) {
            if(this.matriz[(cat-1)][i].getPuntaje()>maxPuntaje){
                aux= this.matriz[(cat-1)][i];
            }
        }
        return aux;
    }
}
