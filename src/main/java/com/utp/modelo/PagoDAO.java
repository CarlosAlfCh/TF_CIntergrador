package com.utp.modelo;

import com.utp.entidad.Pago;
import com.utp.util.Conexion;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class PagoDAO {
    Conexion cn = new Conexion();
    Connection conn= null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    int r = 0;
    public int insertpago(String cod, String metodo, String fecha) {
        Pago id = new Pago();
        String codigo=cod;
        String sql = "INSERT INTO pago(codigo, metodo, fecha, valido) VALUES (?,?,?,?)";
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            if(cod==null||cod.equals("")){
                codigo=CodeGenerator.generateCode();
                ps.setString(1, codigo);
            }else{
                ps.setString(1, cod);
            }            
            ps.setString(2, metodo);            
            ps.setString(3, fecha);            
            ps.setInt(4, 0);            
         
            r=ps.executeUpdate();        
        
            sql = "select * from pago where codigo=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, codigo);
            rs = ps.executeQuery();
            while (rs.next()) {
                r=rs.getInt("idpago"); 
            }
            System.out.println(id.getIdpago());
        } catch (Exception e) {
            System.out.println(e.toString());
        }        
        return r;
    }
    
    public List<Pago> listar() {
        ArrayList<Pago>list=new ArrayList<>();
        String sql="select * from pago";
        try {
            conn=cn.conectar();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Pago pa=new Pago();
                pa.setIdpago(rs.getInt("idpago"));
                pa.setCodigo(rs.getString("codigo"));
                pa.setMetodo(rs.getString("metodo"));
                pa.setFechapago(rs.getString("fecha"));
                pa.setValido(rs.getInt("valido"));
                list.add(pa);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Pago> entrante() {
        ArrayList<Pago>list=new ArrayList<>();
        String sql="select * from pago";
        try {
            conn=cn.conectar();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Pago pa=new Pago();
                int val;
                pa.setIdpago(rs.getInt("idpago"));
                pa.setCodigo(rs.getString("codigo"));
                pa.setMetodo(rs.getString("metodo"));
                pa.setFechapago(rs.getString("fecha"));
                pa.setValido(rs.getInt("valido"));
                val=rs.getInt("valido");
                if(val==0){
                    list.add(pa);                    
                }
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public int pagovalido(int idpago) {
        int r=0;
        String sql="UPDATE pago SET valido=? WHERE idpago="+idpago;        
        
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
        System.out.println("Valido?? "+idpago);
        return r;
    }
    public int pagoinvalido(int idpago) {
        int r=0;
        String sql="UPDATE pago SET valido=? WHERE idpago="+idpago;        
        
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
        System.out.println("Valido?? "+idpago);
        return r;
    }
}
class CodeGenerator {
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final Random RANDOM = new SecureRandom();

    public static String generateCode() {
        StringBuilder code = new StringBuilder(10);
        for (int i = 0; i < 10; i++) {
            code.append(CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length())));
        }
        return code.toString();
    }
}