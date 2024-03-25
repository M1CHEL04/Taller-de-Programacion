package ParcialViejoTema2;
public class Cancion {
    private int cat;
    private String nombre;
    private String compositor;
    private int identificador;
    private Estudiante mejorInterpretacion;
    private double puntaje;
    
    //creo el constructor
    public Cancion (int categoria, String nombre, String compositor, int identificador, Estudiante e, double puntaje){
        this.setCat(categoria);
        this.setCompositor(compositor);
        this.setIdentificador(identificador);
        this.setNombre(nombre);
        this.setMejorInterpretacion(e);
        this.setPuntaje(puntaje);
    }
    
    
    //creo los getters y setters
    public int getCat() {
        return cat;
    }
    public void setCat(int cat) {
        this.cat = cat;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getCompositor() {
        return compositor;
    }
    public void setCompositor(String compositor) {
        this.compositor = compositor;
    }
    public int getIdentificador() {
        return identificador;
    }
    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }
    public Estudiante getMejorInterpretacion() {
        return mejorInterpretacion;
    }
    public void setMejorInterpretacion(Estudiante mejorInterpretacion) {
        this.mejorInterpretacion = mejorInterpretacion;
    }
    public double getPuntaje() {
        return puntaje;
    }
    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }
    
}
