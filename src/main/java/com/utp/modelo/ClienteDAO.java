package com.utp.modelo;

import com.utp.entidad.Cliente;
import com.utp.util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO implements CRUD<Cliente>{
    Conexion cn = new Conexion();
    Connection conn= null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    @Override
    public List<Cliente> listar() {
        ArrayList<Cliente> listaClientes = new ArrayList<>();
        String sql ="select * from persona";
        try 
        {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
            	Cliente cliente = new Cliente();
                cliente.setCodigo(rs.getInt("codigo"));
                cliente.setNombres(rs.getString("nombres"));
                cliente.setApepat(rs.getString("apelpat"));
                cliente.setApemat(rs.getString("apelmat"));
                cliente.setDni(rs.getString("dni"));
                cliente.setCorreo(rs.getString("correo"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setContrasena(rs.getString("contrasena"));
                cliente.setFNacimiento(rs.getString("fnacimiento"));
                cliente.setEstado(rs.getInt("estado"));
                cliente.setRol(rs.getInt("idrol"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setDistrito(rs.getString("distrito"));

                listaClientes.add(cliente);
            }
        } catch (Exception e){	
            System.out.println(e.toString());
        }        
        return listaClientes;
    }

    @Override
    public int insertar(Cliente nuevo) {
        int r=0;
        String sql = "insert into persona (nombres,apelpat,apelmat,dni,correo,telefono,contrasena,fnacimiento,estado,idrol,direccion,distrito) values (?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, nuevo.getNombres());
            ps.setString(2, nuevo.getApepat());
            ps.setString(3, nuevo.getApemat());
            ps.setString(4, nuevo.getDni());
            ps.setString(5, nuevo.getCorreo());
            ps.setString(6, nuevo.getTelefono());
            ps.setString(7, nuevo.getContrasena());
            ps.setString(8, nuevo.getFNacimiento());
            ps.setInt(9, 1);
            ps.setInt(10, 4);
            ps.setString(11, nuevo.getDireccion());
            ps.setString(12, nuevo.getDistrito());         
            r=ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
            System.out.println(r);
        }
        return r;
    }

    public Cliente seleccionado(int codigo) {
        Cliente cliente = new Cliente();        
        String sql = "select * from persona where codigo=?";
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            while (rs.next()) {
                cliente.setCodigo(rs.getInt("codigo"));
                cliente.setNombres(rs.getString("nombres"));
                cliente.setApepat(rs.getString("apelpat"));
                cliente.setApemat(rs.getString("apelmat"));
                cliente.setDni(rs.getString("dni"));
                cliente.setTelefono(rs.getString("telefono"));;
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setCorreo(rs.getString("correo"));
                cliente.setContrasena(rs.getString("contrasena"));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return cliente;
    }
    
    @Override
    public int modificar(Cliente modificado) {
        int r=0;
        int mod = modificado.getCodigo();
        
        String sql = "UPDATE persona SET nombres=?,apelpat=?,apelmat=?,dni=?,correo=?,telefono=?,contrasena=?,fnacimiento=?,estado=?,idrol=?,direccion=?,distrito=? WHERE codigo="+mod;
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, modificado.getNombres());
            ps.setString(2, modificado.getApepat());
            ps.setString(3, modificado.getApemat());
            ps.setString(4, modificado.getDni());
            ps.setString(5, modificado.getCorreo());
            ps.setString(6, modificado.getTelefono());
            ps.setString(7, modificado.getContrasena());
            ps.setString(8, modificado.getFNacimiento());
            ps.setInt(9, 1);
            ps.setInt(10, 4);
            ps.setString(11, modificado.getDireccion());
            ps.setString(12, modificado.getDistrito());
         
            r=ps.executeUpdate();
            if(r==1){
                return 1;
            }
            else{
                return 0;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return r;
    }

    @Override
    public int eliminar(int eliminado) {
        int r=0;
        String sql="UPDATE persona SET estado=? WHERE codigo="+eliminado;        
        
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
            System.out.println(e.toString());
        }  
        return r;
    }
    
    public int activar(int activado) {
        int r=0;
        String sql="UPDATE persona SET estado=? WHERE codigo="+activado;        
        
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
            System.out.println(e.toString());
        }  
        System.out.println("Ingrese?? "+activado);
        return r;
    }
    
}
