/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package P1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author santy
 */
public class Ej3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        boolean check = false;
        int sumador = 0;
	GeneradorAleatorio.iniciar(); 
	int [][] matriz;
        matriz = new int [5][5];
        int i,j;
        for(i=0;i<5;i++)
           for(j=0;j<5;j++)
               matriz[i][j]= GeneradorAleatorio.generarInt(31); // creo la matriz
        for(i=0;i<5;i++){
            System.out.println("-------------------");
            for(j=0;j<5;j++)
                System.out.print(matriz[i][j]+"|");
        }
        System.out.println("-------------------"); //imprimo la matriz
        for(i=0;i<5;i++)
            sumador = sumador + matriz[1][i];
        System.out.println("la suma total de los elementos de la fila 1 es: "+ sumador); // suma de los elementos de la fila 1
        int [] vecColumnas;
        j=0;
        vecColumnas = new int [5];
        while(!check){
            sumador=0;
            for(i=0;i<5;i++)
                sumador = sumador + matriz [i][j];
            vecColumnas [j]= sumador;
            j++;
            if(j==5)
                check = true;
        }
        for(i=0;i<5;i++)
            System.out.println("la sumatoria de la columna "+ i+ " es "+ vecColumnas[i]); //imprimo el vector con las sumatorias
        int aux; // declaro el valor a leer;
        check = false;
        System.out.println("ingrese el numero a buscar en la matriz");
        aux = Lector.leerInt(); // leeo el valor a buscar
        for (i=0;i<5;i++)
            for(j=0;i<5;j++){
                if(matriz[i][j]==aux)
                    check = true;
                if(check)
                    System.out.println();
            }
    }
    
}
