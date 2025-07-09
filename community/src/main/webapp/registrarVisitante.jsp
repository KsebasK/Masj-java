<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Usuario"%>
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
    <title>Registrar Visitante</title>
    <style>
        body {
            background-color: #1e1e2f;
            color: #fff;
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .form-container {
            background-color: #2e2e3e;
            padding: 20px;
            border-radius: 12px;
            width: 400px;
            margin: 0 auto;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.4);
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            border: none;
            border-radius: 6px;
            margin-top: 5px;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #6a5acd;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #7b68ee;
        }

        .error {
            color: #ff6b6b;
            text-align: center;
            margin-top: 10px;
        }

        .exito {
            color: #4CAF50;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <link rel="stylesheet" href="Styles/admin.css">
    <%@include file="common/sidebarGuardia.jsp" %>
    <%@include file="common/header.jsp" %>
    
    <div class="main-content">
    <div class="content">

    <h2>Registrar Nuevo Visitante</h2>

    <div class="form-container">

        <%-- Mostrar mensaje de error si existe --%>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <%-- Mostrar mensaje de éxito si existe --%>
        <% if (request.getAttribute("exito") != null) { %>
            <div class="exito"><%= request.getAttribute("exito") %></div>
        <% } %>

        <form action="SvRegistrarVisitante" method="post">
            <label for="nombres">Nombres:</label>
            <input type="text" id="nombres" name="nombres" required>

            <label for="apellidos">Apellidos:</label>
            <input type="text" id="apellidos" name="apellidos" required>

            <label for="tipoDoc">Tipo de Documento:</label>
            <select id="tipoDoc" name="tipoDoc" required>
                <option value="">Seleccione...</option>
                <option value="CC">Cédula de Ciudadanía</option>
                <option value="TI">Tarjeta de Identidad</option>
                <option value="CE">Cédula de Extranjería</option>
            </select>

            <label for="numDoc">Número de Documento:</label>
            <input type="number" id="numDoc" name="numDoc" required>

            <label for="torre">Torre:</label>
            <input type="text" id="torre" name="torre" required>

            <label for="numeroApto">Número de Apartamento:</label>
            <input type="text" id="numeroApto" name="numeroApto" required>

            <label for="idGuardia">ID del Guardia:</label>
            <input type="number" id="idGuardia" name="idGuardia" required>

            <button type="submit">Registrar Visitante</button>
        </form>
    </div>
         </div>
         </div>
</body>
</html>
