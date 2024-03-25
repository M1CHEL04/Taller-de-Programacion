package PviejoTeatro;
public class Main {
    public static void main(String[] args) {
        Teatro t;
        t= new Teatro ("Bocaaa","10/03/2024","21.30Hs",2,2);
        System.out.println(t.ocuparButaca(1, 1));
        System.out.println(t.ocuparButaca(1, 2));
        System.out.println(t.toString());
        t.desocuparFilaF(1);
        System.out.println(t.toString());
    }
}
