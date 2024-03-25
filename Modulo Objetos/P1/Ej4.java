/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package P1;
import PaqueteLectura.Lector;
/**
 *
 * @author santy
 */
public class Ej4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int [][]matriz;
        matriz = new int [8][4];
        int i,j;
        for(i=0;i<8;i++)
            for(j=0;j<4;j++)
                matriz [i][j]=0; // inicializo la matriz
        System.out.println("ingrese al piso que se dirige");
            i = Lector.leerInt();
        while (i!= 9){
            System.out.println("ingrese a la oficina que se dirige");
            j = Lector.leerInt();
            matriz[i][j]++;
            System.out.println("ingrese al piso que se dirige");
            i = Lector.leerInt();
        } // creo la matriz
        for (i=0;i<8;i++)
            for(j=0;j<4;j++)
                System.out.println("("+i+","+j+") "+ matriz[i][j]);
    }           
    
}
