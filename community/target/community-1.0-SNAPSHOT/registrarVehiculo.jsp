<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <title>Registrar Vehículo</title>
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
    
    <h2>Registrar Vehículo</h2>

    <div class="form-container">
        <form action="SvRegistrarVehiculo" method="post">
            <label>Placa:</label>
            <input type="text" name="placa" required>
            <label>Marca:</label>
            <input type="text" name="marca" required>
            <label>Modelo:</label>
            <input type="text" name="modelo" required>
            <label>Tipo de persona:</label>
            <select name="tipoPersona" required>
                <option value="residente">Residente</option>
                <option value="visitante">Visitante</option>
            </select>
            <label>ID de la persona:</label>
            <input type="number" name="idPersona" required>
            <label>ID del guardia:</label>
            <input type="number" name="idGuardia" required>
            <button type="submit">Registrar Vehículo</button>
        </form>

        <%-- Mostrar mensajes de éxito o error --%>
        <%
            String exito = (String) request.getAttribute("exito");
            String error = (String) request.getAttribute("error");
            if (exito != null) {
        %>
            <div class="exito"><%= exito %></div>
        <% } else if (error != null) { %>
            <div class="error"><%= error %></div>
        <% } %>
    </div>
     </div>
     </div>
</body>
</html>
