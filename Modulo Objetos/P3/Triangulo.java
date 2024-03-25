/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package P3;

/**
 *
 * @author santy
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLineas;
    
   public Triangulo (double unLado1, double unLado2, double unLado3, String unColorRelleno, String unColorLineas){
       lado1= unLado1;
       lado2= unLado2;
       lado3= unLado3;
       colorRelleno= unColorRelleno;
       colorLineas = unColorLineas;
   } 
   
   public double getLado1(){
       return lado1;
   }
   public double getLado2(){
       return lado2;
   }
   public double getLado3(){
       return lado3;
   }
   public void setLado1(double unLado1){
       lado1 =unLado1;
   }
   public void setLado2 (double unLado2){
       lado2= unLado2;
   }
   public void setLado3 (double unLado3){
       lado3=unLado3;
   }
   
   public double calcularPerimetro(){
    double aux;
    aux = lado1 + lado2 + lado3;
    return aux;
   }
   
   public double calcularS (){
       double aux;
       aux= ((lado1+lado2+lado3)/2);
       return aux;
   }
   
   public double calcularArea (double s){
       double aux;
       aux = Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
       return aux;
   }
}
