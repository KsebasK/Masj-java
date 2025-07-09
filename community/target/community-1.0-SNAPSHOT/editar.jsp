<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Usuario"%>
<%
    Usuario usuEditar = (Usuario) session.getAttribute("usuEditar");
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
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Usuario</title>
    <link rel="stylesheet" href="Styles/admin.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .form-container {
            max-width: 900px;
            margin: auto;
            background: #fff;
            color: #333;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
            color: #2c2c2c;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 600;
            margin-bottom: 5px;
        }

        input, select {
            padding: 10px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .full-width {
            grid-column: 1 / 3;
        }

        button {
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .volver {
            text-align: center;
            margin-top: 25px;
        }

        .volver a {
            color: #007bff;
            text-decoration: none;
        }

        .volver a:hover {
            text-decoration: underline;
        }

        @media screen and (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: 1 / 2;
            }
        }
    </style>
</head>
<body>
<%@include file="common/sidebar.jsp" %>
<%@include file="common/header.jsp" %>

<div class="main-content">
    <div class="content">
        <div class="form-container">
            <h2>Editar Información del Usuario</h2>
            <form action="SvEditar" method="POST">
                <input type="hidden" name="idUsuario" value="<%= usuEditar.getIdUsuario() %>">

                <div class="form-grid">
                    <div class="form-group">
                        <label>Primer Nombre:</label>
                        <input type="text" name="primerNombre" value="<%= usuEditar.getPrimerNombre() %>" required>
                    </div>

                    <div class="form-group">
                        <label>Segundo Nombre:</label>
                        <input type="text" name="segundoNombre" value="<%= usuEditar.getSegundoNombre() != null ? usuEditar.getSegundoNombre() : "" %>">
                    </div>

                    <div class="form-group">
                        <label>Primer Apellido:</label>
                        <input type="text" name="primerApellido" value="<%= usuEditar.getPrimerApellido() %>" required>
                    </div>

                    <div class="form-group">
                        <label>Segundo Apellido:</label>
                        <input type="text" name="segundoApellido" value="<%= usuEditar.getSegundoApellido() != null ? usuEditar.getSegundoApellido() : "" %>">
                    </div>

                    <div class="form-group">
                        <label>Celular:</label>
                        <input type="text" name="numeroCelular" value="<%= usuEditar.getNumeroCelular() %>" required>
                    </div>

                    <div class="form-group">
                        <label>Correo Electrónico:</label>
                        <input type="email" name="correoElectronico" value="<%= usuEditar.getCorreoElectronico() %>" required>
                    </div>

                    <div class="form-group">
                        <label>Tipo de Documento:</label>
                        <select name="tipoDocumento" required>
                            <option disabled value="">Seleccione un tipo</option>
                            <option value="CC" <%= "CC".equals(usuEditar.getTipoDocumento()) ? "selected" : "" %>>Cédula de Ciudadanía</option>
                            <option value="TI" <%= "TI".equals(usuEditar.getTipoDocumento()) ? "selected" : "" %>>Tarjeta de Identidad</option>
                            <option value="CE" <%= "CE".equals(usuEditar.getTipoDocumento()) ? "selected" : "" %>>Cédula de Extranjería</option>
                            <option value="Pasaporte" <%= "Pasaporte".equals(usuEditar.getTipoDocumento()) ? "selected" : "" %>>Pasaporte</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Número de Documento:</label>
                        <input type="text" name="numDocumento" value="<%= usuEditar.getNumDocumento() %>" required>
                    </div>

                    <div class="form-group">
                        <label>Fecha de Nacimiento:</label>
                        <input type="date" name="fechaNacimiento"
                               value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(usuEditar.getFechaNacimiento()) %>"
                               required>
                    </div>

                    <div class="form-group">
                        <label>Rol:</label>
                        <select name="rol" required>
                            <option disabled value="">Seleccione un rol</option>
                            <option value="administrador" <%= "administrador".equals(usuEditar.getRol().toString()) ? "selected" : "" %>>Administrador</option>
                            <option value="guardia" <%= "guardia".equals(usuEditar.getRol().toString()) ? "selected" : "" %>>Guardia</option>
                            <option value="arrendatario" <%= "arrendatario".equals(usuEditar.getRol().toString()) ? "selected" : "" %>>Arrendatario</option>
                            <option value="inactivo" <%= "inactivo".equals(usuEditar.getRol().toString()) ? "selected" : "" %>>Inactivo</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Torre:</label>
                        <input type="text" name="torre" value="<%= usuEditar.getApartamento() != null ? usuEditar.getApartamento().getTorre() : "" %>">
                    </div>

                    <div class="form-group">
                        <label>Apartamento:</label>
                        <input type="text" name="apartamento" value="<%= usuEditar.getApartamento() != null ? usuEditar.getApartamento().getApto() : "" %>">
                    </div>
                </div>

                <button type="submit">Guardar Cambios</button>
            </form>

            <div class="volver">
                <a href="SvUsuario">← Volver a la lista</a>
            </div>
        </div>
    </div>
</div>

<%@include file="common/footer.jsp" %>
</body>
</html>
