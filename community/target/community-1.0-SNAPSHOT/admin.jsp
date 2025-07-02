z<%@page import="logica.Actividad"%>
<%@page import="java.util.List"%>
<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administrador - MASJ</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="Styles/admin.css">
</head>
<body>
<%@include file="common/sidebar.jsp" %>
<%@include file="common/header.jsp" %>

<div class="main-content">
    <div class="content">
       <%
        Usuario u = (Usuario) session.getAttribute("usuario");
        if (u == null) {
            response.sendRedirect("login.jsp?error=session_expired");
            return;
        }
        String nombreCompleto = u.getPrimerNombre() + " " + u.getPrimerApellido();
        %>
        <h1>Bienvenido, Administrador <%= nombreCompleto %> </h1>

        <!-- Estadísticas -->
        <div class="cards-grid">
            <div class="card">
                <h3>Usuarios Registrados</h3>
                <p><%= request.getAttribute("totalUsuarios") != null ? request.getAttribute("totalUsuarios") : "0" %></p>
            </div>
            <div class="card">
                <h3>Apartamentos</h3>
                <p><%= request.getAttribute("totalApartamentos") != null ? request.getAttribute("totalApartamentos") : "0" %></p>
            </div>
            <div class="card">
                <h3>Vehículos</h3>
                <p><%= request.getAttribute("totalVehiculos") != null ? request.getAttribute("totalVehiculos") : "0" %></p>
            </div>
            <div class="card">
                <h3>Visitantes Hoy</h3>
                <p><%= request.getAttribute("visitantesHoy") != null ? request.getAttribute("visitantesHoy") : "0" %></p>
            </div>
        </div>

        <!-- Tabla actividad reciente -->
        <div class="card">
            <h2>Actividad Reciente</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tipo</th>
                        <th>Descripción</th>
                        <th>Fecha</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    List<Actividad> lista = (List<Actividad>) request.getAttribute("actividadReciente");
                    if (lista != null && !lista.isEmpty()) {
                        for (Actividad act : lista) {
                %>
                    <tr>
                        <td>#<%= act.getId() %></td>
                        <td><%= act.getTipo() != null ? act.getTipo() : "" %></td>
                        <td><%= act.getDescripcion() != null ? act.getDescripcion() : "" %></td>
                        <td><%= act.getFecha() != null ? new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm").format(act.getFecha()) : "" %></td>
                        <td>
                            <% if (act.getEstado() != null) { 
                                if ("COMPLETADO".equals(act.getEstado())) { %>
                                    <span class="badge badge-success">COMPLETADO</span>
                                <% } else if ("PENDIENTE".equals(act.getEstado())) { %>
                                    <span class="badge badge-warning">PENDIENTE</span>
                                <% } else { %>
                                    <span class="badge badge-danger"><%= act.getEstado() %></span>
                                <% } 
                            } else { %>
                                <span class="badge badge-secondary">SIN ESTADO</span>
                            <% } %>
                        </td>
                        <td><a href="admin/detalle-actividad?id=<%= act.getId() %>" class="btn">Ver</a></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="6" class="text-center">No hay actividad reciente</td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@include file="common/footer.jsp" %>
<script src="js/admin.js"></script>
</body>
</html>