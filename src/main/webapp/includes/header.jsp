<%-- 
    Document   : header
    Created on : 19 may. 2023, 05:10:56
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- Template Stylesheet -->
<link rel="stylesheet" href="src/css/stylelogin.css">

<!-- Top Bar Start -->
    <div class="top-bar">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-lg-4 col-md-12">
                    <div class="logo">
                        <a href="index.jsp">
                            <c:if test="${cliente.estado == null}"> 
                                <img src="src/img/SPAUTP.png" alt="Logo">
                            </c:if>
                            <c:if test="${cliente.estado != null}"> 
                                <img src="src/img/SPAUTP-3.jpg" alt="Logo">
                            </c:if>
                        </a>
                    </div>
                </div>

                <div class="col-lg-8 col-md-7 d-none d-lg-block">
                    <div class="row">
                        <div class="col-4">
                            <div class="top-bar-item">
                                <h3><i class="fa fa-phone-alt"></i></h3>
                                <div class="top-bar-text">
                                    <h3>Contactenos:</h3>
                                    <p>+51 123456789</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="top-bar-item">
                                <h3><i class="fa fa-envelope"></i></h3>
                                <div class="top-bar-text">
                                    <h3>Escríbenos a:</h3>
                                    <p>spautp@gmail.com</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="top-bar-item">
                            <c:if test="${cliente.estado == null}"> 
                                <a href="login.jsp">Iniciar sesion ►</a>
                            </c:if>
                            <c:if test="${cliente.estado != null}"> 
                                <h3><i class="fa fa-map-marked-alt"></i></h3>
                                <div class="top-bar-text">
                                    <h3>Ubicanos:</h3>
                                    <p>Av. Ejecito N° # Cayma</p>
                                </div>
                            </c:if>   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>                
<!-- Top Bar End -->

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
