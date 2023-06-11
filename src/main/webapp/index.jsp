<%-- 
    Document   : index
    Created on : 10 jun. 2023, 10:27:23
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.utp.entidad.Servicio"%>
<%@page import="com.utp.modelo.ServicioDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SPAUTP</title>
    </head>
    <jsp:include page="header.jsp"></jsp:include>
    <body>        
    <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>¡BIENVENIDO!</h2>
                        <h3>${cliente.getNombres()}</h3>
                    </div>
                </div>
            </div>
        </div>
    <!-- Page Header End -->
    
    <!-- Carrousel Nav Bar Start -->
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
                            <li class="nav-item nav-link active" style="float:left;"><a class="btn animated fadeInUp" href="Vistas/atencion.jsp" class="nav-item nav-link">Consulte aqui</a></li>
                        </ul>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="src/img/choc0.jpg" alt="Carousel Image">
                    <div class="carousel-caption">
                        <h1 class="animated fadeInLeft">Inhala la tranquilidad, exhala los problemas.</h1>
                        <p class="animated fadeInRight">Reserva tu cita</p>
                        <ul style="list-style-type:none;">
                            <li class="nav-item nav-link active" style="float:left;"><a class="btn animated fadeInUp" href="Vistas/atencion.jsp" class="nav-item nav-link">Consulte aqui</a></li>
                        </ul>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="src/img/masaje1.jpg"alt="Carousel Image">
                    <div class="carousel-caption">
                        <h1 class="animated fadeInLeft">Saca a relucir tu belleza interna</h1>
                        <p class="animated fadeInRight">Reserva tu cita</p>
                        <ul style="list-style-type:none;">
                            <li class="nav-item nav-link active" style="float:left;"><a class="btn animated fadeInUp" href="Vistas/atencion.jsp" class="nav-item nav-link">Consulte aqui</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>            
    <!-- Carrousel Nav Bar End -->
    
    <!-- Team Start (Team Teacher of Student)-->
        <div class="team">
            <div class="container">
                <div class="row">
                <%  ServicioDAO serdao = new ServicioDAO();
                    List<Servicio> listser = serdao.listar();  
                    if(listser != null) 
                    {
                        for(Servicio servicio :listser)
                        {
                 %>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                        <div class="team-item">
                            <div class="team-img">
                                <img src="src/img/<%= servicio.getImagen()%>" alt="Team Image" width="150" height="250">
                            </div>
                            <div class="team-text">
                                <h2><%= servicio.getNomserv() %></h2>
                                <p>Tiempo : <%= servicio.getDuracion()%>oras</p>
                                <p>Precio: S/ <%= servicio.getPrecio()%></p>
                            </div> 
                            <div class="team-social">
                                <a class="social-in" href="#"><i class="fa fa-phone-alt"><%= servicio.getTurno()%></i></a>
                            </div>
                        </div>
                    </div>                                   
                <%      }
                    }
                %>

                </div>
            </div>
        </div>
    <!-- Team End -->
    
    <!-- Nav Bar Start -->            
        <div class="nav-bar">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-lg bg-dark navbar-dark">
                    <a href="#" class="navbar-brand">MENU</a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <ul style="list-style-type:none;">
                            <li class="nav-item nav-link active" style="float:left;"><h2>Tus servicios seleccionados ?</h2></li>
                            <li class="nav-item nav-link active" style="float:left;"><a class="btn animated fadeInUp" href="Vistas/cita.jsp" class="nav-item nav-link">Lista de Servicios</a></li>
                            <li class="nav-item nav-link active" style="float:left;"><a class="btn animated fadeInUp" href="Vistas/servicios.jsp" class="nav-item nav-link">Servicios</a></li>
                            <li class="nav-item nav-link active" style="float:left;"><a class="btn animated fadeInUp" href="Vistas/descripcion.jsp" class="nav-item nav-link">Información</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div> 
    <!-- Nav Bar End -->
    
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
    <jsp:include page="footer.jsp"></jsp:include>
</html>
