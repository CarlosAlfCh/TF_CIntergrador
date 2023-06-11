package com.utp.controlador;

import com.utp.entidad.Cliente;
import com.utp.entidad.Usuario;
import com.utp.modelo.ClienteDAO;
import com.utp.modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletValida", urlPatterns = {"/ServletValida"})
public class ServletValida extends HttpServlet {
        Usuario user = new Usuario();
        UsuarioDAO userdao = new UsuarioDAO();
        Cliente cliente = new Cliente();
        ClienteDAO clienteDAO = new ClienteDAO();
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String metodo = request.getParameter("metodo");       

        if(metodo.equals("loguear"))
        {
            String correo = request.getParameter("txtcorreo");
            String contrasena = request.getParameter("txtcontrasena");
            user=userdao.validar(correo, contrasena);
            List<Usuario> lista = userdao.listar();
            System.out.println(user.getCodigo());
            System.out.println(user.getNombres());
            System.out.println(user.getRol());
            if(user.getCorreo()!=null && user.getRol()!=4){
                request.setAttribute("usuario", user);
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("Control/principal.jsp").forward(request, response);                 
            } else {
                if(user.getRol()==4){
                    request.setAttribute("cliente", user);
                    request.getRequestDispatcher("index.jsp").forward(request, response); 
                    System.out.println(user.getNombres());
                }else{
                    request.getRequestDispatcher("login.jsp").forward(request, response); 
                }                
            }            
        }
        else 
            if(metodo.equals("registrar"))
            {
                String nombres = request.getParameter("txtnombres");
                String apelpat = request.getParameter("txtapelpat");
                String apelmat = request.getParameter("txtapelmat");
                String correo = request.getParameter("txtcorreo");
                String contrasena = request.getParameter("txtcontrasena");
                cliente.setNombres(nombres);
                cliente.setApepat(apelpat);
                cliente.setApemat(apelmat);
                cliente.setCorreo(correo);
                cliente.setContrasena(contrasena);
                
                int resp = clienteDAO.insertar(cliente); 
                System.out.println(resp);
                request.setAttribute("cliente", cliente);
                request.getRequestDispatcher("index.jsp").forward(request, response);                 
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

}
