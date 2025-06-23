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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            padding: 2rem;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        h1 {
            color: #333;
        }
        .acciones {
            display: flex;
            gap: 6px;
        }
        .acciones form {
            display: inline;
        }
        .acciones button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .acciones .editar {
            background-color: #ffc107;
            color: white;
        }
        .acciones .eliminar {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>

<h1>Usuarios Registrados</h1>

<% if (listaUsuarios != null && !listaUsuarios.isEmpty()) { %>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre Completo</th>
                <th>Correo</th>
                <th>Celular</th>
                <th>Documento</th>
                <th>Conjunto</th>
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
                <td><%= usu.getConjuntoNombre() %></td>
                <td><%= usu.getFechaNacimiento() %></td>
                <td><%= usu.getRol() %></td>
                <td><%= usu.getEstado() %></td>
                <td class="acciones">
                    <!-- Botón Editar -->
                    <form action="SvEditar" method="GET">
                        <input type="hidden" name="idUsuarioEdit" value="<%= usu.getIdUsuario() %>">
                        <button type="submit" class="editar">Editar</button>
                    </form>

                    <!-- Botón Eliminar -->
                    <form action="SvEliminar" method="POST" onsubmit="return confirm('¿Estás seguro de eliminar este usuario?');">
                        <input type="hidden" name="idUsuario" value="<%= usu.getIdUsuario() %>">
                        <button type="submit" class="eliminar">Eliminar</button>
                    </form>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
<% } else { %>
    <p>No hay usuarios registrados.</p>
<% } %>

</body>
</html>
