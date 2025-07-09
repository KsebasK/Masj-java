<%@page import="java.util.List"%>
<%@page import="logica.Usuario"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Controladora control = new Controladora();
    List<Usuario> usuarios = control.traerUsuarios();
    
    int totalUsuarios = usuarios.size();
    int admins = 0, arrendatarios = 0, guardias = 0, inactivos = 0;

    for (Usuario u : usuarios) {
        if (u.getRol() == Usuario.Rol.administrador) admins++;
        else if (u.getRol() == Usuario.Rol.arrendatario) arrendatarios++;
        else if (u.getRol() == Usuario.Rol.guardia) guardias++;
        else if (u.getRol() == Usuario.Rol.inactivo) inactivos++;
    }
%>
<%
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Estadísticas - Sistema Residencial</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="Styles/admin.css">
    <style>
        :root {
            --primary-color: #4a148c;
            --secondary-color: #7b1fa2;
            --accent-color: #e91e63;
            --dark-color: #1a237e;
            --light-color: #f3e5f5;
        }
        
        .stat-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transition: all 0.3s;
            margin-bottom: 20px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            overflow: hidden;
            position: relative;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }
        
        .stat-card .card-body {
            padding: 25px;
            position: relative;
            z-index: 2;
        }
        
        .stat-card .card-icon {
            position: absolute;
            right: 20px;
            top: 20px;
            font-size: 50px;
            opacity: 0.2;
            color: white;
            z-index: 1;
        }
        
        .stat-card .card-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 10px;
            color: rgba(255,255,255,0.9);
        }
        
        .stat-card .card-value {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .chart-container {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }
        
        .section-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 25px;
            color: var(--primary-color);
            position: relative;
            padding-bottom: 10px;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 3px;
            background: var(--accent-color);
            border-radius: 3px;
        }
        
        .stat-detail {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 15px;
            margin-bottom: 8px;
            border-radius: 6px;
            background-color: #f8f9fa;
        }
        
        .stat-label {
            display: flex;
            align-items: center;
            font-size: 14px;
            font-weight: 500;
        }
        
        .stat-label i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .stat-value {
            font-weight: 600;
        }
        
        .text-primary { color: var(--primary-color) !important; }
        .text-success { color: #28a745 !important; }
        .text-warning { color: #ffc107 !important; }
        .text-danger { color: #dc3545 !important; }
        
        .main-content {
            padding: 30px;
            margin-left: 280px;
            transition: all 0.3s;
        }
        
        @media (max-width: 992px) {
            .main-content {
                margin-left: 0;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<%@ include file="common/sidebar.jsp" %>
<%@ include file="common/header.jsp" %>

<div class="main-content">
    <h2 class="section-title">Estadísticas Generales</h2>

    <div class="row">
        <!-- Tarjeta de Total Usuarios -->
        <div class="col-md-4">
            <div class="stat-card">
                <div class="card-body">
                    <i class="fas fa-users card-icon"></i>
                    <h5 class="card-title">USUARIOS REGISTRADOS</h5>
                    <div class="card-value"><%= totalUsuarios %></div>
                </div>
            </div>
        </div>
        
        <!-- Tarjeta de Usuarios Activos -->
        <div class="col-md-4">
            <div class="stat-card" style="background: linear-gradient(135deg, #28a745, #218838);">
                <div class="card-body">
                    <i class="fas fa-user-check card-icon"></i>
                    <h5 class="card-title">USUARIOS ACTIVOS</h5>
                    <div class="card-value"><%= totalUsuarios - inactivos %></div>
                </div>
            </div>
        </div>
        
        <!-- Tarjeta de Usuarios Inactivos -->
        <div class="col-md-4">
            <div class="stat-card" style="background: linear-gradient(135deg, #dc3545, #c82333);">
                <div class="card-body">
                    <i class="fas fa-user-slash card-icon"></i>
                    <h5 class="card-title">USUARIOS INACTIVOS</h5>
                    <div class="card-value"><%= inactivos %></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Distribución de Roles -->
    <div class="chart-container">
        <h5 class="mb-4 text-black">Distribución de Usuarios por Rol</h5>
        <div class="row">
            <div class="col-md-6">
                <div class="stat-detail">
                    <span class="stat-label text-primary"><i class="fas fa-user-shield"></i> Administradores</span>
                    <span class="stat-value text-black"><%= admins %></span>
                </div>
            </div>
            <div class="col-md-6">
                <div class="stat-detail">
                    <span class="stat-label text-success"><i class="fas fa-user-tag"></i> Arrendatarios</span>
                    <span class="stat-value text-black"><%= arrendatarios %></span>
                </div>
            </div>
            <div class="col-md-6">
                <div class="stat-detail">
                    <span class="stat-label text-warning"><i class="fas fa-user-lock"></i> Guardias</span>
                    <span class="stat-value text-black"><%= guardias %></span>
                </div>
            </div>
            <div class="col-md-6">
                <div class="stat-detail">
                    <span class="stat-label text-danger"><i class="fas fa-user-clock"></i> Inactivos</span>
                    <span class="stat-value text-black"><%= inactivos %></span>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="common/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>