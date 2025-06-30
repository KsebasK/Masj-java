<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Residente"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Apartamentos y Propietario</title>
    <link rel="stylesheet" href="Styles/admin.css">
<style>
    .tabla-residentes {
        width: 100%;
        border-collapse: collapse;
        background-color: #111 !important;
        border-radius: 8px;
        overflow: hidden;
    }

    .tabla-residentes thead {
        background-color: #1c1c1c !important;
    }

    .tabla-residentes th {
        color: #f1c40f !important; /* Amarillo */
        padding: 12px;
        text-align: left;
        font-size: 14px;
        border-bottom: 1px solid #444;
    }

    .tabla-residentes td {
        color: white !important;
        padding: 12px;
        border-bottom: 1px solid #333;
    }

    .tabla-residentes tr:hover {
        background-color: #222 !important;
    }

    h2 {
        color: white !important;
        margin-bottom: 20px;
    }
</style>

</head>
<body>
<%@include file="common/sidebar.jsp" %>
<%@include file="common/header.jsp" %>

<div class="main-content">
    <div class="content">
        <h2>Apartamentos y Propietario</h2>

        <table class="tabla-residentes">

            <thead>
                <tr>
                    <th>ID Residente</th>
                    <th>Nombre Completo</th>
                    <th>Torre</th>
                    <th>Apartamento</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Residente> lista = (List<Residente>) session.getAttribute("listaResidentes");
                    if (lista != null && !lista.isEmpty()) {
                        for (Residente r : lista) {
                            String nombre = r.getUsuario().getPrimerNombre() + " " + r.getUsuario().getPrimerApellido();
                            String torre = r.getApartamento().getTorre();
                            String apto = r.getApartamento().getApto();
                %>
                <tr>
                    <td><%= r.getIdResidente() %></td>
                    <td><%= nombre %></td>
                    <td><%= torre %></td>
                    <td><%= apto %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4" style="text-align: center;">No hay residentes registrados</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
