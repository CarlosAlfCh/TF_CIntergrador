package com.utp.entidad;

import java.util.List;

public class Cita {
    private int idcita;
    private int idcliente;    
    private int idtecnico; 
    private int idpago; 
    private String fecha;
    private double monto;
    private int estado;
    
    private List<Reserva> detallereserva;

    public Cita() {
    }

    public Cita(int idcita, int idcliente, int idtecnico, int idpago, String fecha, double monto, int estado, List<Reserva> detallereserva) {
        this.idcita = idcita;
        this.idcliente = idcliente;
        this.idtecnico = idtecnico;
        this.idpago = idpago;
        this.fecha = fecha;
        this.monto = monto;
        this.estado = estado;
        this.detallereserva = detallereserva;
    }

    public int getIdcita() {
        return idcita;
    }

    public void setIdcita(int idcita) {
        this.idcita = idcita;
    }

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    public int getIdtecnico() {
        return idtecnico;
    }

    public void setIdtecnico(int idtecnico) {
        this.idtecnico = idtecnico;
    }

    public int getIdpago() {
        return idpago;
    }

    public void setIdpago(int idpago) {
        this.idpago = idpago;
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

    public List<Reserva> getDetallereserva() {
        return detallereserva;
    }

    public void setDetallereserva(List<Reserva> detallereserva) {
        this.detallereserva = detallereserva;
    }

}
