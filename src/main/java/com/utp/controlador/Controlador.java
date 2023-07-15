package com.utp.controlador;

import com.utp.entidad.Cliente;
import com.utp.entidad.Servicio;
import com.utp.entidad.Usuario;
import com.utp.modelo.ClienteDAO;
import com.utp.modelo.ServicioDAO;
import com.utp.modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Controlador extends HttpServlet {
        Usuario user = new Usuario();
        UsuarioDAO userdao = new UsuarioDAO();
        Cliente clien = new Cliente();
        ClienteDAO cliendao = new ClienteDAO();
        Servicio serv = new Servicio();
        ServicioDAO servdao = new ServicioDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        try {
            if(menu!=null){
                switch (menu) {
                    case "principal":
                        System.out.println("hola :)");
                        request.getRequestDispatcher("VMInicio.jsp").forward(request, response);
                        break;
                    case "usuario":
                        switch (accion) {
                            case "listar":
                                List lista = userdao.listar();
                                request.setAttribute("usuarios", lista);
                                System.out.println("Listo??");
                                break;
                            case "agregar":
                                adduser(request, response);
                                System.out.println("Agrego??");                                
                                break;
                            case "seleciona":
                                selectuser(request, response);
                                System.out.println("selecciono??");                                
                                break;
                            case "modificar":
                                moduser(request, response);
                                System.out.println("Modifico??");                                
                                break;
                            case "eliminar":
                                deletuser(request, response);
                                System.out.println("Elimino??");                                
                                break;
                            case "activar":
                                activeuser(request, response);
                                System.out.println("Activo??");                                
                                break;
                            default:
                                System.out.println("No se pudo usuario:C");
                        }
                        request.getRequestDispatcher("VMUsuarios.jsp").forward(request, response);
                        break;
                    case "cliente":
                        switch (accion) {
                            case "listar":
                                List lista = cliendao.listar();
                                request.setAttribute("clientes", lista);
                                System.out.println("Listo cliente??");
                                break;
                            case "agregar":
                                addclient(request, response);
                                System.out.println("Agrego cliente??");                                
                                break;
                            case "seleciona":
                                selectclient(request, response);
                                System.out.println("selecciono cliente??");                                
                                break;
                            case "modificar":
                                modclient(request, response);
                                System.out.println("Modifico cliente??");                                
                                break;
                            case "eliminar":
                                deletclient(request, response);
                                System.out.println("Elimino cliente??");                                
                                break;
                            case "activar":
                                activeclient(request, response);
                                System.out.println("Activo cliente??");                                
                                break;
                            default:
                                System.out.println("No se pudo cliente:C");
                        }
                        request.getRequestDispatcher("VMClientes.jsp").forward(request, response);
                        break;
                    case "servicio":
                        switch (accion) {
                            case "listar":
                                List lista = servdao.listar();
                                request.setAttribute("servicios", lista);
                                System.out.println("Listo servicio??");
                                break;
                            case "agregar":
                                addserv(request, response);
                                System.out.println("Agrego servicio??");                                
                                break;
                            case "seleciona":
                                selectserv(request, response);
                                System.out.println("selecciono servicio??");                                
                                break;
                            case "modificar":
                                modserv(request, response);
                                System.out.println("Modifico servicio??");                                
                                break;
                            case "eliminar":
                                deletserv(request, response);
                                System.out.println("Elimino servicio??");                                
                                break;
                            case "activar":
                                activeserv(request, response);
                                System.out.println("Activo servicio??");                                
                                break;
                            default:
                                System.out.println("No se pudo servicio:C");
                        }
                        request.getRequestDispatcher("VMServicios.jsp").forward(request, response);
                        break;
                    case "exit":
                        logout(request, response);
                        break;
                    default:
                        System.out.println("Tiempo Agotado servicio :C");
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
    private void adduser(HttpServletRequest request, HttpServletResponse response)throws Exception{
        String nombres = request.getParameter("txtnombres");
        String apelpat = request.getParameter("txtapelpat");
        String apelmat = request.getParameter("txtapelmat");
        String dni = request.getParameter("txtdni");
        String telefono = request.getParameter("txttelefono");
        String roltex = request.getParameter("txtrol"); 
        int rol = Integer.parseInt(roltex);
        String direccion = request.getParameter("txtdireccion");
        String distrito = request.getParameter("txtdistrito");
        String turno = request.getParameter("txtturno");
        String horario = request.getParameter("txthorario");
        String especialtex = request.getParameter("txtespecial");
        int especial = Integer.parseInt(especialtex);
        String correo = request.getParameter("txtcorreo");
        String contrasena = request.getParameter("txtcontrasena");
        user.setNombres(nombres);
        user.setApepat(apelpat);
        user.setApemat(apelmat);
        user.setDni(dni);
        user.setTelefono(telefono);
        user.setRol(rol);
        user.setDireccion(direccion);
        user.setDistrito(distrito);
        user.setTurno(turno);
        user.setHorario(horario);
        user.setIdespecialidad(especial);
        user.setCorreo(correo);
        user.setEstado(1);
        user.setContrasena(contrasena);
        int resp = userdao.insertar(user);  
        System.out.println("cargado "+resp);
        System.out.println("cargado "+user.getNombres());
        
        request.getRequestDispatcher("Controlador?menu=usuario&accion=listar").forward(request, response);
        System.out.println("Ohh :)");
    }
    private void selectuser(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int cod=Integer.parseInt(request.getParameter("us"));
        System.out.println(cod);
        user=userdao.seleccionado(cod);
        System.out.println(user.getNombres());
        request.setAttribute("modif", user);
        request.getRequestDispatcher("ModUsuario.jsp").forward(request, response);
    }
    private void moduser(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int codigo = Integer.parseInt(request.getParameter("txtcodigo"));
        String nombres = request.getParameter("txtnombres");
        String apelpat = request.getParameter("txtapelpat");
        String apelmat = request.getParameter("txtapelmat");
        String dni = request.getParameter("txtdni");
        String telefono = request.getParameter("txttelefono");
        String roltex = request.getParameter("txtrol"); 
        int rol = Integer.parseInt(roltex);
        String direccion = request.getParameter("txtdireccion");
        String distrito = request.getParameter("txtdistrito");
        String turno = request.getParameter("txtturno");
        String horario = request.getParameter("txthorario");
        String especialtex = request.getParameter("txtespecial");
        int especial = Integer.parseInt(especialtex);
        String correo = request.getParameter("txtcorreo");
        String contrasena = request.getParameter("txtcontrasena");
        user.setCodigo(codigo);
        user.setNombres(nombres);
        user.setApepat(apelpat);
        user.setApemat(apelmat);
        user.setDni(dni);
        user.setTelefono(telefono);
        user.setRol(rol);
        user.setDireccion(direccion);
        user.setDistrito(distrito);
        user.setTurno(turno);
        user.setHorario(horario);
        user.setIdespecialidad(especial);
        user.setCorreo(correo);
        user.setContrasena(contrasena);
        int resp = userdao.modificar(user);
        System.out.println("cargado "+resp);
        System.out.println("cargado "+user.getNombres());
        request.getRequestDispatcher("Controlador?menu=usuario&accion=listar").forward(request, response);
        System.out.println("xd :)");
    }
    private void deletuser(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int cod=Integer.parseInt(request.getParameter("delete"));
        System.out.println(cod);
        userdao.eliminar(cod);
        request.getRequestDispatcher("Controlador?menu=usuario&accion=listar").forward(request, response);
        System.out.println("Niaa :)");
    }
    private void activeuser(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int cod=Integer.parseInt(request.getParameter("active"));
        System.out.println(cod);
        userdao.activar(cod);
        request.getRequestDispatcher("Controlador?menu=usuario&accion=listar").forward(request, response);
        System.out.println("UWU :)");
    }
    
    private void addclient(HttpServletRequest request, HttpServletResponse response)throws Exception{
        String nombres = request.getParameter("txtnombres");
        String apelpat = request.getParameter("txtapelpat");
        String apelmat = request.getParameter("txtapelmat");
        String dni = request.getParameter("txtdni");
        String telefono = request.getParameter("txttelefono"); 
        String fecha = request.getParameter("txtfecha"); 
        String direccion = request.getParameter("txtdireccion");
        String distrito = request.getParameter("txtdistrito");
        String correo = request.getParameter("txtcorreo");
        String contrasena = request.getParameter("txtcontrasena");
        clien.setNombres(nombres);
        clien.setApepat(apelpat);
        clien.setApemat(apelmat);
        clien.setDni(dni);
        clien.setTelefono(telefono);
        clien.setFNacimiento(fecha);
        clien.setDireccion(direccion);
        clien.setDistrito(distrito);
        clien.setCorreo(correo);
        clien.setContrasena(contrasena);
        int resp = cliendao.insertar(clien);  
        System.out.println("cargado "+resp);
        System.out.println("cargado "+clien.getNombres());
        
        request.getRequestDispatcher("Controlador?menu=cliente&accion=listar").forward(request, response);
        System.out.println("Cliente :)");
    }
    private void selectclient(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int cod=Integer.parseInt(request.getParameter("cli"));
        System.out.println(cod);
        clien=cliendao.seleccionado(cod);
        System.out.println(clien.getNombres());
        request.setAttribute("modif", clien);
        request.getRequestDispatcher("ModCliente.jsp").forward(request, response);
    }
    private void modclient(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int codigo = Integer.parseInt(request.getParameter("txtcodigo"));
        String nombres = request.getParameter("txtnombres");
        String apelpat = request.getParameter("txtapelpat");
        String apelmat = request.getParameter("txtapelmat");
        String dni = request.getParameter("txtdni");
        String telefono = request.getParameter("txttelefono");
        String fecha = request.getParameter("txtfecha");
        String direccion = request.getParameter("txtdireccion");
        String distrito = request.getParameter("txtdistrito");
        String correo = request.getParameter("txtcorreo");
        String contrasena = request.getParameter("txtcontrasena");
        clien.setCodigo(codigo);
        clien.setNombres(nombres);
        clien.setApepat(apelpat);
        clien.setApemat(apelmat);
        clien.setDni(dni);
        clien.setTelefono(telefono);
        clien.setFNacimiento(fecha);
        clien.setDireccion(direccion);
        clien.setDistrito(distrito);
        clien.setCorreo(correo);
        clien.setContrasena(contrasena);
        int resp = cliendao.modificar(clien);
        System.out.println("cargado "+resp);
        System.out.println("cargado "+clien.getNombres());
        request.getRequestDispatcher("Controlador?menu=cliente&accion=listar").forward(request, response);
        System.out.println("xd :)");
    }
    private void deletclient(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int cod=Integer.parseInt(request.getParameter("delete"));
        System.out.println(cod);
        cliendao.eliminar(cod);
        request.getRequestDispatcher("Controlador?menu=cliente&accion=listar").forward(request, response);
        System.out.println("OK :)");
    }
    private void activeclient(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int cod=Integer.parseInt(request.getParameter("active"));
        System.out.println(cod);
        cliendao.activar(cod);
        request.getRequestDispatcher("Controlador?menu=cliente&accion=listar").forward(request, response);
        System.out.println("Cliente UWU :)");
    }
    
    private void addserv(HttpServletRequest request, HttpServletResponse response)throws Exception{
        String nombre = request.getParameter("txtnombre");
        String duracion = request.getParameter("txtduracion");
        double precio = Double.parseDouble(request.getParameter("txtprecio"));
        String imagen = request.getParameter("txtimg");
        String turno = request.getParameter("txtturno");
        int tipo = Integer.parseInt(request.getParameter("txtidtipo"));
        String descripcion = request.getParameter("txtdescripcion");
        serv.setNomserv(nombre);
        serv.setDuracion(duracion);
        serv.setPrecio(precio);
        serv.setImagen(imagen);
        serv.setTurno(turno);
        serv.setIdtipo(tipo);
        serv.setDescripcion(descripcion);
        int resp = servdao.insertar(serv);
        System.out.println("cargado "+resp);
        System.out.println("cargado "+serv.getNomserv());
        request.getRequestDispatcher("Controlador?menu=servicio&accion=listar").forward(request, response);
        System.out.println("unu :)");
    }
    private void selectserv(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int cod=Integer.parseInt(request.getParameter("ser"));
        System.out.println(cod);
        serv=servdao.seleccionado(cod);
        System.out.println(serv.getNomserv());
        request.setAttribute("modif", serv);
        request.getRequestDispatcher("ModServicio.jsp").forward(request, response);
    }
    private void modserv(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int id = Integer.parseInt(request.getParameter("txtid"));
        String nombre = request.getParameter("txtnombre");
        String duracion = request.getParameter("txtduracion");
        double precio = Double.parseDouble(request.getParameter("txtprecio"));
        String imagen = request.getParameter("txtimg");
        String turno = request.getParameter("txtturno");
        int tipo = Integer.parseInt(request.getParameter("txtidtipo"));
        String descripcion = request.getParameter("txtdescripcion");
        serv.setIdservicio(id);
        serv.setNomserv(nombre);
        serv.setDuracion(duracion);
        serv.setPrecio(precio);
        serv.setImagen(imagen);
        serv.setTurno(turno);
        serv.setIdtipo(tipo);
        serv.setDescripcion(descripcion);
        int resp = servdao.modificar(serv);
        System.out.println("cargado "+resp);
        System.out.println("cargado "+serv.getNomserv());
        request.getRequestDispatcher("Controlador?menu=servicio&accion=listar").forward(request, response);
        System.out.println("ZZZ");
    }
    private void deletserv(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int cod=Integer.parseInt(request.getParameter("delete"));
        System.out.println(cod);
        servdao.eliminar(cod);
        request.getRequestDispatcher("Controlador?menu=servicio&accion=listar").forward(request, response);
        System.out.println("Waza serv:)");
    }
    private void activeserv(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int cod=Integer.parseInt(request.getParameter("active"));
        System.out.println(cod);
        servdao.activar(cod);
        request.getRequestDispatcher("Controlador?menu=servicio&accion=listar").forward(request, response);
        System.out.println("Servicio UWU :)");
    }
    
    private void logout(HttpServletRequest request, HttpServletResponse response)throws Exception{
        if(request.getSession().getAttribute("usuario")!=null){
            System.out.println(request.getSession().getAttribute("usuario"));
            request.getSession().removeAttribute("usuario");
            request.getSession().removeAttribute("asig");
            request.getSession().removeAttribute("msj");
            response.sendRedirect("login.jsp");
        }else{
            response.sendRedirect("index.jsp");
        }
        System.out.println("log out?? control");
    }
}
