package P2;
import PaqueteLectura.GeneradorAleatorio;
public class Ej2 {

    public static void main(String[] args) {
		GeneradorAleatorio.iniciar();
		int df = 15;
		Persona [] vPersonas;
		vPersonas = new Persona [15];
		int dl,dni,edad,i,sumador, min, posMin;
		String nombre;
		dl = 0;
		edad = GeneradorAleatorio.generarInt(80); //generamos la edad
		while((dl<df)&&(edad != 0)){
			nombre = GeneradorAleatorio.generarString(5); //generamos el nombre
			dni = GeneradorAleatorio.generarInt(300000); // generamos el dni
			vPersonas[dl]= new Persona (nombre,dni,edad); // creamos el objeto
			dl++;
			edad = GeneradorAleatorio.generarInt(80);
		}
		sumador = 0;
		for (i=0;i<dl;i++)
			if(vPersonas[i].getEdad()>65)
				sumador++;
		System.out.println("la cantiad de personas mayores a 65 años son "+ sumador); // imprimimos la cantidad de personas
		min = 350000;
		posMin = -1;
		for (i = 0; i < dl; i++)
			if (vPersonas [i].getDNI() < min){
				posMin = i;
				min = vPersonas[i].getDNI();
			}
		System.out.println(vPersonas[posMin].toString());
    }

}
