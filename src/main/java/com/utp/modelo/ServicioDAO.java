package com.utp.modelo;

import com.utp.entidad.Servicio;
import com.utp.util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ServicioDAO implements CRUD<Servicio>{
    Conexion cn = new Conexion();
    Connection conn= null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    @Override
    public List<Servicio> listar() {
        ArrayList<Servicio> listaServicios = new ArrayList<>();
        String sql ="select * from servicio";
        try 
        {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
            	Servicio servicio = new Servicio();
                servicio.setIdservicio(rs.getInt("idservicio"));
                servicio.setNomserv(rs.getString("nomserv"));
                servicio.setDescripcion(rs.getString("descripcion"));
                servicio.setTurno(rs.getString("turno"));
                servicio.setPrecio(rs.getDouble("precio"));
                servicio.setIdtipo(rs.getInt("idtipo"));
                servicio.setImagen(rs.getString("imagen"));
                servicio.setEstadoserv(rs.getInt("estadoserv"));
                servicio.setDuracion(rs.getString("duracion"));

                listaServicios.add(servicio);
            }
        } catch (Exception e){	
            System.out.println(e.toString());
        }        
        return listaServicios;
    } 

    @Override
    public int insertar(Servicio nuevo) {
        int r=0;
        String sql = "INSERT INTO servicio(nomserv, descripcion, turno, precio, idtipo, imagen, estadoserv, duracion) VALUES (?,?,?,?,?,?,?,?)";
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, nuevo.getNomserv());
            ps.setString(2, nuevo.getDescripcion());
            ps.setString(3, nuevo.getTurno());
            ps.setDouble(4, nuevo.getPrecio());
            ps.setInt(5, nuevo.getIdtipo());
            ps.setString(6, nuevo.getImagen());
            ps.setInt(7, 1);
            ps.setString(8, nuevo.getDuracion());
         
            r=ps.executeUpdate();
            if(r==1){
                return 1;
            }
            else{
                return 0;
            }
        } catch (Exception e) {
        }
        return r;
    }

    public Servicio seleccionado(int id) {
        Servicio serv = new Servicio();        
        String sql = "select * from servicio where idservicio=?";
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                serv.setIdservicio(rs.getInt("idservicio"));
                serv.setNomserv(rs.getString("nomserv"));
                serv.setDescripcion(rs.getString("descripcion"));
                serv.setPrecio(rs.getDouble("precio"));
                serv.setImagen(rs.getString("imagen"));
                serv.setDuracion(rs.getString("duracion"));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return serv;
    }
    
    @Override
    public int modificar(Servicio modificado) {
        int r=0;
        int mod = modificado.getIdservicio();
        
        String sql = "UPDATE servicio SET nomserv=?,descripcion=?,turno=?,precio=?,idtipo=?,imagen=?,estadoserv=?,duracion=? WHERE idservicio="+mod;
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, modificado.getNomserv());
            ps.setString(2, modificado.getDescripcion());
            ps.setString(3, modificado.getTurno());
            ps.setDouble(4, modificado.getPrecio());
            ps.setInt(5, modificado.getIdtipo());
            ps.setString(6, modificado.getImagen());
            ps.setInt(7, 1);
            ps.setString(8, modificado.getDuracion());
         
            r=ps.executeUpdate();
            if(r==1){
                return 1;
            }
            else{
                return 0;
            }
        } catch (Exception e) {
        }
        return r;
    }

    @Override
    public int eliminar(int eliminado) {
        int r=0;
        String sql="UPDATE servicio SET estadoserv=? WHERE idservicio="+eliminado;        
        
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);  
            ps.setInt(1,0);
            r=ps.executeUpdate();    
            if(r==1){
                return 1;
            }
            else{
                return 0;
            }
        } catch (Exception e) {
        }  
        return r;
    }
    public int activar(int activado) {
        int r=0;
        String sql="UPDATE servicio SET estadoserv=? WHERE idservicio="+activado;        
        
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);  
            ps.setInt(1,1);
            r=ps.executeUpdate();    
            if(r==1){
                return 1;
            }
            else{
                return 0;
            }
        } catch (Exception e) {
        }  
        return r;
    }
    
}
