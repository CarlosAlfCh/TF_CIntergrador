package com.utp.entidad;

public class Servicio {
    private int idservicio;
    private String nomserv;
    private String descripcion;
    private String turno;
    private double precio;
    private int idtipo;
    private String imagen;
    private int estadoserv; 
    private String duracion;

    public Servicio(){        
    }
    
    public Servicio(int idservicio, String nomserv, String descripcion, String turno, double precio, int idtipo, String imagen, int estadoserv, String duracion) {
        this.idservicio = idservicio;
        this.nomserv = nomserv;
        this.descripcion = descripcion;
        this.turno = turno;
        this.precio = precio;
        this.idtipo = idtipo;
        this.imagen = imagen;
        this.estadoserv = estadoserv;
        this.duracion = duracion;
    }

    public int getIdservicio() {
        return idservicio;
    }

    public void setIdservicio(int idservicio) {
        this.idservicio = idservicio;
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

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getIdtipo() {
        return idtipo;
    }

    public void setIdtipo(int idtipo) {
        this.idtipo = idtipo;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getEstadoserv() {
        return estadoserv;
    }

    public void setEstadoserv(int estadoserv) {
        this.estadoserv = estadoserv;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }   
}
