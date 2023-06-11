package com.utp.entidad;

import java.util.Date;

public class Cliente extends Persona{
   
    private Date FNacimiento;

    public Cliente() {
        super();
    }   

    public Cliente(Date FNacimiento, int codigo, String nombres, String apepat, String apemat, String dni, String correo, String telefono, String contrasena, int estado, int rol, String Direccion, String Distrito) {
        super(codigo, nombres, apepat, apemat, dni, correo, telefono, contrasena, estado, rol, Direccion, Distrito);
        this.FNacimiento = FNacimiento;
    }

    public Date getFNacimiento() {
        return FNacimiento;
    }

    public void setFNacimiento(Date FNacimiento) {
        this.FNacimiento = FNacimiento;
    }
}
