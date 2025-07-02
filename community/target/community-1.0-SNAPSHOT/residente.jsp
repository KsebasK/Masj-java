<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="logica.Usuario" %>
<%
    Usuario u = (Usuario) session.getAttribute("usuario");
    if (u == null) {
        response.sendRedirect("login.jsp?error=session_expired");
        return;
    }
%>

<%@ include file="common/header.jsp" %>
<%@ include file="common/sidebarResidente.jsp" %>
<link rel="stylesheet" href="Styles/admin.css">

<div class="main-content">
    <div class="top-navbar">
        <div class="search-bar">
            <i class="fas fa-search"></i>
            <input type="text" placeholder="Buscar...">
        </div>
        <div class="user-profile">
            <img src="imagenes/usuario.png" alt="Usuario">
            <div class="user-info">
                <h4>Residente</h4>
                <small>Apartamento 101</small>
            </div>
        </div>
    </div>

    <div class="content">
        <div class="page-header">
            <h1>Bienvenido, Residente</h1>
            <ul class="breadcrumb">
                <li><a href="#">Inicio</a></li>
                <li>Dashboard</li>
            </ul>
        </div>

        <div class="cards-grid">
            <div class="card">
                <div class="card-header">
                    <span class="card-title">Visitantes</span>
                    <div class="card-icon visitors"><i class="fas fa-user-friends"></i></div>
                </div>
                <div class="card-body">
                    <h3>0</h3>
                    <p>Registrados hoy</p>
                </div>
                <div class="card-footer">Última visita hace 1h</div>
            </div>

            <div class="card">
                <div class="card-header">
                    <span class="card-title">Correspondencia</span>
                    <div class="card-icon users"><i class="fas fa-box"></i></div>
                </div>
                <div class="card-body">
                    <h3>0</h3>
                    <p>Paquete recibido</p>
                </div>
                <div class="card-footer">Sin reclamar</div>
            </div>

            <div class="card">
                <div class="card-header">
                    <span class="card-title">Zonas comunes</span>
                    <div class="card-icon apartments"><i class="fas fa-swimming-pool"></i></div>
                </div>
                <div class="card-body">
                    <h3>0</h3>
                    <p>Esta semana</p>
                </div>
                <div class="card-footer">Piscina y BBQ</div>
            </div>

            <div class="card">
                <div class="card-header">
                    <span class="card-title">Pagos</span>
                    <div class="card-icon vehicles"><i class="fas fa-money-bill-wave"></i></div>
                </div>
                <div class="card-body">
                    <h3>2</h3>
                    <p>Cuota actual</p>
                </div>
                <div class="card-footer">Vence en 3 días</div>
            </div>
        </div>
    </div>
</div>

<%@ include file="common/footer.jsp" %>
