package com.utp.entidad;

public class Reserva {
    private int item;
    private int idservicio;    
    private String nombre;
    private String descripcion;
    private double subtotal;
    private int npersonas;
    private double total;

    public Reserva(){

    }

    public Reserva(int item, int idservicio, String nombre, String descripcion, double subtotal, int npersonas, double total) {
        this.item = item;
        this.idservicio = idservicio;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.subtotal = subtotal;
        this.npersonas = npersonas;
        this.total = total;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getIdservicio() {
        return idservicio;
    }

    public void setIdservicio(int idservicio) {
        this.idservicio = idservicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public int getNpersonas() {
        return npersonas;
    }

    public void setNpersonas(int npersonas) {
        this.npersonas = npersonas;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
}
