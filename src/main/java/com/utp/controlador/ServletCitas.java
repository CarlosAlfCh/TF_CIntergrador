package com.utp.controlador;


import com.utp.entidad.Cita;
import com.utp.entidad.Cliente;
import com.utp.entidad.Detalle;
import com.utp.entidad.Servicio;
import com.utp.entidad.Reserva;
import com.utp.entidad.Usuario;
import com.utp.modelo.DetallesDAO;
import com.utp.modelo.ServicioDAO;
import com.utp.modelo.ReservaDAO;
import com.utp.modelo.PagoDAO;
import com.utp.modelo.UsuarioDAO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 *
 * @author LENOVO
 */

public class ServletCitas extends HttpServlet {
    Servicio serv = new Servicio();
    ServicioDAO servdao = new ServicioDAO();
    PagoDAO pagodao = new PagoDAO();
    ReservaDAO resedao = new ReservaDAO();
    Usuario user = new Usuario();
    UsuarioDAO userdao = new UsuarioDAO();
    DetallesDAO detdao = new DetallesDAO();
    Cita cit = new Cita();
    
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
                    case "vb":
                        validar(request, response);
                        System.out.println("Verificado");
                        break;
                    case "error":
                        errorvalidar(request, response);
                        System.out.println("Invalidado");
                        break;
                    case "listar":
                        //List listserv = servdao.listar();
                        List listpago = pagodao.listar();
                        request.setAttribute("pagos", listpago);
                        request.getRequestDispatcher("VMPagos.jsp").forward(request, response);
                        System.out.println("Verificado");
                        break;
                    case "pay":
                        validado(request, response);
                        System.out.println("Pago $v$");
                        break;
                    case "cita":
                        switch (accion) {
                            case "agregar":
                                
                                System.out.println("Agrego a cita");
                                break;
                            case "eliminar":
                                
                                System.out.println("Elimino servicio");                                 
                                break;
                            case "generarcita":
                                
                                break;
                            case "mas":
                                
                                System.out.println("+");
                                break;
                            case "menos":
                                
                                System.out.println("-");
                                break;
                            default:
                                System.out.println("No se pudo Admin :C");
                        }
                        break;
                    case "asigna":
                        switch (accion) {
                            case "agregar":
                                assing(request, response);
                                System.out.println("Agrego tecnico");
                                break;
                            case "borrar":
                                eraser(request, response);
                                System.out.println("Elimino tecnico");                                 
                                break;
                            case "select":
                                seleccion(request, response);
                                System.out.println("Select reserva");                                 
                                break;
                            case "ver":
                                vereser(request, response);
                                System.out.println("Viendo reservas");
                                break;
                            case "info":
                                inforeser(request, response);
                                System.out.println("Miami me lo confirmo");
                                break;
                            case "realizado":
                                okconsigna(request, response);
                                System.out.println("consigna ok");
                                break;
                            default:
                                System.out.println("No se pudo Asignar :C");
                        }
                        break;
                    case "exportarReporteCitas":
                                this.exportarReporteCitas(request, response);
                                break;
                    default:
                        System.out.println("Tiempo Agotado :C");
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

    private void validar(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int idpago = Integer.parseInt(request.getParameter("idpago"));
        System.out.println(idpago);
        pagodao.pagovalido(idpago);
        request.getRequestDispatcher("ServletCitas?menu=listar").forward(request, response);
        System.out.println("Ok valido");
    }
    private void errorvalidar(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int idpago = Integer.parseInt(request.getParameter("idpago"));
        System.out.println(idpago);
        pagodao.pagoinvalido(idpago);
        request.getRequestDispatcher("ServletCitas?menu=listar").forward(request, response);
        System.out.println("Ok valido");
    }
    private void eraser(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int idreserva = Integer.parseInt(request.getParameter("id"));
        System.out.println(idreserva);
        resedao.quitar(idreserva);
        request.getRequestDispatcher("VMAsignar.jsp").forward(request, response);
        System.out.println("lo borre :>");
    }
    private void seleccion(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int idreserva = Integer.parseInt(request.getParameter("id"));
        System.out.println(idreserva);
        cit = resedao.seleccionado(idreserva);
        System.out.println(cit.getFecha());
        List listdet = detdao.listar(idreserva);
        request.setAttribute("detalles", listdet); 
        List listec = userdao.listar();        
        request.setAttribute("tecnicos", listec); 
        request.setAttribute("select", cit);
        request.getRequestDispatcher("ModAsignar.jsp").forward(request, response);
        System.out.println("lo seleccione :|");
    }
    private void assing(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int idreserva = Integer.parseInt(request.getParameter("idres"));
        int idtecnico = Integer.parseInt(request.getParameter("idtec"));
        System.out.println(idtecnico);
        resedao.asignar(idreserva, idtecnico);
        request.getRequestDispatcher("VMAsignar.jsp").forward(request, response);
        System.out.println("lo agregue :<");
    }
    private void vereser(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int idtecnico = Integer.parseInt(request.getParameter("idtecnic"));
        List listres = detdao.listconsigna(idtecnico);
        request.setAttribute("veres", listres);        
        request.getRequestDispatcher("VTAsignacion.jsp").forward(request, response);
        System.out.println("lo ves ;>");
    }
    private void inforeser(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int idreserva = Integer.parseInt(request.getParameter("id"));
        System.out.println(idreserva);
        cit = resedao.seleccionado(idreserva);
        System.out.println(cit.getFecha());
        List listdet = detdao.listar(idreserva);
        request.setAttribute("detalles", listdet);  
        request.setAttribute("select", cit);
        request.getRequestDispatcher("VTView.jsp").forward(request, response);
        System.out.println("Miami :|");
    }
    private void okconsigna(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int idtecnico = Integer.parseInt(request.getParameter("idtecnic"));
        int idreserva = Integer.parseInt(request.getParameter("id"));
        System.out.println(idreserva);
        resedao.marcar(idreserva);
        List listres = detdao.listconsigna(idtecnico);
        request.setAttribute("veres", listres);
        request.getRequestDispatcher("VTAsignacion.jsp").forward(request, response);
        System.out.println("oki uwu :|");
    }
    
    private void validado(HttpServletRequest request, HttpServletResponse response)throws Exception{
        String correo = request.getParameter("correo");
        String idpago = request.getParameter("id");
        String metodo = request.getParameter("metodo");
        String fecha = request.getParameter("fecha");
        int r = pagodao.enviaMail(correo, idpago, metodo, fecha);
        System.out.println(r);
        request.getRequestDispatcher("ServletCitas?menu=listar").forward(request, response);
    }

    private void exportarReporteCitas(HttpServletRequest request, HttpServletResponse response)  throws
    ServletException, IOException
    {
        ServletOutputStream out = response.getOutputStream();
        try {
            InputStream logoEmpresa = this.getServletConfig()
                    .getServletContext()
                    .getResourceAsStream("Reportes/img/logo_1.png"),
                    
                    reporteCita = this.getServletConfig()
                            .getServletContext()
                            .getResourceAsStream("Reportes/reporte_ventas.jasper");
            if (logoEmpresa != null && reporteCita != null) {
                String jsonCitas = request.getParameter("lista"); //OJO
                Gson gson = new Gson();
                List<Cita> reportesCita = new ArrayList<>();
                List<Cita> reportesCita2 = new ArrayList<>();

                reportesCita.add(new Cita());
                reportesCita2 = gson.fromJson(jsonCitas, new TypeToken<List<Cita>>() {
                }.getType());
                reportesCita.addAll(reportesCita2);

                JasperReport report = (JasperReport) JRLoader.loadObject(reporteCita);
                JRBeanArrayDataSource ds = new JRBeanArrayDataSource(reportesCita.toArray());

                Map<String, Object> parameters = new HashMap();
                parameters.put("ds", ds);
                parameters.put("logoEmpresa", logoEmpresa);
                response.setContentType("application/pdf");
                response.addHeader("Content-disposition", "inline; filename=reporte_ventas.pdf");
                JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameters, ds);
                JasperExportManager.exportReportToPdfStream(jasperPrint, out);
                out.flush();
                out.close();
            } else {
                response.setContentType("text/plain");
                out.println("no se pudo generar el reporte");
                out.println("esto puede debrse a que la lista de datos no fue recibida o el archivo plantilla del reporte no se ha encontrado");
                out.println("contacte a soporte");
            }
        } catch (Exception e) {
            response.setContentType("text/plain");
            out.print("ocurrió un error al intentar generar el reporte:" + e.getMessage());
            e.printStackTrace();
        }
    }
}
