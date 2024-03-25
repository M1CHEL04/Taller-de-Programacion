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
public class Ej5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        double prom;
        boolean check;
        int matriz [][];
        matriz = new int [5][4];
        int i,j,sumador;
        for(i=0;i<5;i++){
            System.out.println("Cliente "+ i);
            for(j=0;j<4;j++){
                System.out.println("ingrese la calificacion del aspecto "+ j);
                matriz [i][j]=Lector.leerInt(); // cargo la matriz
            }
        }
        check = false;
        j=0;
        while(!check){
            sumador = 0;
            for (i=0;i<5;i++)
                sumador = sumador + matriz [i][j];
            prom = sumador/5;
            System.out.println("el promedio del aspecto "+j+ " es "+ prom);
            j++;
            if(j==4)
                check = true;
        } //calculo el promedio de los diferentes aspectos
    }
}
