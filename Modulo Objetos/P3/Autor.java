package P3;

public class Autor {
    String nombre,biografia,origen;
    
    public Autor (String unNombre,String unBiografia,String unOrigen){
        nombre = unNombre;
        biografia = unBiografia;
        origen = unOrigen;
    }
    
    public String getNombre (){
        return nombre;
    }
    public String getBiografia(){
        return biografia;
    }
    public String getOrigen(){
        return origen;
    }
    public void setNombre(String unNombre){
        nombre= unNombre;
    }
    public void setBiografia(String unBiografia){
        biografia= unBiografia;
    }
    public void setOrigen (String unOrigen){
        origen=unOrigen;
    }
    
    public String toString(){
        String aux;
        aux=("el nombre del autor es "+ nombre +", es de origen "+ origen +" y su biografia es: "+biografia);
        return aux;
    }
}
