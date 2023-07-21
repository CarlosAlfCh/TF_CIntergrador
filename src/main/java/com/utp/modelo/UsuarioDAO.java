package com.utp.modelo;

import com.utp.entidad.Usuario;
import com.utp.util.Conexion;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class UsuarioDAO implements CRUD<Usuario> {

    Conexion cn = new Conexion();
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Usuario validar(String correo, String contrasena) {
        Usuario user = new Usuario();
        String sql = "select * from persona where correo=? and contrasena=?";
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();
            while (rs.next()) {
                user.setCodigo(rs.getInt("codigo"));
                user.setCorreo(rs.getString("correo"));
                user.setContrasena(rs.getString("contrasena"));
                user.setNombres(rs.getString("nombres"));
                user.setApepat(rs.getString("apelpat"));
                user.setApemat(rs.getString("apelmat"));
                user.setRol(rs.getInt("idrol"));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return user;
    }

    @Override
    public List<Usuario> listar() {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "select * from persona";
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario user = new Usuario();
                user.setCodigo(rs.getInt("codigo"));
                user.setNombres(rs.getString("nombres"));
                user.setApepat(rs.getString("apelpat"));
                user.setApemat(rs.getString("apelmat"));
                user.setDni(rs.getString("dni"));
                user.setCorreo(rs.getString("correo"));
                user.setTelefono(rs.getString("telefono"));
                user.setContrasena(rs.getString("contrasena"));
                user.setTurno(rs.getString("turno"));
                user.setHorario(rs.getString("horario"));
                user.setEstado(rs.getInt("estado"));
                user.setRol(rs.getInt("idrol"));
                user.setIdespecialidad(rs.getInt("idespecialidad"));
                user.setDireccion(rs.getString("direccion"));
                user.setDistrito(rs.getString("distrito"));
                list.add(user);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public int insertar(Usuario nuevo) {
        int r = 0;
        String sql = "INSERT INTO persona(nombres, apelpat, apelmat, dni, correo, telefono, contrasena, turno, horario, estado, idrol, idespecialidad, direccion, distrito) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            ps.setString(8, nuevo.getTurno());
            ps.setString(9, nuevo.getHorario());
            ps.setInt(10, nuevo.getEstado());
            ps.setInt(11, nuevo.getRol());
            ps.setInt(12, nuevo.getIdespecialidad());
            ps.setString(13, nuevo.getDireccion());
            ps.setString(14, nuevo.getDistrito());

            r = ps.executeUpdate();
            if (r == 1) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
        }
        return r;
    }

    public Usuario seleccionado(int codigo) {
        Usuario user = new Usuario();
        String sql = "select * from persona where codigo=?";
        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            while (rs.next()) {
                user.setCodigo(rs.getInt("codigo"));
                user.setNombres(rs.getString("nombres"));
                user.setApepat(rs.getString("apelpat"));
                user.setApemat(rs.getString("apelmat"));
                user.setDni(rs.getString("dni"));
                user.setTelefono(rs.getString("telefono"));
                user.setHorario(rs.getString("horario"));
                user.setDireccion(rs.getString("direccion"));
                user.setCorreo(rs.getString("correo"));
                user.setContrasena(rs.getString("contrasena"));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return user;
    }

    @Override
    public int modificar(Usuario modificado) {
        int r = 0;
        int mod = modificado.getCodigo();
        String sql = "UPDATE persona SET nombres=?,apelpat=?,apelmat=?,dni=?,correo=?,telefono=?,contrasena=?,turno=?,horario=?,estado=?,idrol=?,idespecialidad=?,direccion=?,distrito=? WHERE codigo=" + mod;

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
            ps.setString(8, modificado.getTurno());
            ps.setString(9, modificado.getHorario());
            ps.setInt(10, 1);
            ps.setInt(11, modificado.getRol());
            ps.setInt(12, modificado.getIdespecialidad());
            ps.setString(13, modificado.getDireccion());
            ps.setString(14, modificado.getDistrito());
            r = ps.executeUpdate();
            if (r == 1) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return r;
    }

    @Override
    public int eliminar(int eliminado) {
        int r = 0;
        String sql = "UPDATE persona SET estado=? WHERE codigo=" + eliminado;

        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, 0);
            r = ps.executeUpdate();
            if (r == 1) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        System.out.println("Ingrese?? " + eliminado);
        return r;
    }

    public int activar(int activado) {
        int r = 0;
        String sql = "UPDATE persona SET estado=? WHERE codigo=" + activado;

        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, 1);
            r = ps.executeUpdate();
            if (r == 1) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        System.out.println("Ingrese?? " + activado);
        return r;
    }

    public int enviar(String correo) throws MessagingException {
        int r = 0;
        String recupera = CodeG.gCode();
        
        enviarCorreo(correo,recupera);
        
        int indiceArroba = correo.indexOf('@');
        if (indiceArroba != -1) {
            correo=correo.substring(0, indiceArroba);
        }
        String sql = "UPDATE persona SET recuperar=? WHERE correo  LIKE '"+correo+"%';";

        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            ps.setString(1, recupera);
            r = ps.executeUpdate();
            if (r == 1) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        System.out.println("Ingrese?? " + correo);
        return r;
    }
    
    public int recuperar(String clave, String pass) {
        int r = 0;
        String sql = "UPDATE persona SET contrasena=? WHERE recuperar="+clave;

        try {
            conn = cn.conectar();
            ps = conn.prepareStatement(sql);
            ps.setString(1, pass);
            r = ps.executeUpdate();
            if (r == 1) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        System.out.println("Cambie?? ");
        return r;
    }
    
    

    private void enviarCorreo(String destinatario, String clave) throws MessagingException {
        final String username = "spautp38@gmail.com";
        final String password = "vgznsmnavtostejk";
        final String host = "smtp.gmail.com";
        final String port = "587";
        final boolean starttls = true;
        final boolean auth = true;

        String asunto = "Restablecer Contraseña - SPAUTP";
        String mensaje = "Su clave para restablecer contraseña es:\n" + clave;

        Properties props = new Properties();
        props.put("mail.smtp.auth", String.valueOf(auth));
        props.put("mail.smtp.starttls.enable", String.valueOf(starttls));
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message email = new MimeMessage(session);
        email.setFrom(new InternetAddress(username));
        email.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
        email.setSubject(asunto);
        email.setText(mensaje);

        Transport.send(email);
    }

}

class CodeG {

    private static final String CHARACTERS = "0123456789";
    private static final Random RANDOM = new SecureRandom();

    public static String gCode() {
        StringBuilder code = new StringBuilder(5);
        for (int i = 0; i < 5; i++) {
            code.append(CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length())));
        }
        return code.toString();
    }
}
