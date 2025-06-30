<%@ page import="java.util.List" %>
<%@ page import="logica.AlquilerZonasComunesEntity" %>
<%@ include file="common/sidebarResidente.jsp" %>
<%@ include file="common/header.jsp" %>

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
                        <th>Hora Límite</th>
                        <th>Zona Común</th>
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
        <form action="SvReservarZona" method="post">
            <input type="hidden" name="idResidente" value="<%= session.getAttribute("idResidente") %>">
            <label>Zona Común:</label>
            <select name="idZonaComun" required>
                <option value="1">Salón Comunal</option>
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
    </div>
</div>
</body>
</html>
