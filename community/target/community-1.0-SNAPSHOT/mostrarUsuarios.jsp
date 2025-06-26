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
</head>
<body style="background-color: #f1f4f9;">

<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h3 class="mb-0">Usuarios Registrados</h3>
        </div>
        <div class="card-body">
            <% if (listaUsuarios != null && !listaUsuarios.isEmpty()) { %>
                <div class="table-responsive">
                    <table class="table table-hover table-bordered align-middle">
                        <thead class="table-light">
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
                                <td><%= usu.getRol() %></td>
                                <td><%= usu.getEstado() %></td>
                                <td>
                                    <div class="d-flex gap-2">
                                        <form action="SvEditar" method="GET">
                                            <input type="hidden" name="idUsuarioEdit" value="<%= usu.getIdUsuario() %>">
                                            <button type="submit" class="btn btn-sm btn-warning">Editar</button>
                                        </form>
                                        <form action="SvEliminar" method="POST" onsubmit="return confirm('¿Estás seguro de eliminar este usuario?');">
                                            <input type="hidden" name="idUsuario" value="<%= usu.getIdUsuario() %>">
                                            <button type="submit" class="btn btn-sm btn-danger">Eliminar</button>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
