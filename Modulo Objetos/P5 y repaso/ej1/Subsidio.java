package ej1;
public class Subsidio {
    private double monto;
    private String motivo;
    private boolean otorgado;
    
    //creo el constructor
    public Subsidio (double monto, String motivo){
        this.setMonto(monto);
        this.setMotivo(motivo);
        this.setOtorgado(false);
    }
    
    //creo los getters y setters
    public double getMonto() {
        return monto;
    }
    public void setMonto(double monto) {
        this.monto = monto;
    }
    public String getMotivo() {
        return motivo;
    }
    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
    public boolean isOtorgado() {
        return otorgado;
    }
    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
}
