<%-- 
    Document   : index
    Created on : 10 jun. 2023, 10:27:23
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.utp.entidad.Servicio"%>
<%@page import="com.utp.modelo.ServicioDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SPAUTP</title>
    </head>
    <jsp:include page="includes/header.jsp"></jsp:include>
        <body>        
            <!-- Page Header Start --> 
        <c:if test="${cliente.estado != null}"> 
            <jsp:include page="includes/navbar.jsp"></jsp:include>
        </c:if>    
        <!-- Page Header End -->    

        <!-- Carrousel Nav Bar Start -->
        <c:if test="${cliente.estado == null}">
            <div id="carousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel" data-slide-to="1"></li>
                    <li data-target="#carousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="src/img/masaje4.jpg" alt="Carousel Image">
                        <div class="carousel-caption">
                            <h1 class="animated fadeInLeft">Confía en nuestras manos, déjate consentir</h1>
                            <p class="animated fadeInRight">Reserva tu cita</p>
                            <ul style="list-style-type:none;">
                                <li class="nav-item nav-link active" style="float:left;"><a class="btn animated fadeInUp" href="Vistas/atencion.jsp" >Consulte aqui</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="carousel-item">  
                        <img src="src/img/choc0.jpg" alt="Carousel Image">
                        <div class="carousel-caption">
                            <h1 class="animated fadeInLeft">Inhala la tranquilidad, exhala los problemas. </h1>
                            <p class="animated fadeInRight">Reserva tu cita</p>
                            <ul style="list-style-type:none;">
                                <li class="nav-item nav-link active" style="float:left;"><a class="btn animated fadeInUp" href="Vistas/atencion.jsp" >Consulte aqui</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="src/img/masaje1.jpg" alt="Carousel Image">
                        <div class="carousel-caption">
                            <h1 class="animated fadeInLeft">Saca a relucir tu belleza interna</h1>
                            <p class="animated fadeInRight">Reserva tu cita</p>
                            <ul style="list-style-type:none;">
                                <li class="nav-item nav-link active" style="float:left;"><a class="btn animated fadeInUp" href="Vistas/atencion.jsp" >Consulte aqui</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>            
        </c:if>
        <!-- Carrousel Nav Bar End --> 

        <!-- Team Start (Team Teacher of Student)-->
        <div class="team">
            <div class="container"> 
                <div class="row"> 
                    <%  ServicioDAO serdao = new ServicioDAO();
                        List<Servicio> listser = serdao.listar();
                        if (listser != null) {
                            for (Servicio servicio : listser) {
                    %>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                        <div class="team-item">
                            <div class="team-img">
                                <img src="src/img/<%= servicio.getImagen()%>" alt="Team Image" width="150" height="250">
                            </div>
                            <div class="team-text">
                                <h2><%= servicio.getNomserv()%></h2>
                                <p>Tiempo : <%= servicio.getDuracion()%> horas</p>
                                <p>Precio: S/ <%= servicio.getPrecio()%></p>
                            </div>                             
                            <c:if test="${cliente.estado == null}"> 
                                <div class="team-social">
                                    <a class="social-in" href="login.jsp"><i class="fa fa-calendar"></i>&nbsp;&nbsp;&nbsp;Agregar a cita</a>
                                    <a class="social-in" href="login.jsp"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Reservar ahora</a>
                                </div>
                            </c:if>
                            <c:if test="${cliente.estado != null}">
                                <div class="team-social">
                                    <a class="social-in" href="ServletGeneral?menu=carrito&accion=agregar&id=<%= servicio.getIdservicio()%>"><i class="fa fa-calendar"></i>&nbsp;&nbsp;&nbsp;Agregar a cita</a>
                                    <a class="social-in" href="ServletGeneral?menu=carrito&accion=comprar&id=<%= servicio.getIdservicio()%>"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Reservar ahora</a>
                                </div>
                            </c:if>  
                        </div>
                    </div>                                   
                    <%      }
                        }
                    %>

                </div>
            </div>
        </div>
        <!-- Team End -->

        <!-- Carousel Start -->
        <div id="carousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel" data-slide-to="0" class="active"></li>
                <li data-target="#carousel" data-slide-to="1"></li>
                <li data-target="#carousel" data-slide-to="2"></li>
                <li data-target="#carousel" data-slide-to="3"></li>
                <li data-target="#carousel" data-slide-to="4"></li>
                <li data-target="#carousel" data-slide-to="5"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="src/img/masaje1.jpg" alt="Carousel Image"> 
                </div>
                <div class="carousel-item">
                    <img src="src/img/masaje2.png" alt="Carousel Image">  
                </div>
                <div class="carousel-item">
                    <img src="src/img/masaje3.jpg" alt="Carousel Image"> 
                </div>
                <div class="carousel-item">
                    <img src="src/img/masaje4.jpg" alt="Carousel Image">  
                </div>
                <div class="carousel-item">
                    <img src="src/img/choc.jpg" alt="Carousel Image"> 
                </div>
                <div class="carousel-item">
                    <img src="src/img/fango.jpg" alt="Carousel Image">
                </div>
            </div>
        </div>        
        <!-- Carousel End -->

    </body>
    <jsp:include page="includes/footer.jsp"></jsp:include>
</html>
