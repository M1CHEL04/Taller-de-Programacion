package P3;
public class Cliente {
    private int edad;
    private int dni;
    private String nombre;
    
    //creo el constructor
    public Cliente(int edad, int dni, String nombre) {
        this.edad = edad;
        this.dni = dni;
        this.nombre = nombre;
    }
    
    // creo los getters y setters
     public String getNombre (){
         return nombre;
     }
     public int getEdad (){
         return edad;
     }
     public int getDni (){
         return dni;
     }
     public void setNombre(String unNombre){
         nombre= unNombre;
     }
     public void setDni (int unDni){
         dni= unDni;
     }
     public void setEdad(int unaEdad){
         edad= unaEdad;
     }
    
     //creo el toString
     public String toString(){
         String aux;
         aux=("el cliente "+nombre+" de edad "+edad+" tiene dni "+dni);
         return aux;
     }
}
