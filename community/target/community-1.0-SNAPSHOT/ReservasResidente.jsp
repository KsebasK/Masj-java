<%@ page import="java.util.List" %>
<%@ page import="logica.AlquilerZonasComunesEntity" %>
<%@ include file="common/sidebarResidente.jsp" %>
<%@ include file="common/header.jsp" %> <!-- aqu� ya no hay contentType duplicado -->
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
    <link rel="stylesheet" href="Styles/admin.css">
</head>
<body>
<div class="main-content">
    <div class="content">
        <h2>Reservas de Zonas Comunes</h2>

        <%
            List<AlquilerZonasComunesEntity> reservas = (List<AlquilerZonasComunesEntity>) request.getAttribute("reservas");
            if (reservas == null || reservas.isEmpty()) {
        %>
            <p>No tienes reservas registradas.</p>
        <% } else { %>
            <table class="table-custom">
                <thead>
                    <tr>
                        <th>ID Reserva</th>
                        <th>Fecha de Alquiler</th>
                        <th>Cantidad de Personas</th>
                        <th>Total Pago</th>
                        <th>Hora L�mite</th>
                        <th>Zona Com�n</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (AlquilerZonasComunesEntity reserva : reservas) { %>
                        <tr>
                            <td><%= reserva.getIdAlquilerZonaComun() %></td>
                            <td><%= reserva.getFechaAlquiler() %></td>
                            <td><%= reserva.getCantidadPersonas() %></td>
                            <td><%= reserva.getTotalPago() %></td>
                            <td><%= reserva.getHoraLimite() %></td>
                            <td><%= reserva.getZonaComun().getTipoZona() %></td>
                            <td><%= reserva.getEstado() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>

        <h2>Hacer una nueva reserva</h2>

        <%
            logica.Usuario usuario = (logica.Usuario) session.getAttribute("usuario");
            if (usuario== null) {
        %>
            <p style="color:red;">ERROR: No se ha iniciado sesi�n como arrendatario.</p>
        <%
            } else {
        %>
            <form action="SvReservarZona" method="post">
                <input type="hidden" name="idResidente" value="<%= usuario %>">

                <label>Zona Com�n:</label>
                <select name="idZonaComun" required>
                    <option value="1">Sal�n Comunal</option>
                    <option value="2">Piscina</option>
                    <option value="3">BBQ</option>
                </select><br><br>

                <label>Fecha:</label>
                <input type="date" name="fecha" required><br><br>

                <label>Hora:</label>
                <input type="time" name="hora" required><br><br>

                <label>Cantidad de Personas:</label>
                <input type="number" name="cantidadPersonas" min="1" required><br><br>

                <label>Total Pago:</label>
                <input type="number" name="totalPago" min="0" required><br><br>

                <button type="submit" class="btn btn-primary">Reservar</button>
            </form>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
