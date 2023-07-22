<%-- 
    Document   : footer
    Created on : 19 may. 2023, 05:11:21
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Favicon -->
<link href="src/img/favicon.ico" rel="icon">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<!-- CSS Libraries -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="src/lib/flaticon/font/flaticon.css" rel="stylesheet"> 
<link href="src/lib/animate/animate.min.css" rel="stylesheet">
<link href="src/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="src/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<link href="src/lib/slick/slick.css" rel="stylesheet">
<link href="src/lib/slick/slick-theme.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="src/css/style.css" rel="stylesheet">
<c:if test="${codpago == 0}">
<!-- Footer Start -->
    <div class="footer wow fadeIn" data-wow-delay="0.3s">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-3">
                    <div class="footer-contact">
                        <h2>Información Básica</h2>
                        <p><i class="fa fa-map-marker-alt"></i>Av. Ejecito N° 1200 Cayma</p>
                        <p><i class="fa fa-phone-alt"></i>+51 123456789</p>
                        <p><i class="fa fa-envelope"></i>spautp@gmail.com</p>
                        <div class="footer-social">
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-youtube"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="footer-link">
                        <h2>Información Adicional</h2>
                        <a href="../Vistas/info.jsp">Sobre Nosotros</a>
                        <a href="../Vistas/descripcion.jsp">Empleados</a>
                        <a href="../Vistas/servicios.jsp">Servicios</a>
                        <a href="../Vistas/atencion.jsp">Atención</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="footer-link">
                        <h2>Privacidad</h2>
                        <a href="#">Políticas de privacidad</a>
                        <a href="#">Portal de transparencia</a>
                        <a href="#">Términos y condiciones</a>
                        <a href="#">Libro de Reclamaciones</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="newsletter">
                        <h2>Para Registrarse</h2>
                        <p>
                            Te invitamos a conocer más acerca de nosotros, Regístrate.
                        </p>
                        <div class="form">
                            <a href="login.jsp"><button class="btn">Regístrate</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container footer-menu">
            <div class="f-menu">
                <a href="../Vistas/servicios.jsp">Servicios</a>
                <a href="../Vistas/descripcion.jsp">Encargados</a>
                <a href="../Vistas/descripcion.jsp">Tecnicos</a>
                <a href="../Vistas/atencion.jsp">Contactos</a>
            </div>
        </div>
 </c:if>   
        <div class="container copyright">
            <div class="row">
                <div class="col-md-6">
                    <p>&copy; <a href="#">SPA UTP</a>, Centro de tratamientos de belleza</p>
                </div>
            </div>
        </div>
    </div>
<!-- Footer End -->
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i>a</a>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="src/lib/easing/easing.min.js"></script>
<script src="src/lib/wow/wow.min.js"></script>
<script src="src/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="src/lib/isotope/isotope.pkgd.min.js"></script>
<script src="src/lib/lightbox/js/lightbox.min.js"></script>
<script src="src/lib/waypoints/waypoints.min.js"></script>
<script src="src/lib/counterup/counterup.min.js"></script>
<script src="src/lib/slick/slick.min.js"></script>

<!-- Template Javascript -->
<script src="src/js/main.js"></script>
<script src="src/js/scriptlog.js"></script>