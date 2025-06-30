<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Usuario"%>
<%
    Usuario usuEditar = (Usuario) session.getAttribute("usuEditar");
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="Styles/admin.css">
    <meta charset="UTF-8">
    <title>Editar Usuario</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f3f6f9;
            padding: 40px;
        }
        form {
            max-width: 700px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.08);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #444;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }
        button {
            width: 100%;
            padding: 12px;
            margin-top: 25px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .volver {
            text-align: center;
            margin-top: 20px;
        }
        .volver a {
            color: #007bff;
            text-decoration: none;
        }
        .volver a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@include file="common/sidebar.jsp" %>
<%@include file="common/header.jsp" %>
<div class="main-content">
    <div class="content">
<h2>Editar Información del Usuario</h2>

<form action="SvEditar" method="POST">

    <input type="hidden" name="idUsuario" value="<%= usuEditar.getIdUsuario() %>">

    <label>Primer Nombre:</label>
    <input type="text" name="primerNombre" value="<%= usuEditar.getPrimerNombre() %>" required>

    <label>Segundo Nombre:</label>
    <input type="text" name="segundoNombre" value="<%= usuEditar.getSegundoNombre() != null ? usuEditar.getSegundoNombre() : "" %>">

    <label>Primer Apellido:</label>
    <input type="text" name="primerApellido" value="<%= usuEditar.getPrimerApellido() %>" required>

    <label>Segundo Apellido:</label>
    <input type="text" name="segundoApellido" value="<%= usuEditar.getSegundoApellido() != null ? usuEditar.getSegundoApellido() : "" %>">

    <label>Celular:</label>
    <input type="text" name="numeroCelular" value="<%= usuEditar.getNumeroCelular() %>" required>

    <label>Correo Electrónico:</label>
    <input type="email" name="correoElectronico" value="<%= usuEditar.getCorreoElectronico() %>" required>

    <label>Tipo de Documento:</label>
    <select name="tipoDocumento" required>
        <option disabled selected value="">Seleccione un tipo</option>
        <option value="CC" <%= "CC".equals(usuEditar.getTipoDocumento()) ? "selected" : "" %>>Cédula de Ciudadanía</option>
        <option value="TI" <%= "TI".equals(usuEditar.getTipoDocumento()) ? "selected" : "" %>>Tarjeta de Identidad</option>
        <option value="CE" <%= "CE".equals(usuEditar.getTipoDocumento()) ? "selected" : "" %>>Cédula de Extranjería</option>
        <option value="Pasaporte" <%= "Pasaporte".equals(usuEditar.getTipoDocumento()) ? "selected" : "" %>>Pasaporte</option>
    </select>

    <label>Número de Documento:</label>
    <input type="text" name="numDocumento" value="<%= usuEditar.getNumDocumento() %>" required>

    <label>Fecha de Nacimiento:</label>
    <input type="date" name="fechaNacimiento"
           value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(usuEditar.getFechaNacimiento()) %>"
           required>

    <label>Rol:</label>
    <select name="rol" required>
        <option disabled selected value="">Seleccione un rol</option>
        <option value="administrador" <%= "administrador".equals(usuEditar.getRol()) ? "selected" : "" %>>Administrador</option>
        <option value="guardia" <%= "guardia".equals(usuEditar.getRol()) ? "selected" : "" %>>Guardia</option>
        <option value="arrendatario" <%= "arrendatario".equals(usuEditar.getRol()) ? "selected" : "" %>>Arrendatario</option>
        <option value="inactivo" <%= "inactivo".equals(usuEditar.getRol()) ? "selected" : "" %>>Inactivo</option>
    </select>

    <label>Torre:</label>
    <input type="text" name="torre" value="<%= usuEditar.getApartamento() != null ? usuEditar.getApartamento().getTorre() : "" %>" required>

    <label>Apartamento:</label>
    <input type="text" name="apartamento" value="<%= usuEditar.getApartamento() != null ? usuEditar.getApartamento().getApto() : "" %>" required>

    <button type="submit">Guardar Cambios</button>

</form>

<div class="volver">
    <a href="SvUsuario">← Volver a la lista</a>
</div>
    </div>
</div>
</body>
</html>
