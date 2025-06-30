<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<div class="contenido">
    <h2>Reservas de Zonas Comunes</h2>
    <c:if test="${empty reservas}">
        <p>No tienes reservas registradas.</p>
    </c:if>
    <c:if test="${not empty reservas}">
        <table class="tabla">
            <thead>
                <tr>
                    <th>ID Reserva</th>
                    <th>Fecha de Alquiler</th>
                    <th>Cantidad de Personas</th>
                    <th>Total Pago</th>
                    <th>Hora Límite</th>
                    <th>Zona Común</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="reserva" items="${reservas}">
                    <tr>
                        <td>${reserva.idAlquilerZonaComun}</td>
                        <td>${reserva.fechaAlquiler}</td>
                        <td>${reserva.cantidadPersonas}</td>
                        <td>${reserva.totalPago}</td>
                        <td>${reserva.horaLimite}</td>
                        <td>${reserva.zonaComun.tipoZona}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
