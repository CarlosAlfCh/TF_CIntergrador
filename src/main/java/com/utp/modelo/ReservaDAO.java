package com.utp.modelo;

import com.utp.entidad.Cita;
import com.utp.entidad.Reserva;
import com.utp.util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReservaDAO {
    Conexion cn = new Conexion();
    Connection conn= null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    int r = 0;
    
    public int GenerarCita(Cita cita){
        int idreserva=0;
        String sql ="insert into reserva(idcliente,idpago,freserva,monto,estado) values(?,?,?,?,?)";
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cita.getIdcliente());
            ps.setInt(2, cita.getIdpago());
            ps.setString(3, cita.getFecha());
            ps.setDouble(4, cita.getMonto());
            ps.setInt(5, 0); 
            r=ps.executeUpdate();
            
            sql = "select * from reserva where idpago=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cita.getIdpago());
            rs = ps.executeQuery();
            while (rs.next()) {
                idreserva=rs.getInt("idreserva"); 
            }            
            System.out.println("id: "+idreserva);
            
            for (Reserva detalle : cita.getDetallereserva()) {
                sql="insert into reservaservicio(idservicio,idreserva,npersonas,subtotal,total)values(?,?,?,?,?)";
                
                ps = conn.prepareStatement(sql);
                ps.setInt(1, detalle.getIdservicio());
                ps.setInt(2, idreserva);
                ps.setInt(3, detalle.getNpersonas());
                ps.setDouble(4, detalle.getSubtotal());
                ps.setDouble(5, detalle.getTotal());
                r=ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return r;
    }
    
    public List<Cita> listares() {
        ArrayList<Cita>list=new ArrayList<>();
        String sql="select * from reserva";
        try {
            conn=cn.conectar();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Cita c = new Cita();
                c.setIdcita(rs.getInt("idreserva"));
                c.setIdcliente(rs.getInt("idcliente"));
                c.setIdtecnico(rs.getInt("idtecnico"));
                c.setIdpago(rs.getInt("idpago"));
                c.setFecha(rs.getString("freserva"));
                c.setMonto(rs.getDouble("monto"));
                c.setEstado(rs.getInt("estado"));                
                list.add(c );
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Cita> listasign(int codigo) {
        ArrayList<Cita>list=new ArrayList<>();
        String sql="select * from reserva where idtecnico="+codigo;
        try {
            conn=cn.conectar();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Cita c = new Cita();
                c.setIdcita(rs.getInt("idreserva"));
                c.setIdcliente(rs.getInt("idcliente"));
                c.setIdtecnico(rs.getInt("idtecnico"));
                c.setIdpago(rs.getInt("idpago"));
                c.setFecha(rs.getString("freserva"));
                c.setMonto(rs.getDouble("monto"));
                c.setEstado(rs.getInt("estado")); 
                
                list.add(c );
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Cita seleccionado(int codigo) {
        Cita c = new Cita();        
        String sql = "select * from reserva where idreserva=?";
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setIdcita(rs.getInt("idreserva"));
                c.setFecha(rs.getString("freserva"));
                c.setMonto(rs.getDouble("monto"));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return c;
    }
    
    public int asignar(int idreserva, int idtecnico) {
        String sql = "UPDATE reserva SET idtecnico=? WHERE idreserva="+idreserva;
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            
            ps.setInt(1, idtecnico);
         
            r=ps.executeUpdate();
            if(r==1){
                return 1;
            }
            else{
                return 0;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return r;
    }
    
    public int quitar(int idreserva) {
        String sql = "UPDATE reserva SET idtecnico=? WHERE idreserva="+idreserva;
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            
            ps.setInt(1, 0);
         
            r=ps.executeUpdate();
            if(r==1){
                return 1;
            }
            else{
                return 0;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return r;
    }
    
    public int marcar(int idreserva) {
        String sql = "UPDATE reserva SET estado=? WHERE idreserva="+idreserva;
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            
            ps.setInt(1, 1);
         
            r=ps.executeUpdate();
            if(r==1){
                return 1;
            }
            else{
                return 0;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return r;
    }
}
