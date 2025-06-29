<%@ page import="java.util.*, logica.Usuario, logica.Controladora" %>
<%@page import="logica.Actividad"%>
<%@page import="java.util.List"%>
<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Controladora control = new Controladora();
    List<Usuario> usuarios = control.traerUsuarios();
    
    int totalUsuarios = usuarios.size();
    int admins = 0, arrendatarios = 0, guardias = 0;

    for (Usuario u : usuarios) {
        if (u.getRol() == Usuario.Rol.administrador) admins++;
        else if (u.getRol() == Usuario.Rol.arrendatario) arrendatarios++;
        else if (u.getRol() == Usuario.Rol.guardia) guardias++;
    }

    int totalAptos = control.traerApartamentos().size();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Estadísticas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
     <link rel="stylesheet" href="Styles/admin.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        .card {
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
        }
    </style>
</head>
<body>
<%@ include file="common/sidebar.jsp" %>
<%@ include file="common/header.jsp" %>

<div class="main-content">
    <h2 class="mb-4">Estadísticas Generales</h2>

    <div class="row g-4">
        <div class="col-md-4">
            <div class="card text-white bg-primary">
                <div class="card-body">
                    <h5 class="card-title">Usuarios Registrados</h5>
                    <p class="card-text fs-3"><%= totalUsuarios %></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-success">
                <div class="card-body">
                    <h5 class="card-title">Apartamentos Registrados</h5>
                    <p class="card-text fs-3"><%= totalAptos %></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-dark">
                <div class="card-body">
                    <h5 class="card-title">Usuarios por Rol</h5>
                    <p class="card-text">
                        <i class="fas fa-user-shield"></i> Admins: <%= admins %><br>
                        <i class="fas fa-user-tag"></i> Arrendatarios: <%= arrendatarios %><br>
                        <i class="fas fa-user-lock"></i> Guardias: <%= guardias %>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
