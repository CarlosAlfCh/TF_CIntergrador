package com.utp.entidad;

public class Usuario extends Persona{
    private String turno;
    private String horario;
    private int idespecialidad;

    public Usuario() {
        super();        
    }

    public Usuario(String turno, String horario, int idespecialidad, int codigo, String nombres, String apepat, String apemat, String dni, String correo, String telefono, String contrasena, int estado, int rol, String Direccion, String Distrito) {
        super(codigo, nombres, apepat, apemat, dni, correo, telefono, contrasena, estado, rol, Direccion, Distrito);
        this.turno = turno;
        this.horario = horario;
        this.idespecialidad = idespecialidad;
    }       

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public int getIdespecialidad() {
        return idespecialidad;
    }

    public void setIdespecialidad(int idespecialidad) {
        this.idespecialidad = idespecialidad;
    }  
}
