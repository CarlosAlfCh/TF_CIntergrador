package com.utp.entidad;

public class Pago {

    private String nombres;
    private String apepat;
    private String apemat;
    private String correo;
    private int idpago;
    private String fechapago;
    private String codigo;
    private String metodo;
    private int valido;

    public Pago() {

    }

    public Pago(String nombres, String apepat, String apemat, String correo, int idpago, String fechapago, String codigo, String metodo, int valido) {
        this.nombres = nombres;
        this.apepat = apepat;
        this.apemat = apemat;
        this.correo = correo;
        this.idpago = idpago;
        this.fechapago = fechapago;
        this.codigo = codigo;
        this.metodo = metodo;
        this.valido = valido;
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

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getIdpago() {
        return idpago;
    }

    public void setIdpago(int idpago) {
        this.idpago = idpago;
    }

    public String getFechapago() {
        return fechapago;
    }

    public void setFechapago(String fechapago) {
        this.fechapago = fechapago;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getMetodo() {
        return metodo;
    }

    public void setMetodo(String metodo) {
        this.metodo = metodo;
    }

    public int getValido() {
        return valido;
    }

    public void setValido(int valido) {
        this.valido = valido;
    }

}
