<%@page import="java.util.List"%>
<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Usuario> listaUsuarios = (List<Usuario>) session.getAttribute("listaUsuarios");
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
    <style>
        :root {
            --sunset-yellow: #fecd1a;
            --sunset-orange: #000000;
            --sunset-red: #ff4d6d;
            --sunset-purple: #8338ec;
            --sunset-dark-purple: #2a004f;
            --white: #ffffff;
        }

        body {
            background-color: var(--sunset-dark-purple);
            font-family: 'Montserrat', sans-serif;
            color: var(--white);
        }

        .card {
            background-color: #3c096c;
            color: var(--white);
            border: none;
        }

        .card-header {
            background-color: var(--sunset-orange);
            color: var(--white);
        }

        .table-custom {
            background-color: transparent;
            color: var(--white);
        }

        .table-custom thead th {
            background-color: var(--sunset-purple);
            color: var(--white);
        }

        .table-custom tbody tr:hover {
            background-color: rgba(255, 77, 109, 0.2);
        }

        .btn-warning {
            background-color: var(--sunset-yellow);
            color: black;
            border: none;
        }

        .btn-danger {
            background-color: var(--sunset-red);
            color: white;
            border: none;
        }

        .btn:hover {
            opacity: 0.85;
        }

        .estado-activo {
            color: #28a745;
            font-weight: bold;
        }

        .estado-inactivo {
            color: #dc3545;
            font-weight: bold;
        }
    </style>
</head>

<%@include file="common/sidebar.jsp" %>
<%@include file="common/header.jsp" %>

<body>
<div class="main-content">
    <div class="card shadow mt-4 mx-3">
        <div class="card-header">
            <h3 class="mb-0">Usuarios Registrados</h3>
        </div>
        <div class="card-body">
            <% if (listaUsuarios != null && !listaUsuarios.isEmpty()) { %>
             <form action="SvExportarExcel" method="GET">
                <button type="submit" class="btn btn-success mb-3">
                    <i class="fas fa-file-excel"></i> Exportar a Excel
                </button>
            </form>
            <div class="table-responsive">
                    <table class="table table-hover table-bordered align-middle table-custom">
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
                                        <form action="SvEliminar" method="POST" onsubmit="return confirm('¿Estás seguro de eliminar este usuario?');">
                                            <input type="hidden" name="idUsuario" value="<%= usu.getIdUsuario() %>">
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
