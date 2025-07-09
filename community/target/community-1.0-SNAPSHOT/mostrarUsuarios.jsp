<%@page import="java.util.List"%>
<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Usuario> listaUsuarios = (List<Usuario>) session.getAttribute("listaUsuarios");
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
    <title>Lista de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="Styles/admin.css">
</head>

<%@include file="common/sidebar.jsp" %>
<%@include file="common/header.jsp" %>

<body>
<div class="main-content">
    <div class="card shadow mt-4 mx-3">
        <div class="card-header">
            <h3 class="mb-0 - texto-blanco" >Usuarios Registrados</h3>
        </div>
                <div class="card-body">
                 <% if (listaUsuarios != null && !listaUsuarios.isEmpty()) { %>
                 <div style="text-align: left;">
            <form action="SvExportarExcel" method="GET" style="display: inline-block;">
                <button type="submit" class="btn btn-success mb-3">
                  <i class="fas fa-file-excel"></i> Exportar a Excel
                </button>
            </form>
        </div>

            <div class="table-responsive">
                    <table class="table-custom">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre Completo</th>
                                <th>Correo</th>
                                <th>Celular</th>
                                <th>Documento</th>
                                <th>Fecha Nacimiento</th>
                                <th>Rol</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% for (Usuario usu : listaUsuarios) { %>
                            <tr>
                                <td><%= usu.getIdUsuario() %></td>
                                <td><%= usu.getPrimerNombre() + " " + 
                                         (usu.getSegundoNombre() != null ? usu.getSegundoNombre() + " " : "") + 
                                         usu.getPrimerApellido() + " " + 
                                         (usu.getSegundoApellido() != null ? usu.getSegundoApellido() : "") %></td>
                                <td><%= usu.getCorreoElectronico() %></td>
                                <td><%= usu.getNumeroCelular() %></td>
                                <td><%= usu.getTipoDocumento() + " " + usu.getNumDocumento() %></td>
                                <td><%= usu.getFechaNacimiento() %></td>
                                <td><%= usu.getRol().toString().toUpperCase() %></td>
                                <td class="<%= usu.getRol().toString().equalsIgnoreCase("inactivo") ? "estado-inactivo" : "estado-activo" %>">
                                    <%= usu.getRol().toString().equalsIgnoreCase("inactivo") ? "Inactivo" : "Activo" %>
                                </td>
                                <td>
                                    <div class="d-flex gap-2">
                                        <form action="SvEditar" method="GET">
                                            <input type="hidden" name="idUsuarioEdit" value="<%= usu.getIdUsuario() %>">
                                            <button type="submit" class="btn btn-sm btn-warning">Editar</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            <% } else { %>
                <p class="text-muted">No hay usuarios registrados.</p>
            <% } %>
        </div>
    </div>
</div>

<%@include file="common/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>