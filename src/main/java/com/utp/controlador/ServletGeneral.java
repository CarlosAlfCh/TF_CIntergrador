package com.utp.controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.utp.entidad.Cita;
import com.utp.entidad.Cliente;
import com.utp.entidad.Servicio;
import com.utp.entidad.Reserva;
import com.utp.modelo.ServicioDAO;
import com.utp.modelo.ReservaDAO;
import com.utp.modelo.PagoDAO;

/**
 *
 * @author LENOVO
 */

public class ServletGeneral extends HttpServlet {

    Servicio serv = new Servicio();
    ServicioDAO servdao = new ServicioDAO();
    
    List<Reserva> listaReservas = new ArrayList<>();
    Reserva res;
    int item=0;
    double totalPagar = 0.0;
    int npersonas=1;
    int idserv;
    int cantidad;
    int idpago;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        
        try {
            if(menu!=null){
                switch (menu) {
                    case "pay":
                        System.out.println("Pago $-$");
                        pagar(request, response);
                        System.out.println("Pago $v$");
                        break;
                    case "buy":
                        System.out.println("Reserva $-$");
                        generarcita(request, response);
                        System.out.println("Reserva $v$");
                        break;
                    case "usuario":
                        switch (accion) {
                            case "logout":
                                if(request.getSession().getAttribute("cliente")!=null){
                                    System.out.println(request.getSession().getAttribute("cliente"));
                                    request.getSession().removeAttribute("cliente");
                                    listaReservas = new ArrayList<>();
                                    idpago=0;
                                    request.setAttribute("codpago", idpago);
                                    request.setAttribute("cart", listaReservas);
                                    response.sendRedirect("login.jsp");
                                }else{
                                    response.sendRedirect("index.jsp");
                                }
                                System.out.println("log out??");
                                break;
                            default:
                                System.out.println("No se pudo usuario:C");
                        }
                        break;
                    case "carrito":
                        switch (accion) {
                            case "comprar":
                                reservar(request, response);
                                System.out.println("Compro??");
                                break;
                            case "agregar":
                                agregarservicio(request, response);
                                System.out.println("Agrego al carrito??");
                                break;
                            case "ver":
                                vereserva(request, response);
                                System.out.println("se ve el carrito??");                                
                                break;
                            case "eliminar":
                                eliminar(request, response);
                                System.out.println("Elimino reserva??");                                 
                                break;
                            case "volver":
                                request.setAttribute("cont", listaReservas.size());
                                request.getRequestDispatcher("index.jsp").forward(request, response);
                                System.out.println("Volvio??");                                
                                break;
                            case "generarcita":
                                generarcita(request, response);
                                break;
                            case "add":
                                mas(request, response);
                                System.out.println("+");
                                break;
                            case "quita":
                                menos(request, response);
                                System.out.println("-");
                                break;
                            default:
                                System.out.println("No se pudo la reserva :C");
                        }
                        break;
                    default:
                        System.out.println("Tiempo Agotado cita :C");
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

    private void reservar(HttpServletRequest request, HttpServletResponse response)throws Exception{
        totalPagar=0.0;
        idserv = Integer.parseInt(request.getParameter("id"));
        serv=servdao.seleccionado(idserv);
        item=item+1;
        res = new Reserva();
        res.setItem(item); 
        res.setIdservicio(serv.getIdservicio());
        res.setNombre(serv.getNomserv());
        res.setDescripcion(serv.getDescripcion());
        res.setSubtotal(serv.getPrecio());
        res.setNpersonas(npersonas);
        res.setTotal(npersonas*serv.getPrecio());
        listaReservas.add(res);
        
        for (int i = 0; i < listaReservas.size(); i++) {
            totalPagar=totalPagar+listaReservas.get(i).getTotal();
        }
        request.setAttribute("codpago", idpago);
        request.setAttribute("totalpagar", totalPagar);
        request.setAttribute("cart", listaReservas);
        request.setAttribute("cont", listaReservas.size());
        request.getRequestDispatcher("orders.jsp").forward(request, response); 
        System.out.println("Compro??");
    }
    private void agregarservicio(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int pos = 0;
        cantidad=1;
        idserv = Integer.parseInt(request.getParameter("id"));
        serv=servdao.seleccionado(idserv);

        if(!listaReservas.isEmpty()){
            for (int i = 0; i < listaReservas.size(); i++) {
                if(idserv==listaReservas.get(i).getIdservicio()){
                    pos=i;
                }
            } 
            if(idserv==listaReservas.get(pos).getIdservicio()){
                cantidad=listaReservas.get(pos).getNpersonas()+cantidad;
                double total=listaReservas.get(pos).getSubtotal()*cantidad;
                listaReservas.get(pos).setNpersonas(cantidad);
                listaReservas.get(pos).setTotal(total);
            }else{
                item=item+1;
                res = new Reserva();
                res.setItem(item); 
                res.setIdservicio(serv.getIdservicio());
                res.setNombre(serv.getNomserv());
                res.setDescripcion(serv.getDescripcion());
                res.setSubtotal(serv.getPrecio());
                res.setNpersonas(npersonas);
                res.setTotal(npersonas*serv.getPrecio());
                listaReservas.add(res);
            }                                  
        }else{
            item=item+1;
            res = new Reserva();
            res.setItem(item); 
            res.setIdservicio(serv.getIdservicio());
            res.setNombre(serv.getNomserv());
            res.setDescripcion(serv.getDescripcion()); 
            res.setSubtotal(serv.getPrecio());
            res.setNpersonas(npersonas);
            res.setTotal(npersonas*serv.getPrecio());
            listaReservas.add(res);
        }                                
        request.setAttribute("cont", listaReservas.size());
        request.getRequestDispatcher("index.jsp").forward(request, response);
        System.out.println(res.getNombre());
        System.out.println(listaReservas.size());
    }
    private void vereserva(HttpServletRequest request, HttpServletResponse response)throws Exception{
        totalPagar=0.0;
        request.setAttribute("cart", listaReservas);
        for (int i = 0; i < listaReservas.size(); i++) {
            totalPagar=totalPagar+listaReservas.get(i).getTotal();
        }
        request.setAttribute("totalpagar", totalPagar);
        request.setAttribute("codpago", idpago);
        request.getRequestDispatcher("orders.jsp").forward(request, response); 
    }    
    private void eliminar(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int id = Integer.parseInt(request.getParameter("idserv"));
        for (int i = 0; i < listaReservas.size(); i++) {
            if(listaReservas.get(i).getIdservicio()==id){
                listaReservas.remove(i);
            }
        }   
        
        System.out.println(request.getSession().getAttribute("clien"));
        
        totalPagar = 0.0;
        for (Reserva reserva : listaReservas) {
            totalPagar += reserva.getTotal();
        }
        request.setAttribute("codpago", idpago);
        request.setAttribute("totalpagar", totalPagar);
        request.setAttribute("cart", listaReservas);
        request.setAttribute("cont", listaReservas.size());
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
    private void mas(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int posicion = -1;
        cantidad = 1;
        int idServicio = Integer.parseInt(request.getParameter("id"));

        for (int i = 0; i < listaReservas.size(); i++) {
            if (idServicio == listaReservas.get(i).getIdservicio()) {
                posicion = i;
                break;  // Se encontró la coincidencia, se puede salir del bucle
            }
        }

        if (posicion != -1) {
            cantidad += listaReservas.get(posicion).getNpersonas();
            double total = listaReservas.get(posicion).getSubtotal() * cantidad;
            listaReservas.get(posicion).setNpersonas(cantidad);
            listaReservas.get(posicion).setTotal(total);
        }

        totalPagar = 0.0;
        for (Reserva reserva : listaReservas) {
            totalPagar += reserva.getTotal();
        }

        request.setAttribute("codpago", idpago);
        request.setAttribute("cart", listaReservas);
        request.setAttribute("totalpagar", totalPagar);
        request.setAttribute("cont", listaReservas.size());
        System.out.println(res.getNombre());
        System.out.println(listaReservas.size());
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
    private void menos(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int posicion = -1;
        cantidad = 1;
        int idServicio = Integer.parseInt(request.getParameter("id"));

        for (int i = 0; i < listaReservas.size(); i++) {
            if (idServicio == listaReservas.get(i).getIdservicio()) {
                posicion = i;
                break;  // Se encontró la coincidencia, se puede salir del bucle
            }
        }

        if (posicion != -1) {            
            cantidad = listaReservas.get(posicion).getNpersonas() - cantidad;
            double total = listaReservas.get(posicion).getTotal() - listaReservas.get(posicion).getSubtotal() ;
            listaReservas.get(posicion).setNpersonas(cantidad);
            listaReservas.get(posicion).setTotal(total);            
        }

        totalPagar = 0.0;
        for (Reserva reserva : listaReservas) {
            totalPagar += reserva.getTotal();
        }
        
        request.setAttribute("codpago", idpago);
        request.setAttribute("cart", listaReservas);
        request.setAttribute("totalpagar", totalPagar);
        request.setAttribute("cont", listaReservas.size());
        System.out.println(res.getNombre());
        System.out.println(listaReservas.size());
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
    
    private void pagar(HttpServletRequest request, HttpServletResponse response)throws Exception{
        PagoDAO pagoDAO = new PagoDAO();
        
        String cod = request.getParameter("codi");
        String metodo = request.getParameter("forma");
        String fecha = request.getParameter("factual");
        
        idpago=pagoDAO.insertpago(cod, metodo,fecha);
        
        request.setAttribute("codpago", idpago);
        request.setAttribute("cart", listaReservas);
        request.setAttribute("totalpagar", totalPagar);
        request.setAttribute("cont", listaReservas.size());
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
    
    private void generarcita(HttpServletRequest request, HttpServletResponse response)throws Exception{
        System.out.println("entre generar");
        
        String fecha = request.getParameter("txtfecha");
        int codcli = Integer.parseInt(request.getParameter("code"));

        Cita cita = new Cita();
        
        cita.setIdcliente(codcli);
        cita.setIdpago(idpago);
        cita.setFecha(fecha);
        cita.setDetallereserva(listaReservas);
        cita.setMonto(totalPagar);
        if(totalPagar>0){
            ReservaDAO reservaDAO = new ReservaDAO();
            int r = reservaDAO.GenerarCita(cita);
            
            listaReservas = new ArrayList<>();
            idpago=0;
            request.setAttribute("codpago", idpago);
            request.setAttribute("cart", listaReservas);
            if(r!=0){
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            
        }else{
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
