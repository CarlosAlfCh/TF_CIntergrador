package com.utp.entidad;

public class Reserva {
    private int idreserva;
    private int codcliente;    
    private int coduser;
    private int idservicio;    
    private String fecha;
    private double subtotal;
    private double total;

    public Reserva(){

    }
    
    public Reserva(int idreserva, int codcliente, int coduser, int idservicio, String fecha, double subtotal, double total) {
        this.idreserva = idreserva;
        this.codcliente = codcliente;
        this.coduser = coduser;
        this.idservicio = idservicio;
        this.fecha = fecha;
        this.subtotal = subtotal;
        this.total = total;
    }

    public int getIdreserva() {
        return idreserva;
    }

    public void setIdreserva(int idreserva) {
        this.idreserva = idreserva;
    }

    public int getCodcliente() {
        return codcliente;
    }

    public void setCodcliente(int codcliente) {
        this.codcliente = codcliente;
    }

    public int getCoduser() {
        return coduser;
    }

    public void setCoduser(int coduser) {
        this.coduser = coduser;
    }

    public int getIdservicio() {
        return idservicio;
    }

    public void setIdservicio(int idservicio) {
        this.idservicio = idservicio;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
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
