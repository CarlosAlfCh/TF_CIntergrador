package com.utp.entidad;

public class Pago {
    private int idpago;
    private String fechapago;
    private String codigo;
    private String metodo;
    private int valido;
    
    public Pago(){
        
    }

    public Pago(int idpago, String fechapago, String codigo, String metodo, int valido) {
        this.idpago = idpago;
        this.fechapago = fechapago;
        this.codigo = codigo;
        this.metodo = metodo;
        this.valido = valido;
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
