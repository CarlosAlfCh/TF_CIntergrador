package com.utp.modelo;

import com.utp.entidad.Consigna;
import com.utp.entidad.Detalle;
import com.utp.util.Conexion;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class DetallesDAO {
    Conexion cn = new Conexion();
    Connection conn= null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    int r = 0;
    
    public List<Detalle> listar(int idreserva) {
        ArrayList<Detalle>list=new ArrayList<>();
        String sql="SELECT servicio.nomserv, servicio.descripcion , reservaservicio.npersonas , reservaservicio.subtotal , reservaservicio.total FROM servicio INNER JOIN reservaservicio on servicio.idservicio=reservaservicio.idservicio WHERE reservaservicio.idreserva="+idreserva+";";
        try {
            conn=cn.conectar();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Detalle del = new Detalle();
                del.setNomserv(rs.getString(1));
                del.setDescripcion(rs.getString(2));
                del.setNpersonas(rs.getInt(3));
                del.setSubtotal(rs.getDouble(4));
                del.setTotal(rs.getDouble(5));
                list.add(del);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Consigna> listconsigna(int idtecnico) {
        ArrayList<Consigna>list=new ArrayList<>();
        String sql="SELECT reserva.idreserva, persona.nombres, persona.apelpat, persona.apelmat, reserva.idpago, reserva.freserva, reserva.monto, reserva.estado FROM reserva INNER JOIN persona ON reserva.idcliente = persona.codigo WHERE reserva.idtecnico ="+idtecnico+";";
        try {
            conn=cn.conectar();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Consigna co = new Consigna();
                co.setIdcita(rs.getInt(1));
                co.setNombres(rs.getString(2));
                co.setApepat(rs.getString(3));
                co.setApemat(rs.getString(4));
                co.setIdpago(rs.getInt(5));
                co.setFecha(rs.getString(6));
                co.setMonto(rs.getDouble(7));
                co.setEstado(rs.getInt(8));
                
                list.add(co);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
