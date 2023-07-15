package com.utp.entidad;

/**
 *
 * @author LENOVO
 */
public class Consigna {
    private int idcita;
    private int idpago;
    private String nombres;
    private String apepat;
    private String apemat;
    private String fecha;
    private double monto;
    private int estado;

    public Consigna() {
    }

    public Consigna(int idcita, int idpago, String nombres, String apepat, String apemat, String fecha, double monto, int estado) {
        this.idcita = idcita;
        this.idpago = idpago;
        this.nombres = nombres;
        this.apepat = apepat;
        this.apemat = apemat;
        this.fecha = fecha;
        this.monto = monto;
        this.estado = estado;
    }

    public int getIdcita() {
        return idcita;
    }

    public void setIdcita(int idcita) {
        this.idcita = idcita;
    }

    public int getIdpago() {
        return idpago;
    }

    public void setIdpago(int idpago) {
        this.idpago = idpago;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApepat() {
        return apepat;
    }

    public void setApepat(String apepat) {
        this.apepat = apepat;
    }

    public String getApemat() {
        return apemat;
    }

    public void setApemat(String apemat) {
        this.apemat = apemat;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
}
