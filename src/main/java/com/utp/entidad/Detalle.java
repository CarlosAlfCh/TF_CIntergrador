package com.utp.entidad;

/**
 *
 * @author LENOVO
 */
public class Detalle {
    private String nomserv;
    private String descripcion;
    private int npersonas;
    private double subtotal;
    private double total;

    public Detalle() {
    }

    public Detalle(String nomserv, String descripcion, int npersonas, double subtotal, double total) {
        this.nomserv = nomserv;
        this.descripcion = descripcion;
        this.npersonas = npersonas;
        this.subtotal = subtotal;
        this.total = total;
    }

    public String getNomserv() {
        return nomserv;
    }

    public void setNomserv(String nomserv) {
        this.nomserv = nomserv;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getNpersonas() {
        return npersonas;
    }

    public void setNpersonas(int npersonas) {
        this.npersonas = npersonas;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
}
