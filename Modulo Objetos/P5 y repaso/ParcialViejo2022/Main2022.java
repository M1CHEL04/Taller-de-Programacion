package ParcialViejo2022;
public class Main2022 {
    public static void main(String[] args) {
       Concurso c1;
       Pareja p1, p2;
       Persona per1,per2,per3,per4;
       //creo el concurso
       c1= new Concurso (3);
       //creo las personmas
       per1= new Persona ("Juan",111,32);
       per2= new Persona ("Marta",222,35);
       per3= new Persona ("Ramiro",333,56);
       per4= new Persona ("Julia",444,57);
       //creo las parejas
       p1= new Pareja (per1,per2,"bachata");
       p2= new Pareja (per3,per4,"salsa");
       //aniado las parejas al concurso
       c1.agregarPareja(p1);
       c1.agregarPareja(p2);
        System.out.println("La pareja con mayor diferencia de edad es: "+(c1.getParejaMaxDifEdad()+1)+" y sus integrantes son: "+c1.toString(c1.getParejaMaxDifEdad()));
    }
    
}
