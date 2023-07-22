package com.utp.controlador;

import com.utp.entidad.Cliente;
import com.utp.entidad.Usuario;
import com.utp.modelo.ClienteDAO;
import com.utp.modelo.ReservaDAO;
import com.utp.modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletValida", urlPatterns = {"/ServletValida"})
public class ServletValida extends HttpServlet {
        Usuario user = new Usuario();
        UsuarioDAO userdao = new UsuarioDAO();
        Cliente cliente = new Cliente();
        ClienteDAO clienteDAO = new ClienteDAO();
        ReservaDAO reservadao = new ReservaDAO();
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String metodo = request.getParameter("metodo");       

        try {
            if(metodo!=null){
                switch (metodo) {
                    case "loguear":
                        verificar(request, response);
                        break;
                    case "registrar":
                        regristrarse(request, response);
                        break;
                    case "enviar":
                        envia(request, response);
                        break;
                    case "recuperar":
                        restablece(request, response);
                        break;
                    case "exit":
                        logout(request, response);
                        break;
                    default:
                        System.out.println("Tiempo agotado :C");
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

    private void verificar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String correo = request.getParameter("txtcorreo");
        String contrasena = request.getParameter("txtcontrasena");
        user=userdao.validar(correo, contrasena);
        System.out.println(user.getCodigo());
        System.out.println(user.getNombres());
        System.out.println(user.getRol()); 
        
        if(user.getCorreo()!=null && user.getRol()!=4){
            List listres = reservadao.listasign(user.getCodigo());
            int ms = listres.size();
            request.getSession().setAttribute("usuario", user);
            request.getSession().setAttribute("asig", listres);            
            request.getSession().setAttribute("msj", ms);            
            System.out.println(user.getNombres());
            request.getRequestDispatcher("Controlador?menu=principal").forward(request, response);   
        } else {
            if(user.getRol()==4){
                request.getSession().setAttribute("cliente", user);
                System.out.println(user.getNombres());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }else{
                request.setAttribute("msj", "Clave o Contraseña incorrecta");
                request.getRequestDispatcher("login.jsp").forward(request, response); 
            }                
        }
    }
    
    private void regristrarse(HttpServletRequest request, HttpServletResponse response)throws Exception{
        HttpSession sesion;
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
        cliente.setNombres(nombres);
        cliente.setApepat(apelpat);
        cliente.setApemat(apelmat);
        cliente.setDni(dni);
        cliente.setTelefono(telefono);
        cliente.setFNacimiento(fecha);
        cliente.setDireccion(direccion);
        cliente.setDistrito(distrito);
        cliente.setCorreo(correo);
        cliente.setContrasena(contrasena);
        int resp = clienteDAO.insertar(cliente); 
        System.out.println(resp);
        request.setAttribute("cliente", cliente);
        System.out.println("Hola :)");
        sesion = request.getSession();
        sesion.setAttribute("cliente", cliente);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    private void logout(HttpServletRequest request, HttpServletResponse response)throws Exception{
        if(request.getSession().getAttribute("cliente")!=null){
            System.out.println(request.getSession().getAttribute("cliente"));
            request.getSession().removeAttribute("cliente");
            response.sendRedirect("login.jsp");
        }else{
            response.sendRedirect("index.jsp");
        }
        System.out.println("log out??");
    }
    
    private void envia(HttpServletRequest request, HttpServletResponse response)throws Exception{
        String correo = request.getParameter("correo");
        int resp = userdao.enviar(correo);
        request.getRequestDispatcher("RContra.jsp").forward(request, response);
        System.out.println("a restablecer");
    }
    
    private void restablece(HttpServletRequest request, HttpServletResponse response)throws Exception{
        String clave = request.getParameter("clave");
        String pass = request.getParameter("txtcontrasena");
        int resp = userdao.recuperar(clave, pass);
        request.getRequestDispatcher("login.jsp").forward(request, response);
        System.out.println("OKs");
    }
}
