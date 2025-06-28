<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Usuario"%>
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

        form {
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
    </style>
</head>
<body>
    <<link rel="stylesheet" href="Styles/admin.css">
    <%@include file="common/sidebarGuardia.jsp" %>
    <%@include file="common/header.jsp" %>
    <h2>Registrar Nuevo Visitante</h2>

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

        <label for="idResidente">ID del Residente:</label>
        <input type="number" id="idResidente" name="idResidente" required>

        <label for="idGuardia">ID del Guardia:</label>
        <input type="number" id="idGuardia" name="idGuardia" required>

        <label for="idApartamento">ID del Apartamento:</label>
        <input type="number" id="idApartamento" name="idApartamento" required>

        <button type="submit">Registrar Visitante</button>
    </form>

</body>
</html>