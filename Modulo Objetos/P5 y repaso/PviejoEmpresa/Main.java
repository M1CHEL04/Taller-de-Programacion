package PviejoEmpresa;
public class Main {
    public static void main(String[] args) {
       Director d;
       Encargado e1,e2;
       Empresa E;
       d=new Director ("Juan carlos",44,2020,2000,1500);
       e1= new Encargado ("Matias",55,2000,1000,2);
       e2= new Encargado ("Magali",66,2023,1000,4);
       E= new Empresa ("Minis mininis","av 60 1629",d,3);
       E.addEncargado(e1, 1);
       E.addEncargado(e2, 2);
       System.out.println(E.toString());
    }
}
