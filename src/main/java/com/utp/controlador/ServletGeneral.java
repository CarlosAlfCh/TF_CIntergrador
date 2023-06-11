package com.utp.controlador;

import com.utp.entidad.Usuario;
import com.utp.modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletGeneral", urlPatterns = {"/ServletGeneral"})
public class ServletGeneral extends HttpServlet {
    
    Usuario user = new Usuario();
    UsuarioDAO userdao = new UsuarioDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int resp=0;
        String metodo = request.getParameter("metodo");
        
        if(metodo.equals("adduser"))
        {
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
            user.setContrasena(contrasena);

            resp = userdao.insertar(user); 
            System.out.println(resp);
            request.getRequestDispatcher("#").forward(request, response); 
        }else 
            if(metodo.equals("eliminar"))
            {
                
            }
        
        System.out.println(resp);
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
